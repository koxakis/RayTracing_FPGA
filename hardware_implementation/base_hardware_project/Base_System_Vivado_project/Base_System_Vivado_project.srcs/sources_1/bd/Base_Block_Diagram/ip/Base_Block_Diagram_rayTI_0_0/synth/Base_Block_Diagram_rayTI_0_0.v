// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: NKoxenoglou:hls:rayTI:0.7
// IP Revision: 2010121209

(* X_CORE_INFO = "rayTI,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "Base_Block_Diagram_rayTI_0_0,rayTI,{}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Base_Block_Diagram_rayTI_0_0 (
  s_axi_ret_bundle_AWADDR,
  s_axi_ret_bundle_AWVALID,
  s_axi_ret_bundle_AWREADY,
  s_axi_ret_bundle_WDATA,
  s_axi_ret_bundle_WSTRB,
  s_axi_ret_bundle_WVALID,
  s_axi_ret_bundle_WREADY,
  s_axi_ret_bundle_BRESP,
  s_axi_ret_bundle_BVALID,
  s_axi_ret_bundle_BREADY,
  s_axi_ret_bundle_ARADDR,
  s_axi_ret_bundle_ARVALID,
  s_axi_ret_bundle_ARREADY,
  s_axi_ret_bundle_RDATA,
  s_axi_ret_bundle_RRESP,
  s_axi_ret_bundle_RVALID,
  s_axi_ret_bundle_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_ray_bundle_AWADDR,
  m_axi_ray_bundle_AWLEN,
  m_axi_ray_bundle_AWSIZE,
  m_axi_ray_bundle_AWBURST,
  m_axi_ray_bundle_AWLOCK,
  m_axi_ray_bundle_AWREGION,
  m_axi_ray_bundle_AWCACHE,
  m_axi_ray_bundle_AWPROT,
  m_axi_ray_bundle_AWQOS,
  m_axi_ray_bundle_AWVALID,
  m_axi_ray_bundle_AWREADY,
  m_axi_ray_bundle_WDATA,
  m_axi_ray_bundle_WSTRB,
  m_axi_ray_bundle_WLAST,
  m_axi_ray_bundle_WVALID,
  m_axi_ray_bundle_WREADY,
  m_axi_ray_bundle_BRESP,
  m_axi_ray_bundle_BVALID,
  m_axi_ray_bundle_BREADY,
  m_axi_ray_bundle_ARADDR,
  m_axi_ray_bundle_ARLEN,
  m_axi_ray_bundle_ARSIZE,
  m_axi_ray_bundle_ARBURST,
  m_axi_ray_bundle_ARLOCK,
  m_axi_ray_bundle_ARREGION,
  m_axi_ray_bundle_ARCACHE,
  m_axi_ray_bundle_ARPROT,
  m_axi_ray_bundle_ARQOS,
  m_axi_ray_bundle_ARVALID,
  m_axi_ray_bundle_ARREADY,
  m_axi_ray_bundle_RDATA,
  m_axi_ray_bundle_RRESP,
  m_axi_ray_bundle_RLAST,
  m_axi_ray_bundle_RVALID,
  m_axi_ray_bundle_RREADY,
  m_axi_triangle_bundle_AWADDR,
  m_axi_triangle_bundle_AWLEN,
  m_axi_triangle_bundle_AWSIZE,
  m_axi_triangle_bundle_AWBURST,
  m_axi_triangle_bundle_AWLOCK,
  m_axi_triangle_bundle_AWREGION,
  m_axi_triangle_bundle_AWCACHE,
  m_axi_triangle_bundle_AWPROT,
  m_axi_triangle_bundle_AWQOS,
  m_axi_triangle_bundle_AWVALID,
  m_axi_triangle_bundle_AWREADY,
  m_axi_triangle_bundle_WDATA,
  m_axi_triangle_bundle_WSTRB,
  m_axi_triangle_bundle_WLAST,
  m_axi_triangle_bundle_WVALID,
  m_axi_triangle_bundle_WREADY,
  m_axi_triangle_bundle_BRESP,
  m_axi_triangle_bundle_BVALID,
  m_axi_triangle_bundle_BREADY,
  m_axi_triangle_bundle_ARADDR,
  m_axi_triangle_bundle_ARLEN,
  m_axi_triangle_bundle_ARSIZE,
  m_axi_triangle_bundle_ARBURST,
  m_axi_triangle_bundle_ARLOCK,
  m_axi_triangle_bundle_ARREGION,
  m_axi_triangle_bundle_ARCACHE,
  m_axi_triangle_bundle_ARPROT,
  m_axi_triangle_bundle_ARQOS,
  m_axi_triangle_bundle_ARVALID,
  m_axi_triangle_bundle_ARREADY,
  m_axi_triangle_bundle_RDATA,
  m_axi_triangle_bundle_RRESP,
  m_axi_triangle_bundle_RLAST,
  m_axi_triangle_bundle_RVALID,
  m_axi_triangle_bundle_RREADY,
  m_axi_res_bundle_AWADDR,
  m_axi_res_bundle_AWLEN,
  m_axi_res_bundle_AWSIZE,
  m_axi_res_bundle_AWBURST,
  m_axi_res_bundle_AWLOCK,
  m_axi_res_bundle_AWREGION,
  m_axi_res_bundle_AWCACHE,
  m_axi_res_bundle_AWPROT,
  m_axi_res_bundle_AWQOS,
  m_axi_res_bundle_AWVALID,
  m_axi_res_bundle_AWREADY,
  m_axi_res_bundle_WDATA,
  m_axi_res_bundle_WSTRB,
  m_axi_res_bundle_WLAST,
  m_axi_res_bundle_WVALID,
  m_axi_res_bundle_WREADY,
  m_axi_res_bundle_BRESP,
  m_axi_res_bundle_BVALID,
  m_axi_res_bundle_BREADY,
  m_axi_res_bundle_ARADDR,
  m_axi_res_bundle_ARLEN,
  m_axi_res_bundle_ARSIZE,
  m_axi_res_bundle_ARBURST,
  m_axi_res_bundle_ARLOCK,
  m_axi_res_bundle_ARREGION,
  m_axi_res_bundle_ARCACHE,
  m_axi_res_bundle_ARPROT,
  m_axi_res_bundle_ARQOS,
  m_axi_res_bundle_ARVALID,
  m_axi_res_bundle_ARREADY,
  m_axi_res_bundle_RDATA,
  m_axi_res_bundle_RRESP,
  m_axi_res_bundle_RLAST,
  m_axi_res_bundle_RVALID,
  m_axi_res_bundle_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle AWADDR" *)
input wire [7 : 0] s_axi_ret_bundle_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle AWVALID" *)
input wire s_axi_ret_bundle_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle AWREADY" *)
output wire s_axi_ret_bundle_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WDATA" *)
input wire [31 : 0] s_axi_ret_bundle_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WSTRB" *)
input wire [3 : 0] s_axi_ret_bundle_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WVALID" *)
input wire s_axi_ret_bundle_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WREADY" *)
output wire s_axi_ret_bundle_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle BRESP" *)
output wire [1 : 0] s_axi_ret_bundle_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle BVALID" *)
output wire s_axi_ret_bundle_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle BREADY" *)
input wire s_axi_ret_bundle_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle ARADDR" *)
input wire [7 : 0] s_axi_ret_bundle_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle ARVALID" *)
input wire s_axi_ret_bundle_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle ARREADY" *)
output wire s_axi_ret_bundle_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RDATA" *)
output wire [31 : 0] s_axi_ret_bundle_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RRESP" *)
output wire [1 : 0] s_axi_ret_bundle_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RVALID" *)
output wire s_axi_ret_bundle_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_ret_bundle, ADDR_WIDTH 8, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_C\
LK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RREADY" *)
input wire s_axi_ret_bundle_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_ret_bundle:m_axi_ray_bundle:m_axi_triangle_bundle:m_axi_res_bundle, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWADDR" *)
output wire [31 : 0] m_axi_ray_bundle_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWLEN" *)
output wire [7 : 0] m_axi_ray_bundle_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWSIZE" *)
output wire [2 : 0] m_axi_ray_bundle_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWBURST" *)
output wire [1 : 0] m_axi_ray_bundle_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWLOCK" *)
output wire [1 : 0] m_axi_ray_bundle_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWREGION" *)
output wire [3 : 0] m_axi_ray_bundle_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWCACHE" *)
output wire [3 : 0] m_axi_ray_bundle_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWPROT" *)
output wire [2 : 0] m_axi_ray_bundle_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWQOS" *)
output wire [3 : 0] m_axi_ray_bundle_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWVALID" *)
output wire m_axi_ray_bundle_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWREADY" *)
input wire m_axi_ray_bundle_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WDATA" *)
output wire [31 : 0] m_axi_ray_bundle_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WSTRB" *)
output wire [3 : 0] m_axi_ray_bundle_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WLAST" *)
output wire m_axi_ray_bundle_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WVALID" *)
output wire m_axi_ray_bundle_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WREADY" *)
input wire m_axi_ray_bundle_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle BRESP" *)
input wire [1 : 0] m_axi_ray_bundle_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle BVALID" *)
input wire m_axi_ray_bundle_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle BREADY" *)
output wire m_axi_ray_bundle_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARADDR" *)
output wire [31 : 0] m_axi_ray_bundle_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARLEN" *)
output wire [7 : 0] m_axi_ray_bundle_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARSIZE" *)
output wire [2 : 0] m_axi_ray_bundle_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARBURST" *)
output wire [1 : 0] m_axi_ray_bundle_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARLOCK" *)
output wire [1 : 0] m_axi_ray_bundle_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARREGION" *)
output wire [3 : 0] m_axi_ray_bundle_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARCACHE" *)
output wire [3 : 0] m_axi_ray_bundle_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARPROT" *)
output wire [2 : 0] m_axi_ray_bundle_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARQOS" *)
output wire [3 : 0] m_axi_ray_bundle_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARVALID" *)
output wire m_axi_ray_bundle_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARREADY" *)
input wire m_axi_ray_bundle_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RDATA" *)
input wire [31 : 0] m_axi_ray_bundle_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RRESP" *)
input wire [1 : 0] m_axi_ray_bundle_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RLAST" *)
input wire m_axi_ray_bundle_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RVALID" *)
input wire m_axi_ray_bundle_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_ray_bundle, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_D\
OMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RREADY" *)
output wire m_axi_ray_bundle_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWADDR" *)
output wire [31 : 0] m_axi_triangle_bundle_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWLEN" *)
output wire [7 : 0] m_axi_triangle_bundle_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWSIZE" *)
output wire [2 : 0] m_axi_triangle_bundle_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWBURST" *)
output wire [1 : 0] m_axi_triangle_bundle_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWLOCK" *)
output wire [1 : 0] m_axi_triangle_bundle_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWREGION" *)
output wire [3 : 0] m_axi_triangle_bundle_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWCACHE" *)
output wire [3 : 0] m_axi_triangle_bundle_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWPROT" *)
output wire [2 : 0] m_axi_triangle_bundle_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWQOS" *)
output wire [3 : 0] m_axi_triangle_bundle_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWVALID" *)
output wire m_axi_triangle_bundle_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWREADY" *)
input wire m_axi_triangle_bundle_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WDATA" *)
output wire [31 : 0] m_axi_triangle_bundle_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WSTRB" *)
output wire [3 : 0] m_axi_triangle_bundle_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WLAST" *)
output wire m_axi_triangle_bundle_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WVALID" *)
output wire m_axi_triangle_bundle_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WREADY" *)
input wire m_axi_triangle_bundle_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle BRESP" *)
input wire [1 : 0] m_axi_triangle_bundle_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle BVALID" *)
input wire m_axi_triangle_bundle_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle BREADY" *)
output wire m_axi_triangle_bundle_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARADDR" *)
output wire [31 : 0] m_axi_triangle_bundle_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARLEN" *)
output wire [7 : 0] m_axi_triangle_bundle_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARSIZE" *)
output wire [2 : 0] m_axi_triangle_bundle_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARBURST" *)
output wire [1 : 0] m_axi_triangle_bundle_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARLOCK" *)
output wire [1 : 0] m_axi_triangle_bundle_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARREGION" *)
output wire [3 : 0] m_axi_triangle_bundle_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARCACHE" *)
output wire [3 : 0] m_axi_triangle_bundle_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARPROT" *)
output wire [2 : 0] m_axi_triangle_bundle_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARQOS" *)
output wire [3 : 0] m_axi_triangle_bundle_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARVALID" *)
output wire m_axi_triangle_bundle_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARREADY" *)
input wire m_axi_triangle_bundle_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RDATA" *)
input wire [31 : 0] m_axi_triangle_bundle_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RRESP" *)
input wire [1 : 0] m_axi_triangle_bundle_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RLAST" *)
input wire m_axi_triangle_bundle_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RVALID" *)
input wire m_axi_triangle_bundle_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_triangle_bundle, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, \
CLK_DOMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RREADY" *)
output wire m_axi_triangle_bundle_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWADDR" *)
output wire [31 : 0] m_axi_res_bundle_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWLEN" *)
output wire [7 : 0] m_axi_res_bundle_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWSIZE" *)
output wire [2 : 0] m_axi_res_bundle_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWBURST" *)
output wire [1 : 0] m_axi_res_bundle_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWLOCK" *)
output wire [1 : 0] m_axi_res_bundle_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWREGION" *)
output wire [3 : 0] m_axi_res_bundle_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWCACHE" *)
output wire [3 : 0] m_axi_res_bundle_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWPROT" *)
output wire [2 : 0] m_axi_res_bundle_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWQOS" *)
output wire [3 : 0] m_axi_res_bundle_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWVALID" *)
output wire m_axi_res_bundle_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWREADY" *)
input wire m_axi_res_bundle_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WDATA" *)
output wire [31 : 0] m_axi_res_bundle_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WSTRB" *)
output wire [3 : 0] m_axi_res_bundle_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WLAST" *)
output wire m_axi_res_bundle_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WVALID" *)
output wire m_axi_res_bundle_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WREADY" *)
input wire m_axi_res_bundle_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle BRESP" *)
input wire [1 : 0] m_axi_res_bundle_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle BVALID" *)
input wire m_axi_res_bundle_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle BREADY" *)
output wire m_axi_res_bundle_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARADDR" *)
output wire [31 : 0] m_axi_res_bundle_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARLEN" *)
output wire [7 : 0] m_axi_res_bundle_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARSIZE" *)
output wire [2 : 0] m_axi_res_bundle_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARBURST" *)
output wire [1 : 0] m_axi_res_bundle_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARLOCK" *)
output wire [1 : 0] m_axi_res_bundle_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARREGION" *)
output wire [3 : 0] m_axi_res_bundle_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARCACHE" *)
output wire [3 : 0] m_axi_res_bundle_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARPROT" *)
output wire [2 : 0] m_axi_res_bundle_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARQOS" *)
output wire [3 : 0] m_axi_res_bundle_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARVALID" *)
output wire m_axi_res_bundle_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARREADY" *)
input wire m_axi_res_bundle_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RDATA" *)
input wire [31 : 0] m_axi_res_bundle_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RRESP" *)
input wire [1 : 0] m_axi_res_bundle_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RLAST" *)
input wire m_axi_res_bundle_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RVALID" *)
input wire m_axi_res_bundle_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_res_bundle, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_D\
OMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RREADY" *)
output wire m_axi_res_bundle_RREADY;

  rayTI #(
    .C_S_AXI_RET_BUNDLE_ADDR_WIDTH(8),
    .C_S_AXI_RET_BUNDLE_DATA_WIDTH(32),
    .C_M_AXI_RAY_BUNDLE_ID_WIDTH(1),
    .C_M_AXI_RAY_BUNDLE_ADDR_WIDTH(32),
    .C_M_AXI_RAY_BUNDLE_DATA_WIDTH(32),
    .C_M_AXI_RAY_BUNDLE_AWUSER_WIDTH(1),
    .C_M_AXI_RAY_BUNDLE_ARUSER_WIDTH(1),
    .C_M_AXI_RAY_BUNDLE_WUSER_WIDTH(1),
    .C_M_AXI_RAY_BUNDLE_RUSER_WIDTH(1),
    .C_M_AXI_RAY_BUNDLE_BUSER_WIDTH(1),
    .C_M_AXI_RAY_BUNDLE_USER_VALUE(32'H00000000),
    .C_M_AXI_RAY_BUNDLE_PROT_VALUE(3'B000),
    .C_M_AXI_RAY_BUNDLE_CACHE_VALUE(4'B0011),
    .C_M_AXI_TRIANGLE_BUNDLE_ID_WIDTH(1),
    .C_M_AXI_TRIANGLE_BUNDLE_ADDR_WIDTH(32),
    .C_M_AXI_TRIANGLE_BUNDLE_DATA_WIDTH(32),
    .C_M_AXI_TRIANGLE_BUNDLE_AWUSER_WIDTH(1),
    .C_M_AXI_TRIANGLE_BUNDLE_ARUSER_WIDTH(1),
    .C_M_AXI_TRIANGLE_BUNDLE_WUSER_WIDTH(1),
    .C_M_AXI_TRIANGLE_BUNDLE_RUSER_WIDTH(1),
    .C_M_AXI_TRIANGLE_BUNDLE_BUSER_WIDTH(1),
    .C_M_AXI_TRIANGLE_BUNDLE_USER_VALUE(32'H00000000),
    .C_M_AXI_TRIANGLE_BUNDLE_PROT_VALUE(3'B000),
    .C_M_AXI_TRIANGLE_BUNDLE_CACHE_VALUE(4'B0011),
    .C_M_AXI_RES_BUNDLE_ID_WIDTH(1),
    .C_M_AXI_RES_BUNDLE_ADDR_WIDTH(32),
    .C_M_AXI_RES_BUNDLE_DATA_WIDTH(32),
    .C_M_AXI_RES_BUNDLE_AWUSER_WIDTH(1),
    .C_M_AXI_RES_BUNDLE_ARUSER_WIDTH(1),
    .C_M_AXI_RES_BUNDLE_WUSER_WIDTH(1),
    .C_M_AXI_RES_BUNDLE_RUSER_WIDTH(1),
    .C_M_AXI_RES_BUNDLE_BUSER_WIDTH(1),
    .C_M_AXI_RES_BUNDLE_USER_VALUE(32'H00000000),
    .C_M_AXI_RES_BUNDLE_PROT_VALUE(3'B000),
    .C_M_AXI_RES_BUNDLE_CACHE_VALUE(4'B0011)
  ) inst (
    .s_axi_ret_bundle_AWADDR(s_axi_ret_bundle_AWADDR),
    .s_axi_ret_bundle_AWVALID(s_axi_ret_bundle_AWVALID),
    .s_axi_ret_bundle_AWREADY(s_axi_ret_bundle_AWREADY),
    .s_axi_ret_bundle_WDATA(s_axi_ret_bundle_WDATA),
    .s_axi_ret_bundle_WSTRB(s_axi_ret_bundle_WSTRB),
    .s_axi_ret_bundle_WVALID(s_axi_ret_bundle_WVALID),
    .s_axi_ret_bundle_WREADY(s_axi_ret_bundle_WREADY),
    .s_axi_ret_bundle_BRESP(s_axi_ret_bundle_BRESP),
    .s_axi_ret_bundle_BVALID(s_axi_ret_bundle_BVALID),
    .s_axi_ret_bundle_BREADY(s_axi_ret_bundle_BREADY),
    .s_axi_ret_bundle_ARADDR(s_axi_ret_bundle_ARADDR),
    .s_axi_ret_bundle_ARVALID(s_axi_ret_bundle_ARVALID),
    .s_axi_ret_bundle_ARREADY(s_axi_ret_bundle_ARREADY),
    .s_axi_ret_bundle_RDATA(s_axi_ret_bundle_RDATA),
    .s_axi_ret_bundle_RRESP(s_axi_ret_bundle_RRESP),
    .s_axi_ret_bundle_RVALID(s_axi_ret_bundle_RVALID),
    .s_axi_ret_bundle_RREADY(s_axi_ret_bundle_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_ray_bundle_AWID(),
    .m_axi_ray_bundle_AWADDR(m_axi_ray_bundle_AWADDR),
    .m_axi_ray_bundle_AWLEN(m_axi_ray_bundle_AWLEN),
    .m_axi_ray_bundle_AWSIZE(m_axi_ray_bundle_AWSIZE),
    .m_axi_ray_bundle_AWBURST(m_axi_ray_bundle_AWBURST),
    .m_axi_ray_bundle_AWLOCK(m_axi_ray_bundle_AWLOCK),
    .m_axi_ray_bundle_AWREGION(m_axi_ray_bundle_AWREGION),
    .m_axi_ray_bundle_AWCACHE(m_axi_ray_bundle_AWCACHE),
    .m_axi_ray_bundle_AWPROT(m_axi_ray_bundle_AWPROT),
    .m_axi_ray_bundle_AWQOS(m_axi_ray_bundle_AWQOS),
    .m_axi_ray_bundle_AWUSER(),
    .m_axi_ray_bundle_AWVALID(m_axi_ray_bundle_AWVALID),
    .m_axi_ray_bundle_AWREADY(m_axi_ray_bundle_AWREADY),
    .m_axi_ray_bundle_WID(),
    .m_axi_ray_bundle_WDATA(m_axi_ray_bundle_WDATA),
    .m_axi_ray_bundle_WSTRB(m_axi_ray_bundle_WSTRB),
    .m_axi_ray_bundle_WLAST(m_axi_ray_bundle_WLAST),
    .m_axi_ray_bundle_WUSER(),
    .m_axi_ray_bundle_WVALID(m_axi_ray_bundle_WVALID),
    .m_axi_ray_bundle_WREADY(m_axi_ray_bundle_WREADY),
    .m_axi_ray_bundle_BID(1'B0),
    .m_axi_ray_bundle_BRESP(m_axi_ray_bundle_BRESP),
    .m_axi_ray_bundle_BUSER(1'B0),
    .m_axi_ray_bundle_BVALID(m_axi_ray_bundle_BVALID),
    .m_axi_ray_bundle_BREADY(m_axi_ray_bundle_BREADY),
    .m_axi_ray_bundle_ARID(),
    .m_axi_ray_bundle_ARADDR(m_axi_ray_bundle_ARADDR),
    .m_axi_ray_bundle_ARLEN(m_axi_ray_bundle_ARLEN),
    .m_axi_ray_bundle_ARSIZE(m_axi_ray_bundle_ARSIZE),
    .m_axi_ray_bundle_ARBURST(m_axi_ray_bundle_ARBURST),
    .m_axi_ray_bundle_ARLOCK(m_axi_ray_bundle_ARLOCK),
    .m_axi_ray_bundle_ARREGION(m_axi_ray_bundle_ARREGION),
    .m_axi_ray_bundle_ARCACHE(m_axi_ray_bundle_ARCACHE),
    .m_axi_ray_bundle_ARPROT(m_axi_ray_bundle_ARPROT),
    .m_axi_ray_bundle_ARQOS(m_axi_ray_bundle_ARQOS),
    .m_axi_ray_bundle_ARUSER(),
    .m_axi_ray_bundle_ARVALID(m_axi_ray_bundle_ARVALID),
    .m_axi_ray_bundle_ARREADY(m_axi_ray_bundle_ARREADY),
    .m_axi_ray_bundle_RID(1'B0),
    .m_axi_ray_bundle_RDATA(m_axi_ray_bundle_RDATA),
    .m_axi_ray_bundle_RRESP(m_axi_ray_bundle_RRESP),
    .m_axi_ray_bundle_RLAST(m_axi_ray_bundle_RLAST),
    .m_axi_ray_bundle_RUSER(1'B0),
    .m_axi_ray_bundle_RVALID(m_axi_ray_bundle_RVALID),
    .m_axi_ray_bundle_RREADY(m_axi_ray_bundle_RREADY),
    .m_axi_triangle_bundle_AWID(),
    .m_axi_triangle_bundle_AWADDR(m_axi_triangle_bundle_AWADDR),
    .m_axi_triangle_bundle_AWLEN(m_axi_triangle_bundle_AWLEN),
    .m_axi_triangle_bundle_AWSIZE(m_axi_triangle_bundle_AWSIZE),
    .m_axi_triangle_bundle_AWBURST(m_axi_triangle_bundle_AWBURST),
    .m_axi_triangle_bundle_AWLOCK(m_axi_triangle_bundle_AWLOCK),
    .m_axi_triangle_bundle_AWREGION(m_axi_triangle_bundle_AWREGION),
    .m_axi_triangle_bundle_AWCACHE(m_axi_triangle_bundle_AWCACHE),
    .m_axi_triangle_bundle_AWPROT(m_axi_triangle_bundle_AWPROT),
    .m_axi_triangle_bundle_AWQOS(m_axi_triangle_bundle_AWQOS),
    .m_axi_triangle_bundle_AWUSER(),
    .m_axi_triangle_bundle_AWVALID(m_axi_triangle_bundle_AWVALID),
    .m_axi_triangle_bundle_AWREADY(m_axi_triangle_bundle_AWREADY),
    .m_axi_triangle_bundle_WID(),
    .m_axi_triangle_bundle_WDATA(m_axi_triangle_bundle_WDATA),
    .m_axi_triangle_bundle_WSTRB(m_axi_triangle_bundle_WSTRB),
    .m_axi_triangle_bundle_WLAST(m_axi_triangle_bundle_WLAST),
    .m_axi_triangle_bundle_WUSER(),
    .m_axi_triangle_bundle_WVALID(m_axi_triangle_bundle_WVALID),
    .m_axi_triangle_bundle_WREADY(m_axi_triangle_bundle_WREADY),
    .m_axi_triangle_bundle_BID(1'B0),
    .m_axi_triangle_bundle_BRESP(m_axi_triangle_bundle_BRESP),
    .m_axi_triangle_bundle_BUSER(1'B0),
    .m_axi_triangle_bundle_BVALID(m_axi_triangle_bundle_BVALID),
    .m_axi_triangle_bundle_BREADY(m_axi_triangle_bundle_BREADY),
    .m_axi_triangle_bundle_ARID(),
    .m_axi_triangle_bundle_ARADDR(m_axi_triangle_bundle_ARADDR),
    .m_axi_triangle_bundle_ARLEN(m_axi_triangle_bundle_ARLEN),
    .m_axi_triangle_bundle_ARSIZE(m_axi_triangle_bundle_ARSIZE),
    .m_axi_triangle_bundle_ARBURST(m_axi_triangle_bundle_ARBURST),
    .m_axi_triangle_bundle_ARLOCK(m_axi_triangle_bundle_ARLOCK),
    .m_axi_triangle_bundle_ARREGION(m_axi_triangle_bundle_ARREGION),
    .m_axi_triangle_bundle_ARCACHE(m_axi_triangle_bundle_ARCACHE),
    .m_axi_triangle_bundle_ARPROT(m_axi_triangle_bundle_ARPROT),
    .m_axi_triangle_bundle_ARQOS(m_axi_triangle_bundle_ARQOS),
    .m_axi_triangle_bundle_ARUSER(),
    .m_axi_triangle_bundle_ARVALID(m_axi_triangle_bundle_ARVALID),
    .m_axi_triangle_bundle_ARREADY(m_axi_triangle_bundle_ARREADY),
    .m_axi_triangle_bundle_RID(1'B0),
    .m_axi_triangle_bundle_RDATA(m_axi_triangle_bundle_RDATA),
    .m_axi_triangle_bundle_RRESP(m_axi_triangle_bundle_RRESP),
    .m_axi_triangle_bundle_RLAST(m_axi_triangle_bundle_RLAST),
    .m_axi_triangle_bundle_RUSER(1'B0),
    .m_axi_triangle_bundle_RVALID(m_axi_triangle_bundle_RVALID),
    .m_axi_triangle_bundle_RREADY(m_axi_triangle_bundle_RREADY),
    .m_axi_res_bundle_AWID(),
    .m_axi_res_bundle_AWADDR(m_axi_res_bundle_AWADDR),
    .m_axi_res_bundle_AWLEN(m_axi_res_bundle_AWLEN),
    .m_axi_res_bundle_AWSIZE(m_axi_res_bundle_AWSIZE),
    .m_axi_res_bundle_AWBURST(m_axi_res_bundle_AWBURST),
    .m_axi_res_bundle_AWLOCK(m_axi_res_bundle_AWLOCK),
    .m_axi_res_bundle_AWREGION(m_axi_res_bundle_AWREGION),
    .m_axi_res_bundle_AWCACHE(m_axi_res_bundle_AWCACHE),
    .m_axi_res_bundle_AWPROT(m_axi_res_bundle_AWPROT),
    .m_axi_res_bundle_AWQOS(m_axi_res_bundle_AWQOS),
    .m_axi_res_bundle_AWUSER(),
    .m_axi_res_bundle_AWVALID(m_axi_res_bundle_AWVALID),
    .m_axi_res_bundle_AWREADY(m_axi_res_bundle_AWREADY),
    .m_axi_res_bundle_WID(),
    .m_axi_res_bundle_WDATA(m_axi_res_bundle_WDATA),
    .m_axi_res_bundle_WSTRB(m_axi_res_bundle_WSTRB),
    .m_axi_res_bundle_WLAST(m_axi_res_bundle_WLAST),
    .m_axi_res_bundle_WUSER(),
    .m_axi_res_bundle_WVALID(m_axi_res_bundle_WVALID),
    .m_axi_res_bundle_WREADY(m_axi_res_bundle_WREADY),
    .m_axi_res_bundle_BID(1'B0),
    .m_axi_res_bundle_BRESP(m_axi_res_bundle_BRESP),
    .m_axi_res_bundle_BUSER(1'B0),
    .m_axi_res_bundle_BVALID(m_axi_res_bundle_BVALID),
    .m_axi_res_bundle_BREADY(m_axi_res_bundle_BREADY),
    .m_axi_res_bundle_ARID(),
    .m_axi_res_bundle_ARADDR(m_axi_res_bundle_ARADDR),
    .m_axi_res_bundle_ARLEN(m_axi_res_bundle_ARLEN),
    .m_axi_res_bundle_ARSIZE(m_axi_res_bundle_ARSIZE),
    .m_axi_res_bundle_ARBURST(m_axi_res_bundle_ARBURST),
    .m_axi_res_bundle_ARLOCK(m_axi_res_bundle_ARLOCK),
    .m_axi_res_bundle_ARREGION(m_axi_res_bundle_ARREGION),
    .m_axi_res_bundle_ARCACHE(m_axi_res_bundle_ARCACHE),
    .m_axi_res_bundle_ARPROT(m_axi_res_bundle_ARPROT),
    .m_axi_res_bundle_ARQOS(m_axi_res_bundle_ARQOS),
    .m_axi_res_bundle_ARUSER(),
    .m_axi_res_bundle_ARVALID(m_axi_res_bundle_ARVALID),
    .m_axi_res_bundle_ARREADY(m_axi_res_bundle_ARREADY),
    .m_axi_res_bundle_RID(1'B0),
    .m_axi_res_bundle_RDATA(m_axi_res_bundle_RDATA),
    .m_axi_res_bundle_RRESP(m_axi_res_bundle_RRESP),
    .m_axi_res_bundle_RLAST(m_axi_res_bundle_RLAST),
    .m_axi_res_bundle_RUSER(1'B0),
    .m_axi_res_bundle_RVALID(m_axi_res_bundle_RVALID),
    .m_axi_res_bundle_RREADY(m_axi_res_bundle_RREADY)
  );
endmodule
