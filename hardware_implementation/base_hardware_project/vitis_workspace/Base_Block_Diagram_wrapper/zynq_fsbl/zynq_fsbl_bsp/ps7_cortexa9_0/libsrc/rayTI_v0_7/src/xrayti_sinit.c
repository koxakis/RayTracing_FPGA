// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xrayti.h"

extern XRayti_Config XRayti_ConfigTable[];

XRayti_Config *XRayti_LookupConfig(u16 DeviceId) {
	XRayti_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRAYTI_NUM_INSTANCES; Index++) {
		if (XRayti_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRayti_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRayti_Initialize(XRayti *InstancePtr, u16 DeviceId) {
	XRayti_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRayti_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRayti_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

