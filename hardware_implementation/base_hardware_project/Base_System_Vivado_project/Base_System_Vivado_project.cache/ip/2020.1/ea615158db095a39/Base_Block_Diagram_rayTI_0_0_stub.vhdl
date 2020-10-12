-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Oct 12 12:27:54 2020
-- Host        : hal9000 running 64-bit Arch Linux
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Base_Block_Diagram_rayTI_0_0_stub.vhdl
-- Design      : Base_Block_Diagram_rayTI_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_ret_bundle_AWADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_ret_bundle_AWVALID : in STD_LOGIC;
    s_axi_ret_bundle_AWREADY : out STD_LOGIC;
    s_axi_ret_bundle_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ret_bundle_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_ret_bundle_WVALID : in STD_LOGIC;
    s_axi_ret_bundle_WREADY : out STD_LOGIC;
    s_axi_ret_bundle_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ret_bundle_BVALID : out STD_LOGIC;
    s_axi_ret_bundle_BREADY : in STD_LOGIC;
    s_axi_ret_bundle_ARADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_ret_bundle_ARVALID : in STD_LOGIC;
    s_axi_ret_bundle_ARREADY : out STD_LOGIC;
    s_axi_ret_bundle_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ret_bundle_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ret_bundle_RVALID : out STD_LOGIC;
    s_axi_ret_bundle_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_ray_bundle_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_ray_bundle_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_ray_bundle_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_ray_bundle_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_ray_bundle_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_ray_bundle_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_ray_bundle_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_AWVALID : out STD_LOGIC;
    m_axi_ray_bundle_AWREADY : in STD_LOGIC;
    m_axi_ray_bundle_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_ray_bundle_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_WLAST : out STD_LOGIC;
    m_axi_ray_bundle_WVALID : out STD_LOGIC;
    m_axi_ray_bundle_WREADY : in STD_LOGIC;
    m_axi_ray_bundle_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_ray_bundle_BVALID : in STD_LOGIC;
    m_axi_ray_bundle_BREADY : out STD_LOGIC;
    m_axi_ray_bundle_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_ray_bundle_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_ray_bundle_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_ray_bundle_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_ray_bundle_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_ray_bundle_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_ray_bundle_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_ray_bundle_ARVALID : out STD_LOGIC;
    m_axi_ray_bundle_ARREADY : in STD_LOGIC;
    m_axi_ray_bundle_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_ray_bundle_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_ray_bundle_RLAST : in STD_LOGIC;
    m_axi_ray_bundle_RVALID : in STD_LOGIC;
    m_axi_ray_bundle_RREADY : out STD_LOGIC;
    m_axi_triangle_bundle_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_triangle_bundle_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_triangle_bundle_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_triangle_bundle_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_triangle_bundle_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_triangle_bundle_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_triangle_bundle_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_AWVALID : out STD_LOGIC;
    m_axi_triangle_bundle_AWREADY : in STD_LOGIC;
    m_axi_triangle_bundle_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_triangle_bundle_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_WLAST : out STD_LOGIC;
    m_axi_triangle_bundle_WVALID : out STD_LOGIC;
    m_axi_triangle_bundle_WREADY : in STD_LOGIC;
    m_axi_triangle_bundle_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_triangle_bundle_BVALID : in STD_LOGIC;
    m_axi_triangle_bundle_BREADY : out STD_LOGIC;
    m_axi_triangle_bundle_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_triangle_bundle_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_triangle_bundle_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_triangle_bundle_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_triangle_bundle_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_triangle_bundle_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_triangle_bundle_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_triangle_bundle_ARVALID : out STD_LOGIC;
    m_axi_triangle_bundle_ARREADY : in STD_LOGIC;
    m_axi_triangle_bundle_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_triangle_bundle_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_triangle_bundle_RLAST : in STD_LOGIC;
    m_axi_triangle_bundle_RVALID : in STD_LOGIC;
    m_axi_triangle_bundle_RREADY : out STD_LOGIC;
    m_axi_res_bundle_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_res_bundle_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_res_bundle_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_res_bundle_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_res_bundle_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_res_bundle_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_res_bundle_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_AWVALID : out STD_LOGIC;
    m_axi_res_bundle_AWREADY : in STD_LOGIC;
    m_axi_res_bundle_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_res_bundle_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_WLAST : out STD_LOGIC;
    m_axi_res_bundle_WVALID : out STD_LOGIC;
    m_axi_res_bundle_WREADY : in STD_LOGIC;
    m_axi_res_bundle_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_res_bundle_BVALID : in STD_LOGIC;
    m_axi_res_bundle_BREADY : out STD_LOGIC;
    m_axi_res_bundle_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_res_bundle_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_res_bundle_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_res_bundle_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_res_bundle_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_res_bundle_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_res_bundle_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_res_bundle_ARVALID : out STD_LOGIC;
    m_axi_res_bundle_ARREADY : in STD_LOGIC;
    m_axi_res_bundle_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_res_bundle_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_res_bundle_RLAST : in STD_LOGIC;
    m_axi_res_bundle_RVALID : in STD_LOGIC;
    m_axi_res_bundle_RREADY : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_ret_bundle_AWADDR[7:0],s_axi_ret_bundle_AWVALID,s_axi_ret_bundle_AWREADY,s_axi_ret_bundle_WDATA[31:0],s_axi_ret_bundle_WSTRB[3:0],s_axi_ret_bundle_WVALID,s_axi_ret_bundle_WREADY,s_axi_ret_bundle_BRESP[1:0],s_axi_ret_bundle_BVALID,s_axi_ret_bundle_BREADY,s_axi_ret_bundle_ARADDR[7:0],s_axi_ret_bundle_ARVALID,s_axi_ret_bundle_ARREADY,s_axi_ret_bundle_RDATA[31:0],s_axi_ret_bundle_RRESP[1:0],s_axi_ret_bundle_RVALID,s_axi_ret_bundle_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_ray_bundle_AWADDR[31:0],m_axi_ray_bundle_AWLEN[7:0],m_axi_ray_bundle_AWSIZE[2:0],m_axi_ray_bundle_AWBURST[1:0],m_axi_ray_bundle_AWLOCK[1:0],m_axi_ray_bundle_AWREGION[3:0],m_axi_ray_bundle_AWCACHE[3:0],m_axi_ray_bundle_AWPROT[2:0],m_axi_ray_bundle_AWQOS[3:0],m_axi_ray_bundle_AWVALID,m_axi_ray_bundle_AWREADY,m_axi_ray_bundle_WDATA[31:0],m_axi_ray_bundle_WSTRB[3:0],m_axi_ray_bundle_WLAST,m_axi_ray_bundle_WVALID,m_axi_ray_bundle_WREADY,m_axi_ray_bundle_BRESP[1:0],m_axi_ray_bundle_BVALID,m_axi_ray_bundle_BREADY,m_axi_ray_bundle_ARADDR[31:0],m_axi_ray_bundle_ARLEN[7:0],m_axi_ray_bundle_ARSIZE[2:0],m_axi_ray_bundle_ARBURST[1:0],m_axi_ray_bundle_ARLOCK[1:0],m_axi_ray_bundle_ARREGION[3:0],m_axi_ray_bundle_ARCACHE[3:0],m_axi_ray_bundle_ARPROT[2:0],m_axi_ray_bundle_ARQOS[3:0],m_axi_ray_bundle_ARVALID,m_axi_ray_bundle_ARREADY,m_axi_ray_bundle_RDATA[31:0],m_axi_ray_bundle_RRESP[1:0],m_axi_ray_bundle_RLAST,m_axi_ray_bundle_RVALID,m_axi_ray_bundle_RREADY,m_axi_triangle_bundle_AWADDR[31:0],m_axi_triangle_bundle_AWLEN[7:0],m_axi_triangle_bundle_AWSIZE[2:0],m_axi_triangle_bundle_AWBURST[1:0],m_axi_triangle_bundle_AWLOCK[1:0],m_axi_triangle_bundle_AWREGION[3:0],m_axi_triangle_bundle_AWCACHE[3:0],m_axi_triangle_bundle_AWPROT[2:0],m_axi_triangle_bundle_AWQOS[3:0],m_axi_triangle_bundle_AWVALID,m_axi_triangle_bundle_AWREADY,m_axi_triangle_bundle_WDATA[31:0],m_axi_triangle_bundle_WSTRB[3:0],m_axi_triangle_bundle_WLAST,m_axi_triangle_bundle_WVALID,m_axi_triangle_bundle_WREADY,m_axi_triangle_bundle_BRESP[1:0],m_axi_triangle_bundle_BVALID,m_axi_triangle_bundle_BREADY,m_axi_triangle_bundle_ARADDR[31:0],m_axi_triangle_bundle_ARLEN[7:0],m_axi_triangle_bundle_ARSIZE[2:0],m_axi_triangle_bundle_ARBURST[1:0],m_axi_triangle_bundle_ARLOCK[1:0],m_axi_triangle_bundle_ARREGION[3:0],m_axi_triangle_bundle_ARCACHE[3:0],m_axi_triangle_bundle_ARPROT[2:0],m_axi_triangle_bundle_ARQOS[3:0],m_axi_triangle_bundle_ARVALID,m_axi_triangle_bundle_ARREADY,m_axi_triangle_bundle_RDATA[31:0],m_axi_triangle_bundle_RRESP[1:0],m_axi_triangle_bundle_RLAST,m_axi_triangle_bundle_RVALID,m_axi_triangle_bundle_RREADY,m_axi_res_bundle_AWADDR[31:0],m_axi_res_bundle_AWLEN[7:0],m_axi_res_bundle_AWSIZE[2:0],m_axi_res_bundle_AWBURST[1:0],m_axi_res_bundle_AWLOCK[1:0],m_axi_res_bundle_AWREGION[3:0],m_axi_res_bundle_AWCACHE[3:0],m_axi_res_bundle_AWPROT[2:0],m_axi_res_bundle_AWQOS[3:0],m_axi_res_bundle_AWVALID,m_axi_res_bundle_AWREADY,m_axi_res_bundle_WDATA[31:0],m_axi_res_bundle_WSTRB[3:0],m_axi_res_bundle_WLAST,m_axi_res_bundle_WVALID,m_axi_res_bundle_WREADY,m_axi_res_bundle_BRESP[1:0],m_axi_res_bundle_BVALID,m_axi_res_bundle_BREADY,m_axi_res_bundle_ARADDR[31:0],m_axi_res_bundle_ARLEN[7:0],m_axi_res_bundle_ARSIZE[2:0],m_axi_res_bundle_ARBURST[1:0],m_axi_res_bundle_ARLOCK[1:0],m_axi_res_bundle_ARREGION[3:0],m_axi_res_bundle_ARCACHE[3:0],m_axi_res_bundle_ARPROT[2:0],m_axi_res_bundle_ARQOS[3:0],m_axi_res_bundle_ARVALID,m_axi_res_bundle_ARREADY,m_axi_res_bundle_RDATA[31:0],m_axi_res_bundle_RRESP[1:0],m_axi_res_bundle_RLAST,m_axi_res_bundle_RVALID,m_axi_res_bundle_RREADY";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rayTI,Vivado 2020.1";
begin
end;
