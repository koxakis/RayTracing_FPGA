//[header]
// A simple program that uses ray-tracing to render a single triangle
//[/header]
//[compile]
// Download the raytri.cpp and geometry.h files to a folder.
// Open a shell/terminal, and run the following command where the files is saved:
//
// c++ -o raytri raytri.cpp -O3 -std=c++11 -DMOLLER_TRUMBORE
//
// Run with: ./raytri. Open the file ./out.png in Photoshop or any program
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
#include <limits>
#include <random>
#include <time.h>

#include "geometry.h"

#define CULLING
#define MOLLER_TRUMBORE

// change the orientation of the triangles from CCR to CR to demo culling
//#define DEMO_CULLING

using namespace std;

constexpr float kEpsilon = 1e-8;

inline
float deg2rad(const float &deg)
{ return deg * M_PI / 180; }

// In computer graphics, clamping is the process of limiting a position to an area. Unlike wrapping, 
//  clamping merely moves the point to the nearest available value.
inline
float clamp(const float &lo, const float &hi, const float &v)
{ return std::max(lo, std::min(hi, v)); }

// [comment]
// The main ray-triangle intersection routine.
// [/comment]
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

int main(int argc, char **argv)
{
    // time mesurement stuff
    clock_t start_comp, end_comp;
    double time_comp;

    // object coordinates deceleration    
    Vec3f v0( 0, 2, -5);
    Vec3f v1(-1, 0, -5);
    Vec3f v2( 1, 0, -5);

    // hackish way to add a extra triangles 

    // object coordinates deceleration
    /* order of deceleration is key in order to be forward facing or backward enable a demo by adding 
        DEMO_CULLING define. With the demo on the 2nd and 3rd triangles are backfacing and are therefore
        not being rendered.
    */ 
 #ifdef DEMO_CULLING
    Vec3f v0_2( 1, 0, -5);
    Vec3f v1_2( 2,-2, -5);
    Vec3f v2_2( 0,-2, -5);    
#else
    Vec3f v0_2( 1, 0, -5);
    Vec3f v1_2( 0,-2, -5);
    Vec3f v2_2( 2,-2, -5); 
#endif

    // object coordinates deceleration
 #ifdef DEMO_CULLING   
    Vec3f v0_3( -1, 0, -5);
    Vec3f v1_3( 0, -2, -5);
    Vec3f v2_3( -2,-2, -5);   
#else
    Vec3f v0_3(-1, 0, -5);
    Vec3f v1_3(-2,-2, -5);
    Vec3f v2_3( 0,-2, -5); 
#endif 

    // scene resolution deceleration ( HD resolutions are the target with the min being 1280*720 )
    const uint32_t width = 1920;
    const uint32_t height = 1080;

    // object colour for each vector
    // colour is applied to the first vertex of the triangle and so on and so forth 

    //{red,green,blue}  Bottom left       Bottom right    Top 
    Vec3f cols[3] = {{0.0, 0.9, 0.0}, {0.9, 0.0, 0.0}, {0.0, 0.0, 0.9}};
 
	Vec3f cols_2[3] = {{0.0, 0.0, 0.9}, {0.0, 0.9, 0.0}, {0.9, 0.0, 0.0}};

    Vec3f cols_3[3] = {{0.9, 0.0, 0.0}, {0.0, 0.0, 0.9}, {0.0, 0.9, 0.0}};


    // frame buffer array deceleration as an Vec3f object, each pixel is a vector with 3 length 
    Vec3f *framebuffer = new Vec3f[width * height];
    Vec3f *pix = framebuffer;

    // set field of view 
    /* Below the scene is set with the attributes such as scale, image aspec ratio set in such a way
		that the rendered image resembles the pinhole camera model 
    */

   	/* calculated based on 90 degrees of horizontal FOV
        usual values 30-45 70 90-100
	*/
	float fov = 90;

    /* image scale 
		define the field of view of the camera in terms of the angle α, and multiply the screen pixel 
		coordinates with the result of the tangent of this angle divided by two ( go from degres to rad )
		tan(fov / 2 * M_PI / 180)
	*/
    float scale = tan(deg2rad(fov * 0.5));

    // set aspect ratio in order to account for non square images  
    float imageAspectRatio = width / (float)height;

    // the default position of a camera when it is created is the origin of the world with the origin at (0,0,0)
    Vec3f orig(0);

    // start timer in order to benchmark how much time a single simple frame needs to render  
    start_comp = clock();

    /*
        optimization point, skip unnecessary pixels 
    */
    for (uint32_t j = 0; j < height; ++j) {
        for (uint32_t i = 0; i < width; ++i) {
            
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
            float x = (2 * (i + 0.5) / (float)width - 1) * imageAspectRatio * scale;
            float y = (1 - 2 * (j + 0.5) / (float)height) * scale;

            // ray direction 
            // By convention, we will also orient the camera along the negative z-axis
            Vec3f dir(x, y, -1);

            // Normalization can be redused 
            // write the direction as a unit vector
			/* n = x * x + y * y + z * z;
        		if (n > 0) {
            	T factor = 1 / sqrt(n);
            	x *= factor, y *= factor, z *= factor; }
			*/
            dir.normalize();

            // t distance to origin of ray
            // u, v side of unit triangle 
            float t, u, v;
            

            if (rayTriangleIntersect(orig, dir, v0, v1, v2, t, u, v)) {
                // [comment]
                // Interpolate colors using the barycentric coordinates
                // [/comment]
                *pix = u * cols[0] + v * cols[1] + (1 - u - v) * cols[2];
                // uncomment this line if you want to visualize the row barycentric coordinates
                //*pix = Vec3f(u, v, 1 - u - v);
            }

            if (rayTriangleIntersect(orig, dir, v0_2, v1_2, v2_2, t, u, v)) {
                // [comment]
                // Interpolate colors using the barycentric coordinates
                // [/comment]
                *pix = u * cols_2[0] + v * cols_2[1] + (1 - u - v) * cols_2[2];
                // uncomment this line if you want to visualize the row barycentric coordinates
                // *pix = Vec3f(u, v, 1 - u - v);
            }

            if (rayTriangleIntersect(orig, dir, v0_3, v1_3, v2_3, t, u, v)) {
                // [comment]
                // Interpolate colors using the barycentric coordinates
                // [/comment]
                *pix = u * cols_3[0] + v * cols_3[1] + (1 - u - v) * cols_3[2];
                // uncomment this line if you want to visualize the row barycentric coordinates
                // *pix = Vec3f(u, v, 1 - u - v);
            }  
            pix++;
        }
    }  

    // end timer 
    end_comp = clock();

    time_comp = double(end_comp - start_comp) / double(CLOCKS_PER_SEC);
    cout << "Time taken by computation for the whole frame is : " << fixed << time_comp << setprecision(5);
    
    cout << " sec ( 0.03333 sec required per frame for 30 FPS )" << endl; 
    
    // save result to a PPM image (keep these flags if you compile under Windows)
    std::ofstream ofs("./out.ppm", std::ios::out | std::ios::binary);
    ofs << "P6\n" << width << " " << height << "\n255\n";
    for (uint32_t i = 0; i < height * width; ++i) {
        char r = (char)(255 * clamp(0, 1, framebuffer[i].x));
        char g = (char)(255 * clamp(0, 1, framebuffer[i].y));
        char b = (char)(255 * clamp(0, 1, framebuffer[i].z));
        ofs << r << g << b;
    }

    ofs.close();

    delete [] framebuffer;

    return 0;
}
