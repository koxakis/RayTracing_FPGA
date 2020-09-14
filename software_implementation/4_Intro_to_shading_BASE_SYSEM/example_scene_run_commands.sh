#Scene 1:  Glass and pen
echo -e "Scene 1:  Glass and pen\n"
./shading Glass_pen_scene/scene.sod 3 Glass_pen_scene/backdrop.geo Glass_pen_scene/backdrop.ood Glass_pen_scene/cylinder.geo Glass_pen_scene/cylinder.ood Glass_pen_scene/pen.geo Glass_pen_scene/pen.ood

./check_out Glass_pen_scene/gold.ppm out.ppm

#Scene 2:  Whole plane
echo -e "Scene 2:  Whole plane\n"
./shading Simple_plane_scene/scene.sod 1 Simple_plane_scene/plane.geo Simple_plane_scene/plane.ood
./check_out Simple_plane_scene/gold.ppm out.ppm

#Scene 3:  4 Glasses refraction
echo -e "Scene 3:  4 Glasses refraction\n"
./shading Glasses_scene/scene.sod 2 Glasses_scene/glasses.geo Glasses_scene/glasses.ood Glasses_scene/backdrop1.geo Glasses_scene/backdrop1.ood
./check_out Glasses_scene/gold.ppm out.ppm

#Scene 4:  Horizontal Plane
echo -e "Scene 4:  Horizontal Plane\n"
./shading Simple_plane2_scene/scene.sod 1 Simple_plane2_scene/plane.geo Simple_plane2_scene/plane.ood
./check_out Simple_plane2_scene/gold.ppm out.ppm

#Scene 5:  Utah Teapod
echo -e "Scene 5:  Utah Teapod\n"
./shading Utah_teapot_scene/teapot.sod 2 Utah_teapot_scene/teapot.geo Utah_teapot_scene/teapot.ood Utah_teapot_scene/plane.geo Utah_teapot_scene/plane.ood
./check_out Utah_teapot_scene/gold.ppm out.ppm

#Scene 6:	Balls
#TBA
