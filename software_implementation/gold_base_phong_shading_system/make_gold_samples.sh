#Scene 1:  Glass and pen
echo -e "Scene 1:  Glass and pen\n"
./shading Glass_pen_scene/scene.sod 3 Glass_pen_scene/backdrop.geo Glass_pen_scene/backdrop.ood Glass_pen_scene/cylinder.geo Glass_pen_scene/cylinder.ood Glass_pen_scene/pen.geo Glass_pen_scene/pen.ood
mv out.ppm gold.ppm
mv gold.ppm Glass_pen_scene/gold.ppm

#Scene 2:  Whole plane
echo -e "Scene 2:  Whole plane\n"
./shading Simple_plane_scene/scene.sod 1 Simple_plane_scene/plane.geo Simple_plane_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm Simple_plane_scene/gold.ppm

#Scene 3:  4 Glasses refraction
echo -e "Scene 3:  4 Glasses refraction\n"
./shading Glasses_scene/scene.sod 2 Glasses_scene/glasses.geo Glasses_scene/glasses.ood Glasses_scene/backdrop1.geo Glasses_scene/backdrop1.ood
mv out.ppm gold.ppm
mv gold.ppm Glasses_scene/gold.ppm

#Scene 4:  4 Glasses refraction Point light
echo -e "Scene 4:  4 Glasses refraction Point light\n"
./shading Glasses_point_scene/scene.sod 2 Glasses_point_scene/glasses.geo Glasses_point_scene/glasses.ood Glasses_point_scene/backdrop1.geo Glasses_point_scene/backdrop1.ood
mv out.ppm gold.ppm
mv gold.ppm Glasses_point_scene/gold.ppm

#Scene 5:  Horizontal Plane
echo -e "Scene 5:  Horizontal Plane\n"
./shading Simple_plane2_scene/scene.sod 1 Simple_plane2_scene/plane.geo Simple_plane2_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm Simple_plane2_scene/gold.ppm

#Scene 6:  Utah Teapod
echo -e "Scene 6:  Utah Teapod\n"
./shading Utah_teapot_scene/teapot.sod 2 Utah_teapot_scene/teapot.geo Utah_teapot_scene/teapot.ood Utah_teapot_scene/plane.geo Utah_teapot_scene/plane.ood
mv out.ppm gold.ppm
mv gold.ppm Utah_teapot_scene/gold.ppm

#Scene 7: 
echo -e "Scene 7:  All MaterialS \n" 
./shading All_materials_scene/scene.sod 5 All_materials_scene/backdrop1.geo All_materials_scene/backdrop1.ood All_materials_scene/backdrop1.geo All_materials_scene/backdrop2.ood All_materials_scene/backdrop1.geo All_materials_scene/backdrop3.ood All_materials_scene/glasses.geo All_materials_scene/glasses.ood All_materials_scene/cylinder.geo All_materials_scene/cylinder.ood
mv out.ppm gold.ppm
mv gold.ppm All_materials_scene/gold.ppm