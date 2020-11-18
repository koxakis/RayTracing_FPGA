// Perform the MT Ray triangle intersecion and return u, v coordinates if intersection occurs
bool rayTI(
	const float &orig_x,
	const float &orig_y,
	const float &orig_z,
	const float &dir_x,
	const float &dir_y,
	const float &dir_z,
	const float &v0_x,
	const float &v0_y,
	const float &v0_z,
	const float &v1_x,
	const float &v1_y,
	const float &v1_z,
	const float &v2_x,
	const float &v2_y,
	const float &v2_z,
	float &t, float &u, float &v)
{
// orig ports
#pragma HLS INTERFACE s_axilite depth=32 port=orig_x bundle=orig_bundle 
#pragma HLS INTERFACE s_axilite depth=32 port=orig_y bundle=orig_bundle 
#pragma HLS INTERFACE s_axilite depth=32 port=orig_z bundle=orig_bundle 

// dir ports
#pragma HLS INTERFACE s_axilite depth=32 port=dir_x bundle=dir_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=dir_y bundle=dir_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=dir_z bundle=dir_bundle

// v0 ports
#pragma HLS INTERFACE s_axilite depth=32 port=v0_x bundle=v0_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v0_y bundle=v0_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v0_z bundle=v0_bundle

// v1 ports
#pragma HLS INTERFACE s_axilite depth=32 port=v1_x bundle=v1_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v1_y bundle=v1_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v1_z bundle=v1_bundle

// v2 ports
#pragma HLS INTERFACE s_axilite depth=32 port=v2_x bundle=v2_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v2_y bundle=v2_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v2_z bundle=v2_bundle

// result ports
#pragma HLS INTERFACE s_axilite depth=32 port=t bundle=res_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=u bundle=res_bundle
#pragma HLS INTERFACE s_axilite depth=32 port=v bundle=res_bundle
#pragma HLS INTERFACE s_axilite port=return bundle=ret_bundle

	// find if the ray intersects the triangle 
	float local_t;
	float local_u;
	float local_v;
	static const float kEpsilon = 1e-8;
	// find the triangles normal
	// E1 in equation
	//Vec3f v0v1 = v1 - v0;
	float v0v1_x = v1_x - v0_x;
	float v0v1_y = v1_y - v0_y;
	float v0v1_z = v1_z - v0_z;
	// E2 in equation
	//Vec3f v0v2 = v2 - v0;
	float v0v2_x = v2_x - v0_x;
	float v0v2_y = v2_y - v0_y;
	float v0v2_z = v2_z - v0_z;
	// P in the equation
	// y * v.z - z * v.y,
	// z * v.x - x * v.z,
	// x * v.y - y * v.x
	//Vec3f pvec = dir.crossProduct(v0v2);
	float pvec_x = (dir_y * v0v2_z) - (dir_z * v0v2_y);
	float pvec_y = (dir_z * v0v2_x) - (dir_x * v0v2_z);
	float pvec_z = (dir_x * v0v2_y) - (dir_y * v0v2_x);
	// the user might want to cull (discard) back-facing triangles
	// if the triangle is front-facing the determinant is positive otherwise it is negative
	// P*E1 in the equation 
	// x * v.x + y * v.y + z * v.z
  //float det = v0v1.dotProduct(pvec);
	float det = (v0v1_x * pvec_x) + (v0v1_y * pvec_y) + (v0v1_z * pvec_z);

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
	float invDet = 1 / det;

	// translate to the unit triangle 
	float tvec_x = orig_x - v0_x;
	float tvec_y = orig_y - v0_y;
	float tvec_z = orig_z - v0_z;
	// compute u from (T dotproduct P) * 1/P*E1
	local_u = ( (tvec_x * pvec_x) + (tvec_y * pvec_y) + (tvec_z * pvec_z)) * invDet;
	//u = tvec.dotProduct(pvec) * invDet;
	// we reject the triangle if u is either lower than 0 or greater than 1
	if (local_u< 0 || local_u > 1)
		{
			u = local_u;
			return false;
		}

	// Q in the equation 
	//Vec3f qvec = tvec.crossProduct(v0v1);
	float qvec_x = (tvec_y * v0v1_z) - (tvec_z * v0v1_y);
	float qvec_y = (tvec_z * v0v1_x) - (tvec_x * v0v1_z);
	float qvec_z = (tvec_x * v0v1_y) - (tvec_y * v0v1_x);
	// compute v from (D dotproduct Q) * 1/P*E1 
	//v = dir.dotProduct(qvec) * invDet;
	local_v = ( (dir_x * qvec_x) + (dir_y * qvec_y) + (dir_z * qvec_z)) * invDet;
	// we reject the triangle if v is either lower than 0 or greater than 1
	if (local_v < 0 || local_u + local_v > 1)
		{
			v = local_v;
			u = local_u;
			return false;
		}

	// compute t from (E2 dotproduct Q) * 1/P*E1 
	//t = v0v2.dotProduct(qvec) * invDet;
	local_t = ( (v0v2_x * qvec_x) + (v0v2_y * qvec_y) + (v0v2_z * qvec_z)) * invDet;
	
	if ( local_t > 0)
		{
			v = local_v;
			u = local_u;
			t = local_t;
			return true;
		}
	else
		{
			v = local_v;
			u = local_u;
			t = local_t;
			return false;
		}
}
