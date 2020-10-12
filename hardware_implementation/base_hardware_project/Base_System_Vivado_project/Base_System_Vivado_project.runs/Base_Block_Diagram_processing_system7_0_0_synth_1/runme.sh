#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/run/media/nikolas/Linux_Data/Programs/Xilinx/Vitis/2020.1/bin:/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/lin64:/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/bin
else
  PATH=/run/media/nikolas/Linux_Data/Programs/Xilinx/Vitis/2020.1/bin:/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/lin64:/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/run/media/nikolas/Linux_Data/Git_Repos/RayTracing_FPGA/hardware_implementation/base_hardware_project/Base_System_Vivado_project/Base_System_Vivado_project.runs/Base_Block_Diagram_processing_system7_0_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log Base_Block_Diagram_processing_system7_0_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source Base_Block_Diagram_processing_system7_0_0.tcl
