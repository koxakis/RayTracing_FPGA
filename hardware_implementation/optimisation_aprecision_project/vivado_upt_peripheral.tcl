# Vivado tcl commands update a peripheral Arbritary precision
# Update peripheral Version and or update Fabric frequency 
open_project /home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.xpr
open_bd_design {/home/nikolas/Git_Repos/RayTracing_FPGA/hardware_implementation/optimisation_aprecision_project/Optimised_System_Vivado_project/Optimised_vivado_project_ap.srcs/sources_1/bd/block_design/block_design.bd}
update_compile_order -fileset sources_1
set_property -dict [list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100}] [get_bd_cells processing_system7_0]
update_ip_catalog -rebuild
save_bd_design
upgrade_ip -vlnv xilinx.com:hls:rayTI:4.8 [get_ips  block_design_rayTI_0_0] -log ip_upgrade.log
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
