// Perform the MT Ray triangle intersecion and return u, v coordinates if intersection occurs
#include "hls_half.h"
typedef half fp_16;
bool rayTI(
	const float &orig_x_i,
	const float &orig_y_i,
	const float &orig_z_i,
	const float &dir_x_i,
	const float &dir_y_i,
	const float &dir_z_i,
	const float &v0_x_i,
	const float &v0_y_i,
	const float &v0_z_i,
	const float &v1_x_i,
	const float &v1_y_i,
	const float &v1_z_i,
	const float &v2_x_i,
	const float &v2_y_i,
	const float &v2_z_i,
	float &t, float &u, float &v)
{
// orig ports
#pragma HLS INTERFACE s_axilite port=orig_x_i bundle=orig_bundle
#pragma HLS INTERFACE s_axilite port=orig_y_i bundle=orig_bundle
#pragma HLS INTERFACE s_axilite port=orig_z_i bundle=orig_bundle

// dir ports
#pragma HLS INTERFACE s_axilite port=dir_x_i bundle=dir_bundle
#pragma HLS INTERFACE s_axilite port=dir_y_i bundle=dir_bundle
#pragma HLS INTERFACE s_axilite port=dir_z_i bundle=dir_bundle

// v0 ports
#pragma HLS INTERFACE s_axilite port=v0_x_i bundle=v0_bundle
#pragma HLS INTERFACE s_axilite port=v0_y_i bundle=v0_bundle
#pragma HLS INTERFACE s_axilite port=v0_z_i bundle=v0_bundle

// v1 ports
#pragma HLS INTERFACE s_axilite port=v1_x_i bundle=v1_bundle
#pragma HLS INTERFACE s_axilite port=v1_y_i bundle=v1_bundle
#pragma HLS INTERFACE s_axilite port=v1_z_i bundle=v1_bundle

// v2 ports
#pragma HLS INTERFACE s_axilite port=v2_x_i bundle=v2_bundle
#pragma HLS INTERFACE s_axilite port=v2_y_i bundle=v2_bundle
#pragma HLS INTERFACE s_axilite port=v2_z_i bundle=v2_bundle

// result ports
#pragma HLS INTERFACE s_axilite port=t bundle=res_bundle
#pragma HLS INTERFACE s_axilite port=u bundle=res_bundle
#pragma HLS INTERFACE s_axilite port=v bundle=res_bundle
#pragma HLS INTERFACE s_axilite bundle=ret_bundle port=return

	//float to half
	half orig_x = (half) orig_x_i;
	half orig_y = (half) orig_y_i;
	half orig_z = (half) orig_z_i;
	
	half dir_x = (half) dir_x_i;
	half dir_y = (half) dir_y_i;
	half dir_z = (half) dir_z_i;

	half v0_x = (half) v0_x_i;
	half v0_y = (half) v0_y_i;
	half v0_z = (half) v0_z_i;

	half v1_x = (half) v1_x_i;
	half v1_y = (half) v1_y_i;
	half v1_z = (half) v1_z_i;

	half v2_x = (half) v2_x_i;
	half v2_y = (half) v2_y_i;
	half v2_z = (half) v2_z_i;

	// find if the ray intersects the triangle 
	half local_t;
	half local_u;
	half local_v;
	static const half kEpsilon = (half)1e-8;
	// find the triangles normal
	// E1 in equation
	//Vec3f v0v1 = v1 - v0;
	half v0v1_x = v1_x - v0_x;
	half v0v1_y = v1_y - v0_y;
	half v0v1_z = v1_z - v0_z;
	// E2 in equation
	//Vec3f v0v2 = v2 - v0;
	half v0v2_x = v2_x - v0_x;
	half v0v2_y = v2_y - v0_y;
	half v0v2_z = v2_z - v0_z;
	// P in the equation
	// y * v.z - z * v.y,
	// z * v.x - x * v.z,
	// x * v.y - y * v.x
	//Vec3f pvec = dir.crossProduct(v0v2);
	half pvec_x = (dir_y * v0v2_z) - (dir_z * v0v2_y);
	half pvec_y = (dir_z * v0v2_x) - (dir_x * v0v2_z);
	half pvec_z = (dir_x * v0v2_y) - (dir_y * v0v2_x);
	// the user might want to cull (discard) back-facing triangles
	// if the triangle is front-facing the determinant is positive otherwise it is negative
	// P*E1 in the equation 
	// x * v.x + y * v.y + z * v.z
  //half det = v0v1.dotProduct(pvec);
	half det = (v0v1_x * pvec_x) + (v0v1_y * pvec_y) + (v0v1_z * pvec_z);

	// Deactivate CULLING in order to render back facing triangles as well
	// Useful for secondary rays can be neglected for primary rays
#ifdef CULLING
    // if the determinant is negative the triangle is backfacing
    // if the determinant is close to 0, the ray misses the triangle
    if (det < kEpsilon) return false;
#else
    // ray and triangle are parallel if det is close to 0
    if ((det > -kEpsilon) && (det < kEpsilon)) return false;
#endif

	// compute once and multiply to find u,v and t
	// 1/P*E1 in the equation 
	half invDet = 1 / det;

	// translate to the unit triangle 
	half tvec_x = orig_x - v0_x;
	half tvec_y = orig_y - v0_y;
	half tvec_z = orig_z - v0_z;
	// compute u from (T dotproduct P) * 1/P*E1
	local_u = ( (tvec_x * pvec_x) + (tvec_y * pvec_y) + (tvec_z * pvec_z)) * invDet;
	//u = tvec.dotProduct(pvec) * invDet;
	// we reject the triangle if u is either lower than 0 or greater than 1
	if (local_u< 0 || local_u > 1)
		{
			// half to float 
			u = (float) local_u;
			return false;
		}

	// Q in the equation 
	//Vec3f qvec = tvec.crossProduct(v0v1);
	half qvec_x = (tvec_y * v0v1_z) - (tvec_z * v0v1_y);
	half qvec_y = (tvec_z * v0v1_x) - (tvec_x * v0v1_z);
	half qvec_z = (tvec_x * v0v1_y) - (tvec_y * v0v1_x);
	// compute v from (D dotproduct Q) * 1/P*E1 
	//v = dir.dotProduct(qvec) * invDet;
	local_v = ( (dir_x * qvec_x) + (dir_y * qvec_y) + (dir_z * qvec_z)) * invDet;
	// we reject the triangle if v is either lower than 0 or greater than 1
	if (local_v < 0 || local_u + local_v > 1)
		{
			// half to float 
			v = (float) local_v;
			u = (float) local_u;
			return false;
		}

	// compute t from (E2 dotproduct Q) * 1/P*E1 
	//t = v0v2.dotProduct(qvec) * invDet;
	local_t = ( (v0v2_x * qvec_x) + (v0v2_y * qvec_y) + (v0v2_z * qvec_z)) * invDet;
	
	if ( local_t > 0)
		{
			// half to float 
			v = (float) local_v;
			u = (float) local_u;
			t = (float) local_t;
			return true;
		}
	else
		{
			// half to float 
			v = (float) local_v;
			u = (float) local_u;
			t = (float) local_t;
			return false;
		}
}
