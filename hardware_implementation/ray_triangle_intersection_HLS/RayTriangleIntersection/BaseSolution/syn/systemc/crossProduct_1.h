// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _crossProduct_1_HH_
#define _crossProduct_1_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "rayTI_fsub_32ns_3bkb.h"
#include "rayTI_fmul_32ns_3cud.h"

namespace ap_rtl {

struct crossProduct_1 : public sc_module {
    // Port declarations 60
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_logic > m_axi_Vec3_float_x_AWVALID;
    sc_in< sc_logic > m_axi_Vec3_float_x_AWREADY;
    sc_out< sc_lv<32> > m_axi_Vec3_float_x_AWADDR;
    sc_out< sc_lv<1> > m_axi_Vec3_float_x_AWID;
    sc_out< sc_lv<32> > m_axi_Vec3_float_x_AWLEN;
    sc_out< sc_lv<3> > m_axi_Vec3_float_x_AWSIZE;
    sc_out< sc_lv<2> > m_axi_Vec3_float_x_AWBURST;
    sc_out< sc_lv<2> > m_axi_Vec3_float_x_AWLOCK;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_AWCACHE;
    sc_out< sc_lv<3> > m_axi_Vec3_float_x_AWPROT;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_AWQOS;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_AWREGION;
    sc_out< sc_lv<1> > m_axi_Vec3_float_x_AWUSER;
    sc_out< sc_logic > m_axi_Vec3_float_x_WVALID;
    sc_in< sc_logic > m_axi_Vec3_float_x_WREADY;
    sc_out< sc_lv<32> > m_axi_Vec3_float_x_WDATA;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_WSTRB;
    sc_out< sc_logic > m_axi_Vec3_float_x_WLAST;
    sc_out< sc_lv<1> > m_axi_Vec3_float_x_WID;
    sc_out< sc_lv<1> > m_axi_Vec3_float_x_WUSER;
    sc_out< sc_logic > m_axi_Vec3_float_x_ARVALID;
    sc_in< sc_logic > m_axi_Vec3_float_x_ARREADY;
    sc_out< sc_lv<32> > m_axi_Vec3_float_x_ARADDR;
    sc_out< sc_lv<1> > m_axi_Vec3_float_x_ARID;
    sc_out< sc_lv<32> > m_axi_Vec3_float_x_ARLEN;
    sc_out< sc_lv<3> > m_axi_Vec3_float_x_ARSIZE;
    sc_out< sc_lv<2> > m_axi_Vec3_float_x_ARBURST;
    sc_out< sc_lv<2> > m_axi_Vec3_float_x_ARLOCK;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_ARCACHE;
    sc_out< sc_lv<3> > m_axi_Vec3_float_x_ARPROT;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_ARQOS;
    sc_out< sc_lv<4> > m_axi_Vec3_float_x_ARREGION;
    sc_out< sc_lv<1> > m_axi_Vec3_float_x_ARUSER;
    sc_in< sc_logic > m_axi_Vec3_float_x_RVALID;
    sc_out< sc_logic > m_axi_Vec3_float_x_RREADY;
    sc_in< sc_lv<32> > m_axi_Vec3_float_x_RDATA;
    sc_in< sc_logic > m_axi_Vec3_float_x_RLAST;
    sc_in< sc_lv<1> > m_axi_Vec3_float_x_RID;
    sc_in< sc_lv<1> > m_axi_Vec3_float_x_RUSER;
    sc_in< sc_lv<2> > m_axi_Vec3_float_x_RRESP;
    sc_in< sc_logic > m_axi_Vec3_float_x_BVALID;
    sc_out< sc_logic > m_axi_Vec3_float_x_BREADY;
    sc_in< sc_lv<2> > m_axi_Vec3_float_x_BRESP;
    sc_in< sc_lv<1> > m_axi_Vec3_float_x_BID;
    sc_in< sc_lv<1> > m_axi_Vec3_float_x_BUSER;
    sc_in< sc_lv<30> > Vec3_float_x_offset;
    sc_in< sc_lv<30> > Vec3_float_y_offset;
    sc_in< sc_lv<30> > Vec3_float_z_offset;
    sc_in< sc_lv<32> > v_x_read;
    sc_in< sc_lv<32> > v_y_read;
    sc_in< sc_lv<32> > v_z_read;
    sc_out< sc_lv<32> > ap_return_0;
    sc_out< sc_lv<32> > ap_return_1;
    sc_out< sc_lv<32> > ap_return_2;
    sc_signal< sc_logic > ap_var_for_const0;


    // Module declarations
    crossProduct_1(sc_module_name name);
    SC_HAS_PROCESS(crossProduct_1);

    ~crossProduct_1();

    sc_trace_file* mVcdFile;

    rayTI_fsub_32ns_3bkb<1,5,32,32,32>* rayTI_fsub_32ns_3bkb_U10;
    rayTI_fsub_32ns_3bkb<1,5,32,32,32>* rayTI_fsub_32ns_3bkb_U11;
    rayTI_fsub_32ns_3bkb<1,5,32,32,32>* rayTI_fsub_32ns_3bkb_U12;
    rayTI_fmul_32ns_3cud<1,4,32,32,32>* rayTI_fmul_32ns_3cud_U13;
    rayTI_fmul_32ns_3cud<1,4,32,32,32>* rayTI_fmul_32ns_3cud_U14;
    rayTI_fmul_32ns_3cud<1,4,32,32,32>* rayTI_fmul_32ns_3cud_U15;
    rayTI_fmul_32ns_3cud<1,4,32,32,32>* rayTI_fmul_32ns_3cud_U16;
    rayTI_fmul_32ns_3cud<1,4,32,32,32>* rayTI_fmul_32ns_3cud_U17;
    rayTI_fmul_32ns_3cud<1,4,32,32,32>* rayTI_fmul_32ns_3cud_U18;
    sc_signal< sc_lv<19> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > Vec3_float_x_blk_n_AR;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_logic > Vec3_float_x_blk_n_R;
    sc_signal< sc_logic > ap_CS_fsm_state9;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_logic > ap_CS_fsm_state10;
    sc_signal< sc_lv<32> > Vec3_x_addr_10_read_reg_225;
    sc_signal< sc_lv<32> > Vec3_x_addr_read_reg_231;
    sc_signal< sc_lv<32> > Vec3_x_addr_11_read_reg_237;
    sc_signal< sc_logic > ap_CS_fsm_state11;
    sc_signal< sc_lv<32> > grp_fu_126_p2;
    sc_signal< sc_lv<32> > tmp_reg_261;
    sc_signal< sc_logic > ap_CS_fsm_state14;
    sc_signal< sc_lv<32> > grp_fu_131_p2;
    sc_signal< sc_lv<32> > tmp_14_reg_266;
    sc_signal< sc_lv<32> > grp_fu_136_p2;
    sc_signal< sc_lv<32> > tmp_s_reg_271;
    sc_signal< sc_lv<32> > grp_fu_141_p2;
    sc_signal< sc_lv<32> > tmp_15_reg_276;
    sc_signal< sc_lv<32> > grp_fu_146_p2;
    sc_signal< sc_lv<32> > tmp_16_reg_281;
    sc_signal< sc_lv<32> > grp_fu_151_p2;
    sc_signal< sc_lv<32> > tmp_17_reg_286;
    sc_signal< sc_lv<64> > zext_ln107_1_fu_156_p1;
    sc_signal< sc_lv<64> > zext_ln107_fu_167_p1;
    sc_signal< sc_lv<64> > zext_ln107_2_fu_178_p1;
    sc_signal< sc_logic > ap_CS_fsm_state15;
    sc_signal< sc_lv<32> > grp_fu_114_p2;
    sc_signal< sc_logic > ap_CS_fsm_state19;
    sc_signal< sc_lv<32> > grp_fu_118_p2;
    sc_signal< sc_lv<32> > grp_fu_122_p2;
    sc_signal< sc_lv<32> > ap_return_0_preg;
    sc_signal< sc_lv<32> > ap_return_1_preg;
    sc_signal< sc_lv<32> > ap_return_2_preg;
    sc_signal< sc_lv<19> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<19> ap_ST_fsm_state1;
    static const sc_lv<19> ap_ST_fsm_state2;
    static const sc_lv<19> ap_ST_fsm_state3;
    static const sc_lv<19> ap_ST_fsm_state4;
    static const sc_lv<19> ap_ST_fsm_state5;
    static const sc_lv<19> ap_ST_fsm_state6;
    static const sc_lv<19> ap_ST_fsm_state7;
    static const sc_lv<19> ap_ST_fsm_state8;
    static const sc_lv<19> ap_ST_fsm_state9;
    static const sc_lv<19> ap_ST_fsm_state10;
    static const sc_lv<19> ap_ST_fsm_state11;
    static const sc_lv<19> ap_ST_fsm_state12;
    static const sc_lv<19> ap_ST_fsm_state13;
    static const sc_lv<19> ap_ST_fsm_state14;
    static const sc_lv<19> ap_ST_fsm_state15;
    static const sc_lv<19> ap_ST_fsm_state16;
    static const sc_lv<19> ap_ST_fsm_state17;
    static const sc_lv<19> ap_ST_fsm_state18;
    static const sc_lv<19> ap_ST_fsm_state19;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<32> ap_const_lv32_D;
    static const sc_lv<32> ap_const_lv32_E;
    static const sc_lv<32> ap_const_lv32_12;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_clk_no_reset_();
    void thread_Vec3_float_x_blk_n_AR();
    void thread_Vec3_float_x_blk_n_R();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state10();
    void thread_ap_CS_fsm_state11();
    void thread_ap_CS_fsm_state14();
    void thread_ap_CS_fsm_state15();
    void thread_ap_CS_fsm_state19();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state8();
    void thread_ap_CS_fsm_state9();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_return_0();
    void thread_ap_return_1();
    void thread_ap_return_2();
    void thread_m_axi_Vec3_float_x_ARADDR();
    void thread_m_axi_Vec3_float_x_ARBURST();
    void thread_m_axi_Vec3_float_x_ARCACHE();
    void thread_m_axi_Vec3_float_x_ARID();
    void thread_m_axi_Vec3_float_x_ARLEN();
    void thread_m_axi_Vec3_float_x_ARLOCK();
    void thread_m_axi_Vec3_float_x_ARPROT();
    void thread_m_axi_Vec3_float_x_ARQOS();
    void thread_m_axi_Vec3_float_x_ARREGION();
    void thread_m_axi_Vec3_float_x_ARSIZE();
    void thread_m_axi_Vec3_float_x_ARUSER();
    void thread_m_axi_Vec3_float_x_ARVALID();
    void thread_m_axi_Vec3_float_x_AWADDR();
    void thread_m_axi_Vec3_float_x_AWBURST();
    void thread_m_axi_Vec3_float_x_AWCACHE();
    void thread_m_axi_Vec3_float_x_AWID();
    void thread_m_axi_Vec3_float_x_AWLEN();
    void thread_m_axi_Vec3_float_x_AWLOCK();
    void thread_m_axi_Vec3_float_x_AWPROT();
    void thread_m_axi_Vec3_float_x_AWQOS();
    void thread_m_axi_Vec3_float_x_AWREGION();
    void thread_m_axi_Vec3_float_x_AWSIZE();
    void thread_m_axi_Vec3_float_x_AWUSER();
    void thread_m_axi_Vec3_float_x_AWVALID();
    void thread_m_axi_Vec3_float_x_BREADY();
    void thread_m_axi_Vec3_float_x_RREADY();
    void thread_m_axi_Vec3_float_x_WDATA();
    void thread_m_axi_Vec3_float_x_WID();
    void thread_m_axi_Vec3_float_x_WLAST();
    void thread_m_axi_Vec3_float_x_WSTRB();
    void thread_m_axi_Vec3_float_x_WUSER();
    void thread_m_axi_Vec3_float_x_WVALID();
    void thread_zext_ln107_1_fu_156_p1();
    void thread_zext_ln107_2_fu_178_p1();
    void thread_zext_ln107_fu_167_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif