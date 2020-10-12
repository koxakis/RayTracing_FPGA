// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// ret_bundle
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 0  - ap_return[0] (Read)
//        others - reserved
// 0x18 : Data signal of dir_pading
//        bit 31~0 - dir_pading[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of dir_x
//        bit 31~0 - dir_x[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of dir_y
//        bit 31~0 - dir_y[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of dir_z
//        bit 31~0 - dir_z[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of orig_pading
//        bit 31~0 - orig_pading[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of orig_x
//        bit 31~0 - orig_x[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of orig_y
//        bit 31~0 - orig_y[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of orig_z
//        bit 31~0 - orig_z[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of v0_pading
//        bit 31~0 - v0_pading[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of v0_x
//        bit 31~0 - v0_x[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of v0_y
//        bit 31~0 - v0_y[31:0] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of v0_z
//        bit 31~0 - v0_z[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of v1_pading
//        bit 31~0 - v1_pading[31:0] (Read/Write)
// 0x7c : reserved
// 0x80 : Data signal of v1_x
//        bit 31~0 - v1_x[31:0] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of v1_y
//        bit 31~0 - v1_y[31:0] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of v1_z
//        bit 31~0 - v1_z[31:0] (Read/Write)
// 0x94 : reserved
// 0x98 : Data signal of v2_pading
//        bit 31~0 - v2_pading[31:0] (Read/Write)
// 0x9c : reserved
// 0xa0 : Data signal of v2_x
//        bit 31~0 - v2_x[31:0] (Read/Write)
// 0xa4 : reserved
// 0xa8 : Data signal of v2_y
//        bit 31~0 - v2_y[31:0] (Read/Write)
// 0xac : reserved
// 0xb0 : Data signal of v2_z
//        bit 31~0 - v2_z[31:0] (Read/Write)
// 0xb4 : reserved
// 0xb8 : Data signal of t
//        bit 31~0 - t[31:0] (Read/Write)
// 0xbc : reserved
// 0xc0 : Data signal of u
//        bit 31~0 - u[31:0] (Read/Write)
// 0xc4 : reserved
// 0xc8 : Data signal of v
//        bit 31~0 - v[31:0] (Read/Write)
// 0xcc : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XRAYTI_RET_BUNDLE_ADDR_AP_CTRL          0x00
#define XRAYTI_RET_BUNDLE_ADDR_GIE              0x04
#define XRAYTI_RET_BUNDLE_ADDR_IER              0x08
#define XRAYTI_RET_BUNDLE_ADDR_ISR              0x0c
#define XRAYTI_RET_BUNDLE_ADDR_AP_RETURN        0x10
#define XRAYTI_RET_BUNDLE_BITS_AP_RETURN        1
#define XRAYTI_RET_BUNDLE_ADDR_DIR_PADING_DATA  0x18
#define XRAYTI_RET_BUNDLE_BITS_DIR_PADING_DATA  32
#define XRAYTI_RET_BUNDLE_ADDR_DIR_X_DATA       0x20
#define XRAYTI_RET_BUNDLE_BITS_DIR_X_DATA       32
#define XRAYTI_RET_BUNDLE_ADDR_DIR_Y_DATA       0x28
#define XRAYTI_RET_BUNDLE_BITS_DIR_Y_DATA       32
#define XRAYTI_RET_BUNDLE_ADDR_DIR_Z_DATA       0x30
#define XRAYTI_RET_BUNDLE_BITS_DIR_Z_DATA       32
#define XRAYTI_RET_BUNDLE_ADDR_ORIG_PADING_DATA 0x38
#define XRAYTI_RET_BUNDLE_BITS_ORIG_PADING_DATA 32
#define XRAYTI_RET_BUNDLE_ADDR_ORIG_X_DATA      0x40
#define XRAYTI_RET_BUNDLE_BITS_ORIG_X_DATA      32
#define XRAYTI_RET_BUNDLE_ADDR_ORIG_Y_DATA      0x48
#define XRAYTI_RET_BUNDLE_BITS_ORIG_Y_DATA      32
#define XRAYTI_RET_BUNDLE_ADDR_ORIG_Z_DATA      0x50
#define XRAYTI_RET_BUNDLE_BITS_ORIG_Z_DATA      32
#define XRAYTI_RET_BUNDLE_ADDR_V0_PADING_DATA   0x58
#define XRAYTI_RET_BUNDLE_BITS_V0_PADING_DATA   32
#define XRAYTI_RET_BUNDLE_ADDR_V0_X_DATA        0x60
#define XRAYTI_RET_BUNDLE_BITS_V0_X_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V0_Y_DATA        0x68
#define XRAYTI_RET_BUNDLE_BITS_V0_Y_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V0_Z_DATA        0x70
#define XRAYTI_RET_BUNDLE_BITS_V0_Z_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V1_PADING_DATA   0x78
#define XRAYTI_RET_BUNDLE_BITS_V1_PADING_DATA   32
#define XRAYTI_RET_BUNDLE_ADDR_V1_X_DATA        0x80
#define XRAYTI_RET_BUNDLE_BITS_V1_X_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V1_Y_DATA        0x88
#define XRAYTI_RET_BUNDLE_BITS_V1_Y_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V1_Z_DATA        0x90
#define XRAYTI_RET_BUNDLE_BITS_V1_Z_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V2_PADING_DATA   0x98
#define XRAYTI_RET_BUNDLE_BITS_V2_PADING_DATA   32
#define XRAYTI_RET_BUNDLE_ADDR_V2_X_DATA        0xa0
#define XRAYTI_RET_BUNDLE_BITS_V2_X_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V2_Y_DATA        0xa8
#define XRAYTI_RET_BUNDLE_BITS_V2_Y_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_V2_Z_DATA        0xb0
#define XRAYTI_RET_BUNDLE_BITS_V2_Z_DATA        32
#define XRAYTI_RET_BUNDLE_ADDR_T_DATA           0xb8
#define XRAYTI_RET_BUNDLE_BITS_T_DATA           32
#define XRAYTI_RET_BUNDLE_ADDR_U_DATA           0xc0
#define XRAYTI_RET_BUNDLE_BITS_U_DATA           32
#define XRAYTI_RET_BUNDLE_ADDR_V_DATA           0xc8
#define XRAYTI_RET_BUNDLE_BITS_V_DATA           32

