#include <cstdio>
#include <cstdlib>
#include <memory>
#include <vector>
#include <utility>
#include <cstdint>
#include <iostream>
#include <fstream>
#include <cmath>
#include <sstream>
#include <chrono>

#include "geometry.h"

/*
  Example 1:  Glass and pen
  Example 2:  Whole plane
  Example 3:  4 Glasses refraction
  Example 4:  Horizontal Plane 
  Example 5:  Utah Teapod
	Example 6:	Balls

  Pattern 1:  Blurry checkerboard
  Pattern 2:  Diagonal checkerboard
  Pattern 3:  Stripled 
  Pattern 4:  Grey checkerboard
	Pattern 5:	Solid Grey Colour
*/
#define PATTERN_5
#define DEBUG
//#define DEBUG_RENDER
#define DEBUG_GEO

static const float kInfinity = std::numeric_limits<float>::max();
static const float kEpsilon = 1e-8;
static const Vec3f kDefaultBackgroundColor = Vec3f(0.235294, 0.67451, 0.843137);
template <> const Matrix44f Matrix44f::kIdentity = Matrix44f();

/* In computer graphics, clamping is the process of limiting a position to an area. Unlike wrapping, 
clamping merely moves the point to the nearest available value.
*/
inline
float clamp(const float &lo, const float &hi, const float &v)
{ return std::max(lo, std::min(hi, v)); }

inline
float deg2rad(const float &deg)
{ return deg * M_PI / 180; }

inline
Vec3f mix(const Vec3f &a, const Vec3f& b, const float &mixValue)
{ return a * (1 - mixValue) + b * mixValue; }

// Struct to contain scene options 
struct Options
{
	uint32_t width = 1920;
	uint32_t height = 1080;
	// set field of view 
	/* Below the scene is set with the attributes such as scale, image aspec ratio set in such a way
	that the rendered image resembles the pinhole camera model 

	calculated based on 90 degrees of horizontal FOV
	usual values 30-45 70 90-100
	*/
	float fov = 90;
	Vec3f backgroundColor = kDefaultBackgroundColor;
	// Set the matrix from which th the camera will come from (from 3D Viewing: the Pinhole Camera Model )
	/* Normals are a special kind of vector because they are not transformed by 4x4 affine 
	transformation matrices the same way than vectors are. They need to be transformed 
	instead by the inverse of the matrix
	*/
	Matrix44f cameraToWorld = Matrix44f(0.931056, 0, 0.364877, 0, 0.177666, 0.873446, -0.45335, 0, -0.3187, 0.48692, 0.813227, 0, -41.229214, 81.862351, 112.456908, 1);
	/* The amount by which you displace or move the point in the normal direction is left to the user and 
	can be tweaked on a scene basis. This value is often refer to in ray-tracer as shadow bias
	As you can see the bias is generally a very small value. The amount of bias required depends on 
	different factors such as the scene scale, the object curvature, the object distance to the camera, etc.
	*/
	float bias = 0.0001;
	/* The number of times a reflection ray is reflected off of surfaces is called the ray depth.\
	Though for most scenes using a depth much greater than 4 or 5 (use >5 when dealing with very complex transparent surfaces are rendered (such as water splashes) ) 
	generally doesn't make much of visual difference.
	*/
	uint32_t maxDepth = 4;
};

typedef struct lightdata_struct
{
	uint32_t lighttype;
	Vec3f colour;
	float intensity;
	Matrix44f light2world;

}lightdata_structT;

lightdata_structT *lightData = NULL;

enum MaterialType { kDiffuse, kReflection, kReflectionAndRefraction, kPhong };

class Object
{
 public:
	// Setting up the object-to-world and world-to-object matrix
	Object(const Matrix44f &o2w) : objectToWorld(o2w), worldToObject(o2w.inverse()) {}
	virtual ~Object() {}
	virtual bool intersect(const Vec3f &, const Vec3f &, float &, uint32_t &, Vec2f &) const = 0;
	virtual void getSurfaceProperties(const Vec3f &, const Vec3f &, const uint32_t &, const Vec2f &, Vec3f &, Vec2f &) const = 0;
	Matrix44f objectToWorld, worldToObject;
	const char *name;
	// Select material type
	MaterialType type = kDiffuse;
	// Index of refraction (also sometimes referred to as ior)
	float ior = 1;
	// The albedo terms defines the ratio of reflected light over the amount of incident light
	// albedo = reflect light / incident light 
	/* The reason we set the albedo default value to 0.18 is because object's from the real world 
	reflect on average around 18% of the light they receive
	*/
	Vec3f albedo = 0.18;
	// phong model diffuse weight
	float Kd = 0.8; 
	// phong model specular weight, control the size of matte lighting spot
	float Ks = 0.2; 
	// phong specular exponent, control the size of specular spot
	float n = 10;   
};

// Perform the MT Ray triangle intersecion and return u, v coordinates if intersection occurs 
bool rayTriangleIntersect(
	const Vec3f &orig, const Vec3f &dir,
	const Vec3f &v0, const Vec3f &v1, const Vec3f &v2,
	float &t, float &u, float &v)
{
	// find if the ray intersects the triangle 

	// find the triangles normal
	// E1 in equation
	Vec3f v0v1 = v1 - v0;
	// E2 in equation
	Vec3f v0v2 = v2 - v0;
	// P in the equation
	// y * v.z - z * v.y, z * v.x - x * v.z, x * v.y - y * v.x
	Vec3f pvec = dir.crossProduct(v0v2);
	// the user might want to cull (discard) back-facing triangles
	// if the triangle is front-facing the determinant is positive otherwise it is negative
	// P*E1 in the equation 
	// x * v.x + y * v.y + z * v.z
  float det = v0v1.dotProduct(pvec);

	// Deactivate CULLING in order to render back facing triangles as well
	// Useful for secondary rays can be neglected for primary rays 
#ifdef CULLING
    // if the determinant is negative the triangle is backfacing
    // if the determinant is close to 0, the ray misses the triangle
    if (det < kEpsilon) return false;
#else
    // ray and triangle are parallel if det is close to 0
    if (fabs(det) < kEpsilon) return false;
#endif

	// compute once and multiply to find u,v and t
	// 1/P*E1 in the equation 
	float invDet = 1 / det;

	// translate to the unit triangle 
	Vec3f tvec = orig - v0;
	// compute u from (T dotproduct P) * 1/P*E1
	u = tvec.dotProduct(pvec) * invDet;
	// we reject the triangle if u is either lower than 0 or greater than 1
	if (u < 0 || u > 1) return false;

	// Q in the equation 
	Vec3f qvec = tvec.crossProduct(v0v1);
	// compute v from (D dotproduct Q) * 1/P*E1 
	v = dir.dotProduct(qvec) * invDet;
	// we reject the triangle if v is either lower than 0 or greater than 1
	if (v < 0 || u + v > 1) return false;

	// compute t from (E2 dotproduct Q) * 1/P*E1 
	t = v0v2.dotProduct(qvec) * invDet;
	
	return (t > 0) ? true : false;
}

// Reads scene options from a file
void readSceneOptionDataFile (const char *file, Options *options, uint32_t *numoflight)
{
	std::ifstream ifs;
	try 
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();

			// Read width 
			uint32_t width;
			ss >> width;
#ifdef DEBUG
			std::cout << "DEBUG: Width: " << width << "\n";
#endif
			options->width = width;
			
			// Read height
			uint32_t height;
			ss >> height;
#ifdef DEBUG
			std::cout << "DEBUG: Height: " << height << "\n";
#endif
			options->height = height;
			
			// Read FOV
			float fov;
			ss >> fov;
#ifdef DEBUG
			std::cout << "DEBUG: FOV: " << fov << "\n";
#endif
			options->fov = fov;
			
			// Read background Colour
			float backgroundcolour[3];
#ifdef DEBUG
			std::cout << "DEBUG: Background Colour: ";
#endif
			for (uint32_t i=0; i < 3; i++)
				{
					ss >> backgroundcolour[i];
#ifdef DEBUG
					std::cout << backgroundcolour[i] << " "; 
#endif
				}
#ifdef DEBUG
			std::cout << "\n";
#endif
			options->backgroundColor.x = backgroundcolour[0];
			options->backgroundColor.y = backgroundcolour[1];
			options->backgroundColor.z = backgroundcolour[2];

			// Read camera to world
			float camera2world[16];
			for (uint32_t i=0; i < 16; i++)
				{
					ss >> camera2world[i];
				}
			for (uint32_t i=0; i < 4; i++)
				{
					for (uint32_t j=0; j < 4; j++)
						{
#ifdef DEBUG
							std::cout << "DEBUG: camera to world matrix [" << i << "][" << j << "] " << camera2world[(i*4)+j] << "\n";
#endif
							options->cameraToWorld.x[i][j] = camera2world[(i*4)+j];
						}
				}
			
			// Read bias
			float bias;
			ss >> bias;
#ifdef DEBUG
			std::cout << "DEBUG: Bias: " << bias << "\n";
#endif
			options->bias = bias;
			
			// Read max depth
			uint32_t maxDepth;
			ss >> maxDepth;
#ifdef DEBUG
			std::cout << "DEBUG: Max Depth: " << maxDepth << "\n";
#endif
			options->maxDepth = maxDepth;

			// Read light data 

			// Read the number of lights to the world
			uint32_t temp_lights;
			ss >> temp_lights;
#ifdef DEBUG
			std::cout << "DEBUG: Number of Light Sources: " << temp_lights << "\n";
#endif
			*numoflight = temp_lights;

			// Allocate memory for light data 
			lightData = (lightdata_structT*) malloc(temp_lights * sizeof(lightdata_structT));
			if ( lightData == NULL )
				{
					perror("Light data allocation");
					exit(EXIT_FAILURE);
				}

			float light2world[16];
			uint32_t templighttype;
			for (uint32_t k = 0; k < temp_lights; k++)
				{
					// Read light type
					ss >> templighttype;
#ifdef DEBUG
					std::cout << "DEBUG: Light Source " << k << "->Light type " << templighttype << "\n";
#endif
					lightData[k].lighttype = templighttype;
					
					// Read light colour
					float lightcolour[3];
#ifdef DEBUG
					std::cout << "DEBUG: Light Source " << k << "->Light Colour ";
#endif
					for (uint32_t i=0; i < 3; i++)
						{
							ss >> lightcolour[i];
#ifdef DEBUG
							std::cout << lightcolour[i] << " ";
#endif
						}
#ifdef DEBUG
					std::cout << "\n";
#endif
					lightData[k].colour.x = lightcolour[0];
					lightData[k].colour.y = lightcolour[1];
					lightData[k].colour.z = lightcolour[2];

					// Read light intensity
					float colourintensity;
					ss >> colourintensity;
#ifdef DEBUG
					std::cout << "DEBUG: Light Source " << k << "->Light intensity " << colourintensity << "\n";
#endif
					lightData[k].intensity = colourintensity;

					// Read light to world data from file
					for (uint32_t i=0; i < 16; i++)
						{
							ss >> light2world[i];
						}
#ifdef DEBUG
					std::cout << "DEBUG: Light Source " << k << "->Light to world " << light2world << "\n";
#endif
					// Pass light to world data to struct
					for (uint32_t i=0; i < 4; i++)
						{
							for (uint32_t j=0; j < 4; j++)
								{
#ifdef DEBUG
									std::cout << "DEBUG: Light Source " << k << "->Light to world [" << i << "][" << j << "] " << light2world[(i*4)+j] << "\n";
#endif
									lightData[k].light2world.x[i][j] = light2world[(i*4)+j];
								}
						}	
				}		
		}
	catch (const std::exception& e) 
		{
			std::cerr << e.what() << '\n';
			std::cerr << "Error opening scene option file" << std::endl;
			ifs.close();
		}
	// Close the stream
	ifs.close();
}

// Read object 2 world from ood file 
void readObjectOptionDataFile(const char *file, Matrix44f *o2w)
{
	std::ifstream ifs;
	try 
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;	

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();			
			
			float object2world[16];
#ifdef DEBUG
			std::cout << "DEBUG: Object to world " << object2world << "\n";
#endif
			for (uint32_t i=0; i < 16; i++)
				{
					ss >> object2world[i];
				}
			for (uint32_t i=0; i < 4; i++)
				{
					for (uint32_t j=0; j < 4; j++)
						{
#ifdef DEBUG
							std::cout << "DEBUG: object to world matrix [" << i << "][" << j << "] " << object2world[(i*4)+j] << "\n";
#endif
							o2w->x[i][j] = object2world[(i*4)+j];
						}
				}
		}
	catch (const std::exception& e) 
		{
			std::cerr << e.what() << '\n';
			std::cerr << "Error opening object option file (object2world)" << std::endl;
			ifs.close();
		}
	// Close the stream
	ifs.close();
}

// Reads object options from file 
void readObjectOptionDataFile(const char *file, Object *mesh)
{
	std::ifstream ifs;
	try 
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();

			float skipdata;
			for (uint32_t i=0; i < 16; i++)
				{
					ss >> skipdata;
				}

			// Read type
			uint32_t type;
			ss >> type;
#ifdef DEBUG
			std::cout << "DEBUG: Object type " << type << "\n";
#endif
			switch (type)
				{
					case 0:
						mesh->type = kDiffuse;
						break;
					case 1:
						mesh->type = kReflection;
						break;
					case 2:
						mesh->type = kReflectionAndRefraction;
						break;
					case 3:
						mesh->type = kPhong;
						break;
					default:
						break;
				}			

			// Read Index of refraction
			float ior;
			ss >> ior;
#ifdef DEBUG
			std::cout << "DEBUG: Object Index of Reflection " << ior << "\n";
#endif
			mesh->ior = ior;
			
			// Read albedo
			float albedo[3];
#ifdef DEBUG
			std::cout << "DEBUG: Object albedo ";
#endif
			for (uint32_t i=0; i < 3; i++)
				{
					ss >> albedo[i];
#ifdef DEBUG
					std::cout << albedo[i] << " ";
#endif
				}
#ifdef DEBUG
			std::cout << "\n";
#endif
			mesh->albedo.x = albedo[0];
			mesh->albedo.y = albedo[1];
			mesh->albedo.z = albedo[2];
				

			// Read kd 
			float kd;
			ss >> kd;
#ifdef DEBUG
			std::cout << "DEBUG: Object Phong shading kd factor " << kd << "\n";
#endif
			mesh->Kd = kd;

			// Read ks
			float ks;
			ss >> ks;
#ifdef DEBUG
			std::cout << "DEBUG: Object Phong shading ks factor " << ks << "\n";
#endif
			mesh->Ks = ks;

			// Read n
			float n;
			ss >> n;
#ifdef DEBUG
			std::cout << "DEBUG: Object Phong shading n factor " << n << "\n";
#endif
			mesh->n = n;	
		}
	catch (const std::exception& e) 
		{
			std::cerr << e.what() << '\n';
			std::cerr << "Error opening object option file (options)" << std::endl;
			ifs.close();
		}
	// Close the stream
	ifs.close();	
}

/* This class reads the geometry file that describes the scene. All the data such as 
	number of faces, the face and vertex arrays, the point, normal and st coordinates arrays
	are passed to the triangle mesh constractor.
	It also contains functions that do the intersecion and return the meshes properies 
*/
class TriangleMesh : public Object
{
public:
	// Build a triangle mesh from a face index array and a vertex index array
	TriangleMesh(
		const Matrix44f &o2w,
		const uint32_t nfaces,
		const std::unique_ptr<uint32_t []> &faceIndex,
		const std::unique_ptr<uint32_t []> &vertsIndex,
		const std::unique_ptr<Vec3f []> &verts,
		std::unique_ptr<Vec3f []> &normals,
		std::unique_ptr<Vec2f []> &st) :
		Object(o2w),
		numTris(0)
{
	this->name = "trianglemesh";
	uint32_t k = 0, maxVertIndex = 0;
	// find out how many triangles we need to create for this mesh
	for (uint32_t i = 0; i < nfaces; ++i) 
		{
			numTris += faceIndex[i] - 2;
			for (uint32_t j = 0; j < faceIndex[i]; ++j)
				{
					if (vertsIndex[k + j] > maxVertIndex)
						{
							maxVertIndex = vertsIndex[k + j];
						}
				}
			k += faceIndex[i];
		}
	maxVertIndex += 1;
	
	// allocate memory to store the position of the mesh vertices
	P = std::unique_ptr<Vec3f []>(new Vec3f[maxVertIndex]);
	for (uint32_t i = 0; i < maxVertIndex; ++i) 
		{
			/* The object-to-world matrix is passed to the constructor of the TriangleMesh class 
			which in turn passes it on to the constructor of the Object class (line 13). 
			Finally, in the constructor of the triangle mesh class, we loop over all the vertices 
			making the mesh and set the mesh vertices to the input vertices transformed by the 
			object-to-world matrix (lines 19-22):
			*/
			objectToWorld.multVecMatrix(verts[i], P[i]);
		}	
        
		// allocate memory to store triangle indices
		trisIndex = std::unique_ptr<uint32_t []>(new uint32_t [numTris * 3]);
		uint32_t l = 0;
		// Generate the triangle index array
		// Keep in mind that there is generally 1 vertex attribute for each vertex of each face.
		// So for example if you have 2 quads, you only have 6 vertices but you have 2 * 4
		// vertex attributes (that is 8 normals, 8 texture coordinates, etc.). So the easiest
		// lazziest method in our triangle mesh, is to create a new array for each supported
		// vertex attribute (st, normals, etc.) whose size is equal to the number of triangles
		// multiplied by 3, and then set the value of the vertex attribute at each vertex
		// of each triangle using the input array (normals[], st[], etc.)
		N = std::unique_ptr<Vec3f []>(new Vec3f[numTris * 3]);
		sts = std::unique_ptr<Vec2f []>(new Vec2f[numTris * 3]);
		// Computing the transpse of the object-to-world inverse matrix
		Matrix44f transformNormals = worldToObject.transpose();
		// generate the triangle index array and set normals and st coordinates
		for (uint32_t i = 0, k = 0; i < nfaces; ++i) 
			{ // for each  face
				for (uint32_t j = 0; j < faceIndex[i] - 2; ++j) 
					{ // for each triangle in the face
						trisIndex[l] = vertsIndex[k];
						trisIndex[l + 1] = vertsIndex[k + j + 1];
						trisIndex[l + 2] = vertsIndex[k + j + 2];
						// Transforming normals
						transformNormals.multDirMatrix(normals[k], N[l]);
						transformNormals.multDirMatrix(normals[k + j + 1], N[l + 1]);
						transformNormals.multDirMatrix(normals[k + j + 2], N[l + 2]);
						N[l].normalize();
						N[l + 1].normalize();
						N[l + 2].normalize();
						sts[l] = st[k];
						sts[l + 1] = st[k + j + 1];
						sts[l + 2] = st[k + j + 2];
						l += 3;
					}                                                                                                                                                                                                                                
				k += faceIndex[i];
			}
  }
	// Test if the ray interesests this triangle mesh
	bool intersect(const Vec3f &orig, const Vec3f &dir, float &tNear, uint32_t &triIndex, Vec2f &uv) const
		{
			uint32_t j = 0;
			bool isect = false;
			bool temp_ret;
			// Loop each object's triangles
			for (uint32_t i = 0; i < numTris; ++i) 
				{
					const Vec3f &v0 = P[trisIndex[j]];
					const Vec3f &v1 = P[trisIndex[j + 1]];
					const Vec3f &v2 = P[trisIndex[j + 2]];
					float t = kInfinity, u, v;
					/* a ray may intersect more than one triangle from the mesh therefore we also 
					need to keep track of the nearest intersection distance as we iterate over the triangles.            
					*/
					//std::cout.precision(17);
					/*
					std::cout << "\n START DEBUG \n";
					std::cout << "DEBUG: input data \n";
					std::cout << "\nOrig " << orig.x << " " << orig.y << " " << orig.z << " ";
					std::cout << "\nDir " << dir.x << " " << dir.y  << " " << dir.z << " ";
					std::cout << "\nV0 "  << v0.x << " " << v0.y << " " << v0.z << " ";
					std::cout << "\nV1 " << v1.x << " " << v1.y << " " << v1.z << " ";
					std::cout << "\nV2 " << v2.x << " " << v2.y << " " << v2.z << " ";
					std::cout << "\nDEBUG: result " << t << " " << u << " " << v << " ";
					std::cout << "\nDEBUG: " << t << " " << tNear;
					std::cout << "\nEND DEBUG\n";
					*/
					temp_ret = rayTriangleIntersect(orig, dir, v0, v1, v2, t, u, v);
					if ( (temp_ret == true ) && t < tNear) 
						{
							/*
              std::cout.precision(17);
							std::cout << "\n START DEBUG \n";
							std::cout << "DEBUG: input data \n";
							std::cout << "\nOrig " << orig.x << " " << orig.y << " " << orig.z << " ";
							std::cout << "\nDir " << dir.x << " " << dir.y  << " " << dir.z << " ";
							std::cout << "\nV0 "  << v0.x << " " << v0.y << " " << v0.z << " ";
							std::cout << "\nV1 " << v1.x << " " << v1.y << " " << v1.z << " ";
							std::cout << "\nV2 " << v2.x << " " << v2.y << " " << v2.z << " ";
							std::cout << "\nDEBUG: result " << t << " " << u << " " << v << " ";
							std::cout << "\nDEBUG: " << t << " " << tNear;
							std::cout << "\nEND DEBUG\n";
							*/
						
							tNear = t;
							uv.x = u;
							uv.y = v;
							triIndex = i;
							isect = true;
						}                                                                                                                                                                                                                                
					j += 3;
				}
			return isect;
		}

    // Compute Normal at the intersecion point as well as texture coordinates
    void getSurfaceProperties(
			const Vec3f &hitPoint,
			const Vec3f &viewDirection,
			const uint32_t &triIndex,
			const Vec2f &uv,
			Vec3f &hitNormal,
			Vec2f &hitTextureCoordinates) const
    {
			// If smooth shading is on use vertex normals for smoother shading 
			if (smoothShading) 
				{
					/* Combine the point barycentric coordinate and the triangle vertex normals 
					to compute the point interpolated smooth normal 
					*/
					// vertex normal
					const Vec3f &n0 = N[triIndex * 3];
					const Vec3f &n1 = N[triIndex * 3 + 1];
					const Vec3f &n2 = N[triIndex * 3 + 2];
					hitNormal = (1 - uv.x - uv.y) * n0 + uv.x * n1 + uv.y * n2;
				}
			else 
				{
					// face normal
					const Vec3f &v0 = P[trisIndex[triIndex * 3]];
					const Vec3f &v1 = P[trisIndex[triIndex * 3 + 1]];
					const Vec3f &v2 = P[trisIndex[triIndex * 3 + 2]];
					hitNormal = (v1 - v0).crossProduct(v2 - v0);
				}

			// doesn't need to be normalized as the N's are normalized but just for safety
			hitNormal.normalize();

			// texture coordinates
			const Vec2f &st0 = sts[triIndex * 3];
			const Vec2f &st1 = sts[triIndex * 3 + 1];
			const Vec2f &st2 = sts[triIndex * 3 + 2];
			hitTextureCoordinates = (1 - uv.x - uv.y) * st0 + uv.x * st1 + uv.y * st2;
    }
	// member variables
	uint32_t numTris;                       // number of triangles
	std::unique_ptr<Vec3f []> P;            // triangles vertex position
	std::unique_ptr<uint32_t []> trisIndex; // vertex index array
	std::unique_ptr<Vec3f []> N;            // triangles vertex normals
	std::unique_ptr<Vec2f []> sts;          // triangles texture coordinates
	bool smoothShading = true;              // smooth shading by default
};

TriangleMesh* loadPolyMeshFromFile(const char *file, const Matrix44f &o2w)
{
	std::ifstream ifs;
	try 
		{
			// Open the file or throw exeption
			ifs.open(file);
			if (ifs.fail()) throw;

			// Open stream to file
			std::stringstream ss;
			ss << ifs.rdbuf();

			// Read number of faces 
			uint32_t numFaces;
			ss >> numFaces;
#ifdef DEBUG_GEO
			std::cout << "DEBUG: Number of Faces: " << numFaces << "\n";
#endif
			std::unique_ptr<uint32_t []> faceIndex(new uint32_t[numFaces]);

			uint32_t vertsIndexArraySize = 0;
			// reading face index array
			for (uint32_t i = 0; i < numFaces; ++i) 
				{
					ss >> faceIndex[i];
#ifdef DEBUG_GEO
					std::cout << "DEBUG: Face index [ " << i << "]: " << faceIndex[i] << "\n";
#endif
					vertsIndexArraySize += faceIndex[i];
				}
			std::unique_ptr<uint32_t []> vertsIndex(new uint32_t[vertsIndexArraySize]);
#ifdef DEBUG_GEO
			std::cout << "DEBUG: Vertex Index Array Size: " << vertsIndexArraySize << "\n";
#endif

			uint32_t vertsArraySize = 0;
			// reading vertex index array
			for (uint32_t i = 0; i < vertsIndexArraySize; ++i) 
				{
					ss >> vertsIndex[i];
#ifdef DEBUG_GEO
					std::cout << "DEBUG: Vertex index [ " << i << "]: " << vertsIndex[i] << "\n";
#endif
					if (vertsIndex[i] > vertsArraySize) vertsArraySize = vertsIndex[i];
				}
			vertsArraySize += 1;
#ifdef DEBUG_GEO
			std::cout << "DEBUG: Vertex Array Size: " << vertsArraySize << "\n";
#endif

			// reading vertices
			std::unique_ptr<Vec3f []> verts(new Vec3f[vertsArraySize]);
			for (uint32_t i = 0; i < vertsArraySize; ++i) 
				{
					ss >> verts[i].x >> verts[i].y >> verts[i].z;
#ifdef DEBUG_GEO
					std::cout << "DEBUG: Vertex [ " << i << "]: " << verts[i].x << " " << verts[i].y << " " << verts[i].z << "\n";	
#endif
				}

			// reading normals
			std::unique_ptr<Vec3f []> normals(new Vec3f[vertsIndexArraySize]);
			for (uint32_t i = 0; i < vertsIndexArraySize; ++i) 
				{
					ss >> normals[i].x >> normals[i].y >> normals[i].z;
#ifdef DEBUG_GEO
					std::cout << "DEBUG: Normal [ " << i << "]: " << normals[i].x << " " << normals[i].y << " " << normals[i].z << "\n";
#endif
				}

			// reading st coordinates
			std::unique_ptr<Vec2f []> st(new Vec2f[vertsIndexArraySize]);
			for (uint32_t i = 0; i < vertsIndexArraySize; ++i) 
				{
					ss >> st[i].x >> st[i].y;
#ifdef DEBUG_GEO
					std::cout << "DEBUG: Textrure Coordinates [ " << i << "]: " << st[i].x << " " << st[i].y << "\n";	
#endif
				}
			
			return new TriangleMesh(o2w, numFaces, faceIndex, vertsIndex, verts, normals, st);
		}
	catch (const std::exception& e) 
		{
			std::cerr << e.what() << '\n';
			std::cerr << "Error opening object geo file" << std::endl;
			ifs.close();
		}
	ifs.close();
	
	return nullptr;
}

/* In code, we will differentiate lights from geometry by creating a special Light class. 
Note that lights are unaffected by scale.
*/
class Light
{
public:
	/* Lights too can be transformed by 4x4 matrices. In fact we will use this matrix to compute the 
	position of spherical lights and the direction of directional lights.
	l2w -> lightToWorld
	*/
	Matrix44f lightToWorld;
	Light(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : lightToWorld(l2w), color(c), intensity(i) {}
	virtual ~Light() {}
	virtual void illuminate(const Vec3f &P, Vec3f &, Vec3f &, float &) const = 0;
	// The RGB color of the light (with values in the range [0,1])
	Vec3f color;
	// The light intensity
	float intensity;
};

/* Distant lights are unaffected by translation
to change or control the light direction, we will change the light-to-world transformation matrix
*/
class DistantLight : public Light
{
  Vec3f dir;
public:
	DistantLight(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : Light(l2w, c, i)
		{
			l2w.multDirMatrix(Vec3f(0, 0, -1), dir);
			dir.normalize(); // in case the matrix scales the light
		}
	void illuminate(const Vec3f &P, Vec3f &lightDir, Vec3f &lightIntensity, float &distance) const
		{
			lightDir = dir;
			lightIntensity = color * intensity;
			distance = kInfinity;
		}
};

/* Point lights are also unaffected by rotation 
We will assume that the point light source is originally created at the origin of the world coordinate system.
To modify its position in 3D space, we will use the light-to-world transformation matrix.
*/
class PointLight : public Light
{
  Vec3f pos;
public:
	PointLight(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : Light(l2w, c, i)
		{ 
			l2w.multVecMatrix(Vec3f(0), pos); 
		}
	// P: is the shaded point
	void illuminate(const Vec3f &P, Vec3f &lightDir, Vec3f &lightIntensity, float &distance) const
		{
			// this is also where we will compute the light intensity for a given P
			lightDir = (P - pos);
			// compute the square distance
			float r2 = lightDir.norm();
			distance = sqrt(r2);
			// normalize the incident light ray direction
			lightDir.x /= distance, lightDir.y /= distance, lightDir.z /= distance;
			// avoid division by 0
			/* We can use the square of this vector length to attenuate the light 
			intensity according to the inverse square law
			*/
			// apply square falloff
			lightIntensity = color * intensity / (4 * M_PI * r2);
		}
};

enum RayType { kPrimaryRay, kShadowRay };

// Intersected object info
struct IsectInfo
{
	const Object *hitObject = nullptr;
	float tNear = kInfinity;
	Vec2f uv;
	uint32_t index = 0;
};

// Trace a ray and find the nearest intersection point 
bool trace(
	const Vec3f &orig, const Vec3f &dir,
	const std::vector<std::unique_ptr<Object>> &objects,
	IsectInfo &isect,
	RayType rayType = kPrimaryRay)
{
	isect.hitObject = nullptr;
	bool rayIntersectRes;
	// Iterate the list of objects and check intersection 
	for (uint32_t k = 0; k < objects.size(); ++k) 
		{
			float tNear = kInfinity;
			uint32_t index = 0;
			Vec2f uv;

			// For each object iterate it's list of triangles and check the intersecion point's distance  
			rayIntersectRes = objects[k]->intersect(orig, dir, tNear, index, uv);
			//std::cout << "DEBUG: intersection res " << rayIntersectRes << " tnear " << tNear << " orig " << orig << " dir " << dir << " uv " << uv << std::endl;
			if ( (rayIntersectRes == true) && tNear < isect.tNear)
				{
					//std::cout << "DEBUG: intersection res " << rayIntersectRes << " tnear " << tNear << " orig " << orig << " dir " << dir << " uv " << uv << std::endl;
					if (rayType == kShadowRay && objects[k]->type == kReflectionAndRefraction) continue;
					isect.hitObject = objects[k].get();
					isect.tNear = tNear;
					isect.index = index;
					isect.uv = uv;
				}
		}
  return (isect.hitObject != nullptr);
}

/* If the object that the primary ray hit is a mirror like surface, then we 
compute the reflection direction using the incident view direction 
(the primary ray direction) and the normal of the surface at the intersection point.
R = I−2(N⋅I)N
*/
Vec3f reflect(const Vec3f &I, const Vec3f &N)
{
	return I - 2 * I.dotProduct(N) * N;
}

// Compute refraction direction
Vec3f refract(const Vec3f &I, const Vec3f &N, const float &ior) 
{ 
	float cosi = clamp(-1, 1, I.dotProduct(N));
	float etai = 1, etat = ior; 
	Vec3f n = N; 
	if (cosi < 0) 
		{
			// we are outside the surface, we want cos(theta) to be positive
			cosi = -cosi; 
		}
	else
		{ 
			// swap the refraction indices
			std::swap(etai, etat); 
			// we are inside the surface, cos(theta) is already positive but reverse normal direction
			n= -N; 
		} 
	float eta = etai / etat; 
	float k = 1 - eta * eta * (1 - cosi * cosi); 
	// total internal reflection. There is no refraction in this case  if (k < 0) 
	return k < 0 ? 0 : eta * I + (eta * cosi - sqrtf(k)) * n; 
}

// Evaluate Fresnel equation (relation of reflected light for a given incident direction and surface normal)
void fresnel(const Vec3f &I, const Vec3f &N, const float &ior, float &kr) 
{ 
	float cosi = clamp(-1, 1, I.dotProduct(N));
	float etai = 1, etat = ior; 
	if (cosi > 0) 
		{ 
			std::swap(etai, etat); 
		} 
	/* There is another way of computing or finding out when the incident light is totally reflected 
	rather than being refracted. You need to compute the sine of the angle of refraction. If sinθ2 
	is greater than 1, then we have a case of total internal reflection. Note that this value can 
	easily be computed using Snell's law: 
	*/
	float sint = etai / etat * sqrtf(std::max(0.f, 1 - cosi * cosi)); 
	// Total internal reflection
	if (sint >= 1) 
		{ 
			kr = 1; 
		} 
	else 
		{ 
			float cost = sqrtf(std::max(0.f, 1 - sint * sint)); 
			cosi = fabsf(cosi); 
			float Rs = ((etat * cosi) - (etai * cost)) / ((etat * cosi) + (etai * cost)); 
			float Rp = ((etai * cosi) - (etat * cost)) / ((etai * cosi) + (etat * cost)); 
			kr = (Rs * Rs + Rp * Rp) / 2; 
		} 
	// As a consequence of the conservation of energy, transmittance is given by:
	//kr = 1 - kr;
}

inline float modulo(const float &f)
{
  return f - std::floor(f);
}

/* First you can store all the lights in a list and pass this list to the castRay() function 
which is where shading is done. We then iterate over all the lights and add their contribution 
to the shaded point illumination. the light contribution is attenuated by the cosine of the 
angle between P's normal and the light direction. This term is different for each light and thus 
need to computed for each light. Similarly a shadow ray needs to be cast for each light as well
*/
Vec3f castRay(
	const Vec3f &orig, const Vec3f &dir,
	const std::vector<std::unique_ptr<Object>> &objects,
	const std::vector<std::unique_ptr<Light>> &lights,
	const Options &options,
	const uint32_t & depth = 0)
{
	// If maximum depth has been reached then return the background colour
	if (depth > options.maxDepth) return options.backgroundColor;
	Vec3f hitColor = 0;

	// Intersected object info
	IsectInfo isect;

	// Check if the ray intersects an object proceed with shading calculations
	if (trace(orig, dir, objects, isect)) 
		{
			// Evaluate surface properties (P, N, texture coordinates, etc.)
			Vec3f hitPoint = orig + dir * isect.tNear;
			Vec3f hitNormal;
			Vec2f hitTexCoordinates;

			// Get properties of the object 
			isect.hitObject->getSurfaceProperties(hitPoint, dir, isect.index, isect.uv, hitNormal, hitTexCoordinates);
#ifdef DEBUG_RENDER
			std::cout << "DEBUG: Hit object type is: " << isect.hitObject->type << "\n"; 
#endif
			// Depending on the object type use different shading method
			switch (isect.hitObject->type) 
				{
					// Simulate diffuse object
					case kDiffuse:
						{
							// Light loop (loop over all lights in the scene and accumulate their contribution)
							for (uint32_t i = 0; i < lights.size(); ++i) 
								{
									Vec3f lightDir, lightIntensity;
									IsectInfo isectShad;

									// Evaluate the light contribution according to it's type
									lights[i]->illuminate(hitPoint, lightDir, lightIntensity, isectShad.tNear);
									/* we just call the trace function again and set the variable vis to false if the trace function 
									returns true (the intersection point is in shadow, thus the point is not illuminated by the directional 
									light source) and true otherwise (the intersection point is not in shadow, thus the point is illuminated 
									by the light source)
									*/
									bool vis = !trace(hitPoint + hitNormal * options.bias, -lightDir, objects, isectShad, kShadowRay);
									//std::cerr << "DEBUG: vis input Vis = " << vis << " , " << hitPoint + hitNormal * options.bias << " , " << -lightDir << std::endl;
									// compute the pattern
#ifdef PATTERN_1
									float scaleS = 20, scaleT = 20;
									float pattern = (cos(hitTexCoordinates.y * 2 * M_PI * scaleT) * sin(hitTexCoordinates.x * 2 * M_PI * scaleS) + 1) * 0.5; // isect.hitObject->albedo
#endif
#ifdef PATTERN_2
									float scaleS = 20, scaleT = 20;
									float angle = deg2rad(45);
									float s = hitTexCoordinates.x * cos(angle) - hitTexCoordinates.y * sin(angle);
									float t = hitTexCoordinates.y * cos(angle) + hitTexCoordinates.x * sin(angle);
									float pattern = (modulo(s * scaleS) < 0.5) ^ (modulo(t * scaleT) < 0.5);
#endif
#ifdef PATTERN_3
									float scaleS = 20;
									float angle = deg2rad(45);
									float s = hitTexCoordinates.x * cos(angle) - hitTexCoordinates.y * sin(angle);
									float pattern = (modulo(s * scaleS) < 0.5);
#endif
#ifdef PATTERN_4
									const int M = 10;
									float checker = (fmod(hitTexCoordinates.x * M, 1.0) > 0.5) ^ (fmod(hitTexCoordinates.y * M, 1.0) < 0.5);
									float pattern = 0.3 * (1 - checker) + 0.7 * checker;                    
#endif
#ifdef PATTERN_5
									float pattern = 0.9;
#endif
									// If the point is in shadow, the point is black. If vis is set to true, then the color of the point is left unchanged
									hitColor += vis * pattern * lightIntensity * std::max(0.f, hitNormal.dotProduct(-lightDir));
#ifdef DEBUG_RENDER
									std::cerr << "DEBUG: Diffuse hit colour: " << hitColor << std::endl;
#endif
								}
							break;
						}
					// Simulate reflection only
					case kReflection:
						{
							// Use the ray direction to find the hit normal
							Vec3f R = reflect(dir, hitNormal);
							R.normalize();
							// Added the hit colour contribiution in case of a stand alone object
							hitColor += 0.8 * castRay(hitPoint + hitNormal * options.bias, R, objects, lights, options, depth + 1); 
							break;
						}
					// Simulate transparent object (reflection/transmission/fresnel)
					case kReflectionAndRefraction:
						{
							Vec3f refractionColor = 0, reflectionColor = 0;
							// compute fresnel
							float kr;

							fresnel(dir, hitNormal, isect.hitObject->ior, kr);

							bool outside = dir.dotProduct(hitNormal) < 0;
							Vec3f bias = options.bias * hitNormal;
							// compute refraction if it is not a case of total internal reflection
							if (kr < 1) 
								{
									// Culculate refraction direction
									Vec3f refractionDirection = refract(dir, hitNormal, isect.hitObject->ior).normalize();
									// Subtrack or add bias depending if the ray is outside or not
									Vec3f refractionRayOrig = outside ? hitPoint - bias : hitPoint + bias;
									refractionColor = castRay(refractionRayOrig, refractionDirection, objects, lights, options, depth + 1);
								}
					
							Vec3f reflectionDirection = reflect(dir, hitNormal).normalize();
							Vec3f reflectionRayOrig = outside ? hitPoint + bias : hitPoint - bias;
							reflectionColor = castRay(reflectionRayOrig, reflectionDirection, objects, lights, options, depth + 1);
							
							// mix the two
							hitColor += reflectionColor * kr + refractionColor * (1 - kr);
#ifdef DEBUG_RENDER
							std::cerr << "DEBUG: Reflect and Refract hit colour: "<< hitColor << std::endl;
#endif
							break;
						}
					case kPhong:
						{
							Vec3f diffuse = 0, specular = 0;
							// Light loop (loop over all lights in the scene and accumulate their contribution)
							for (uint32_t i = 0; i < lights.size(); ++i) 
								{
									Vec3f lightDir, lightIntensity;
									IsectInfo isectShad;
									lights[i]->illuminate(hitPoint, lightDir, lightIntensity, isectShad.tNear);
									/* we just call the trace function again and set the variable vis to false if the trace function 
									returns true (the intersection point is in shadow, thus the point is not illuminated by the directional 
									light source) and true otherwise (the intersection point is not in shadow, thus the point is illuminated 
									by the light source)
									*/
									bool vis = !trace(hitPoint + hitNormal * options.bias, -lightDir, objects, isectShad, kShadowRay);
									
									// compute the diffuse component
									diffuse += vis * isect.hitObject->albedo * lightIntensity * std::max(0.f, hitNormal.dotProduct(-lightDir));
									
									// compute the specular component
									// what would be the ideal reflection direction for this light ray
									Vec3f R = reflect(lightDir, hitNormal);
									specular += vis * lightIntensity * std::pow(std::max(0.f, R.dotProduct(-dir)), isect.hitObject->n);
								}
							hitColor = diffuse * isect.hitObject->Kd + specular * isect.hitObject->Ks;
#ifdef DEBUG_RENDER
							std::cerr << "DEBUG: Phong hit colour: " << hitColor << std::endl;
#endif							
							break;
						}
					default:
						break;
				}
		}
	else 
		{
			hitColor = options.backgroundColor;
		}
  return hitColor;
}

// The main render function. This where we iterate over all pixels in the image, generate
// primary rays and cast these rays into the scene. The content of the framebuffer is
// saved to a file.
void render(
	const Options &options,
	const std::vector<std::unique_ptr<Object>> &objects,
	const std::vector<std::unique_ptr<Light>> &lights)
{
	// Allocate memory for the frame buffer
	std::unique_ptr<Vec3f []> framebuffer(new Vec3f[options.width * options.height]);
	Vec3f *pix = framebuffer.get();

	/* image scale 
	define the field of view of the camera in terms of the angle α, and multiply the screen pixel 
	coordinates with the result of the tangent of this angle divided by two ( go from degres to rad )
	tan(fov / 2 * M_PI / 180)
	*/  
	float scale = tan(deg2rad(options.fov * 0.5));
	float imageAspectRatio = options.width / (float)options.height;

	// Culculate the world origin according to the camera to world matrix
	Vec3f orig;
	options.cameraToWorld.multVecMatrix(Vec3f(0), orig);

	// Start timer 
	auto timeStart = std::chrono::high_resolution_clock::now();

	for (uint32_t j = 0; j < options.height; ++j) 
		{
			for (uint32_t i = 0; i < options.width; ++i) 
				{
					/* What we need is to find a relation between the coordinates of these pixels in raster 
					space and the coordinates of the same pixels but expressed in world space
					compute primary ray and find the position to go through the center of the pixel
			
					1) normalize this pixel position using the frame's dimensions pixel + 0.5/image dim add a small shift (0.5) to the pixel position because we want the 
					final camera ray to pass through the middle of the pixel

					2) remap the normalized coordinates from the range of [0:1]( Normalized Device coordinates) to [-1:1]
					pixelScreen = 2 * PixelNDC - 1 ( for y 1 - 2 * PixelNDC ) 
					Coordinates expressed in this manner are said to be defined in screen space.
					3) multiply the x dimension in order to make each pixel square again
					4) we need to account for the Feild of View, this operation changes how much of the scene we see
					*/                  
					float x = (2 * (i + 0.5) / (float)options.width - 1) * imageAspectRatio * scale;
					float y = (1 - 2 * (j + 0.5) / (float)options.height) * scale;
					//std::cout << "dir x y " << x << y << std::endl;
					Vec3f dir;
					// Multiply the pixel coordinates with the camera to world matrix to generate the rays from the desired point in space
					options.cameraToWorld.multDirMatrix(Vec3f(x, y, -1), dir);
					// Normalization can be redused 
					// write the direction as a unit vector
					/* n = x * x + y * y + z * z;
					if (n > 0) {
						T factor = 1 / sqrt(n);
						x *= factor, y *= factor, z *= factor; }
					*/
					dir.normalize();
					// Take the arguments Ray origin, direction, object list, light list and scene option
					//std::cout << "dir " << dir << " orig " << orig << " x y " << x << " " << y << " j i " << j << " " << i << std::endl;
					*(pix++) = castRay(orig, dir, objects, lights, options);
				}
			// Print the percentage of completion based on height 
			fprintf(stderr, "\r%3d%c", uint32_t(j / (float)options.height * 100), '%');
		}

	// Stop timer and messure time
	auto timeEnd = std::chrono::high_resolution_clock::now();
	auto passedTime = std::chrono::duration<double, std::milli>(timeEnd - timeStart).count();
	fprintf(stderr, "\rDone: %.2f (sec)\n", passedTime / 1000);
    
	// save framebuffer to file
	std::ofstream ofs;
	ofs.open("out.ppm");
	ofs << "P6\n" << options.width << " " << options.height << "\n255\n";
	for (uint32_t i = 0; i < options.height * options.width; ++i) 
		{
			char r = (char)(255 * clamp(0, 1, framebuffer[i].x));
			char g = (char)(255 * clamp(0, 1, framebuffer[i].y));
			char b = (char)(255 * clamp(0, 1, framebuffer[i].z));
			ofs << r << g << b;
		}
  ofs.close();
}

// In the main function of the program, we create the scene (create objects and lights)
// as well as set the options for the render (image widht and height, maximum recursion
// depth, field-of-view, etc.). We then call the render function().
int main(int argc, char **argv)
{
	// loading geometry
	std::vector<std::unique_ptr<Object>> objects;
	// lights
	std::vector<std::unique_ptr<Light>> lights;
	Options options;

	/* Geometry file data
		The first number defines the number of faces making up the mesh. 

		The second and third line is just a series of integers representing the face index and the vertex index arrays. 

		The next line contains the vertex position data. 

		The next lines contains the normal data 

		The last line contains the texture coordinates data

	*/

	/* Scene building options:

		1920											width										// options->width:	Set resolution width
		1080											height									// options->height:	Set resolution height
		90												FOV											// options->fov: Feild of view changes how much of the scene is visible 
		0.235294 0.67451 0.843137	kDefaultBackgroundColor	// options->backgroundColor: Set background colour when no intersection occurs 
		Camera 2 world no default 												// options->camera to world: Set the camera to a position in the scene
		0.0001										Bias										// options->bias: Sets shadow bias 
		4													Max Depth								// options->maxDepth: Sets a limit to how many rays we "chase" to find an objects contribution
		1													number of lights				// Number of lights in the scene
		0													type of light 					// lightdata_struct->lighttype Type of light 0 distant 1 point
		1 1 1											light colour 						// lightdata_struct->colour Select the light colour either int or Vec3f
		1													light intensity					// lightdata_struct->intensity Select the light intensity 1 for distant light 500 for point light
		Light 2 world no default													// lightdata_struct->light2world Light to world coordinates 
		if more lights add more

	*/ 

	/* Object building options
		
		Object 2 world no default // Read from first readObjectOptionDataFile function 
		kDiffuse				Type 			// object->type: Set the material type(0-kDiffuse, 1-kReflection, 2-kReflectionAndRefraction, 3-kPhong)
		1								IOR				// object->ior: Index of refraction (also sometimes referred to as ior)
		0.18 0.18 0.18	Albedo		// object->albedo: albedo = reflect light / incident light
		0.8							Kd 				// object->kd: phong model diffuse weight
		0.2							Ks 				// object->ks: phong model specular weight, control the size of matte lighting spot
		10							n					// object->n: phong specular exponent, control the size of specular spot

	*/

	// CLI arguments input 
	/* Read how many input files are present 

	The order must be .sob #of_objects .geo .ood .geo .ood ... ( how ever many pairs of .geo .ood )

	There must be always one scene options data file .sod
	And 2 files per object
		A geometry file .geo
		An object option data file .ood

		1) Read the scene options and set the struct accordingly 
			if a valid value exists assign it else the file needs to contain the default values

		2) Read the number of objects in the scene and assign index factors to read CLI arguments 
			in pairs

		3) Use an overloaded function to first read the object to the world matrix 

		4) Load the geometry of the object and place it to the world with the o2w matrix

		5) Load the rest of the object attributes in order to assign them to the object class
			This also needs to have all the default options filled in

		6) Increment factors and repeat for every object
	*/

	// Check number of CLI arguments
	if ( argc < 2 )
		{
			std::cout << "Wrong number of arguments\n Must at least have a scene option data file" << std::endl;
			return 1;
		}
	// Load lighting and scene options
	uint32_t numoflights;

	// Read scene data from file
	readSceneOptionDataFile(argv[1], &options, &numoflights);
	// Iterate the light sources and push the appropriate light type
	for (uint32_t i = 0; i < numoflights; i++)
		{
			// If the light source is distand light push the l2w array to a new Distand light unique ptr
			if ( lightData[i].lighttype == (uint32_t)0)
				{
					lights.push_back(std::unique_ptr<Light>(new DistantLight(lightData[i].light2world, lightData[i].colour, lightData[i].intensity )));
				}
			// If the light source is point light push the l2w array to a new Distand light unique ptr along with the 
			else if (lightData[i].lighttype == (uint32_t)1)
				{
					//std::cout << "LIGHT TYPE " << lightData[i].lighttype << "\nLIGHT 2 WORLD \n" << lightData[i].light2world << "\n LIGHT COLOUR " << lightData[i].colour << "\n INTENSITY " << lightData[i].intensity << std::endl;
					lights.push_back(std::unique_ptr<Light>(new PointLight( lightData[i].light2world, lightData[i].colour, lightData[i].intensity )));
				}		 
		}
	
	Matrix44f object2world;
	// Load object geometries and options for multiple objects 

	// Read the number of objects 
	uint32_t numofobjects = atoi(argv[2]);

	uint32_t indexfactorgeo = 3;
	uint32_t indexfactorood = 4;
	
	// Iterate argv array for each objects geometry and options file
	for (uint32_t i=0; i < numofobjects; i++)
		{
			// Use overloaded function to read the object to world array first
			readObjectOptionDataFile(argv[i+indexfactorood],&object2world);
			
			// Load object geometry from file
			TriangleMesh *mesh1 = loadPolyMeshFromFile(argv[i+indexfactorgeo], object2world);
			if (mesh1 != nullptr) 
				{	
					// Load the rest of the options
					readObjectOptionDataFile(argv[i+indexfactorood],mesh1);
					objects.push_back(std::unique_ptr<Object>(mesh1));
				}
			// Increment the factors to maintain +2 pattern for input files 
			indexfactorgeo++;
			indexfactorood++;
		}

	// finally, render
	render(options, objects, lights);

	return 0;
}
