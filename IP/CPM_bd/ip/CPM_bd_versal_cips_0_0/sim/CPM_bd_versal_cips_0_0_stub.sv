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


//------------------------------------------------------------------------------------
// Filename:    CPM_bd_versal_cips_0_0_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//   Aldec Riviera-PRO Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module CPM_bd_versal_cips_0_0 (
  output bit_as_bool noc_cpm_pcie_axi0_clk,
  output bit_as_bool cpm_pcie_noc_axi0_clk,
  output bit_as_bool cpm_pcie_noc_axi1_clk,
  output bit_as_bool pcie0_user_clk,
  output bit_as_bool pcie0_user_lnk_up,
  output bit_as_bool cpm_misc_irq,
  output bit_as_bool cpm_cor_irq,
  output bit_as_bool cpm_uncor_irq,
  input bit_as_bool cpm_irq0,
  input bit_as_bool cpm_irq1,
  output bit_as_bool dma0_irq,
  output bit_as_bool dma0_axi_aresetn,
  input bit_as_bool dma0_soft_resetn,
  output bit [0 : 0] xdma0_usr_irq_ack,
  input bit [0 : 0] xdma0_usr_irq_req,
  input bit [63 : 0] NOC_CPM_PCIE_0_araddr,
  input bit [1 : 0] NOC_CPM_PCIE_0_arburst,
  input bit [3 : 0] NOC_CPM_PCIE_0_arcache,
  input bit [1 : 0] NOC_CPM_PCIE_0_arid,
  input bit [7 : 0] NOC_CPM_PCIE_0_arlen,
  input bit_as_bool NOC_CPM_PCIE_0_arlock,
  input bit [2 : 0] NOC_CPM_PCIE_0_arprot,
  input bit [3 : 0] NOC_CPM_PCIE_0_arqos,
  input bit [2 : 0] NOC_CPM_PCIE_0_arsize,
  input bit [17 : 0] NOC_CPM_PCIE_0_aruser,
  input bit_as_bool NOC_CPM_PCIE_0_arvalid,
  input bit [63 : 0] NOC_CPM_PCIE_0_awaddr,
  input bit [1 : 0] NOC_CPM_PCIE_0_awburst,
  input bit [3 : 0] NOC_CPM_PCIE_0_awcache,
  input bit [1 : 0] NOC_CPM_PCIE_0_awid,
  input bit [7 : 0] NOC_CPM_PCIE_0_awlen,
  input bit_as_bool NOC_CPM_PCIE_0_awlock,
  input bit [2 : 0] NOC_CPM_PCIE_0_awprot,
  input bit [3 : 0] NOC_CPM_PCIE_0_awqos,
  input bit [2 : 0] NOC_CPM_PCIE_0_awsize,
  input bit [17 : 0] NOC_CPM_PCIE_0_awuser,
  input bit_as_bool NOC_CPM_PCIE_0_awvalid,
  input bit_as_bool NOC_CPM_PCIE_0_bready,
  input bit_as_bool NOC_CPM_PCIE_0_rready,
  input bit [127 : 0] NOC_CPM_PCIE_0_wdata,
  input bit_as_bool NOC_CPM_PCIE_0_wlast,
  input bit [15 : 0] NOC_CPM_PCIE_0_wstrb,
  input bit_as_bool NOC_CPM_PCIE_0_wvalid,
  output bit_as_bool NOC_CPM_PCIE_0_arready,
  output bit_as_bool NOC_CPM_PCIE_0_awready,
  output bit [1 : 0] NOC_CPM_PCIE_0_bid,
  output bit [1 : 0] NOC_CPM_PCIE_0_bresp,
  output bit_as_bool NOC_CPM_PCIE_0_bvalid,
  output bit [127 : 0] NOC_CPM_PCIE_0_rdata,
  output bit [1 : 0] NOC_CPM_PCIE_0_rid,
  output bit_as_bool NOC_CPM_PCIE_0_rlast,
  output bit [1 : 0] NOC_CPM_PCIE_0_rresp,
  output bit_as_bool NOC_CPM_PCIE_0_rvalid,
  output bit_as_bool NOC_CPM_PCIE_0_wready,
  output bit [63 : 0] CPM_PCIE_NOC_0_araddr,
  output bit [1 : 0] CPM_PCIE_NOC_0_arburst,
  output bit [3 : 0] CPM_PCIE_NOC_0_arcache,
  output bit [15 : 0] CPM_PCIE_NOC_0_arid,
  output bit [7 : 0] CPM_PCIE_NOC_0_arlen,
  output bit_as_bool CPM_PCIE_NOC_0_arlock,
  output bit [2 : 0] CPM_PCIE_NOC_0_arprot,
  output bit [3 : 0] CPM_PCIE_NOC_0_arqos,
  output bit [2 : 0] CPM_PCIE_NOC_0_arsize,
  output bit [17 : 0] CPM_PCIE_NOC_0_aruser,
  output bit_as_bool CPM_PCIE_NOC_0_arvalid,
  output bit [63 : 0] CPM_PCIE_NOC_0_awaddr,
  output bit [1 : 0] CPM_PCIE_NOC_0_awburst,
  output bit [3 : 0] CPM_PCIE_NOC_0_awcache,
  output bit [15 : 0] CPM_PCIE_NOC_0_awid,
  output bit [7 : 0] CPM_PCIE_NOC_0_awlen,
  output bit_as_bool CPM_PCIE_NOC_0_awlock,
  output bit [2 : 0] CPM_PCIE_NOC_0_awprot,
  output bit [3 : 0] CPM_PCIE_NOC_0_awqos,
  output bit [2 : 0] CPM_PCIE_NOC_0_awsize,
  output bit [17 : 0] CPM_PCIE_NOC_0_awuser,
  output bit_as_bool CPM_PCIE_NOC_0_awvalid,
  output bit_as_bool CPM_PCIE_NOC_0_bready,
  output bit_as_bool CPM_PCIE_NOC_0_rready,
  output bit [127 : 0] CPM_PCIE_NOC_0_wdata,
  output bit_as_bool CPM_PCIE_NOC_0_wlast,
  output bit [15 : 0] CPM_PCIE_NOC_0_wstrb,
  output bit_as_bool CPM_PCIE_NOC_0_wvalid,
  input bit_as_bool CPM_PCIE_NOC_0_arready,
  input bit_as_bool CPM_PCIE_NOC_0_awready,
  input bit [15 : 0] CPM_PCIE_NOC_0_bid,
  input bit [1 : 0] CPM_PCIE_NOC_0_bresp,
  input bit_as_bool CPM_PCIE_NOC_0_bvalid,
  input bit [127 : 0] CPM_PCIE_NOC_0_rdata,
  input bit [15 : 0] CPM_PCIE_NOC_0_rid,
  input bit_as_bool CPM_PCIE_NOC_0_rlast,
  input bit [1 : 0] CPM_PCIE_NOC_0_rresp,
  input bit_as_bool CPM_PCIE_NOC_0_rvalid,
  input bit_as_bool CPM_PCIE_NOC_0_wready,
  output bit [63 : 0] CPM_PCIE_NOC_1_araddr,
  output bit [1 : 0] CPM_PCIE_NOC_1_arburst,
  output bit [3 : 0] CPM_PCIE_NOC_1_arcache,
  output bit [15 : 0] CPM_PCIE_NOC_1_arid,
  output bit [7 : 0] CPM_PCIE_NOC_1_arlen,
  output bit_as_bool CPM_PCIE_NOC_1_arlock,
  output bit [2 : 0] CPM_PCIE_NOC_1_arprot,
  output bit [3 : 0] CPM_PCIE_NOC_1_arqos,
  output bit [2 : 0] CPM_PCIE_NOC_1_arsize,
  output bit [17 : 0] CPM_PCIE_NOC_1_aruser,
  output bit_as_bool CPM_PCIE_NOC_1_arvalid,
  output bit [63 : 0] CPM_PCIE_NOC_1_awaddr,
  output bit [1 : 0] CPM_PCIE_NOC_1_awburst,
  output bit [3 : 0] CPM_PCIE_NOC_1_awcache,
  output bit [15 : 0] CPM_PCIE_NOC_1_awid,
  output bit [7 : 0] CPM_PCIE_NOC_1_awlen,
  output bit_as_bool CPM_PCIE_NOC_1_awlock,
  output bit [2 : 0] CPM_PCIE_NOC_1_awprot,
  output bit [3 : 0] CPM_PCIE_NOC_1_awqos,
  output bit [2 : 0] CPM_PCIE_NOC_1_awsize,
  output bit [17 : 0] CPM_PCIE_NOC_1_awuser,
  output bit_as_bool CPM_PCIE_NOC_1_awvalid,
  output bit_as_bool CPM_PCIE_NOC_1_bready,
  output bit_as_bool CPM_PCIE_NOC_1_rready,
  output bit [127 : 0] CPM_PCIE_NOC_1_wdata,
  output bit_as_bool CPM_PCIE_NOC_1_wlast,
  output bit [15 : 0] CPM_PCIE_NOC_1_wstrb,
  output bit_as_bool CPM_PCIE_NOC_1_wvalid,
  input bit_as_bool CPM_PCIE_NOC_1_arready,
  input bit_as_bool CPM_PCIE_NOC_1_awready,
  input bit [15 : 0] CPM_PCIE_NOC_1_bid,
  input bit [1 : 0] CPM_PCIE_NOC_1_bresp,
  input bit_as_bool CPM_PCIE_NOC_1_bvalid,
  input bit [127 : 0] CPM_PCIE_NOC_1_rdata,
  input bit [15 : 0] CPM_PCIE_NOC_1_rid,
  input bit_as_bool CPM_PCIE_NOC_1_rlast,
  input bit [1 : 0] CPM_PCIE_NOC_1_rresp,
  input bit_as_bool CPM_PCIE_NOC_1_rvalid,
  input bit_as_bool CPM_PCIE_NOC_1_wready,
  output bit [7 : 0] PCIE0_GT_gtx_n,
  output bit [7 : 0] PCIE0_GT_gtx_p,
  input bit [7 : 0] PCIE0_GT_grx_n,
  input bit [7 : 0] PCIE0_GT_grx_p,
  output bit_as_bool dma0_mgmt_cpl_vld,
  output bit_as_bool dma0_mgmt_req_rdy,
  input bit_as_bool dma0_mgmt_cpl_rdy,
  input bit_as_bool dma0_mgmt_req_vld,
  output bit [1 : 0] dma0_mgmt_cpl_sts,
  output bit [31 : 0] dma0_mgmt_cpl_dat,
  input bit [1 : 0] dma0_mgmt_req_cmd,
  input bit [7 : 0] dma0_mgmt_req_fnc,
  input bit [5 : 0] dma0_mgmt_req_msc,
  input bit [31 : 0] dma0_mgmt_req_adr,
  input bit [31 : 0] dma0_mgmt_req_dat,
  output bit_as_bool dma0_st_rx_msg_tlast,
  output bit_as_bool dma0_st_rx_msg_tvalid,
  input bit_as_bool dma0_st_rx_msg_tready,
  output bit [31 : 0] dma0_st_rx_msg_tdata,
  input bit_as_bool gt_refclk0_clk_n,
  input bit_as_bool gt_refclk0_clk_p
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module CPM_bd_versal_cips_0_0 (noc_cpm_pcie_axi0_clk,cpm_pcie_noc_axi0_clk,cpm_pcie_noc_axi1_clk,pcie0_user_clk,pcie0_user_lnk_up,cpm_misc_irq,cpm_cor_irq,cpm_uncor_irq,cpm_irq0,cpm_irq1,dma0_irq,dma0_axi_aresetn,dma0_soft_resetn,xdma0_usr_irq_ack,xdma0_usr_irq_req,NOC_CPM_PCIE_0_araddr,NOC_CPM_PCIE_0_arburst,NOC_CPM_PCIE_0_arcache,NOC_CPM_PCIE_0_arid,NOC_CPM_PCIE_0_arlen,NOC_CPM_PCIE_0_arlock,NOC_CPM_PCIE_0_arprot,NOC_CPM_PCIE_0_arqos,NOC_CPM_PCIE_0_arsize,NOC_CPM_PCIE_0_aruser,NOC_CPM_PCIE_0_arvalid,NOC_CPM_PCIE_0_awaddr,NOC_CPM_PCIE_0_awburst,NOC_CPM_PCIE_0_awcache,NOC_CPM_PCIE_0_awid,NOC_CPM_PCIE_0_awlen,NOC_CPM_PCIE_0_awlock,NOC_CPM_PCIE_0_awprot,NOC_CPM_PCIE_0_awqos,NOC_CPM_PCIE_0_awsize,NOC_CPM_PCIE_0_awuser,NOC_CPM_PCIE_0_awvalid,NOC_CPM_PCIE_0_bready,NOC_CPM_PCIE_0_rready,NOC_CPM_PCIE_0_wdata,NOC_CPM_PCIE_0_wlast,NOC_CPM_PCIE_0_wstrb,NOC_CPM_PCIE_0_wvalid,NOC_CPM_PCIE_0_arready,NOC_CPM_PCIE_0_awready,NOC_CPM_PCIE_0_bid,NOC_CPM_PCIE_0_bresp,NOC_CPM_PCIE_0_bvalid,NOC_CPM_PCIE_0_rdata,NOC_CPM_PCIE_0_rid,NOC_CPM_PCIE_0_rlast,NOC_CPM_PCIE_0_rresp,NOC_CPM_PCIE_0_rvalid,NOC_CPM_PCIE_0_wready,CPM_PCIE_NOC_0_araddr,CPM_PCIE_NOC_0_arburst,CPM_PCIE_NOC_0_arcache,CPM_PCIE_NOC_0_arid,CPM_PCIE_NOC_0_arlen,CPM_PCIE_NOC_0_arlock,CPM_PCIE_NOC_0_arprot,CPM_PCIE_NOC_0_arqos,CPM_PCIE_NOC_0_arsize,CPM_PCIE_NOC_0_aruser,CPM_PCIE_NOC_0_arvalid,CPM_PCIE_NOC_0_awaddr,CPM_PCIE_NOC_0_awburst,CPM_PCIE_NOC_0_awcache,CPM_PCIE_NOC_0_awid,CPM_PCIE_NOC_0_awlen,CPM_PCIE_NOC_0_awlock,CPM_PCIE_NOC_0_awprot,CPM_PCIE_NOC_0_awqos,CPM_PCIE_NOC_0_awsize,CPM_PCIE_NOC_0_awuser,CPM_PCIE_NOC_0_awvalid,CPM_PCIE_NOC_0_bready,CPM_PCIE_NOC_0_rready,CPM_PCIE_NOC_0_wdata,CPM_PCIE_NOC_0_wlast,CPM_PCIE_NOC_0_wstrb,CPM_PCIE_NOC_0_wvalid,CPM_PCIE_NOC_0_arready,CPM_PCIE_NOC_0_awready,CPM_PCIE_NOC_0_bid,CPM_PCIE_NOC_0_bresp,CPM_PCIE_NOC_0_bvalid,CPM_PCIE_NOC_0_rdata,CPM_PCIE_NOC_0_rid,CPM_PCIE_NOC_0_rlast,CPM_PCIE_NOC_0_rresp,CPM_PCIE_NOC_0_rvalid,CPM_PCIE_NOC_0_wready,CPM_PCIE_NOC_1_araddr,CPM_PCIE_NOC_1_arburst,CPM_PCIE_NOC_1_arcache,CPM_PCIE_NOC_1_arid,CPM_PCIE_NOC_1_arlen,CPM_PCIE_NOC_1_arlock,CPM_PCIE_NOC_1_arprot,CPM_PCIE_NOC_1_arqos,CPM_PCIE_NOC_1_arsize,CPM_PCIE_NOC_1_aruser,CPM_PCIE_NOC_1_arvalid,CPM_PCIE_NOC_1_awaddr,CPM_PCIE_NOC_1_awburst,CPM_PCIE_NOC_1_awcache,CPM_PCIE_NOC_1_awid,CPM_PCIE_NOC_1_awlen,CPM_PCIE_NOC_1_awlock,CPM_PCIE_NOC_1_awprot,CPM_PCIE_NOC_1_awqos,CPM_PCIE_NOC_1_awsize,CPM_PCIE_NOC_1_awuser,CPM_PCIE_NOC_1_awvalid,CPM_PCIE_NOC_1_bready,CPM_PCIE_NOC_1_rready,CPM_PCIE_NOC_1_wdata,CPM_PCIE_NOC_1_wlast,CPM_PCIE_NOC_1_wstrb,CPM_PCIE_NOC_1_wvalid,CPM_PCIE_NOC_1_arready,CPM_PCIE_NOC_1_awready,CPM_PCIE_NOC_1_bid,CPM_PCIE_NOC_1_bresp,CPM_PCIE_NOC_1_bvalid,CPM_PCIE_NOC_1_rdata,CPM_PCIE_NOC_1_rid,CPM_PCIE_NOC_1_rlast,CPM_PCIE_NOC_1_rresp,CPM_PCIE_NOC_1_rvalid,CPM_PCIE_NOC_1_wready,PCIE0_GT_gtx_n,PCIE0_GT_gtx_p,PCIE0_GT_grx_n,PCIE0_GT_grx_p,dma0_mgmt_cpl_vld,dma0_mgmt_req_rdy,dma0_mgmt_cpl_rdy,dma0_mgmt_req_vld,dma0_mgmt_cpl_sts,dma0_mgmt_cpl_dat,dma0_mgmt_req_cmd,dma0_mgmt_req_fnc,dma0_mgmt_req_msc,dma0_mgmt_req_adr,dma0_mgmt_req_dat,dma0_st_rx_msg_tlast,dma0_st_rx_msg_tvalid,dma0_st_rx_msg_tready,dma0_st_rx_msg_tdata,gt_refclk0_clk_n,gt_refclk0_clk_p)
(* integer foreign = "SystemC";
*);
  output wire noc_cpm_pcie_axi0_clk;
  output wire cpm_pcie_noc_axi0_clk;
  output wire cpm_pcie_noc_axi1_clk;
  output wire pcie0_user_clk;
  output wire pcie0_user_lnk_up;
  output wire cpm_misc_irq;
  output wire cpm_cor_irq;
  output wire cpm_uncor_irq;
  input bit cpm_irq0;
  input bit cpm_irq1;
  output wire dma0_irq;
  output wire dma0_axi_aresetn;
  input bit dma0_soft_resetn;
  output wire [0 : 0] xdma0_usr_irq_ack;
  input bit [0 : 0] xdma0_usr_irq_req;
  input bit [63 : 0] NOC_CPM_PCIE_0_araddr;
  input bit [1 : 0] NOC_CPM_PCIE_0_arburst;
  input bit [3 : 0] NOC_CPM_PCIE_0_arcache;
  input bit [1 : 0] NOC_CPM_PCIE_0_arid;
  input bit [7 : 0] NOC_CPM_PCIE_0_arlen;
  input bit NOC_CPM_PCIE_0_arlock;
  input bit [2 : 0] NOC_CPM_PCIE_0_arprot;
  input bit [3 : 0] NOC_CPM_PCIE_0_arqos;
  input bit [2 : 0] NOC_CPM_PCIE_0_arsize;
  input bit [17 : 0] NOC_CPM_PCIE_0_aruser;
  input bit NOC_CPM_PCIE_0_arvalid;
  input bit [63 : 0] NOC_CPM_PCIE_0_awaddr;
  input bit [1 : 0] NOC_CPM_PCIE_0_awburst;
  input bit [3 : 0] NOC_CPM_PCIE_0_awcache;
  input bit [1 : 0] NOC_CPM_PCIE_0_awid;
  input bit [7 : 0] NOC_CPM_PCIE_0_awlen;
  input bit NOC_CPM_PCIE_0_awlock;
  input bit [2 : 0] NOC_CPM_PCIE_0_awprot;
  input bit [3 : 0] NOC_CPM_PCIE_0_awqos;
  input bit [2 : 0] NOC_CPM_PCIE_0_awsize;
  input bit [17 : 0] NOC_CPM_PCIE_0_awuser;
  input bit NOC_CPM_PCIE_0_awvalid;
  input bit NOC_CPM_PCIE_0_bready;
  input bit NOC_CPM_PCIE_0_rready;
  input bit [127 : 0] NOC_CPM_PCIE_0_wdata;
  input bit NOC_CPM_PCIE_0_wlast;
  input bit [15 : 0] NOC_CPM_PCIE_0_wstrb;
  input bit NOC_CPM_PCIE_0_wvalid;
  output wire NOC_CPM_PCIE_0_arready;
  output wire NOC_CPM_PCIE_0_awready;
  output wire [1 : 0] NOC_CPM_PCIE_0_bid;
  output wire [1 : 0] NOC_CPM_PCIE_0_bresp;
  output wire NOC_CPM_PCIE_0_bvalid;
  output wire [127 : 0] NOC_CPM_PCIE_0_rdata;
  output wire [1 : 0] NOC_CPM_PCIE_0_rid;
  output wire NOC_CPM_PCIE_0_rlast;
  output wire [1 : 0] NOC_CPM_PCIE_0_rresp;
  output wire NOC_CPM_PCIE_0_rvalid;
  output wire NOC_CPM_PCIE_0_wready;
  output wire [63 : 0] CPM_PCIE_NOC_0_araddr;
  output wire [1 : 0] CPM_PCIE_NOC_0_arburst;
  output wire [3 : 0] CPM_PCIE_NOC_0_arcache;
  output wire [15 : 0] CPM_PCIE_NOC_0_arid;
  output wire [7 : 0] CPM_PCIE_NOC_0_arlen;
  output wire CPM_PCIE_NOC_0_arlock;
  output wire [2 : 0] CPM_PCIE_NOC_0_arprot;
  output wire [3 : 0] CPM_PCIE_NOC_0_arqos;
  output wire [2 : 0] CPM_PCIE_NOC_0_arsize;
  output wire [17 : 0] CPM_PCIE_NOC_0_aruser;
  output wire CPM_PCIE_NOC_0_arvalid;
  output wire [63 : 0] CPM_PCIE_NOC_0_awaddr;
  output wire [1 : 0] CPM_PCIE_NOC_0_awburst;
  output wire [3 : 0] CPM_PCIE_NOC_0_awcache;
  output wire [15 : 0] CPM_PCIE_NOC_0_awid;
  output wire [7 : 0] CPM_PCIE_NOC_0_awlen;
  output wire CPM_PCIE_NOC_0_awlock;
  output wire [2 : 0] CPM_PCIE_NOC_0_awprot;
  output wire [3 : 0] CPM_PCIE_NOC_0_awqos;
  output wire [2 : 0] CPM_PCIE_NOC_0_awsize;
  output wire [17 : 0] CPM_PCIE_NOC_0_awuser;
  output wire CPM_PCIE_NOC_0_awvalid;
  output wire CPM_PCIE_NOC_0_bready;
  output wire CPM_PCIE_NOC_0_rready;
  output wire [127 : 0] CPM_PCIE_NOC_0_wdata;
  output wire CPM_PCIE_NOC_0_wlast;
  output wire [15 : 0] CPM_PCIE_NOC_0_wstrb;
  output wire CPM_PCIE_NOC_0_wvalid;
  input bit CPM_PCIE_NOC_0_arready;
  input bit CPM_PCIE_NOC_0_awready;
  input bit [15 : 0] CPM_PCIE_NOC_0_bid;
  input bit [1 : 0] CPM_PCIE_NOC_0_bresp;
  input bit CPM_PCIE_NOC_0_bvalid;
  input bit [127 : 0] CPM_PCIE_NOC_0_rdata;
  input bit [15 : 0] CPM_PCIE_NOC_0_rid;
  input bit CPM_PCIE_NOC_0_rlast;
  input bit [1 : 0] CPM_PCIE_NOC_0_rresp;
  input bit CPM_PCIE_NOC_0_rvalid;
  input bit CPM_PCIE_NOC_0_wready;
  output wire [63 : 0] CPM_PCIE_NOC_1_araddr;
  output wire [1 : 0] CPM_PCIE_NOC_1_arburst;
  output wire [3 : 0] CPM_PCIE_NOC_1_arcache;
  output wire [15 : 0] CPM_PCIE_NOC_1_arid;
  output wire [7 : 0] CPM_PCIE_NOC_1_arlen;
  output wire CPM_PCIE_NOC_1_arlock;
  output wire [2 : 0] CPM_PCIE_NOC_1_arprot;
  output wire [3 : 0] CPM_PCIE_NOC_1_arqos;
  output wire [2 : 0] CPM_PCIE_NOC_1_arsize;
  output wire [17 : 0] CPM_PCIE_NOC_1_aruser;
  output wire CPM_PCIE_NOC_1_arvalid;
  output wire [63 : 0] CPM_PCIE_NOC_1_awaddr;
  output wire [1 : 0] CPM_PCIE_NOC_1_awburst;
  output wire [3 : 0] CPM_PCIE_NOC_1_awcache;
  output wire [15 : 0] CPM_PCIE_NOC_1_awid;
  output wire [7 : 0] CPM_PCIE_NOC_1_awlen;
  output wire CPM_PCIE_NOC_1_awlock;
  output wire [2 : 0] CPM_PCIE_NOC_1_awprot;
  output wire [3 : 0] CPM_PCIE_NOC_1_awqos;
  output wire [2 : 0] CPM_PCIE_NOC_1_awsize;
  output wire [17 : 0] CPM_PCIE_NOC_1_awuser;
  output wire CPM_PCIE_NOC_1_awvalid;
  output wire CPM_PCIE_NOC_1_bready;
  output wire CPM_PCIE_NOC_1_rready;
  output wire [127 : 0] CPM_PCIE_NOC_1_wdata;
  output wire CPM_PCIE_NOC_1_wlast;
  output wire [15 : 0] CPM_PCIE_NOC_1_wstrb;
  output wire CPM_PCIE_NOC_1_wvalid;
  input bit CPM_PCIE_NOC_1_arready;
  input bit CPM_PCIE_NOC_1_awready;
  input bit [15 : 0] CPM_PCIE_NOC_1_bid;
  input bit [1 : 0] CPM_PCIE_NOC_1_bresp;
  input bit CPM_PCIE_NOC_1_bvalid;
  input bit [127 : 0] CPM_PCIE_NOC_1_rdata;
  input bit [15 : 0] CPM_PCIE_NOC_1_rid;
  input bit CPM_PCIE_NOC_1_rlast;
  input bit [1 : 0] CPM_PCIE_NOC_1_rresp;
  input bit CPM_PCIE_NOC_1_rvalid;
  input bit CPM_PCIE_NOC_1_wready;
  output wire [7 : 0] PCIE0_GT_gtx_n;
  output wire [7 : 0] PCIE0_GT_gtx_p;
  input bit [7 : 0] PCIE0_GT_grx_n;
  input bit [7 : 0] PCIE0_GT_grx_p;
  output wire dma0_mgmt_cpl_vld;
  output wire dma0_mgmt_req_rdy;
  input bit dma0_mgmt_cpl_rdy;
  input bit dma0_mgmt_req_vld;
  output wire [1 : 0] dma0_mgmt_cpl_sts;
  output wire [31 : 0] dma0_mgmt_cpl_dat;
  input bit [1 : 0] dma0_mgmt_req_cmd;
  input bit [7 : 0] dma0_mgmt_req_fnc;
  input bit [5 : 0] dma0_mgmt_req_msc;
  input bit [31 : 0] dma0_mgmt_req_adr;
  input bit [31 : 0] dma0_mgmt_req_dat;
  output wire dma0_st_rx_msg_tlast;
  output wire dma0_st_rx_msg_tvalid;
  input bit dma0_st_rx_msg_tready;
  output wire [31 : 0] dma0_st_rx_msg_tdata;
  input bit gt_refclk0_clk_n;
  input bit gt_refclk0_clk_p;
endmodule
`endif

`ifdef RIVIERA
(* SC_MODULE_EXPORT *)
module CPM_bd_versal_cips_0_0 (noc_cpm_pcie_axi0_clk,cpm_pcie_noc_axi0_clk,cpm_pcie_noc_axi1_clk,pcie0_user_clk,pcie0_user_lnk_up,cpm_misc_irq,cpm_cor_irq,cpm_uncor_irq,cpm_irq0,cpm_irq1,dma0_irq,dma0_axi_aresetn,dma0_soft_resetn,xdma0_usr_irq_ack,xdma0_usr_irq_req,NOC_CPM_PCIE_0_araddr,NOC_CPM_PCIE_0_arburst,NOC_CPM_PCIE_0_arcache,NOC_CPM_PCIE_0_arid,NOC_CPM_PCIE_0_arlen,NOC_CPM_PCIE_0_arlock,NOC_CPM_PCIE_0_arprot,NOC_CPM_PCIE_0_arqos,NOC_CPM_PCIE_0_arsize,NOC_CPM_PCIE_0_aruser,NOC_CPM_PCIE_0_arvalid,NOC_CPM_PCIE_0_awaddr,NOC_CPM_PCIE_0_awburst,NOC_CPM_PCIE_0_awcache,NOC_CPM_PCIE_0_awid,NOC_CPM_PCIE_0_awlen,NOC_CPM_PCIE_0_awlock,NOC_CPM_PCIE_0_awprot,NOC_CPM_PCIE_0_awqos,NOC_CPM_PCIE_0_awsize,NOC_CPM_PCIE_0_awuser,NOC_CPM_PCIE_0_awvalid,NOC_CPM_PCIE_0_bready,NOC_CPM_PCIE_0_rready,NOC_CPM_PCIE_0_wdata,NOC_CPM_PCIE_0_wlast,NOC_CPM_PCIE_0_wstrb,NOC_CPM_PCIE_0_wvalid,NOC_CPM_PCIE_0_arready,NOC_CPM_PCIE_0_awready,NOC_CPM_PCIE_0_bid,NOC_CPM_PCIE_0_bresp,NOC_CPM_PCIE_0_bvalid,NOC_CPM_PCIE_0_rdata,NOC_CPM_PCIE_0_rid,NOC_CPM_PCIE_0_rlast,NOC_CPM_PCIE_0_rresp,NOC_CPM_PCIE_0_rvalid,NOC_CPM_PCIE_0_wready,CPM_PCIE_NOC_0_araddr,CPM_PCIE_NOC_0_arburst,CPM_PCIE_NOC_0_arcache,CPM_PCIE_NOC_0_arid,CPM_PCIE_NOC_0_arlen,CPM_PCIE_NOC_0_arlock,CPM_PCIE_NOC_0_arprot,CPM_PCIE_NOC_0_arqos,CPM_PCIE_NOC_0_arsize,CPM_PCIE_NOC_0_aruser,CPM_PCIE_NOC_0_arvalid,CPM_PCIE_NOC_0_awaddr,CPM_PCIE_NOC_0_awburst,CPM_PCIE_NOC_0_awcache,CPM_PCIE_NOC_0_awid,CPM_PCIE_NOC_0_awlen,CPM_PCIE_NOC_0_awlock,CPM_PCIE_NOC_0_awprot,CPM_PCIE_NOC_0_awqos,CPM_PCIE_NOC_0_awsize,CPM_PCIE_NOC_0_awuser,CPM_PCIE_NOC_0_awvalid,CPM_PCIE_NOC_0_bready,CPM_PCIE_NOC_0_rready,CPM_PCIE_NOC_0_wdata,CPM_PCIE_NOC_0_wlast,CPM_PCIE_NOC_0_wstrb,CPM_PCIE_NOC_0_wvalid,CPM_PCIE_NOC_0_arready,CPM_PCIE_NOC_0_awready,CPM_PCIE_NOC_0_bid,CPM_PCIE_NOC_0_bresp,CPM_PCIE_NOC_0_bvalid,CPM_PCIE_NOC_0_rdata,CPM_PCIE_NOC_0_rid,CPM_PCIE_NOC_0_rlast,CPM_PCIE_NOC_0_rresp,CPM_PCIE_NOC_0_rvalid,CPM_PCIE_NOC_0_wready,CPM_PCIE_NOC_1_araddr,CPM_PCIE_NOC_1_arburst,CPM_PCIE_NOC_1_arcache,CPM_PCIE_NOC_1_arid,CPM_PCIE_NOC_1_arlen,CPM_PCIE_NOC_1_arlock,CPM_PCIE_NOC_1_arprot,CPM_PCIE_NOC_1_arqos,CPM_PCIE_NOC_1_arsize,CPM_PCIE_NOC_1_aruser,CPM_PCIE_NOC_1_arvalid,CPM_PCIE_NOC_1_awaddr,CPM_PCIE_NOC_1_awburst,CPM_PCIE_NOC_1_awcache,CPM_PCIE_NOC_1_awid,CPM_PCIE_NOC_1_awlen,CPM_PCIE_NOC_1_awlock,CPM_PCIE_NOC_1_awprot,CPM_PCIE_NOC_1_awqos,CPM_PCIE_NOC_1_awsize,CPM_PCIE_NOC_1_awuser,CPM_PCIE_NOC_1_awvalid,CPM_PCIE_NOC_1_bready,CPM_PCIE_NOC_1_rready,CPM_PCIE_NOC_1_wdata,CPM_PCIE_NOC_1_wlast,CPM_PCIE_NOC_1_wstrb,CPM_PCIE_NOC_1_wvalid,CPM_PCIE_NOC_1_arready,CPM_PCIE_NOC_1_awready,CPM_PCIE_NOC_1_bid,CPM_PCIE_NOC_1_bresp,CPM_PCIE_NOC_1_bvalid,CPM_PCIE_NOC_1_rdata,CPM_PCIE_NOC_1_rid,CPM_PCIE_NOC_1_rlast,CPM_PCIE_NOC_1_rresp,CPM_PCIE_NOC_1_rvalid,CPM_PCIE_NOC_1_wready,PCIE0_GT_gtx_n,PCIE0_GT_gtx_p,PCIE0_GT_grx_n,PCIE0_GT_grx_p,dma0_mgmt_cpl_vld,dma0_mgmt_req_rdy,dma0_mgmt_cpl_rdy,dma0_mgmt_req_vld,dma0_mgmt_cpl_sts,dma0_mgmt_cpl_dat,dma0_mgmt_req_cmd,dma0_mgmt_req_fnc,dma0_mgmt_req_msc,dma0_mgmt_req_adr,dma0_mgmt_req_dat,dma0_st_rx_msg_tlast,dma0_st_rx_msg_tvalid,dma0_st_rx_msg_tready,dma0_st_rx_msg_tdata,gt_refclk0_clk_n,gt_refclk0_clk_p)
  output wire noc_cpm_pcie_axi0_clk;
  output wire cpm_pcie_noc_axi0_clk;
  output wire cpm_pcie_noc_axi1_clk;
  output wire pcie0_user_clk;
  output wire pcie0_user_lnk_up;
  output wire cpm_misc_irq;
  output wire cpm_cor_irq;
  output wire cpm_uncor_irq;
  input bit cpm_irq0;
  input bit cpm_irq1;
  output wire dma0_irq;
  output wire dma0_axi_aresetn;
  input bit dma0_soft_resetn;
  output wire [0 : 0] xdma0_usr_irq_ack;
  input bit [0 : 0] xdma0_usr_irq_req;
  input bit [63 : 0] NOC_CPM_PCIE_0_araddr;
  input bit [1 : 0] NOC_CPM_PCIE_0_arburst;
  input bit [3 : 0] NOC_CPM_PCIE_0_arcache;
  input bit [1 : 0] NOC_CPM_PCIE_0_arid;
  input bit [7 : 0] NOC_CPM_PCIE_0_arlen;
  input bit NOC_CPM_PCIE_0_arlock;
  input bit [2 : 0] NOC_CPM_PCIE_0_arprot;
  input bit [3 : 0] NOC_CPM_PCIE_0_arqos;
  input bit [2 : 0] NOC_CPM_PCIE_0_arsize;
  input bit [17 : 0] NOC_CPM_PCIE_0_aruser;
  input bit NOC_CPM_PCIE_0_arvalid;
  input bit [63 : 0] NOC_CPM_PCIE_0_awaddr;
  input bit [1 : 0] NOC_CPM_PCIE_0_awburst;
  input bit [3 : 0] NOC_CPM_PCIE_0_awcache;
  input bit [1 : 0] NOC_CPM_PCIE_0_awid;
  input bit [7 : 0] NOC_CPM_PCIE_0_awlen;
  input bit NOC_CPM_PCIE_0_awlock;
  input bit [2 : 0] NOC_CPM_PCIE_0_awprot;
  input bit [3 : 0] NOC_CPM_PCIE_0_awqos;
  input bit [2 : 0] NOC_CPM_PCIE_0_awsize;
  input bit [17 : 0] NOC_CPM_PCIE_0_awuser;
  input bit NOC_CPM_PCIE_0_awvalid;
  input bit NOC_CPM_PCIE_0_bready;
  input bit NOC_CPM_PCIE_0_rready;
  input bit [127 : 0] NOC_CPM_PCIE_0_wdata;
  input bit NOC_CPM_PCIE_0_wlast;
  input bit [15 : 0] NOC_CPM_PCIE_0_wstrb;
  input bit NOC_CPM_PCIE_0_wvalid;
  output wire NOC_CPM_PCIE_0_arready;
  output wire NOC_CPM_PCIE_0_awready;
  output wire [1 : 0] NOC_CPM_PCIE_0_bid;
  output wire [1 : 0] NOC_CPM_PCIE_0_bresp;
  output wire NOC_CPM_PCIE_0_bvalid;
  output wire [127 : 0] NOC_CPM_PCIE_0_rdata;
  output wire [1 : 0] NOC_CPM_PCIE_0_rid;
  output wire NOC_CPM_PCIE_0_rlast;
  output wire [1 : 0] NOC_CPM_PCIE_0_rresp;
  output wire NOC_CPM_PCIE_0_rvalid;
  output wire NOC_CPM_PCIE_0_wready;
  output wire [63 : 0] CPM_PCIE_NOC_0_araddr;
  output wire [1 : 0] CPM_PCIE_NOC_0_arburst;
  output wire [3 : 0] CPM_PCIE_NOC_0_arcache;
  output wire [15 : 0] CPM_PCIE_NOC_0_arid;
  output wire [7 : 0] CPM_PCIE_NOC_0_arlen;
  output wire CPM_PCIE_NOC_0_arlock;
  output wire [2 : 0] CPM_PCIE_NOC_0_arprot;
  output wire [3 : 0] CPM_PCIE_NOC_0_arqos;
  output wire [2 : 0] CPM_PCIE_NOC_0_arsize;
  output wire [17 : 0] CPM_PCIE_NOC_0_aruser;
  output wire CPM_PCIE_NOC_0_arvalid;
  output wire [63 : 0] CPM_PCIE_NOC_0_awaddr;
  output wire [1 : 0] CPM_PCIE_NOC_0_awburst;
  output wire [3 : 0] CPM_PCIE_NOC_0_awcache;
  output wire [15 : 0] CPM_PCIE_NOC_0_awid;
  output wire [7 : 0] CPM_PCIE_NOC_0_awlen;
  output wire CPM_PCIE_NOC_0_awlock;
  output wire [2 : 0] CPM_PCIE_NOC_0_awprot;
  output wire [3 : 0] CPM_PCIE_NOC_0_awqos;
  output wire [2 : 0] CPM_PCIE_NOC_0_awsize;
  output wire [17 : 0] CPM_PCIE_NOC_0_awuser;
  output wire CPM_PCIE_NOC_0_awvalid;
  output wire CPM_PCIE_NOC_0_bready;
  output wire CPM_PCIE_NOC_0_rready;
  output wire [127 : 0] CPM_PCIE_NOC_0_wdata;
  output wire CPM_PCIE_NOC_0_wlast;
  output wire [15 : 0] CPM_PCIE_NOC_0_wstrb;
  output wire CPM_PCIE_NOC_0_wvalid;
  input bit CPM_PCIE_NOC_0_arready;
  input bit CPM_PCIE_NOC_0_awready;
  input bit [15 : 0] CPM_PCIE_NOC_0_bid;
  input bit [1 : 0] CPM_PCIE_NOC_0_bresp;
  input bit CPM_PCIE_NOC_0_bvalid;
  input bit [127 : 0] CPM_PCIE_NOC_0_rdata;
  input bit [15 : 0] CPM_PCIE_NOC_0_rid;
  input bit CPM_PCIE_NOC_0_rlast;
  input bit [1 : 0] CPM_PCIE_NOC_0_rresp;
  input bit CPM_PCIE_NOC_0_rvalid;
  input bit CPM_PCIE_NOC_0_wready;
  output wire [63 : 0] CPM_PCIE_NOC_1_araddr;
  output wire [1 : 0] CPM_PCIE_NOC_1_arburst;
  output wire [3 : 0] CPM_PCIE_NOC_1_arcache;
  output wire [15 : 0] CPM_PCIE_NOC_1_arid;
  output wire [7 : 0] CPM_PCIE_NOC_1_arlen;
  output wire CPM_PCIE_NOC_1_arlock;
  output wire [2 : 0] CPM_PCIE_NOC_1_arprot;
  output wire [3 : 0] CPM_PCIE_NOC_1_arqos;
  output wire [2 : 0] CPM_PCIE_NOC_1_arsize;
  output wire [17 : 0] CPM_PCIE_NOC_1_aruser;
  output wire CPM_PCIE_NOC_1_arvalid;
  output wire [63 : 0] CPM_PCIE_NOC_1_awaddr;
  output wire [1 : 0] CPM_PCIE_NOC_1_awburst;
  output wire [3 : 0] CPM_PCIE_NOC_1_awcache;
  output wire [15 : 0] CPM_PCIE_NOC_1_awid;
  output wire [7 : 0] CPM_PCIE_NOC_1_awlen;
  output wire CPM_PCIE_NOC_1_awlock;
  output wire [2 : 0] CPM_PCIE_NOC_1_awprot;
  output wire [3 : 0] CPM_PCIE_NOC_1_awqos;
  output wire [2 : 0] CPM_PCIE_NOC_1_awsize;
  output wire [17 : 0] CPM_PCIE_NOC_1_awuser;
  output wire CPM_PCIE_NOC_1_awvalid;
  output wire CPM_PCIE_NOC_1_bready;
  output wire CPM_PCIE_NOC_1_rready;
  output wire [127 : 0] CPM_PCIE_NOC_1_wdata;
  output wire CPM_PCIE_NOC_1_wlast;
  output wire [15 : 0] CPM_PCIE_NOC_1_wstrb;
  output wire CPM_PCIE_NOC_1_wvalid;
  input bit CPM_PCIE_NOC_1_arready;
  input bit CPM_PCIE_NOC_1_awready;
  input bit [15 : 0] CPM_PCIE_NOC_1_bid;
  input bit [1 : 0] CPM_PCIE_NOC_1_bresp;
  input bit CPM_PCIE_NOC_1_bvalid;
  input bit [127 : 0] CPM_PCIE_NOC_1_rdata;
  input bit [15 : 0] CPM_PCIE_NOC_1_rid;
  input bit CPM_PCIE_NOC_1_rlast;
  input bit [1 : 0] CPM_PCIE_NOC_1_rresp;
  input bit CPM_PCIE_NOC_1_rvalid;
  input bit CPM_PCIE_NOC_1_wready;
  output wire [7 : 0] PCIE0_GT_gtx_n;
  output wire [7 : 0] PCIE0_GT_gtx_p;
  input bit [7 : 0] PCIE0_GT_grx_n;
  input bit [7 : 0] PCIE0_GT_grx_p;
  output wire dma0_mgmt_cpl_vld;
  output wire dma0_mgmt_req_rdy;
  input bit dma0_mgmt_cpl_rdy;
  input bit dma0_mgmt_req_vld;
  output wire [1 : 0] dma0_mgmt_cpl_sts;
  output wire [31 : 0] dma0_mgmt_cpl_dat;
  input bit [1 : 0] dma0_mgmt_req_cmd;
  input bit [7 : 0] dma0_mgmt_req_fnc;
  input bit [5 : 0] dma0_mgmt_req_msc;
  input bit [31 : 0] dma0_mgmt_req_adr;
  input bit [31 : 0] dma0_mgmt_req_dat;
  output wire dma0_st_rx_msg_tlast;
  output wire dma0_st_rx_msg_tvalid;
  input bit dma0_st_rx_msg_tready;
  output wire [31 : 0] dma0_st_rx_msg_tdata;
  input bit gt_refclk0_clk_n;
  input bit gt_refclk0_clk_p;
endmodule
`endif
