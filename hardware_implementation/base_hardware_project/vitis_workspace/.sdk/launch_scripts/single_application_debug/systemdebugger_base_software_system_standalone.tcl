connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248650939" && level==0 && jtag_device_ctx=="jsn-Zed-210248650939-23727093-0"}
fpga -file /run/media/nikolas/Linux_Data/Git_Repos/RayTracing_FPGA/hardware_implementation/base_hardware_project/vitis_workspace/Base_software/_ide/bitstream/Base_Block_Diagram_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /run/media/nikolas/Linux_Data/Git_Repos/RayTracing_FPGA/hardware_implementation/base_hardware_project/vitis_workspace/Base_Block_Diagram_wrapper/export/Base_Block_Diagram_wrapper/hw/Base_Block_Diagram_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /run/media/nikolas/Linux_Data/Git_Repos/RayTracing_FPGA/hardware_implementation/base_hardware_project/vitis_workspace/Base_software/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /run/media/nikolas/Linux_Data/Git_Repos/RayTracing_FPGA/hardware_implementation/base_hardware_project/vitis_workspace/Base_software/Debug/Base_software.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
