//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Mon Mar 21 15:44:07 2022
//Host        : mcxlnx running 64-bit CentOS Linux release 7.7.1908 (Core)
//Command     : generate_target CPM_bd.bd
//Design      : CPM_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "CPM_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=CPM_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=4,da_board_cnt=3,da_bram_cntlr_cnt=2,synth_mode=Global}" *) (* HW_HANDOFF = "CPM_bd.hwdef" *) 
module CPM_bd
   (PCIE_grx_n,
    PCIE_grx_p,
    PCIE_gtx_n,
    PCIE_gtx_p,
    PCIE_user_Clk,
    ddr4_dimm1_act_n,
    ddr4_dimm1_adr,
    ddr4_dimm1_ba,
    ddr4_dimm1_bg,
    ddr4_dimm1_ck_c,
    ddr4_dimm1_ck_t,
    ddr4_dimm1_cke,
    ddr4_dimm1_cs_n,
    ddr4_dimm1_dm_n,
    ddr4_dimm1_dq,
    ddr4_dimm1_dqs_c,
    ddr4_dimm1_dqs_t,
    ddr4_dimm1_odt,
    ddr4_dimm1_reset_n,
    ddr4_dimm1_sma_clk_clk_n,
    ddr4_dimm1_sma_clk_clk_p,
    gt_refclk_clk_n,
    gt_refclk_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PCIE, CAN_DEBUG false" *) input [7:0]PCIE_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE GRX_P" *) input [7:0]PCIE_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE GTX_N" *) output [7:0]PCIE_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE GTX_P" *) output [7:0]PCIE_gtx_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PCIE_USER_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PCIE_USER_CLK, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output PCIE_user_Clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 ACT_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_dimm1, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) output ddr4_dimm1_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 ADR" *) output [16:0]ddr4_dimm1_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 BA" *) output [1:0]ddr4_dimm1_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 BG" *) output [1:0]ddr4_dimm1_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CK_C" *) output ddr4_dimm1_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CK_T" *) output ddr4_dimm1_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CKE" *) output ddr4_dimm1_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CS_N" *) output ddr4_dimm1_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DM_N" *) inout [7:0]ddr4_dimm1_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DQ" *) inout [63:0]ddr4_dimm1_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DQS_C" *) inout [7:0]ddr4_dimm1_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DQS_T" *) inout [7:0]ddr4_dimm1_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 ODT" *) output ddr4_dimm1_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 RESET_N" *) output ddr4_dimm1_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_dimm1_sma_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_dimm1_sma_clk, CAN_DEBUG false, FREQ_HZ 200000000" *) input ddr4_dimm1_sma_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_dimm1_sma_clk CLK_P" *) input ddr4_dimm1_sma_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_refclk, CAN_DEBUG false, FREQ_HZ 100000000" *) input gt_refclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk CLK_P" *) input gt_refclk_clk_p;

  wire [12:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [12:0]axi_bram_ctrl_0_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTB_EN;
  wire axi_bram_ctrl_0_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTB_WE;
  wire [0:0]axi_noc_0_CH0_DDR4_0_ACT_N;
  wire [16:0]axi_noc_0_CH0_DDR4_0_ADR;
  wire [1:0]axi_noc_0_CH0_DDR4_0_BA;
  wire [1:0]axi_noc_0_CH0_DDR4_0_BG;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CKE;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CK_C;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CK_T;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CS_N;
  wire [7:0]axi_noc_0_CH0_DDR4_0_DM_N;
  wire [63:0]axi_noc_0_CH0_DDR4_0_DQ;
  wire [7:0]axi_noc_0_CH0_DDR4_0_DQS_C;
  wire [7:0]axi_noc_0_CH0_DDR4_0_DQS_T;
  wire [0:0]axi_noc_0_CH0_DDR4_0_ODT;
  wire [0:0]axi_noc_0_CH0_DDR4_0_RESET_N;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARADDR" *) (* DONT_TOUCH *) wire [63:0]axi_noc_0_M00_AXI_ARADDR;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARBURST" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_ARBURST;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARCACHE" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_ARCACHE;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARID" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_ARID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLEN" *) (* DONT_TOUCH *) wire [7:0]axi_noc_0_M00_AXI_ARLEN;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLOCK" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_ARLOCK;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARPROT" *) (* DONT_TOUCH *) wire [2:0]axi_noc_0_M00_AXI_ARPROT;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARQOS" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_ARQOS;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREADY" *) (* DONT_TOUCH *) wire axi_noc_0_M00_AXI_ARREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREGION" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_ARREGION;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARSIZE" *) (* DONT_TOUCH *) wire [2:0]axi_noc_0_M00_AXI_ARSIZE;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARUSER" *) (* DONT_TOUCH *) wire [17:0]axi_noc_0_M00_AXI_ARUSER;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 ARVALID" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_ARVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWADDR" *) (* DONT_TOUCH *) wire [63:0]axi_noc_0_M00_AXI_AWADDR;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWBURST" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_AWBURST;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWCACHE" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_AWCACHE;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWID" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_AWID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLEN" *) (* DONT_TOUCH *) wire [7:0]axi_noc_0_M00_AXI_AWLEN;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLOCK" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_AWLOCK;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWPROT" *) (* DONT_TOUCH *) wire [2:0]axi_noc_0_M00_AXI_AWPROT;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWQOS" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_AWQOS;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREADY" *) (* DONT_TOUCH *) wire axi_noc_0_M00_AXI_AWREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREGION" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_AWREGION;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWSIZE" *) (* DONT_TOUCH *) wire [2:0]axi_noc_0_M00_AXI_AWSIZE;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWUSER" *) (* DONT_TOUCH *) wire [17:0]axi_noc_0_M00_AXI_AWUSER;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 AWVALID" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_AWVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BID" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_BID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BREADY" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_BREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BRESP" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_BRESP;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 BVALID" *) (* DONT_TOUCH *) wire axi_noc_0_M00_AXI_BVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RDATA" *) (* DONT_TOUCH *) wire [31:0]axi_noc_0_M00_AXI_RDATA;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RID" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_RID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RLAST" *) (* DONT_TOUCH *) wire axi_noc_0_M00_AXI_RLAST;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RREADY" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_RREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RRESP" *) (* DONT_TOUCH *) wire [1:0]axi_noc_0_M00_AXI_RRESP;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 RVALID" *) (* DONT_TOUCH *) wire axi_noc_0_M00_AXI_RVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WDATA" *) (* DONT_TOUCH *) wire [31:0]axi_noc_0_M00_AXI_WDATA;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WLAST" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_WLAST;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WREADY" *) (* DONT_TOUCH *) wire axi_noc_0_M00_AXI_WREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WSTRB" *) (* DONT_TOUCH *) wire [3:0]axi_noc_0_M00_AXI_WSTRB;
  (* CONN_BUS_INFO = "axi_noc_0_M00_AXI xilinx.com:interface:aximm:1.0 AXI4 WVALID" *) (* DONT_TOUCH *) wire [0:0]axi_noc_0_M00_AXI_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]axi_noc_0_M01_AXI_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_ARCACHE;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_ARID;
  (* HARD_CONN = "true" *) wire [7:0]axi_noc_0_M01_AXI_ARLEN;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_ARQOS;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]axi_noc_0_M01_AXI_ARUSER;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]axi_noc_0_M01_AXI_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_AWCACHE;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_AWID;
  (* HARD_CONN = "true" *) wire [7:0]axi_noc_0_M01_AXI_AWLEN;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]axi_noc_0_M01_AXI_AWQOS;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]axi_noc_0_M01_AXI_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]axi_noc_0_M01_AXI_AWUSER;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_AWVALID;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_BID;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_BRESP;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]axi_noc_0_M01_AXI_RDATA;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_RID;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_RLAST;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]axi_noc_0_M01_AXI_RRESP;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]axi_noc_0_M01_AXI_WDATA;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_WLAST;
  (* HARD_CONN = "true" *) wire axi_noc_0_M01_AXI_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]axi_noc_0_M01_AXI_WSTRB;
  (* HARD_CONN = "true" *) wire [0:0]axi_noc_0_M01_AXI_WVALID;
  wire ddr4_dimm1_sma_clk_1_CLK_N;
  wire ddr4_dimm1_sma_clk_1_CLK_P;
  wire gt_refclk0_0_1_CLK_N;
  wire gt_refclk0_0_1_CLK_P;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_CPM_PCIE_NOC_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_CPM_PCIE_NOC_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_0_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_CPM_PCIE_NOC_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_CPM_PCIE_NOC_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_CPM_PCIE_NOC_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_0_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_CPM_PCIE_NOC_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_0_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_CPM_PCIE_NOC_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_0_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_CPM_PCIE_NOC_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_0_WSTRB;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_0_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_CPM_PCIE_NOC_1_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_1_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_1_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_1_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_CPM_PCIE_NOC_1_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_1_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_1_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_1_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_1_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_CPM_PCIE_NOC_1_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_CPM_PCIE_NOC_1_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_1_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_1_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_1_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_CPM_PCIE_NOC_1_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_1_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_CPM_PCIE_NOC_1_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_1_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_CPM_PCIE_NOC_1_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_CPM_PCIE_NOC_1_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_1_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_1_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_1_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_CPM_PCIE_NOC_1_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_1_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_1_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_CPM_PCIE_NOC_1_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_1_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_CPM_PCIE_NOC_1_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_CPM_PCIE_NOC_1_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_CPM_PCIE_NOC_1_WSTRB;
  (* HARD_CONN = "true" *) wire versal_cips_0_CPM_PCIE_NOC_1_WVALID;
  wire [7:0]versal_cips_0_PCIE0_GT_GRX_N;
  wire [7:0]versal_cips_0_PCIE0_GT_GRX_P;
  wire [7:0]versal_cips_0_PCIE0_GT_GTX_N;
  wire [7:0]versal_cips_0_PCIE0_GT_GTX_P;
  (* HARD_CONN = "true" *) wire versal_cips_0_cpm_pcie_noc_axi0_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_cpm_pcie_noc_axi1_clk;
  wire versal_cips_0_dma0_axi_aresetn;
  (* HARD_CONN = "true" *) wire versal_cips_0_noc_cpm_pcie_axi0_clk;
  wire versal_cips_0_pcie0_user_clk;

  assign PCIE_gtx_n[7:0] = versal_cips_0_PCIE0_GT_GTX_N;
  assign PCIE_gtx_p[7:0] = versal_cips_0_PCIE0_GT_GTX_P;
  assign PCIE_user_Clk = versal_cips_0_pcie0_user_clk;
  assign ddr4_dimm1_act_n = axi_noc_0_CH0_DDR4_0_ACT_N;
  assign ddr4_dimm1_adr[16:0] = axi_noc_0_CH0_DDR4_0_ADR;
  assign ddr4_dimm1_ba[1:0] = axi_noc_0_CH0_DDR4_0_BA;
  assign ddr4_dimm1_bg[1:0] = axi_noc_0_CH0_DDR4_0_BG;
  assign ddr4_dimm1_ck_c = axi_noc_0_CH0_DDR4_0_CK_C;
  assign ddr4_dimm1_ck_t = axi_noc_0_CH0_DDR4_0_CK_T;
  assign ddr4_dimm1_cke = axi_noc_0_CH0_DDR4_0_CKE;
  assign ddr4_dimm1_cs_n = axi_noc_0_CH0_DDR4_0_CS_N;
  assign ddr4_dimm1_odt = axi_noc_0_CH0_DDR4_0_ODT;
  assign ddr4_dimm1_reset_n = axi_noc_0_CH0_DDR4_0_RESET_N;
  assign ddr4_dimm1_sma_clk_1_CLK_N = ddr4_dimm1_sma_clk_clk_n;
  assign ddr4_dimm1_sma_clk_1_CLK_P = ddr4_dimm1_sma_clk_clk_p;
  assign gt_refclk0_0_1_CLK_N = gt_refclk_clk_n;
  assign gt_refclk0_0_1_CLK_P = gt_refclk_clk_p;
  assign versal_cips_0_PCIE0_GT_GRX_N = PCIE_grx_n[7:0];
  assign versal_cips_0_PCIE0_GT_GRX_P = PCIE_grx_p[7:0];
  CPM_bd_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_0_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_0_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .s_axi_aclk(versal_cips_0_pcie0_user_clk),
        .s_axi_araddr(axi_noc_0_M00_AXI_ARADDR[12:0]),
        .s_axi_arburst(axi_noc_0_M00_AXI_ARBURST),
        .s_axi_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(versal_cips_0_dma0_axi_aresetn),
        .s_axi_arid(axi_noc_0_M00_AXI_ARID),
        .s_axi_arlen(axi_noc_0_M00_AXI_ARLEN),
        .s_axi_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_noc_0_M00_AXI_ARPROT),
        .s_axi_arready(axi_noc_0_M00_AXI_ARREADY),
        .s_axi_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_noc_0_M00_AXI_AWADDR[12:0]),
        .s_axi_awburst(axi_noc_0_M00_AXI_AWBURST),
        .s_axi_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .s_axi_awid(axi_noc_0_M00_AXI_AWID),
        .s_axi_awlen(axi_noc_0_M00_AXI_AWLEN),
        .s_axi_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_noc_0_M00_AXI_AWPROT),
        .s_axi_awready(axi_noc_0_M00_AXI_AWREADY),
        .s_axi_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .s_axi_bid(axi_noc_0_M00_AXI_BID),
        .s_axi_bready(axi_noc_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_noc_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_noc_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_noc_0_M00_AXI_RDATA),
        .s_axi_rid(axi_noc_0_M00_AXI_RID),
        .s_axi_rlast(axi_noc_0_M00_AXI_RLAST),
        .s_axi_rready(axi_noc_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_noc_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_noc_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_noc_0_M00_AXI_WDATA),
        .s_axi_wlast(axi_noc_0_M00_AXI_WLAST),
        .s_axi_wready(axi_noc_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_noc_0_M00_AXI_WVALID));
  CPM_bd_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .addrb(axi_bram_ctrl_0_BRAM_PORTB_ADDR),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_0_BRAM_PORTB_WE));
  CPM_bd_axi_noc_0_0 axi_noc_0
       (.CH0_DDR4_0_act_n(axi_noc_0_CH0_DDR4_0_ACT_N),
        .CH0_DDR4_0_adr(axi_noc_0_CH0_DDR4_0_ADR),
        .CH0_DDR4_0_ba(axi_noc_0_CH0_DDR4_0_BA),
        .CH0_DDR4_0_bg(axi_noc_0_CH0_DDR4_0_BG),
        .CH0_DDR4_0_ck_c(axi_noc_0_CH0_DDR4_0_CK_C),
        .CH0_DDR4_0_ck_t(axi_noc_0_CH0_DDR4_0_CK_T),
        .CH0_DDR4_0_cke(axi_noc_0_CH0_DDR4_0_CKE),
        .CH0_DDR4_0_cs_n(axi_noc_0_CH0_DDR4_0_CS_N),
        .CH0_DDR4_0_dm_n(ddr4_dimm1_dm_n[7:0]),
        .CH0_DDR4_0_dq(ddr4_dimm1_dq[63:0]),
        .CH0_DDR4_0_dqs_c(ddr4_dimm1_dqs_c[7:0]),
        .CH0_DDR4_0_dqs_t(ddr4_dimm1_dqs_t[7:0]),
        .CH0_DDR4_0_odt(axi_noc_0_CH0_DDR4_0_ODT),
        .CH0_DDR4_0_reset_n(axi_noc_0_CH0_DDR4_0_RESET_N),
        .M00_AXI_araddr(axi_noc_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_noc_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_noc_0_M00_AXI_ARID),
        .M00_AXI_arlen(axi_noc_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_noc_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_noc_0_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_noc_0_M00_AXI_ARREADY),
        .M00_AXI_arregion(axi_noc_0_M00_AXI_ARREGION),
        .M00_AXI_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .M00_AXI_aruser(axi_noc_0_M00_AXI_ARUSER),
        .M00_AXI_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_noc_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_noc_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_noc_0_M00_AXI_AWID),
        .M00_AXI_awlen(axi_noc_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_noc_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_noc_0_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_noc_0_M00_AXI_AWREADY),
        .M00_AXI_awregion(axi_noc_0_M00_AXI_AWREGION),
        .M00_AXI_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .M00_AXI_awuser(axi_noc_0_M00_AXI_AWUSER),
        .M00_AXI_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_noc_0_M00_AXI_BID),
        .M00_AXI_bready(axi_noc_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_noc_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_noc_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_noc_0_M00_AXI_RDATA),
        .M00_AXI_rid(axi_noc_0_M00_AXI_RID),
        .M00_AXI_rlast(axi_noc_0_M00_AXI_RLAST),
        .M00_AXI_rready(axi_noc_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_noc_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_noc_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_noc_0_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_noc_0_M00_AXI_WLAST),
        .M00_AXI_wready(axi_noc_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_noc_0_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_noc_0_M01_AXI_ARADDR),
        .M01_AXI_arburst(axi_noc_0_M01_AXI_ARBURST),
        .M01_AXI_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .M01_AXI_arid(axi_noc_0_M01_AXI_ARID),
        .M01_AXI_arlen(axi_noc_0_M01_AXI_ARLEN),
        .M01_AXI_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .M01_AXI_arprot(axi_noc_0_M01_AXI_ARPROT),
        .M01_AXI_arqos(axi_noc_0_M01_AXI_ARQOS),
        .M01_AXI_arready(axi_noc_0_M01_AXI_ARREADY),
        .M01_AXI_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .M01_AXI_aruser(axi_noc_0_M01_AXI_ARUSER),
        .M01_AXI_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_noc_0_M01_AXI_AWADDR),
        .M01_AXI_awburst(axi_noc_0_M01_AXI_AWBURST),
        .M01_AXI_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .M01_AXI_awid(axi_noc_0_M01_AXI_AWID),
        .M01_AXI_awlen(axi_noc_0_M01_AXI_AWLEN),
        .M01_AXI_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .M01_AXI_awprot(axi_noc_0_M01_AXI_AWPROT),
        .M01_AXI_awqos(axi_noc_0_M01_AXI_AWQOS),
        .M01_AXI_awready(axi_noc_0_M01_AXI_AWREADY),
        .M01_AXI_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .M01_AXI_awuser(axi_noc_0_M01_AXI_AWUSER),
        .M01_AXI_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .M01_AXI_bid(axi_noc_0_M01_AXI_BID),
        .M01_AXI_bready(axi_noc_0_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_noc_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_noc_0_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_noc_0_M01_AXI_RDATA),
        .M01_AXI_rid(axi_noc_0_M01_AXI_RID),
        .M01_AXI_rlast(axi_noc_0_M01_AXI_RLAST),
        .M01_AXI_rready(axi_noc_0_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_noc_0_M01_AXI_RRESP),
        .M01_AXI_ruser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M01_AXI_rvalid(axi_noc_0_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_noc_0_M01_AXI_WDATA),
        .M01_AXI_wlast(axi_noc_0_M01_AXI_WLAST),
        .M01_AXI_wready(axi_noc_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_noc_0_M01_AXI_WVALID),
        .S00_AXI_araddr(versal_cips_0_CPM_PCIE_NOC_0_ARADDR),
        .S00_AXI_arburst(versal_cips_0_CPM_PCIE_NOC_0_ARBURST),
        .S00_AXI_arcache(versal_cips_0_CPM_PCIE_NOC_0_ARCACHE),
        .S00_AXI_arid(versal_cips_0_CPM_PCIE_NOC_0_ARID),
        .S00_AXI_arlen(versal_cips_0_CPM_PCIE_NOC_0_ARLEN),
        .S00_AXI_arlock(versal_cips_0_CPM_PCIE_NOC_0_ARLOCK),
        .S00_AXI_arprot(versal_cips_0_CPM_PCIE_NOC_0_ARPROT),
        .S00_AXI_arqos(versal_cips_0_CPM_PCIE_NOC_0_ARQOS),
        .S00_AXI_arready(versal_cips_0_CPM_PCIE_NOC_0_ARREADY),
        .S00_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arsize(versal_cips_0_CPM_PCIE_NOC_0_ARSIZE),
        .S00_AXI_aruser(versal_cips_0_CPM_PCIE_NOC_0_ARUSER),
        .S00_AXI_arvalid(versal_cips_0_CPM_PCIE_NOC_0_ARVALID),
        .S00_AXI_awaddr(versal_cips_0_CPM_PCIE_NOC_0_AWADDR),
        .S00_AXI_awburst(versal_cips_0_CPM_PCIE_NOC_0_AWBURST),
        .S00_AXI_awcache(versal_cips_0_CPM_PCIE_NOC_0_AWCACHE),
        .S00_AXI_awid(versal_cips_0_CPM_PCIE_NOC_0_AWID),
        .S00_AXI_awlen(versal_cips_0_CPM_PCIE_NOC_0_AWLEN),
        .S00_AXI_awlock(versal_cips_0_CPM_PCIE_NOC_0_AWLOCK),
        .S00_AXI_awprot(versal_cips_0_CPM_PCIE_NOC_0_AWPROT),
        .S00_AXI_awqos(versal_cips_0_CPM_PCIE_NOC_0_AWQOS),
        .S00_AXI_awready(versal_cips_0_CPM_PCIE_NOC_0_AWREADY),
        .S00_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awsize(versal_cips_0_CPM_PCIE_NOC_0_AWSIZE),
        .S00_AXI_awuser(versal_cips_0_CPM_PCIE_NOC_0_AWUSER),
        .S00_AXI_awvalid(versal_cips_0_CPM_PCIE_NOC_0_AWVALID),
        .S00_AXI_bid(versal_cips_0_CPM_PCIE_NOC_0_BID),
        .S00_AXI_bready(versal_cips_0_CPM_PCIE_NOC_0_BREADY),
        .S00_AXI_bresp(versal_cips_0_CPM_PCIE_NOC_0_BRESP),
        .S00_AXI_bvalid(versal_cips_0_CPM_PCIE_NOC_0_BVALID),
        .S00_AXI_rdata(versal_cips_0_CPM_PCIE_NOC_0_RDATA),
        .S00_AXI_rid(versal_cips_0_CPM_PCIE_NOC_0_RID),
        .S00_AXI_rlast(versal_cips_0_CPM_PCIE_NOC_0_RLAST),
        .S00_AXI_rready(versal_cips_0_CPM_PCIE_NOC_0_RREADY),
        .S00_AXI_rresp(versal_cips_0_CPM_PCIE_NOC_0_RRESP),
        .S00_AXI_rvalid(versal_cips_0_CPM_PCIE_NOC_0_RVALID),
        .S00_AXI_wdata(versal_cips_0_CPM_PCIE_NOC_0_WDATA),
        .S00_AXI_wlast(versal_cips_0_CPM_PCIE_NOC_0_WLAST),
        .S00_AXI_wready(versal_cips_0_CPM_PCIE_NOC_0_WREADY),
        .S00_AXI_wstrb(versal_cips_0_CPM_PCIE_NOC_0_WSTRB),
        .S00_AXI_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_wvalid(versal_cips_0_CPM_PCIE_NOC_0_WVALID),
        .S01_AXI_araddr(versal_cips_0_CPM_PCIE_NOC_1_ARADDR),
        .S01_AXI_arburst(versal_cips_0_CPM_PCIE_NOC_1_ARBURST),
        .S01_AXI_arcache(versal_cips_0_CPM_PCIE_NOC_1_ARCACHE),
        .S01_AXI_arid(versal_cips_0_CPM_PCIE_NOC_1_ARID),
        .S01_AXI_arlen(versal_cips_0_CPM_PCIE_NOC_1_ARLEN),
        .S01_AXI_arlock(versal_cips_0_CPM_PCIE_NOC_1_ARLOCK),
        .S01_AXI_arprot(versal_cips_0_CPM_PCIE_NOC_1_ARPROT),
        .S01_AXI_arqos(versal_cips_0_CPM_PCIE_NOC_1_ARQOS),
        .S01_AXI_arready(versal_cips_0_CPM_PCIE_NOC_1_ARREADY),
        .S01_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arsize(versal_cips_0_CPM_PCIE_NOC_1_ARSIZE),
        .S01_AXI_aruser(versal_cips_0_CPM_PCIE_NOC_1_ARUSER),
        .S01_AXI_arvalid(versal_cips_0_CPM_PCIE_NOC_1_ARVALID),
        .S01_AXI_awaddr(versal_cips_0_CPM_PCIE_NOC_1_AWADDR),
        .S01_AXI_awburst(versal_cips_0_CPM_PCIE_NOC_1_AWBURST),
        .S01_AXI_awcache(versal_cips_0_CPM_PCIE_NOC_1_AWCACHE),
        .S01_AXI_awid(versal_cips_0_CPM_PCIE_NOC_1_AWID),
        .S01_AXI_awlen(versal_cips_0_CPM_PCIE_NOC_1_AWLEN),
        .S01_AXI_awlock(versal_cips_0_CPM_PCIE_NOC_1_AWLOCK),
        .S01_AXI_awprot(versal_cips_0_CPM_PCIE_NOC_1_AWPROT),
        .S01_AXI_awqos(versal_cips_0_CPM_PCIE_NOC_1_AWQOS),
        .S01_AXI_awready(versal_cips_0_CPM_PCIE_NOC_1_AWREADY),
        .S01_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awsize(versal_cips_0_CPM_PCIE_NOC_1_AWSIZE),
        .S01_AXI_awuser(versal_cips_0_CPM_PCIE_NOC_1_AWUSER),
        .S01_AXI_awvalid(versal_cips_0_CPM_PCIE_NOC_1_AWVALID),
        .S01_AXI_bid(versal_cips_0_CPM_PCIE_NOC_1_BID),
        .S01_AXI_bready(versal_cips_0_CPM_PCIE_NOC_1_BREADY),
        .S01_AXI_bresp(versal_cips_0_CPM_PCIE_NOC_1_BRESP),
        .S01_AXI_bvalid(versal_cips_0_CPM_PCIE_NOC_1_BVALID),
        .S01_AXI_rdata(versal_cips_0_CPM_PCIE_NOC_1_RDATA),
        .S01_AXI_rid(versal_cips_0_CPM_PCIE_NOC_1_RID),
        .S01_AXI_rlast(versal_cips_0_CPM_PCIE_NOC_1_RLAST),
        .S01_AXI_rready(versal_cips_0_CPM_PCIE_NOC_1_RREADY),
        .S01_AXI_rresp(versal_cips_0_CPM_PCIE_NOC_1_RRESP),
        .S01_AXI_rvalid(versal_cips_0_CPM_PCIE_NOC_1_RVALID),
        .S01_AXI_wdata(versal_cips_0_CPM_PCIE_NOC_1_WDATA),
        .S01_AXI_wlast(versal_cips_0_CPM_PCIE_NOC_1_WLAST),
        .S01_AXI_wready(versal_cips_0_CPM_PCIE_NOC_1_WREADY),
        .S01_AXI_wstrb(versal_cips_0_CPM_PCIE_NOC_1_WSTRB),
        .S01_AXI_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_wvalid(versal_cips_0_CPM_PCIE_NOC_1_WVALID),
        .aclk0(versal_cips_0_cpm_pcie_noc_axi0_clk),
        .aclk1(versal_cips_0_cpm_pcie_noc_axi1_clk),
        .aclk2(versal_cips_0_pcie0_user_clk),
        .aclk3(versal_cips_0_noc_cpm_pcie_axi0_clk),
        .sys_clk0_clk_n(ddr4_dimm1_sma_clk_1_CLK_N),
        .sys_clk0_clk_p(ddr4_dimm1_sma_clk_1_CLK_P));
  CPM_bd_axis_ila_0_0 axis_ila_BRAM
       (.SLOT_0_AXI_araddr(axi_noc_0_M00_AXI_ARADDR),
        .SLOT_0_AXI_arburst(axi_noc_0_M00_AXI_ARBURST),
        .SLOT_0_AXI_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .SLOT_0_AXI_arid(axi_noc_0_M00_AXI_ARID),
        .SLOT_0_AXI_arlen(axi_noc_0_M00_AXI_ARLEN),
        .SLOT_0_AXI_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .SLOT_0_AXI_arprot(axi_noc_0_M00_AXI_ARPROT),
        .SLOT_0_AXI_arqos(axi_noc_0_M00_AXI_ARQOS),
        .SLOT_0_AXI_arready(axi_noc_0_M00_AXI_ARREADY),
        .SLOT_0_AXI_arregion(axi_noc_0_M00_AXI_ARREGION),
        .SLOT_0_AXI_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .SLOT_0_AXI_aruser(axi_noc_0_M00_AXI_ARUSER),
        .SLOT_0_AXI_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .SLOT_0_AXI_awaddr(axi_noc_0_M00_AXI_AWADDR),
        .SLOT_0_AXI_awburst(axi_noc_0_M00_AXI_AWBURST),
        .SLOT_0_AXI_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .SLOT_0_AXI_awid(axi_noc_0_M00_AXI_AWID),
        .SLOT_0_AXI_awlen(axi_noc_0_M00_AXI_AWLEN),
        .SLOT_0_AXI_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .SLOT_0_AXI_awprot(axi_noc_0_M00_AXI_AWPROT),
        .SLOT_0_AXI_awqos(axi_noc_0_M00_AXI_AWQOS),
        .SLOT_0_AXI_awready(axi_noc_0_M00_AXI_AWREADY),
        .SLOT_0_AXI_awregion(axi_noc_0_M00_AXI_AWREGION),
        .SLOT_0_AXI_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .SLOT_0_AXI_awuser(axi_noc_0_M00_AXI_AWUSER),
        .SLOT_0_AXI_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .SLOT_0_AXI_bid(axi_noc_0_M00_AXI_BID),
        .SLOT_0_AXI_bready(axi_noc_0_M00_AXI_BREADY),
        .SLOT_0_AXI_bresp(axi_noc_0_M00_AXI_BRESP),
        .SLOT_0_AXI_bvalid(axi_noc_0_M00_AXI_BVALID),
        .SLOT_0_AXI_rdata(axi_noc_0_M00_AXI_RDATA),
        .SLOT_0_AXI_rid(axi_noc_0_M00_AXI_RID),
        .SLOT_0_AXI_rlast(axi_noc_0_M00_AXI_RLAST),
        .SLOT_0_AXI_rready(axi_noc_0_M00_AXI_RREADY),
        .SLOT_0_AXI_rresp(axi_noc_0_M00_AXI_RRESP),
        .SLOT_0_AXI_rvalid(axi_noc_0_M00_AXI_RVALID),
        .SLOT_0_AXI_wdata(axi_noc_0_M00_AXI_WDATA),
        .SLOT_0_AXI_wlast(axi_noc_0_M00_AXI_WLAST),
        .SLOT_0_AXI_wready(axi_noc_0_M00_AXI_WREADY),
        .SLOT_0_AXI_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .SLOT_0_AXI_wvalid(axi_noc_0_M00_AXI_WVALID),
        .clk(versal_cips_0_pcie0_user_clk),
        .resetn(versal_cips_0_dma0_axi_aresetn));
  CPM_bd_versal_cips_0_0 versal_cips_0
       (.CPM_PCIE_NOC_0_araddr(versal_cips_0_CPM_PCIE_NOC_0_ARADDR),
        .CPM_PCIE_NOC_0_arburst(versal_cips_0_CPM_PCIE_NOC_0_ARBURST),
        .CPM_PCIE_NOC_0_arcache(versal_cips_0_CPM_PCIE_NOC_0_ARCACHE),
        .CPM_PCIE_NOC_0_arid(versal_cips_0_CPM_PCIE_NOC_0_ARID),
        .CPM_PCIE_NOC_0_arlen(versal_cips_0_CPM_PCIE_NOC_0_ARLEN),
        .CPM_PCIE_NOC_0_arlock(versal_cips_0_CPM_PCIE_NOC_0_ARLOCK),
        .CPM_PCIE_NOC_0_arprot(versal_cips_0_CPM_PCIE_NOC_0_ARPROT),
        .CPM_PCIE_NOC_0_arqos(versal_cips_0_CPM_PCIE_NOC_0_ARQOS),
        .CPM_PCIE_NOC_0_arready(versal_cips_0_CPM_PCIE_NOC_0_ARREADY),
        .CPM_PCIE_NOC_0_arsize(versal_cips_0_CPM_PCIE_NOC_0_ARSIZE),
        .CPM_PCIE_NOC_0_aruser(versal_cips_0_CPM_PCIE_NOC_0_ARUSER),
        .CPM_PCIE_NOC_0_arvalid(versal_cips_0_CPM_PCIE_NOC_0_ARVALID),
        .CPM_PCIE_NOC_0_awaddr(versal_cips_0_CPM_PCIE_NOC_0_AWADDR),
        .CPM_PCIE_NOC_0_awburst(versal_cips_0_CPM_PCIE_NOC_0_AWBURST),
        .CPM_PCIE_NOC_0_awcache(versal_cips_0_CPM_PCIE_NOC_0_AWCACHE),
        .CPM_PCIE_NOC_0_awid(versal_cips_0_CPM_PCIE_NOC_0_AWID),
        .CPM_PCIE_NOC_0_awlen(versal_cips_0_CPM_PCIE_NOC_0_AWLEN),
        .CPM_PCIE_NOC_0_awlock(versal_cips_0_CPM_PCIE_NOC_0_AWLOCK),
        .CPM_PCIE_NOC_0_awprot(versal_cips_0_CPM_PCIE_NOC_0_AWPROT),
        .CPM_PCIE_NOC_0_awqos(versal_cips_0_CPM_PCIE_NOC_0_AWQOS),
        .CPM_PCIE_NOC_0_awready(versal_cips_0_CPM_PCIE_NOC_0_AWREADY),
        .CPM_PCIE_NOC_0_awsize(versal_cips_0_CPM_PCIE_NOC_0_AWSIZE),
        .CPM_PCIE_NOC_0_awuser(versal_cips_0_CPM_PCIE_NOC_0_AWUSER),
        .CPM_PCIE_NOC_0_awvalid(versal_cips_0_CPM_PCIE_NOC_0_AWVALID),
        .CPM_PCIE_NOC_0_bid(versal_cips_0_CPM_PCIE_NOC_0_BID),
        .CPM_PCIE_NOC_0_bready(versal_cips_0_CPM_PCIE_NOC_0_BREADY),
        .CPM_PCIE_NOC_0_bresp(versal_cips_0_CPM_PCIE_NOC_0_BRESP),
        .CPM_PCIE_NOC_0_bvalid(versal_cips_0_CPM_PCIE_NOC_0_BVALID),
        .CPM_PCIE_NOC_0_rdata(versal_cips_0_CPM_PCIE_NOC_0_RDATA),
        .CPM_PCIE_NOC_0_rid(versal_cips_0_CPM_PCIE_NOC_0_RID),
        .CPM_PCIE_NOC_0_rlast(versal_cips_0_CPM_PCIE_NOC_0_RLAST),
        .CPM_PCIE_NOC_0_rready(versal_cips_0_CPM_PCIE_NOC_0_RREADY),
        .CPM_PCIE_NOC_0_rresp(versal_cips_0_CPM_PCIE_NOC_0_RRESP),
        .CPM_PCIE_NOC_0_rvalid(versal_cips_0_CPM_PCIE_NOC_0_RVALID),
        .CPM_PCIE_NOC_0_wdata(versal_cips_0_CPM_PCIE_NOC_0_WDATA),
        .CPM_PCIE_NOC_0_wlast(versal_cips_0_CPM_PCIE_NOC_0_WLAST),
        .CPM_PCIE_NOC_0_wready(versal_cips_0_CPM_PCIE_NOC_0_WREADY),
        .CPM_PCIE_NOC_0_wstrb(versal_cips_0_CPM_PCIE_NOC_0_WSTRB),
        .CPM_PCIE_NOC_0_wvalid(versal_cips_0_CPM_PCIE_NOC_0_WVALID),
        .CPM_PCIE_NOC_1_araddr(versal_cips_0_CPM_PCIE_NOC_1_ARADDR),
        .CPM_PCIE_NOC_1_arburst(versal_cips_0_CPM_PCIE_NOC_1_ARBURST),
        .CPM_PCIE_NOC_1_arcache(versal_cips_0_CPM_PCIE_NOC_1_ARCACHE),
        .CPM_PCIE_NOC_1_arid(versal_cips_0_CPM_PCIE_NOC_1_ARID),
        .CPM_PCIE_NOC_1_arlen(versal_cips_0_CPM_PCIE_NOC_1_ARLEN),
        .CPM_PCIE_NOC_1_arlock(versal_cips_0_CPM_PCIE_NOC_1_ARLOCK),
        .CPM_PCIE_NOC_1_arprot(versal_cips_0_CPM_PCIE_NOC_1_ARPROT),
        .CPM_PCIE_NOC_1_arqos(versal_cips_0_CPM_PCIE_NOC_1_ARQOS),
        .CPM_PCIE_NOC_1_arready(versal_cips_0_CPM_PCIE_NOC_1_ARREADY),
        .CPM_PCIE_NOC_1_arsize(versal_cips_0_CPM_PCIE_NOC_1_ARSIZE),
        .CPM_PCIE_NOC_1_aruser(versal_cips_0_CPM_PCIE_NOC_1_ARUSER),
        .CPM_PCIE_NOC_1_arvalid(versal_cips_0_CPM_PCIE_NOC_1_ARVALID),
        .CPM_PCIE_NOC_1_awaddr(versal_cips_0_CPM_PCIE_NOC_1_AWADDR),
        .CPM_PCIE_NOC_1_awburst(versal_cips_0_CPM_PCIE_NOC_1_AWBURST),
        .CPM_PCIE_NOC_1_awcache(versal_cips_0_CPM_PCIE_NOC_1_AWCACHE),
        .CPM_PCIE_NOC_1_awid(versal_cips_0_CPM_PCIE_NOC_1_AWID),
        .CPM_PCIE_NOC_1_awlen(versal_cips_0_CPM_PCIE_NOC_1_AWLEN),
        .CPM_PCIE_NOC_1_awlock(versal_cips_0_CPM_PCIE_NOC_1_AWLOCK),
        .CPM_PCIE_NOC_1_awprot(versal_cips_0_CPM_PCIE_NOC_1_AWPROT),
        .CPM_PCIE_NOC_1_awqos(versal_cips_0_CPM_PCIE_NOC_1_AWQOS),
        .CPM_PCIE_NOC_1_awready(versal_cips_0_CPM_PCIE_NOC_1_AWREADY),
        .CPM_PCIE_NOC_1_awsize(versal_cips_0_CPM_PCIE_NOC_1_AWSIZE),
        .CPM_PCIE_NOC_1_awuser(versal_cips_0_CPM_PCIE_NOC_1_AWUSER),
        .CPM_PCIE_NOC_1_awvalid(versal_cips_0_CPM_PCIE_NOC_1_AWVALID),
        .CPM_PCIE_NOC_1_bid(versal_cips_0_CPM_PCIE_NOC_1_BID),
        .CPM_PCIE_NOC_1_bready(versal_cips_0_CPM_PCIE_NOC_1_BREADY),
        .CPM_PCIE_NOC_1_bresp(versal_cips_0_CPM_PCIE_NOC_1_BRESP),
        .CPM_PCIE_NOC_1_bvalid(versal_cips_0_CPM_PCIE_NOC_1_BVALID),
        .CPM_PCIE_NOC_1_rdata(versal_cips_0_CPM_PCIE_NOC_1_RDATA),
        .CPM_PCIE_NOC_1_rid(versal_cips_0_CPM_PCIE_NOC_1_RID),
        .CPM_PCIE_NOC_1_rlast(versal_cips_0_CPM_PCIE_NOC_1_RLAST),
        .CPM_PCIE_NOC_1_rready(versal_cips_0_CPM_PCIE_NOC_1_RREADY),
        .CPM_PCIE_NOC_1_rresp(versal_cips_0_CPM_PCIE_NOC_1_RRESP),
        .CPM_PCIE_NOC_1_rvalid(versal_cips_0_CPM_PCIE_NOC_1_RVALID),
        .CPM_PCIE_NOC_1_wdata(versal_cips_0_CPM_PCIE_NOC_1_WDATA),
        .CPM_PCIE_NOC_1_wlast(versal_cips_0_CPM_PCIE_NOC_1_WLAST),
        .CPM_PCIE_NOC_1_wready(versal_cips_0_CPM_PCIE_NOC_1_WREADY),
        .CPM_PCIE_NOC_1_wstrb(versal_cips_0_CPM_PCIE_NOC_1_WSTRB),
        .CPM_PCIE_NOC_1_wvalid(versal_cips_0_CPM_PCIE_NOC_1_WVALID),
        .NOC_CPM_PCIE_0_araddr(axi_noc_0_M01_AXI_ARADDR),
        .NOC_CPM_PCIE_0_arburst(axi_noc_0_M01_AXI_ARBURST),
        .NOC_CPM_PCIE_0_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .NOC_CPM_PCIE_0_arid(axi_noc_0_M01_AXI_ARID),
        .NOC_CPM_PCIE_0_arlen(axi_noc_0_M01_AXI_ARLEN),
        .NOC_CPM_PCIE_0_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .NOC_CPM_PCIE_0_arprot(axi_noc_0_M01_AXI_ARPROT),
        .NOC_CPM_PCIE_0_arqos(axi_noc_0_M01_AXI_ARQOS),
        .NOC_CPM_PCIE_0_arready(axi_noc_0_M01_AXI_ARREADY),
        .NOC_CPM_PCIE_0_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .NOC_CPM_PCIE_0_aruser(axi_noc_0_M01_AXI_ARUSER),
        .NOC_CPM_PCIE_0_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .NOC_CPM_PCIE_0_awaddr(axi_noc_0_M01_AXI_AWADDR),
        .NOC_CPM_PCIE_0_awburst(axi_noc_0_M01_AXI_AWBURST),
        .NOC_CPM_PCIE_0_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .NOC_CPM_PCIE_0_awid(axi_noc_0_M01_AXI_AWID),
        .NOC_CPM_PCIE_0_awlen(axi_noc_0_M01_AXI_AWLEN),
        .NOC_CPM_PCIE_0_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .NOC_CPM_PCIE_0_awprot(axi_noc_0_M01_AXI_AWPROT),
        .NOC_CPM_PCIE_0_awqos(axi_noc_0_M01_AXI_AWQOS),
        .NOC_CPM_PCIE_0_awready(axi_noc_0_M01_AXI_AWREADY),
        .NOC_CPM_PCIE_0_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .NOC_CPM_PCIE_0_awuser(axi_noc_0_M01_AXI_AWUSER),
        .NOC_CPM_PCIE_0_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .NOC_CPM_PCIE_0_bid(axi_noc_0_M01_AXI_BID),
        .NOC_CPM_PCIE_0_bready(axi_noc_0_M01_AXI_BREADY),
        .NOC_CPM_PCIE_0_bresp(axi_noc_0_M01_AXI_BRESP),
        .NOC_CPM_PCIE_0_bvalid(axi_noc_0_M01_AXI_BVALID),
        .NOC_CPM_PCIE_0_rdata(axi_noc_0_M01_AXI_RDATA),
        .NOC_CPM_PCIE_0_rid(axi_noc_0_M01_AXI_RID),
        .NOC_CPM_PCIE_0_rlast(axi_noc_0_M01_AXI_RLAST),
        .NOC_CPM_PCIE_0_rready(axi_noc_0_M01_AXI_RREADY),
        .NOC_CPM_PCIE_0_rresp(axi_noc_0_M01_AXI_RRESP),
        .NOC_CPM_PCIE_0_rvalid(axi_noc_0_M01_AXI_RVALID),
        .NOC_CPM_PCIE_0_wdata(axi_noc_0_M01_AXI_WDATA),
        .NOC_CPM_PCIE_0_wlast(axi_noc_0_M01_AXI_WLAST),
        .NOC_CPM_PCIE_0_wready(axi_noc_0_M01_AXI_WREADY),
        .NOC_CPM_PCIE_0_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .NOC_CPM_PCIE_0_wvalid(axi_noc_0_M01_AXI_WVALID),
        .PCIE0_GT_grx_n(versal_cips_0_PCIE0_GT_GRX_N),
        .PCIE0_GT_grx_p(versal_cips_0_PCIE0_GT_GRX_P),
        .PCIE0_GT_gtx_n(versal_cips_0_PCIE0_GT_GTX_N),
        .PCIE0_GT_gtx_p(versal_cips_0_PCIE0_GT_GTX_P),
        .cpm_irq0(1'b0),
        .cpm_irq1(1'b0),
        .cpm_pcie_noc_axi0_clk(versal_cips_0_cpm_pcie_noc_axi0_clk),
        .cpm_pcie_noc_axi1_clk(versal_cips_0_cpm_pcie_noc_axi1_clk),
        .dma0_axi_aresetn(versal_cips_0_dma0_axi_aresetn),
        .dma0_mgmt_cpl_rdy(1'b1),
        .dma0_mgmt_req_adr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_cmd({1'b0,1'b0}),
        .dma0_mgmt_req_dat({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_fnc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_msc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dma0_mgmt_req_vld(1'b0),
        .dma0_soft_resetn(1'b1),
        .dma0_st_rx_msg_tready(1'b1),
        .gt_refclk0_clk_n(gt_refclk0_0_1_CLK_N),
        .gt_refclk0_clk_p(gt_refclk0_0_1_CLK_P),
        .noc_cpm_pcie_axi0_clk(versal_cips_0_noc_cpm_pcie_axi0_clk),
        .pcie0_user_clk(versal_cips_0_pcie0_user_clk),
        .xdma0_usr_irq_req(1'b0));
endmodule
