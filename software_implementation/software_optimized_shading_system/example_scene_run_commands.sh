#Scene 1:  Glass and pen
echo -e "Scene 1:  Glass and pen\n"
./shading Glass_pen_scene/scene_glass_pen.sod 3 Glass_pen_scene/backdrop.geo Glass_pen_scene/backdrop.ood Glass_pen_scene/cylinder.geo Glass_pen_scene/cylinder.ood Glass_pen_scene/pen.geo Glass_pen_scene/pen.ood

./check_out Glass_pen_scene/gold.ppm out.ppm

#Scene 2:  Whole plane
echo -e "Scene 2:  Whole plane\n"
./shading Simple_plane_scene/scene_plane1.sod 1 Simple_plane_scene/plane.geo Simple_plane_scene/plane.ood
./check_out Simple_plane_scene/gold.ppm out.ppm

#Scene 3:  4 Glasses refraction
echo -e "Scene 3:  4 Glasses refraction\n"
./shading Glasses_scene/scene_glasses.sod 2 Glasses_scene/glasses.geo Glasses_scene/glasses.ood Glasses_scene/backdrop1.geo Glasses_scene/backdrop1.ood
./check_out Glasses_scene/gold.ppm out.ppm

#Scene 4:  4 Glasses refraction Point light
echo -e "Scene 4:  4 Glasses refraction Point light\n"
./shading Glasses_point_scene/scene_glasses_point.sod 2 Glasses_point_scene/glasses.geo Glasses_point_scene/glasses.ood Glasses_point_scene/backdrop1.geo Glasses_point_scene/backdrop1.ood
./check_out Glasses_point_scene/gold.ppm out.ppm

#Scene 5:  Horizontal Plane
echo -e "Scene 5:  Horizontal Plane\n"
./shading Simple_plane2_scene/scene_plane2.sod 1 Simple_plane2_scene/plane.geo Simple_plane2_scene/plane.ood
./check_out Simple_plane2_scene/gold.ppm out.ppm

#Scene 6:  Utah Teapod
echo -e "Scene 6:  Utah Teapod\n"
./shading Utah_teapot_scene/scene_teapot.sod 2 Utah_teapot_scene/teapot.geo Utah_teapot_scene/teapot.ood Utah_teapot_scene/plane.geo Utah_teapot_scene/plane.ood
./check_out Utah_teapot_scene/gold.ppm out.ppm

#Scene 7:	All MaterialS 
echo -e "Scene 7:  All MaterialS \n"
./shading All_materials_scene/scene_all_materials.sod 7 All_materials_scene/backdrop1.geo All_materials_scene/backdrop1.ood All_materials_scene/backdrop1.geo All_materials_scene/backdrop2.ood All_materials_scene/backdrop1.geo All_materials_scene/backdrop3.ood All_materials_scene/glasses.geo All_materials_scene/glasses.ood All_materials_scene/cylinder.geo All_materials_scene/cylinder.ood All_materials_scene/teapot.geo All_materials_scene/teapot1.ood All_materials_scene/teapot.geo All_materials_scene/teapot2.ood
./check_out All_materials_scene/gold.ppm out.ppm