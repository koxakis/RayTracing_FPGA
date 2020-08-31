//[header]
// A simple program to demonstrate some basic shading techniques
//[/header]
//[compile]
// Download the raytracetransform.cpp, geometry.h and teapot.geo file to a folder.
// Open a shell/terminal, and run the following command where the files are saved:
//
// c++ -o shading shading.cpp -std=c++11 -O3
//
// Run with: ./shading. Open the file ./out.png in Photoshop or any program
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

/*
    Example 1:  Glass and pen
    Example 2:  Whole plane
    Example 3:  4 Glasses refraction
    Example 4:  Horizontal Plane

    Pattern 1:  Blurry checkerboard
    Pattern 2:  Diagonal checkerboard
    Pattern 3:  Stripled 

*/
#define EXAMPLE_1
#define PATTERN_2

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
    */

   	/* calculated based on 90 degrees of horizontal FOV
        usual values 30-45 70 90-100
	*/
    float fov = 90;
    Vec3f backgroundColor = kDefaultBackgroundColor;
    // Set the matrix from which th the camera will come from (from 3D Viewing: the Pinhole Camera Model )
    Matrix44f cameraToWorld;
    /* The amount by which you displace or move the point in the normal direction is left to the user and 
        can be tweaked on a scene basis. This value is often refer to in ray-tracer as shadow bias
    */
    float bias = 0.0001;
    /* The number of times a reflection ray is reflected off of surfaces is called the ray depth.\
        Though for most scenes using a depth much greater than 4 or 5 (use >5 when dealing with very complex transparent surfaces are rendered (such as water splashes) ) 
        generally doesn't make much of visual difference.
    */
    uint32_t maxDepth = 10;
};

enum MaterialType { kDiffuse, kReflection, kReflectionAndRefraction };

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
    const char *name;
    MaterialType type = kDiffuse;
    float ior = 1;
    Vec3f albedo = 0.18;
};

// [comment]
// Compute the roots of a quadratic equation
// [/comment]
bool solveQuadratic(const float &a, const float &b, const float &c, float &x0, float &x1)
{
    float discr = b * b - 4 * a * c;
    if (discr < 0) return false;
    else if (discr == 0) {
        x0 = x1 = - 0.5 * b / a;
    }
    else {
        float q = (b > 0) ?
            -0.5 * (b + sqrt(discr)) :
            -0.5 * (b - sqrt(discr));
        x0 = q / a;
        x1 = c / q;
    }

    return true;
}

// [comment]
// Sphere class. A sphere type object
// [/comment]
class Sphere : public Object
{
public:
    Sphere(const Matrix44f &o2w, const float &r) : Object(o2w), radius(r), radius2(r *r)
    {
        o2w.multVecMatrix(Vec3f(0), center);
        this->name = "sphere";
    }
    // [comment]
    // Ray-sphere intersection test
    // [/comment]
    bool intersect(
        const Vec3f &orig,
        const Vec3f &dir,
        float &tNear,
        uint32_t &triIndex, // not used for sphere
        Vec2f &uv) const    // not used for sphere
    {
        float t0, t1; // solutions for t if the ray intersects
        // analytic solution
        Vec3f L = orig - center;
        float a = dir.dotProduct(dir);
        float b = 2 * dir.dotProduct(L);
        float c = L.dotProduct(L) - radius2;
        if (!solveQuadratic(a, b, c, t0, t1)) return false;

        if (t0 > t1) std::swap(t0, t1);

        if (t0 < 0) {
            t0 = t1; // if t0 is negative, let's use t1 instead
            if (t0 < 0) return false; // both t0 and t1 are negative
        }

        tNear = t0;

        return true;
    }
    // [comment]
    // Set surface data such as normal and texture coordinates at a given point on the surface
    // [/comment]
    void getSurfaceProperties(
        const Vec3f &hitPoint,
        const Vec3f &viewDirection,
        const uint32_t &triIndex,
        const Vec2f &uv,
        Vec3f &hitNormal,
        Vec2f &hitTextureCoordinates) const
    {
        hitNormal = hitPoint - center;
        hitNormal.normalize();
        // In this particular case, the normal is simular to a point on a unit sphere
        // centred around the origin. We can thus use the normal coordinates to compute
        // the spherical coordinates of Phit.
        // atan2 returns a value in the range [-pi, pi] and we need to remap it to range [0, 1]
        // acosf returns a value in the range [0, pi] and we also need to remap it to the range [0, 1]
        hitTextureCoordinates.x = (1 + atan2(hitNormal.z, hitNormal.x) / M_PI) * 0.5;
        hitTextureCoordinates.y = acosf(hitNormal.y) / M_PI;
    }
    float radius, radius2;
    Vec3f center;
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
    
    return (t > 0) ? true : false;
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
        sts = std::unique_ptr<Vec2f []>(new Vec2f[numTris * 3]);
        // [comment]
        // Computing the transpse of the object-to-world inverse matrix
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
        if (smoothShading) {
            // vertex normal
            const Vec3f &n0 = N[triIndex * 3];
            const Vec3f &n1 = N[triIndex * 3 + 1];
            const Vec3f &n2 = N[triIndex * 3 + 2];
            hitNormal = (1 - uv.x - uv.y) * n0 + uv.x * n1 + uv.y * n2;
        }
        else {
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

/* In code, we will differentiate lights from geometry by creating a special Light class. We will add to this base class the following member variables:
    lightToWorld: lights too can be transformed by 4x4 matrices. In fact we will use this matrix to compute the position of spherical lights and the direction of directional lights.
    color: the RGB color of the light (with values in the range [0,1]).
    intensity: the light intensity.
    Note that lights are unaffected by scale.
*/
class Light
{
public:
    Matrix44f lightToWorld;
    Light(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : lightToWorld(l2w), color(c), intensity(i) {}
    virtual ~Light() {}
    virtual void illuminate(const Vec3f &P, Vec3f &, Vec3f &, float &) const = 0;
    Vec3f color;
    float intensity;
};

// [comment]
// Distant lights are unaffected by translation
// [/comment]
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

// [comment]
// Point lights are also unaffected by rotation 
// [/comment]
class PointLight : public Light
{
    Vec3f pos;
public:
    PointLight(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : Light(l2w, c, i)
    { l2w.multVecMatrix(Vec3f(0), pos); }
    // P: is the shaded point
    void illuminate(const Vec3f &P, Vec3f &lightDir, Vec3f &lightIntensity, float &distance) const
    {
        lightDir = (P - pos);
        float r2 = lightDir.norm();
        distance = sqrt(r2);
        lightDir.x /= distance, lightDir.y /= distance, lightDir.z /= distance;
        // avoid division by 0
        lightIntensity = color * intensity / (4 * M_PI * r2);
    }
};

enum RayType { kPrimaryRay, kShadowRay };

struct IsectInfo
{
    const Object *hitObject = nullptr;
    float tNear = kInfinity;
    Vec2f uv;
    uint32_t index = 0;
};

bool trace(
    const Vec3f &orig, const Vec3f &dir,
    const std::vector<std::unique_ptr<Object>> &objects,
    IsectInfo &isect,
    RayType rayType = kPrimaryRay)
{
    isect.hitObject = nullptr;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        float tNear = kInfinity;
        uint32_t index = 0;
        Vec2f uv;
        if (objects[k]->intersect(orig, dir, tNear, index, uv) && tNear < isect.tNear) {
            if (rayType == kShadowRay && objects[k]->type == kReflectionAndRefraction) continue;
            isect.hitObject = objects[k].get();
            isect.tNear = tNear;
            isect.index = index;
            isect.uv = uv;
        }
    }

    return (isect.hitObject != nullptr);
}

// [comment]
// Compute reflection direction
// [/comment]
Vec3f reflect(const Vec3f &I, const Vec3f &N)
{
    return I - 2 * I.dotProduct(N) * N;
}

// [comment]
// Compute refraction direction
// [/comment]
Vec3f refract(const Vec3f &I, const Vec3f &N, const float &ior) 
{ 
    float cosi = clamp(-1, 1, I.dotProduct(N));
    float etai = 1, etat = ior; 
    Vec3f n = N; 
    if (cosi < 0) { cosi = -cosi; } else { std::swap(etai, etat); n= -N; } 
    float eta = etai / etat; 
    float k = 1 - eta * eta * (1 - cosi * cosi); 
    return k < 0 ? 0 : eta * I + (eta * cosi - sqrtf(k)) * n; 
}

// [comment]
// Evaluate Fresnel equation (ration of reflected light for a given incident direction and surface normal)
// [/comment]
void fresnel(const Vec3f &I, const Vec3f &N, const float &ior, float &kr) 
{ 
    float cosi = clamp(-1, 1, I.dotProduct(N));
    float etai = 1, etat = ior; 
    if (cosi > 0) { std::swap(etai, etat); } 
    // Compute sini using Snell's law
    float sint = etai / etat * sqrtf(std::max(0.f, 1 - cosi * cosi)); 
    // Total internal reflection
    if (sint >= 1) { 
        kr = 1; 
    } 
    else { 
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

Vec3f castRay(
    const Vec3f &orig, const Vec3f &dir,
    const std::vector<std::unique_ptr<Object>> &objects,
    const std::vector<std::unique_ptr<Light>> &lights,
    const Options &options,
    const uint32_t & depth = 0)
{
    if (depth > options.maxDepth) return options.backgroundColor;
    Vec3f hitColor = 0;
    IsectInfo isect;
    if (trace(orig, dir, objects, isect)) {
        // [comment]
        // Evaluate surface properties (P, N, texture coordinates, etc.)
        // [/comment]
        Vec3f hitPoint = orig + dir * isect.tNear;
        Vec3f hitNormal;
        Vec2f hitTexCoordinates;
        isect.hitObject->getSurfaceProperties(hitPoint, dir, isect.index, isect.uv, hitNormal, hitTexCoordinates);
        switch (isect.hitObject->type) {
            // [comment]
            // Simulate diffuse object
            // [/comment]
            case kDiffuse:
            {
                // [comment]
                // Light loop (loop over all lights in the scene and accumulate their contribution)
                // [/comment]
                for (uint32_t i = 0; i < lights.size(); ++i) {
                    Vec3f lightDir, lightIntensity;
                    IsectInfo isectShad;
                    lights[i]->illuminate(hitPoint, lightDir, lightIntensity, isectShad.tNear);
                    bool vis = !trace(hitPoint + hitNormal * options.bias, -lightDir, objects, isectShad, kShadowRay);
                    // compute the pattern
                    float angle = deg2rad(45);
                    float s = hitTexCoordinates.x * cos(angle) - hitTexCoordinates.y * sin(angle);
                    float t = hitTexCoordinates.y * cos(angle) + hitTexCoordinates.x * sin(angle);
                    float scaleS = 20, scaleT = 20;
                    #ifdef PATTERN_1
                    float pattern = (cos(hitTexCoordinates.y * 2 * M_PI * scaleT) * sin(hitTexCoordinates.x * 2 * M_PI * scaleS) + 1) * 0.5; // isect.hitObject->albedo
                    #endif
                    #ifdef PATTERN_2
                    float pattern = (modulo(s * scaleS) < 0.5) ^ (modulo(t * scaleT) < 0.5);
                    #endif
                    #ifdef PATTERN_3
                    float pattern = (modulo(s * scaleS) < 0.5);
                    #endif
                    hitColor += vis * pattern * lightIntensity * std::max(0.f, hitNormal.dotProduct(-lightDir));
                }
                break;
            }
            // [comment]
            // Simulate reflection only
            // [/comment]
            case kReflection:
            {
                Vec3f R = reflect(dir, hitNormal);
                R.normalize();
                break;
            }
            // [comment]
            // Simulate transparent object (reflection/transmission/fresnel)
            // [/comment]
            case kReflectionAndRefraction:
            {
                Vec3f refractionColor = 0, reflectionColor = 0;
                // compute fresnel
                float kr;
                fresnel(dir, hitNormal, isect.hitObject->ior, kr);
                bool outside = dir.dotProduct(hitNormal) < 0;
                Vec3f bias = options.bias * hitNormal;
                // compute refraction if it is not a case of total internal reflection
                if (kr < 1) {
                    Vec3f refractionDirection = refract(dir, hitNormal, isect.hitObject->ior).normalize();
                    Vec3f refractionRayOrig = outside ? hitPoint - bias : hitPoint + bias;
                    refractionColor = castRay(refractionRayOrig, refractionDirection, objects, lights, options, depth + 1);
                }
            
                Vec3f reflectionDirection = reflect(dir, hitNormal).normalize();
                Vec3f reflectionRayOrig = outside ? hitPoint + bias : hitPoint - bias;
                reflectionColor = castRay(reflectionRayOrig, reflectionDirection, objects, lights, options, depth + 1);
                
                // mix the two
                hitColor += reflectionColor * kr + refractionColor * (1 - kr);
                break;
            }
            default:
                break;
        }
    }
    else {
        hitColor = options.backgroundColor;
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
    const std::vector<std::unique_ptr<Light>> &lights)
{
    std::unique_ptr<Vec3f []> framebuffer(new Vec3f[options.width * options.height]);
    Vec3f *pix = framebuffer.get();
   /* image scale 
		define the field of view of the camera in terms of the angle α, and multiply the screen pixel 
		coordinates with the result of the tangent of this angle divided by two ( go from degres to rad )
		tan(fov / 2 * M_PI / 180)
	*/  
    float scale = tan(deg2rad(options.fov * 0.5));
    float imageAspectRatio = options.width / (float)options.height;
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
            Vec3f dir;
            options.cameraToWorld.multDirMatrix(Vec3f(x, y, -1), dir);
            // Normalization can be redused 
            // write the direction as a unit vector
			/* n = x * x + y * y + z * z;
        		if (n > 0) {
            	T factor = 1 / sqrt(n);
            	x *= factor, y *= factor, z *= factor; }
			*/
            dir.normalize();
            *(pix++) = castRay(orig, dir, objects, lights, options);
        }
        fprintf(stderr, "\r%3d%c", uint32_t(j / (float)options.height * 100), '%');
    }
    auto timeEnd = std::chrono::high_resolution_clock::now();
    auto passedTime = std::chrono::duration<double, std::milli>(timeEnd - timeStart).count();
    fprintf(stderr, "\rDone: %.2f (sec)\n", passedTime / 1000);
    
    // save framebuffer to file
    std::ofstream ofs;
    ofs.open("out.ppm");
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
    // loading gemetry
    std::vector<std::unique_ptr<Object>> objects;
    // lights
    std::vector<std::unique_ptr<Light>> lights;
    Options options;

#ifdef EXAMPLE_1
    // glass and pen example
    // setting up options
    options.fov = 36.87;
    options.maxDepth = 10;
    options.bias = 0.001;
    options.width = 1920;
    options.height = 1080;
    options.cameraToWorld = Matrix44f(-0.972776, 0, -0.231748, 0, -0.114956, 0.8683, 0.482536, 0, 0.201227, 0.49604, -0.844661, 0, 6.696465, 22.721296, -30.097976, 1);
    
    TriangleMesh *mesh1 = loadPolyMeshFromFile("./backdrop.geo", Matrix44f::kIdentity);
    if (mesh1 != nullptr) {
        mesh1->type = kDiffuse;
        objects.push_back(std::unique_ptr<Object>(mesh1));
    }
    
    TriangleMesh *mesh3 = loadPolyMeshFromFile("./cylinder.geo", Matrix44f::kIdentity);
    if (mesh3 != nullptr) {
        mesh3->type = kReflectionAndRefraction;
        mesh3->ior = 1.5;
        objects.push_back(std::unique_ptr<Object>(mesh3));
    }
    
    TriangleMesh *mesh4 = loadPolyMeshFromFile("./pen.geo", Matrix44f::kIdentity);
    if (mesh4 != nullptr) {
        mesh4->type = kDiffuse;
        mesh4->albedo = 0.18;
        mesh4->smoothShading = true;
        objects.push_back(std::unique_ptr<Object>(mesh4));
    }
    
    Matrix44f xform1;
    xform1[3][0] = -1.2;
    xform1[3][1] = 6;
    xform1[3][2] = -3;
    Sphere *sph1 = new Sphere(xform1, 5);
    sph1->type = kReflectionAndRefraction;
    Matrix44f l2w(11.146836, -5.781569, -0.0605886, 0, -1.902827, -3.543982, -11.895445, 0, 5.459804, 10.568624, -4.02205, 0, 0, 0, 0, 1);

#endif
#ifdef EXAMPLE_2
    // simple plane example (patterns)
    options.fov = 36.87;
    options.width = 1024;
    options.height = 747;
    options.cameraToWorld = Matrix44f(0.707107, 0, -0.707107, 0, -0.331295, 0.883452, -0.331295, 0, 0.624695, 0.468521, 0.624695, 0, 28, 21, 28, 1);
    
    TriangleMesh *mesh = loadPolyMeshFromFile("./plane.geo", Matrix44f::kIdentity);
    if (mesh != nullptr) {
        mesh->type = kDiffuse;
        mesh->albedo = 0.18;
        mesh->smoothShading = false;
        objects.push_back(std::unique_ptr<Object>(mesh));
    }
    Matrix44f l2w(11.146836, -5.781569, -0.0605886, 0, -1.902827, -3.543982, -11.895445, 0, 5.459804, 10.568624, -4.02205, 0, 0, 0, 0, 1);
#endif
#ifdef EXAMPLE_3
    // multiple glasses example
    options.fov = 36.87;
    options.width = 1920;
    options.height = 1080;
    options.cameraToWorld = Matrix44f(0.999945, 0, 0.0104718, 0, 0.00104703, 0.994989, -0.0999803, 0, -0.0104193, 0.0999858, 0.994934, 0, -0.978596, 17.911879, 75.483369, 1);
    
    TriangleMesh *mesh = loadPolyMeshFromFile("./glasses.geo", Matrix44f::kIdentity);
    if (mesh != nullptr) {
        mesh->type = kReflectionAndRefraction;
        mesh->ior = 1.3;
        objects.push_back(std::unique_ptr<Object>(mesh));
    }
    
    
    TriangleMesh *mesh1 = loadPolyMeshFromFile("./backdrop1.geo", Matrix44f::kIdentity);
    if (mesh1 != nullptr) {
        mesh1->type = kDiffuse;
        mesh1->albedo = 0.18;
        objects.push_back(std::unique_ptr<Object>(mesh1));
    }
    
    Matrix44f l2w(0.95292, 0.289503, 0.0901785, 0, -0.0960954, 0.5704, -0.815727, 0, -0.287593, 0.768656, 0.571365, 0, 0, 0, 0, 1);
#endif
#ifdef EXAMPLE_4
    // aliasing example
    options.fov = 36.87;
    options.width = 1024;
    options.height = 747;
    options.cameraToWorld = Matrix44f(0.999945, 0, 0.0104718, 0, 0.00104703, 0.994989, -0.0999803, 0, -0.0104193, 0.0999858, 0.994934, 0, -0.978596, 17.911879, 75.483369, 1);
    
    Matrix44f xform;
    xform[0][0] = 10;
    xform[1][1] = 10;
    xform[2][2] = 10;
    xform[3][2] = -40;
    TriangleMesh *mesh = loadPolyMeshFromFile("./plane.geo", xform);
    if (mesh != nullptr) {
        mesh->type = kDiffuse;
        mesh->albedo = 0.18;
        mesh->smoothShading = false;
        objects.push_back(std::unique_ptr<Object>(mesh));
    }
    Matrix44f l2w(11.146836, -5.781569, -0.0605886, 0, -1.902827, -3.543982, -11.895445, 0, 5.459804, 10.568624, -4.02205, 0, 0, 0, 0, 1);
#endif
    lights.push_back(std::unique_ptr<Light>(new DistantLight(l2w, 1, 1)));
    
    // finally, render
    render(options, objects, lights);

    return 0;
}