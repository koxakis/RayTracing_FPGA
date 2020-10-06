############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project RayTriangleIntersection
set_top rayTriangleIntersect
add_files source_files/geometry.h -cflags "-std=c++0x" -csimflags "-std=c++0x -std=gnu++14"
add_files source_files/rayTriangleIntersection.cpp -cflags "-std=c++0x" -csimflags "-std=c++0x -std=gnu++14"
add_files -tb source_files/Glasses_scene/backdrop1.geo
add_files -tb source_files/Glasses_scene/backdrop1.ood
add_files -tb source_files/Glasses_scene/glasses.geo
add_files -tb source_files/Glasses_scene/glasses.ood
add_files -tb source_files/Simple_plane_scene/plane.geo
add_files -tb source_files/Simple_plane_scene/plane.ood
add_files -tb source_files/shading.cpp
open_solution "BaseSolution"
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
#source "./RayTriangleIntersection/BaseSolution/directives.tcl"
csim_design -ldflags {-std=c++0x} -argv {scene.sod 1 plane.geo plane.ood}
csynth_design
cosim_design -ldflags {-std=c++0x} -argv {scene.sod 1 plane.geo plane.ood} -tool xsim
export_design -format ip_catalog
