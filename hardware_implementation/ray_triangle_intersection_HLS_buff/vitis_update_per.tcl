open_project RayTriangleIntersection_buf
set_top rayTI
add_files hls_source_files/rayTriangleIntersection.cpp -cflags "-std=c++0x" -csimflags "-std=c++0x"
add_files -tb hls_source_files/geometry.h -cflags "-std=c++0x -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb hls_source_files/shading.cpp -cflags "-std=c++0x -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../../test_scenes/Simple_plane_scene -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../../test_scenes/Simple_plane_scene_AP -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "Starting_point" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 12 -name default
config_export -format ip_catalog -rtl verilog -version 1.7
config_compile -unsafe_math_optimizations
source "./RayTriangleIntersection_buf/Starting_point/directives.tcl"
csim_design -ldflags {-Wall -g -std=c++11 -fpermissive -O4 -I/opt/Xilinx/Vitis_HLS/2020.2/include -DHLS_NO_XIL_FPO_LIB} -argv {Simple_plane_scene_AP/scene_P1.sod 1 Simple_plane_scene_AP/plane.geo Simple_plane_scene_AP/plane.ood} -clean -O
csynth_design
#cosim_design -ldflags {-Wall -g -std=c++11 -fpermissive -O4 -I/opt/Xilinx/Vitis_HLS/2020.2/include -DHLS_NO_XIL_FPO_LIB}
export_design -rtl verilog -format ip_catalog -version "2.9"