#include "geometry.h"
#include <string.h>

// Perform the MT Ray triangle intersecion and return u, v coordinates if intersection occurs 
bool rayTriangleIntersect(
	const Vec3f &orig, const Vec3f &dir,
	const Vec3f &v0, const Vec3f &v1, const Vec3f &v2,
	float &t, float &u, float &v)
{
  
	static const float kEpsilon = 1e-8;
	// Result ports
	#pragma HLS INTERFACE s_axilite port=return bundle=ret_bundle
	#pragma HLS INTERFACE m_axi depth=32 port=v offset=slave bundle=res_v_bundle
	#pragma HLS INTERFACE m_axi depth=32 port=u offset=slave bundle=res_u_bundle
	#pragma HLS INTERFACE m_axi depth=32 port=t offset=slave bundle=res_t_bundle

	// Triangle ports
	#pragma HLS INTERFACE m_axi depth=128 port=v2 offset=slave bundle=triangle_v2_bundle
	#pragma HLS INTERFACE m_axi depth=128 port=v1 offset=slave bundle=triangle_v1_bundle
	#pragma HLS INTERFACE m_axi depth=128 port=v0 offset=slave bundle=triangle_v0_bundle

	// Ray ports
	#pragma HLS INTERFACE m_axi depth=128 port=orig offset=slave bundle=ray_orig_bundle
	#pragma HLS INTERFACE m_axi depth=128 port=dir offset=slave bundle=ray_dir_bundle
	// find if the ray intersects the triangle 

	// Transfer data with memcpy
	Vec3f orig_local;
	memcpy((Vec3f *)&orig_local, &orig, sizeof(Vec3f));

	Vec3f dir_local;
	memcpy((Vec3f *)&dir_local, &dir, sizeof(Vec3f));

	Vec3f v2_local;
	memcpy((Vec3f *)&v2_local, &v2, sizeof(Vec3f));

	Vec3f v1_local;
	memcpy((Vec3f *)&v1_local, &v1, sizeof(Vec3f));

	Vec3f v0_local;
	memcpy((Vec3f *)&v0_local, &v0, sizeof(Vec3f));

	// find the triangles normal
	// E1 in equation
	Vec3f v0v1 = v1_local - v0_local;
	// E2 in equation
	Vec3f v0v2 = v2_local - v0_local;
	// P in the equation
	// y * v.z - z * v.y, z * v.x - x * v.z, x * v.y - y * v.x
	Vec3f pvec = dir_local.crossProduct(v0v2);
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
	if ((det > -kEpsilon) && (det < kEpsilon)) return false;
    //if (fabs(det) < kEpsilon) return false;
#endif

	// compute once and multiply to find u,v and t
	// 1/P*E1 in the equation 
	float invDet = 1 / det;

	// translate to the unit triangle 
	Vec3f tvec = orig_local - v0_local;
	// compute u from (T dotproduct P) * 1/P*E1
	u = tvec.dotProduct(pvec) * invDet;
	// we reject the triangle if u is either lower than 0 or greater than 1
	if (u < 0 || u > 1) return false;

	// Q in the equation 
	Vec3f qvec = tvec.crossProduct(v0v1);
	// compute v from (D dotproduct Q) * 1/P*E1 
	v = dir_local.dotProduct(qvec) * invDet;
	// we reject the triangle if v is either lower than 0 or greater than 1
	if (v < 0 || u + v > 1) return false;

	// compute t from (E2 dotproduct Q) * 1/P*E1 
	t = v0v2.dotProduct(qvec) * invDet;
	
	return (t > 0) ? true : false;
}

