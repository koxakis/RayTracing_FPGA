// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XRAYTI_H
#define XRAYTI_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xrayti_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Ret_bundle_BaseAddress;
} XRayti_Config;
#endif

typedef struct {
    u32 Ret_bundle_BaseAddress;
    u32 IsReady;
} XRayti;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRayti_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRayti_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRayti_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRayti_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XRayti_Initialize(XRayti *InstancePtr, u16 DeviceId);
XRayti_Config* XRayti_LookupConfig(u16 DeviceId);
int XRayti_CfgInitialize(XRayti *InstancePtr, XRayti_Config *ConfigPtr);
#else
int XRayti_Initialize(XRayti *InstancePtr, const char* InstanceName);
int XRayti_Release(XRayti *InstancePtr);
#endif

void XRayti_Start(XRayti *InstancePtr);
u32 XRayti_IsDone(XRayti *InstancePtr);
u32 XRayti_IsIdle(XRayti *InstancePtr);
u32 XRayti_IsReady(XRayti *InstancePtr);
void XRayti_EnableAutoRestart(XRayti *InstancePtr);
void XRayti_DisableAutoRestart(XRayti *InstancePtr);
u32 XRayti_Get_return(XRayti *InstancePtr);

void XRayti_Set_dir_pading(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_dir_pading(XRayti *InstancePtr);
void XRayti_Set_dir_x(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_dir_x(XRayti *InstancePtr);
void XRayti_Set_dir_y(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_dir_y(XRayti *InstancePtr);
void XRayti_Set_dir_z(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_dir_z(XRayti *InstancePtr);
void XRayti_Set_orig_pading(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_orig_pading(XRayti *InstancePtr);
void XRayti_Set_orig_x(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_orig_x(XRayti *InstancePtr);
void XRayti_Set_orig_y(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_orig_y(XRayti *InstancePtr);
void XRayti_Set_orig_z(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_orig_z(XRayti *InstancePtr);
void XRayti_Set_v0_pading(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v0_pading(XRayti *InstancePtr);
void XRayti_Set_v0_x(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v0_x(XRayti *InstancePtr);
void XRayti_Set_v0_y(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v0_y(XRayti *InstancePtr);
void XRayti_Set_v0_z(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v0_z(XRayti *InstancePtr);
void XRayti_Set_v1_pading(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v1_pading(XRayti *InstancePtr);
void XRayti_Set_v1_x(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v1_x(XRayti *InstancePtr);
void XRayti_Set_v1_y(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v1_y(XRayti *InstancePtr);
void XRayti_Set_v1_z(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v1_z(XRayti *InstancePtr);
void XRayti_Set_v2_pading(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v2_pading(XRayti *InstancePtr);
void XRayti_Set_v2_x(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v2_x(XRayti *InstancePtr);
void XRayti_Set_v2_y(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v2_y(XRayti *InstancePtr);
void XRayti_Set_v2_z(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v2_z(XRayti *InstancePtr);
void XRayti_Set_t(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_t(XRayti *InstancePtr);
void XRayti_Set_u(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_u(XRayti *InstancePtr);
void XRayti_Set_v(XRayti *InstancePtr, u32 Data);
u32 XRayti_Get_v(XRayti *InstancePtr);

void XRayti_InterruptGlobalEnable(XRayti *InstancePtr);
void XRayti_InterruptGlobalDisable(XRayti *InstancePtr);
void XRayti_InterruptEnable(XRayti *InstancePtr, u32 Mask);
void XRayti_InterruptDisable(XRayti *InstancePtr, u32 Mask);
void XRayti_InterruptClear(XRayti *InstancePtr, u32 Mask);
u32 XRayti_InterruptGetEnabled(XRayti *InstancePtr);
u32 XRayti_InterruptGetStatus(XRayti *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
