#Scene 1:  Glass and pen
echo -e "Scene 1:  Glass and pen\n"
./shading ../../test_scenes/Glass_pen_scene/scene_glass_pen.sod 3 ../../test_scenes/Glass_pen_scene/backdrop.geo ../../test_scenes/Glass_pen_scene/backdrop.ood ../../test_scenes/Glass_pen_scene/cylinder.geo ../../test_scenes/Glass_pen_scene/cylinder.ood ../../test_scenes/Glass_pen_scene/pen.geo ../../test_scenes/Glass_pen_scene/pen.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Glass_pen_scene/gold.ppm

#Scene 2:  Whole plane
echo -e "Scene 2:  Whole plane\n"
./shading ../../test_scenes/Simple_plane_scene/scene_plane1.sod 1 ../../test_scenes/Simple_plane_scene/plane.geo ../../test_scenes/Simple_plane_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Simple_plane_scene/gold.ppm

#Scene 3:  4 Glasses refraction
echo -e "Scene 3:  4 Glasses refraction\n"
./shading ../../test_scenes/Glasses_scene/scene_glasses.sod 2 ../../test_scenes/Glasses_scene/glasses.geo ../../test_scenes/Glasses_scene/glasses.ood ../../test_scenes/Glasses_scene/backdrop1.geo ../../test_scenes/Glasses_scene/backdrop1.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Glasses_scene/gold.ppm

#Scene 4:  4 Glasses refraction Point light
echo -e "Scene 4:  4 Glasses refraction Point light\n"
./shading ../../test_scenes/Glasses_point_scene/scene_glasses_point.sod 2 ../../test_scenes/Glasses_point_scene/glasses.geo ../../test_scenes/Glasses_point_scene/glasses.ood ../../test_scenes/Glasses_point_scene/backdrop1.geo ../../test_scenes/Glasses_point_scene/backdrop1.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Glasses_point_scene/gold.ppm

#Scene 5:  Horizontal Plane
echo -e "Scene 5:  Horizontal Plane\n"
./shading ../../test_scenes/Simple_plane2_scene/scene_plane2.sod 1 ../../test_scenes/Simple_plane2_scene/plane.geo ../../test_scenes/Simple_plane2_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Simple_plane2_scene/gold.ppm

#Scene 6:  Utah Teapod
echo -e "Scene 6:  Utah Teapod\n"
./shading ../../test_scenes/Utah_teapot_scene/scene_teapot.sod 2 ../../test_scenes/Utah_teapot_scene/teapot.geo ../../test_scenes/Utah_teapot_scene/teapot.ood ../../test_scenes/Utah_teapot_scene/plane.geo ../../test_scenes/Utah_teapot_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/Utah_teapot_scene/gold.ppm

#Scene 7: All MaterialS
echo -e "Scene 7:  All MaterialS \n" 
./shading ../../test_scenes/All_materials_scene/scene_all_materials.sod 7 ../../test_scenes/All_materials_scene/backdrop1.geo ../../test_scenes/All_materials_scene/backdrop1.ood ../../test_scenes/All_materials_scene/backdrop1.geo ../../test_scenes/All_materials_scene/backdrop2.ood ../../test_scenes/All_materials_scene/backdrop1.geo ../../test_scenes/All_materials_scene/backdrop3.ood ../../test_scenes/All_materials_scene/glasses.geo ../../test_scenes/All_materials_scene/glasses.ood ../../test_scenes/All_materials_scene/cylinder.geo ../../test_scenes/All_materials_scene/cylinder.ood ../../test_scenes/All_materials_scene/teapot.geo ../../test_scenes/All_materials_scene/teapot1.ood ../../test_scenes/All_materials_scene/teapot.geo ../../test_scenes/All_materials_scene/teapot2.ood
mv out.ppm gold.ppm
mv gold.ppm ../../test_scenes/All_materials_scene/gold.ppm