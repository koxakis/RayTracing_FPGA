// Perform the MT Ray triangle intersecion and return u, v coordinates if intersection occurs
#include <string.h>

bool rayTI(
	float *inputTriangleVertexPos,
	unsigned int *inputTriangleVertexIndex,
	float *inputStaticArray,
	float &out_u,
	float &out_v,
	float &out_t,
	unsigned int &outTris
	)
{
// Port decleration
// Output triangle index
#pragma HLS INTERFACE s_axilite bundle=out_tris_bundle port=outTris
// Output t
#pragma HLS INTERFACE s_axilite bundle=out_t_bundle port=out_t
// Output v
#pragma HLS INTERFACE s_axilite bundle=out_v_bundle port=out_v
// Output u 
#pragma HLS INTERFACE s_axilite bundle=out_u_bundle port=out_u

// Static input data array 
#pragma HLS INTERFACE m_axi depth=9 bundle=static_in_bundle port=inputStaticArray offset=slave
// Vertex index array
#pragma HLS INTERFACE m_axi depth=6000 bundle=vertex_index_bubdle port=inputTriangleVertexIndex offset=slave
// Vertex position array
#pragma HLS INTERFACE m_axi depth=3000 bundle=vertex_pos_bundle port=inputTriangleVertexPos offset=slave
// Retern port
#pragma HLS INTERFACE s_axilite port=return bundle=ret_bundle


	static const float kEpsilon = 1e-8;

	// Local registers
	bool temp_ret;
	bool out_ret = false;
	unsigned int j = 0;
	unsigned int index;

	float orig_x  = inputStaticArray[0];
	float orig_y  = inputStaticArray[1];
	float orig_z  = inputStaticArray[2];

	float dir_x  = inputStaticArray[3];
	float dir_y  = inputStaticArray[4];
	float dir_z  = inputStaticArray[5];
	float tNear = inputStaticArray[6];
	unsigned int numTris = (unsigned int) inputStaticArray[7];
	unsigned int local_maxVertIndex = (unsigned int) inputStaticArray[8];

	// Simulating memcpy-burst and transfer to local buffer

	// Acount for the number of vertex positions
	float localinputTriangleVertexPos [3000];
//#pragma HLS ARRAY_PARTITION variable=localinputTriangleVertexPos dim=1 factor=9 cyclic
	// Acount for the number of vertex Index
	unsigned int localinputTriangleVertexIndex [6000];
//#pragma HLS ARRAY_PARTITION variable=localinputTriangleVertexIndex dim=1 factor=9 cyclic

	// Transfer Vertex position array
	memcpy((float *)&localinputTriangleVertexPos[0], &inputTriangleVertexPos[0], ((local_maxVertIndex*3)*sizeof(float)) );
	// Transfer Vertex index
	memcpy((unsigned int*)&localinputTriangleVertexIndex[0], &inputTriangleVertexIndex[0], (numTris*3)*sizeof(unsigned int));

	TRIANGLE_TRAVERSAL: for (unsigned int i = 0; i < numTris; ++i) 
		{
//#pragma HLS DATAFLOW didnt work 
//#pragma HLS UNROLL factor=4
#pragma HLS PIPELINE II=1
			/* Access each vertex from the index of each triangle taking into acount that 
			each vertex takes up 3 positons 
			*/
			index = localinputTriangleVertexIndex[j] * 3;
			const float v0_x = localinputTriangleVertexPos[index];
			const float v0_y = localinputTriangleVertexPos[index+1];
			const float v0_z = localinputTriangleVertexPos[index+2];

			index = localinputTriangleVertexIndex[j+1] * 3;
			const float v1_x = localinputTriangleVertexPos[index];
			const float v1_y = localinputTriangleVertexPos[index+1];
			const float v1_z = localinputTriangleVertexPos[index+2];

			index = localinputTriangleVertexIndex[j+2] * 3;
			const float v2_x = localinputTriangleVertexPos[index];
			const float v2_y = localinputTriangleVertexPos[index+1];
			const float v2_z = localinputTriangleVertexPos[index+2];

			float t , u, v;
			/* a ray may intersect more than one triangle from the mesh therefore we also 
			need to keep track of the nearest intersection distance as we iterate over the triangles.            
			*/

			// find if the ray intersects the triangle 

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
				if (det < kEpsilon) 					
					{
						temp_ret = false;
						j += 3;
						continue;
					}
#else
				// ray and triangle are parallel if det is close to 0
				if ((det > -kEpsilon) && (det < kEpsilon))
					{
						temp_ret = false;
						j += 3;
						continue;
					}
#endif

			// compute once and multiply to find u,v and t
			// 1/P*E1 in the equation 
			float invDet = 1 / det;

			// translate to the unit triangle 
			float tvec_x = orig_x - v0_x;
			float tvec_y = orig_y - v0_y;
			float tvec_z = orig_z - v0_z;
			// compute u from (T dotproduct P) * 1/P*E1
			u = ( (tvec_x * pvec_x) + (tvec_y * pvec_y) + (tvec_z * pvec_z)) * invDet;
			//u = tvec.dotProduct(pvec) * invDet;
			// we reject the triangle if u is either lower than 0 or greater than 1
			if (u< 0 || u > 1) 
				{
					temp_ret = false;
					j += 3;
					continue;
				}

			// Q in the equation 
			//Vec3f qvec = tvec.crossProduct(v0v1);
			float qvec_x = (tvec_y * v0v1_z) - (tvec_z * v0v1_y);
			float qvec_y = (tvec_z * v0v1_x) - (tvec_x * v0v1_z);
			float qvec_z = (tvec_x * v0v1_y) - (tvec_y * v0v1_x);
			// compute v from (D dotproduct Q) * 1/P*E1 
			//v = dir.dotProduct(qvec) * invDet;
			v = ( (dir_x * qvec_x) + (dir_y * qvec_y) + (dir_z * qvec_z)) * invDet;
			// we reject the triangle if v is either lower than 0 or greater than 1
			if (v < 0 || u + v > 1) 
				{
					temp_ret = false;
					j += 3;
					continue;
				}

			// compute t from (E2 dotproduct Q) * 1/P*E1 
			//t = v0v2.dotProduct(qvec) * invDet;
			t = ( (v0v2_x * qvec_x) + (v0v2_y * qvec_y) + (v0v2_z * qvec_z)) * invDet;
				
			if ( t > 0)
				{
					temp_ret = true;
				}
			
			// Output ports 
			if ( (temp_ret) && t < tNear) 
				{
					out_u = u;
					out_v = v;

					outTris = i;
					out_t = t;

					out_ret = temp_ret;
					tNear = t;
				}                                                                                                                                                                                                                                
			j += 3;
		}

	return out_ret;

}
