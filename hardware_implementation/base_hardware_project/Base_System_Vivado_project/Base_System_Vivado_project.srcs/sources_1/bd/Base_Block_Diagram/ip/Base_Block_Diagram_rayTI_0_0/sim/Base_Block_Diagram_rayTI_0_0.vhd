-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: NKoxenoglou:hls:rayTI:0.7
-- IP Revision: 2010121209

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Base_Block_Diagram_rayTI_0_0 IS
  PORT (
    s_axi_ret_bundle_AWADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_ret_bundle_AWVALID : IN STD_LOGIC;
    s_axi_ret_bundle_AWREADY : OUT STD_LOGIC;
    s_axi_ret_bundle_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_ret_bundle_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_ret_bundle_WVALID : IN STD_LOGIC;
    s_axi_ret_bundle_WREADY : OUT STD_LOGIC;
    s_axi_ret_bundle_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_ret_bundle_BVALID : OUT STD_LOGIC;
    s_axi_ret_bundle_BREADY : IN STD_LOGIC;
    s_axi_ret_bundle_ARADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi_ret_bundle_ARVALID : IN STD_LOGIC;
    s_axi_ret_bundle_ARREADY : OUT STD_LOGIC;
    s_axi_ret_bundle_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_ret_bundle_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_ret_bundle_RVALID : OUT STD_LOGIC;
    s_axi_ret_bundle_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_ray_bundle_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ray_bundle_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_ray_bundle_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ray_bundle_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ray_bundle_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ray_bundle_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ray_bundle_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_AWVALID : OUT STD_LOGIC;
    m_axi_ray_bundle_AWREADY : IN STD_LOGIC;
    m_axi_ray_bundle_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ray_bundle_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_WLAST : OUT STD_LOGIC;
    m_axi_ray_bundle_WVALID : OUT STD_LOGIC;
    m_axi_ray_bundle_WREADY : IN STD_LOGIC;
    m_axi_ray_bundle_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ray_bundle_BVALID : IN STD_LOGIC;
    m_axi_ray_bundle_BREADY : OUT STD_LOGIC;
    m_axi_ray_bundle_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ray_bundle_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_ray_bundle_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ray_bundle_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ray_bundle_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ray_bundle_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ray_bundle_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ray_bundle_ARVALID : OUT STD_LOGIC;
    m_axi_ray_bundle_ARREADY : IN STD_LOGIC;
    m_axi_ray_bundle_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ray_bundle_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ray_bundle_RLAST : IN STD_LOGIC;
    m_axi_ray_bundle_RVALID : IN STD_LOGIC;
    m_axi_ray_bundle_RREADY : OUT STD_LOGIC;
    m_axi_triangle_bundle_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_triangle_bundle_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_triangle_bundle_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_triangle_bundle_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_triangle_bundle_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_triangle_bundle_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_triangle_bundle_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_AWVALID : OUT STD_LOGIC;
    m_axi_triangle_bundle_AWREADY : IN STD_LOGIC;
    m_axi_triangle_bundle_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_triangle_bundle_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_WLAST : OUT STD_LOGIC;
    m_axi_triangle_bundle_WVALID : OUT STD_LOGIC;
    m_axi_triangle_bundle_WREADY : IN STD_LOGIC;
    m_axi_triangle_bundle_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_triangle_bundle_BVALID : IN STD_LOGIC;
    m_axi_triangle_bundle_BREADY : OUT STD_LOGIC;
    m_axi_triangle_bundle_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_triangle_bundle_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_triangle_bundle_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_triangle_bundle_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_triangle_bundle_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_triangle_bundle_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_triangle_bundle_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_triangle_bundle_ARVALID : OUT STD_LOGIC;
    m_axi_triangle_bundle_ARREADY : IN STD_LOGIC;
    m_axi_triangle_bundle_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_triangle_bundle_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_triangle_bundle_RLAST : IN STD_LOGIC;
    m_axi_triangle_bundle_RVALID : IN STD_LOGIC;
    m_axi_triangle_bundle_RREADY : OUT STD_LOGIC;
    m_axi_res_bundle_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_res_bundle_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_res_bundle_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_res_bundle_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_res_bundle_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_res_bundle_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_res_bundle_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_AWVALID : OUT STD_LOGIC;
    m_axi_res_bundle_AWREADY : IN STD_LOGIC;
    m_axi_res_bundle_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_res_bundle_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_WLAST : OUT STD_LOGIC;
    m_axi_res_bundle_WVALID : OUT STD_LOGIC;
    m_axi_res_bundle_WREADY : IN STD_LOGIC;
    m_axi_res_bundle_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_res_bundle_BVALID : IN STD_LOGIC;
    m_axi_res_bundle_BREADY : OUT STD_LOGIC;
    m_axi_res_bundle_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_res_bundle_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_res_bundle_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_res_bundle_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_res_bundle_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_res_bundle_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_res_bundle_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_res_bundle_ARVALID : OUT STD_LOGIC;
    m_axi_res_bundle_ARREADY : IN STD_LOGIC;
    m_axi_res_bundle_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_res_bundle_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_res_bundle_RLAST : IN STD_LOGIC;
    m_axi_res_bundle_RVALID : IN STD_LOGIC;
    m_axi_res_bundle_RREADY : OUT STD_LOGIC
  );
END Base_Block_Diagram_rayTI_0_0;

ARCHITECTURE Base_Block_Diagram_rayTI_0_0_arch OF Base_Block_Diagram_rayTI_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF Base_Block_Diagram_rayTI_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT rayTI IS
    GENERIC (
      C_S_AXI_RET_BUNDLE_ADDR_WIDTH : INTEGER;
      C_S_AXI_RET_BUNDLE_DATA_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_ID_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_ADDR_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_DATA_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_AWUSER_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_ARUSER_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_WUSER_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_RUSER_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_BUSER_WIDTH : INTEGER;
      C_M_AXI_RAY_BUNDLE_USER_VALUE : INTEGER;
      C_M_AXI_RAY_BUNDLE_PROT_VALUE : INTEGER;
      C_M_AXI_RAY_BUNDLE_CACHE_VALUE : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_ID_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_ADDR_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_DATA_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_AWUSER_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_ARUSER_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_WUSER_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_RUSER_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_BUSER_WIDTH : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_USER_VALUE : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_PROT_VALUE : INTEGER;
      C_M_AXI_TRIANGLE_BUNDLE_CACHE_VALUE : INTEGER;
      C_M_AXI_RES_BUNDLE_ID_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_ADDR_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_DATA_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_AWUSER_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_ARUSER_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_WUSER_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_RUSER_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_BUSER_WIDTH : INTEGER;
      C_M_AXI_RES_BUNDLE_USER_VALUE : INTEGER;
      C_M_AXI_RES_BUNDLE_PROT_VALUE : INTEGER;
      C_M_AXI_RES_BUNDLE_CACHE_VALUE : INTEGER
    );
    PORT (
      s_axi_ret_bundle_AWADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_ret_bundle_AWVALID : IN STD_LOGIC;
      s_axi_ret_bundle_AWREADY : OUT STD_LOGIC;
      s_axi_ret_bundle_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_ret_bundle_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_ret_bundle_WVALID : IN STD_LOGIC;
      s_axi_ret_bundle_WREADY : OUT STD_LOGIC;
      s_axi_ret_bundle_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_ret_bundle_BVALID : OUT STD_LOGIC;
      s_axi_ret_bundle_BREADY : IN STD_LOGIC;
      s_axi_ret_bundle_ARADDR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_ret_bundle_ARVALID : IN STD_LOGIC;
      s_axi_ret_bundle_ARREADY : OUT STD_LOGIC;
      s_axi_ret_bundle_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_ret_bundle_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_ret_bundle_RVALID : OUT STD_LOGIC;
      s_axi_ret_bundle_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      m_axi_ray_bundle_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ray_bundle_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_ray_bundle_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ray_bundle_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ray_bundle_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ray_bundle_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ray_bundle_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_AWVALID : OUT STD_LOGIC;
      m_axi_ray_bundle_AWREADY : IN STD_LOGIC;
      m_axi_ray_bundle_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ray_bundle_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_WLAST : OUT STD_LOGIC;
      m_axi_ray_bundle_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_WVALID : OUT STD_LOGIC;
      m_axi_ray_bundle_WREADY : IN STD_LOGIC;
      m_axi_ray_bundle_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ray_bundle_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_BVALID : IN STD_LOGIC;
      m_axi_ray_bundle_BREADY : OUT STD_LOGIC;
      m_axi_ray_bundle_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ray_bundle_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_ray_bundle_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ray_bundle_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ray_bundle_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ray_bundle_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ray_bundle_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ray_bundle_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_ARVALID : OUT STD_LOGIC;
      m_axi_ray_bundle_ARREADY : IN STD_LOGIC;
      m_axi_ray_bundle_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ray_bundle_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ray_bundle_RLAST : IN STD_LOGIC;
      m_axi_ray_bundle_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ray_bundle_RVALID : IN STD_LOGIC;
      m_axi_ray_bundle_RREADY : OUT STD_LOGIC;
      m_axi_triangle_bundle_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_triangle_bundle_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_triangle_bundle_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_triangle_bundle_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_triangle_bundle_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_triangle_bundle_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_triangle_bundle_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_AWVALID : OUT STD_LOGIC;
      m_axi_triangle_bundle_AWREADY : IN STD_LOGIC;
      m_axi_triangle_bundle_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_triangle_bundle_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_WLAST : OUT STD_LOGIC;
      m_axi_triangle_bundle_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_WVALID : OUT STD_LOGIC;
      m_axi_triangle_bundle_WREADY : IN STD_LOGIC;
      m_axi_triangle_bundle_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_triangle_bundle_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_BVALID : IN STD_LOGIC;
      m_axi_triangle_bundle_BREADY : OUT STD_LOGIC;
      m_axi_triangle_bundle_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_triangle_bundle_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_triangle_bundle_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_triangle_bundle_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_triangle_bundle_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_triangle_bundle_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_triangle_bundle_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_triangle_bundle_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_ARVALID : OUT STD_LOGIC;
      m_axi_triangle_bundle_ARREADY : IN STD_LOGIC;
      m_axi_triangle_bundle_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_triangle_bundle_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_triangle_bundle_RLAST : IN STD_LOGIC;
      m_axi_triangle_bundle_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_triangle_bundle_RVALID : IN STD_LOGIC;
      m_axi_triangle_bundle_RREADY : OUT STD_LOGIC;
      m_axi_res_bundle_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_res_bundle_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_res_bundle_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_res_bundle_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_res_bundle_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_res_bundle_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_res_bundle_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_AWVALID : OUT STD_LOGIC;
      m_axi_res_bundle_AWREADY : IN STD_LOGIC;
      m_axi_res_bundle_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_res_bundle_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_WLAST : OUT STD_LOGIC;
      m_axi_res_bundle_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_WVALID : OUT STD_LOGIC;
      m_axi_res_bundle_WREADY : IN STD_LOGIC;
      m_axi_res_bundle_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_res_bundle_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_BVALID : IN STD_LOGIC;
      m_axi_res_bundle_BREADY : OUT STD_LOGIC;
      m_axi_res_bundle_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_res_bundle_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_res_bundle_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_res_bundle_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_res_bundle_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_res_bundle_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_res_bundle_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_res_bundle_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_ARVALID : OUT STD_LOGIC;
      m_axi_res_bundle_ARREADY : IN STD_LOGIC;
      m_axi_res_bundle_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_res_bundle_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_res_bundle_RLAST : IN STD_LOGIC;
      m_axi_res_bundle_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_res_bundle_RVALID : IN STD_LOGIC;
      m_axi_res_bundle_RREADY : OUT STD_LOGIC
    );
  END COMPONENT rayTI;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF Base_Block_Diagram_rayTI_0_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_res_bundle_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_res_bundle, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_D" & 
"OMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_res_bundle_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_res_bundle AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_triangle_bundle_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_triangle_bundle, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, " & 
"CLK_DOMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_triangle_bundle_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_triangle_bundle AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_ray_bundle_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_ray_bundle, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_D" & 
"OMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ray_bundle_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ray_bundle AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_ret_bundle:m_axi_ray_bundle:m_axi_triangle_bundle:m_axi_res_bundle, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_ret_bundle_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_ret_bundle, ADDR_WIDTH 8, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN Base_Block_Diagram_processing_system7_0_0_FCLK_C" & 
"LK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_ret_bundle_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_ret_bundle AWADDR";
BEGIN
  U0 : rayTI
    GENERIC MAP (
      C_S_AXI_RET_BUNDLE_ADDR_WIDTH => 8,
      C_S_AXI_RET_BUNDLE_DATA_WIDTH => 32,
      C_M_AXI_RAY_BUNDLE_ID_WIDTH => 1,
      C_M_AXI_RAY_BUNDLE_ADDR_WIDTH => 32,
      C_M_AXI_RAY_BUNDLE_DATA_WIDTH => 32,
      C_M_AXI_RAY_BUNDLE_AWUSER_WIDTH => 1,
      C_M_AXI_RAY_BUNDLE_ARUSER_WIDTH => 1,
      C_M_AXI_RAY_BUNDLE_WUSER_WIDTH => 1,
      C_M_AXI_RAY_BUNDLE_RUSER_WIDTH => 1,
      C_M_AXI_RAY_BUNDLE_BUSER_WIDTH => 1,
      C_M_AXI_RAY_BUNDLE_USER_VALUE => 0,
      C_M_AXI_RAY_BUNDLE_PROT_VALUE => 0,
      C_M_AXI_RAY_BUNDLE_CACHE_VALUE => 3,
      C_M_AXI_TRIANGLE_BUNDLE_ID_WIDTH => 1,
      C_M_AXI_TRIANGLE_BUNDLE_ADDR_WIDTH => 32,
      C_M_AXI_TRIANGLE_BUNDLE_DATA_WIDTH => 32,
      C_M_AXI_TRIANGLE_BUNDLE_AWUSER_WIDTH => 1,
      C_M_AXI_TRIANGLE_BUNDLE_ARUSER_WIDTH => 1,
      C_M_AXI_TRIANGLE_BUNDLE_WUSER_WIDTH => 1,
      C_M_AXI_TRIANGLE_BUNDLE_RUSER_WIDTH => 1,
      C_M_AXI_TRIANGLE_BUNDLE_BUSER_WIDTH => 1,
      C_M_AXI_TRIANGLE_BUNDLE_USER_VALUE => 0,
      C_M_AXI_TRIANGLE_BUNDLE_PROT_VALUE => 0,
      C_M_AXI_TRIANGLE_BUNDLE_CACHE_VALUE => 3,
      C_M_AXI_RES_BUNDLE_ID_WIDTH => 1,
      C_M_AXI_RES_BUNDLE_ADDR_WIDTH => 32,
      C_M_AXI_RES_BUNDLE_DATA_WIDTH => 32,
      C_M_AXI_RES_BUNDLE_AWUSER_WIDTH => 1,
      C_M_AXI_RES_BUNDLE_ARUSER_WIDTH => 1,
      C_M_AXI_RES_BUNDLE_WUSER_WIDTH => 1,
      C_M_AXI_RES_BUNDLE_RUSER_WIDTH => 1,
      C_M_AXI_RES_BUNDLE_BUSER_WIDTH => 1,
      C_M_AXI_RES_BUNDLE_USER_VALUE => 0,
      C_M_AXI_RES_BUNDLE_PROT_VALUE => 0,
      C_M_AXI_RES_BUNDLE_CACHE_VALUE => 3
    )
    PORT MAP (
      s_axi_ret_bundle_AWADDR => s_axi_ret_bundle_AWADDR,
      s_axi_ret_bundle_AWVALID => s_axi_ret_bundle_AWVALID,
      s_axi_ret_bundle_AWREADY => s_axi_ret_bundle_AWREADY,
      s_axi_ret_bundle_WDATA => s_axi_ret_bundle_WDATA,
      s_axi_ret_bundle_WSTRB => s_axi_ret_bundle_WSTRB,
      s_axi_ret_bundle_WVALID => s_axi_ret_bundle_WVALID,
      s_axi_ret_bundle_WREADY => s_axi_ret_bundle_WREADY,
      s_axi_ret_bundle_BRESP => s_axi_ret_bundle_BRESP,
      s_axi_ret_bundle_BVALID => s_axi_ret_bundle_BVALID,
      s_axi_ret_bundle_BREADY => s_axi_ret_bundle_BREADY,
      s_axi_ret_bundle_ARADDR => s_axi_ret_bundle_ARADDR,
      s_axi_ret_bundle_ARVALID => s_axi_ret_bundle_ARVALID,
      s_axi_ret_bundle_ARREADY => s_axi_ret_bundle_ARREADY,
      s_axi_ret_bundle_RDATA => s_axi_ret_bundle_RDATA,
      s_axi_ret_bundle_RRESP => s_axi_ret_bundle_RRESP,
      s_axi_ret_bundle_RVALID => s_axi_ret_bundle_RVALID,
      s_axi_ret_bundle_RREADY => s_axi_ret_bundle_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_ray_bundle_AWADDR => m_axi_ray_bundle_AWADDR,
      m_axi_ray_bundle_AWLEN => m_axi_ray_bundle_AWLEN,
      m_axi_ray_bundle_AWSIZE => m_axi_ray_bundle_AWSIZE,
      m_axi_ray_bundle_AWBURST => m_axi_ray_bundle_AWBURST,
      m_axi_ray_bundle_AWLOCK => m_axi_ray_bundle_AWLOCK,
      m_axi_ray_bundle_AWREGION => m_axi_ray_bundle_AWREGION,
      m_axi_ray_bundle_AWCACHE => m_axi_ray_bundle_AWCACHE,
      m_axi_ray_bundle_AWPROT => m_axi_ray_bundle_AWPROT,
      m_axi_ray_bundle_AWQOS => m_axi_ray_bundle_AWQOS,
      m_axi_ray_bundle_AWVALID => m_axi_ray_bundle_AWVALID,
      m_axi_ray_bundle_AWREADY => m_axi_ray_bundle_AWREADY,
      m_axi_ray_bundle_WDATA => m_axi_ray_bundle_WDATA,
      m_axi_ray_bundle_WSTRB => m_axi_ray_bundle_WSTRB,
      m_axi_ray_bundle_WLAST => m_axi_ray_bundle_WLAST,
      m_axi_ray_bundle_WVALID => m_axi_ray_bundle_WVALID,
      m_axi_ray_bundle_WREADY => m_axi_ray_bundle_WREADY,
      m_axi_ray_bundle_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ray_bundle_BRESP => m_axi_ray_bundle_BRESP,
      m_axi_ray_bundle_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ray_bundle_BVALID => m_axi_ray_bundle_BVALID,
      m_axi_ray_bundle_BREADY => m_axi_ray_bundle_BREADY,
      m_axi_ray_bundle_ARADDR => m_axi_ray_bundle_ARADDR,
      m_axi_ray_bundle_ARLEN => m_axi_ray_bundle_ARLEN,
      m_axi_ray_bundle_ARSIZE => m_axi_ray_bundle_ARSIZE,
      m_axi_ray_bundle_ARBURST => m_axi_ray_bundle_ARBURST,
      m_axi_ray_bundle_ARLOCK => m_axi_ray_bundle_ARLOCK,
      m_axi_ray_bundle_ARREGION => m_axi_ray_bundle_ARREGION,
      m_axi_ray_bundle_ARCACHE => m_axi_ray_bundle_ARCACHE,
      m_axi_ray_bundle_ARPROT => m_axi_ray_bundle_ARPROT,
      m_axi_ray_bundle_ARQOS => m_axi_ray_bundle_ARQOS,
      m_axi_ray_bundle_ARVALID => m_axi_ray_bundle_ARVALID,
      m_axi_ray_bundle_ARREADY => m_axi_ray_bundle_ARREADY,
      m_axi_ray_bundle_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ray_bundle_RDATA => m_axi_ray_bundle_RDATA,
      m_axi_ray_bundle_RRESP => m_axi_ray_bundle_RRESP,
      m_axi_ray_bundle_RLAST => m_axi_ray_bundle_RLAST,
      m_axi_ray_bundle_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ray_bundle_RVALID => m_axi_ray_bundle_RVALID,
      m_axi_ray_bundle_RREADY => m_axi_ray_bundle_RREADY,
      m_axi_triangle_bundle_AWADDR => m_axi_triangle_bundle_AWADDR,
      m_axi_triangle_bundle_AWLEN => m_axi_triangle_bundle_AWLEN,
      m_axi_triangle_bundle_AWSIZE => m_axi_triangle_bundle_AWSIZE,
      m_axi_triangle_bundle_AWBURST => m_axi_triangle_bundle_AWBURST,
      m_axi_triangle_bundle_AWLOCK => m_axi_triangle_bundle_AWLOCK,
      m_axi_triangle_bundle_AWREGION => m_axi_triangle_bundle_AWREGION,
      m_axi_triangle_bundle_AWCACHE => m_axi_triangle_bundle_AWCACHE,
      m_axi_triangle_bundle_AWPROT => m_axi_triangle_bundle_AWPROT,
      m_axi_triangle_bundle_AWQOS => m_axi_triangle_bundle_AWQOS,
      m_axi_triangle_bundle_AWVALID => m_axi_triangle_bundle_AWVALID,
      m_axi_triangle_bundle_AWREADY => m_axi_triangle_bundle_AWREADY,
      m_axi_triangle_bundle_WDATA => m_axi_triangle_bundle_WDATA,
      m_axi_triangle_bundle_WSTRB => m_axi_triangle_bundle_WSTRB,
      m_axi_triangle_bundle_WLAST => m_axi_triangle_bundle_WLAST,
      m_axi_triangle_bundle_WVALID => m_axi_triangle_bundle_WVALID,
      m_axi_triangle_bundle_WREADY => m_axi_triangle_bundle_WREADY,
      m_axi_triangle_bundle_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_triangle_bundle_BRESP => m_axi_triangle_bundle_BRESP,
      m_axi_triangle_bundle_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_triangle_bundle_BVALID => m_axi_triangle_bundle_BVALID,
      m_axi_triangle_bundle_BREADY => m_axi_triangle_bundle_BREADY,
      m_axi_triangle_bundle_ARADDR => m_axi_triangle_bundle_ARADDR,
      m_axi_triangle_bundle_ARLEN => m_axi_triangle_bundle_ARLEN,
      m_axi_triangle_bundle_ARSIZE => m_axi_triangle_bundle_ARSIZE,
      m_axi_triangle_bundle_ARBURST => m_axi_triangle_bundle_ARBURST,
      m_axi_triangle_bundle_ARLOCK => m_axi_triangle_bundle_ARLOCK,
      m_axi_triangle_bundle_ARREGION => m_axi_triangle_bundle_ARREGION,
      m_axi_triangle_bundle_ARCACHE => m_axi_triangle_bundle_ARCACHE,
      m_axi_triangle_bundle_ARPROT => m_axi_triangle_bundle_ARPROT,
      m_axi_triangle_bundle_ARQOS => m_axi_triangle_bundle_ARQOS,
      m_axi_triangle_bundle_ARVALID => m_axi_triangle_bundle_ARVALID,
      m_axi_triangle_bundle_ARREADY => m_axi_triangle_bundle_ARREADY,
      m_axi_triangle_bundle_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_triangle_bundle_RDATA => m_axi_triangle_bundle_RDATA,
      m_axi_triangle_bundle_RRESP => m_axi_triangle_bundle_RRESP,
      m_axi_triangle_bundle_RLAST => m_axi_triangle_bundle_RLAST,
      m_axi_triangle_bundle_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_triangle_bundle_RVALID => m_axi_triangle_bundle_RVALID,
      m_axi_triangle_bundle_RREADY => m_axi_triangle_bundle_RREADY,
      m_axi_res_bundle_AWADDR => m_axi_res_bundle_AWADDR,
      m_axi_res_bundle_AWLEN => m_axi_res_bundle_AWLEN,
      m_axi_res_bundle_AWSIZE => m_axi_res_bundle_AWSIZE,
      m_axi_res_bundle_AWBURST => m_axi_res_bundle_AWBURST,
      m_axi_res_bundle_AWLOCK => m_axi_res_bundle_AWLOCK,
      m_axi_res_bundle_AWREGION => m_axi_res_bundle_AWREGION,
      m_axi_res_bundle_AWCACHE => m_axi_res_bundle_AWCACHE,
      m_axi_res_bundle_AWPROT => m_axi_res_bundle_AWPROT,
      m_axi_res_bundle_AWQOS => m_axi_res_bundle_AWQOS,
      m_axi_res_bundle_AWVALID => m_axi_res_bundle_AWVALID,
      m_axi_res_bundle_AWREADY => m_axi_res_bundle_AWREADY,
      m_axi_res_bundle_WDATA => m_axi_res_bundle_WDATA,
      m_axi_res_bundle_WSTRB => m_axi_res_bundle_WSTRB,
      m_axi_res_bundle_WLAST => m_axi_res_bundle_WLAST,
      m_axi_res_bundle_WVALID => m_axi_res_bundle_WVALID,
      m_axi_res_bundle_WREADY => m_axi_res_bundle_WREADY,
      m_axi_res_bundle_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_res_bundle_BRESP => m_axi_res_bundle_BRESP,
      m_axi_res_bundle_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_res_bundle_BVALID => m_axi_res_bundle_BVALID,
      m_axi_res_bundle_BREADY => m_axi_res_bundle_BREADY,
      m_axi_res_bundle_ARADDR => m_axi_res_bundle_ARADDR,
      m_axi_res_bundle_ARLEN => m_axi_res_bundle_ARLEN,
      m_axi_res_bundle_ARSIZE => m_axi_res_bundle_ARSIZE,
      m_axi_res_bundle_ARBURST => m_axi_res_bundle_ARBURST,
      m_axi_res_bundle_ARLOCK => m_axi_res_bundle_ARLOCK,
      m_axi_res_bundle_ARREGION => m_axi_res_bundle_ARREGION,
      m_axi_res_bundle_ARCACHE => m_axi_res_bundle_ARCACHE,
      m_axi_res_bundle_ARPROT => m_axi_res_bundle_ARPROT,
      m_axi_res_bundle_ARQOS => m_axi_res_bundle_ARQOS,
      m_axi_res_bundle_ARVALID => m_axi_res_bundle_ARVALID,
      m_axi_res_bundle_ARREADY => m_axi_res_bundle_ARREADY,
      m_axi_res_bundle_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_res_bundle_RDATA => m_axi_res_bundle_RDATA,
      m_axi_res_bundle_RRESP => m_axi_res_bundle_RRESP,
      m_axi_res_bundle_RLAST => m_axi_res_bundle_RLAST,
      m_axi_res_bundle_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_res_bundle_RVALID => m_axi_res_bundle_RVALID,
      m_axi_res_bundle_RREADY => m_axi_res_bundle_RREADY
    );
END Base_Block_Diagram_rayTI_0_0_arch;
