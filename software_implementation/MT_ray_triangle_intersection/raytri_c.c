#include<stdio.h>
#include<time.h>
#include<math.h>

inline
float deg2rad(const float &deg)
{ return deg * M_PI / 180; };

int main(int argc, char const *argv[])
{
	// time mesurement stuff
	clock_t start_comp, end_comp;
	double time_comp;

	// 1st triangle 
	int vo[3] = {-1, 0, -5};
	int v1[3] = { 1, 0, -5};
	int v2[3] = { 0, 2, -5};

	// 2nd triangle 
#ifdef DEMO_CULLING
  int vo_2[3] = { 1, 0, -5};
  int v1_2[3] = { 2,-2, -5};
  int v2_2[3] = { 0,-2, -5};    
#else
  int vo_2[3] = { 1, 0, -5};
  int v1_2[3] = { 0,-2, -5};
  int v2_2[3] = { 2,-2, -5}; 
#endif

	// 3nd triangle	
 #ifdef DEMO_CULLING   
  int vo_3[3] = {-1, 0, -5};
  int v1_3[3] = { 0,-2, -5};
  int v2_3[3] = {-2,-2, -5};   
#else
  int vo_3[3] = {-1, 0, -5};
  int v1_3[3] = {-2,-2, -5};
  int v2_3[3] = { 0,-2, -5}; 
#endif

  // scene resolution deceleration
	const unsigned int width = 1920;
	const unsigned int height = 1080;

	// object colour for each vector
	// colour is applied to the first vertex of the triangle and so on and so forth 
	float colours[3][3] = {{1.0, 0.0, 0.0}, {0.0, 1.0, 0.0}, {0.0, 0.0, 1.0}};

	// simulated framebuffer 
	float framebuffer[height][width];

	// set field of view 
	float fov = 51.52;

	// image scale 
	float scale = tan(deg2rad(fov * 0.5));

	// set aspect ratio 
	float imageAspectRatio = width / (float)height;

	// set origin at (0,0,0)
	int orig[3] = {0, 0, 0};

	// start timer 
	start_comp = clock();	

	return 0;
}
