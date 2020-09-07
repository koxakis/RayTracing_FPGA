//[header]
// A simple program to demonstrate how to ray-trace a polygon mesh
//[/header]
//[compile]
// Download the raytracetransform.cpp, geometry.h and teapot.geo file to a folder.
// Open a shell/terminal, and run the following command where the files are saved:
//
// c++ -o raytracetransform raytracetransform.cpp -std=c++11 -O3
//
// Run with: ./raytracetransform. Open the file ./out.0000.png in Photoshop or any program
// reading PPM files.
//[/compile]
//[ignore]
// Copyright (C) 2012  www.scratchapixel.com
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//[/ignore]


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

static const float kInfinity = std::numeric_limits<float>::max();
static const float kEpsilon = 1e-8;
static const Vec3f kDefaultBackgroundColor = Vec3f(0.235294, 0.67451, 0.843137);
template <> const Matrix44f Matrix44f::kIdentity = Matrix44f();

// In computer graphics, clamping is the process of limiting a position to an area. Unlike wrapping, 
//  clamping merely moves the point to the nearest available value.
inline
float clamp(const float &lo, const float &hi, const float &v)
{ return std::max(lo, std::min(hi, v)); }

inline
float deg2rad(const float &deg)
{ return deg * M_PI / 180; }

// Struct to contain scene options 
struct Options
{
    uint32_t width = 7680;
    uint32_t height = 4320;
    // set field of view 
    /* Below the scene is set with the attributes such as scale, image aspec ratio set in such a way
		that the rendered image resembles the pinhole camera model 
    */

   	/* calculated based on 90 degrees of horizontal FOV
        usual values 30-45 70 90-100
	*/
    float fov = 90;
    Vec3f backgroundColor = kDefaultBackgroundColor;
    // Set the matrix from which th the camera will come from (from 3D Viewing: the Pinhole Camera Model )
    Matrix44f cameraToWorld;
};

class Object
{
 public:
    // [comment]
    // Setting up the object-to-world and world-to-object matrix
    // [/comment]
    Object(const Matrix44f &o2w) : objectToWorld(o2w), worldToObject(o2w.inverse()) {}
    virtual ~Object() {}
    virtual bool intersect(const Vec3f &, const Vec3f &, float &, uint32_t &, Vec2f &) const = 0;
    virtual void getSurfaceProperties(const Vec3f &, const Vec3f &, const uint32_t &, const Vec2f &, Vec3f &, Vec2f &) const = 0;
    Matrix44f objectToWorld, worldToObject;
};

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
    
    return true;
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
        uint32_t k = 0, maxVertIndex = 0;
        // find out how many triangles we need to create for this mesh
        for (uint32_t i = 0; i < nfaces; ++i) {
            numTris += faceIndex[i] - 2;
            for (uint32_t j = 0; j < faceIndex[i]; ++j)
                if (vertsIndex[k + j] > maxVertIndex)
                    maxVertIndex = vertsIndex[k + j];
            k += faceIndex[i];
        }
        maxVertIndex += 1;
        
        // allocate memory to store the position of the mesh vertices
        P = std::unique_ptr<Vec3f []>(new Vec3f[maxVertIndex]);
        for (uint32_t i = 0; i < maxVertIndex; ++i) {
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
        // [comment]
        // Generate the triangle index array
        // Keep in mind that there is generally 1 vertex attribute for each vertex of each face.
        // So for example if you have 2 quads, you only have 6 vertices but you have 2 * 4
        // vertex attributes (that is 8 normals, 8 texture coordinates, etc.). So the easiest
        // lazziest method in our triangle mesh, is to create a new array for each supported
        // vertex attribute (st, normals, etc.) whose size is equal to the number of triangles
        // multiplied by 3, and then set the value of the vertex attribute at each vertex
        // of each triangle using the input array (normals[], st[], etc.)
        // [/comment]
        N = std::unique_ptr<Vec3f []>(new Vec3f[numTris * 3]);
        texCoordinates = std::unique_ptr<Vec2f []>(new Vec2f[numTris * 3]);
        // [comment]
        // Computing the transpose of the object-to-world inverse matrix
        // [/comment]
        Matrix44f transformNormals = worldToObject.transpose();
        // generate the triangle index array and set normals and st coordinates
        for (uint32_t i = 0, k = 0; i < nfaces; ++i) { // for each  face
            for (uint32_t j = 0; j < faceIndex[i] - 2; ++j) { // for each triangle in the face

                trisIndex[l] = vertsIndex[k];
                trisIndex[l + 1] = vertsIndex[k + j + 1];
                trisIndex[l + 2] = vertsIndex[k + j + 2];

                // [comment]
                // Transforming normals
                // [/comment]
                transformNormals.multDirMatrix(normals[k], N[l]);
                transformNormals.multDirMatrix(normals[k + j + 1], N[l + 1]);
                transformNormals.multDirMatrix(normals[k + j + 2], N[l + 2]);

                N[l].normalize();
                N[l + 1].normalize();
                N[l + 2].normalize();

                texCoordinates[l] = st[k];
                texCoordinates[l + 1] = st[k + j + 1];
                texCoordinates[l + 2] = st[k + j + 2];
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
        for (uint32_t i = 0; i < numTris; ++i) {
            const Vec3f &v0 = P[trisIndex[j]];
            const Vec3f &v1 = P[trisIndex[j + 1]];
            const Vec3f &v2 = P[trisIndex[j + 2]];
            float t = kInfinity, u, v;
            /* a ray may intersect more than one triangle from the mesh therefore we also 
                need to keep track of the nearest intersection distance as we iterate over the triangles.            
            */
            if (rayTriangleIntersect(orig, dir, v0, v1, v2, t, u, v) && t < tNear) {
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
    void getSurfaceProperties(
        const Vec3f &hitPoint,
        const Vec3f &viewDirection,
        const uint32_t &triIndex,
        const Vec2f &uv,
        Vec3f &hitNormal,
        Vec2f &hitTextureCoordinates) const
    {
        // face normal
        const Vec3f &v0 = P[trisIndex[triIndex * 3]];
        const Vec3f &v1 = P[trisIndex[triIndex * 3 + 1]];
        const Vec3f &v2 = P[trisIndex[triIndex * 3 + 2]];
        hitNormal = (v1 - v0).crossProduct(v2 - v0);
        hitNormal.normalize();
        
        // texture coordinates
        const Vec2f &st0 = texCoordinates[triIndex * 3];
        const Vec2f &st1 = texCoordinates[triIndex * 3 + 1];
        const Vec2f &st2 = texCoordinates[triIndex * 3 + 2];
        hitTextureCoordinates = (1 - uv.x - uv.y) * st0 + uv.x * st1 + uv.y * st2;

        // vertex normal
        const Vec3f &n0 = N[triIndex * 3];
        const Vec3f &n1 = N[triIndex * 3 + 1];
        const Vec3f &n2 = N[triIndex * 3 + 2];
        hitNormal = (1 - uv.x - uv.y) * n0 + uv.x * n1 + uv.y * n2;
        // doesn't need to be normalized as the N's are normalized but just for safety
        hitNormal.normalize();
    }
    // member variables
    uint32_t numTris;                         // number of triangles
    std::unique_ptr<Vec3f []> P;              // triangles vertex position
    std::unique_ptr<uint32_t []> trisIndex;   // vertex index array
    std::unique_ptr<Vec3f []> N;              // triangles vertex normals
    std::unique_ptr<Vec2f []> texCoordinates; // triangles texture coordinates
};

TriangleMesh* loadPolyMeshFromFile(const char *file, const Matrix44f &o2w)
{
    std::ifstream ifs;
    try {
        ifs.open(file);
        if (ifs.fail()) throw;
        std::stringstream ss;
        ss << ifs.rdbuf();
        uint32_t numFaces;
        ss >> numFaces;
        std::unique_ptr<uint32_t []> faceIndex(new uint32_t[numFaces]);
        uint32_t vertsIndexArraySize = 0;
        // reading face index array
        for (uint32_t i = 0; i < numFaces; ++i) {
            ss >> faceIndex[i];
            vertsIndexArraySize += faceIndex[i];
        }
        std::unique_ptr<uint32_t []> vertsIndex(new uint32_t[vertsIndexArraySize]);
        uint32_t vertsArraySize = 0;
        // reading vertex index array
        for (uint32_t i = 0; i < vertsIndexArraySize; ++i) {
            ss >> vertsIndex[i];
            if (vertsIndex[i] > vertsArraySize) vertsArraySize = vertsIndex[i];
        }
        vertsArraySize += 1;
        // reading vertices
        std::unique_ptr<Vec3f []> verts(new Vec3f[vertsArraySize]);
        for (uint32_t i = 0; i < vertsArraySize; ++i) {
            ss >> verts[i].x >> verts[i].y >> verts[i].z;
        }
        // reading normals
        std::unique_ptr<Vec3f []> normals(new Vec3f[vertsIndexArraySize]);
        for (uint32_t i = 0; i < vertsIndexArraySize; ++i) {
            ss >> normals[i].x >> normals[i].y >> normals[i].z;
        }
        // reading st coordinates
        std::unique_ptr<Vec2f []> st(new Vec2f[vertsIndexArraySize]);
        for (uint32_t i = 0; i < vertsIndexArraySize; ++i) {
            ss >> st[i].x >> st[i].y;
        }
        
        return new TriangleMesh(o2w, numFaces, faceIndex, vertsIndex, verts, normals, st);
    }
    catch (...) {
        ifs.close();
    }
    ifs.close();
    
    return nullptr;
}

bool trace(
    const Vec3f &orig, const Vec3f &dir,
    const std::vector<std::unique_ptr<Object>> &objects,
    float &tNear, uint32_t &index, Vec2f &uv, Object **hitObject)
{
    *hitObject = nullptr;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        float tNearTriangle = kInfinity;
        uint32_t indexTriangle;
        Vec2f uvTriangle;
        if (objects[k]->intersect(orig, dir, tNearTriangle, indexTriangle, uvTriangle) && tNearTriangle < tNear) {
            *hitObject = objects[k].get();
            tNear = tNearTriangle;
            index = indexTriangle;
            uv = uvTriangle;
        }
    }

    return (*hitObject != nullptr);
}

Vec3f castRay(
    const Vec3f &orig, const Vec3f &dir,
    const std::vector<std::unique_ptr<Object>> &objects,
    const Options &options)
{
    Vec3f hitColor = options.backgroundColor;
    float tnear = kInfinity;
    Vec2f uv;
    uint32_t index = 0;
    Object *hitObject = nullptr;
    if (trace(orig, dir, objects, tnear, index, uv, &hitObject)) {
        Vec3f hitPoint = orig + dir * tnear;
        Vec3f hitNormal;
        Vec2f hitTexCoordinates;
        hitObject->getSurfaceProperties(hitPoint, dir, index, uv, hitNormal, hitTexCoordinates);
        float NdotView = std::max(0.f, hitNormal.dotProduct(-dir));
        const int M = 10;
        float checker = (fmod(hitTexCoordinates.x * M, 1.0) > 0.5) ^ (fmod(hitTexCoordinates.y * M, 1.0) < 0.5);
        float c = 0.3 * (1 - checker) + 0.7 * checker;
        
        hitColor = c * NdotView; //Vec3f(uv.x, uv.y, 0); // Vec3f(hitTexCoordinates.x, hitTexCoordinates.y, 0);
    }

    return hitColor;
}

// [comment]
// The main render function. This where we iterate over all pixels in the image, generate
// primary rays and cast these rays into the scene. The content of the framebuffer is
// saved to a file.
// [/comment]
void render(
    const Options &options,
    const std::vector<std::unique_ptr<Object>> &objects,
    const uint32_t &frame)
{
    std::unique_ptr<Vec3f []> framebuffer(new Vec3f[options.width * options.height]);
    Vec3f *pix = framebuffer.get();
   /* image scale 
		define the field of view of the camera in terms of the angle α, and multiply the screen pixel 
		coordinates with the result of the tangent of this angle divided by two ( go from degres to rad )
		tan(fov / 2 * M_PI / 180)
	*/   
    float scale = tan(deg2rad(options.fov * 0.5));
    // set aspect ratio in order to account for non square images  
    float imageAspectRatio = options.width / (float)options.height;

    // the default position of a camera when it is created is the origin of the world with the origin at (0,0,0)    
    Vec3f orig;
    options.cameraToWorld.multVecMatrix(Vec3f(0), orig);
    auto timeStart = std::chrono::high_resolution_clock::now();
    for (uint32_t j = 0; j < options.height; ++j) {
        for (uint32_t i = 0; i < options.width; ++i) {
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

            // ray direction 
            // By convention, we will also orient the camera along the negative z-axis
            Vec3f dir;
            // generate a primary ray (whose direction and origin are transformed by the camera-to-world 4x4 transformation matrix)
            options.cameraToWorld.multDirMatrix(Vec3f(x, y, -1), dir);

            // Normalization can be redused 
            // write the direction as a unit vector
			/* n = x * x + y * y + z * z;
        		if (n > 0) {
            	T factor = 1 / sqrt(n);
            	x *= factor, y *= factor, z *= factor; }
			*/
            dir.normalize();
            *(pix++) = castRay(orig, dir, objects, options);
        }
        // Print progress bar 
        fprintf(stderr, "\r%3d%c", uint32_t(j / (float)options.height * 100), '%');
    }
    auto timeEnd = std::chrono::high_resolution_clock::now();
    auto passedTime = std::chrono::duration<double, std::milli>(timeEnd - timeStart).count();
    fprintf(stderr, "\rDone: %.2f (sec)\n", passedTime / 1000);
    
    // save framebuffer to file
    char buff[256];
    sprintf(buff, "out.%04d.ppm", frame);
    std::ofstream ofs;
    ofs.open(buff);
    ofs << "P6\n" << options.width << " " << options.height << "\n255\n";
    for (uint32_t i = 0; i < options.height * options.width; ++i) {
        char r = (char)(255 * clamp(0, 1, framebuffer[i].x));
        char g = (char)(255 * clamp(0, 1, framebuffer[i].y));
        char b = (char)(255 * clamp(0, 1, framebuffer[i].z));
        ofs << r << g << b;
    }
    ofs.close();
    
}

// [comment]
// In the main function of the program, we create the scene (create objects and lights)
// as well as set the options for the render (image widht and height, maximum recursion
// depth, field-of-view, etc.). We then call the render function().
// [/comment]
int main(int argc, char **argv)
{
    // setting up options
    Options options;
    /* Normals are a special kind of vector because they are not transformed by 4x4 affine 
        transformation matrices the same way than vectors are. They need to be transformed 
        instead by the inverse of the matrix
    */
    options.cameraToWorld = Matrix44f(0.931056, 0, 0.364877, 0, 0.177666, 0.873446, -0.45335, 0, -0.3187, 0.48692, 0.813227, 0, -41.229214, 81.862351, 112.456908, 1);
    options.fov = 18;

    // loading gemetry
    std::vector<std::unique_ptr<Object>> objects;
    Matrix44f objectToWorld = Matrix44f(1.624241, 0, 2.522269, 0, 0, 3, 0, 0, -2.522269, 0, 1.624241, 0, 0, 0, 0, 1); // Matrix44f::kIdentity;
    TriangleMesh *mesh = loadPolyMeshFromFile("./teapot.geo", objectToWorld);
    if (mesh != nullptr) objects.push_back(std::unique_ptr<Object>(mesh));
    
    // finally, render
    render(options, objects, 0);

    return 0;
}