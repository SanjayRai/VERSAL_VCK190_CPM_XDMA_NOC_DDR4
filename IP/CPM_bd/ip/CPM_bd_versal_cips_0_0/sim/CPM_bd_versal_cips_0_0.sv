// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:versal_cips:3.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
(* DONT_TOUCH = "true" *)
module CPM_bd_versal_cips_0_0 (
  noc_cpm_pcie_axi0_clk,
  cpm_pcie_noc_axi0_clk,
  cpm_pcie_noc_axi1_clk,
  pcie0_user_clk,
  pcie0_user_lnk_up,
  cpm_misc_irq,
  cpm_cor_irq,
  cpm_uncor_irq,
  cpm_irq0,
  cpm_irq1,
  dma0_irq,
  dma0_axi_aresetn,
  dma0_soft_resetn,
  xdma0_usr_irq_ack,
  xdma0_usr_irq_req,
  NOC_CPM_PCIE_0_araddr,
  NOC_CPM_PCIE_0_arburst,
  NOC_CPM_PCIE_0_arcache,
  NOC_CPM_PCIE_0_arid,
  NOC_CPM_PCIE_0_arlen,
  NOC_CPM_PCIE_0_arlock,
  NOC_CPM_PCIE_0_arprot,
  NOC_CPM_PCIE_0_arqos,
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
  NOC_CPM_PCIE_0_awsize,
  NOC_CPM_PCIE_0_awuser,
  NOC_CPM_PCIE_0_awvalid,
  NOC_CPM_PCIE_0_bready,
  NOC_CPM_PCIE_0_rready,
  NOC_CPM_PCIE_0_wdata,
  NOC_CPM_PCIE_0_wlast,
  NOC_CPM_PCIE_0_wstrb,
  NOC_CPM_PCIE_0_wvalid,
  NOC_CPM_PCIE_0_arready,
  NOC_CPM_PCIE_0_awready,
  NOC_CPM_PCIE_0_bid,
  NOC_CPM_PCIE_0_bresp,
  NOC_CPM_PCIE_0_bvalid,
  NOC_CPM_PCIE_0_rdata,
  NOC_CPM_PCIE_0_rid,
  NOC_CPM_PCIE_0_rlast,
  NOC_CPM_PCIE_0_rresp,
  NOC_CPM_PCIE_0_rvalid,
  NOC_CPM_PCIE_0_wready,
  CPM_PCIE_NOC_0_araddr,
  CPM_PCIE_NOC_0_arburst,
  CPM_PCIE_NOC_0_arcache,
  CPM_PCIE_NOC_0_arid,
  CPM_PCIE_NOC_0_arlen,
  CPM_PCIE_NOC_0_arlock,
  CPM_PCIE_NOC_0_arprot,
  CPM_PCIE_NOC_0_arqos,
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
  CPM_PCIE_NOC_0_awsize,
  CPM_PCIE_NOC_0_awuser,
  CPM_PCIE_NOC_0_awvalid,
  CPM_PCIE_NOC_0_bready,
  CPM_PCIE_NOC_0_rready,
  CPM_PCIE_NOC_0_wdata,
  CPM_PCIE_NOC_0_wlast,
  CPM_PCIE_NOC_0_wstrb,
  CPM_PCIE_NOC_0_wvalid,
  CPM_PCIE_NOC_0_arready,
  CPM_PCIE_NOC_0_awready,
  CPM_PCIE_NOC_0_bid,
  CPM_PCIE_NOC_0_bresp,
  CPM_PCIE_NOC_0_bvalid,
  CPM_PCIE_NOC_0_rdata,
  CPM_PCIE_NOC_0_rid,
  CPM_PCIE_NOC_0_rlast,
  CPM_PCIE_NOC_0_rresp,
  CPM_PCIE_NOC_0_rvalid,
  CPM_PCIE_NOC_0_wready,
  CPM_PCIE_NOC_1_araddr,
  CPM_PCIE_NOC_1_arburst,
  CPM_PCIE_NOC_1_arcache,
  CPM_PCIE_NOC_1_arid,
  CPM_PCIE_NOC_1_arlen,
  CPM_PCIE_NOC_1_arlock,
  CPM_PCIE_NOC_1_arprot,
  CPM_PCIE_NOC_1_arqos,
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
  CPM_PCIE_NOC_1_awsize,
  CPM_PCIE_NOC_1_awuser,
  CPM_PCIE_NOC_1_awvalid,
  CPM_PCIE_NOC_1_bready,
  CPM_PCIE_NOC_1_rready,
  CPM_PCIE_NOC_1_wdata,
  CPM_PCIE_NOC_1_wlast,
  CPM_PCIE_NOC_1_wstrb,
  CPM_PCIE_NOC_1_wvalid,
  CPM_PCIE_NOC_1_arready,
  CPM_PCIE_NOC_1_awready,
  CPM_PCIE_NOC_1_bid,
  CPM_PCIE_NOC_1_bresp,
  CPM_PCIE_NOC_1_bvalid,
  CPM_PCIE_NOC_1_rdata,
  CPM_PCIE_NOC_1_rid,
  CPM_PCIE_NOC_1_rlast,
  CPM_PCIE_NOC_1_rresp,
  CPM_PCIE_NOC_1_rvalid,
  CPM_PCIE_NOC_1_wready,
  PCIE0_GT_gtx_n,
  PCIE0_GT_gtx_p,
  PCIE0_GT_grx_n,
  PCIE0_GT_grx_p,
  dma0_mgmt_cpl_vld,
  dma0_mgmt_req_rdy,
  dma0_mgmt_cpl_rdy,
  dma0_mgmt_req_vld,
  dma0_mgmt_cpl_sts,
  dma0_mgmt_cpl_dat,
  dma0_mgmt_req_cmd,
  dma0_mgmt_req_fnc,
  dma0_mgmt_req_msc,
  dma0_mgmt_req_adr,
  dma0_mgmt_req_dat,
  dma0_st_rx_msg_tlast,
  dma0_st_rx_msg_tvalid,
  dma0_st_rx_msg_tready,
  dma0_st_rx_msg_tdata,
  gt_refclk0_clk_n,
  gt_refclk0_clk_p
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.noc_cpm_pcie_axi0_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, ASSOCIATED_BUSIF NOC_CPM_PCIE_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NSU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.noc_cpm_pcie_axi0_clk CLK" *)
output wire noc_cpm_pcie_axi0_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.cpm_pcie_noc_axi0_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, ASSOCIATED_BUSIF CPM_PCIE_NOC_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.cpm_pcie_noc_axi0_clk CLK" *)
output wire cpm_pcie_noc_axi0_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.cpm_pcie_noc_axi1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, ASSOCIATED_BUSIF CPM_PCIE_NOC_1, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.cpm_pcie_noc_axi1_clk CLK" *)
output wire cpm_pcie_noc_axi1_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.pcie0_user_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, ASSOCIATED_BUSIF dma0_st_rx_msg, ASSOCIATED_RESET dma0_axi_aresetn, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.pcie0_user_clk CLK" *)
output wire pcie0_user_clk;
output wire pcie0_user_lnk_up;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_misc_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_misc_irq INTERRUPT" *)
output wire cpm_misc_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_cor_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_cor_irq INTERRUPT" *)
output wire cpm_cor_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_uncor_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_uncor_irq INTERRUPT" *)
output wire cpm_uncor_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_irq0, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_irq0 INTERRUPT" *)
input wire cpm_irq0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.cpm_irq1, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.cpm_irq1 INTERRUPT" *)
input wire cpm_irq1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.dma0_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.dma0_irq INTERRUPT" *)
output wire dma0_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.dma0_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.dma0_axi_aresetn RST" *)
output wire dma0_axi_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.dma0_soft_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.dma0_soft_resetn RST" *)
input wire dma0_soft_resetn;
output wire [0 : 0] xdma0_usr_irq_ack;
input wire [0 : 0] xdma0_usr_irq_req;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARADDR" *)
input wire [63 : 0] NOC_CPM_PCIE_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARBURST" *)
input wire [1 : 0] NOC_CPM_PCIE_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARCACHE" *)
input wire [3 : 0] NOC_CPM_PCIE_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARID" *)
input wire [1 : 0] NOC_CPM_PCIE_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARLEN" *)
input wire [7 : 0] NOC_CPM_PCIE_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARLOCK" *)
input wire NOC_CPM_PCIE_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARPROT" *)
input wire [2 : 0] NOC_CPM_PCIE_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARQOS" *)
input wire [3 : 0] NOC_CPM_PCIE_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARSIZE" *)
input wire [2 : 0] NOC_CPM_PCIE_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARUSER" *)
input wire [17 : 0] NOC_CPM_PCIE_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARVALID" *)
input wire NOC_CPM_PCIE_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWADDR" *)
input wire [63 : 0] NOC_CPM_PCIE_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWBURST" *)
input wire [1 : 0] NOC_CPM_PCIE_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWCACHE" *)
input wire [3 : 0] NOC_CPM_PCIE_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWID" *)
input wire [1 : 0] NOC_CPM_PCIE_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWLEN" *)
input wire [7 : 0] NOC_CPM_PCIE_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWLOCK" *)
input wire NOC_CPM_PCIE_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWPROT" *)
input wire [2 : 0] NOC_CPM_PCIE_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWQOS" *)
input wire [3 : 0] NOC_CPM_PCIE_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWSIZE" *)
input wire [2 : 0] NOC_CPM_PCIE_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWUSER" *)
input wire [17 : 0] NOC_CPM_PCIE_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWVALID" *)
input wire NOC_CPM_PCIE_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BREADY" *)
input wire NOC_CPM_PCIE_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RREADY" *)
input wire NOC_CPM_PCIE_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WDATA" *)
input wire [127 : 0] NOC_CPM_PCIE_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WLAST" *)
input wire NOC_CPM_PCIE_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WSTRB" *)
input wire [15 : 0] NOC_CPM_PCIE_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WVALID" *)
input wire NOC_CPM_PCIE_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARREADY" *)
output wire NOC_CPM_PCIE_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWREADY" *)
output wire NOC_CPM_PCIE_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BID" *)
output wire [1 : 0] NOC_CPM_PCIE_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BRESP" *)
output wire [1 : 0] NOC_CPM_PCIE_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BVALID" *)
output wire NOC_CPM_PCIE_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RDATA" *)
output wire [127 : 0] NOC_CPM_PCIE_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RID" *)
output wire [1 : 0] NOC_CPM_PCIE_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RLAST" *)
output wire NOC_CPM_PCIE_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RRESP" *)
output wire [1 : 0] NOC_CPM_PCIE_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RVALID" *)
output wire NOC_CPM_PCIE_0_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NOC_CPM_PCIE_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 2, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, NUM_REA\
D_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL NOC_NSU_TO_PS_PCIE, HD_TANDEM 0, INDEX 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WREADY" *)
output wire NOC_CPM_PCIE_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARADDR" *)
output wire [63 : 0] CPM_PCIE_NOC_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARID" *)
output wire [15 : 0] CPM_PCIE_NOC_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLOCK" *)
output wire CPM_PCIE_NOC_0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARVALID" *)
output wire CPM_PCIE_NOC_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWADDR" *)
output wire [63 : 0] CPM_PCIE_NOC_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWID" *)
output wire [15 : 0] CPM_PCIE_NOC_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLOCK" *)
output wire CPM_PCIE_NOC_0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWVALID" *)
output wire CPM_PCIE_NOC_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BREADY" *)
output wire CPM_PCIE_NOC_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RREADY" *)
output wire CPM_PCIE_NOC_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WDATA" *)
output wire [127 : 0] CPM_PCIE_NOC_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WLAST" *)
output wire CPM_PCIE_NOC_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WSTRB" *)
output wire [15 : 0] CPM_PCIE_NOC_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WVALID" *)
output wire CPM_PCIE_NOC_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARREADY" *)
input wire CPM_PCIE_NOC_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWREADY" *)
input wire CPM_PCIE_NOC_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BID" *)
input wire [15 : 0] CPM_PCIE_NOC_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BVALID" *)
input wire CPM_PCIE_NOC_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RDATA" *)
input wire [127 : 0] CPM_PCIE_NOC_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RID" *)
input wire [15 : 0] CPM_PCIE_NOC_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RLAST" *)
input wire CPM_PCIE_NOC_0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RVALID" *)
input wire CPM_PCIE_NOC_0_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, NUM_RE\
AD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, HD_TANDEM 0, INDEX 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WREADY" *)
input wire CPM_PCIE_NOC_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARADDR" *)
output wire [63 : 0] CPM_PCIE_NOC_1_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_1_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_1_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARID" *)
output wire [15 : 0] CPM_PCIE_NOC_1_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_1_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLOCK" *)
output wire CPM_PCIE_NOC_1_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_1_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_1_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_1_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_1_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARVALID" *)
output wire CPM_PCIE_NOC_1_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWADDR" *)
output wire [63 : 0] CPM_PCIE_NOC_1_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWBURST" *)
output wire [1 : 0] CPM_PCIE_NOC_1_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWCACHE" *)
output wire [3 : 0] CPM_PCIE_NOC_1_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWID" *)
output wire [15 : 0] CPM_PCIE_NOC_1_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLEN" *)
output wire [7 : 0] CPM_PCIE_NOC_1_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLOCK" *)
output wire CPM_PCIE_NOC_1_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWPROT" *)
output wire [2 : 0] CPM_PCIE_NOC_1_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWQOS" *)
output wire [3 : 0] CPM_PCIE_NOC_1_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWSIZE" *)
output wire [2 : 0] CPM_PCIE_NOC_1_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWUSER" *)
output wire [17 : 0] CPM_PCIE_NOC_1_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWVALID" *)
output wire CPM_PCIE_NOC_1_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BREADY" *)
output wire CPM_PCIE_NOC_1_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RREADY" *)
output wire CPM_PCIE_NOC_1_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WDATA" *)
output wire [127 : 0] CPM_PCIE_NOC_1_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WLAST" *)
output wire CPM_PCIE_NOC_1_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WSTRB" *)
output wire [15 : 0] CPM_PCIE_NOC_1_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WVALID" *)
output wire CPM_PCIE_NOC_1_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARREADY" *)
input wire CPM_PCIE_NOC_1_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWREADY" *)
input wire CPM_PCIE_NOC_1_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BID" *)
input wire [15 : 0] CPM_PCIE_NOC_1_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_1_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BVALID" *)
input wire CPM_PCIE_NOC_1_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RDATA" *)
input wire [127 : 0] CPM_PCIE_NOC_1_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RID" *)
input wire [15 : 0] CPM_PCIE_NOC_1_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RLAST" *)
input wire CPM_PCIE_NOC_1_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RRESP" *)
input wire [1 : 0] CPM_PCIE_NOC_1_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RVALID" *)
input wire CPM_PCIE_NOC_1_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_1, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, NUM_RE\
AD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, HD_TANDEM 0, INDEX 1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WREADY" *)
input wire CPM_PCIE_NOC_1_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_N" *)
output wire [7 : 0] PCIE0_GT_gtx_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_P" *)
output wire [7 : 0] PCIE0_GT_gtx_p;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_N" *)
input wire [7 : 0] PCIE0_GT_grx_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PCIE0_GT, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_P" *)
input wire [7 : 0] PCIE0_GT_grx_p;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_vld" *)
output wire dma0_mgmt_cpl_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_rdy" *)
output wire dma0_mgmt_req_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_rdy" *)
input wire dma0_mgmt_cpl_rdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_vld" *)
input wire dma0_mgmt_req_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_sts" *)
output wire [1 : 0] dma0_mgmt_cpl_sts;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt cpl_dat" *)
output wire [31 : 0] dma0_mgmt_cpl_dat;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_cmd" *)
input wire [1 : 0] dma0_mgmt_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_fnc" *)
input wire [7 : 0] dma0_mgmt_req_fnc;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_msc" *)
input wire [5 : 0] dma0_mgmt_req_msc;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_adr" *)
input wire [31 : 0] dma0_mgmt_req_adr;
(* X_INTERFACE_INFO = "xilinx.com:interface:cpm_dma_mgmt:1.0 dma0_mgmt req_dat" *)
input wire [31 : 0] dma0_mgmt_req_dat;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TLAST" *)
output wire dma0_st_rx_msg_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TVALID" *)
output wire dma0_st_rx_msg_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TREADY" *)
input wire dma0_st_rx_msg_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dma0_st_rx_msg, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 250000000, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TDATA" *)
output wire [31 : 0] dma0_st_rx_msg_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_N" *)
input wire gt_refclk0_clk_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_refclk0, CAN_DEBUG false, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_P" *)
input wire gt_refclk0_clk_p;

  bd_f512 inst (
    .noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk),
    .cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk),
    .cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk),
    .pcie0_user_clk(pcie0_user_clk),
    .pcie0_user_lnk_up(pcie0_user_lnk_up),
    .cpm_misc_irq(cpm_misc_irq),
    .cpm_cor_irq(cpm_cor_irq),
    .cpm_uncor_irq(cpm_uncor_irq),
    .cpm_irq0(cpm_irq0),
    .cpm_irq1(cpm_irq1),
    .dma0_irq(dma0_irq),
    .dma0_axi_aresetn(dma0_axi_aresetn),
    .dma0_soft_resetn(dma0_soft_resetn),
    .xdma0_usr_irq_ack(xdma0_usr_irq_ack),
    .xdma0_usr_irq_req(xdma0_usr_irq_req),
    .NOC_CPM_PCIE_0_araddr(NOC_CPM_PCIE_0_araddr),
    .NOC_CPM_PCIE_0_arburst(NOC_CPM_PCIE_0_arburst),
    .NOC_CPM_PCIE_0_arcache(NOC_CPM_PCIE_0_arcache),
    .NOC_CPM_PCIE_0_arid(NOC_CPM_PCIE_0_arid),
    .NOC_CPM_PCIE_0_arlen(NOC_CPM_PCIE_0_arlen),
    .NOC_CPM_PCIE_0_arlock(NOC_CPM_PCIE_0_arlock),
    .NOC_CPM_PCIE_0_arprot(NOC_CPM_PCIE_0_arprot),
    .NOC_CPM_PCIE_0_arqos(NOC_CPM_PCIE_0_arqos),
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
    .NOC_CPM_PCIE_0_awsize(NOC_CPM_PCIE_0_awsize),
    .NOC_CPM_PCIE_0_awuser(NOC_CPM_PCIE_0_awuser),
    .NOC_CPM_PCIE_0_awvalid(NOC_CPM_PCIE_0_awvalid),
    .NOC_CPM_PCIE_0_bready(NOC_CPM_PCIE_0_bready),
    .NOC_CPM_PCIE_0_rready(NOC_CPM_PCIE_0_rready),
    .NOC_CPM_PCIE_0_wdata(NOC_CPM_PCIE_0_wdata),
    .NOC_CPM_PCIE_0_wlast(NOC_CPM_PCIE_0_wlast),
    .NOC_CPM_PCIE_0_wstrb(NOC_CPM_PCIE_0_wstrb),
    .NOC_CPM_PCIE_0_wvalid(NOC_CPM_PCIE_0_wvalid),
    .NOC_CPM_PCIE_0_arready(NOC_CPM_PCIE_0_arready),
    .NOC_CPM_PCIE_0_awready(NOC_CPM_PCIE_0_awready),
    .NOC_CPM_PCIE_0_bid(NOC_CPM_PCIE_0_bid),
    .NOC_CPM_PCIE_0_bresp(NOC_CPM_PCIE_0_bresp),
    .NOC_CPM_PCIE_0_bvalid(NOC_CPM_PCIE_0_bvalid),
    .NOC_CPM_PCIE_0_rdata(NOC_CPM_PCIE_0_rdata),
    .NOC_CPM_PCIE_0_rid(NOC_CPM_PCIE_0_rid),
    .NOC_CPM_PCIE_0_rlast(NOC_CPM_PCIE_0_rlast),
    .NOC_CPM_PCIE_0_rresp(NOC_CPM_PCIE_0_rresp),
    .NOC_CPM_PCIE_0_rvalid(NOC_CPM_PCIE_0_rvalid),
    .NOC_CPM_PCIE_0_wready(NOC_CPM_PCIE_0_wready),
    .CPM_PCIE_NOC_0_araddr(CPM_PCIE_NOC_0_araddr),
    .CPM_PCIE_NOC_0_arburst(CPM_PCIE_NOC_0_arburst),
    .CPM_PCIE_NOC_0_arcache(CPM_PCIE_NOC_0_arcache),
    .CPM_PCIE_NOC_0_arid(CPM_PCIE_NOC_0_arid),
    .CPM_PCIE_NOC_0_arlen(CPM_PCIE_NOC_0_arlen),
    .CPM_PCIE_NOC_0_arlock(CPM_PCIE_NOC_0_arlock),
    .CPM_PCIE_NOC_0_arprot(CPM_PCIE_NOC_0_arprot),
    .CPM_PCIE_NOC_0_arqos(CPM_PCIE_NOC_0_arqos),
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
    .CPM_PCIE_NOC_0_awsize(CPM_PCIE_NOC_0_awsize),
    .CPM_PCIE_NOC_0_awuser(CPM_PCIE_NOC_0_awuser),
    .CPM_PCIE_NOC_0_awvalid(CPM_PCIE_NOC_0_awvalid),
    .CPM_PCIE_NOC_0_bready(CPM_PCIE_NOC_0_bready),
    .CPM_PCIE_NOC_0_rready(CPM_PCIE_NOC_0_rready),
    .CPM_PCIE_NOC_0_wdata(CPM_PCIE_NOC_0_wdata),
    .CPM_PCIE_NOC_0_wlast(CPM_PCIE_NOC_0_wlast),
    .CPM_PCIE_NOC_0_wstrb(CPM_PCIE_NOC_0_wstrb),
    .CPM_PCIE_NOC_0_wvalid(CPM_PCIE_NOC_0_wvalid),
    .CPM_PCIE_NOC_0_arready(CPM_PCIE_NOC_0_arready),
    .CPM_PCIE_NOC_0_awready(CPM_PCIE_NOC_0_awready),
    .CPM_PCIE_NOC_0_bid(CPM_PCIE_NOC_0_bid),
    .CPM_PCIE_NOC_0_bresp(CPM_PCIE_NOC_0_bresp),
    .CPM_PCIE_NOC_0_bvalid(CPM_PCIE_NOC_0_bvalid),
    .CPM_PCIE_NOC_0_rdata(CPM_PCIE_NOC_0_rdata),
    .CPM_PCIE_NOC_0_rid(CPM_PCIE_NOC_0_rid),
    .CPM_PCIE_NOC_0_rlast(CPM_PCIE_NOC_0_rlast),
    .CPM_PCIE_NOC_0_rresp(CPM_PCIE_NOC_0_rresp),
    .CPM_PCIE_NOC_0_rvalid(CPM_PCIE_NOC_0_rvalid),
    .CPM_PCIE_NOC_0_wready(CPM_PCIE_NOC_0_wready),
    .CPM_PCIE_NOC_1_araddr(CPM_PCIE_NOC_1_araddr),
    .CPM_PCIE_NOC_1_arburst(CPM_PCIE_NOC_1_arburst),
    .CPM_PCIE_NOC_1_arcache(CPM_PCIE_NOC_1_arcache),
    .CPM_PCIE_NOC_1_arid(CPM_PCIE_NOC_1_arid),
    .CPM_PCIE_NOC_1_arlen(CPM_PCIE_NOC_1_arlen),
    .CPM_PCIE_NOC_1_arlock(CPM_PCIE_NOC_1_arlock),
    .CPM_PCIE_NOC_1_arprot(CPM_PCIE_NOC_1_arprot),
    .CPM_PCIE_NOC_1_arqos(CPM_PCIE_NOC_1_arqos),
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
    .CPM_PCIE_NOC_1_awsize(CPM_PCIE_NOC_1_awsize),
    .CPM_PCIE_NOC_1_awuser(CPM_PCIE_NOC_1_awuser),
    .CPM_PCIE_NOC_1_awvalid(CPM_PCIE_NOC_1_awvalid),
    .CPM_PCIE_NOC_1_bready(CPM_PCIE_NOC_1_bready),
    .CPM_PCIE_NOC_1_rready(CPM_PCIE_NOC_1_rready),
    .CPM_PCIE_NOC_1_wdata(CPM_PCIE_NOC_1_wdata),
    .CPM_PCIE_NOC_1_wlast(CPM_PCIE_NOC_1_wlast),
    .CPM_PCIE_NOC_1_wstrb(CPM_PCIE_NOC_1_wstrb),
    .CPM_PCIE_NOC_1_wvalid(CPM_PCIE_NOC_1_wvalid),
    .CPM_PCIE_NOC_1_arready(CPM_PCIE_NOC_1_arready),
    .CPM_PCIE_NOC_1_awready(CPM_PCIE_NOC_1_awready),
    .CPM_PCIE_NOC_1_bid(CPM_PCIE_NOC_1_bid),
    .CPM_PCIE_NOC_1_bresp(CPM_PCIE_NOC_1_bresp),
    .CPM_PCIE_NOC_1_bvalid(CPM_PCIE_NOC_1_bvalid),
    .CPM_PCIE_NOC_1_rdata(CPM_PCIE_NOC_1_rdata),
    .CPM_PCIE_NOC_1_rid(CPM_PCIE_NOC_1_rid),
    .CPM_PCIE_NOC_1_rlast(CPM_PCIE_NOC_1_rlast),
    .CPM_PCIE_NOC_1_rresp(CPM_PCIE_NOC_1_rresp),
    .CPM_PCIE_NOC_1_rvalid(CPM_PCIE_NOC_1_rvalid),
    .CPM_PCIE_NOC_1_wready(CPM_PCIE_NOC_1_wready),
    .PCIE0_GT_gtx_n(PCIE0_GT_gtx_n),
    .PCIE0_GT_gtx_p(PCIE0_GT_gtx_p),
    .PCIE0_GT_grx_n(PCIE0_GT_grx_n),
    .PCIE0_GT_grx_p(PCIE0_GT_grx_p),
    .dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld),
    .dma0_mgmt_req_rdy(dma0_mgmt_req_rdy),
    .dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy),
    .dma0_mgmt_req_vld(dma0_mgmt_req_vld),
    .dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts),
    .dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat),
    .dma0_mgmt_req_cmd(dma0_mgmt_req_cmd),
    .dma0_mgmt_req_fnc(dma0_mgmt_req_fnc),
    .dma0_mgmt_req_msc(dma0_mgmt_req_msc),
    .dma0_mgmt_req_adr(dma0_mgmt_req_adr),
    .dma0_mgmt_req_dat(dma0_mgmt_req_dat),
    .dma0_st_rx_msg_tlast(dma0_st_rx_msg_tlast),
    .dma0_st_rx_msg_tvalid(dma0_st_rx_msg_tvalid),
    .dma0_st_rx_msg_tready(dma0_st_rx_msg_tready),
    .dma0_st_rx_msg_tdata(dma0_st_rx_msg_tdata),
    .gt_refclk0_clk_n(gt_refclk0_clk_n),
    .gt_refclk0_clk_p(gt_refclk0_clk_p)
  );
endmodule
