//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//

echo "This script was generated under a different operating system."
echo "Please update the PATH variable below, before executing this script"
exit

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "/run/media/nikolas/Linux_Data/Programs/Xilinx/Vitis/2020.1/bin:/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/lin64;/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/bin;";
} else {
  PathVal = "/run/media/nikolas/Linux_Data/Programs/Xilinx/Vitis/2020.1/bin:/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/lin64;/run/media/nikolas/Linux_Data/Programs/Xilinx/Vivado/2020.1/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log Base_Block_Diagram_auto_pc_3.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source Base_Block_Diagram_auto_pc_3.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
