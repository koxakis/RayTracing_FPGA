#Scene 1:  Glass and pen
echo -e "Scene 1:  Glass and pen\n"
./shading ../../test_scenes/Glass_pen_720_scene/scene_glass_pen.sod 3 ../../test_scenes/Glass_pen_720_scene/backdrop.geo ../../test_scenes/Glass_pen_720_scene/backdrop.ood ../../test_scenes/Glass_pen_720_scene/cylinder.geo ../../test_scenes/Glass_pen_720_scene/cylinder.ood ../../test_scenes/Glass_pen_720_scene/pen.geo ../../test_scenes/Glass_pen_720_scene/pen.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Glass_pen_720_scene/gold.ppm

#Scene 2:  Whole plane
echo -e "Scene 2:  Whole plane\n"
./shading ../../test_scenes/Simple_plane_720_scene/scene_plane1.sod 1 ../../test_scenes/Simple_plane_720_scene/plane.geo ../../test_scenes/Simple_plane_720_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Simple_plane_720_scene/gold.ppm

#Scene 3:  4 Glasses refraction
echo -e "Scene 3:  4 Glasses refraction\n"
./shading ../../test_scenes/Glasses_720_scene/scene_glasses.sod 2 ../../test_scenes/Glasses_720_scene/glasses.geo ../../test_scenes/Glasses_720_scene/glasses.ood ../../test_scenes/Glasses_720_scene/backdrop1.geo ../../test_scenes/Glasses_720_scene/backdrop1.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Glasses_720_scene/gold.ppm

#Scene 4:  4 Glasses refraction Point light
echo -e "Scene 4:  4 Glasses refraction Point light\n"
./shading ../../test_scenes/Glasses_point_720_scene/scene_glasses_point.sod 2 ../../test_scenes/Glasses_point_720_scene/glasses.geo ../../test_scenes/Glasses_point_720_scene/glasses.ood ../../test_scenes/Glasses_point_720_scene/backdrop1.geo ../../test_scenes/Glasses_point_720_scene/backdrop1.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Glasses_point_720_scene/gold.ppm

#Scene 5:  Horizontal Plane
echo -e "Scene 5:  Horizontal Plane\n"
./shading ../../test_scenes/Simple_plane2_720_scene/scene_plane2.sod 1 ../../test_scenes/Simple_plane2_720_scene/plane.geo ../../test_scenes/Simple_plane2_720_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Simple_plane2_720_scene/gold.ppm

#Scene 6:  Utah Teapod
echo -e "Scene 6:  Utah Teapod\n"
./shading ../../test_scenes/Utah_teapot_720_scene/scene_teapot.sod 2 ../../test_scenes/Utah_teapot_720_scene/teapot.geo ../../test_scenes/Utah_teapot_720_scene/teapot.ood ../../test_scenes/Utah_teapot_720_scene/plane.geo ../../test_scenes/Utah_teapot_720_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Utah_teapot_720_scene/gold.ppm

#Scene 7: All MaterialS
echo -e "Scene 7:  All MaterialS \n" 
./shading ../../test_scenes/All_materials_720_scene/scene_all_materials.sod 7 ../../test_scenes/All_materials_720_scene/backdrop1.geo ../../test_scenes/All_materials_720_scene/backdrop1.ood ../../test_scenes/All_materials_720_scene/backdrop1.geo ../../test_scenes/All_materials_720_scene/backdrop2.ood ../../test_scenes/All_materials_720_scene/backdrop1.geo ../../test_scenes/All_materials_720_scene/backdrop3.ood ../../test_scenes/All_materials_720_scene/glasses.geo ../../test_scenes/All_materials_720_scene/glasses.ood ../../test_scenes/All_materials_720_scene/cylinder.geo ../../test_scenes/All_materials_720_scene/cylinder.ood ../../test_scenes/All_materials_720_scene/teapot.geo ../../test_scenes/All_materials_720_scene/teapot1.ood ../../test_scenes/All_materials_720_scene/teapot.geo ../../test_scenes/All_materials_720_scene/teapot2.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/All_materials_720_scene/gold.ppm