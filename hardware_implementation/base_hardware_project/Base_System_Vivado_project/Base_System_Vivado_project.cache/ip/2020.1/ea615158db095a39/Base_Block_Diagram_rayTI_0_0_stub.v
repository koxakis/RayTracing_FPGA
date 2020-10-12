// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Oct 12 12:27:54 2020
// Host        : hal9000 running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Base_Block_Diagram_rayTI_0_0_stub.v
// Design      : Base_Block_Diagram_rayTI_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rayTI,Vivado 2020.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_ret_bundle_AWADDR, 
  s_axi_ret_bundle_AWVALID, s_axi_ret_bundle_AWREADY, s_axi_ret_bundle_WDATA, 
  s_axi_ret_bundle_WSTRB, s_axi_ret_bundle_WVALID, s_axi_ret_bundle_WREADY, 
  s_axi_ret_bundle_BRESP, s_axi_ret_bundle_BVALID, s_axi_ret_bundle_BREADY, 
  s_axi_ret_bundle_ARADDR, s_axi_ret_bundle_ARVALID, s_axi_ret_bundle_ARREADY, 
  s_axi_ret_bundle_RDATA, s_axi_ret_bundle_RRESP, s_axi_ret_bundle_RVALID, 
  s_axi_ret_bundle_RREADY, ap_clk, ap_rst_n, interrupt, m_axi_ray_bundle_AWADDR, 
  m_axi_ray_bundle_AWLEN, m_axi_ray_bundle_AWSIZE, m_axi_ray_bundle_AWBURST, 
  m_axi_ray_bundle_AWLOCK, m_axi_ray_bundle_AWREGION, m_axi_ray_bundle_AWCACHE, 
  m_axi_ray_bundle_AWPROT, m_axi_ray_bundle_AWQOS, m_axi_ray_bundle_AWVALID, 
  m_axi_ray_bundle_AWREADY, m_axi_ray_bundle_WDATA, m_axi_ray_bundle_WSTRB, 
  m_axi_ray_bundle_WLAST, m_axi_ray_bundle_WVALID, m_axi_ray_bundle_WREADY, 
  m_axi_ray_bundle_BRESP, m_axi_ray_bundle_BVALID, m_axi_ray_bundle_BREADY, 
  m_axi_ray_bundle_ARADDR, m_axi_ray_bundle_ARLEN, m_axi_ray_bundle_ARSIZE, 
  m_axi_ray_bundle_ARBURST, m_axi_ray_bundle_ARLOCK, m_axi_ray_bundle_ARREGION, 
  m_axi_ray_bundle_ARCACHE, m_axi_ray_bundle_ARPROT, m_axi_ray_bundle_ARQOS, 
  m_axi_ray_bundle_ARVALID, m_axi_ray_bundle_ARREADY, m_axi_ray_bundle_RDATA, 
  m_axi_ray_bundle_RRESP, m_axi_ray_bundle_RLAST, m_axi_ray_bundle_RVALID, 
  m_axi_ray_bundle_RREADY, m_axi_triangle_bundle_AWADDR, m_axi_triangle_bundle_AWLEN, 
  m_axi_triangle_bundle_AWSIZE, m_axi_triangle_bundle_AWBURST, 
  m_axi_triangle_bundle_AWLOCK, m_axi_triangle_bundle_AWREGION, 
  m_axi_triangle_bundle_AWCACHE, m_axi_triangle_bundle_AWPROT, 
  m_axi_triangle_bundle_AWQOS, m_axi_triangle_bundle_AWVALID, 
  m_axi_triangle_bundle_AWREADY, m_axi_triangle_bundle_WDATA, 
  m_axi_triangle_bundle_WSTRB, m_axi_triangle_bundle_WLAST, 
  m_axi_triangle_bundle_WVALID, m_axi_triangle_bundle_WREADY, 
  m_axi_triangle_bundle_BRESP, m_axi_triangle_bundle_BVALID, 
  m_axi_triangle_bundle_BREADY, m_axi_triangle_bundle_ARADDR, 
  m_axi_triangle_bundle_ARLEN, m_axi_triangle_bundle_ARSIZE, 
  m_axi_triangle_bundle_ARBURST, m_axi_triangle_bundle_ARLOCK, 
  m_axi_triangle_bundle_ARREGION, m_axi_triangle_bundle_ARCACHE, 
  m_axi_triangle_bundle_ARPROT, m_axi_triangle_bundle_ARQOS, 
  m_axi_triangle_bundle_ARVALID, m_axi_triangle_bundle_ARREADY, 
  m_axi_triangle_bundle_RDATA, m_axi_triangle_bundle_RRESP, 
  m_axi_triangle_bundle_RLAST, m_axi_triangle_bundle_RVALID, 
  m_axi_triangle_bundle_RREADY, m_axi_res_bundle_AWADDR, m_axi_res_bundle_AWLEN, 
  m_axi_res_bundle_AWSIZE, m_axi_res_bundle_AWBURST, m_axi_res_bundle_AWLOCK, 
  m_axi_res_bundle_AWREGION, m_axi_res_bundle_AWCACHE, m_axi_res_bundle_AWPROT, 
  m_axi_res_bundle_AWQOS, m_axi_res_bundle_AWVALID, m_axi_res_bundle_AWREADY, 
  m_axi_res_bundle_WDATA, m_axi_res_bundle_WSTRB, m_axi_res_bundle_WLAST, 
  m_axi_res_bundle_WVALID, m_axi_res_bundle_WREADY, m_axi_res_bundle_BRESP, 
  m_axi_res_bundle_BVALID, m_axi_res_bundle_BREADY, m_axi_res_bundle_ARADDR, 
  m_axi_res_bundle_ARLEN, m_axi_res_bundle_ARSIZE, m_axi_res_bundle_ARBURST, 
  m_axi_res_bundle_ARLOCK, m_axi_res_bundle_ARREGION, m_axi_res_bundle_ARCACHE, 
  m_axi_res_bundle_ARPROT, m_axi_res_bundle_ARQOS, m_axi_res_bundle_ARVALID, 
  m_axi_res_bundle_ARREADY, m_axi_res_bundle_RDATA, m_axi_res_bundle_RRESP, 
  m_axi_res_bundle_RLAST, m_axi_res_bundle_RVALID, m_axi_res_bundle_RREADY)
/* synthesis syn_black_box black_box_pad_pin="s_axi_ret_bundle_AWADDR[7:0],s_axi_ret_bundle_AWVALID,s_axi_ret_bundle_AWREADY,s_axi_ret_bundle_WDATA[31:0],s_axi_ret_bundle_WSTRB[3:0],s_axi_ret_bundle_WVALID,s_axi_ret_bundle_WREADY,s_axi_ret_bundle_BRESP[1:0],s_axi_ret_bundle_BVALID,s_axi_ret_bundle_BREADY,s_axi_ret_bundle_ARADDR[7:0],s_axi_ret_bundle_ARVALID,s_axi_ret_bundle_ARREADY,s_axi_ret_bundle_RDATA[31:0],s_axi_ret_bundle_RRESP[1:0],s_axi_ret_bundle_RVALID,s_axi_ret_bundle_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_ray_bundle_AWADDR[31:0],m_axi_ray_bundle_AWLEN[7:0],m_axi_ray_bundle_AWSIZE[2:0],m_axi_ray_bundle_AWBURST[1:0],m_axi_ray_bundle_AWLOCK[1:0],m_axi_ray_bundle_AWREGION[3:0],m_axi_ray_bundle_AWCACHE[3:0],m_axi_ray_bundle_AWPROT[2:0],m_axi_ray_bundle_AWQOS[3:0],m_axi_ray_bundle_AWVALID,m_axi_ray_bundle_AWREADY,m_axi_ray_bundle_WDATA[31:0],m_axi_ray_bundle_WSTRB[3:0],m_axi_ray_bundle_WLAST,m_axi_ray_bundle_WVALID,m_axi_ray_bundle_WREADY,m_axi_ray_bundle_BRESP[1:0],m_axi_ray_bundle_BVALID,m_axi_ray_bundle_BREADY,m_axi_ray_bundle_ARADDR[31:0],m_axi_ray_bundle_ARLEN[7:0],m_axi_ray_bundle_ARSIZE[2:0],m_axi_ray_bundle_ARBURST[1:0],m_axi_ray_bundle_ARLOCK[1:0],m_axi_ray_bundle_ARREGION[3:0],m_axi_ray_bundle_ARCACHE[3:0],m_axi_ray_bundle_ARPROT[2:0],m_axi_ray_bundle_ARQOS[3:0],m_axi_ray_bundle_ARVALID,m_axi_ray_bundle_ARREADY,m_axi_ray_bundle_RDATA[31:0],m_axi_ray_bundle_RRESP[1:0],m_axi_ray_bundle_RLAST,m_axi_ray_bundle_RVALID,m_axi_ray_bundle_RREADY,m_axi_triangle_bundle_AWADDR[31:0],m_axi_triangle_bundle_AWLEN[7:0],m_axi_triangle_bundle_AWSIZE[2:0],m_axi_triangle_bundle_AWBURST[1:0],m_axi_triangle_bundle_AWLOCK[1:0],m_axi_triangle_bundle_AWREGION[3:0],m_axi_triangle_bundle_AWCACHE[3:0],m_axi_triangle_bundle_AWPROT[2:0],m_axi_triangle_bundle_AWQOS[3:0],m_axi_triangle_bundle_AWVALID,m_axi_triangle_bundle_AWREADY,m_axi_triangle_bundle_WDATA[31:0],m_axi_triangle_bundle_WSTRB[3:0],m_axi_triangle_bundle_WLAST,m_axi_triangle_bundle_WVALID,m_axi_triangle_bundle_WREADY,m_axi_triangle_bundle_BRESP[1:0],m_axi_triangle_bundle_BVALID,m_axi_triangle_bundle_BREADY,m_axi_triangle_bundle_ARADDR[31:0],m_axi_triangle_bundle_ARLEN[7:0],m_axi_triangle_bundle_ARSIZE[2:0],m_axi_triangle_bundle_ARBURST[1:0],m_axi_triangle_bundle_ARLOCK[1:0],m_axi_triangle_bundle_ARREGION[3:0],m_axi_triangle_bundle_ARCACHE[3:0],m_axi_triangle_bundle_ARPROT[2:0],m_axi_triangle_bundle_ARQOS[3:0],m_axi_triangle_bundle_ARVALID,m_axi_triangle_bundle_ARREADY,m_axi_triangle_bundle_RDATA[31:0],m_axi_triangle_bundle_RRESP[1:0],m_axi_triangle_bundle_RLAST,m_axi_triangle_bundle_RVALID,m_axi_triangle_bundle_RREADY,m_axi_res_bundle_AWADDR[31:0],m_axi_res_bundle_AWLEN[7:0],m_axi_res_bundle_AWSIZE[2:0],m_axi_res_bundle_AWBURST[1:0],m_axi_res_bundle_AWLOCK[1:0],m_axi_res_bundle_AWREGION[3:0],m_axi_res_bundle_AWCACHE[3:0],m_axi_res_bundle_AWPROT[2:0],m_axi_res_bundle_AWQOS[3:0],m_axi_res_bundle_AWVALID,m_axi_res_bundle_AWREADY,m_axi_res_bundle_WDATA[31:0],m_axi_res_bundle_WSTRB[3:0],m_axi_res_bundle_WLAST,m_axi_res_bundle_WVALID,m_axi_res_bundle_WREADY,m_axi_res_bundle_BRESP[1:0],m_axi_res_bundle_BVALID,m_axi_res_bundle_BREADY,m_axi_res_bundle_ARADDR[31:0],m_axi_res_bundle_ARLEN[7:0],m_axi_res_bundle_ARSIZE[2:0],m_axi_res_bundle_ARBURST[1:0],m_axi_res_bundle_ARLOCK[1:0],m_axi_res_bundle_ARREGION[3:0],m_axi_res_bundle_ARCACHE[3:0],m_axi_res_bundle_ARPROT[2:0],m_axi_res_bundle_ARQOS[3:0],m_axi_res_bundle_ARVALID,m_axi_res_bundle_ARREADY,m_axi_res_bundle_RDATA[31:0],m_axi_res_bundle_RRESP[1:0],m_axi_res_bundle_RLAST,m_axi_res_bundle_RVALID,m_axi_res_bundle_RREADY" */;
  input [7:0]s_axi_ret_bundle_AWADDR;
  input s_axi_ret_bundle_AWVALID;
  output s_axi_ret_bundle_AWREADY;
  input [31:0]s_axi_ret_bundle_WDATA;
  input [3:0]s_axi_ret_bundle_WSTRB;
  input s_axi_ret_bundle_WVALID;
  output s_axi_ret_bundle_WREADY;
  output [1:0]s_axi_ret_bundle_BRESP;
  output s_axi_ret_bundle_BVALID;
  input s_axi_ret_bundle_BREADY;
  input [7:0]s_axi_ret_bundle_ARADDR;
  input s_axi_ret_bundle_ARVALID;
  output s_axi_ret_bundle_ARREADY;
  output [31:0]s_axi_ret_bundle_RDATA;
  output [1:0]s_axi_ret_bundle_RRESP;
  output s_axi_ret_bundle_RVALID;
  input s_axi_ret_bundle_RREADY;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [31:0]m_axi_ray_bundle_AWADDR;
  output [7:0]m_axi_ray_bundle_AWLEN;
  output [2:0]m_axi_ray_bundle_AWSIZE;
  output [1:0]m_axi_ray_bundle_AWBURST;
  output [1:0]m_axi_ray_bundle_AWLOCK;
  output [3:0]m_axi_ray_bundle_AWREGION;
  output [3:0]m_axi_ray_bundle_AWCACHE;
  output [2:0]m_axi_ray_bundle_AWPROT;
  output [3:0]m_axi_ray_bundle_AWQOS;
  output m_axi_ray_bundle_AWVALID;
  input m_axi_ray_bundle_AWREADY;
  output [31:0]m_axi_ray_bundle_WDATA;
  output [3:0]m_axi_ray_bundle_WSTRB;
  output m_axi_ray_bundle_WLAST;
  output m_axi_ray_bundle_WVALID;
  input m_axi_ray_bundle_WREADY;
  input [1:0]m_axi_ray_bundle_BRESP;
  input m_axi_ray_bundle_BVALID;
  output m_axi_ray_bundle_BREADY;
  output [31:0]m_axi_ray_bundle_ARADDR;
  output [7:0]m_axi_ray_bundle_ARLEN;
  output [2:0]m_axi_ray_bundle_ARSIZE;
  output [1:0]m_axi_ray_bundle_ARBURST;
  output [1:0]m_axi_ray_bundle_ARLOCK;
  output [3:0]m_axi_ray_bundle_ARREGION;
  output [3:0]m_axi_ray_bundle_ARCACHE;
  output [2:0]m_axi_ray_bundle_ARPROT;
  output [3:0]m_axi_ray_bundle_ARQOS;
  output m_axi_ray_bundle_ARVALID;
  input m_axi_ray_bundle_ARREADY;
  input [31:0]m_axi_ray_bundle_RDATA;
  input [1:0]m_axi_ray_bundle_RRESP;
  input m_axi_ray_bundle_RLAST;
  input m_axi_ray_bundle_RVALID;
  output m_axi_ray_bundle_RREADY;
  output [31:0]m_axi_triangle_bundle_AWADDR;
  output [7:0]m_axi_triangle_bundle_AWLEN;
  output [2:0]m_axi_triangle_bundle_AWSIZE;
  output [1:0]m_axi_triangle_bundle_AWBURST;
  output [1:0]m_axi_triangle_bundle_AWLOCK;
  output [3:0]m_axi_triangle_bundle_AWREGION;
  output [3:0]m_axi_triangle_bundle_AWCACHE;
  output [2:0]m_axi_triangle_bundle_AWPROT;
  output [3:0]m_axi_triangle_bundle_AWQOS;
  output m_axi_triangle_bundle_AWVALID;
  input m_axi_triangle_bundle_AWREADY;
  output [31:0]m_axi_triangle_bundle_WDATA;
  output [3:0]m_axi_triangle_bundle_WSTRB;
  output m_axi_triangle_bundle_WLAST;
  output m_axi_triangle_bundle_WVALID;
  input m_axi_triangle_bundle_WREADY;
  input [1:0]m_axi_triangle_bundle_BRESP;
  input m_axi_triangle_bundle_BVALID;
  output m_axi_triangle_bundle_BREADY;
  output [31:0]m_axi_triangle_bundle_ARADDR;
  output [7:0]m_axi_triangle_bundle_ARLEN;
  output [2:0]m_axi_triangle_bundle_ARSIZE;
  output [1:0]m_axi_triangle_bundle_ARBURST;
  output [1:0]m_axi_triangle_bundle_ARLOCK;
  output [3:0]m_axi_triangle_bundle_ARREGION;
  output [3:0]m_axi_triangle_bundle_ARCACHE;
  output [2:0]m_axi_triangle_bundle_ARPROT;
  output [3:0]m_axi_triangle_bundle_ARQOS;
  output m_axi_triangle_bundle_ARVALID;
  input m_axi_triangle_bundle_ARREADY;
  input [31:0]m_axi_triangle_bundle_RDATA;
  input [1:0]m_axi_triangle_bundle_RRESP;
  input m_axi_triangle_bundle_RLAST;
  input m_axi_triangle_bundle_RVALID;
  output m_axi_triangle_bundle_RREADY;
  output [31:0]m_axi_res_bundle_AWADDR;
  output [7:0]m_axi_res_bundle_AWLEN;
  output [2:0]m_axi_res_bundle_AWSIZE;
  output [1:0]m_axi_res_bundle_AWBURST;
  output [1:0]m_axi_res_bundle_AWLOCK;
  output [3:0]m_axi_res_bundle_AWREGION;
  output [3:0]m_axi_res_bundle_AWCACHE;
  output [2:0]m_axi_res_bundle_AWPROT;
  output [3:0]m_axi_res_bundle_AWQOS;
  output m_axi_res_bundle_AWVALID;
  input m_axi_res_bundle_AWREADY;
  output [31:0]m_axi_res_bundle_WDATA;
  output [3:0]m_axi_res_bundle_WSTRB;
  output m_axi_res_bundle_WLAST;
  output m_axi_res_bundle_WVALID;
  input m_axi_res_bundle_WREADY;
  input [1:0]m_axi_res_bundle_BRESP;
  input m_axi_res_bundle_BVALID;
  output m_axi_res_bundle_BREADY;
  output [31:0]m_axi_res_bundle_ARADDR;
  output [7:0]m_axi_res_bundle_ARLEN;
  output [2:0]m_axi_res_bundle_ARSIZE;
  output [1:0]m_axi_res_bundle_ARBURST;
  output [1:0]m_axi_res_bundle_ARLOCK;
  output [3:0]m_axi_res_bundle_ARREGION;
  output [3:0]m_axi_res_bundle_ARCACHE;
  output [2:0]m_axi_res_bundle_ARPROT;
  output [3:0]m_axi_res_bundle_ARQOS;
  output m_axi_res_bundle_ARVALID;
  input m_axi_res_bundle_ARREADY;
  input [31:0]m_axi_res_bundle_RDATA;
  input [1:0]m_axi_res_bundle_RRESP;
  input m_axi_res_bundle_RLAST;
  input m_axi_res_bundle_RVALID;
  output m_axi_res_bundle_RREADY;
endmodule
