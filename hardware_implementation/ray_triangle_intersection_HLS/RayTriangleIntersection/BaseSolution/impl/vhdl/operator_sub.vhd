-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity operator_sub is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_Vec3_float_x_AWVALID : OUT STD_LOGIC;
    m_axi_Vec3_float_x_AWREADY : IN STD_LOGIC;
    m_axi_Vec3_float_x_AWADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_Vec3_float_x_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_Vec3_float_x_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_Vec3_float_x_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_Vec3_float_x_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_Vec3_float_x_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_Vec3_float_x_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_WVALID : OUT STD_LOGIC;
    m_axi_Vec3_float_x_WREADY : IN STD_LOGIC;
    m_axi_Vec3_float_x_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_Vec3_float_x_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_WLAST : OUT STD_LOGIC;
    m_axi_Vec3_float_x_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_ARVALID : OUT STD_LOGIC;
    m_axi_Vec3_float_x_ARREADY : IN STD_LOGIC;
    m_axi_Vec3_float_x_ARADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_Vec3_float_x_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_Vec3_float_x_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_Vec3_float_x_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_Vec3_float_x_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_Vec3_float_x_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_Vec3_float_x_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_Vec3_float_x_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_RVALID : IN STD_LOGIC;
    m_axi_Vec3_float_x_RREADY : OUT STD_LOGIC;
    m_axi_Vec3_float_x_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_Vec3_float_x_RLAST : IN STD_LOGIC;
    m_axi_Vec3_float_x_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_Vec3_float_x_BVALID : IN STD_LOGIC;
    m_axi_Vec3_float_x_BREADY : OUT STD_LOGIC;
    m_axi_Vec3_float_x_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_Vec3_float_x_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_Vec3_float_x_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    Vec3_float_x_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    Vec3_float_y_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    Vec3_float_z_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    m_axi_v_x_AWVALID : OUT STD_LOGIC;
    m_axi_v_x_AWREADY : IN STD_LOGIC;
    m_axi_v_x_AWADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_v_x_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_v_x_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_v_x_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_v_x_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_v_x_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_v_x_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_WVALID : OUT STD_LOGIC;
    m_axi_v_x_WREADY : IN STD_LOGIC;
    m_axi_v_x_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_v_x_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_WLAST : OUT STD_LOGIC;
    m_axi_v_x_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_ARVALID : OUT STD_LOGIC;
    m_axi_v_x_ARREADY : IN STD_LOGIC;
    m_axi_v_x_ARADDR : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_v_x_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_v_x_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_v_x_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_v_x_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_v_x_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_v_x_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_v_x_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_RVALID : IN STD_LOGIC;
    m_axi_v_x_RREADY : OUT STD_LOGIC;
    m_axi_v_x_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_v_x_RLAST : IN STD_LOGIC;
    m_axi_v_x_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_v_x_BVALID : IN STD_LOGIC;
    m_axi_v_x_BREADY : OUT STD_LOGIC;
    m_axi_v_x_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_v_x_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_v_x_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    v_x_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    v_y_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    v_z_offset : IN STD_LOGIC_VECTOR (29 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of operator_sub is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (14 downto 0) := "000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (14 downto 0) := "000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (14 downto 0) := "000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (14 downto 0) := "000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (14 downto 0) := "000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (14 downto 0) := "000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (14 downto 0) := "000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (14 downto 0) := "000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (14 downto 0) := "000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (14 downto 0) := "001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (14 downto 0) := "010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (14 downto 0) := "100000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal Vec3_float_x_blk_n_AR : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal Vec3_float_x_blk_n_R : STD_LOGIC;
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal v_x_blk_n_AR : STD_LOGIC;
    signal v_x_blk_n_R : STD_LOGIC;
    signal ap_block_state1_io : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal Vec3_x_addr_7_read_reg_272 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state8 : BOOLEAN;
    signal v_x_addr_2_read_reg_277 : STD_LOGIC_VECTOR (31 downto 0);
    signal Vec3_x_addr_6_read_reg_282 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state9 : BOOLEAN;
    signal v_x_addr_1_read_reg_287 : STD_LOGIC_VECTOR (31 downto 0);
    signal Vec3_x_addr_read_reg_292 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state10 : BOOLEAN;
    signal v_x_addr_read_reg_297 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_150_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xx_assign_reg_302 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal yy_assign_reg_307 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal zext_ln87_7_fu_154_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln87_10_fu_165_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln87_6_fu_176_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln87_9_fu_187_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln87_fu_198_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln87_8_fu_209_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_150_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_150_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal grp_fu_150_ce : STD_LOGIC;
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal ap_return_0_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_return_1_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_return_2_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (14 downto 0);

    component rayTI_fsub_32ns_3bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    rayTI_fsub_32ns_3bkb_U27 : component rayTI_fsub_32ns_3bkb
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_150_p0,
        din1 => grp_fu_150_p1,
        ce => grp_fu_150_ce,
        dout => grp_fu_150_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_return_0_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_0_preg <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_0_preg <= xx_assign_reg_302;
                end if; 
            end if;
        end if;
    end process;


    ap_return_1_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_1_preg <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_1_preg <= yy_assign_reg_307;
                end if; 
            end if;
        end if;
    end process;


    ap_return_2_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_2_preg <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    ap_return_2_preg <= grp_fu_150_p2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                Vec3_x_addr_6_read_reg_282 <= m_axi_Vec3_float_x_RDATA;
                v_x_addr_1_read_reg_287 <= m_axi_v_x_RDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                Vec3_x_addr_7_read_reg_272 <= m_axi_Vec3_float_x_RDATA;
                v_x_addr_2_read_reg_277 <= m_axi_v_x_RDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                Vec3_x_addr_read_reg_292 <= m_axi_Vec3_float_x_RDATA;
                v_x_addr_read_reg_297 <= m_axi_v_x_RDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state13)) then
                xx_assign_reg_302 <= grp_fu_150_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state14)) then
                yy_assign_reg_307 <= grp_fu_150_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID, ap_CS_fsm_state3, ap_CS_fsm_state10, ap_CS_fsm_state2, ap_CS_fsm_state9, ap_CS_fsm_state8, ap_block_state1_io, ap_block_state2_io, ap_block_state3_io)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_boolean_0 = ap_block_state2_io) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_boolean_0 = ap_block_state3_io) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                if ((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                if ((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state10 => 
                if ((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state11;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXX";
        end case;
    end process;

    Vec3_float_x_blk_n_AR_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_Vec3_float_x_ARREADY, ap_CS_fsm_state3, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            Vec3_float_x_blk_n_AR <= m_axi_Vec3_float_x_ARREADY;
        else 
            Vec3_float_x_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    Vec3_float_x_blk_n_R_assign_proc : process(m_axi_Vec3_float_x_RVALID, ap_CS_fsm_state10, ap_CS_fsm_state9, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            Vec3_float_x_blk_n_R <= m_axi_Vec3_float_x_RVALID;
        else 
            Vec3_float_x_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;

    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_block_state10_assign_proc : process(m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID)
    begin
                ap_block_state10 <= ((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0));
    end process;


    ap_block_state1_io_assign_proc : process(m_axi_Vec3_float_x_ARREADY, m_axi_v_x_ARREADY)
    begin
                ap_block_state1_io <= ((m_axi_Vec3_float_x_ARREADY = ap_const_logic_0) or (m_axi_v_x_ARREADY = ap_const_logic_0));
    end process;


    ap_block_state2_io_assign_proc : process(m_axi_Vec3_float_x_ARREADY, m_axi_v_x_ARREADY)
    begin
                ap_block_state2_io <= ((m_axi_Vec3_float_x_ARREADY = ap_const_logic_0) or (m_axi_v_x_ARREADY = ap_const_logic_0));
    end process;


    ap_block_state3_io_assign_proc : process(m_axi_Vec3_float_x_ARREADY, m_axi_v_x_ARREADY)
    begin
                ap_block_state3_io <= ((m_axi_Vec3_float_x_ARREADY = ap_const_logic_0) or (m_axi_v_x_ARREADY = ap_const_logic_0));
    end process;


    ap_block_state8_assign_proc : process(m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID)
    begin
                ap_block_state8 <= ((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0));
    end process;


    ap_block_state9_assign_proc : process(m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID)
    begin
                ap_block_state9 <= ((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state15)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state15) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state15)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_0_assign_proc : process(xx_assign_reg_302, ap_CS_fsm_state15, ap_return_0_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_0 <= xx_assign_reg_302;
        else 
            ap_return_0 <= ap_return_0_preg;
        end if; 
    end process;


    ap_return_1_assign_proc : process(yy_assign_reg_307, ap_CS_fsm_state15, ap_return_1_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_1 <= yy_assign_reg_307;
        else 
            ap_return_1 <= ap_return_1_preg;
        end if; 
    end process;


    ap_return_2_assign_proc : process(grp_fu_150_p2, ap_CS_fsm_state15, ap_return_2_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
            ap_return_2 <= grp_fu_150_p2;
        else 
            ap_return_2 <= ap_return_2_preg;
        end if; 
    end process;


    grp_fu_150_ce_assign_proc : process(m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID, ap_CS_fsm_state10, ap_CS_fsm_state9, ap_CS_fsm_state13, ap_CS_fsm_state14, ap_CS_fsm_state11, ap_CS_fsm_state15, ap_CS_fsm_state12)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state12) or (ap_const_logic_1 = ap_CS_fsm_state15) or (ap_const_logic_1 = ap_CS_fsm_state11) or (ap_const_logic_1 = ap_CS_fsm_state14) or (ap_const_logic_1 = ap_CS_fsm_state13) or (not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state9)) or (not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10)))) then 
            grp_fu_150_ce <= ap_const_logic_1;
        else 
            grp_fu_150_ce <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_150_p0_assign_proc : process(ap_CS_fsm_state10, ap_CS_fsm_state9, Vec3_x_addr_7_read_reg_272, Vec3_x_addr_6_read_reg_282, Vec3_x_addr_read_reg_292, ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            grp_fu_150_p0 <= Vec3_x_addr_read_reg_292;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_150_p0 <= Vec3_x_addr_6_read_reg_282;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            grp_fu_150_p0 <= Vec3_x_addr_7_read_reg_272;
        else 
            grp_fu_150_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_150_p1_assign_proc : process(ap_CS_fsm_state10, ap_CS_fsm_state9, v_x_addr_2_read_reg_277, v_x_addr_1_read_reg_287, v_x_addr_read_reg_297, ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            grp_fu_150_p1 <= v_x_addr_read_reg_297;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            grp_fu_150_p1 <= v_x_addr_1_read_reg_287;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            grp_fu_150_p1 <= v_x_addr_2_read_reg_277;
        else 
            grp_fu_150_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axi_Vec3_float_x_ARADDR_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3, ap_CS_fsm_state2, ap_block_state1_io, ap_block_state2_io, ap_block_state3_io, zext_ln87_10_fu_165_p1, zext_ln87_9_fu_187_p1, zext_ln87_8_fu_209_p1)
    begin
        if (((ap_const_boolean_0 = ap_block_state3_io) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_Vec3_float_x_ARADDR <= zext_ln87_8_fu_209_p1(32 - 1 downto 0);
        elsif (((ap_const_boolean_0 = ap_block_state2_io) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_Vec3_float_x_ARADDR <= zext_ln87_9_fu_187_p1(32 - 1 downto 0);
        elsif ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_Vec3_float_x_ARADDR <= zext_ln87_10_fu_165_p1(32 - 1 downto 0);
        else 
            m_axi_Vec3_float_x_ARADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    m_axi_Vec3_float_x_ARBURST <= ap_const_lv2_0;
    m_axi_Vec3_float_x_ARCACHE <= ap_const_lv4_0;
    m_axi_Vec3_float_x_ARID <= ap_const_lv1_0;
    m_axi_Vec3_float_x_ARLEN <= ap_const_lv32_1;
    m_axi_Vec3_float_x_ARLOCK <= ap_const_lv2_0;
    m_axi_Vec3_float_x_ARPROT <= ap_const_lv3_0;
    m_axi_Vec3_float_x_ARQOS <= ap_const_lv4_0;
    m_axi_Vec3_float_x_ARREGION <= ap_const_lv4_0;
    m_axi_Vec3_float_x_ARSIZE <= ap_const_lv3_0;
    m_axi_Vec3_float_x_ARUSER <= ap_const_lv1_0;

    m_axi_Vec3_float_x_ARVALID_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3, ap_CS_fsm_state2, ap_block_state1_io, ap_block_state2_io, ap_block_state3_io)
    begin
        if (((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_boolean_0 = ap_block_state2_io) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_boolean_0 = ap_block_state3_io) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            m_axi_Vec3_float_x_ARVALID <= ap_const_logic_1;
        else 
            m_axi_Vec3_float_x_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_Vec3_float_x_AWADDR <= ap_const_lv32_0;
    m_axi_Vec3_float_x_AWBURST <= ap_const_lv2_0;
    m_axi_Vec3_float_x_AWCACHE <= ap_const_lv4_0;
    m_axi_Vec3_float_x_AWID <= ap_const_lv1_0;
    m_axi_Vec3_float_x_AWLEN <= ap_const_lv32_0;
    m_axi_Vec3_float_x_AWLOCK <= ap_const_lv2_0;
    m_axi_Vec3_float_x_AWPROT <= ap_const_lv3_0;
    m_axi_Vec3_float_x_AWQOS <= ap_const_lv4_0;
    m_axi_Vec3_float_x_AWREGION <= ap_const_lv4_0;
    m_axi_Vec3_float_x_AWSIZE <= ap_const_lv3_0;
    m_axi_Vec3_float_x_AWUSER <= ap_const_lv1_0;
    m_axi_Vec3_float_x_AWVALID <= ap_const_logic_0;
    m_axi_Vec3_float_x_BREADY <= ap_const_logic_0;

    m_axi_Vec3_float_x_RREADY_assign_proc : process(m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID, ap_CS_fsm_state10, ap_CS_fsm_state9, ap_CS_fsm_state8)
    begin
        if (((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state8)) or (not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state9)) or (not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10)))) then 
            m_axi_Vec3_float_x_RREADY <= ap_const_logic_1;
        else 
            m_axi_Vec3_float_x_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_Vec3_float_x_WDATA <= ap_const_lv32_0;
    m_axi_Vec3_float_x_WID <= ap_const_lv1_0;
    m_axi_Vec3_float_x_WLAST <= ap_const_logic_0;
    m_axi_Vec3_float_x_WSTRB <= ap_const_lv4_0;
    m_axi_Vec3_float_x_WUSER <= ap_const_lv1_0;
    m_axi_Vec3_float_x_WVALID <= ap_const_logic_0;

    m_axi_v_x_ARADDR_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3, ap_CS_fsm_state2, ap_block_state1_io, ap_block_state2_io, ap_block_state3_io, zext_ln87_7_fu_154_p1, zext_ln87_6_fu_176_p1, zext_ln87_fu_198_p1)
    begin
        if (((ap_const_boolean_0 = ap_block_state3_io) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_v_x_ARADDR <= zext_ln87_fu_198_p1(32 - 1 downto 0);
        elsif (((ap_const_boolean_0 = ap_block_state2_io) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_v_x_ARADDR <= zext_ln87_6_fu_176_p1(32 - 1 downto 0);
        elsif ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axi_v_x_ARADDR <= zext_ln87_7_fu_154_p1(32 - 1 downto 0);
        else 
            m_axi_v_x_ARADDR <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    m_axi_v_x_ARBURST <= ap_const_lv2_0;
    m_axi_v_x_ARCACHE <= ap_const_lv4_0;
    m_axi_v_x_ARID <= ap_const_lv1_0;
    m_axi_v_x_ARLEN <= ap_const_lv32_1;
    m_axi_v_x_ARLOCK <= ap_const_lv2_0;
    m_axi_v_x_ARPROT <= ap_const_lv3_0;
    m_axi_v_x_ARQOS <= ap_const_lv4_0;
    m_axi_v_x_ARREGION <= ap_const_lv4_0;
    m_axi_v_x_ARSIZE <= ap_const_lv3_0;
    m_axi_v_x_ARUSER <= ap_const_lv1_0;

    m_axi_v_x_ARVALID_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3, ap_CS_fsm_state2, ap_block_state1_io, ap_block_state2_io, ap_block_state3_io)
    begin
        if (((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io))) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_boolean_0 = ap_block_state2_io) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_boolean_0 = ap_block_state3_io) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            m_axi_v_x_ARVALID <= ap_const_logic_1;
        else 
            m_axi_v_x_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_v_x_AWADDR <= ap_const_lv32_0;
    m_axi_v_x_AWBURST <= ap_const_lv2_0;
    m_axi_v_x_AWCACHE <= ap_const_lv4_0;
    m_axi_v_x_AWID <= ap_const_lv1_0;
    m_axi_v_x_AWLEN <= ap_const_lv32_0;
    m_axi_v_x_AWLOCK <= ap_const_lv2_0;
    m_axi_v_x_AWPROT <= ap_const_lv3_0;
    m_axi_v_x_AWQOS <= ap_const_lv4_0;
    m_axi_v_x_AWREGION <= ap_const_lv4_0;
    m_axi_v_x_AWSIZE <= ap_const_lv3_0;
    m_axi_v_x_AWUSER <= ap_const_lv1_0;
    m_axi_v_x_AWVALID <= ap_const_logic_0;
    m_axi_v_x_BREADY <= ap_const_logic_0;

    m_axi_v_x_RREADY_assign_proc : process(m_axi_Vec3_float_x_RVALID, m_axi_v_x_RVALID, ap_CS_fsm_state10, ap_CS_fsm_state9, ap_CS_fsm_state8)
    begin
        if (((not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state8)) or (not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state9)) or (not(((m_axi_Vec3_float_x_RVALID = ap_const_logic_0) or (m_axi_v_x_RVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10)))) then 
            m_axi_v_x_RREADY <= ap_const_logic_1;
        else 
            m_axi_v_x_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_v_x_WDATA <= ap_const_lv32_0;
    m_axi_v_x_WID <= ap_const_lv1_0;
    m_axi_v_x_WLAST <= ap_const_logic_0;
    m_axi_v_x_WSTRB <= ap_const_lv4_0;
    m_axi_v_x_WUSER <= ap_const_lv1_0;
    m_axi_v_x_WVALID <= ap_const_logic_0;

    v_x_blk_n_AR_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_v_x_ARREADY, ap_CS_fsm_state3, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            v_x_blk_n_AR <= m_axi_v_x_ARREADY;
        else 
            v_x_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    v_x_blk_n_R_assign_proc : process(m_axi_v_x_RVALID, ap_CS_fsm_state10, ap_CS_fsm_state9, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            v_x_blk_n_R <= m_axi_v_x_RVALID;
        else 
            v_x_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;

    zext_ln87_10_fu_165_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Vec3_float_x_offset),64));
    zext_ln87_6_fu_176_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(v_y_offset),64));
    zext_ln87_7_fu_154_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(v_x_offset),64));
    zext_ln87_8_fu_209_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Vec3_float_z_offset),64));
    zext_ln87_9_fu_187_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Vec3_float_y_offset),64));
    zext_ln87_fu_198_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(v_z_offset),64));
end behav;