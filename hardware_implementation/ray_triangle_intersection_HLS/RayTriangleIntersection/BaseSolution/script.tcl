############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project RayTriangleIntersection
set_top rayTI
add_files source_files/rayTriangleIntersection.cpp -cflags "-std=c++0x" -csimflags "-std=gnu++14"
add_files source_files/geometry.h -cflags "-std=c++0x" -csimflags "-std=gnu++14"
add_files -tb source_files/shading.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb source_files/Simple_plane_scene/scene_plane1.sod -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb source_files/Simple_plane_scene/plane.ood -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb source_files/Simple_plane_scene/plane.geo -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "BaseSolution"
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -description {Base accelerator for simple first run} -display_name Ray_Triangle_Intersection -format ip_catalog -rtl verilog -vendor NKoxenoglou -version 0.7
source "./RayTriangleIntersection/BaseSolution/directives.tcl"
csim_design -ldflags {-Wall -g -std=c++11 -fpermissive -O4} -argv {scene_plane1.sod 1 plane.geo plane.ood} -O
csynth_design
cosim_design -O -ldflags {-Wall -g -std=c++11 -fpermissive -O4} -argv {scene_plane1.sod 1 plane.geo plane.ood} -tool xsim
export_design -rtl verilog -format ip_catalog -description "Base accelerator for simple first run " -vendor "NKoxenoglou" -version "0.7" -display_name "Ray_Triangle_Intersection"
