# Vitis HLS tcl update peripheral 
# Set peripheral version 
# Choose whitch solution to open 
# Set synthesis parameters and period
open_project RayTriangleIntersection_opt
set_top rayTI
add_files hls_source_files/rayTriangleIntersection.cpp -cflags "-std=c++0x" -csimflags "-std=c++0x"
add_files -tb hls_source_files/geometry.h -cflags "-std=c++0x -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb hls_source_files/shading.cpp -cflags "-std=c++0x -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../../test_scenes/Simple_plane_scene -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../../test_scenes/Simple_plane_scene_AP -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "Starting_point" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 4.5 -name default
source "./RayTriangleIntersection_opt/Starting_point/directives.tcl"
#config_compile -unsafe_math_optimizations=true
csynth_design
export_design -rtl verilog -format ip_catalog -version "5.7"
