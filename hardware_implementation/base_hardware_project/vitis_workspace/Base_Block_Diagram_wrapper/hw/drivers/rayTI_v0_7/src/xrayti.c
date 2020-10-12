// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xrayti.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRayti_CfgInitialize(XRayti *InstancePtr, XRayti_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ret_bundle_BaseAddress = ConfigPtr->Ret_bundle_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRayti_Start(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL) & 0x80;
    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRayti_IsDone(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRayti_IsIdle(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRayti_IsReady(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRayti_EnableAutoRestart(XRayti *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL, 0x80);
}

void XRayti_DisableAutoRestart(XRayti *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_CTRL, 0);
}

u32 XRayti_Get_return(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_AP_RETURN);
    return Data;
}
void XRayti_Set_dir_pading(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_PADING_DATA, Data);
}

u32 XRayti_Get_dir_pading(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_PADING_DATA);
    return Data;
}

void XRayti_Set_dir_x(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_X_DATA, Data);
}

u32 XRayti_Get_dir_x(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_X_DATA);
    return Data;
}

void XRayti_Set_dir_y(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_Y_DATA, Data);
}

u32 XRayti_Get_dir_y(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_Y_DATA);
    return Data;
}

void XRayti_Set_dir_z(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_Z_DATA, Data);
}

u32 XRayti_Get_dir_z(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_DIR_Z_DATA);
    return Data;
}

void XRayti_Set_orig_pading(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_PADING_DATA, Data);
}

u32 XRayti_Get_orig_pading(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_PADING_DATA);
    return Data;
}

void XRayti_Set_orig_x(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_X_DATA, Data);
}

u32 XRayti_Get_orig_x(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_X_DATA);
    return Data;
}

void XRayti_Set_orig_y(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_Y_DATA, Data);
}

u32 XRayti_Get_orig_y(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_Y_DATA);
    return Data;
}

void XRayti_Set_orig_z(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_Z_DATA, Data);
}

u32 XRayti_Get_orig_z(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ORIG_Z_DATA);
    return Data;
}

void XRayti_Set_v0_pading(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_PADING_DATA, Data);
}

u32 XRayti_Get_v0_pading(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_PADING_DATA);
    return Data;
}

void XRayti_Set_v0_x(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_X_DATA, Data);
}

u32 XRayti_Get_v0_x(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_X_DATA);
    return Data;
}

void XRayti_Set_v0_y(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_Y_DATA, Data);
}

u32 XRayti_Get_v0_y(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_Y_DATA);
    return Data;
}

void XRayti_Set_v0_z(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_Z_DATA, Data);
}

u32 XRayti_Get_v0_z(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V0_Z_DATA);
    return Data;
}

void XRayti_Set_v1_pading(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_PADING_DATA, Data);
}

u32 XRayti_Get_v1_pading(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_PADING_DATA);
    return Data;
}

void XRayti_Set_v1_x(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_X_DATA, Data);
}

u32 XRayti_Get_v1_x(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_X_DATA);
    return Data;
}

void XRayti_Set_v1_y(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_Y_DATA, Data);
}

u32 XRayti_Get_v1_y(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_Y_DATA);
    return Data;
}

void XRayti_Set_v1_z(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_Z_DATA, Data);
}

u32 XRayti_Get_v1_z(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V1_Z_DATA);
    return Data;
}

void XRayti_Set_v2_pading(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_PADING_DATA, Data);
}

u32 XRayti_Get_v2_pading(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_PADING_DATA);
    return Data;
}

void XRayti_Set_v2_x(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_X_DATA, Data);
}

u32 XRayti_Get_v2_x(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_X_DATA);
    return Data;
}

void XRayti_Set_v2_y(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_Y_DATA, Data);
}

u32 XRayti_Get_v2_y(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_Y_DATA);
    return Data;
}

void XRayti_Set_v2_z(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_Z_DATA, Data);
}

u32 XRayti_Get_v2_z(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V2_Z_DATA);
    return Data;
}

void XRayti_Set_t(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_T_DATA, Data);
}

u32 XRayti_Get_t(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_T_DATA);
    return Data;
}

void XRayti_Set_u(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_U_DATA, Data);
}

u32 XRayti_Get_u(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_U_DATA);
    return Data;
}

void XRayti_Set_v(XRayti *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V_DATA, Data);
}

u32 XRayti_Get_v(XRayti *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_V_DATA);
    return Data;
}

void XRayti_InterruptGlobalEnable(XRayti *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_GIE, 1);
}

void XRayti_InterruptGlobalDisable(XRayti *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_GIE, 0);
}

void XRayti_InterruptEnable(XRayti *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_IER);
    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_IER, Register | Mask);
}

void XRayti_InterruptDisable(XRayti *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_IER);
    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_IER, Register & (~Mask));
}

void XRayti_InterruptClear(XRayti *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRayti_WriteReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ISR, Mask);
}

u32 XRayti_InterruptGetEnabled(XRayti *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_IER);
}

u32 XRayti_InterruptGetStatus(XRayti *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRayti_ReadReg(InstancePtr->Ret_bundle_BaseAddress, XRAYTI_RET_BUNDLE_ADDR_ISR);
}

