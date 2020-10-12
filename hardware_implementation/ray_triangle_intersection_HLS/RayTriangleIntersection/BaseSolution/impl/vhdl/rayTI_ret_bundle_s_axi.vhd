-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity rayTI_ret_bundle_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 8;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC;
    ap_return             :in   STD_LOGIC_VECTOR(0 downto 0);
    dir_pading            :out  STD_LOGIC_VECTOR(31 downto 0);
    dir_x                 :out  STD_LOGIC_VECTOR(31 downto 0);
    dir_y                 :out  STD_LOGIC_VECTOR(31 downto 0);
    dir_z                 :out  STD_LOGIC_VECTOR(31 downto 0);
    orig_pading           :out  STD_LOGIC_VECTOR(31 downto 0);
    orig_x                :out  STD_LOGIC_VECTOR(31 downto 0);
    orig_y                :out  STD_LOGIC_VECTOR(31 downto 0);
    orig_z                :out  STD_LOGIC_VECTOR(31 downto 0);
    v0_pading             :out  STD_LOGIC_VECTOR(31 downto 0);
    v0_x                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v0_y                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v0_z                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v1_pading             :out  STD_LOGIC_VECTOR(31 downto 0);
    v1_x                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v1_y                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v1_z                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v2_pading             :out  STD_LOGIC_VECTOR(31 downto 0);
    v2_x                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v2_y                  :out  STD_LOGIC_VECTOR(31 downto 0);
    v2_z                  :out  STD_LOGIC_VECTOR(31 downto 0);
    t                     :out  STD_LOGIC_VECTOR(31 downto 0);
    u                     :out  STD_LOGIC_VECTOR(31 downto 0);
    v                     :out  STD_LOGIC_VECTOR(31 downto 0)
);
end entity rayTI_ret_bundle_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : Control signals
--        bit 0  - ap_start (Read/Write/COH)
--        bit 1  - ap_done (Read/COR)
--        bit 2  - ap_idle (Read)
--        bit 3  - ap_ready (Read)
--        bit 7  - auto_restart (Read/Write)
--        others - reserved
-- 0x04 : Global Interrupt Enable Register
--        bit 0  - Global Interrupt Enable (Read/Write)
--        others - reserved
-- 0x08 : IP Interrupt Enable Register (Read/Write)
--        bit 0  - Channel 0 (ap_done)
--        bit 1  - Channel 1 (ap_ready)
--        others - reserved
-- 0x0c : IP Interrupt Status Register (Read/TOW)
--        bit 0  - Channel 0 (ap_done)
--        bit 1  - Channel 1 (ap_ready)
--        others - reserved
-- 0x10 : Data signal of ap_return
--        bit 0  - ap_return[0] (Read)
--        others - reserved
-- 0x18 : Data signal of dir_pading
--        bit 31~0 - dir_pading[31:0] (Read/Write)
-- 0x1c : reserved
-- 0x20 : Data signal of dir_x
--        bit 31~0 - dir_x[31:0] (Read/Write)
-- 0x24 : reserved
-- 0x28 : Data signal of dir_y
--        bit 31~0 - dir_y[31:0] (Read/Write)
-- 0x2c : reserved
-- 0x30 : Data signal of dir_z
--        bit 31~0 - dir_z[31:0] (Read/Write)
-- 0x34 : reserved
-- 0x38 : Data signal of orig_pading
--        bit 31~0 - orig_pading[31:0] (Read/Write)
-- 0x3c : reserved
-- 0x40 : Data signal of orig_x
--        bit 31~0 - orig_x[31:0] (Read/Write)
-- 0x44 : reserved
-- 0x48 : Data signal of orig_y
--        bit 31~0 - orig_y[31:0] (Read/Write)
-- 0x4c : reserved
-- 0x50 : Data signal of orig_z
--        bit 31~0 - orig_z[31:0] (Read/Write)
-- 0x54 : reserved
-- 0x58 : Data signal of v0_pading
--        bit 31~0 - v0_pading[31:0] (Read/Write)
-- 0x5c : reserved
-- 0x60 : Data signal of v0_x
--        bit 31~0 - v0_x[31:0] (Read/Write)
-- 0x64 : reserved
-- 0x68 : Data signal of v0_y
--        bit 31~0 - v0_y[31:0] (Read/Write)
-- 0x6c : reserved
-- 0x70 : Data signal of v0_z
--        bit 31~0 - v0_z[31:0] (Read/Write)
-- 0x74 : reserved
-- 0x78 : Data signal of v1_pading
--        bit 31~0 - v1_pading[31:0] (Read/Write)
-- 0x7c : reserved
-- 0x80 : Data signal of v1_x
--        bit 31~0 - v1_x[31:0] (Read/Write)
-- 0x84 : reserved
-- 0x88 : Data signal of v1_y
--        bit 31~0 - v1_y[31:0] (Read/Write)
-- 0x8c : reserved
-- 0x90 : Data signal of v1_z
--        bit 31~0 - v1_z[31:0] (Read/Write)
-- 0x94 : reserved
-- 0x98 : Data signal of v2_pading
--        bit 31~0 - v2_pading[31:0] (Read/Write)
-- 0x9c : reserved
-- 0xa0 : Data signal of v2_x
--        bit 31~0 - v2_x[31:0] (Read/Write)
-- 0xa4 : reserved
-- 0xa8 : Data signal of v2_y
--        bit 31~0 - v2_y[31:0] (Read/Write)
-- 0xac : reserved
-- 0xb0 : Data signal of v2_z
--        bit 31~0 - v2_z[31:0] (Read/Write)
-- 0xb4 : reserved
-- 0xb8 : Data signal of t
--        bit 31~0 - t[31:0] (Read/Write)
-- 0xbc : reserved
-- 0xc0 : Data signal of u
--        bit 31~0 - u[31:0] (Read/Write)
-- 0xc4 : reserved
-- 0xc8 : Data signal of v
--        bit 31~0 - v[31:0] (Read/Write)
-- 0xcc : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of rayTI_ret_bundle_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL            : INTEGER := 16#00#;
    constant ADDR_GIE                : INTEGER := 16#04#;
    constant ADDR_IER                : INTEGER := 16#08#;
    constant ADDR_ISR                : INTEGER := 16#0c#;
    constant ADDR_AP_RETURN_0        : INTEGER := 16#10#;
    constant ADDR_DIR_PADING_DATA_0  : INTEGER := 16#18#;
    constant ADDR_DIR_PADING_CTRL    : INTEGER := 16#1c#;
    constant ADDR_DIR_X_DATA_0       : INTEGER := 16#20#;
    constant ADDR_DIR_X_CTRL         : INTEGER := 16#24#;
    constant ADDR_DIR_Y_DATA_0       : INTEGER := 16#28#;
    constant ADDR_DIR_Y_CTRL         : INTEGER := 16#2c#;
    constant ADDR_DIR_Z_DATA_0       : INTEGER := 16#30#;
    constant ADDR_DIR_Z_CTRL         : INTEGER := 16#34#;
    constant ADDR_ORIG_PADING_DATA_0 : INTEGER := 16#38#;
    constant ADDR_ORIG_PADING_CTRL   : INTEGER := 16#3c#;
    constant ADDR_ORIG_X_DATA_0      : INTEGER := 16#40#;
    constant ADDR_ORIG_X_CTRL        : INTEGER := 16#44#;
    constant ADDR_ORIG_Y_DATA_0      : INTEGER := 16#48#;
    constant ADDR_ORIG_Y_CTRL        : INTEGER := 16#4c#;
    constant ADDR_ORIG_Z_DATA_0      : INTEGER := 16#50#;
    constant ADDR_ORIG_Z_CTRL        : INTEGER := 16#54#;
    constant ADDR_V0_PADING_DATA_0   : INTEGER := 16#58#;
    constant ADDR_V0_PADING_CTRL     : INTEGER := 16#5c#;
    constant ADDR_V0_X_DATA_0        : INTEGER := 16#60#;
    constant ADDR_V0_X_CTRL          : INTEGER := 16#64#;
    constant ADDR_V0_Y_DATA_0        : INTEGER := 16#68#;
    constant ADDR_V0_Y_CTRL          : INTEGER := 16#6c#;
    constant ADDR_V0_Z_DATA_0        : INTEGER := 16#70#;
    constant ADDR_V0_Z_CTRL          : INTEGER := 16#74#;
    constant ADDR_V1_PADING_DATA_0   : INTEGER := 16#78#;
    constant ADDR_V1_PADING_CTRL     : INTEGER := 16#7c#;
    constant ADDR_V1_X_DATA_0        : INTEGER := 16#80#;
    constant ADDR_V1_X_CTRL          : INTEGER := 16#84#;
    constant ADDR_V1_Y_DATA_0        : INTEGER := 16#88#;
    constant ADDR_V1_Y_CTRL          : INTEGER := 16#8c#;
    constant ADDR_V1_Z_DATA_0        : INTEGER := 16#90#;
    constant ADDR_V1_Z_CTRL          : INTEGER := 16#94#;
    constant ADDR_V2_PADING_DATA_0   : INTEGER := 16#98#;
    constant ADDR_V2_PADING_CTRL     : INTEGER := 16#9c#;
    constant ADDR_V2_X_DATA_0        : INTEGER := 16#a0#;
    constant ADDR_V2_X_CTRL          : INTEGER := 16#a4#;
    constant ADDR_V2_Y_DATA_0        : INTEGER := 16#a8#;
    constant ADDR_V2_Y_CTRL          : INTEGER := 16#ac#;
    constant ADDR_V2_Z_DATA_0        : INTEGER := 16#b0#;
    constant ADDR_V2_Z_CTRL          : INTEGER := 16#b4#;
    constant ADDR_T_DATA_0           : INTEGER := 16#b8#;
    constant ADDR_T_CTRL             : INTEGER := 16#bc#;
    constant ADDR_U_DATA_0           : INTEGER := 16#c0#;
    constant ADDR_U_CTRL             : INTEGER := 16#c4#;
    constant ADDR_V_DATA_0           : INTEGER := 16#c8#;
    constant ADDR_V_CTRL             : INTEGER := 16#cc#;
    constant ADDR_BITS         : INTEGER := 8;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(31 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(31 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_ap_idle         : STD_LOGIC;
    signal int_ap_ready        : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_ap_return       : UNSIGNED(0 downto 0);
    signal int_dir_pading      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_dir_x           : UNSIGNED(31 downto 0) := (others => '0');
    signal int_dir_y           : UNSIGNED(31 downto 0) := (others => '0');
    signal int_dir_z           : UNSIGNED(31 downto 0) := (others => '0');
    signal int_orig_pading     : UNSIGNED(31 downto 0) := (others => '0');
    signal int_orig_x          : UNSIGNED(31 downto 0) := (others => '0');
    signal int_orig_y          : UNSIGNED(31 downto 0) := (others => '0');
    signal int_orig_z          : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v0_pading       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v0_x            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v0_y            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v0_z            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v1_pading       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v1_x            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v1_y            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v1_z            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v2_pading       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v2_x            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v2_y            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v2_z            : UNSIGNED(31 downto 0) := (others => '0');
    signal int_t               : UNSIGNED(31 downto 0) := (others => '0');
    signal int_u               : UNSIGNED(31 downto 0) := (others => '0');
    signal int_v               : UNSIGNED(31 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------

-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data <= (7 => int_auto_restart, 3 => int_ap_ready, 2 => int_ap_idle, 1 => int_ap_done, 0 => int_ap_start, others => '0');
                    when ADDR_GIE =>
                        rdata_data <= (0 => int_gie, others => '0');
                    when ADDR_IER =>
                        rdata_data <= (1 => int_ier(1), 0 => int_ier(0), others => '0');
                    when ADDR_ISR =>
                        rdata_data <= (1 => int_isr(1), 0 => int_isr(0), others => '0');
                    when ADDR_AP_RETURN_0 =>
                        rdata_data <= RESIZE(int_ap_return(0 downto 0), 32);
                    when ADDR_DIR_PADING_DATA_0 =>
                        rdata_data <= RESIZE(int_dir_pading(31 downto 0), 32);
                    when ADDR_DIR_X_DATA_0 =>
                        rdata_data <= RESIZE(int_dir_x(31 downto 0), 32);
                    when ADDR_DIR_Y_DATA_0 =>
                        rdata_data <= RESIZE(int_dir_y(31 downto 0), 32);
                    when ADDR_DIR_Z_DATA_0 =>
                        rdata_data <= RESIZE(int_dir_z(31 downto 0), 32);
                    when ADDR_ORIG_PADING_DATA_0 =>
                        rdata_data <= RESIZE(int_orig_pading(31 downto 0), 32);
                    when ADDR_ORIG_X_DATA_0 =>
                        rdata_data <= RESIZE(int_orig_x(31 downto 0), 32);
                    when ADDR_ORIG_Y_DATA_0 =>
                        rdata_data <= RESIZE(int_orig_y(31 downto 0), 32);
                    when ADDR_ORIG_Z_DATA_0 =>
                        rdata_data <= RESIZE(int_orig_z(31 downto 0), 32);
                    when ADDR_V0_PADING_DATA_0 =>
                        rdata_data <= RESIZE(int_v0_pading(31 downto 0), 32);
                    when ADDR_V0_X_DATA_0 =>
                        rdata_data <= RESIZE(int_v0_x(31 downto 0), 32);
                    when ADDR_V0_Y_DATA_0 =>
                        rdata_data <= RESIZE(int_v0_y(31 downto 0), 32);
                    when ADDR_V0_Z_DATA_0 =>
                        rdata_data <= RESIZE(int_v0_z(31 downto 0), 32);
                    when ADDR_V1_PADING_DATA_0 =>
                        rdata_data <= RESIZE(int_v1_pading(31 downto 0), 32);
                    when ADDR_V1_X_DATA_0 =>
                        rdata_data <= RESIZE(int_v1_x(31 downto 0), 32);
                    when ADDR_V1_Y_DATA_0 =>
                        rdata_data <= RESIZE(int_v1_y(31 downto 0), 32);
                    when ADDR_V1_Z_DATA_0 =>
                        rdata_data <= RESIZE(int_v1_z(31 downto 0), 32);
                    when ADDR_V2_PADING_DATA_0 =>
                        rdata_data <= RESIZE(int_v2_pading(31 downto 0), 32);
                    when ADDR_V2_X_DATA_0 =>
                        rdata_data <= RESIZE(int_v2_x(31 downto 0), 32);
                    when ADDR_V2_Y_DATA_0 =>
                        rdata_data <= RESIZE(int_v2_y(31 downto 0), 32);
                    when ADDR_V2_Z_DATA_0 =>
                        rdata_data <= RESIZE(int_v2_z(31 downto 0), 32);
                    when ADDR_T_DATA_0 =>
                        rdata_data <= RESIZE(int_t(31 downto 0), 32);
                    when ADDR_U_DATA_0 =>
                        rdata_data <= RESIZE(int_u(31 downto 0), 32);
                    when ADDR_V_DATA_0 =>
                        rdata_data <= RESIZE(int_v(31 downto 0), 32);
                    when others =>
                        rdata_data <= (others => '0');
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_gie and (int_isr(0) or int_isr(1));
    ap_start             <= int_ap_start;
    dir_pading           <= STD_LOGIC_VECTOR(int_dir_pading);
    dir_x                <= STD_LOGIC_VECTOR(int_dir_x);
    dir_y                <= STD_LOGIC_VECTOR(int_dir_y);
    dir_z                <= STD_LOGIC_VECTOR(int_dir_z);
    orig_pading          <= STD_LOGIC_VECTOR(int_orig_pading);
    orig_x               <= STD_LOGIC_VECTOR(int_orig_x);
    orig_y               <= STD_LOGIC_VECTOR(int_orig_y);
    orig_z               <= STD_LOGIC_VECTOR(int_orig_z);
    v0_pading            <= STD_LOGIC_VECTOR(int_v0_pading);
    v0_x                 <= STD_LOGIC_VECTOR(int_v0_x);
    v0_y                 <= STD_LOGIC_VECTOR(int_v0_y);
    v0_z                 <= STD_LOGIC_VECTOR(int_v0_z);
    v1_pading            <= STD_LOGIC_VECTOR(int_v1_pading);
    v1_x                 <= STD_LOGIC_VECTOR(int_v1_x);
    v1_y                 <= STD_LOGIC_VECTOR(int_v1_y);
    v1_z                 <= STD_LOGIC_VECTOR(int_v1_z);
    v2_pading            <= STD_LOGIC_VECTOR(int_v2_pading);
    v2_x                 <= STD_LOGIC_VECTOR(int_v2_x);
    v2_y                 <= STD_LOGIC_VECTOR(int_v2_y);
    v2_z                 <= STD_LOGIC_VECTOR(int_v2_z);
    t                    <= STD_LOGIC_VECTOR(int_t);
    u                    <= STD_LOGIC_VECTOR(int_u);
    v                    <= STD_LOGIC_VECTOR(int_v);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (ap_done = '1') then
                    int_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_ready <= ap_ready;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= "00";
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_return <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (ap_done = '1') then
                    int_ap_return <= UNSIGNED(ap_return);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DIR_PADING_DATA_0) then
                    int_dir_pading(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dir_pading(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DIR_X_DATA_0) then
                    int_dir_x(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dir_x(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DIR_Y_DATA_0) then
                    int_dir_y(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dir_y(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DIR_Z_DATA_0) then
                    int_dir_z(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_dir_z(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ORIG_PADING_DATA_0) then
                    int_orig_pading(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_orig_pading(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ORIG_X_DATA_0) then
                    int_orig_x(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_orig_x(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ORIG_Y_DATA_0) then
                    int_orig_y(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_orig_y(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ORIG_Z_DATA_0) then
                    int_orig_z(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_orig_z(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V0_PADING_DATA_0) then
                    int_v0_pading(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v0_pading(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V0_X_DATA_0) then
                    int_v0_x(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v0_x(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V0_Y_DATA_0) then
                    int_v0_y(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v0_y(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V0_Z_DATA_0) then
                    int_v0_z(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v0_z(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V1_PADING_DATA_0) then
                    int_v1_pading(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v1_pading(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V1_X_DATA_0) then
                    int_v1_x(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v1_x(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V1_Y_DATA_0) then
                    int_v1_y(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v1_y(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V1_Z_DATA_0) then
                    int_v1_z(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v1_z(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V2_PADING_DATA_0) then
                    int_v2_pading(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v2_pading(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V2_X_DATA_0) then
                    int_v2_x(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v2_x(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V2_Y_DATA_0) then
                    int_v2_y(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v2_y(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V2_Z_DATA_0) then
                    int_v2_z(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v2_z(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_T_DATA_0) then
                    int_t(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_t(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_U_DATA_0) then
                    int_u(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_u(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_V_DATA_0) then
                    int_v(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_v(31 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
