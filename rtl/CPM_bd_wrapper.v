//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Fri Sep 24 01:14:14 2021
//Host        : mcxlnx running 64-bit CentOS Linux release 7.7.1908 (Core)
//Command     : generate_target CPM_bd_wrapper.bd
//Design      : CPM_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module CPM_bd_wrapper
   (PCIE_grx_n,
    PCIE_grx_p,
    PCIE_gtx_n,
    PCIE_gtx_p,
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
  input [7:0]PCIE_grx_n;
  input [7:0]PCIE_grx_p;
  output [7:0]PCIE_gtx_n;
  output [7:0]PCIE_gtx_p;
  output ddr4_dimm1_act_n;
  output [16:0]ddr4_dimm1_adr;
  output [1:0]ddr4_dimm1_ba;
  output [1:0]ddr4_dimm1_bg;
  output ddr4_dimm1_ck_c;
  output ddr4_dimm1_ck_t;
  output ddr4_dimm1_cke;
  output ddr4_dimm1_cs_n;
  inout [7:0]ddr4_dimm1_dm_n;
  inout [63:0]ddr4_dimm1_dq;
  inout [7:0]ddr4_dimm1_dqs_c;
  inout [7:0]ddr4_dimm1_dqs_t;
  output ddr4_dimm1_odt;
  output ddr4_dimm1_reset_n;
  input ddr4_dimm1_sma_clk_clk_n;
  input ddr4_dimm1_sma_clk_clk_p;
  input gt_refclk_clk_n;
  input gt_refclk_clk_p;

  wire [7:0]PCIE_grx_n;
  wire [7:0]PCIE_grx_p;
  wire [7:0]PCIE_gtx_n;
  wire [7:0]PCIE_gtx_p;
  wire ddr4_dimm1_act_n;
  wire [16:0]ddr4_dimm1_adr;
  wire [1:0]ddr4_dimm1_ba;
  wire [1:0]ddr4_dimm1_bg;
  wire ddr4_dimm1_ck_c;
  wire ddr4_dimm1_ck_t;
  wire ddr4_dimm1_cke;
  wire ddr4_dimm1_cs_n;
  wire [7:0]ddr4_dimm1_dm_n;
  wire [63:0]ddr4_dimm1_dq;
  wire [7:0]ddr4_dimm1_dqs_c;
  wire [7:0]ddr4_dimm1_dqs_t;
  wire ddr4_dimm1_odt;
  wire ddr4_dimm1_reset_n;
  wire ddr4_dimm1_sma_clk_clk_n;
  wire ddr4_dimm1_sma_clk_clk_p;
  wire gt_refclk_clk_n;
  wire gt_refclk_clk_p;

  CPM_bd CPM_bd_i
       (.PCIE_grx_n(PCIE_grx_n),
        .PCIE_grx_p(PCIE_grx_p),
        .PCIE_gtx_n(PCIE_gtx_n),
        .PCIE_gtx_p(PCIE_gtx_p),
        .ddr4_dimm1_act_n(ddr4_dimm1_act_n),
        .ddr4_dimm1_adr(ddr4_dimm1_adr),
        .ddr4_dimm1_ba(ddr4_dimm1_ba),
        .ddr4_dimm1_bg(ddr4_dimm1_bg),
        .ddr4_dimm1_ck_c(ddr4_dimm1_ck_c),
        .ddr4_dimm1_ck_t(ddr4_dimm1_ck_t),
        .ddr4_dimm1_cke(ddr4_dimm1_cke),
        .ddr4_dimm1_cs_n(ddr4_dimm1_cs_n),
        .ddr4_dimm1_dm_n(ddr4_dimm1_dm_n),
        .ddr4_dimm1_dq(ddr4_dimm1_dq),
        .ddr4_dimm1_dqs_c(ddr4_dimm1_dqs_c),
        .ddr4_dimm1_dqs_t(ddr4_dimm1_dqs_t),
        .ddr4_dimm1_odt(ddr4_dimm1_odt),
        .ddr4_dimm1_reset_n(ddr4_dimm1_reset_n),
        .ddr4_dimm1_sma_clk_clk_n(ddr4_dimm1_sma_clk_clk_n),
        .ddr4_dimm1_sma_clk_clk_p(ddr4_dimm1_sma_clk_clk_p),
        .gt_refclk_clk_n(gt_refclk_clk_n),
        .gt_refclk_clk_p(gt_refclk_clk_p));
endmodule
