#Scene 1:  Glass and pen
echo -e "Scene 1:  Glass and pen\n"
./shading ../../test_scenes/Glass_pen_720_scene/scene_WP.sod 3 ../../test_scenes/Glass_pen_720_scene/back.geo ../../test_scenes/Glass_pen_720_scene/back.ood ../../test_scenes/Glass_pen_720_scene/cylinder.geo ../../test_scenes/Glass_pen_720_scene/cylinder.ood ../../test_scenes/Glass_pen_720_scene/pen.geo ../../test_scenes/Glass_pen_720_scene/pen.ood
./check_out ../../test_scenes/Glass_pen_720_scene/gold.ppm out.ppm
#	static char *argument_table[]={"shading",
#																"scene_WP.sod",
#																"3",
#																"back.geo",
#																"back.ood",
#																"cylinder.geo",
#																"cylinder.ood",
#																"pen.geo",
#																"pen.ood"};

#Scene 2:  Whole plane
echo -e "Scene 2:  Whole plane\n"
./shading ../../test_scenes/Simple_plane_720_scene/scene_P1.sod 1 ../../test_scenes/Simple_plane_720_scene/plane.geo ../../test_scenes/Simple_plane_720_scene/plane.ood
./check_out ../../test_scenes/Simple_plane_720_scene/gold.ppm out.ppm
# Zedboard argument table
#static char *argument_table[]={"shading",
#																"scene_P1.sod",
#																"1",
#																"plane.geo",
#																"plane.ood"};

#Scene 3:  4 Glasses refraction
echo -e "Scene 3:  4 Glasses refraction\n"
./shading ../../test_scenes/Glasses_720_scene/scene_GL.sod 2 ../../test_scenes/Glasses_720_scene/glasses.geo ../../test_scenes/Glasses_720_scene/glasses.ood ../../test_scenes/Glasses_720_scene/back1.geo ../../test_scenes/Glasses_720_scene/back1.ood
./check_out ../../test_scenes/Glasses_720_scene/gold.ppm out.ppm
#static char *argument_table[]={"shading",
#																"scene_GL.sod",
#																"2",
#																"glasses.geo",
#																"glasses.ood",
#																"back1.geo",
#																"back1.ood"};

#Scene 4:  4 Glasses refraction Point light
echo -e "Scene 4:  4 Glasses refraction Point light\n"
./shading ../../test_scenes/Glasses_point_720_scene/scene_GP.sod 2 ../../test_scenes/Glasses_point_720_scene/glasses.geo ../../test_scenes/Glasses_point_720_scene/glasses.ood ../../test_scenes/Glasses_point_720_scene/back1.geo ../../test_scenes/Glasses_point_720_scene/back1.ood
./check_out ../../test_scenes/Glasses_point_720_scene/gold.ppm out.ppm
#	static char *argument_table[]={"shading",
#																"scene_GP.sod",
#																"2",
#																"glasses.geo",
#																"glasses.ood",
#																"back.geo",
#																"back.ood"};

#Scene 5:  Horizontal Plane
echo -e "Scene 5:  Horizontal Plane\n"
./shading ../../test_scenes/Simple_plane2_720_scene/scene_P2.sod 1 ../../test_scenes/Simple_plane2_720_scene/plane.geo ../../test_scenes/Simple_plane2_720_scene/plane.ood
./check_out ../../test_scenes/Simple_plane2_720_scene/gold.ppm out.ppm
#	static char *argument_table[]={"shading",
#																"scene_P1.sod",
#																"1",
#																"plane.geo",
#																"plane.ood"};

#Scene 6:  Utah Teapod
echo -e "Scene 6:  Utah Teapod\n"
./shading ../../test_scenes/Utah_teapot_720_scene/scene_TP.sod 2 ../../test_scenes/Utah_teapot_720_scene/teapot.geo ../../test_scenes/Utah_teapot_720_scene/teapot.ood ../../test_scenes/Utah_teapot_720_scene/plane.geo ../../test_scenes/Utah_teapot_720_scene/plane.ood
./check_out ../../test_scenes/Utah_teapot_720_scene/gold.ppm out.ppm
#	static char *argument_table[]={"shading",
#																"scene_TP.sod",
#																"2",
#																"teapot.geo",
#																"teapot.ood",
#																"plane.geo",
#																"plane.ood"};

#Scene 7:	All MaterialS 
echo -e "Scene 7:  All MaterialS \n"
./shading ../../test_scenes/All_materials_720_scene/scene_AM.sod 7 ../../test_scenes/All_materials_720_scene/back1.geo ../../test_scenes/All_materials_720_scene/back1.ood ../../test_scenes/All_materials_720_scene/back1.geo ../../test_scenes/All_materials_720_scene/back2.ood ../../test_scenes/All_materials_720_scene/back1.geo ../../test_scenes/All_materials_720_scene/back3.ood ../../test_scenes/All_materials_720_scene/glasses.geo ../../test_scenes/All_materials_720_scene/glasses.ood ../../test_scenes/All_materials_720_scene/cylinder.geo ../../test_scenes/All_materials_720_scene/cylinder.ood ../../test_scenes/All_materials_720_scene/teapot.geo ../../test_scenes/All_materials_720_scene/teapot1.ood ../../test_scenes/All_materials_720_scene/teapot.geo ../../test_scenes/All_materials_720_scene/teapot2.ood
./check_out ../../test_scenes/All_materials_720_scene/gold.ppm out.ppm
#	static char *argument_table[]={"shading",
#																"scene_AM.sod",
#																"7",
#																"back1.geo",
#																"back1.ood",
#																"back1.geo",
#																"back2.ood",
#																"back1.geo",
#																"back3.ood",
#																"glasses.geo",
#																"glasses.ood",
#																"cylinder.geo",
#																"cylinder.ood",
#																"teapot.geo",
#																"teapot1.ood",
#																"teapot.geo",
#																"teapot2.ood"};