// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module rayTI_ret_bundle_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle,
    input  wire [0:0]                    ap_return,
    output wire [31:0]                   dir_pading,
    output wire [31:0]                   dir_x,
    output wire [31:0]                   dir_y,
    output wire [31:0]                   dir_z,
    output wire [31:0]                   orig_pading,
    output wire [31:0]                   orig_x,
    output wire [31:0]                   orig_y,
    output wire [31:0]                   orig_z,
    output wire [31:0]                   v0_pading,
    output wire [31:0]                   v0_x,
    output wire [31:0]                   v0_y,
    output wire [31:0]                   v0_z,
    output wire [31:0]                   v1_pading,
    output wire [31:0]                   v1_x,
    output wire [31:0]                   v1_y,
    output wire [31:0]                   v1_z,
    output wire [31:0]                   v2_pading,
    output wire [31:0]                   v2_x,
    output wire [31:0]                   v2_y,
    output wire [31:0]                   v2_z,
    output wire [31:0]                   t,
    output wire [31:0]                   u,
    output wire [31:0]                   v
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL            = 8'h00,
    ADDR_GIE                = 8'h04,
    ADDR_IER                = 8'h08,
    ADDR_ISR                = 8'h0c,
    ADDR_AP_RETURN_0        = 8'h10,
    ADDR_DIR_PADING_DATA_0  = 8'h18,
    ADDR_DIR_PADING_CTRL    = 8'h1c,
    ADDR_DIR_X_DATA_0       = 8'h20,
    ADDR_DIR_X_CTRL         = 8'h24,
    ADDR_DIR_Y_DATA_0       = 8'h28,
    ADDR_DIR_Y_CTRL         = 8'h2c,
    ADDR_DIR_Z_DATA_0       = 8'h30,
    ADDR_DIR_Z_CTRL         = 8'h34,
    ADDR_ORIG_PADING_DATA_0 = 8'h38,
    ADDR_ORIG_PADING_CTRL   = 8'h3c,
    ADDR_ORIG_X_DATA_0      = 8'h40,
    ADDR_ORIG_X_CTRL        = 8'h44,
    ADDR_ORIG_Y_DATA_0      = 8'h48,
    ADDR_ORIG_Y_CTRL        = 8'h4c,
    ADDR_ORIG_Z_DATA_0      = 8'h50,
    ADDR_ORIG_Z_CTRL        = 8'h54,
    ADDR_V0_PADING_DATA_0   = 8'h58,
    ADDR_V0_PADING_CTRL     = 8'h5c,
    ADDR_V0_X_DATA_0        = 8'h60,
    ADDR_V0_X_CTRL          = 8'h64,
    ADDR_V0_Y_DATA_0        = 8'h68,
    ADDR_V0_Y_CTRL          = 8'h6c,
    ADDR_V0_Z_DATA_0        = 8'h70,
    ADDR_V0_Z_CTRL          = 8'h74,
    ADDR_V1_PADING_DATA_0   = 8'h78,
    ADDR_V1_PADING_CTRL     = 8'h7c,
    ADDR_V1_X_DATA_0        = 8'h80,
    ADDR_V1_X_CTRL          = 8'h84,
    ADDR_V1_Y_DATA_0        = 8'h88,
    ADDR_V1_Y_CTRL          = 8'h8c,
    ADDR_V1_Z_DATA_0        = 8'h90,
    ADDR_V1_Z_CTRL          = 8'h94,
    ADDR_V2_PADING_DATA_0   = 8'h98,
    ADDR_V2_PADING_CTRL     = 8'h9c,
    ADDR_V2_X_DATA_0        = 8'ha0,
    ADDR_V2_X_CTRL          = 8'ha4,
    ADDR_V2_Y_DATA_0        = 8'ha8,
    ADDR_V2_Y_CTRL          = 8'hac,
    ADDR_V2_Z_DATA_0        = 8'hb0,
    ADDR_V2_Z_CTRL          = 8'hb4,
    ADDR_T_DATA_0           = 8'hb8,
    ADDR_T_CTRL             = 8'hbc,
    ADDR_U_DATA_0           = 8'hc0,
    ADDR_U_CTRL             = 8'hc4,
    ADDR_V_DATA_0           = 8'hc8,
    ADDR_V_CTRL             = 8'hcc,
    WRIDLE                  = 2'd0,
    WRDATA                  = 2'd1,
    WRRESP                  = 2'd2,
    WRRESET                 = 2'd3,
    RDIDLE                  = 2'd0,
    RDDATA                  = 2'd1,
    RDRESET                 = 2'd2,
    ADDR_BITS         = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready;
    reg                           int_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [0:0]                    int_ap_return;
    reg  [31:0]                   int_dir_pading = 'b0;
    reg  [31:0]                   int_dir_x = 'b0;
    reg  [31:0]                   int_dir_y = 'b0;
    reg  [31:0]                   int_dir_z = 'b0;
    reg  [31:0]                   int_orig_pading = 'b0;
    reg  [31:0]                   int_orig_x = 'b0;
    reg  [31:0]                   int_orig_y = 'b0;
    reg  [31:0]                   int_orig_z = 'b0;
    reg  [31:0]                   int_v0_pading = 'b0;
    reg  [31:0]                   int_v0_x = 'b0;
    reg  [31:0]                   int_v0_y = 'b0;
    reg  [31:0]                   int_v0_z = 'b0;
    reg  [31:0]                   int_v1_pading = 'b0;
    reg  [31:0]                   int_v1_x = 'b0;
    reg  [31:0]                   int_v1_y = 'b0;
    reg  [31:0]                   int_v1_z = 'b0;
    reg  [31:0]                   int_v2_pading = 'b0;
    reg  [31:0]                   int_v2_x = 'b0;
    reg  [31:0]                   int_v2_y = 'b0;
    reg  [31:0]                   int_v2_z = 'b0;
    reg  [31:0]                   int_t = 'b0;
    reg  [31:0]                   int_u = 'b0;
    reg  [31:0]                   int_v = 'b0;

//------------------------Instantiation------------------

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_AP_RETURN_0: begin
                    rdata <= int_ap_return[0:0];
                end
                ADDR_DIR_PADING_DATA_0: begin
                    rdata <= int_dir_pading[31:0];
                end
                ADDR_DIR_X_DATA_0: begin
                    rdata <= int_dir_x[31:0];
                end
                ADDR_DIR_Y_DATA_0: begin
                    rdata <= int_dir_y[31:0];
                end
                ADDR_DIR_Z_DATA_0: begin
                    rdata <= int_dir_z[31:0];
                end
                ADDR_ORIG_PADING_DATA_0: begin
                    rdata <= int_orig_pading[31:0];
                end
                ADDR_ORIG_X_DATA_0: begin
                    rdata <= int_orig_x[31:0];
                end
                ADDR_ORIG_Y_DATA_0: begin
                    rdata <= int_orig_y[31:0];
                end
                ADDR_ORIG_Z_DATA_0: begin
                    rdata <= int_orig_z[31:0];
                end
                ADDR_V0_PADING_DATA_0: begin
                    rdata <= int_v0_pading[31:0];
                end
                ADDR_V0_X_DATA_0: begin
                    rdata <= int_v0_x[31:0];
                end
                ADDR_V0_Y_DATA_0: begin
                    rdata <= int_v0_y[31:0];
                end
                ADDR_V0_Z_DATA_0: begin
                    rdata <= int_v0_z[31:0];
                end
                ADDR_V1_PADING_DATA_0: begin
                    rdata <= int_v1_pading[31:0];
                end
                ADDR_V1_X_DATA_0: begin
                    rdata <= int_v1_x[31:0];
                end
                ADDR_V1_Y_DATA_0: begin
                    rdata <= int_v1_y[31:0];
                end
                ADDR_V1_Z_DATA_0: begin
                    rdata <= int_v1_z[31:0];
                end
                ADDR_V2_PADING_DATA_0: begin
                    rdata <= int_v2_pading[31:0];
                end
                ADDR_V2_X_DATA_0: begin
                    rdata <= int_v2_x[31:0];
                end
                ADDR_V2_Y_DATA_0: begin
                    rdata <= int_v2_y[31:0];
                end
                ADDR_V2_Z_DATA_0: begin
                    rdata <= int_v2_z[31:0];
                end
                ADDR_T_DATA_0: begin
                    rdata <= int_t[31:0];
                end
                ADDR_U_DATA_0: begin
                    rdata <= int_u[31:0];
                end
                ADDR_V_DATA_0: begin
                    rdata <= int_v[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt   = int_gie & (|int_isr);
assign ap_start    = int_ap_start;
assign dir_pading  = int_dir_pading;
assign dir_x       = int_dir_x;
assign dir_y       = int_dir_y;
assign dir_z       = int_dir_z;
assign orig_pading = int_orig_pading;
assign orig_x      = int_orig_x;
assign orig_y      = int_orig_y;
assign orig_z      = int_orig_z;
assign v0_pading   = int_v0_pading;
assign v0_x        = int_v0_x;
assign v0_y        = int_v0_y;
assign v0_z        = int_v0_z;
assign v1_pading   = int_v1_pading;
assign v1_x        = int_v1_x;
assign v1_y        = int_v1_y;
assign v1_z        = int_v1_z;
assign v2_pading   = int_v2_pading;
assign v2_x        = int_v2_x;
assign v2_y        = int_v2_y;
assign v2_z        = int_v2_z;
assign t           = int_t;
assign u           = int_u;
assign v           = int_v;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_ready <= ap_ready;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_ap_return
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_return <= 0;
    else if (ACLK_EN) begin
        if (ap_done)
            int_ap_return <= ap_return;
    end
end

// int_dir_pading[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dir_pading[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DIR_PADING_DATA_0)
            int_dir_pading[31:0] <= (WDATA[31:0] & wmask) | (int_dir_pading[31:0] & ~wmask);
    end
end

// int_dir_x[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dir_x[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DIR_X_DATA_0)
            int_dir_x[31:0] <= (WDATA[31:0] & wmask) | (int_dir_x[31:0] & ~wmask);
    end
end

// int_dir_y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dir_y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DIR_Y_DATA_0)
            int_dir_y[31:0] <= (WDATA[31:0] & wmask) | (int_dir_y[31:0] & ~wmask);
    end
end

// int_dir_z[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dir_z[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DIR_Z_DATA_0)
            int_dir_z[31:0] <= (WDATA[31:0] & wmask) | (int_dir_z[31:0] & ~wmask);
    end
end

// int_orig_pading[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_orig_pading[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ORIG_PADING_DATA_0)
            int_orig_pading[31:0] <= (WDATA[31:0] & wmask) | (int_orig_pading[31:0] & ~wmask);
    end
end

// int_orig_x[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_orig_x[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ORIG_X_DATA_0)
            int_orig_x[31:0] <= (WDATA[31:0] & wmask) | (int_orig_x[31:0] & ~wmask);
    end
end

// int_orig_y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_orig_y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ORIG_Y_DATA_0)
            int_orig_y[31:0] <= (WDATA[31:0] & wmask) | (int_orig_y[31:0] & ~wmask);
    end
end

// int_orig_z[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_orig_z[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ORIG_Z_DATA_0)
            int_orig_z[31:0] <= (WDATA[31:0] & wmask) | (int_orig_z[31:0] & ~wmask);
    end
end

// int_v0_pading[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v0_pading[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V0_PADING_DATA_0)
            int_v0_pading[31:0] <= (WDATA[31:0] & wmask) | (int_v0_pading[31:0] & ~wmask);
    end
end

// int_v0_x[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v0_x[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V0_X_DATA_0)
            int_v0_x[31:0] <= (WDATA[31:0] & wmask) | (int_v0_x[31:0] & ~wmask);
    end
end

// int_v0_y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v0_y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V0_Y_DATA_0)
            int_v0_y[31:0] <= (WDATA[31:0] & wmask) | (int_v0_y[31:0] & ~wmask);
    end
end

// int_v0_z[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v0_z[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V0_Z_DATA_0)
            int_v0_z[31:0] <= (WDATA[31:0] & wmask) | (int_v0_z[31:0] & ~wmask);
    end
end

// int_v1_pading[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v1_pading[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V1_PADING_DATA_0)
            int_v1_pading[31:0] <= (WDATA[31:0] & wmask) | (int_v1_pading[31:0] & ~wmask);
    end
end

// int_v1_x[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v1_x[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V1_X_DATA_0)
            int_v1_x[31:0] <= (WDATA[31:0] & wmask) | (int_v1_x[31:0] & ~wmask);
    end
end

// int_v1_y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v1_y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V1_Y_DATA_0)
            int_v1_y[31:0] <= (WDATA[31:0] & wmask) | (int_v1_y[31:0] & ~wmask);
    end
end

// int_v1_z[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v1_z[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V1_Z_DATA_0)
            int_v1_z[31:0] <= (WDATA[31:0] & wmask) | (int_v1_z[31:0] & ~wmask);
    end
end

// int_v2_pading[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v2_pading[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V2_PADING_DATA_0)
            int_v2_pading[31:0] <= (WDATA[31:0] & wmask) | (int_v2_pading[31:0] & ~wmask);
    end
end

// int_v2_x[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v2_x[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V2_X_DATA_0)
            int_v2_x[31:0] <= (WDATA[31:0] & wmask) | (int_v2_x[31:0] & ~wmask);
    end
end

// int_v2_y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v2_y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V2_Y_DATA_0)
            int_v2_y[31:0] <= (WDATA[31:0] & wmask) | (int_v2_y[31:0] & ~wmask);
    end
end

// int_v2_z[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v2_z[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V2_Z_DATA_0)
            int_v2_z[31:0] <= (WDATA[31:0] & wmask) | (int_v2_z[31:0] & ~wmask);
    end
end

// int_t[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_t[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_T_DATA_0)
            int_t[31:0] <= (WDATA[31:0] & wmask) | (int_t[31:0] & ~wmask);
    end
end

// int_u[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_u[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_U_DATA_0)
            int_u[31:0] <= (WDATA[31:0] & wmask) | (int_u[31:0] & ~wmask);
    end
end

// int_v[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_v[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_V_DATA_0)
            int_v[31:0] <= (WDATA[31:0] & wmask) | (int_v[31:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
