//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_f29c.bd
//Design : bd_f29c
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_f29c,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_f29c,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "CPM_bd_axi_noc_0_0.hwdef" *) 
module bd_f29c
   (CH0_DDR4_0_act_n,
    CH0_DDR4_0_adr,
    CH0_DDR4_0_ba,
    CH0_DDR4_0_bg,
    CH0_DDR4_0_ck_c,
    CH0_DDR4_0_ck_t,
    CH0_DDR4_0_cke,
    CH0_DDR4_0_cs_n,
    CH0_DDR4_0_dm_n,
    CH0_DDR4_0_dq,
    CH0_DDR4_0_dqs_c,
    CH0_DDR4_0_dqs_t,
    CH0_DDR4_0_odt,
    CH0_DDR4_0_reset_n,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arregion,
    M00_AXI_arsize,
    M00_AXI_aruser,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awregion,
    M00_AXI_awsize,
    M00_AXI_awuser,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_AXI_araddr,
    M01_AXI_arburst,
    M01_AXI_arcache,
    M01_AXI_arid,
    M01_AXI_arlen,
    M01_AXI_arlock,
    M01_AXI_arprot,
    M01_AXI_arqos,
    M01_AXI_arready,
    M01_AXI_arregion,
    M01_AXI_arsize,
    M01_AXI_aruser,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awburst,
    M01_AXI_awcache,
    M01_AXI_awid,
    M01_AXI_awlen,
    M01_AXI_awlock,
    M01_AXI_awprot,
    M01_AXI_awqos,
    M01_AXI_awready,
    M01_AXI_awregion,
    M01_AXI_awsize,
    M01_AXI_awuser,
    M01_AXI_awvalid,
    M01_AXI_bid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rid,
    M01_AXI_rlast,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_ruser,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wlast,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wuser,
    M01_AXI_wvalid,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_aruser,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awuser,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_ruser,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wuser,
    S00_AXI_wvalid,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arid,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arregion,
    S01_AXI_arsize,
    S01_AXI_aruser,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awid,
    S01_AXI_awlen,
    S01_AXI_awlock,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awready,
    S01_AXI_awregion,
    S01_AXI_awsize,
    S01_AXI_awuser,
    S01_AXI_awvalid,
    S01_AXI_bid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rid,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_ruser,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wuser,
    S01_AXI_wvalid,
    aclk0,
    aclk1,
    aclk2,
    aclk3,
    sys_clk0_clk_n,
    sys_clk0_clk_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 ACT_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CH0_DDR4_0, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, MY_CATEGORY pl, NOC_ID -1, SLOT Single, TIMEPERIOD_PS 1250, WRITE_BUFFER_SIZE 80" *) output [0:0]CH0_DDR4_0_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 ADR" *) output [16:0]CH0_DDR4_0_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 BA" *) output [1:0]CH0_DDR4_0_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 BG" *) output [1:0]CH0_DDR4_0_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CK_C" *) output [0:0]CH0_DDR4_0_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CK_T" *) output [0:0]CH0_DDR4_0_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CKE" *) output [0:0]CH0_DDR4_0_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CS_N" *) output [0:0]CH0_DDR4_0_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DM_N" *) inout [7:0]CH0_DDR4_0_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DQ" *) inout [63:0]CH0_DDR4_0_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DQS_C" *) inout [7:0]CH0_DDR4_0_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DQS_T" *) inout [7:0]CH0_DDR4_0_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 ODT" *) output [0:0]CH0_DDR4_0_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 RESET_N" *) output [0:0]CH0_DDR4_0_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI, ADDR_WIDTH 64, APERTURES {0x201_0000_0000 1G}, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY pl, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, DATA_WIDTH 32, FREQ_HZ 250000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 2, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY noc, NOC_ID -1, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WRITE_BUFFER_SIZE 80, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]M00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST" *) output [1:0]M00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE" *) output [3:0]M00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARID" *) output [1:0]M00_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN" *) output [7:0]M00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK" *) output [0:0]M00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *) output [2:0]M00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS" *) output [3:0]M00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *) input [0:0]M00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREGION" *) output [3:0]M00_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE" *) output [2:0]M00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARUSER" *) output [17:0]M00_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *) output [0:0]M00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *) output [63:0]M00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST" *) output [1:0]M00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE" *) output [3:0]M00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWID" *) output [1:0]M00_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN" *) output [7:0]M00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK" *) output [0:0]M00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *) output [2:0]M00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS" *) output [3:0]M00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *) input [0:0]M00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREGION" *) output [3:0]M00_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE" *) output [2:0]M00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWUSER" *) output [17:0]M00_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *) output [0:0]M00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BID" *) input [1:0]M00_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *) output [0:0]M00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *) input [1:0]M00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *) input [0:0]M00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *) input [31:0]M00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RID" *) input [1:0]M00_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RLAST" *) input [0:0]M00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *) output [0:0]M00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *) input [1:0]M00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *) input [0:0]M00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *) output [31:0]M00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WLAST" *) output [0:0]M00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *) input [0:0]M00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *) output [3:0]M00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *) output [0:0]M00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M01_AXI, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY ps_pcie, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, DATA_WIDTH 128, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 2, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY noc, NOC_ID -1, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 4, PHASE 0.0, PHYSICAL_CHANNEL NOC_NSU_TO_PS_PCIE, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, REGION 0, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, SUPPORTS_NARROW_BURST 1, WRITE_BUFFER_SIZE 80, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17" *) output [63:0]M01_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARBURST" *) output [1:0]M01_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARCACHE" *) output [3:0]M01_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARID" *) output [1:0]M01_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARLEN" *) output [7:0]M01_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARLOCK" *) output [0:0]M01_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARPROT" *) output [2:0]M01_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARQOS" *) output [3:0]M01_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREADY" *) input [0:0]M01_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREGION" *) output [3:0]M01_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARSIZE" *) output [2:0]M01_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARUSER" *) output [17:0]M01_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARVALID" *) output [0:0]M01_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWADDR" *) output [63:0]M01_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWBURST" *) output [1:0]M01_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWCACHE" *) output [3:0]M01_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWID" *) output [1:0]M01_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWLEN" *) output [7:0]M01_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWLOCK" *) output [0:0]M01_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWPROT" *) output [2:0]M01_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWQOS" *) output [3:0]M01_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREADY" *) input [0:0]M01_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREGION" *) output [3:0]M01_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWSIZE" *) output [2:0]M01_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWUSER" *) output [17:0]M01_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWVALID" *) output [0:0]M01_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BID" *) input [1:0]M01_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BREADY" *) output [0:0]M01_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BRESP" *) input [1:0]M01_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BVALID" *) input [0:0]M01_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RDATA" *) input [127:0]M01_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RID" *) input [1:0]M01_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RLAST" *) input [0:0]M01_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RREADY" *) output [0:0]M01_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RRESP" *) input [1:0]M01_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RUSER" *) input [16:0]M01_AXI_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RVALID" *) input [0:0]M01_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WDATA" *) output [127:0]M01_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WLAST" *) output [0:0]M01_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WREADY" *) input [0:0]M01_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WSTRB" *) output [15:0]M01_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WUSER" *) output [16:0]M01_AXI_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WVALID" *) output [0:0]M01_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY ps_pcie, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, CONNECTIONS MC_0 { read_bw {1720} write_bw {1720}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} , DATA_WIDTH 128, DEST_IDS M01_AXI:0x40:M00_AXI:0x0, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY noc, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, REGION 0, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, SUPPORTS_NARROW_BURST 1, WRITE_BUFFER_SIZE 80, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [63:0]S00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST" *) input [1:0]S00_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE" *) input [3:0]S00_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARID" *) input [15:0]S00_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN" *) input [7:0]S00_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK" *) input [0:0]S00_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]S00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS" *) input [3:0]S00_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output [0:0]S00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREGION" *) input [3:0]S00_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE" *) input [2:0]S00_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARUSER" *) input [17:0]S00_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input [0:0]S00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [63:0]S00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST" *) input [1:0]S00_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE" *) input [3:0]S00_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWID" *) input [15:0]S00_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN" *) input [7:0]S00_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK" *) input [0:0]S00_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]S00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS" *) input [3:0]S00_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output [0:0]S00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREGION" *) input [3:0]S00_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE" *) input [2:0]S00_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWUSER" *) input [17:0]S00_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input [0:0]S00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BID" *) output [15:0]S00_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input [0:0]S00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]S00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output [0:0]S00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [127:0]S00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RID" *) output [15:0]S00_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RLAST" *) output [0:0]S00_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input [0:0]S00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]S00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RUSER" *) output [16:0]S00_AXI_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output [0:0]S00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [127:0]S00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WLAST" *) input [0:0]S00_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output [0:0]S00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [15:0]S00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WUSER" *) input [16:0]S00_AXI_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input [0:0]S00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXI, ADDR_WIDTH 64, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY ps_pcie, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, CONNECTIONS MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {5} write_bw {5}} , DATA_WIDTH 128, DEST_IDS M01_AXI:0x40:M00_AXI:0x0, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 16, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY noc, NUM_READ_OUTSTANDING 64, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 64, NUM_WRITE_THREADS 1, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, REGION 0, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 17, R_LATENCY 300, R_MAX_BURST_LENGTH 256, R_RATE_LIMITER 10, R_TRAFFIC_CLASS BEST_EFFORT, SUPPORTS_NARROW_BURST 1, WRITE_BUFFER_SIZE 80, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 17, W_MAX_BURST_LENGTH 256, W_RATE_LIMITER 10, W_TRAFFIC_CLASS BEST_EFFORT" *) input [63:0]S01_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARBURST" *) input [1:0]S01_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARCACHE" *) input [3:0]S01_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARID" *) input [15:0]S01_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLEN" *) input [7:0]S01_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLOCK" *) input [0:0]S01_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARPROT" *) input [2:0]S01_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARQOS" *) input [3:0]S01_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREADY" *) output [0:0]S01_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREGION" *) input [3:0]S01_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARSIZE" *) input [2:0]S01_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARUSER" *) input [17:0]S01_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARVALID" *) input [0:0]S01_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWADDR" *) input [63:0]S01_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWBURST" *) input [1:0]S01_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWCACHE" *) input [3:0]S01_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWID" *) input [15:0]S01_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLEN" *) input [7:0]S01_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLOCK" *) input [0:0]S01_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWPROT" *) input [2:0]S01_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWQOS" *) input [3:0]S01_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWREADY" *) output [0:0]S01_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWREGION" *) input [3:0]S01_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWSIZE" *) input [2:0]S01_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWUSER" *) input [17:0]S01_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWVALID" *) input [0:0]S01_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BID" *) output [15:0]S01_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BREADY" *) input [0:0]S01_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BRESP" *) output [1:0]S01_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BVALID" *) output [0:0]S01_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RDATA" *) output [127:0]S01_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RID" *) output [15:0]S01_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RLAST" *) output [0:0]S01_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RREADY" *) input [0:0]S01_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RRESP" *) output [1:0]S01_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RUSER" *) output [16:0]S01_AXI_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RVALID" *) output [0:0]S01_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WDATA" *) input [127:0]S01_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WLAST" *) input [0:0]S01_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WREADY" *) output [0:0]S01_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WSTRB" *) input [15:0]S01_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WUSER" *) input [16:0]S01_AXI_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WVALID" *) input [0:0]S01_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK0, ASSOCIATED_BUSIF S00_AXI, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *) input aclk0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK1, ASSOCIATED_BUSIF S01_AXI, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *) input aclk1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK2 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK2, ASSOCIATED_BUSIF M00_AXI, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input aclk2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK3 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK3, ASSOCIATED_BUSIF M01_AXI, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NSU" *) input aclk3;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sys_clk0 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_clk0, CAN_DEBUG false, FREQ_HZ 200000000" *) input [0:0]sys_clk0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sys_clk0 CLK_P" *) input [0:0]sys_clk0_clk_p;

  wire [63:0]M00_AXI_nsu_MAXI4_ARADDR;
  wire [1:0]M00_AXI_nsu_MAXI4_ARBURST;
  wire [3:0]M00_AXI_nsu_MAXI4_ARCACHE;
  wire [1:0]M00_AXI_nsu_MAXI4_ARID;
  wire [7:0]M00_AXI_nsu_MAXI4_ARLEN;
  wire [0:0]M00_AXI_nsu_MAXI4_ARLOCK;
  wire [2:0]M00_AXI_nsu_MAXI4_ARPROT;
  wire [3:0]M00_AXI_nsu_MAXI4_ARQOS;
  wire [0:0]M00_AXI_nsu_MAXI4_ARREADY;
  wire [3:0]M00_AXI_nsu_MAXI4_ARREGION;
  wire [2:0]M00_AXI_nsu_MAXI4_ARSIZE;
  wire [17:0]M00_AXI_nsu_MAXI4_ARUSER;
  wire M00_AXI_nsu_MAXI4_ARVALID;
  wire [63:0]M00_AXI_nsu_MAXI4_AWADDR;
  wire [1:0]M00_AXI_nsu_MAXI4_AWBURST;
  wire [3:0]M00_AXI_nsu_MAXI4_AWCACHE;
  wire [1:0]M00_AXI_nsu_MAXI4_AWID;
  wire [7:0]M00_AXI_nsu_MAXI4_AWLEN;
  wire [0:0]M00_AXI_nsu_MAXI4_AWLOCK;
  wire [2:0]M00_AXI_nsu_MAXI4_AWPROT;
  wire [3:0]M00_AXI_nsu_MAXI4_AWQOS;
  wire [0:0]M00_AXI_nsu_MAXI4_AWREADY;
  wire [3:0]M00_AXI_nsu_MAXI4_AWREGION;
  wire [2:0]M00_AXI_nsu_MAXI4_AWSIZE;
  wire [17:0]M00_AXI_nsu_MAXI4_AWUSER;
  wire M00_AXI_nsu_MAXI4_AWVALID;
  wire [1:0]M00_AXI_nsu_MAXI4_BID;
  wire M00_AXI_nsu_MAXI4_BREADY;
  wire [1:0]M00_AXI_nsu_MAXI4_BRESP;
  wire [0:0]M00_AXI_nsu_MAXI4_BVALID;
  wire [31:0]M00_AXI_nsu_MAXI4_RDATA;
  wire [1:0]M00_AXI_nsu_MAXI4_RID;
  wire [0:0]M00_AXI_nsu_MAXI4_RLAST;
  wire M00_AXI_nsu_MAXI4_RREADY;
  wire [1:0]M00_AXI_nsu_MAXI4_RRESP;
  wire [0:0]M00_AXI_nsu_MAXI4_RVALID;
  wire [31:0]M00_AXI_nsu_MAXI4_WDATA;
  wire [0:0]M00_AXI_nsu_MAXI4_WLAST;
  wire [0:0]M00_AXI_nsu_MAXI4_WREADY;
  wire [3:0]M00_AXI_nsu_MAXI4_WSTRB;
  wire M00_AXI_nsu_MAXI4_WVALID;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire M00_AXI_nsw_NSU;
  (* HARD_CONN = "true" *) wire [63:0]M01_AXI_nsu_MAXI4_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]M01_AXI_nsu_MAXI4_ARCACHE;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_ARID;
  (* HARD_CONN = "true" *) wire [7:0]M01_AXI_nsu_MAXI4_ARLEN;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]M01_AXI_nsu_MAXI4_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]M01_AXI_nsu_MAXI4_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_ARREADY;
  (* HARD_CONN = "true" *) wire [3:0]M01_AXI_nsu_MAXI4_ARREGION;
  (* HARD_CONN = "true" *) wire [2:0]M01_AXI_nsu_MAXI4_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]M01_AXI_nsu_MAXI4_ARUSER;
  (* HARD_CONN = "true" *) wire M01_AXI_nsu_MAXI4_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]M01_AXI_nsu_MAXI4_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]M01_AXI_nsu_MAXI4_AWCACHE;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_AWID;
  (* HARD_CONN = "true" *) wire [7:0]M01_AXI_nsu_MAXI4_AWLEN;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]M01_AXI_nsu_MAXI4_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]M01_AXI_nsu_MAXI4_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_AWREADY;
  (* HARD_CONN = "true" *) wire [3:0]M01_AXI_nsu_MAXI4_AWREGION;
  (* HARD_CONN = "true" *) wire [2:0]M01_AXI_nsu_MAXI4_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]M01_AXI_nsu_MAXI4_AWUSER;
  (* HARD_CONN = "true" *) wire M01_AXI_nsu_MAXI4_AWVALID;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_BID;
  (* HARD_CONN = "true" *) wire M01_AXI_nsu_MAXI4_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]M01_AXI_nsu_MAXI4_RDATA;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_RID;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_RLAST;
  (* HARD_CONN = "true" *) wire M01_AXI_nsu_MAXI4_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]M01_AXI_nsu_MAXI4_RRESP;
  (* HARD_CONN = "true" *) wire [16:0]M01_AXI_nsu_MAXI4_RUSER;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]M01_AXI_nsu_MAXI4_WDATA;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]M01_AXI_nsu_MAXI4_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]M01_AXI_nsu_MAXI4_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]M01_AXI_nsu_MAXI4_WUSER;
  (* HARD_CONN = "true" *) wire M01_AXI_nsu_MAXI4_WVALID;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire M01_AXI_nsw_NSU;
  wire MC0_ddrc_CH0_DDR4_ACT_N;
  wire [16:0]MC0_ddrc_CH0_DDR4_ADR;
  wire [1:0]MC0_ddrc_CH0_DDR4_BA;
  wire [1:0]MC0_ddrc_CH0_DDR4_BG;
  wire [0:0]MC0_ddrc_CH0_DDR4_CKE;
  wire [0:0]MC0_ddrc_CH0_DDR4_CK_C;
  wire [0:0]MC0_ddrc_CH0_DDR4_CK_T;
  wire [0:0]MC0_ddrc_CH0_DDR4_CS_N;
  wire [7:0]MC0_ddrc_CH0_DDR4_DM_N;
  wire [63:0]MC0_ddrc_CH0_DDR4_DQ;
  wire [7:0]MC0_ddrc_CH0_DDR4_DQS_C;
  wire [7:0]MC0_ddrc_CH0_DDR4_DQS_T;
  wire [0:0]MC0_ddrc_CH0_DDR4_ODT;
  wire MC0_ddrc_CH0_DDR4_RESET_N;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire MC0_nsw_NSU;
  (* HARD_CONN = "true" *) wire [63:0]S00_AXI_1_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]S00_AXI_1_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]S00_AXI_1_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]S00_AXI_1_ARID;
  (* HARD_CONN = "true" *) wire [7:0]S00_AXI_1_ARLEN;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]S00_AXI_1_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]S00_AXI_1_ARQOS;
  (* HARD_CONN = "true" *) wire S00_AXI_1_ARREADY;
  (* HARD_CONN = "true" *) wire [3:0]S00_AXI_1_ARREGION;
  (* HARD_CONN = "true" *) wire [2:0]S00_AXI_1_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]S00_AXI_1_ARUSER;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]S00_AXI_1_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]S00_AXI_1_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]S00_AXI_1_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]S00_AXI_1_AWID;
  (* HARD_CONN = "true" *) wire [7:0]S00_AXI_1_AWLEN;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]S00_AXI_1_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]S00_AXI_1_AWQOS;
  (* HARD_CONN = "true" *) wire S00_AXI_1_AWREADY;
  (* HARD_CONN = "true" *) wire [3:0]S00_AXI_1_AWREGION;
  (* HARD_CONN = "true" *) wire [2:0]S00_AXI_1_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]S00_AXI_1_AWUSER;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]S00_AXI_1_BID;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]S00_AXI_1_BRESP;
  (* HARD_CONN = "true" *) wire S00_AXI_1_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]S00_AXI_1_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]S00_AXI_1_RID;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_RLAST;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]S00_AXI_1_RRESP;
  (* HARD_CONN = "true" *) wire [16:0]S00_AXI_1_RUSER;
  (* HARD_CONN = "true" *) wire S00_AXI_1_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]S00_AXI_1_WDATA;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_WLAST;
  (* HARD_CONN = "true" *) wire S00_AXI_1_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]S00_AXI_1_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]S00_AXI_1_WUSER;
  (* HARD_CONN = "true" *) wire [0:0]S00_AXI_1_WVALID;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nmu_NMU;
  (* HARD_CONN = "true" *) wire [63:0]S01_AXI_1_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]S01_AXI_1_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]S01_AXI_1_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]S01_AXI_1_ARID;
  (* HARD_CONN = "true" *) wire [7:0]S01_AXI_1_ARLEN;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]S01_AXI_1_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]S01_AXI_1_ARQOS;
  (* HARD_CONN = "true" *) wire S01_AXI_1_ARREADY;
  (* HARD_CONN = "true" *) wire [3:0]S01_AXI_1_ARREGION;
  (* HARD_CONN = "true" *) wire [2:0]S01_AXI_1_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]S01_AXI_1_ARUSER;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]S01_AXI_1_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]S01_AXI_1_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]S01_AXI_1_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]S01_AXI_1_AWID;
  (* HARD_CONN = "true" *) wire [7:0]S01_AXI_1_AWLEN;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]S01_AXI_1_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]S01_AXI_1_AWQOS;
  (* HARD_CONN = "true" *) wire S01_AXI_1_AWREADY;
  (* HARD_CONN = "true" *) wire [3:0]S01_AXI_1_AWREGION;
  (* HARD_CONN = "true" *) wire [2:0]S01_AXI_1_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]S01_AXI_1_AWUSER;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]S01_AXI_1_BID;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]S01_AXI_1_BRESP;
  (* HARD_CONN = "true" *) wire S01_AXI_1_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]S01_AXI_1_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]S01_AXI_1_RID;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_RLAST;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]S01_AXI_1_RRESP;
  (* HARD_CONN = "true" *) wire [16:0]S01_AXI_1_RUSER;
  (* HARD_CONN = "true" *) wire S01_AXI_1_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]S01_AXI_1_WDATA;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_WLAST;
  (* HARD_CONN = "true" *) wire S01_AXI_1_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]S01_AXI_1_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]S01_AXI_1_WUSER;
  (* HARD_CONN = "true" *) wire [0:0]S01_AXI_1_WVALID;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nmu_NMU;
  (* HARD_CONN = "true" *) wire aclk0_1;
  (* HARD_CONN = "true" *) wire aclk1_1;
  wire aclk2_1;
  (* HARD_CONN = "true" *) wire aclk3_1;
  wire [0:0]const_0_dout;
  wire [0:0]sys_clk0_1_CLK_N;
  wire [0:0]sys_clk0_1_CLK_P;

  assign CH0_DDR4_0_act_n[0] = MC0_ddrc_CH0_DDR4_ACT_N;
  assign CH0_DDR4_0_adr[16:0] = MC0_ddrc_CH0_DDR4_ADR;
  assign CH0_DDR4_0_ba[1:0] = MC0_ddrc_CH0_DDR4_BA;
  assign CH0_DDR4_0_bg[1:0] = MC0_ddrc_CH0_DDR4_BG;
  assign CH0_DDR4_0_ck_c[0] = MC0_ddrc_CH0_DDR4_CK_C;
  assign CH0_DDR4_0_ck_t[0] = MC0_ddrc_CH0_DDR4_CK_T;
  assign CH0_DDR4_0_cke[0] = MC0_ddrc_CH0_DDR4_CKE;
  assign CH0_DDR4_0_cs_n[0] = MC0_ddrc_CH0_DDR4_CS_N;
  assign CH0_DDR4_0_odt[0] = MC0_ddrc_CH0_DDR4_ODT;
  assign CH0_DDR4_0_reset_n[0] = MC0_ddrc_CH0_DDR4_RESET_N;
  assign M00_AXI_araddr[63:0] = M00_AXI_nsu_MAXI4_ARADDR;
  assign M00_AXI_arburst[1:0] = M00_AXI_nsu_MAXI4_ARBURST;
  assign M00_AXI_arcache[3:0] = M00_AXI_nsu_MAXI4_ARCACHE;
  assign M00_AXI_arid[1:0] = M00_AXI_nsu_MAXI4_ARID;
  assign M00_AXI_arlen[7:0] = M00_AXI_nsu_MAXI4_ARLEN;
  assign M00_AXI_arlock[0] = M00_AXI_nsu_MAXI4_ARLOCK;
  assign M00_AXI_arprot[2:0] = M00_AXI_nsu_MAXI4_ARPROT;
  assign M00_AXI_arqos[3:0] = M00_AXI_nsu_MAXI4_ARQOS;
  assign M00_AXI_arregion[3:0] = M00_AXI_nsu_MAXI4_ARREGION;
  assign M00_AXI_arsize[2:0] = M00_AXI_nsu_MAXI4_ARSIZE;
  assign M00_AXI_aruser[17:0] = M00_AXI_nsu_MAXI4_ARUSER;
  assign M00_AXI_arvalid[0] = M00_AXI_nsu_MAXI4_ARVALID;
  assign M00_AXI_awaddr[63:0] = M00_AXI_nsu_MAXI4_AWADDR;
  assign M00_AXI_awburst[1:0] = M00_AXI_nsu_MAXI4_AWBURST;
  assign M00_AXI_awcache[3:0] = M00_AXI_nsu_MAXI4_AWCACHE;
  assign M00_AXI_awid[1:0] = M00_AXI_nsu_MAXI4_AWID;
  assign M00_AXI_awlen[7:0] = M00_AXI_nsu_MAXI4_AWLEN;
  assign M00_AXI_awlock[0] = M00_AXI_nsu_MAXI4_AWLOCK;
  assign M00_AXI_awprot[2:0] = M00_AXI_nsu_MAXI4_AWPROT;
  assign M00_AXI_awqos[3:0] = M00_AXI_nsu_MAXI4_AWQOS;
  assign M00_AXI_awregion[3:0] = M00_AXI_nsu_MAXI4_AWREGION;
  assign M00_AXI_awsize[2:0] = M00_AXI_nsu_MAXI4_AWSIZE;
  assign M00_AXI_awuser[17:0] = M00_AXI_nsu_MAXI4_AWUSER;
  assign M00_AXI_awvalid[0] = M00_AXI_nsu_MAXI4_AWVALID;
  assign M00_AXI_bready[0] = M00_AXI_nsu_MAXI4_BREADY;
  assign M00_AXI_nsu_MAXI4_ARREADY = M00_AXI_arready[0];
  assign M00_AXI_nsu_MAXI4_AWREADY = M00_AXI_awready[0];
  assign M00_AXI_nsu_MAXI4_BID = M00_AXI_bid[1:0];
  assign M00_AXI_nsu_MAXI4_BRESP = M00_AXI_bresp[1:0];
  assign M00_AXI_nsu_MAXI4_BVALID = M00_AXI_bvalid[0];
  assign M00_AXI_nsu_MAXI4_RDATA = M00_AXI_rdata[31:0];
  assign M00_AXI_nsu_MAXI4_RID = M00_AXI_rid[1:0];
  assign M00_AXI_nsu_MAXI4_RLAST = M00_AXI_rlast[0];
  assign M00_AXI_nsu_MAXI4_RRESP = M00_AXI_rresp[1:0];
  assign M00_AXI_nsu_MAXI4_RVALID = M00_AXI_rvalid[0];
  assign M00_AXI_nsu_MAXI4_WREADY = M00_AXI_wready[0];
  assign M00_AXI_rready[0] = M00_AXI_nsu_MAXI4_RREADY;
  assign M00_AXI_wdata[31:0] = M00_AXI_nsu_MAXI4_WDATA;
  assign M00_AXI_wlast[0] = M00_AXI_nsu_MAXI4_WLAST;
  assign M00_AXI_wstrb[3:0] = M00_AXI_nsu_MAXI4_WSTRB;
  assign M00_AXI_wvalid[0] = M00_AXI_nsu_MAXI4_WVALID;
  assign M01_AXI_araddr[63:0] = M01_AXI_nsu_MAXI4_ARADDR;
  assign M01_AXI_arburst[1:0] = M01_AXI_nsu_MAXI4_ARBURST;
  assign M01_AXI_arcache[3:0] = M01_AXI_nsu_MAXI4_ARCACHE;
  assign M01_AXI_arid[1:0] = M01_AXI_nsu_MAXI4_ARID;
  assign M01_AXI_arlen[7:0] = M01_AXI_nsu_MAXI4_ARLEN;
  assign M01_AXI_arlock[0] = M01_AXI_nsu_MAXI4_ARLOCK;
  assign M01_AXI_arprot[2:0] = M01_AXI_nsu_MAXI4_ARPROT;
  assign M01_AXI_arqos[3:0] = M01_AXI_nsu_MAXI4_ARQOS;
  assign M01_AXI_arregion[3:0] = M01_AXI_nsu_MAXI4_ARREGION;
  assign M01_AXI_arsize[2:0] = M01_AXI_nsu_MAXI4_ARSIZE;
  assign M01_AXI_aruser[17:0] = M01_AXI_nsu_MAXI4_ARUSER;
  assign M01_AXI_arvalid[0] = M01_AXI_nsu_MAXI4_ARVALID;
  assign M01_AXI_awaddr[63:0] = M01_AXI_nsu_MAXI4_AWADDR;
  assign M01_AXI_awburst[1:0] = M01_AXI_nsu_MAXI4_AWBURST;
  assign M01_AXI_awcache[3:0] = M01_AXI_nsu_MAXI4_AWCACHE;
  assign M01_AXI_awid[1:0] = M01_AXI_nsu_MAXI4_AWID;
  assign M01_AXI_awlen[7:0] = M01_AXI_nsu_MAXI4_AWLEN;
  assign M01_AXI_awlock[0] = M01_AXI_nsu_MAXI4_AWLOCK;
  assign M01_AXI_awprot[2:0] = M01_AXI_nsu_MAXI4_AWPROT;
  assign M01_AXI_awqos[3:0] = M01_AXI_nsu_MAXI4_AWQOS;
  assign M01_AXI_awregion[3:0] = M01_AXI_nsu_MAXI4_AWREGION;
  assign M01_AXI_awsize[2:0] = M01_AXI_nsu_MAXI4_AWSIZE;
  assign M01_AXI_awuser[17:0] = M01_AXI_nsu_MAXI4_AWUSER;
  assign M01_AXI_awvalid[0] = M01_AXI_nsu_MAXI4_AWVALID;
  assign M01_AXI_bready[0] = M01_AXI_nsu_MAXI4_BREADY;
  assign M01_AXI_nsu_MAXI4_ARREADY = M01_AXI_arready[0];
  assign M01_AXI_nsu_MAXI4_AWREADY = M01_AXI_awready[0];
  assign M01_AXI_nsu_MAXI4_BID = M01_AXI_bid[1:0];
  assign M01_AXI_nsu_MAXI4_BRESP = M01_AXI_bresp[1:0];
  assign M01_AXI_nsu_MAXI4_BVALID = M01_AXI_bvalid[0];
  assign M01_AXI_nsu_MAXI4_RDATA = M01_AXI_rdata[127:0];
  assign M01_AXI_nsu_MAXI4_RID = M01_AXI_rid[1:0];
  assign M01_AXI_nsu_MAXI4_RLAST = M01_AXI_rlast[0];
  assign M01_AXI_nsu_MAXI4_RRESP = M01_AXI_rresp[1:0];
  assign M01_AXI_nsu_MAXI4_RUSER = M01_AXI_ruser[16:0];
  assign M01_AXI_nsu_MAXI4_RVALID = M01_AXI_rvalid[0];
  assign M01_AXI_nsu_MAXI4_WREADY = M01_AXI_wready[0];
  assign M01_AXI_rready[0] = M01_AXI_nsu_MAXI4_RREADY;
  assign M01_AXI_wdata[127:0] = M01_AXI_nsu_MAXI4_WDATA;
  assign M01_AXI_wlast[0] = M01_AXI_nsu_MAXI4_WLAST;
  assign M01_AXI_wstrb[15:0] = M01_AXI_nsu_MAXI4_WSTRB;
  assign M01_AXI_wuser[16:0] = M01_AXI_nsu_MAXI4_WUSER;
  assign M01_AXI_wvalid[0] = M01_AXI_nsu_MAXI4_WVALID;
  assign S00_AXI_1_ARADDR = S00_AXI_araddr[63:0];
  assign S00_AXI_1_ARBURST = S00_AXI_arburst[1:0];
  assign S00_AXI_1_ARCACHE = S00_AXI_arcache[3:0];
  assign S00_AXI_1_ARID = S00_AXI_arid[15:0];
  assign S00_AXI_1_ARLEN = S00_AXI_arlen[7:0];
  assign S00_AXI_1_ARLOCK = S00_AXI_arlock[0];
  assign S00_AXI_1_ARPROT = S00_AXI_arprot[2:0];
  assign S00_AXI_1_ARQOS = S00_AXI_arqos[3:0];
  assign S00_AXI_1_ARREGION = S00_AXI_arregion[3:0];
  assign S00_AXI_1_ARSIZE = S00_AXI_arsize[2:0];
  assign S00_AXI_1_ARUSER = S00_AXI_aruser[17:0];
  assign S00_AXI_1_ARVALID = S00_AXI_arvalid[0];
  assign S00_AXI_1_AWADDR = S00_AXI_awaddr[63:0];
  assign S00_AXI_1_AWBURST = S00_AXI_awburst[1:0];
  assign S00_AXI_1_AWCACHE = S00_AXI_awcache[3:0];
  assign S00_AXI_1_AWID = S00_AXI_awid[15:0];
  assign S00_AXI_1_AWLEN = S00_AXI_awlen[7:0];
  assign S00_AXI_1_AWLOCK = S00_AXI_awlock[0];
  assign S00_AXI_1_AWPROT = S00_AXI_awprot[2:0];
  assign S00_AXI_1_AWQOS = S00_AXI_awqos[3:0];
  assign S00_AXI_1_AWREGION = S00_AXI_awregion[3:0];
  assign S00_AXI_1_AWSIZE = S00_AXI_awsize[2:0];
  assign S00_AXI_1_AWUSER = S00_AXI_awuser[17:0];
  assign S00_AXI_1_AWVALID = S00_AXI_awvalid[0];
  assign S00_AXI_1_BREADY = S00_AXI_bready[0];
  assign S00_AXI_1_RREADY = S00_AXI_rready[0];
  assign S00_AXI_1_WDATA = S00_AXI_wdata[127:0];
  assign S00_AXI_1_WLAST = S00_AXI_wlast[0];
  assign S00_AXI_1_WSTRB = S00_AXI_wstrb[15:0];
  assign S00_AXI_1_WUSER = S00_AXI_wuser[16:0];
  assign S00_AXI_1_WVALID = S00_AXI_wvalid[0];
  assign S00_AXI_arready[0] = S00_AXI_1_ARREADY;
  assign S00_AXI_awready[0] = S00_AXI_1_AWREADY;
  assign S00_AXI_bid[15:0] = S00_AXI_1_BID;
  assign S00_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign S00_AXI_bvalid[0] = S00_AXI_1_BVALID;
  assign S00_AXI_rdata[127:0] = S00_AXI_1_RDATA;
  assign S00_AXI_rid[15:0] = S00_AXI_1_RID;
  assign S00_AXI_rlast[0] = S00_AXI_1_RLAST;
  assign S00_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign S00_AXI_ruser[16:0] = S00_AXI_1_RUSER;
  assign S00_AXI_rvalid[0] = S00_AXI_1_RVALID;
  assign S00_AXI_wready[0] = S00_AXI_1_WREADY;
  assign S01_AXI_1_ARADDR = S01_AXI_araddr[63:0];
  assign S01_AXI_1_ARBURST = S01_AXI_arburst[1:0];
  assign S01_AXI_1_ARCACHE = S01_AXI_arcache[3:0];
  assign S01_AXI_1_ARID = S01_AXI_arid[15:0];
  assign S01_AXI_1_ARLEN = S01_AXI_arlen[7:0];
  assign S01_AXI_1_ARLOCK = S01_AXI_arlock[0];
  assign S01_AXI_1_ARPROT = S01_AXI_arprot[2:0];
  assign S01_AXI_1_ARQOS = S01_AXI_arqos[3:0];
  assign S01_AXI_1_ARREGION = S01_AXI_arregion[3:0];
  assign S01_AXI_1_ARSIZE = S01_AXI_arsize[2:0];
  assign S01_AXI_1_ARUSER = S01_AXI_aruser[17:0];
  assign S01_AXI_1_ARVALID = S01_AXI_arvalid[0];
  assign S01_AXI_1_AWADDR = S01_AXI_awaddr[63:0];
  assign S01_AXI_1_AWBURST = S01_AXI_awburst[1:0];
  assign S01_AXI_1_AWCACHE = S01_AXI_awcache[3:0];
  assign S01_AXI_1_AWID = S01_AXI_awid[15:0];
  assign S01_AXI_1_AWLEN = S01_AXI_awlen[7:0];
  assign S01_AXI_1_AWLOCK = S01_AXI_awlock[0];
  assign S01_AXI_1_AWPROT = S01_AXI_awprot[2:0];
  assign S01_AXI_1_AWQOS = S01_AXI_awqos[3:0];
  assign S01_AXI_1_AWREGION = S01_AXI_awregion[3:0];
  assign S01_AXI_1_AWSIZE = S01_AXI_awsize[2:0];
  assign S01_AXI_1_AWUSER = S01_AXI_awuser[17:0];
  assign S01_AXI_1_AWVALID = S01_AXI_awvalid[0];
  assign S01_AXI_1_BREADY = S01_AXI_bready[0];
  assign S01_AXI_1_RREADY = S01_AXI_rready[0];
  assign S01_AXI_1_WDATA = S01_AXI_wdata[127:0];
  assign S01_AXI_1_WLAST = S01_AXI_wlast[0];
  assign S01_AXI_1_WSTRB = S01_AXI_wstrb[15:0];
  assign S01_AXI_1_WUSER = S01_AXI_wuser[16:0];
  assign S01_AXI_1_WVALID = S01_AXI_wvalid[0];
  assign S01_AXI_arready[0] = S01_AXI_1_ARREADY;
  assign S01_AXI_awready[0] = S01_AXI_1_AWREADY;
  assign S01_AXI_bid[15:0] = S01_AXI_1_BID;
  assign S01_AXI_bresp[1:0] = S01_AXI_1_BRESP;
  assign S01_AXI_bvalid[0] = S01_AXI_1_BVALID;
  assign S01_AXI_rdata[127:0] = S01_AXI_1_RDATA;
  assign S01_AXI_rid[15:0] = S01_AXI_1_RID;
  assign S01_AXI_rlast[0] = S01_AXI_1_RLAST;
  assign S01_AXI_rresp[1:0] = S01_AXI_1_RRESP;
  assign S01_AXI_ruser[16:0] = S01_AXI_1_RUSER;
  assign S01_AXI_rvalid[0] = S01_AXI_1_RVALID;
  assign S01_AXI_wready[0] = S01_AXI_1_WREADY;
  assign aclk0_1 = aclk0;
  assign aclk1_1 = aclk1;
  assign aclk2_1 = aclk2;
  assign aclk3_1 = aclk3;
  assign sys_clk0_1_CLK_N = sys_clk0_clk_n[0];
  assign sys_clk0_1_CLK_P = sys_clk0_clk_p[0];
  (* DONT_TOUCH *) 
  bd_f29c_M00_AXI_nsu_0 M00_AXI_nsu
       (.IF_NOC_AXI_ARADDR(M00_AXI_nsu_MAXI4_ARADDR),
        .IF_NOC_AXI_ARBURST(M00_AXI_nsu_MAXI4_ARBURST),
        .IF_NOC_AXI_ARCACHE(M00_AXI_nsu_MAXI4_ARCACHE),
        .IF_NOC_AXI_ARCID(M00_AXI_nsu_MAXI4_ARID),
        .IF_NOC_AXI_ARLEN(M00_AXI_nsu_MAXI4_ARLEN),
        .IF_NOC_AXI_ARLOCK(M00_AXI_nsu_MAXI4_ARLOCK),
        .IF_NOC_AXI_ARPROT(M00_AXI_nsu_MAXI4_ARPROT),
        .IF_NOC_AXI_ARQOS(M00_AXI_nsu_MAXI4_ARQOS),
        .IF_NOC_AXI_ARREADY(M00_AXI_nsu_MAXI4_ARREADY),
        .IF_NOC_AXI_ARREGION(M00_AXI_nsu_MAXI4_ARREGION),
        .IF_NOC_AXI_ARSIZE(M00_AXI_nsu_MAXI4_ARSIZE),
        .IF_NOC_AXI_ARUSER(M00_AXI_nsu_MAXI4_ARUSER),
        .IF_NOC_AXI_ARVALID(M00_AXI_nsu_MAXI4_ARVALID),
        .IF_NOC_AXI_AWADDR(M00_AXI_nsu_MAXI4_AWADDR),
        .IF_NOC_AXI_AWBURST(M00_AXI_nsu_MAXI4_AWBURST),
        .IF_NOC_AXI_AWCACHE(M00_AXI_nsu_MAXI4_AWCACHE),
        .IF_NOC_AXI_AWCID(M00_AXI_nsu_MAXI4_AWID),
        .IF_NOC_AXI_AWLEN(M00_AXI_nsu_MAXI4_AWLEN),
        .IF_NOC_AXI_AWLOCK(M00_AXI_nsu_MAXI4_AWLOCK),
        .IF_NOC_AXI_AWPROT(M00_AXI_nsu_MAXI4_AWPROT),
        .IF_NOC_AXI_AWQOS(M00_AXI_nsu_MAXI4_AWQOS),
        .IF_NOC_AXI_AWREADY(M00_AXI_nsu_MAXI4_AWREADY),
        .IF_NOC_AXI_AWREGION(M00_AXI_nsu_MAXI4_AWREGION),
        .IF_NOC_AXI_AWSIZE(M00_AXI_nsu_MAXI4_AWSIZE),
        .IF_NOC_AXI_AWUSER(M00_AXI_nsu_MAXI4_AWUSER),
        .IF_NOC_AXI_AWVALID(M00_AXI_nsu_MAXI4_AWVALID),
        .IF_NOC_AXI_BCID(M00_AXI_nsu_MAXI4_BID),
        .IF_NOC_AXI_BREADY(M00_AXI_nsu_MAXI4_BREADY),
        .IF_NOC_AXI_BRESP(M00_AXI_nsu_MAXI4_BRESP),
        .IF_NOC_AXI_BVALID(M00_AXI_nsu_MAXI4_BVALID),
        .IF_NOC_AXI_RCID(M00_AXI_nsu_MAXI4_RID),
        .IF_NOC_AXI_RDATA(M00_AXI_nsu_MAXI4_RDATA),
        .IF_NOC_AXI_RLAST(M00_AXI_nsu_MAXI4_RLAST),
        .IF_NOC_AXI_RREADY(M00_AXI_nsu_MAXI4_RREADY),
        .IF_NOC_AXI_RRESP(M00_AXI_nsu_MAXI4_RRESP),
        .IF_NOC_AXI_RVALID(M00_AXI_nsu_MAXI4_RVALID),
        .IF_NOC_AXI_WDATA(M00_AXI_nsu_MAXI4_WDATA),
        .IF_NOC_AXI_WLAST(M00_AXI_nsu_MAXI4_WLAST),
        .IF_NOC_AXI_WREADY(M00_AXI_nsu_MAXI4_WREADY),
        .IF_NOC_AXI_WSTRB(M00_AXI_nsu_MAXI4_WSTRB),
        .IF_NOC_AXI_WVALID(M00_AXI_nsu_MAXI4_WVALID),
        .NSU(M00_AXI_nsw_NSU),
        .aclk(aclk2_1));
  (* DONT_TOUCH *) 
  bd_f29c_M01_AXI_nsu_0 M01_AXI_nsu
       (.IF_NOC_AXI_ARADDR(M01_AXI_nsu_MAXI4_ARADDR),
        .IF_NOC_AXI_ARBURST(M01_AXI_nsu_MAXI4_ARBURST),
        .IF_NOC_AXI_ARCACHE(M01_AXI_nsu_MAXI4_ARCACHE),
        .IF_NOC_AXI_ARCID(M01_AXI_nsu_MAXI4_ARID),
        .IF_NOC_AXI_ARLEN(M01_AXI_nsu_MAXI4_ARLEN),
        .IF_NOC_AXI_ARLOCK(M01_AXI_nsu_MAXI4_ARLOCK),
        .IF_NOC_AXI_ARPROT(M01_AXI_nsu_MAXI4_ARPROT),
        .IF_NOC_AXI_ARQOS(M01_AXI_nsu_MAXI4_ARQOS),
        .IF_NOC_AXI_ARREADY(M01_AXI_nsu_MAXI4_ARREADY),
        .IF_NOC_AXI_ARREGION(M01_AXI_nsu_MAXI4_ARREGION),
        .IF_NOC_AXI_ARSIZE(M01_AXI_nsu_MAXI4_ARSIZE),
        .IF_NOC_AXI_ARUSER(M01_AXI_nsu_MAXI4_ARUSER),
        .IF_NOC_AXI_ARVALID(M01_AXI_nsu_MAXI4_ARVALID),
        .IF_NOC_AXI_AWADDR(M01_AXI_nsu_MAXI4_AWADDR),
        .IF_NOC_AXI_AWBURST(M01_AXI_nsu_MAXI4_AWBURST),
        .IF_NOC_AXI_AWCACHE(M01_AXI_nsu_MAXI4_AWCACHE),
        .IF_NOC_AXI_AWCID(M01_AXI_nsu_MAXI4_AWID),
        .IF_NOC_AXI_AWLEN(M01_AXI_nsu_MAXI4_AWLEN),
        .IF_NOC_AXI_AWLOCK(M01_AXI_nsu_MAXI4_AWLOCK),
        .IF_NOC_AXI_AWPROT(M01_AXI_nsu_MAXI4_AWPROT),
        .IF_NOC_AXI_AWQOS(M01_AXI_nsu_MAXI4_AWQOS),
        .IF_NOC_AXI_AWREADY(M01_AXI_nsu_MAXI4_AWREADY),
        .IF_NOC_AXI_AWREGION(M01_AXI_nsu_MAXI4_AWREGION),
        .IF_NOC_AXI_AWSIZE(M01_AXI_nsu_MAXI4_AWSIZE),
        .IF_NOC_AXI_AWUSER(M01_AXI_nsu_MAXI4_AWUSER),
        .IF_NOC_AXI_AWVALID(M01_AXI_nsu_MAXI4_AWVALID),
        .IF_NOC_AXI_BCID(M01_AXI_nsu_MAXI4_BID),
        .IF_NOC_AXI_BREADY(M01_AXI_nsu_MAXI4_BREADY),
        .IF_NOC_AXI_BRESP(M01_AXI_nsu_MAXI4_BRESP),
        .IF_NOC_AXI_BVALID(M01_AXI_nsu_MAXI4_BVALID),
        .IF_NOC_AXI_RCID(M01_AXI_nsu_MAXI4_RID),
        .IF_NOC_AXI_RDATA(M01_AXI_nsu_MAXI4_RDATA),
        .IF_NOC_AXI_RLAST(M01_AXI_nsu_MAXI4_RLAST),
        .IF_NOC_AXI_RREADY(M01_AXI_nsu_MAXI4_RREADY),
        .IF_NOC_AXI_RRESP(M01_AXI_nsu_MAXI4_RRESP),
        .IF_NOC_AXI_RUSER(M01_AXI_nsu_MAXI4_RUSER),
        .IF_NOC_AXI_RVALID(M01_AXI_nsu_MAXI4_RVALID),
        .IF_NOC_AXI_WDATA(M01_AXI_nsu_MAXI4_WDATA),
        .IF_NOC_AXI_WLAST(M01_AXI_nsu_MAXI4_WLAST),
        .IF_NOC_AXI_WREADY(M01_AXI_nsu_MAXI4_WREADY),
        .IF_NOC_AXI_WSTRB(M01_AXI_nsu_MAXI4_WSTRB),
        .IF_NOC_AXI_WUSER(M01_AXI_nsu_MAXI4_WUSER),
        .IF_NOC_AXI_WVALID(M01_AXI_nsu_MAXI4_WVALID),
        .NSU(M01_AXI_nsw_NSU),
        .aclk(aclk3_1));
  (* DONT_TOUCH *) 
  bd_f29c_MC0_ddrc_0 MC0_ddrc
       (.ch0_ddr4_act_n(MC0_ddrc_CH0_DDR4_ACT_N),
        .ch0_ddr4_adr(MC0_ddrc_CH0_DDR4_ADR),
        .ch0_ddr4_ba(MC0_ddrc_CH0_DDR4_BA),
        .ch0_ddr4_bg(MC0_ddrc_CH0_DDR4_BG),
        .ch0_ddr4_ck_c(MC0_ddrc_CH0_DDR4_CK_C),
        .ch0_ddr4_ck_t(MC0_ddrc_CH0_DDR4_CK_T),
        .ch0_ddr4_cke(MC0_ddrc_CH0_DDR4_CKE),
        .ch0_ddr4_cs_n(MC0_ddrc_CH0_DDR4_CS_N),
        .ch0_ddr4_dm_dbi_n(CH0_DDR4_0_dm_n[7:0]),
        .ch0_ddr4_dq(CH0_DDR4_0_dq[63:0]),
        .ch0_ddr4_dqs_c(CH0_DDR4_0_dqs_c[7:0]),
        .ch0_ddr4_dqs_t(CH0_DDR4_0_dqs_t[7:0]),
        .ch0_ddr4_odt(MC0_ddrc_CH0_DDR4_ODT),
        .ch0_ddr4_reset_n(MC0_ddrc_CH0_DDR4_RESET_N),
        .from_noc_0(MC0_nsw_NSU),
        .from_noc_1(1'b0),
        .from_noc_2(1'b0),
        .from_noc_3(1'b0),
        .sys_clk_n(sys_clk0_1_CLK_N),
        .sys_clk_p(sys_clk0_1_CLK_P));
  (* DONT_TOUCH *) 
  bd_f29c_S00_AXI_nmu_0 S00_AXI_nmu
       (.AXI_IN(1'b0),
        .IF_NOC_AXI_ARADDR(S00_AXI_1_ARADDR),
        .IF_NOC_AXI_ARBURST(S00_AXI_1_ARBURST),
        .IF_NOC_AXI_ARCACHE(S00_AXI_1_ARCACHE),
        .IF_NOC_AXI_ARID(S00_AXI_1_ARID),
        .IF_NOC_AXI_ARLEN(S00_AXI_1_ARLEN),
        .IF_NOC_AXI_ARLOCK(S00_AXI_1_ARLOCK),
        .IF_NOC_AXI_ARPROT(S00_AXI_1_ARPROT),
        .IF_NOC_AXI_ARQOS(S00_AXI_1_ARQOS),
        .IF_NOC_AXI_ARREADY(S00_AXI_1_ARREADY),
        .IF_NOC_AXI_ARREGION(S00_AXI_1_ARREGION),
        .IF_NOC_AXI_ARSIZE(S00_AXI_1_ARSIZE),
        .IF_NOC_AXI_ARUSER(S00_AXI_1_ARUSER),
        .IF_NOC_AXI_ARVALID(S00_AXI_1_ARVALID),
        .IF_NOC_AXI_AWADDR(S00_AXI_1_AWADDR),
        .IF_NOC_AXI_AWBURST(S00_AXI_1_AWBURST),
        .IF_NOC_AXI_AWCACHE(S00_AXI_1_AWCACHE),
        .IF_NOC_AXI_AWID(S00_AXI_1_AWID),
        .IF_NOC_AXI_AWLEN(S00_AXI_1_AWLEN),
        .IF_NOC_AXI_AWLOCK(S00_AXI_1_AWLOCK),
        .IF_NOC_AXI_AWPROT(S00_AXI_1_AWPROT),
        .IF_NOC_AXI_AWQOS(S00_AXI_1_AWQOS),
        .IF_NOC_AXI_AWREADY(S00_AXI_1_AWREADY),
        .IF_NOC_AXI_AWREGION(S00_AXI_1_AWREGION),
        .IF_NOC_AXI_AWSIZE(S00_AXI_1_AWSIZE),
        .IF_NOC_AXI_AWUSER(S00_AXI_1_AWUSER),
        .IF_NOC_AXI_AWVALID(S00_AXI_1_AWVALID),
        .IF_NOC_AXI_BID(S00_AXI_1_BID),
        .IF_NOC_AXI_BREADY(S00_AXI_1_BREADY),
        .IF_NOC_AXI_BRESP(S00_AXI_1_BRESP),
        .IF_NOC_AXI_BVALID(S00_AXI_1_BVALID),
        .IF_NOC_AXI_RDATA(S00_AXI_1_RDATA),
        .IF_NOC_AXI_RID(S00_AXI_1_RID),
        .IF_NOC_AXI_RLAST(S00_AXI_1_RLAST),
        .IF_NOC_AXI_RREADY(S00_AXI_1_RREADY),
        .IF_NOC_AXI_RRESP(S00_AXI_1_RRESP),
        .IF_NOC_AXI_RUSER(S00_AXI_1_RUSER),
        .IF_NOC_AXI_RVALID(S00_AXI_1_RVALID),
        .IF_NOC_AXI_WDATA(S00_AXI_1_WDATA),
        .IF_NOC_AXI_WLAST(S00_AXI_1_WLAST),
        .IF_NOC_AXI_WREADY(S00_AXI_1_WREADY),
        .IF_NOC_AXI_WSTRB(S00_AXI_1_WSTRB),
        .IF_NOC_AXI_WUSER(S00_AXI_1_WUSER),
        .IF_NOC_AXI_WVALID(S00_AXI_1_WVALID),
        .NMU(S00_AXI_nmu_NMU),
        .NMU_RD_DEST_MODE(const_0_dout),
        .NMU_RD_USR_DST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .NMU_WR_DEST_MODE(const_0_dout),
        .NMU_WR_USR_DST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .aclk(aclk0_1));
  (* DONT_TOUCH *) 
  bd_f29c_S01_AXI_nmu_0 S01_AXI_nmu
       (.AXI_IN(1'b0),
        .IF_NOC_AXI_ARADDR(S01_AXI_1_ARADDR),
        .IF_NOC_AXI_ARBURST(S01_AXI_1_ARBURST),
        .IF_NOC_AXI_ARCACHE(S01_AXI_1_ARCACHE),
        .IF_NOC_AXI_ARID(S01_AXI_1_ARID),
        .IF_NOC_AXI_ARLEN(S01_AXI_1_ARLEN),
        .IF_NOC_AXI_ARLOCK(S01_AXI_1_ARLOCK),
        .IF_NOC_AXI_ARPROT(S01_AXI_1_ARPROT),
        .IF_NOC_AXI_ARQOS(S01_AXI_1_ARQOS),
        .IF_NOC_AXI_ARREADY(S01_AXI_1_ARREADY),
        .IF_NOC_AXI_ARREGION(S01_AXI_1_ARREGION),
        .IF_NOC_AXI_ARSIZE(S01_AXI_1_ARSIZE),
        .IF_NOC_AXI_ARUSER(S01_AXI_1_ARUSER),
        .IF_NOC_AXI_ARVALID(S01_AXI_1_ARVALID),
        .IF_NOC_AXI_AWADDR(S01_AXI_1_AWADDR),
        .IF_NOC_AXI_AWBURST(S01_AXI_1_AWBURST),
        .IF_NOC_AXI_AWCACHE(S01_AXI_1_AWCACHE),
        .IF_NOC_AXI_AWID(S01_AXI_1_AWID),
        .IF_NOC_AXI_AWLEN(S01_AXI_1_AWLEN),
        .IF_NOC_AXI_AWLOCK(S01_AXI_1_AWLOCK),
        .IF_NOC_AXI_AWPROT(S01_AXI_1_AWPROT),
        .IF_NOC_AXI_AWQOS(S01_AXI_1_AWQOS),
        .IF_NOC_AXI_AWREADY(S01_AXI_1_AWREADY),
        .IF_NOC_AXI_AWREGION(S01_AXI_1_AWREGION),
        .IF_NOC_AXI_AWSIZE(S01_AXI_1_AWSIZE),
        .IF_NOC_AXI_AWUSER(S01_AXI_1_AWUSER),
        .IF_NOC_AXI_AWVALID(S01_AXI_1_AWVALID),
        .IF_NOC_AXI_BID(S01_AXI_1_BID),
        .IF_NOC_AXI_BREADY(S01_AXI_1_BREADY),
        .IF_NOC_AXI_BRESP(S01_AXI_1_BRESP),
        .IF_NOC_AXI_BVALID(S01_AXI_1_BVALID),
        .IF_NOC_AXI_RDATA(S01_AXI_1_RDATA),
        .IF_NOC_AXI_RID(S01_AXI_1_RID),
        .IF_NOC_AXI_RLAST(S01_AXI_1_RLAST),
        .IF_NOC_AXI_RREADY(S01_AXI_1_RREADY),
        .IF_NOC_AXI_RRESP(S01_AXI_1_RRESP),
        .IF_NOC_AXI_RUSER(S01_AXI_1_RUSER),
        .IF_NOC_AXI_RVALID(S01_AXI_1_RVALID),
        .IF_NOC_AXI_WDATA(S01_AXI_1_WDATA),
        .IF_NOC_AXI_WLAST(S01_AXI_1_WLAST),
        .IF_NOC_AXI_WREADY(S01_AXI_1_WREADY),
        .IF_NOC_AXI_WSTRB(S01_AXI_1_WSTRB),
        .IF_NOC_AXI_WUSER(S01_AXI_1_WUSER),
        .IF_NOC_AXI_WVALID(S01_AXI_1_WVALID),
        .NMU(S01_AXI_nmu_NMU),
        .NMU_RD_DEST_MODE(const_0_dout),
        .NMU_RD_USR_DST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .NMU_WR_DEST_MODE(const_0_dout),
        .NMU_WR_USR_DST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .aclk(aclk1_1));
  (* DONT_TOUCH *) 
  bd_f29c_const_0_0 const_0
       (.dout(const_0_dout));
  (* DONT_TOUCH *) 
  (* \NOC.IS_HIER_NSW  = "true" *) 
  (* \NOC.IS_NOC_CELL  = "true" *) 
  (* SYNTH_ONLY = "true" *) 
  hier_nsw_imp_17HOODE hier_nsw
       (.NMU(S01_AXI_nmu_NMU),
        .NMU1(S00_AXI_nmu_NMU),
        .NSU(MC0_nsw_NSU),
        .NSU1(M01_AXI_nsw_NSU),
        .NSU2(M00_AXI_nsw_NSU));
endmodule

module hier_nsw_imp_17HOODE
   (NMU,
    NMU1,
    NSU,
    NSU1,
    NSU2);
  input NMU;
  input NMU1;
  output NSU;
  output NSU1;
  output NSU2;

  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire M00_AXI_nsw_NSU;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire M01_AXI_nsw_NSU;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire MC0_nsw_NSU;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nmu_NMU;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M00_INCMM_RDRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M00_INCMM_RDRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M00_INCMM_WRRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M00_INCMM_WRRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M01_INCMM_RDRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M01_INCMM_RDRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M01_INCMM_WRRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M01_INCMM_WRRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M02_INCMM_RDRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M02_INCMM_RDRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M02_INCMM_WRRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S00_AXI_nsw_M02_INCMM_WRRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nmu_NMU;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M00_INCMM_RDRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M00_INCMM_RDRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M00_INCMM_WRRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M00_INCMM_WRRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M01_INCMM_RDRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M01_INCMM_RDRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M01_INCMM_WRRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M01_INCMM_WRRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M02_INCMM_RDRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M02_INCMM_RDRSPNS;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M02_INCMM_WRRQST;
  (* DONT_TOUCH *) (* \NOC.IS_NOC_NET  = "true" *) (* SYNTH_ONLY = "true" *) wire S01_AXI_nsw_M02_INCMM_WRRSPNS;

  assign NSU = MC0_nsw_NSU;
  assign NSU1 = M01_AXI_nsw_NSU;
  assign NSU2 = M00_AXI_nsw_NSU;
  assign S00_AXI_nmu_NMU = NMU1;
  assign S01_AXI_nmu_NMU = NMU;
  (* DONT_TOUCH *) 
  (* \NOC.IS_NOC_CELL  = "true" *) 
  (* SYNTH_ONLY = "true" *) 
  bd_f29c_M00_AXI_nsw_0 M00_AXI_nsw
       (.NSU(M00_AXI_nsw_NSU),
        .S00_INCMM_RDRQST(S01_AXI_nsw_M02_INCMM_RDRQST),
        .S00_INCMM_RDRSPNS(S01_AXI_nsw_M02_INCMM_RDRSPNS),
        .S00_INCMM_WRRQST(S01_AXI_nsw_M02_INCMM_WRRQST),
        .S00_INCMM_WRRSPNS(S01_AXI_nsw_M02_INCMM_WRRSPNS),
        .S01_INCMM_RDRQST(S00_AXI_nsw_M02_INCMM_RDRQST),
        .S01_INCMM_RDRSPNS(S00_AXI_nsw_M02_INCMM_RDRSPNS),
        .S01_INCMM_WRRQST(S00_AXI_nsw_M02_INCMM_WRRQST),
        .S01_INCMM_WRRSPNS(S00_AXI_nsw_M02_INCMM_WRRSPNS));
  (* DONT_TOUCH *) 
  (* \NOC.IS_NOC_CELL  = "true" *) 
  (* SYNTH_ONLY = "true" *) 
  bd_f29c_M01_AXI_nsw_0 M01_AXI_nsw
       (.NSU(M01_AXI_nsw_NSU),
        .S00_INCMM_RDRQST(S01_AXI_nsw_M01_INCMM_RDRQST),
        .S00_INCMM_RDRSPNS(S01_AXI_nsw_M01_INCMM_RDRSPNS),
        .S00_INCMM_WRRQST(S01_AXI_nsw_M01_INCMM_WRRQST),
        .S00_INCMM_WRRSPNS(S01_AXI_nsw_M01_INCMM_WRRSPNS),
        .S01_INCMM_RDRQST(S00_AXI_nsw_M01_INCMM_RDRQST),
        .S01_INCMM_RDRSPNS(S00_AXI_nsw_M01_INCMM_RDRSPNS),
        .S01_INCMM_WRRQST(S00_AXI_nsw_M01_INCMM_WRRQST),
        .S01_INCMM_WRRSPNS(S00_AXI_nsw_M01_INCMM_WRRSPNS));
  (* DONT_TOUCH *) 
  (* \NOC.IS_NOC_CELL  = "true" *) 
  (* SYNTH_ONLY = "true" *) 
  bd_f29c_MC0_nsw_0 MC0_nsw
       (.NSU(MC0_nsw_NSU),
        .S00_INCMM_RDRQST(S01_AXI_nsw_M00_INCMM_RDRQST),
        .S00_INCMM_RDRSPNS(S01_AXI_nsw_M00_INCMM_RDRSPNS),
        .S00_INCMM_WRRQST(S01_AXI_nsw_M00_INCMM_WRRQST),
        .S00_INCMM_WRRSPNS(S01_AXI_nsw_M00_INCMM_WRRSPNS),
        .S01_INCMM_RDRQST(S00_AXI_nsw_M00_INCMM_RDRQST),
        .S01_INCMM_RDRSPNS(S00_AXI_nsw_M00_INCMM_RDRSPNS),
        .S01_INCMM_WRRQST(S00_AXI_nsw_M00_INCMM_WRRQST),
        .S01_INCMM_WRRSPNS(S00_AXI_nsw_M00_INCMM_WRRSPNS));
  (* DONT_TOUCH *) 
  (* \NOC.IS_NOC_CELL  = "true" *) 
  (* SYNTH_ONLY = "true" *) 
  bd_f29c_S00_AXI_nsw_0 S00_AXI_nsw
       (.M00_INCMM_RDRQST(S00_AXI_nsw_M00_INCMM_RDRQST),
        .M00_INCMM_RDRSPNS(S00_AXI_nsw_M00_INCMM_RDRSPNS),
        .M00_INCMM_WRRQST(S00_AXI_nsw_M00_INCMM_WRRQST),
        .M00_INCMM_WRRSPNS(S00_AXI_nsw_M00_INCMM_WRRSPNS),
        .M01_INCMM_RDRQST(S00_AXI_nsw_M01_INCMM_RDRQST),
        .M01_INCMM_RDRSPNS(S00_AXI_nsw_M01_INCMM_RDRSPNS),
        .M01_INCMM_WRRQST(S00_AXI_nsw_M01_INCMM_WRRQST),
        .M01_INCMM_WRRSPNS(S00_AXI_nsw_M01_INCMM_WRRSPNS),
        .M02_INCMM_RDRQST(S00_AXI_nsw_M02_INCMM_RDRQST),
        .M02_INCMM_RDRSPNS(S00_AXI_nsw_M02_INCMM_RDRSPNS),
        .M02_INCMM_WRRQST(S00_AXI_nsw_M02_INCMM_WRRQST),
        .M02_INCMM_WRRSPNS(S00_AXI_nsw_M02_INCMM_WRRSPNS),
        .NMU(S00_AXI_nmu_NMU));
  (* DONT_TOUCH *) 
  (* \NOC.IS_NOC_CELL  = "true" *) 
  (* SYNTH_ONLY = "true" *) 
  bd_f29c_S01_AXI_nsw_0 S01_AXI_nsw
       (.M00_INCMM_RDRQST(S01_AXI_nsw_M00_INCMM_RDRQST),
        .M00_INCMM_RDRSPNS(S01_AXI_nsw_M00_INCMM_RDRSPNS),
        .M00_INCMM_WRRQST(S01_AXI_nsw_M00_INCMM_WRRQST),
        .M00_INCMM_WRRSPNS(S01_AXI_nsw_M00_INCMM_WRRSPNS),
        .M01_INCMM_RDRQST(S01_AXI_nsw_M01_INCMM_RDRQST),
        .M01_INCMM_RDRSPNS(S01_AXI_nsw_M01_INCMM_RDRSPNS),
        .M01_INCMM_WRRQST(S01_AXI_nsw_M01_INCMM_WRRQST),
        .M01_INCMM_WRRSPNS(S01_AXI_nsw_M01_INCMM_WRRSPNS),
        .M02_INCMM_RDRQST(S01_AXI_nsw_M02_INCMM_RDRQST),
        .M02_INCMM_RDRSPNS(S01_AXI_nsw_M02_INCMM_RDRSPNS),
        .M02_INCMM_WRRQST(S01_AXI_nsw_M02_INCMM_WRRQST),
        .M02_INCMM_WRRSPNS(S01_AXI_nsw_M02_INCMM_WRRSPNS),
        .NMU(S01_AXI_nmu_NMU));
endmodule
