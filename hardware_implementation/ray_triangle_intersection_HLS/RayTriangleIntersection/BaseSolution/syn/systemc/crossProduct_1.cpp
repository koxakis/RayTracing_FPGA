// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "crossProduct_1.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic crossProduct_1::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic crossProduct_1::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<19> crossProduct_1::ap_ST_fsm_state1 = "1";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state2 = "10";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state3 = "100";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state4 = "1000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state5 = "10000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state6 = "100000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state7 = "1000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state8 = "10000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state9 = "100000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state10 = "1000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state11 = "10000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state12 = "100000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state13 = "1000000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state14 = "10000000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state15 = "100000000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state16 = "1000000000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state17 = "10000000000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state18 = "100000000000000000";
const sc_lv<19> crossProduct_1::ap_ST_fsm_state19 = "1000000000000000000";
const sc_lv<32> crossProduct_1::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<1> crossProduct_1::ap_const_lv1_0 = "0";
const sc_lv<3> crossProduct_1::ap_const_lv3_0 = "000";
const sc_lv<2> crossProduct_1::ap_const_lv2_0 = "00";
const sc_lv<4> crossProduct_1::ap_const_lv4_0 = "0000";
const sc_lv<32> crossProduct_1::ap_const_lv32_1 = "1";
const sc_lv<32> crossProduct_1::ap_const_lv32_8 = "1000";
const sc_lv<32> crossProduct_1::ap_const_lv32_7 = "111";
const sc_lv<32> crossProduct_1::ap_const_lv32_2 = "10";
const sc_lv<32> crossProduct_1::ap_const_lv32_9 = "1001";
const sc_lv<32> crossProduct_1::ap_const_lv32_A = "1010";
const sc_lv<32> crossProduct_1::ap_const_lv32_D = "1101";
const sc_lv<32> crossProduct_1::ap_const_lv32_E = "1110";
const sc_lv<32> crossProduct_1::ap_const_lv32_12 = "10010";
const bool crossProduct_1::ap_const_boolean_1 = true;

crossProduct_1::crossProduct_1(sc_module_name name) : sc_module(name), mVcdFile(0) {
    rayTI_fsub_32ns_3bkb_U10 = new rayTI_fsub_32ns_3bkb<1,5,32,32,32>("rayTI_fsub_32ns_3bkb_U10");
    rayTI_fsub_32ns_3bkb_U10->clk(ap_clk);
    rayTI_fsub_32ns_3bkb_U10->reset(ap_rst);
    rayTI_fsub_32ns_3bkb_U10->din0(tmp_reg_261);
    rayTI_fsub_32ns_3bkb_U10->din1(tmp_14_reg_266);
    rayTI_fsub_32ns_3bkb_U10->ce(ap_var_for_const0);
    rayTI_fsub_32ns_3bkb_U10->dout(grp_fu_114_p2);
    rayTI_fsub_32ns_3bkb_U11 = new rayTI_fsub_32ns_3bkb<1,5,32,32,32>("rayTI_fsub_32ns_3bkb_U11");
    rayTI_fsub_32ns_3bkb_U11->clk(ap_clk);
    rayTI_fsub_32ns_3bkb_U11->reset(ap_rst);
    rayTI_fsub_32ns_3bkb_U11->din0(tmp_s_reg_271);
    rayTI_fsub_32ns_3bkb_U11->din1(tmp_15_reg_276);
    rayTI_fsub_32ns_3bkb_U11->ce(ap_var_for_const0);
    rayTI_fsub_32ns_3bkb_U11->dout(grp_fu_118_p2);
    rayTI_fsub_32ns_3bkb_U12 = new rayTI_fsub_32ns_3bkb<1,5,32,32,32>("rayTI_fsub_32ns_3bkb_U12");
    rayTI_fsub_32ns_3bkb_U12->clk(ap_clk);
    rayTI_fsub_32ns_3bkb_U12->reset(ap_rst);
    rayTI_fsub_32ns_3bkb_U12->din0(tmp_16_reg_281);
    rayTI_fsub_32ns_3bkb_U12->din1(tmp_17_reg_286);
    rayTI_fsub_32ns_3bkb_U12->ce(ap_var_for_const0);
    rayTI_fsub_32ns_3bkb_U12->dout(grp_fu_122_p2);
    rayTI_fmul_32ns_3cud_U13 = new rayTI_fmul_32ns_3cud<1,4,32,32,32>("rayTI_fmul_32ns_3cud_U13");
    rayTI_fmul_32ns_3cud_U13->clk(ap_clk);
    rayTI_fmul_32ns_3cud_U13->reset(ap_rst);
    rayTI_fmul_32ns_3cud_U13->din0(Vec3_x_addr_10_read_reg_225);
    rayTI_fmul_32ns_3cud_U13->din1(v_z_read);
    rayTI_fmul_32ns_3cud_U13->ce(ap_var_for_const0);
    rayTI_fmul_32ns_3cud_U13->dout(grp_fu_126_p2);
    rayTI_fmul_32ns_3cud_U14 = new rayTI_fmul_32ns_3cud<1,4,32,32,32>("rayTI_fmul_32ns_3cud_U14");
    rayTI_fmul_32ns_3cud_U14->clk(ap_clk);
    rayTI_fmul_32ns_3cud_U14->reset(ap_rst);
    rayTI_fmul_32ns_3cud_U14->din0(Vec3_x_addr_read_reg_231);
    rayTI_fmul_32ns_3cud_U14->din1(v_y_read);
    rayTI_fmul_32ns_3cud_U14->ce(ap_var_for_const0);
    rayTI_fmul_32ns_3cud_U14->dout(grp_fu_131_p2);
    rayTI_fmul_32ns_3cud_U15 = new rayTI_fmul_32ns_3cud<1,4,32,32,32>("rayTI_fmul_32ns_3cud_U15");
    rayTI_fmul_32ns_3cud_U15->clk(ap_clk);
    rayTI_fmul_32ns_3cud_U15->reset(ap_rst);
    rayTI_fmul_32ns_3cud_U15->din0(Vec3_x_addr_read_reg_231);
    rayTI_fmul_32ns_3cud_U15->din1(v_x_read);
    rayTI_fmul_32ns_3cud_U15->ce(ap_var_for_const0);
    rayTI_fmul_32ns_3cud_U15->dout(grp_fu_136_p2);
    rayTI_fmul_32ns_3cud_U16 = new rayTI_fmul_32ns_3cud<1,4,32,32,32>("rayTI_fmul_32ns_3cud_U16");
    rayTI_fmul_32ns_3cud_U16->clk(ap_clk);
    rayTI_fmul_32ns_3cud_U16->reset(ap_rst);
    rayTI_fmul_32ns_3cud_U16->din0(Vec3_x_addr_11_read_reg_237);
    rayTI_fmul_32ns_3cud_U16->din1(v_z_read);
    rayTI_fmul_32ns_3cud_U16->ce(ap_var_for_const0);
    rayTI_fmul_32ns_3cud_U16->dout(grp_fu_141_p2);
    rayTI_fmul_32ns_3cud_U17 = new rayTI_fmul_32ns_3cud<1,4,32,32,32>("rayTI_fmul_32ns_3cud_U17");
    rayTI_fmul_32ns_3cud_U17->clk(ap_clk);
    rayTI_fmul_32ns_3cud_U17->reset(ap_rst);
    rayTI_fmul_32ns_3cud_U17->din0(Vec3_x_addr_11_read_reg_237);
    rayTI_fmul_32ns_3cud_U17->din1(v_y_read);
    rayTI_fmul_32ns_3cud_U17->ce(ap_var_for_const0);
    rayTI_fmul_32ns_3cud_U17->dout(grp_fu_146_p2);
    rayTI_fmul_32ns_3cud_U18 = new rayTI_fmul_32ns_3cud<1,4,32,32,32>("rayTI_fmul_32ns_3cud_U18");
    rayTI_fmul_32ns_3cud_U18->clk(ap_clk);
    rayTI_fmul_32ns_3cud_U18->reset(ap_rst);
    rayTI_fmul_32ns_3cud_U18->din0(Vec3_x_addr_10_read_reg_225);
    rayTI_fmul_32ns_3cud_U18->din1(v_x_read);
    rayTI_fmul_32ns_3cud_U18->ce(ap_var_for_const0);
    rayTI_fmul_32ns_3cud_U18->dout(grp_fu_151_p2);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_Vec3_float_x_blk_n_AR);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( m_axi_Vec3_float_x_ARREADY );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_Vec3_float_x_blk_n_R);
    sensitive << ( m_axi_Vec3_float_x_RVALID );
    sensitive << ( ap_CS_fsm_state9 );
    sensitive << ( ap_CS_fsm_state8 );
    sensitive << ( ap_CS_fsm_state10 );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state10);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state11);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state14);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state15);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state19);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state3);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state8);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state9);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_CS_fsm_state19 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm_state19 );

    SC_METHOD(thread_ap_return_0);
    sensitive << ( grp_fu_114_p2 );
    sensitive << ( ap_CS_fsm_state19 );
    sensitive << ( ap_return_0_preg );

    SC_METHOD(thread_ap_return_1);
    sensitive << ( ap_CS_fsm_state19 );
    sensitive << ( grp_fu_118_p2 );
    sensitive << ( ap_return_1_preg );

    SC_METHOD(thread_ap_return_2);
    sensitive << ( ap_CS_fsm_state19 );
    sensitive << ( grp_fu_122_p2 );
    sensitive << ( ap_return_2_preg );

    SC_METHOD(thread_m_axi_Vec3_float_x_ARADDR);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( m_axi_Vec3_float_x_ARREADY );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( zext_ln107_1_fu_156_p1 );
    sensitive << ( zext_ln107_fu_167_p1 );
    sensitive << ( zext_ln107_2_fu_178_p1 );

    SC_METHOD(thread_m_axi_Vec3_float_x_ARBURST);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARCACHE);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARID);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARLEN);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( m_axi_Vec3_float_x_ARREADY );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_m_axi_Vec3_float_x_ARLOCK);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARPROT);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARQOS);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARREGION);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARSIZE);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARUSER);

    SC_METHOD(thread_m_axi_Vec3_float_x_ARVALID);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( m_axi_Vec3_float_x_ARREADY );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_m_axi_Vec3_float_x_AWADDR);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWBURST);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWCACHE);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWID);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWLEN);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWLOCK);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWPROT);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWQOS);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWREGION);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWSIZE);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWUSER);

    SC_METHOD(thread_m_axi_Vec3_float_x_AWVALID);

    SC_METHOD(thread_m_axi_Vec3_float_x_BREADY);

    SC_METHOD(thread_m_axi_Vec3_float_x_RREADY);
    sensitive << ( m_axi_Vec3_float_x_RVALID );
    sensitive << ( ap_CS_fsm_state9 );
    sensitive << ( ap_CS_fsm_state8 );
    sensitive << ( ap_CS_fsm_state10 );

    SC_METHOD(thread_m_axi_Vec3_float_x_WDATA);

    SC_METHOD(thread_m_axi_Vec3_float_x_WID);

    SC_METHOD(thread_m_axi_Vec3_float_x_WLAST);

    SC_METHOD(thread_m_axi_Vec3_float_x_WSTRB);

    SC_METHOD(thread_m_axi_Vec3_float_x_WUSER);

    SC_METHOD(thread_m_axi_Vec3_float_x_WVALID);

    SC_METHOD(thread_zext_ln107_1_fu_156_p1);
    sensitive << ( Vec3_float_y_offset );

    SC_METHOD(thread_zext_ln107_2_fu_178_p1);
    sensitive << ( Vec3_float_x_offset );

    SC_METHOD(thread_zext_ln107_fu_167_p1);
    sensitive << ( Vec3_float_z_offset );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( m_axi_Vec3_float_x_ARREADY );
    sensitive << ( m_axi_Vec3_float_x_RVALID );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state9 );
    sensitive << ( ap_CS_fsm_state8 );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( ap_CS_fsm_state10 );

    SC_THREAD(thread_ap_var_for_const0);

    ap_CS_fsm = "0000000000000000001";
    ap_return_0_preg = "00000000000000000000000000000000";
    ap_return_1_preg = "00000000000000000000000000000000";
    ap_return_2_preg = "00000000000000000000000000000000";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "crossProduct_1_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWVALID, "(port)m_axi_Vec3_float_x_AWVALID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWREADY, "(port)m_axi_Vec3_float_x_AWREADY");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWADDR, "(port)m_axi_Vec3_float_x_AWADDR");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWID, "(port)m_axi_Vec3_float_x_AWID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWLEN, "(port)m_axi_Vec3_float_x_AWLEN");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWSIZE, "(port)m_axi_Vec3_float_x_AWSIZE");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWBURST, "(port)m_axi_Vec3_float_x_AWBURST");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWLOCK, "(port)m_axi_Vec3_float_x_AWLOCK");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWCACHE, "(port)m_axi_Vec3_float_x_AWCACHE");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWPROT, "(port)m_axi_Vec3_float_x_AWPROT");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWQOS, "(port)m_axi_Vec3_float_x_AWQOS");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWREGION, "(port)m_axi_Vec3_float_x_AWREGION");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_AWUSER, "(port)m_axi_Vec3_float_x_AWUSER");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WVALID, "(port)m_axi_Vec3_float_x_WVALID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WREADY, "(port)m_axi_Vec3_float_x_WREADY");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WDATA, "(port)m_axi_Vec3_float_x_WDATA");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WSTRB, "(port)m_axi_Vec3_float_x_WSTRB");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WLAST, "(port)m_axi_Vec3_float_x_WLAST");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WID, "(port)m_axi_Vec3_float_x_WID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_WUSER, "(port)m_axi_Vec3_float_x_WUSER");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARVALID, "(port)m_axi_Vec3_float_x_ARVALID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARREADY, "(port)m_axi_Vec3_float_x_ARREADY");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARADDR, "(port)m_axi_Vec3_float_x_ARADDR");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARID, "(port)m_axi_Vec3_float_x_ARID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARLEN, "(port)m_axi_Vec3_float_x_ARLEN");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARSIZE, "(port)m_axi_Vec3_float_x_ARSIZE");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARBURST, "(port)m_axi_Vec3_float_x_ARBURST");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARLOCK, "(port)m_axi_Vec3_float_x_ARLOCK");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARCACHE, "(port)m_axi_Vec3_float_x_ARCACHE");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARPROT, "(port)m_axi_Vec3_float_x_ARPROT");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARQOS, "(port)m_axi_Vec3_float_x_ARQOS");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARREGION, "(port)m_axi_Vec3_float_x_ARREGION");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_ARUSER, "(port)m_axi_Vec3_float_x_ARUSER");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RVALID, "(port)m_axi_Vec3_float_x_RVALID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RREADY, "(port)m_axi_Vec3_float_x_RREADY");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RDATA, "(port)m_axi_Vec3_float_x_RDATA");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RLAST, "(port)m_axi_Vec3_float_x_RLAST");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RID, "(port)m_axi_Vec3_float_x_RID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RUSER, "(port)m_axi_Vec3_float_x_RUSER");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_RRESP, "(port)m_axi_Vec3_float_x_RRESP");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_BVALID, "(port)m_axi_Vec3_float_x_BVALID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_BREADY, "(port)m_axi_Vec3_float_x_BREADY");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_BRESP, "(port)m_axi_Vec3_float_x_BRESP");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_BID, "(port)m_axi_Vec3_float_x_BID");
    sc_trace(mVcdFile, m_axi_Vec3_float_x_BUSER, "(port)m_axi_Vec3_float_x_BUSER");
    sc_trace(mVcdFile, Vec3_float_x_offset, "(port)Vec3_float_x_offset");
    sc_trace(mVcdFile, Vec3_float_y_offset, "(port)Vec3_float_y_offset");
    sc_trace(mVcdFile, Vec3_float_z_offset, "(port)Vec3_float_z_offset");
    sc_trace(mVcdFile, v_x_read, "(port)v_x_read");
    sc_trace(mVcdFile, v_y_read, "(port)v_y_read");
    sc_trace(mVcdFile, v_z_read, "(port)v_z_read");
    sc_trace(mVcdFile, ap_return_0, "(port)ap_return_0");
    sc_trace(mVcdFile, ap_return_1, "(port)ap_return_1");
    sc_trace(mVcdFile, ap_return_2, "(port)ap_return_2");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, Vec3_float_x_blk_n_AR, "Vec3_float_x_blk_n_AR");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, Vec3_float_x_blk_n_R, "Vec3_float_x_blk_n_R");
    sc_trace(mVcdFile, ap_CS_fsm_state9, "ap_CS_fsm_state9");
    sc_trace(mVcdFile, ap_CS_fsm_state8, "ap_CS_fsm_state8");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, ap_CS_fsm_state10, "ap_CS_fsm_state10");
    sc_trace(mVcdFile, Vec3_x_addr_10_read_reg_225, "Vec3_x_addr_10_read_reg_225");
    sc_trace(mVcdFile, Vec3_x_addr_read_reg_231, "Vec3_x_addr_read_reg_231");
    sc_trace(mVcdFile, Vec3_x_addr_11_read_reg_237, "Vec3_x_addr_11_read_reg_237");
    sc_trace(mVcdFile, ap_CS_fsm_state11, "ap_CS_fsm_state11");
    sc_trace(mVcdFile, grp_fu_126_p2, "grp_fu_126_p2");
    sc_trace(mVcdFile, tmp_reg_261, "tmp_reg_261");
    sc_trace(mVcdFile, ap_CS_fsm_state14, "ap_CS_fsm_state14");
    sc_trace(mVcdFile, grp_fu_131_p2, "grp_fu_131_p2");
    sc_trace(mVcdFile, tmp_14_reg_266, "tmp_14_reg_266");
    sc_trace(mVcdFile, grp_fu_136_p2, "grp_fu_136_p2");
    sc_trace(mVcdFile, tmp_s_reg_271, "tmp_s_reg_271");
    sc_trace(mVcdFile, grp_fu_141_p2, "grp_fu_141_p2");
    sc_trace(mVcdFile, tmp_15_reg_276, "tmp_15_reg_276");
    sc_trace(mVcdFile, grp_fu_146_p2, "grp_fu_146_p2");
    sc_trace(mVcdFile, tmp_16_reg_281, "tmp_16_reg_281");
    sc_trace(mVcdFile, grp_fu_151_p2, "grp_fu_151_p2");
    sc_trace(mVcdFile, tmp_17_reg_286, "tmp_17_reg_286");
    sc_trace(mVcdFile, zext_ln107_1_fu_156_p1, "zext_ln107_1_fu_156_p1");
    sc_trace(mVcdFile, zext_ln107_fu_167_p1, "zext_ln107_fu_167_p1");
    sc_trace(mVcdFile, zext_ln107_2_fu_178_p1, "zext_ln107_2_fu_178_p1");
    sc_trace(mVcdFile, ap_CS_fsm_state15, "ap_CS_fsm_state15");
    sc_trace(mVcdFile, grp_fu_114_p2, "grp_fu_114_p2");
    sc_trace(mVcdFile, ap_CS_fsm_state19, "ap_CS_fsm_state19");
    sc_trace(mVcdFile, grp_fu_118_p2, "grp_fu_118_p2");
    sc_trace(mVcdFile, grp_fu_122_p2, "grp_fu_122_p2");
    sc_trace(mVcdFile, ap_return_0_preg, "ap_return_0_preg");
    sc_trace(mVcdFile, ap_return_1_preg, "ap_return_1_preg");
    sc_trace(mVcdFile, ap_return_2_preg, "ap_return_2_preg");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

crossProduct_1::~crossProduct_1() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete rayTI_fsub_32ns_3bkb_U10;
    delete rayTI_fsub_32ns_3bkb_U11;
    delete rayTI_fsub_32ns_3bkb_U12;
    delete rayTI_fmul_32ns_3cud_U13;
    delete rayTI_fmul_32ns_3cud_U14;
    delete rayTI_fmul_32ns_3cud_U15;
    delete rayTI_fmul_32ns_3cud_U16;
    delete rayTI_fmul_32ns_3cud_U17;
    delete rayTI_fmul_32ns_3cud_U18;
}

void crossProduct_1::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void crossProduct_1::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_return_0_preg = ap_const_lv32_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
            ap_return_0_preg = grp_fu_114_p2.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_return_1_preg = ap_const_lv32_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
            ap_return_1_preg = grp_fu_118_p2.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_return_2_preg = ap_const_lv32_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
            ap_return_2_preg = grp_fu_122_p2.read();
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state8.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1))) {
        Vec3_x_addr_10_read_reg_225 = m_axi_Vec3_float_x_RDATA.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state10.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1))) {
        Vec3_x_addr_11_read_reg_237 = m_axi_Vec3_float_x_RDATA.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state9.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1))) {
        Vec3_x_addr_read_reg_231 = m_axi_Vec3_float_x_RDATA.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state14.read())) {
        tmp_14_reg_266 = grp_fu_131_p2.read();
        tmp_15_reg_276 = grp_fu_141_p2.read();
        tmp_16_reg_281 = grp_fu_146_p2.read();
        tmp_17_reg_286 = grp_fu_151_p2.read();
        tmp_reg_261 = grp_fu_126_p2.read();
        tmp_s_reg_271 = grp_fu_136_p2.read();
    }
}

void crossProduct_1::thread_Vec3_float_x_blk_n_AR() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
          esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1)) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()))) {
        Vec3_float_x_blk_n_AR = m_axi_Vec3_float_x_ARREADY.read();
    } else {
        Vec3_float_x_blk_n_AR = ap_const_logic_1;
    }
}

void crossProduct_1::thread_Vec3_float_x_blk_n_R() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state9.read()) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state8.read()) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state10.read()))) {
        Vec3_float_x_blk_n_R = m_axi_Vec3_float_x_RVALID.read();
    } else {
        Vec3_float_x_blk_n_R = ap_const_logic_1;
    }
}

void crossProduct_1::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void crossProduct_1::thread_ap_CS_fsm_state10() {
    ap_CS_fsm_state10 = ap_CS_fsm.read()[9];
}

void crossProduct_1::thread_ap_CS_fsm_state11() {
    ap_CS_fsm_state11 = ap_CS_fsm.read()[10];
}

void crossProduct_1::thread_ap_CS_fsm_state14() {
    ap_CS_fsm_state14 = ap_CS_fsm.read()[13];
}

void crossProduct_1::thread_ap_CS_fsm_state15() {
    ap_CS_fsm_state15 = ap_CS_fsm.read()[14];
}

void crossProduct_1::thread_ap_CS_fsm_state19() {
    ap_CS_fsm_state19 = ap_CS_fsm.read()[18];
}

void crossProduct_1::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void crossProduct_1::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void crossProduct_1::thread_ap_CS_fsm_state8() {
    ap_CS_fsm_state8 = ap_CS_fsm.read()[7];
}

void crossProduct_1::thread_ap_CS_fsm_state9() {
    ap_CS_fsm_state9 = ap_CS_fsm.read()[8];
}

void crossProduct_1::thread_ap_done() {
    if (((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read()))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void crossProduct_1::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void crossProduct_1::thread_ap_ready() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void crossProduct_1::thread_ap_return_0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
        ap_return_0 = grp_fu_114_p2.read();
    } else {
        ap_return_0 = ap_return_0_preg.read();
    }
}

void crossProduct_1::thread_ap_return_1() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
        ap_return_1 = grp_fu_118_p2.read();
    } else {
        ap_return_1 = ap_return_1_preg.read();
    }
}

void crossProduct_1::thread_ap_return_2() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state19.read())) {
        ap_return_2 = grp_fu_122_p2.read();
    } else {
        ap_return_2 = ap_return_2_preg.read();
    }
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARADDR() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(m_axi_Vec3_float_x_ARREADY.read(), ap_const_logic_1))) {
        m_axi_Vec3_float_x_ARADDR =  (sc_lv<32>) (zext_ln107_2_fu_178_p1.read());
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(m_axi_Vec3_float_x_ARREADY.read(), ap_const_logic_1))) {
        m_axi_Vec3_float_x_ARADDR =  (sc_lv<32>) (zext_ln107_fu_167_p1.read());
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_const_logic_0, m_axi_Vec3_float_x_ARREADY.read())))) {
        m_axi_Vec3_float_x_ARADDR =  (sc_lv<32>) (zext_ln107_1_fu_156_p1.read());
    } else {
        m_axi_Vec3_float_x_ARADDR = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    }
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARBURST() {
    m_axi_Vec3_float_x_ARBURST = ap_const_lv2_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARCACHE() {
    m_axi_Vec3_float_x_ARCACHE = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARID() {
    m_axi_Vec3_float_x_ARID = ap_const_lv1_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARLEN() {
    m_axi_Vec3_float_x_ARLEN = ap_const_lv32_1;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARLOCK() {
    m_axi_Vec3_float_x_ARLOCK = ap_const_lv2_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARPROT() {
    m_axi_Vec3_float_x_ARPROT = ap_const_lv3_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARQOS() {
    m_axi_Vec3_float_x_ARQOS = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARREGION() {
    m_axi_Vec3_float_x_ARREGION = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARSIZE() {
    m_axi_Vec3_float_x_ARSIZE = ap_const_lv3_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARUSER() {
    m_axi_Vec3_float_x_ARUSER = ap_const_lv1_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_ARVALID() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
          !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_const_logic_0, m_axi_Vec3_float_x_ARREADY.read()))) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
          esl_seteq<1,1,1>(m_axi_Vec3_float_x_ARREADY.read(), ap_const_logic_1)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
          esl_seteq<1,1,1>(m_axi_Vec3_float_x_ARREADY.read(), ap_const_logic_1)))) {
        m_axi_Vec3_float_x_ARVALID = ap_const_logic_1;
    } else {
        m_axi_Vec3_float_x_ARVALID = ap_const_logic_0;
    }
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWADDR() {
    m_axi_Vec3_float_x_AWADDR = ap_const_lv32_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWBURST() {
    m_axi_Vec3_float_x_AWBURST = ap_const_lv2_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWCACHE() {
    m_axi_Vec3_float_x_AWCACHE = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWID() {
    m_axi_Vec3_float_x_AWID = ap_const_lv1_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWLEN() {
    m_axi_Vec3_float_x_AWLEN = ap_const_lv32_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWLOCK() {
    m_axi_Vec3_float_x_AWLOCK = ap_const_lv2_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWPROT() {
    m_axi_Vec3_float_x_AWPROT = ap_const_lv3_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWQOS() {
    m_axi_Vec3_float_x_AWQOS = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWREGION() {
    m_axi_Vec3_float_x_AWREGION = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWSIZE() {
    m_axi_Vec3_float_x_AWSIZE = ap_const_lv3_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWUSER() {
    m_axi_Vec3_float_x_AWUSER = ap_const_lv1_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_AWVALID() {
    m_axi_Vec3_float_x_AWVALID = ap_const_logic_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_BREADY() {
    m_axi_Vec3_float_x_BREADY = ap_const_logic_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_RREADY() {
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state8.read()) && 
          esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state9.read()) && 
          esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1)) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state10.read()) && 
          esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1)))) {
        m_axi_Vec3_float_x_RREADY = ap_const_logic_1;
    } else {
        m_axi_Vec3_float_x_RREADY = ap_const_logic_0;
    }
}

void crossProduct_1::thread_m_axi_Vec3_float_x_WDATA() {
    m_axi_Vec3_float_x_WDATA = ap_const_lv32_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_WID() {
    m_axi_Vec3_float_x_WID = ap_const_lv1_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_WLAST() {
    m_axi_Vec3_float_x_WLAST = ap_const_logic_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_WSTRB() {
    m_axi_Vec3_float_x_WSTRB = ap_const_lv4_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_WUSER() {
    m_axi_Vec3_float_x_WUSER = ap_const_lv1_0;
}

void crossProduct_1::thread_m_axi_Vec3_float_x_WVALID() {
    m_axi_Vec3_float_x_WVALID = ap_const_logic_0;
}

void crossProduct_1::thread_zext_ln107_1_fu_156_p1() {
    zext_ln107_1_fu_156_p1 = esl_zext<64,30>(Vec3_float_y_offset.read());
}

void crossProduct_1::thread_zext_ln107_2_fu_178_p1() {
    zext_ln107_2_fu_178_p1 = esl_zext<64,30>(Vec3_float_x_offset.read());
}

void crossProduct_1::thread_zext_ln107_fu_167_p1() {
    zext_ln107_fu_167_p1 = esl_zext<64,30>(Vec3_float_z_offset.read());
}

void crossProduct_1::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) || esl_seteq<1,1,1>(ap_const_logic_0, m_axi_Vec3_float_x_ARREADY.read())))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_ARREADY.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else {
                ap_NS_fsm = ap_ST_fsm_state2;
            }
            break;
        case 4 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_ARREADY.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state4;
            } else {
                ap_NS_fsm = ap_ST_fsm_state3;
            }
            break;
        case 8 : 
            ap_NS_fsm = ap_ST_fsm_state5;
            break;
        case 16 : 
            ap_NS_fsm = ap_ST_fsm_state6;
            break;
        case 32 : 
            ap_NS_fsm = ap_ST_fsm_state7;
            break;
        case 64 : 
            ap_NS_fsm = ap_ST_fsm_state8;
            break;
        case 128 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state8.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state9;
            } else {
                ap_NS_fsm = ap_ST_fsm_state8;
            }
            break;
        case 256 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state9.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state10;
            } else {
                ap_NS_fsm = ap_ST_fsm_state9;
            }
            break;
        case 512 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state10.read()) && esl_seteq<1,1,1>(m_axi_Vec3_float_x_RVALID.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state11;
            } else {
                ap_NS_fsm = ap_ST_fsm_state10;
            }
            break;
        case 1024 : 
            ap_NS_fsm = ap_ST_fsm_state12;
            break;
        case 2048 : 
            ap_NS_fsm = ap_ST_fsm_state13;
            break;
        case 4096 : 
            ap_NS_fsm = ap_ST_fsm_state14;
            break;
        case 8192 : 
            ap_NS_fsm = ap_ST_fsm_state15;
            break;
        case 16384 : 
            ap_NS_fsm = ap_ST_fsm_state16;
            break;
        case 32768 : 
            ap_NS_fsm = ap_ST_fsm_state17;
            break;
        case 65536 : 
            ap_NS_fsm = ap_ST_fsm_state18;
            break;
        case 131072 : 
            ap_NS_fsm = ap_ST_fsm_state19;
            break;
        case 262144 : 
            ap_NS_fsm = ap_ST_fsm_state1;
            break;
        default : 
            ap_NS_fsm =  (sc_lv<19>) ("XXXXXXXXXXXXXXXXXXX");
            break;
    }
}

}

