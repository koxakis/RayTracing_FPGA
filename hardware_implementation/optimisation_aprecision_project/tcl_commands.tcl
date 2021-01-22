# Vitis HLS tcl comands 1st time 
open_project RayTriangleIntersection_opt
set_top rayTI
add_files hls_source_files/rayTriangleIntersection.cpp -cflags "-std=c++0x" -csimflags "-std=c++0x"
add_files -tb hls_source_files/geometry.h -cflags "-std=c++0x -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb hls_source_files/shading.cpp -cflags "-std=c++0x -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../../test_scenes/Simple_plane_scene -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../../test_scenes/Simple_plane_scene_AP -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "Starting_point" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 7 -name default
config_export -format ip_catalog -rtl verilog -version 2.3
source "./RayTriangleIntersection_opt/Starting_point/directives.tcl"
csim_design -ldflags {-Wall -g -std=c++11 -fpermissive -O4 -I/opt/Xilinx/Vitis_HLS/2020.2/include -DHLS_NO_XIL_FPO_LIB} -argv {Simple_plane_scene_AP/scene_P1.sod 1 Simple_plane_scene_AP/plane.geo Simple_plane_scene_AP/plane.ood} -clean -O
csynth_design
cosim_design -O -ldflags {-Wall -g -std=c++11 -fpermissive -O4 -I/opt/Xilinx/Vitis_HLS/2020.2/include -DHLS_NO_XIL_FPO_LIB} -argv {Simple_plane_scene/scene_plane1.sod 1 Simple_plane_scene/plane.geo Simple_plane_scene/plane.ood}
export_design -rtl verilog -format ip_catalog -version "2.4"

# Vitis HLS tcl comands update time 
open_project RayTriangleIntersection_opt
open_solution "Starting_point" -flow_target vivado
# Change Clock
#create_clock -period 7 -name default
source "./RayTriangleIntersection_opt/Starting_point/directives.tcl"
# For CSim
#csim_design -ldflags {-Wall -g -std=c++11 -fpermissive -O4 -I/opt/Xilinx/Vitis_HLS/2020.2/include -DHLS_NO_XIL_FPO_LIB} -argv {Simple_plane_scene_AP/scene_P1.sod 1 Simple_plane_scene_AP/plane.geo Simple_plane_scene_AP/plane.ood} -clean -O
csynth_design
# For C Cosimulation
#cosim_design -O -ldflags {-Wall -g -std=c++11 -fpermissive -O4 -I/opt/Xilinx/Vitis_HLS/2020.2/include -DHLS_NO_XIL_FPO_LIB} -argv {Simple_plane_scene/scene_plane1.sod 1 Simple_plane_scene/plane.geo Simple_plane_scene/plane.ood}
export_design -rtl verilog -format ip_catalog -version "2.5"

# Vivado tcl comands
open_project /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.xpr
open_bd_design {/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd}
update_compile_order -fileset sources_1
upgrade_ip -vlnv xilinx.com:hls:rayTI:2.4 [get_ips  block_design_rayTI_0_0] -log ip_upgrade.log
export_ip_user_files -of_objects [get_ips block_design_rayTI_0_0] -no_script -sync -force -quiet
generate_target all [get_files  /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd]
catch { config_ip_cache -export [get_ips -all block_design_rayTI_0_0] }
catch { config_ip_cache -export [get_ips -all block_design_auto_pc_0] }
export_ip_user_files -of_objects [get_files /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd]
launch_runs block_design_rayTI_0_0_synth_1 -jobs 4
wait_on_run block_design_rayTI_0_0_synth_1
export_simulation -of_objects [get_files /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd] -directory /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.ip_user_files/sim_scripts -ip_user_files_dir /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.ip_user_files -ipstatic_source_dir /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.ip_user_files/ipstatic -lib_map_path [list {modelsim=/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.cache/compile_simlib/modelsim} {questa=/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.cache/compile_simlib/questa} {ies=/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.cache/compile_simlib/ies} {xcelium=/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.cache/compile_simlib/xcelium} {vcs=/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.cache/compile_simlib/vcs} {riviera=/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
reset_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
write_hw_platform -fixed -include_bit -force -file /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/block_design_wrapper.xsa
open_bd_design {/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd}
update_ip_catalog -rebuild
open_run impl_1
report_timing_summary
report_utilization

# Vivado tcl report timing 
open_project /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.xpr
update_compile_order -fileset sources_1
open_run impl_1
report_timing_summary
report_utilization

# Vivado tcl change zync freq
open_project /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.xpr
update_compile_order -fileset sources_1
open_bd_design {/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd}
set_property -dict [list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {200}] [get_bd_cells processing_system7_0]
update_ip_catalog -rebuild
save_bd_design
reset_run synth_1
reset_run block_design_rayTI_0_0_synth_1
reset_run block_design_processing_system7_0_0_synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 4