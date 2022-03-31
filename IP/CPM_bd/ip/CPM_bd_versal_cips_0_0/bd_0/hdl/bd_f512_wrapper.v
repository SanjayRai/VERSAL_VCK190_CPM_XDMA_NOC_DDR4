//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_f512_wrapper.bd
//Design : bd_f512_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_f512_wrapper
   (CPM_PCIE_NOC_0_araddr,
    CPM_PCIE_NOC_0_arburst,
    CPM_PCIE_NOC_0_arcache,
    CPM_PCIE_NOC_0_arid,
    CPM_PCIE_NOC_0_arlen,
    CPM_PCIE_NOC_0_arlock,
    CPM_PCIE_NOC_0_arprot,
    CPM_PCIE_NOC_0_arqos,
    CPM_PCIE_NOC_0_arready,
    CPM_PCIE_NOC_0_arsize,
    CPM_PCIE_NOC_0_aruser,
    CPM_PCIE_NOC_0_arvalid,
    CPM_PCIE_NOC_0_awaddr,
    CPM_PCIE_NOC_0_awburst,
    CPM_PCIE_NOC_0_awcache,
    CPM_PCIE_NOC_0_awid,
    CPM_PCIE_NOC_0_awlen,
    CPM_PCIE_NOC_0_awlock,
    CPM_PCIE_NOC_0_awprot,
    CPM_PCIE_NOC_0_awqos,
    CPM_PCIE_NOC_0_awready,
    CPM_PCIE_NOC_0_awsize,
    CPM_PCIE_NOC_0_awuser,
    CPM_PCIE_NOC_0_awvalid,
    CPM_PCIE_NOC_0_bid,
    CPM_PCIE_NOC_0_bready,
    CPM_PCIE_NOC_0_bresp,
    CPM_PCIE_NOC_0_bvalid,
    CPM_PCIE_NOC_0_rdata,
    CPM_PCIE_NOC_0_rid,
    CPM_PCIE_NOC_0_rlast,
    CPM_PCIE_NOC_0_rready,
    CPM_PCIE_NOC_0_rresp,
    CPM_PCIE_NOC_0_rvalid,
    CPM_PCIE_NOC_0_wdata,
    CPM_PCIE_NOC_0_wlast,
    CPM_PCIE_NOC_0_wready,
    CPM_PCIE_NOC_0_wstrb,
    CPM_PCIE_NOC_0_wvalid,
    CPM_PCIE_NOC_1_araddr,
    CPM_PCIE_NOC_1_arburst,
    CPM_PCIE_NOC_1_arcache,
    CPM_PCIE_NOC_1_arid,
    CPM_PCIE_NOC_1_arlen,
    CPM_PCIE_NOC_1_arlock,
    CPM_PCIE_NOC_1_arprot,
    CPM_PCIE_NOC_1_arqos,
    CPM_PCIE_NOC_1_arready,
    CPM_PCIE_NOC_1_arsize,
    CPM_PCIE_NOC_1_aruser,
    CPM_PCIE_NOC_1_arvalid,
    CPM_PCIE_NOC_1_awaddr,
    CPM_PCIE_NOC_1_awburst,
    CPM_PCIE_NOC_1_awcache,
    CPM_PCIE_NOC_1_awid,
    CPM_PCIE_NOC_1_awlen,
    CPM_PCIE_NOC_1_awlock,
    CPM_PCIE_NOC_1_awprot,
    CPM_PCIE_NOC_1_awqos,
    CPM_PCIE_NOC_1_awready,
    CPM_PCIE_NOC_1_awsize,
    CPM_PCIE_NOC_1_awuser,
    CPM_PCIE_NOC_1_awvalid,
    CPM_PCIE_NOC_1_bid,
    CPM_PCIE_NOC_1_bready,
    CPM_PCIE_NOC_1_bresp,
    CPM_PCIE_NOC_1_bvalid,
    CPM_PCIE_NOC_1_rdata,
    CPM_PCIE_NOC_1_rid,
    CPM_PCIE_NOC_1_rlast,
    CPM_PCIE_NOC_1_rready,
    CPM_PCIE_NOC_1_rresp,
    CPM_PCIE_NOC_1_rvalid,
    CPM_PCIE_NOC_1_wdata,
    CPM_PCIE_NOC_1_wlast,
    CPM_PCIE_NOC_1_wready,
    CPM_PCIE_NOC_1_wstrb,
    CPM_PCIE_NOC_1_wvalid,
    NOC_CPM_PCIE_0_araddr,
    NOC_CPM_PCIE_0_arburst,
    NOC_CPM_PCIE_0_arcache,
    NOC_CPM_PCIE_0_arid,
    NOC_CPM_PCIE_0_arlen,
    NOC_CPM_PCIE_0_arlock,
    NOC_CPM_PCIE_0_arprot,
    NOC_CPM_PCIE_0_arqos,
    NOC_CPM_PCIE_0_arready,
    NOC_CPM_PCIE_0_arsize,
    NOC_CPM_PCIE_0_aruser,
    NOC_CPM_PCIE_0_arvalid,
    NOC_CPM_PCIE_0_awaddr,
    NOC_CPM_PCIE_0_awburst,
    NOC_CPM_PCIE_0_awcache,
    NOC_CPM_PCIE_0_awid,
    NOC_CPM_PCIE_0_awlen,
    NOC_CPM_PCIE_0_awlock,
    NOC_CPM_PCIE_0_awprot,
    NOC_CPM_PCIE_0_awqos,
    NOC_CPM_PCIE_0_awready,
    NOC_CPM_PCIE_0_awsize,
    NOC_CPM_PCIE_0_awuser,
    NOC_CPM_PCIE_0_awvalid,
    NOC_CPM_PCIE_0_bid,
    NOC_CPM_PCIE_0_bready,
    NOC_CPM_PCIE_0_bresp,
    NOC_CPM_PCIE_0_bvalid,
    NOC_CPM_PCIE_0_rdata,
    NOC_CPM_PCIE_0_rid,
    NOC_CPM_PCIE_0_rlast,
    NOC_CPM_PCIE_0_rready,
    NOC_CPM_PCIE_0_rresp,
    NOC_CPM_PCIE_0_rvalid,
    NOC_CPM_PCIE_0_wdata,
    NOC_CPM_PCIE_0_wlast,
    NOC_CPM_PCIE_0_wready,
    NOC_CPM_PCIE_0_wstrb,
    NOC_CPM_PCIE_0_wvalid,
    PCIE0_GT_grx_n,
    PCIE0_GT_grx_p,
    PCIE0_GT_gtx_n,
    PCIE0_GT_gtx_p,
    cpm_cor_irq,
    cpm_irq0,
    cpm_irq1,
    cpm_misc_irq,
    cpm_pcie_noc_axi0_clk,
    cpm_pcie_noc_axi1_clk,
    cpm_uncor_irq,
    dma0_axi_aresetn,
    dma0_irq,
    dma0_mgmt_cpl_dat,
    dma0_mgmt_cpl_rdy,
    dma0_mgmt_cpl_sts,
    dma0_mgmt_cpl_vld,
    dma0_mgmt_req_adr,
    dma0_mgmt_req_cmd,
    dma0_mgmt_req_dat,
    dma0_mgmt_req_fnc,
    dma0_mgmt_req_msc,
    dma0_mgmt_req_rdy,
    dma0_mgmt_req_vld,
    dma0_soft_resetn,
    dma0_st_rx_msg_tdata,
    dma0_st_rx_msg_tlast,
    dma0_st_rx_msg_tready,
    dma0_st_rx_msg_tvalid,
    gt_refclk0_clk_n,
    gt_refclk0_clk_p,
    noc_cpm_pcie_axi0_clk,
    pcie0_user_clk,
    pcie0_user_lnk_up,
    xdma0_usr_irq_ack,
    xdma0_usr_irq_req);
  output [63:0]CPM_PCIE_NOC_0_araddr;
  output [1:0]CPM_PCIE_NOC_0_arburst;
  output [3:0]CPM_PCIE_NOC_0_arcache;
  output [15:0]CPM_PCIE_NOC_0_arid;
  output [7:0]CPM_PCIE_NOC_0_arlen;
  output CPM_PCIE_NOC_0_arlock;
  output [2:0]CPM_PCIE_NOC_0_arprot;
  output [3:0]CPM_PCIE_NOC_0_arqos;
  input CPM_PCIE_NOC_0_arready;
  output [2:0]CPM_PCIE_NOC_0_arsize;
  output [17:0]CPM_PCIE_NOC_0_aruser;
  output CPM_PCIE_NOC_0_arvalid;
  output [63:0]CPM_PCIE_NOC_0_awaddr;
  output [1:0]CPM_PCIE_NOC_0_awburst;
  output [3:0]CPM_PCIE_NOC_0_awcache;
  output [15:0]CPM_PCIE_NOC_0_awid;
  output [7:0]CPM_PCIE_NOC_0_awlen;
  output CPM_PCIE_NOC_0_awlock;
  output [2:0]CPM_PCIE_NOC_0_awprot;
  output [3:0]CPM_PCIE_NOC_0_awqos;
  input CPM_PCIE_NOC_0_awready;
  output [2:0]CPM_PCIE_NOC_0_awsize;
  output [17:0]CPM_PCIE_NOC_0_awuser;
  output CPM_PCIE_NOC_0_awvalid;
  input [15:0]CPM_PCIE_NOC_0_bid;
  output CPM_PCIE_NOC_0_bready;
  input [1:0]CPM_PCIE_NOC_0_bresp;
  input CPM_PCIE_NOC_0_bvalid;
  input [127:0]CPM_PCIE_NOC_0_rdata;
  input [15:0]CPM_PCIE_NOC_0_rid;
  input CPM_PCIE_NOC_0_rlast;
  output CPM_PCIE_NOC_0_rready;
  input [1:0]CPM_PCIE_NOC_0_rresp;
  input CPM_PCIE_NOC_0_rvalid;
  output [127:0]CPM_PCIE_NOC_0_wdata;
  output CPM_PCIE_NOC_0_wlast;
  input CPM_PCIE_NOC_0_wready;
  output [15:0]CPM_PCIE_NOC_0_wstrb;
  output CPM_PCIE_NOC_0_wvalid;
  output [63:0]CPM_PCIE_NOC_1_araddr;
  output [1:0]CPM_PCIE_NOC_1_arburst;
  output [3:0]CPM_PCIE_NOC_1_arcache;
  output [15:0]CPM_PCIE_NOC_1_arid;
  output [7:0]CPM_PCIE_NOC_1_arlen;
  output CPM_PCIE_NOC_1_arlock;
  output [2:0]CPM_PCIE_NOC_1_arprot;
  output [3:0]CPM_PCIE_NOC_1_arqos;
  input CPM_PCIE_NOC_1_arready;
  output [2:0]CPM_PCIE_NOC_1_arsize;
  output [17:0]CPM_PCIE_NOC_1_aruser;
  output CPM_PCIE_NOC_1_arvalid;
  output [63:0]CPM_PCIE_NOC_1_awaddr;
  output [1:0]CPM_PCIE_NOC_1_awburst;
  output [3:0]CPM_PCIE_NOC_1_awcache;
  output [15:0]CPM_PCIE_NOC_1_awid;
  output [7:0]CPM_PCIE_NOC_1_awlen;
  output CPM_PCIE_NOC_1_awlock;
  output [2:0]CPM_PCIE_NOC_1_awprot;
  output [3:0]CPM_PCIE_NOC_1_awqos;
  input CPM_PCIE_NOC_1_awready;
  output [2:0]CPM_PCIE_NOC_1_awsize;
  output [17:0]CPM_PCIE_NOC_1_awuser;
  output CPM_PCIE_NOC_1_awvalid;
  input [15:0]CPM_PCIE_NOC_1_bid;
  output CPM_PCIE_NOC_1_bready;
  input [1:0]CPM_PCIE_NOC_1_bresp;
  input CPM_PCIE_NOC_1_bvalid;
  input [127:0]CPM_PCIE_NOC_1_rdata;
  input [15:0]CPM_PCIE_NOC_1_rid;
  input CPM_PCIE_NOC_1_rlast;
  output CPM_PCIE_NOC_1_rready;
  input [1:0]CPM_PCIE_NOC_1_rresp;
  input CPM_PCIE_NOC_1_rvalid;
  output [127:0]CPM_PCIE_NOC_1_wdata;
  output CPM_PCIE_NOC_1_wlast;
  input CPM_PCIE_NOC_1_wready;
  output [15:0]CPM_PCIE_NOC_1_wstrb;
  output CPM_PCIE_NOC_1_wvalid;
  input [63:0]NOC_CPM_PCIE_0_araddr;
  input [1:0]NOC_CPM_PCIE_0_arburst;
  input [3:0]NOC_CPM_PCIE_0_arcache;
  input [1:0]NOC_CPM_PCIE_0_arid;
  input [7:0]NOC_CPM_PCIE_0_arlen;
  input NOC_CPM_PCIE_0_arlock;
  input [2:0]NOC_CPM_PCIE_0_arprot;
  input [3:0]NOC_CPM_PCIE_0_arqos;
  output NOC_CPM_PCIE_0_arready;
  input [2:0]NOC_CPM_PCIE_0_arsize;
  input [17:0]NOC_CPM_PCIE_0_aruser;
  input NOC_CPM_PCIE_0_arvalid;
  input [63:0]NOC_CPM_PCIE_0_awaddr;
  input [1:0]NOC_CPM_PCIE_0_awburst;
  input [3:0]NOC_CPM_PCIE_0_awcache;
  input [1:0]NOC_CPM_PCIE_0_awid;
  input [7:0]NOC_CPM_PCIE_0_awlen;
  input NOC_CPM_PCIE_0_awlock;
  input [2:0]NOC_CPM_PCIE_0_awprot;
  input [3:0]NOC_CPM_PCIE_0_awqos;
  output NOC_CPM_PCIE_0_awready;
  input [2:0]NOC_CPM_PCIE_0_awsize;
  input [17:0]NOC_CPM_PCIE_0_awuser;
  input NOC_CPM_PCIE_0_awvalid;
  output [1:0]NOC_CPM_PCIE_0_bid;
  input NOC_CPM_PCIE_0_bready;
  output [1:0]NOC_CPM_PCIE_0_bresp;
  output NOC_CPM_PCIE_0_bvalid;
  output [127:0]NOC_CPM_PCIE_0_rdata;
  output [1:0]NOC_CPM_PCIE_0_rid;
  output NOC_CPM_PCIE_0_rlast;
  input NOC_CPM_PCIE_0_rready;
  output [1:0]NOC_CPM_PCIE_0_rresp;
  output NOC_CPM_PCIE_0_rvalid;
  input [127:0]NOC_CPM_PCIE_0_wdata;
  input NOC_CPM_PCIE_0_wlast;
  output NOC_CPM_PCIE_0_wready;
  input [15:0]NOC_CPM_PCIE_0_wstrb;
  input NOC_CPM_PCIE_0_wvalid;
  input [7:0]PCIE0_GT_grx_n;
  input [7:0]PCIE0_GT_grx_p;
  output [7:0]PCIE0_GT_gtx_n;
  output [7:0]PCIE0_GT_gtx_p;
  output cpm_cor_irq;
  input cpm_irq0;
  input cpm_irq1;
  output cpm_misc_irq;
  output cpm_pcie_noc_axi0_clk;
  output cpm_pcie_noc_axi1_clk;
  output cpm_uncor_irq;
  output dma0_axi_aresetn;
  output dma0_irq;
  output [31:0]dma0_mgmt_cpl_dat;
  input dma0_mgmt_cpl_rdy;
  output [1:0]dma0_mgmt_cpl_sts;
  output dma0_mgmt_cpl_vld;
  input [31:0]dma0_mgmt_req_adr;
  input [1:0]dma0_mgmt_req_cmd;
  input [31:0]dma0_mgmt_req_dat;
  input [7:0]dma0_mgmt_req_fnc;
  input [5:0]dma0_mgmt_req_msc;
  output dma0_mgmt_req_rdy;
  input dma0_mgmt_req_vld;
  input dma0_soft_resetn;
  output [31:0]dma0_st_rx_msg_tdata;
  output dma0_st_rx_msg_tlast;
  input dma0_st_rx_msg_tready;
  output dma0_st_rx_msg_tvalid;
  input gt_refclk0_clk_n;
  input gt_refclk0_clk_p;
  output noc_cpm_pcie_axi0_clk;
  output pcie0_user_clk;
  output pcie0_user_lnk_up;
  output [0:0]xdma0_usr_irq_ack;
  input [0:0]xdma0_usr_irq_req;

  wire [63:0]CPM_PCIE_NOC_0_araddr;
  wire [1:0]CPM_PCIE_NOC_0_arburst;
  wire [3:0]CPM_PCIE_NOC_0_arcache;
  wire [15:0]CPM_PCIE_NOC_0_arid;
  wire [7:0]CPM_PCIE_NOC_0_arlen;
  wire CPM_PCIE_NOC_0_arlock;
  wire [2:0]CPM_PCIE_NOC_0_arprot;
  wire [3:0]CPM_PCIE_NOC_0_arqos;
  wire CPM_PCIE_NOC_0_arready;
  wire [2:0]CPM_PCIE_NOC_0_arsize;
  wire [17:0]CPM_PCIE_NOC_0_aruser;
  wire CPM_PCIE_NOC_0_arvalid;
  wire [63:0]CPM_PCIE_NOC_0_awaddr;
  wire [1:0]CPM_PCIE_NOC_0_awburst;
  wire [3:0]CPM_PCIE_NOC_0_awcache;
  wire [15:0]CPM_PCIE_NOC_0_awid;
  wire [7:0]CPM_PCIE_NOC_0_awlen;
  wire CPM_PCIE_NOC_0_awlock;
  wire [2:0]CPM_PCIE_NOC_0_awprot;
  wire [3:0]CPM_PCIE_NOC_0_awqos;
  wire CPM_PCIE_NOC_0_awready;
  wire [2:0]CPM_PCIE_NOC_0_awsize;
  wire [17:0]CPM_PCIE_NOC_0_awuser;
  wire CPM_PCIE_NOC_0_awvalid;
  wire [15:0]CPM_PCIE_NOC_0_bid;
  wire CPM_PCIE_NOC_0_bready;
  wire [1:0]CPM_PCIE_NOC_0_bresp;
  wire CPM_PCIE_NOC_0_bvalid;
  wire [127:0]CPM_PCIE_NOC_0_rdata;
  wire [15:0]CPM_PCIE_NOC_0_rid;
  wire CPM_PCIE_NOC_0_rlast;
  wire CPM_PCIE_NOC_0_rready;
  wire [1:0]CPM_PCIE_NOC_0_rresp;
  wire CPM_PCIE_NOC_0_rvalid;
  wire [127:0]CPM_PCIE_NOC_0_wdata;
  wire CPM_PCIE_NOC_0_wlast;
  wire CPM_PCIE_NOC_0_wready;
  wire [15:0]CPM_PCIE_NOC_0_wstrb;
  wire CPM_PCIE_NOC_0_wvalid;
  wire [63:0]CPM_PCIE_NOC_1_araddr;
  wire [1:0]CPM_PCIE_NOC_1_arburst;
  wire [3:0]CPM_PCIE_NOC_1_arcache;
  wire [15:0]CPM_PCIE_NOC_1_arid;
  wire [7:0]CPM_PCIE_NOC_1_arlen;
  wire CPM_PCIE_NOC_1_arlock;
  wire [2:0]CPM_PCIE_NOC_1_arprot;
  wire [3:0]CPM_PCIE_NOC_1_arqos;
  wire CPM_PCIE_NOC_1_arready;
  wire [2:0]CPM_PCIE_NOC_1_arsize;
  wire [17:0]CPM_PCIE_NOC_1_aruser;
  wire CPM_PCIE_NOC_1_arvalid;
  wire [63:0]CPM_PCIE_NOC_1_awaddr;
  wire [1:0]CPM_PCIE_NOC_1_awburst;
  wire [3:0]CPM_PCIE_NOC_1_awcache;
  wire [15:0]CPM_PCIE_NOC_1_awid;
  wire [7:0]CPM_PCIE_NOC_1_awlen;
  wire CPM_PCIE_NOC_1_awlock;
  wire [2:0]CPM_PCIE_NOC_1_awprot;
  wire [3:0]CPM_PCIE_NOC_1_awqos;
  wire CPM_PCIE_NOC_1_awready;
  wire [2:0]CPM_PCIE_NOC_1_awsize;
  wire [17:0]CPM_PCIE_NOC_1_awuser;
  wire CPM_PCIE_NOC_1_awvalid;
  wire [15:0]CPM_PCIE_NOC_1_bid;
  wire CPM_PCIE_NOC_1_bready;
  wire [1:0]CPM_PCIE_NOC_1_bresp;
  wire CPM_PCIE_NOC_1_bvalid;
  wire [127:0]CPM_PCIE_NOC_1_rdata;
  wire [15:0]CPM_PCIE_NOC_1_rid;
  wire CPM_PCIE_NOC_1_rlast;
  wire CPM_PCIE_NOC_1_rready;
  wire [1:0]CPM_PCIE_NOC_1_rresp;
  wire CPM_PCIE_NOC_1_rvalid;
  wire [127:0]CPM_PCIE_NOC_1_wdata;
  wire CPM_PCIE_NOC_1_wlast;
  wire CPM_PCIE_NOC_1_wready;
  wire [15:0]CPM_PCIE_NOC_1_wstrb;
  wire CPM_PCIE_NOC_1_wvalid;
  wire [63:0]NOC_CPM_PCIE_0_araddr;
  wire [1:0]NOC_CPM_PCIE_0_arburst;
  wire [3:0]NOC_CPM_PCIE_0_arcache;
  wire [1:0]NOC_CPM_PCIE_0_arid;
  wire [7:0]NOC_CPM_PCIE_0_arlen;
  wire NOC_CPM_PCIE_0_arlock;
  wire [2:0]NOC_CPM_PCIE_0_arprot;
  wire [3:0]NOC_CPM_PCIE_0_arqos;
  wire NOC_CPM_PCIE_0_arready;
  wire [2:0]NOC_CPM_PCIE_0_arsize;
  wire [17:0]NOC_CPM_PCIE_0_aruser;
  wire NOC_CPM_PCIE_0_arvalid;
  wire [63:0]NOC_CPM_PCIE_0_awaddr;
  wire [1:0]NOC_CPM_PCIE_0_awburst;
  wire [3:0]NOC_CPM_PCIE_0_awcache;
  wire [1:0]NOC_CPM_PCIE_0_awid;
  wire [7:0]NOC_CPM_PCIE_0_awlen;
  wire NOC_CPM_PCIE_0_awlock;
  wire [2:0]NOC_CPM_PCIE_0_awprot;
  wire [3:0]NOC_CPM_PCIE_0_awqos;
  wire NOC_CPM_PCIE_0_awready;
  wire [2:0]NOC_CPM_PCIE_0_awsize;
  wire [17:0]NOC_CPM_PCIE_0_awuser;
  wire NOC_CPM_PCIE_0_awvalid;
  wire [1:0]NOC_CPM_PCIE_0_bid;
  wire NOC_CPM_PCIE_0_bready;
  wire [1:0]NOC_CPM_PCIE_0_bresp;
  wire NOC_CPM_PCIE_0_bvalid;
  wire [127:0]NOC_CPM_PCIE_0_rdata;
  wire [1:0]NOC_CPM_PCIE_0_rid;
  wire NOC_CPM_PCIE_0_rlast;
  wire NOC_CPM_PCIE_0_rready;
  wire [1:0]NOC_CPM_PCIE_0_rresp;
  wire NOC_CPM_PCIE_0_rvalid;
  wire [127:0]NOC_CPM_PCIE_0_wdata;
  wire NOC_CPM_PCIE_0_wlast;
  wire NOC_CPM_PCIE_0_wready;
  wire [15:0]NOC_CPM_PCIE_0_wstrb;
  wire NOC_CPM_PCIE_0_wvalid;
  wire [7:0]PCIE0_GT_grx_n;
  wire [7:0]PCIE0_GT_grx_p;
  wire [7:0]PCIE0_GT_gtx_n;
  wire [7:0]PCIE0_GT_gtx_p;
  wire cpm_cor_irq;
  wire cpm_irq0;
  wire cpm_irq1;
  wire cpm_misc_irq;
  wire cpm_pcie_noc_axi0_clk;
  wire cpm_pcie_noc_axi1_clk;
  wire cpm_uncor_irq;
  wire dma0_axi_aresetn;
  wire dma0_irq;
  wire [31:0]dma0_mgmt_cpl_dat;
  wire dma0_mgmt_cpl_rdy;
  wire [1:0]dma0_mgmt_cpl_sts;
  wire dma0_mgmt_cpl_vld;
  wire [31:0]dma0_mgmt_req_adr;
  wire [1:0]dma0_mgmt_req_cmd;
  wire [31:0]dma0_mgmt_req_dat;
  wire [7:0]dma0_mgmt_req_fnc;
  wire [5:0]dma0_mgmt_req_msc;
  wire dma0_mgmt_req_rdy;
  wire dma0_mgmt_req_vld;
  wire dma0_soft_resetn;
  wire [31:0]dma0_st_rx_msg_tdata;
  wire dma0_st_rx_msg_tlast;
  wire dma0_st_rx_msg_tready;
  wire dma0_st_rx_msg_tvalid;
  wire gt_refclk0_clk_n;
  wire gt_refclk0_clk_p;
  wire noc_cpm_pcie_axi0_clk;
  wire pcie0_user_clk;
  wire pcie0_user_lnk_up;
  wire [0:0]xdma0_usr_irq_ack;
  wire [0:0]xdma0_usr_irq_req;

  bd_f512 bd_f512_i
       (.CPM_PCIE_NOC_0_araddr(CPM_PCIE_NOC_0_araddr),
        .CPM_PCIE_NOC_0_arburst(CPM_PCIE_NOC_0_arburst),
        .CPM_PCIE_NOC_0_arcache(CPM_PCIE_NOC_0_arcache),
        .CPM_PCIE_NOC_0_arid(CPM_PCIE_NOC_0_arid),
        .CPM_PCIE_NOC_0_arlen(CPM_PCIE_NOC_0_arlen),
        .CPM_PCIE_NOC_0_arlock(CPM_PCIE_NOC_0_arlock),
        .CPM_PCIE_NOC_0_arprot(CPM_PCIE_NOC_0_arprot),
        .CPM_PCIE_NOC_0_arqos(CPM_PCIE_NOC_0_arqos),
        .CPM_PCIE_NOC_0_arready(CPM_PCIE_NOC_0_arready),
        .CPM_PCIE_NOC_0_arsize(CPM_PCIE_NOC_0_arsize),
        .CPM_PCIE_NOC_0_aruser(CPM_PCIE_NOC_0_aruser),
        .CPM_PCIE_NOC_0_arvalid(CPM_PCIE_NOC_0_arvalid),
        .CPM_PCIE_NOC_0_awaddr(CPM_PCIE_NOC_0_awaddr),
        .CPM_PCIE_NOC_0_awburst(CPM_PCIE_NOC_0_awburst),
        .CPM_PCIE_NOC_0_awcache(CPM_PCIE_NOC_0_awcache),
        .CPM_PCIE_NOC_0_awid(CPM_PCIE_NOC_0_awid),
        .CPM_PCIE_NOC_0_awlen(CPM_PCIE_NOC_0_awlen),
        .CPM_PCIE_NOC_0_awlock(CPM_PCIE_NOC_0_awlock),
        .CPM_PCIE_NOC_0_awprot(CPM_PCIE_NOC_0_awprot),
        .CPM_PCIE_NOC_0_awqos(CPM_PCIE_NOC_0_awqos),
        .CPM_PCIE_NOC_0_awready(CPM_PCIE_NOC_0_awready),
        .CPM_PCIE_NOC_0_awsize(CPM_PCIE_NOC_0_awsize),
        .CPM_PCIE_NOC_0_awuser(CPM_PCIE_NOC_0_awuser),
        .CPM_PCIE_NOC_0_awvalid(CPM_PCIE_NOC_0_awvalid),
        .CPM_PCIE_NOC_0_bid(CPM_PCIE_NOC_0_bid),
        .CPM_PCIE_NOC_0_bready(CPM_PCIE_NOC_0_bready),
        .CPM_PCIE_NOC_0_bresp(CPM_PCIE_NOC_0_bresp),
        .CPM_PCIE_NOC_0_bvalid(CPM_PCIE_NOC_0_bvalid),
        .CPM_PCIE_NOC_0_rdata(CPM_PCIE_NOC_0_rdata),
        .CPM_PCIE_NOC_0_rid(CPM_PCIE_NOC_0_rid),
        .CPM_PCIE_NOC_0_rlast(CPM_PCIE_NOC_0_rlast),
        .CPM_PCIE_NOC_0_rready(CPM_PCIE_NOC_0_rready),
        .CPM_PCIE_NOC_0_rresp(CPM_PCIE_NOC_0_rresp),
        .CPM_PCIE_NOC_0_rvalid(CPM_PCIE_NOC_0_rvalid),
        .CPM_PCIE_NOC_0_wdata(CPM_PCIE_NOC_0_wdata),
        .CPM_PCIE_NOC_0_wlast(CPM_PCIE_NOC_0_wlast),
        .CPM_PCIE_NOC_0_wready(CPM_PCIE_NOC_0_wready),
        .CPM_PCIE_NOC_0_wstrb(CPM_PCIE_NOC_0_wstrb),
        .CPM_PCIE_NOC_0_wvalid(CPM_PCIE_NOC_0_wvalid),
        .CPM_PCIE_NOC_1_araddr(CPM_PCIE_NOC_1_araddr),
        .CPM_PCIE_NOC_1_arburst(CPM_PCIE_NOC_1_arburst),
        .CPM_PCIE_NOC_1_arcache(CPM_PCIE_NOC_1_arcache),
        .CPM_PCIE_NOC_1_arid(CPM_PCIE_NOC_1_arid),
        .CPM_PCIE_NOC_1_arlen(CPM_PCIE_NOC_1_arlen),
        .CPM_PCIE_NOC_1_arlock(CPM_PCIE_NOC_1_arlock),
        .CPM_PCIE_NOC_1_arprot(CPM_PCIE_NOC_1_arprot),
        .CPM_PCIE_NOC_1_arqos(CPM_PCIE_NOC_1_arqos),
        .CPM_PCIE_NOC_1_arready(CPM_PCIE_NOC_1_arready),
        .CPM_PCIE_NOC_1_arsize(CPM_PCIE_NOC_1_arsize),
        .CPM_PCIE_NOC_1_aruser(CPM_PCIE_NOC_1_aruser),
        .CPM_PCIE_NOC_1_arvalid(CPM_PCIE_NOC_1_arvalid),
        .CPM_PCIE_NOC_1_awaddr(CPM_PCIE_NOC_1_awaddr),
        .CPM_PCIE_NOC_1_awburst(CPM_PCIE_NOC_1_awburst),
        .CPM_PCIE_NOC_1_awcache(CPM_PCIE_NOC_1_awcache),
        .CPM_PCIE_NOC_1_awid(CPM_PCIE_NOC_1_awid),
        .CPM_PCIE_NOC_1_awlen(CPM_PCIE_NOC_1_awlen),
        .CPM_PCIE_NOC_1_awlock(CPM_PCIE_NOC_1_awlock),
        .CPM_PCIE_NOC_1_awprot(CPM_PCIE_NOC_1_awprot),
        .CPM_PCIE_NOC_1_awqos(CPM_PCIE_NOC_1_awqos),
        .CPM_PCIE_NOC_1_awready(CPM_PCIE_NOC_1_awready),
        .CPM_PCIE_NOC_1_awsize(CPM_PCIE_NOC_1_awsize),
        .CPM_PCIE_NOC_1_awuser(CPM_PCIE_NOC_1_awuser),
        .CPM_PCIE_NOC_1_awvalid(CPM_PCIE_NOC_1_awvalid),
        .CPM_PCIE_NOC_1_bid(CPM_PCIE_NOC_1_bid),
        .CPM_PCIE_NOC_1_bready(CPM_PCIE_NOC_1_bready),
        .CPM_PCIE_NOC_1_bresp(CPM_PCIE_NOC_1_bresp),
        .CPM_PCIE_NOC_1_bvalid(CPM_PCIE_NOC_1_bvalid),
        .CPM_PCIE_NOC_1_rdata(CPM_PCIE_NOC_1_rdata),
        .CPM_PCIE_NOC_1_rid(CPM_PCIE_NOC_1_rid),
        .CPM_PCIE_NOC_1_rlast(CPM_PCIE_NOC_1_rlast),
        .CPM_PCIE_NOC_1_rready(CPM_PCIE_NOC_1_rready),
        .CPM_PCIE_NOC_1_rresp(CPM_PCIE_NOC_1_rresp),
        .CPM_PCIE_NOC_1_rvalid(CPM_PCIE_NOC_1_rvalid),
        .CPM_PCIE_NOC_1_wdata(CPM_PCIE_NOC_1_wdata),
        .CPM_PCIE_NOC_1_wlast(CPM_PCIE_NOC_1_wlast),
        .CPM_PCIE_NOC_1_wready(CPM_PCIE_NOC_1_wready),
        .CPM_PCIE_NOC_1_wstrb(CPM_PCIE_NOC_1_wstrb),
        .CPM_PCIE_NOC_1_wvalid(CPM_PCIE_NOC_1_wvalid),
        .NOC_CPM_PCIE_0_araddr(NOC_CPM_PCIE_0_araddr),
        .NOC_CPM_PCIE_0_arburst(NOC_CPM_PCIE_0_arburst),
        .NOC_CPM_PCIE_0_arcache(NOC_CPM_PCIE_0_arcache),
        .NOC_CPM_PCIE_0_arid(NOC_CPM_PCIE_0_arid),
        .NOC_CPM_PCIE_0_arlen(NOC_CPM_PCIE_0_arlen),
        .NOC_CPM_PCIE_0_arlock(NOC_CPM_PCIE_0_arlock),
        .NOC_CPM_PCIE_0_arprot(NOC_CPM_PCIE_0_arprot),
        .NOC_CPM_PCIE_0_arqos(NOC_CPM_PCIE_0_arqos),
        .NOC_CPM_PCIE_0_arready(NOC_CPM_PCIE_0_arready),
        .NOC_CPM_PCIE_0_arsize(NOC_CPM_PCIE_0_arsize),
        .NOC_CPM_PCIE_0_aruser(NOC_CPM_PCIE_0_aruser),
        .NOC_CPM_PCIE_0_arvalid(NOC_CPM_PCIE_0_arvalid),
        .NOC_CPM_PCIE_0_awaddr(NOC_CPM_PCIE_0_awaddr),
        .NOC_CPM_PCIE_0_awburst(NOC_CPM_PCIE_0_awburst),
        .NOC_CPM_PCIE_0_awcache(NOC_CPM_PCIE_0_awcache),
        .NOC_CPM_PCIE_0_awid(NOC_CPM_PCIE_0_awid),
        .NOC_CPM_PCIE_0_awlen(NOC_CPM_PCIE_0_awlen),
        .NOC_CPM_PCIE_0_awlock(NOC_CPM_PCIE_0_awlock),
        .NOC_CPM_PCIE_0_awprot(NOC_CPM_PCIE_0_awprot),
        .NOC_CPM_PCIE_0_awqos(NOC_CPM_PCIE_0_awqos),
        .NOC_CPM_PCIE_0_awready(NOC_CPM_PCIE_0_awready),
        .NOC_CPM_PCIE_0_awsize(NOC_CPM_PCIE_0_awsize),
        .NOC_CPM_PCIE_0_awuser(NOC_CPM_PCIE_0_awuser),
        .NOC_CPM_PCIE_0_awvalid(NOC_CPM_PCIE_0_awvalid),
        .NOC_CPM_PCIE_0_bid(NOC_CPM_PCIE_0_bid),
        .NOC_CPM_PCIE_0_bready(NOC_CPM_PCIE_0_bready),
        .NOC_CPM_PCIE_0_bresp(NOC_CPM_PCIE_0_bresp),
        .NOC_CPM_PCIE_0_bvalid(NOC_CPM_PCIE_0_bvalid),
        .NOC_CPM_PCIE_0_rdata(NOC_CPM_PCIE_0_rdata),
        .NOC_CPM_PCIE_0_rid(NOC_CPM_PCIE_0_rid),
        .NOC_CPM_PCIE_0_rlast(NOC_CPM_PCIE_0_rlast),
        .NOC_CPM_PCIE_0_rready(NOC_CPM_PCIE_0_rready),
        .NOC_CPM_PCIE_0_rresp(NOC_CPM_PCIE_0_rresp),
        .NOC_CPM_PCIE_0_rvalid(NOC_CPM_PCIE_0_rvalid),
        .NOC_CPM_PCIE_0_wdata(NOC_CPM_PCIE_0_wdata),
        .NOC_CPM_PCIE_0_wlast(NOC_CPM_PCIE_0_wlast),
        .NOC_CPM_PCIE_0_wready(NOC_CPM_PCIE_0_wready),
        .NOC_CPM_PCIE_0_wstrb(NOC_CPM_PCIE_0_wstrb),
        .NOC_CPM_PCIE_0_wvalid(NOC_CPM_PCIE_0_wvalid),
        .PCIE0_GT_grx_n(PCIE0_GT_grx_n),
        .PCIE0_GT_grx_p(PCIE0_GT_grx_p),
        .PCIE0_GT_gtx_n(PCIE0_GT_gtx_n),
        .PCIE0_GT_gtx_p(PCIE0_GT_gtx_p),
        .cpm_cor_irq(cpm_cor_irq),
        .cpm_irq0(cpm_irq0),
        .cpm_irq1(cpm_irq1),
        .cpm_misc_irq(cpm_misc_irq),
        .cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk),
        .cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk),
        .cpm_uncor_irq(cpm_uncor_irq),
        .dma0_axi_aresetn(dma0_axi_aresetn),
        .dma0_irq(dma0_irq),
        .dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat),
        .dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy),
        .dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts),
        .dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld),
        .dma0_mgmt_req_adr(dma0_mgmt_req_adr),
        .dma0_mgmt_req_cmd(dma0_mgmt_req_cmd),
        .dma0_mgmt_req_dat(dma0_mgmt_req_dat),
        .dma0_mgmt_req_fnc(dma0_mgmt_req_fnc),
        .dma0_mgmt_req_msc(dma0_mgmt_req_msc),
        .dma0_mgmt_req_rdy(dma0_mgmt_req_rdy),
        .dma0_mgmt_req_vld(dma0_mgmt_req_vld),
        .dma0_soft_resetn(dma0_soft_resetn),
        .dma0_st_rx_msg_tdata(dma0_st_rx_msg_tdata),
        .dma0_st_rx_msg_tlast(dma0_st_rx_msg_tlast),
        .dma0_st_rx_msg_tready(dma0_st_rx_msg_tready),
        .dma0_st_rx_msg_tvalid(dma0_st_rx_msg_tvalid),
        .gt_refclk0_clk_n(gt_refclk0_clk_n),
        .gt_refclk0_clk_p(gt_refclk0_clk_p),
        .noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk),
        .pcie0_user_clk(pcie0_user_clk),
        .pcie0_user_lnk_up(pcie0_user_lnk_up),
        .xdma0_usr_irq_ack(xdma0_usr_irq_ack),
        .xdma0_usr_irq_req(xdma0_usr_irq_req));
endmodule
