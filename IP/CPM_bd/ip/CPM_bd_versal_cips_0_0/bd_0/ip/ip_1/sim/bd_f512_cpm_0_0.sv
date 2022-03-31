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


// IP VLNV: xilinx.com:ip:cpm4:1.0
// IP Revision: 4

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_f512_cpm_0_0 (
  cpm_osc_clk_div2,
  m_axi0_ps_araddr,
  m_axi0_ps_arburst,
  m_axi0_ps_arcache,
  m_axi0_ps_arid,
  m_axi0_ps_arlen,
  m_axi0_ps_arlock,
  m_axi0_ps_arprot,
  m_axi0_ps_arqos,
  m_axi0_ps_arready,
  m_axi0_ps_arregion,
  m_axi0_ps_arsize,
  m_axi0_ps_aruser,
  m_axi0_ps_arvalid,
  m_axi0_ps_awaddr,
  m_axi0_ps_awburst,
  m_axi0_ps_awcache,
  m_axi0_ps_awid,
  m_axi0_ps_awlen,
  m_axi0_ps_awlock,
  m_axi0_ps_awprot,
  m_axi0_ps_awqos,
  m_axi0_ps_awready,
  m_axi0_ps_awregion,
  m_axi0_ps_awsize,
  m_axi0_ps_awuser,
  m_axi0_ps_awvalid,
  m_axi0_ps_bid,
  m_axi0_ps_bready,
  m_axi0_ps_bresp,
  m_axi0_ps_buser,
  m_axi0_ps_bvalid,
  m_axi0_ps_rdata,
  m_axi0_ps_rid,
  m_axi0_ps_rlast,
  m_axi0_ps_rready,
  m_axi0_ps_rresp,
  m_axi0_ps_ruser,
  m_axi0_ps_rvalid,
  m_axi0_ps_wdata,
  m_axi0_ps_wid,
  m_axi0_ps_wlast,
  m_axi0_ps_wready,
  m_axi0_ps_wstrb,
  m_axi0_ps_wuser,
  m_axi0_ps_wvalid,
  m_axi1_ps_araddr,
  m_axi1_ps_arburst,
  m_axi1_ps_arcache,
  m_axi1_ps_arid,
  m_axi1_ps_arlen,
  m_axi1_ps_arlock,
  m_axi1_ps_arprot,
  m_axi1_ps_arqos,
  m_axi1_ps_arready,
  m_axi1_ps_arregion,
  m_axi1_ps_arsize,
  m_axi1_ps_aruser,
  m_axi1_ps_arvalid,
  m_axi1_ps_awaddr,
  m_axi1_ps_awburst,
  m_axi1_ps_awcache,
  m_axi1_ps_awid,
  m_axi1_ps_awlen,
  m_axi1_ps_awlock,
  m_axi1_ps_awprot,
  m_axi1_ps_awqos,
  m_axi1_ps_awready,
  m_axi1_ps_awregion,
  m_axi1_ps_awsize,
  m_axi1_ps_awuser,
  m_axi1_ps_awvalid,
  m_axi1_ps_bid,
  m_axi1_ps_bready,
  m_axi1_ps_bresp,
  m_axi1_ps_buser,
  m_axi1_ps_bvalid,
  m_axi1_ps_rdata,
  m_axi1_ps_rid,
  m_axi1_ps_rlast,
  m_axi1_ps_rready,
  m_axi1_ps_rresp,
  m_axi1_ps_ruser,
  m_axi1_ps_rvalid,
  m_axi1_ps_wdata,
  m_axi1_ps_wid,
  m_axi1_ps_wlast,
  m_axi1_ps_wready,
  m_axi1_ps_wstrb,
  m_axi1_ps_wuser,
  m_axi1_ps_wvalid,
  cpmps_corr_irq,
  cpmps_misc_irq,
  cpmps_uncorr_irq,
  s_axi_cfg_araddr,
  s_axi_cfg_arburst,
  s_axi_cfg_arcache,
  s_axi_cfg_arid,
  s_axi_cfg_arlen,
  s_axi_cfg_arlock,
  s_axi_cfg_arprot,
  s_axi_cfg_arqos,
  s_axi_cfg_arready,
  s_axi_cfg_arregion,
  s_axi_cfg_arsize,
  s_axi_cfg_aruser,
  s_axi_cfg_arvalid,
  s_axi_cfg_awaddr,
  s_axi_cfg_awburst,
  s_axi_cfg_awcache,
  s_axi_cfg_awid,
  s_axi_cfg_awlen,
  s_axi_cfg_awlock,
  s_axi_cfg_awprot,
  s_axi_cfg_awqos,
  s_axi_cfg_awready,
  s_axi_cfg_awregion,
  s_axi_cfg_awsize,
  s_axi_cfg_awuser,
  s_axi_cfg_awvalid,
  s_axi_cfg_bid,
  s_axi_cfg_bready,
  s_axi_cfg_bresp,
  s_axi_cfg_buser,
  s_axi_cfg_bvalid,
  s_axi_cfg_rdata,
  s_axi_cfg_rid,
  s_axi_cfg_rlast,
  s_axi_cfg_rready,
  s_axi_cfg_rresp,
  s_axi_cfg_ruser,
  s_axi_cfg_rvalid,
  s_axi_cfg_wdata,
  s_axi_cfg_wid,
  s_axi_cfg_wlast,
  s_axi_cfg_wready,
  s_axi_cfg_wstrb,
  s_axi_cfg_wuser,
  s_axi_cfg_wvalid,
  xpipe0_powerdown,
  xpipe1_powerdown,
  xpipe2_powerdown,
  xpipe3_powerdown,
  xpipe4_powerdown,
  xpipe5_powerdown,
  xpipe6_powerdown,
  xpipe7_powerdown,
  xpipe8_powerdown,
  xpipe9_powerdown,
  xpipe10_powerdown,
  xpipe11_powerdown,
  xpipe12_powerdown,
  xpipe13_powerdown,
  xpipe14_powerdown,
  xpipe15_powerdown,
  xpipe1_phystatus,
  xpipe2_phystatus,
  xpipe3_phystatus,
  xpipe4_phystatus,
  xpipe5_phystatus,
  xpipe6_phystatus,
  xpipe7_phystatus,
  xpipe8_phystatus,
  xpipe9_phystatus,
  xpipe10_phystatus,
  xpipe11_phystatus,
  xpipe12_phystatus,
  xpipe13_phystatus,
  xpipe14_phystatus,
  xpipe15_phystatus,
  xpipe0_rx_charisk,
  xpipe1_rx_charisk,
  xpipe2_rx_charisk,
  xpipe3_rx_charisk,
  xpipe4_rx_charisk,
  xpipe5_rx_charisk,
  xpipe6_rx_charisk,
  xpipe7_rx_charisk,
  xpipe8_rx_charisk,
  xpipe9_rx_charisk,
  xpipe10_rx_charisk,
  xpipe11_rx_charisk,
  xpipe12_rx_charisk,
  xpipe13_rx_charisk,
  xpipe14_rx_charisk,
  xpipe15_rx_charisk,
  xpipe0_rx_data,
  xpipe1_rx_data,
  xpipe2_rx_data,
  xpipe3_rx_data,
  xpipe4_rx_data,
  xpipe5_rx_data,
  xpipe6_rx_data,
  xpipe7_rx_data,
  xpipe8_rx_data,
  xpipe9_rx_data,
  xpipe10_rx_data,
  xpipe11_rx_data,
  xpipe12_rx_data,
  xpipe13_rx_data,
  xpipe14_rx_data,
  xpipe15_rx_data,
  xpipe0_rx_datavalid,
  xpipe1_rx_datavalid,
  xpipe2_rx_datavalid,
  xpipe3_rx_datavalid,
  xpipe4_rx_datavalid,
  xpipe5_rx_datavalid,
  xpipe6_rx_datavalid,
  xpipe7_rx_datavalid,
  xpipe8_rx_datavalid,
  xpipe9_rx_datavalid,
  xpipe10_rx_datavalid,
  xpipe11_rx_datavalid,
  xpipe12_rx_datavalid,
  xpipe13_rx_datavalid,
  xpipe14_rx_datavalid,
  xpipe15_rx_datavalid,
  xpipe0_rx_elecidle,
  xpipe1_rx_elecidle,
  xpipe2_rx_elecidle,
  xpipe3_rx_elecidle,
  xpipe4_rx_elecidle,
  xpipe5_rx_elecidle,
  xpipe6_rx_elecidle,
  xpipe7_rx_elecidle,
  xpipe8_rx_elecidle,
  xpipe9_rx_elecidle,
  xpipe10_rx_elecidle,
  xpipe11_rx_elecidle,
  xpipe12_rx_elecidle,
  xpipe13_rx_elecidle,
  xpipe14_rx_elecidle,
  xpipe15_rx_elecidle,
  xpipe0_rx_polarity,
  xpipe1_rx_polarity,
  xpipe2_rx_polarity,
  xpipe3_rx_polarity,
  xpipe4_rx_polarity,
  xpipe5_rx_polarity,
  xpipe6_rx_polarity,
  xpipe7_rx_polarity,
  xpipe8_rx_polarity,
  xpipe9_rx_polarity,
  xpipe10_rx_polarity,
  xpipe11_rx_polarity,
  xpipe12_rx_polarity,
  xpipe13_rx_polarity,
  xpipe14_rx_polarity,
  xpipe15_rx_polarity,
  xpipe0_rx_startblock,
  xpipe1_rx_startblock,
  xpipe2_rx_startblock,
  xpipe3_rx_startblock,
  xpipe4_rx_startblock,
  xpipe5_rx_startblock,
  xpipe6_rx_startblock,
  xpipe7_rx_startblock,
  xpipe8_rx_startblock,
  xpipe9_rx_startblock,
  xpipe10_rx_startblock,
  xpipe11_rx_startblock,
  xpipe12_rx_startblock,
  xpipe13_rx_startblock,
  xpipe14_rx_startblock,
  xpipe15_rx_startblock,
  xpipe0_rx_status,
  xpipe1_rx_status,
  xpipe2_rx_status,
  xpipe3_rx_status,
  xpipe4_rx_status,
  xpipe5_rx_status,
  xpipe6_rx_status,
  xpipe7_rx_status,
  xpipe8_rx_status,
  xpipe9_rx_status,
  xpipe10_rx_status,
  xpipe11_rx_status,
  xpipe12_rx_status,
  xpipe13_rx_status,
  xpipe14_rx_status,
  xpipe15_rx_status,
  xpipe0_rx_syncheader,
  xpipe1_rx_syncheader,
  xpipe2_rx_syncheader,
  xpipe3_rx_syncheader,
  xpipe4_rx_syncheader,
  xpipe5_rx_syncheader,
  xpipe6_rx_syncheader,
  xpipe7_rx_syncheader,
  xpipe8_rx_syncheader,
  xpipe9_rx_syncheader,
  xpipe10_rx_syncheader,
  xpipe11_rx_syncheader,
  xpipe12_rx_syncheader,
  xpipe13_rx_syncheader,
  xpipe14_rx_syncheader,
  xpipe15_rx_syncheader,
  xpipe0_rx_termination,
  xpipe1_rx_termination,
  xpipe2_rx_termination,
  xpipe3_rx_termination,
  xpipe4_rx_termination,
  xpipe5_rx_termination,
  xpipe6_rx_termination,
  xpipe7_rx_termination,
  xpipe8_rx_termination,
  xpipe9_rx_termination,
  xpipe10_rx_termination,
  xpipe11_rx_termination,
  xpipe12_rx_termination,
  xpipe13_rx_termination,
  xpipe14_rx_termination,
  xpipe15_rx_termination,
  xpipe0_rx_valid,
  xpipe1_rx_valid,
  xpipe2_rx_valid,
  xpipe3_rx_valid,
  xpipe4_rx_valid,
  xpipe5_rx_valid,
  xpipe6_rx_valid,
  xpipe7_rx_valid,
  xpipe8_rx_valid,
  xpipe9_rx_valid,
  xpipe10_rx_valid,
  xpipe11_rx_valid,
  xpipe12_rx_valid,
  xpipe13_rx_valid,
  xpipe14_rx_valid,
  xpipe15_rx_valid,
  xpipe0_tx_charisk,
  xpipe1_tx_charisk,
  xpipe2_tx_charisk,
  xpipe3_tx_charisk,
  xpipe4_tx_charisk,
  xpipe5_tx_charisk,
  xpipe6_tx_charisk,
  xpipe7_tx_charisk,
  xpipe8_tx_charisk,
  xpipe9_tx_charisk,
  xpipe10_tx_charisk,
  xpipe11_tx_charisk,
  xpipe12_tx_charisk,
  xpipe13_tx_charisk,
  xpipe14_tx_charisk,
  xpipe15_tx_charisk,
  xpipe0_tx_compliance,
  xpipe1_tx_compliance,
  xpipe2_tx_compliance,
  xpipe3_tx_compliance,
  xpipe4_tx_compliance,
  xpipe5_tx_compliance,
  xpipe6_tx_compliance,
  xpipe7_tx_compliance,
  xpipe8_tx_compliance,
  xpipe9_tx_compliance,
  xpipe10_tx_compliance,
  xpipe11_tx_compliance,
  xpipe12_tx_compliance,
  xpipe13_tx_compliance,
  xpipe14_tx_compliance,
  xpipe15_tx_compliance,
  xpipe0_tx_data,
  xpipe1_tx_data,
  xpipe2_tx_data,
  xpipe3_tx_data,
  xpipe4_tx_data,
  xpipe5_tx_data,
  xpipe6_tx_data,
  xpipe7_tx_data,
  xpipe8_tx_data,
  xpipe9_tx_data,
  xpipe10_tx_data,
  xpipe11_tx_data,
  xpipe12_tx_data,
  xpipe13_tx_data,
  xpipe14_tx_data,
  xpipe15_tx_data,
  xpipe0_tx_datavalid,
  xpipe1_tx_datavalid,
  xpipe2_tx_datavalid,
  xpipe3_tx_datavalid,
  xpipe4_tx_datavalid,
  xpipe5_tx_datavalid,
  xpipe6_tx_datavalid,
  xpipe7_tx_datavalid,
  xpipe8_tx_datavalid,
  xpipe9_tx_datavalid,
  xpipe10_tx_datavalid,
  xpipe11_tx_datavalid,
  xpipe12_tx_datavalid,
  xpipe13_tx_datavalid,
  xpipe14_tx_datavalid,
  xpipe15_tx_datavalid,
  xpipe0_tx_deemph,
  xpipe1_tx_deemph,
  xpipe2_tx_deemph,
  xpipe3_tx_deemph,
  xpipe4_tx_deemph,
  xpipe5_tx_deemph,
  xpipe6_tx_deemph,
  xpipe7_tx_deemph,
  xpipe8_tx_deemph,
  xpipe9_tx_deemph,
  xpipe10_tx_deemph,
  xpipe11_tx_deemph,
  xpipe12_tx_deemph,
  xpipe13_tx_deemph,
  xpipe14_tx_deemph,
  xpipe15_tx_deemph,
  xpipe0_tx_detectrxloopback,
  xpipe1_tx_detectrxloopback,
  xpipe2_tx_detectrxloopback,
  xpipe3_tx_detectrxloopback,
  xpipe4_tx_detectrxloopback,
  xpipe5_tx_detectrxloopback,
  xpipe6_tx_detectrxloopback,
  xpipe7_tx_detectrxloopback,
  xpipe8_tx_detectrxloopback,
  xpipe9_tx_detectrxloopback,
  xpipe10_tx_detectrxloopback,
  xpipe11_tx_detectrxloopback,
  xpipe12_tx_detectrxloopback,
  xpipe13_tx_detectrxloopback,
  xpipe14_tx_detectrxloopback,
  xpipe15_tx_detectrxloopback,
  xpipe0_tx_elecidle,
  xpipe1_tx_elecidle,
  xpipe2_tx_elecidle,
  xpipe3_tx_elecidle,
  xpipe4_tx_elecidle,
  xpipe5_tx_elecidle,
  xpipe6_tx_elecidle,
  xpipe7_tx_elecidle,
  xpipe8_tx_elecidle,
  xpipe9_tx_elecidle,
  xpipe10_tx_elecidle,
  xpipe11_tx_elecidle,
  xpipe12_tx_elecidle,
  xpipe13_tx_elecidle,
  xpipe14_tx_elecidle,
  xpipe15_tx_elecidle,
  xpipe0_tx_maincursor,
  xpipe1_tx_maincursor,
  xpipe2_tx_maincursor,
  xpipe3_tx_maincursor,
  xpipe4_tx_maincursor,
  xpipe5_tx_maincursor,
  xpipe6_tx_maincursor,
  xpipe7_tx_maincursor,
  xpipe8_tx_maincursor,
  xpipe9_tx_maincursor,
  xpipe10_tx_maincursor,
  xpipe11_tx_maincursor,
  xpipe12_tx_maincursor,
  xpipe13_tx_maincursor,
  xpipe14_tx_maincursor,
  xpipe15_tx_maincursor,
  xpipe0_tx_margin,
  xpipe1_tx_margin,
  xpipe2_tx_margin,
  xpipe3_tx_margin,
  xpipe4_tx_margin,
  xpipe5_tx_margin,
  xpipe6_tx_margin,
  xpipe7_tx_margin,
  xpipe8_tx_margin,
  xpipe9_tx_margin,
  xpipe10_tx_margin,
  xpipe11_tx_margin,
  xpipe12_tx_margin,
  xpipe13_tx_margin,
  xpipe14_tx_margin,
  xpipe15_tx_margin,
  xpipe0_tx_postcursor,
  xpipe1_tx_postcursor,
  xpipe2_tx_postcursor,
  xpipe3_tx_postcursor,
  xpipe4_tx_postcursor,
  xpipe5_tx_postcursor,
  xpipe6_tx_postcursor,
  xpipe7_tx_postcursor,
  xpipe8_tx_postcursor,
  xpipe9_tx_postcursor,
  xpipe10_tx_postcursor,
  xpipe11_tx_postcursor,
  xpipe12_tx_postcursor,
  xpipe13_tx_postcursor,
  xpipe14_tx_postcursor,
  xpipe15_tx_postcursor,
  xpipe0_tx_precursor,
  xpipe1_tx_precursor,
  xpipe2_tx_precursor,
  xpipe3_tx_precursor,
  xpipe4_tx_precursor,
  xpipe5_tx_precursor,
  xpipe6_tx_precursor,
  xpipe7_tx_precursor,
  xpipe8_tx_precursor,
  xpipe9_tx_precursor,
  xpipe10_tx_precursor,
  xpipe11_tx_precursor,
  xpipe12_tx_precursor,
  xpipe13_tx_precursor,
  xpipe14_tx_precursor,
  xpipe15_tx_precursor,
  xpipe0_tx_startblock,
  xpipe1_tx_startblock,
  xpipe2_tx_startblock,
  xpipe3_tx_startblock,
  xpipe4_tx_startblock,
  xpipe5_tx_startblock,
  xpipe6_tx_startblock,
  xpipe7_tx_startblock,
  xpipe8_tx_startblock,
  xpipe9_tx_startblock,
  xpipe10_tx_startblock,
  xpipe11_tx_startblock,
  xpipe12_tx_startblock,
  xpipe13_tx_startblock,
  xpipe14_tx_startblock,
  xpipe15_tx_startblock,
  xpipe0_tx_swing,
  xpipe1_tx_swing,
  xpipe2_tx_swing,
  xpipe3_tx_swing,
  xpipe4_tx_swing,
  xpipe5_tx_swing,
  xpipe6_tx_swing,
  xpipe7_tx_swing,
  xpipe8_tx_swing,
  xpipe9_tx_swing,
  xpipe10_tx_swing,
  xpipe11_tx_swing,
  xpipe12_tx_swing,
  xpipe13_tx_swing,
  xpipe14_tx_swing,
  xpipe15_tx_swing,
  xpipe0_tx_syncheader,
  xpipe1_tx_syncheader,
  xpipe2_tx_syncheader,
  xpipe3_tx_syncheader,
  xpipe4_tx_syncheader,
  xpipe5_tx_syncheader,
  xpipe6_tx_syncheader,
  xpipe7_tx_syncheader,
  xpipe8_tx_syncheader,
  xpipe9_tx_syncheader,
  xpipe10_tx_syncheader,
  xpipe11_tx_syncheader,
  xpipe12_tx_syncheader,
  xpipe13_tx_syncheader,
  xpipe14_tx_syncheader,
  xpipe15_tx_syncheader,
  hsdp_xpipe0_rx_datavalid,
  hsdp_xpipe1_rx_datavalid,
  hsdp_xpipe2_rx_datavalid,
  hsdp_xpipe0_rx_gearboxslip,
  hsdp_xpipe1_rx_gearboxslip,
  hsdp_xpipe2_rx_gearboxslip,
  hsdp_xpipe0_rx_header,
  hsdp_xpipe1_rx_header,
  hsdp_xpipe2_rx_header,
  hsdp_xpipe0_rx_headervalid,
  hsdp_xpipe1_rx_headervalid,
  hsdp_xpipe2_rx_headervalid,
  hsdp_xpipe0_rx_pcsreset,
  hsdp_xpipe1_rx_pcsreset,
  hsdp_xpipe2_rx_pcsreset,
  hsdp_xpipe0_rx_resetdone,
  hsdp_xpipe1_rx_resetdone,
  hsdp_xpipe2_rx_resetdone,
  hsdp_xpipe0_tx_header,
  hsdp_xpipe1_tx_header,
  hsdp_xpipe2_tx_header,
  hsdp_xpipe0_tx_resetdone,
  hsdp_xpipe1_tx_resetdone,
  hsdp_xpipe2_tx_resetdone,
  hsdp_xpipe0_tx_sequence,
  hsdp_xpipe1_tx_sequence,
  hsdp_xpipe2_tx_sequence,
  hsdp_gt_rxoutclk,
  hsdp_gt_txusrclk,
  phy_ready_frbot,
  phy_ready_tobot,
  link0_xpipe_bufgtce,
  link1_xpipe_bufgtce,
  link0_xpipe_bufgtcemask,
  link1_xpipe_bufgtcemask,
  link0_xpipe_bufgtdiv,
  link1_xpipe_bufgtdiv,
  link0_xpipe_bufgtrst,
  link1_xpipe_bufgtrst,
  link0_xpipe_bufgtrstmask,
  link1_xpipe_bufgtrstmask,
  link0_xpipe_gtoutclk,
  link1_xpipe_gtoutclk,
  link0_xpipe_gtpipeclk,
  link1_xpipe_gtpipeclk,
  link0_xpipe_pcielinkreachtarget,
  link1_xpipe_pcielinkreachtarget,
  link0_xpipe_pcieltssmstate,
  link1_xpipe_pcieltssmstate,
  link0_xpipe_pcieperstn,
  link1_xpipe_pcieperstn,
  link0_xpipe_phyesmadaptationsave,
  link1_xpipe_phyesmadaptationsave,
  link0_xpipe_phyready,
  link1_xpipe_phyready,
  link0_xpipe_piperate,
  link1_xpipe_piperate,
  s_axi_pcie_araddr,
  s_axi_pcie_arburst,
  s_axi_pcie_arcache,
  s_axi_pcie_arid,
  s_axi_pcie_arlen,
  s_axi_pcie_arlock,
  s_axi_pcie_arprot,
  s_axi_pcie_arqos,
  s_axi_pcie_arready,
  s_axi_pcie_arregion,
  s_axi_pcie_arsize,
  s_axi_pcie_aruser,
  s_axi_pcie_arvalid,
  s_axi_pcie_awaddr,
  s_axi_pcie_awburst,
  s_axi_pcie_awcache,
  s_axi_pcie_awid,
  s_axi_pcie_awlen,
  s_axi_pcie_awlock,
  s_axi_pcie_awprot,
  s_axi_pcie_awqos,
  s_axi_pcie_awready,
  s_axi_pcie_awregion,
  s_axi_pcie_awsize,
  s_axi_pcie_awuser,
  s_axi_pcie_awvalid,
  s_axi_pcie_bid,
  s_axi_pcie_bready,
  s_axi_pcie_bresp,
  s_axi_pcie_buser,
  s_axi_pcie_bvalid,
  s_axi_pcie_rdata,
  s_axi_pcie_rid,
  s_axi_pcie_rlast,
  s_axi_pcie_rready,
  s_axi_pcie_rresp,
  s_axi_pcie_ruser,
  s_axi_pcie_rvalid,
  s_axi_pcie_wdata,
  s_axi_pcie_wid,
  s_axi_pcie_wlast,
  s_axi_pcie_wready,
  s_axi_pcie_wstrb,
  s_axi_pcie_wuser,
  s_axi_pcie_wvalid,
  cpm_pcr_apb_en,
  cpm_pcr_dis_npi_clk,
  cpm_pcr_fabric_en,
  cpm_pcr_gate_reg,
  cpm_pcr_hold_state,
  cpm_pcr_init_state,
  cpm_pcr_mem_clr,
  cpm_pcr_o_disable,
  cpm_pcr_pcomplete,
  cpm_pcr_pwr_dn,
  cpm_pcr_scan_clr,
  cpm_pcr_start_bisr,
  cpm_pcr_start_cal,
  cpm_pcr_tristate,
  xpipe_q0_rxmargin_req_ack,
  xpipe_q1_rxmargin_req_ack,
  xpipe_q2_rxmargin_req_ack,
  xpipe_q3_rxmargin_req_ack,
  xpipe_q0_rxmargin_req_cmd,
  xpipe_q1_rxmargin_req_cmd,
  xpipe_q2_rxmargin_req_cmd,
  xpipe_q3_rxmargin_req_cmd,
  xpipe_q0_rxmargin_req_lanenum,
  xpipe_q1_rxmargin_req_lanenum,
  xpipe_q2_rxmargin_req_lanenum,
  xpipe_q3_rxmargin_req_lanenum,
  xpipe_q0_rxmargin_req_payload,
  xpipe_q1_rxmargin_req_payload,
  xpipe_q2_rxmargin_req_payload,
  xpipe_q3_rxmargin_req_payload,
  xpipe_q0_rxmargin_req_req,
  xpipe_q1_rxmargin_req_req,
  xpipe_q2_rxmargin_req_req,
  xpipe_q3_rxmargin_req_req,
  xpipe_q0_rxmargin_res_ack,
  xpipe_q1_rxmargin_res_ack,
  xpipe_q2_rxmargin_res_ack,
  xpipe_q3_rxmargin_res_ack,
  xpipe_q0_rxmargin_res_cmd,
  xpipe_q1_rxmargin_res_cmd,
  xpipe_q2_rxmargin_res_cmd,
  xpipe_q3_rxmargin_res_cmd,
  xpipe_q0_rxmargin_res_lanenum,
  xpipe_q1_rxmargin_res_lanenum,
  xpipe_q2_rxmargin_res_lanenum,
  xpipe_q3_rxmargin_res_lanenum,
  xpipe_q0_rxmargin_res_payload,
  xpipe_q1_rxmargin_res_payload,
  xpipe_q2_rxmargin_res_payload,
  xpipe_q3_rxmargin_res_payload,
  xpipe_q0_rxmargin_res_req,
  xpipe_q1_rxmargin_res_req,
  xpipe_q2_rxmargin_res_req,
  xpipe_q3_rxmargin_res_req,
  lpd_refclk_in,
  lpd_switch_timeout_cnt,
  lpd_swclk,
  perst0n,
  perst1n,
  pcie0_user_clk,
  cpm_misc_irq,
  cpm_cor_irq,
  cpm_uncor_irq,
  cpm_irq0,
  cpm_irq1,
  dma0_irq,
  dma0_axi_aresetn,
  dma0_soft_resetn,
  pcie0_user_lnk_up,
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
  dma0_st_rx_msg_last,
  dma0_st_rx_msg_valid,
  dma0_st_rx_msg_rdy,
  dma0_st_rx_msg_data,
  xdma0_usr_irq_ack,
  xdma0_usr_irq_req,
  pcie0_gt_txn,
  pcie0_gt_txp,
  pcie0_gt_rxn,
  pcie0_gt_rxp,
  gt_refclk0_n,
  gt_refclk0_p
);

(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_osc_clk_div2" *)
input wire cpm_osc_clk_div2;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_araddr" *)
output wire [63 : 0] m_axi0_ps_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arburst" *)
output wire [1 : 0] m_axi0_ps_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arcache" *)
output wire [3 : 0] m_axi0_ps_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arid" *)
output wire [15 : 0] m_axi0_ps_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arlen" *)
output wire [7 : 0] m_axi0_ps_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arlock" *)
output wire m_axi0_ps_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arprot" *)
output wire [2 : 0] m_axi0_ps_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arqos" *)
output wire [3 : 0] m_axi0_ps_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arready" *)
input wire m_axi0_ps_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arregion" *)
output wire [3 : 0] m_axi0_ps_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arsize" *)
output wire [2 : 0] m_axi0_ps_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_aruser" *)
output wire [31 : 0] m_axi0_ps_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arvalid" *)
output wire m_axi0_ps_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awaddr" *)
output wire [63 : 0] m_axi0_ps_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awburst" *)
output wire [1 : 0] m_axi0_ps_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awcache" *)
output wire [3 : 0] m_axi0_ps_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awid" *)
output wire [15 : 0] m_axi0_ps_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awlen" *)
output wire [7 : 0] m_axi0_ps_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awlock" *)
output wire m_axi0_ps_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awprot" *)
output wire [2 : 0] m_axi0_ps_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awqos" *)
output wire [3 : 0] m_axi0_ps_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awready" *)
input wire m_axi0_ps_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awregion" *)
output wire [3 : 0] m_axi0_ps_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awsize" *)
output wire [2 : 0] m_axi0_ps_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awuser" *)
output wire [31 : 0] m_axi0_ps_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awvalid" *)
output wire m_axi0_ps_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bid" *)
input wire [15 : 0] m_axi0_ps_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bready" *)
output wire m_axi0_ps_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bresp" *)
input wire [1 : 0] m_axi0_ps_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_buser" *)
input wire m_axi0_ps_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bvalid" *)
input wire m_axi0_ps_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rdata" *)
input wire [127 : 0] m_axi0_ps_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rid" *)
input wire [15 : 0] m_axi0_ps_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rlast" *)
input wire m_axi0_ps_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rready" *)
output wire m_axi0_ps_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rresp" *)
input wire [1 : 0] m_axi0_ps_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_ruser" *)
input wire [17 : 0] m_axi0_ps_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rvalid" *)
input wire m_axi0_ps_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wdata" *)
output wire [127 : 0] m_axi0_ps_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wid" *)
output wire [15 : 0] m_axi0_ps_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wlast" *)
output wire m_axi0_ps_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wready" *)
input wire m_axi0_ps_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wstrb" *)
output wire [15 : 0] m_axi0_ps_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wuser" *)
output wire [17 : 0] m_axi0_ps_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wvalid" *)
output wire m_axi0_ps_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_araddr" *)
output wire [63 : 0] m_axi1_ps_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arburst" *)
output wire [1 : 0] m_axi1_ps_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arcache" *)
output wire [3 : 0] m_axi1_ps_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arid" *)
output wire [15 : 0] m_axi1_ps_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arlen" *)
output wire [7 : 0] m_axi1_ps_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arlock" *)
output wire m_axi1_ps_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arprot" *)
output wire [2 : 0] m_axi1_ps_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arqos" *)
output wire [3 : 0] m_axi1_ps_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arready" *)
input wire m_axi1_ps_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arregion" *)
output wire [3 : 0] m_axi1_ps_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arsize" *)
output wire [2 : 0] m_axi1_ps_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_aruser" *)
output wire [17 : 0] m_axi1_ps_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arvalid" *)
output wire m_axi1_ps_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awaddr" *)
output wire [63 : 0] m_axi1_ps_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awburst" *)
output wire [1 : 0] m_axi1_ps_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awcache" *)
output wire [3 : 0] m_axi1_ps_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awid" *)
output wire [15 : 0] m_axi1_ps_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awlen" *)
output wire [7 : 0] m_axi1_ps_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awlock" *)
output wire m_axi1_ps_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awprot" *)
output wire [2 : 0] m_axi1_ps_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awqos" *)
output wire [3 : 0] m_axi1_ps_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awready" *)
input wire m_axi1_ps_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awregion" *)
output wire [3 : 0] m_axi1_ps_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awsize" *)
output wire [2 : 0] m_axi1_ps_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awuser" *)
output wire [17 : 0] m_axi1_ps_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awvalid" *)
output wire m_axi1_ps_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bid" *)
input wire [15 : 0] m_axi1_ps_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bready" *)
output wire m_axi1_ps_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bresp" *)
input wire [1 : 0] m_axi1_ps_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_buser" *)
input wire [15 : 0] m_axi1_ps_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bvalid" *)
input wire m_axi1_ps_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rdata" *)
input wire [127 : 0] m_axi1_ps_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rid" *)
input wire [15 : 0] m_axi1_ps_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rlast" *)
input wire m_axi1_ps_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rready" *)
output wire m_axi1_ps_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rresp" *)
input wire [1 : 0] m_axi1_ps_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_ruser" *)
input wire [16 : 0] m_axi1_ps_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rvalid" *)
input wire m_axi1_ps_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wdata" *)
output wire [127 : 0] m_axi1_ps_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wid" *)
output wire [15 : 0] m_axi1_ps_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wlast" *)
output wire m_axi1_ps_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wready" *)
input wire m_axi1_ps_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wstrb" *)
output wire [15 : 0] m_axi1_ps_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wuser" *)
output wire [16 : 0] m_axi1_ps_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wvalid" *)
output wire m_axi1_ps_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpmps_corr_irq" *)
output wire cpmps_corr_irq;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpmps_misc_irq" *)
output wire cpmps_misc_irq;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpmps_uncorr_irq" *)
output wire cpmps_uncorr_irq;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_araddr" *)
input wire [63 : 0] s_axi_cfg_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arburst" *)
input wire [1 : 0] s_axi_cfg_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arcache" *)
input wire [3 : 0] s_axi_cfg_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arid" *)
input wire [15 : 0] s_axi_cfg_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arlen" *)
input wire [7 : 0] s_axi_cfg_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arlock" *)
input wire s_axi_cfg_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arprot" *)
input wire [2 : 0] s_axi_cfg_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arqos" *)
input wire [3 : 0] s_axi_cfg_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arready" *)
output wire s_axi_cfg_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arregion" *)
input wire [3 : 0] s_axi_cfg_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arsize" *)
input wire [2 : 0] s_axi_cfg_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_aruser" *)
input wire [15 : 0] s_axi_cfg_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arvalid" *)
input wire s_axi_cfg_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awaddr" *)
input wire [63 : 0] s_axi_cfg_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awburst" *)
input wire [1 : 0] s_axi_cfg_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awcache" *)
input wire [3 : 0] s_axi_cfg_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awid" *)
input wire [15 : 0] s_axi_cfg_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awlen" *)
input wire [7 : 0] s_axi_cfg_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awlock" *)
input wire s_axi_cfg_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awprot" *)
input wire [2 : 0] s_axi_cfg_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awqos" *)
input wire [3 : 0] s_axi_cfg_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awready" *)
output wire s_axi_cfg_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awregion" *)
input wire [3 : 0] s_axi_cfg_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awsize" *)
input wire [2 : 0] s_axi_cfg_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awuser" *)
input wire [15 : 0] s_axi_cfg_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awvalid" *)
input wire s_axi_cfg_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bid" *)
output wire [15 : 0] s_axi_cfg_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bready" *)
input wire s_axi_cfg_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bresp" *)
output wire [1 : 0] s_axi_cfg_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_buser" *)
output wire s_axi_cfg_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bvalid" *)
output wire s_axi_cfg_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rdata" *)
output wire [31 : 0] s_axi_cfg_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rid" *)
output wire [15 : 0] s_axi_cfg_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rlast" *)
output wire s_axi_cfg_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rready" *)
input wire s_axi_cfg_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rresp" *)
output wire [1 : 0] s_axi_cfg_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_ruser" *)
output wire [5 : 0] s_axi_cfg_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rvalid" *)
output wire s_axi_cfg_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wdata" *)
input wire [31 : 0] s_axi_cfg_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wid" *)
input wire [15 : 0] s_axi_cfg_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wlast" *)
input wire s_axi_cfg_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wready" *)
output wire s_axi_cfg_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wstrb" *)
input wire [3 : 0] s_axi_cfg_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wuser" *)
input wire [5 : 0] s_axi_cfg_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wvalid" *)
input wire s_axi_cfg_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_powerdown" *)
input wire [1 : 0] xpipe0_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_powerdown" *)
input wire [1 : 0] xpipe1_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_powerdown" *)
input wire [1 : 0] xpipe2_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_powerdown" *)
input wire [1 : 0] xpipe3_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_powerdown" *)
input wire [1 : 0] xpipe4_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_powerdown" *)
input wire [1 : 0] xpipe5_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_powerdown" *)
input wire [1 : 0] xpipe6_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_powerdown" *)
input wire [1 : 0] xpipe7_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_powerdown" *)
input wire [1 : 0] xpipe8_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_powerdown" *)
input wire [1 : 0] xpipe9_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_powerdown" *)
input wire [1 : 0] xpipe10_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_powerdown" *)
input wire [1 : 0] xpipe11_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_powerdown" *)
input wire [1 : 0] xpipe12_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_powerdown" *)
input wire [1 : 0] xpipe13_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_powerdown" *)
input wire [1 : 0] xpipe14_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_powerdown" *)
input wire [1 : 0] xpipe15_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_phystatus" *)
output wire xpipe1_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_phystatus" *)
output wire xpipe2_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_phystatus" *)
output wire xpipe3_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_phystatus" *)
output wire xpipe4_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_phystatus" *)
output wire xpipe5_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_phystatus" *)
output wire xpipe6_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_phystatus" *)
output wire xpipe7_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_phystatus" *)
output wire xpipe8_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_phystatus" *)
output wire xpipe9_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_phystatus" *)
output wire xpipe10_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_phystatus" *)
output wire xpipe11_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_phystatus" *)
output wire xpipe12_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_phystatus" *)
output wire xpipe13_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_phystatus" *)
output wire xpipe14_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_phystatus" *)
output wire xpipe15_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_charisk" *)
output wire [1 : 0] xpipe0_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_charisk" *)
output wire [1 : 0] xpipe1_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_charisk" *)
output wire [1 : 0] xpipe2_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_charisk" *)
output wire [1 : 0] xpipe3_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_charisk" *)
output wire [1 : 0] xpipe4_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_charisk" *)
output wire [1 : 0] xpipe5_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_charisk" *)
output wire [1 : 0] xpipe6_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_charisk" *)
output wire [1 : 0] xpipe7_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_charisk" *)
output wire [1 : 0] xpipe8_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_charisk" *)
output wire [1 : 0] xpipe9_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_charisk" *)
output wire [1 : 0] xpipe10_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_charisk" *)
output wire [1 : 0] xpipe11_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_charisk" *)
output wire [1 : 0] xpipe12_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_charisk" *)
output wire [1 : 0] xpipe13_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_charisk" *)
output wire [1 : 0] xpipe14_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_charisk" *)
output wire [1 : 0] xpipe15_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_data" *)
output wire [31 : 0] xpipe0_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_data" *)
output wire [31 : 0] xpipe1_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_data" *)
output wire [31 : 0] xpipe2_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_data" *)
output wire [31 : 0] xpipe3_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_data" *)
output wire [31 : 0] xpipe4_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_data" *)
output wire [31 : 0] xpipe5_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_data" *)
output wire [31 : 0] xpipe6_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_data" *)
output wire [31 : 0] xpipe7_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_data" *)
output wire [31 : 0] xpipe8_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_data" *)
output wire [31 : 0] xpipe9_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_data" *)
output wire [31 : 0] xpipe10_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_data" *)
output wire [31 : 0] xpipe11_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_data" *)
output wire [31 : 0] xpipe12_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_data" *)
output wire [31 : 0] xpipe13_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_data" *)
output wire [31 : 0] xpipe14_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_data" *)
output wire [31 : 0] xpipe15_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_datavalid" *)
output wire xpipe0_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_datavalid" *)
output wire xpipe1_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_datavalid" *)
output wire xpipe2_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_datavalid" *)
output wire xpipe3_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_datavalid" *)
output wire xpipe4_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_datavalid" *)
output wire xpipe5_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_datavalid" *)
output wire xpipe6_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_datavalid" *)
output wire xpipe7_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_datavalid" *)
output wire xpipe8_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_datavalid" *)
output wire xpipe9_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_datavalid" *)
output wire xpipe10_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_datavalid" *)
output wire xpipe11_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_datavalid" *)
output wire xpipe12_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_datavalid" *)
output wire xpipe13_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_datavalid" *)
output wire xpipe14_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_datavalid" *)
output wire xpipe15_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_elecidle" *)
output wire xpipe0_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_elecidle" *)
output wire xpipe1_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_elecidle" *)
output wire xpipe2_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_elecidle" *)
output wire xpipe3_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_elecidle" *)
output wire xpipe4_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_elecidle" *)
output wire xpipe5_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_elecidle" *)
output wire xpipe6_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_elecidle" *)
output wire xpipe7_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_elecidle" *)
output wire xpipe8_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_elecidle" *)
output wire xpipe9_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_elecidle" *)
output wire xpipe10_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_elecidle" *)
output wire xpipe11_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_elecidle" *)
output wire xpipe12_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_elecidle" *)
output wire xpipe13_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_elecidle" *)
output wire xpipe14_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_elecidle" *)
output wire xpipe15_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_polarity" *)
input wire xpipe0_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_polarity" *)
input wire xpipe1_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_polarity" *)
input wire xpipe2_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_polarity" *)
input wire xpipe3_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_polarity" *)
input wire xpipe4_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_polarity" *)
input wire xpipe5_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_polarity" *)
input wire xpipe6_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_polarity" *)
input wire xpipe7_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_polarity" *)
input wire xpipe8_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_polarity" *)
input wire xpipe9_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_polarity" *)
input wire xpipe10_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_polarity" *)
input wire xpipe11_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_polarity" *)
input wire xpipe12_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_polarity" *)
input wire xpipe13_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_polarity" *)
input wire xpipe14_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_polarity" *)
input wire xpipe15_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_startblock" *)
output wire xpipe0_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_startblock" *)
output wire xpipe1_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_startblock" *)
output wire xpipe2_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_startblock" *)
output wire xpipe3_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_startblock" *)
output wire xpipe4_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_startblock" *)
output wire xpipe5_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_startblock" *)
output wire xpipe6_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_startblock" *)
output wire xpipe7_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_startblock" *)
output wire xpipe8_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_startblock" *)
output wire xpipe9_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_startblock" *)
output wire xpipe10_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_startblock" *)
output wire xpipe11_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_startblock" *)
output wire xpipe12_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_startblock" *)
output wire xpipe13_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_startblock" *)
output wire xpipe14_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_startblock" *)
output wire xpipe15_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_status" *)
output wire [2 : 0] xpipe0_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_status" *)
output wire [2 : 0] xpipe1_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_status" *)
output wire [2 : 0] xpipe2_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_status" *)
output wire [2 : 0] xpipe3_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_status" *)
output wire [2 : 0] xpipe4_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_status" *)
output wire [2 : 0] xpipe5_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_status" *)
output wire [2 : 0] xpipe6_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_status" *)
output wire [2 : 0] xpipe7_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_status" *)
output wire [2 : 0] xpipe8_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_status" *)
output wire [2 : 0] xpipe9_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_status" *)
output wire [2 : 0] xpipe10_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_status" *)
output wire [2 : 0] xpipe11_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_status" *)
output wire [2 : 0] xpipe12_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_status" *)
output wire [2 : 0] xpipe13_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_status" *)
output wire [2 : 0] xpipe14_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_status" *)
output wire [2 : 0] xpipe15_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_syncheader" *)
output wire [1 : 0] xpipe0_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_syncheader" *)
output wire [1 : 0] xpipe1_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_syncheader" *)
output wire [1 : 0] xpipe2_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_syncheader" *)
output wire [1 : 0] xpipe3_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_syncheader" *)
output wire [1 : 0] xpipe4_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_syncheader" *)
output wire [1 : 0] xpipe5_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_syncheader" *)
output wire [1 : 0] xpipe6_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_syncheader" *)
output wire [1 : 0] xpipe7_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_syncheader" *)
output wire [1 : 0] xpipe8_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_syncheader" *)
output wire [1 : 0] xpipe9_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_syncheader" *)
output wire [1 : 0] xpipe10_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_syncheader" *)
output wire [1 : 0] xpipe11_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_syncheader" *)
output wire [1 : 0] xpipe12_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_syncheader" *)
output wire [1 : 0] xpipe13_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_syncheader" *)
output wire [1 : 0] xpipe14_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_syncheader" *)
output wire [1 : 0] xpipe15_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_termination" *)
input wire xpipe0_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_termination" *)
input wire xpipe1_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_termination" *)
input wire xpipe2_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_termination" *)
input wire xpipe3_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_termination" *)
input wire xpipe4_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_termination" *)
input wire xpipe5_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_termination" *)
input wire xpipe6_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_termination" *)
input wire xpipe7_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_termination" *)
input wire xpipe8_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_termination" *)
input wire xpipe9_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_termination" *)
input wire xpipe10_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_termination" *)
input wire xpipe11_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_termination" *)
input wire xpipe12_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_termination" *)
input wire xpipe13_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_termination" *)
input wire xpipe14_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_termination" *)
input wire xpipe15_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_valid" *)
output wire xpipe0_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_valid" *)
output wire xpipe1_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_valid" *)
output wire xpipe2_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_valid" *)
output wire xpipe3_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_valid" *)
output wire xpipe4_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_valid" *)
output wire xpipe5_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_valid" *)
output wire xpipe6_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_valid" *)
output wire xpipe7_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_valid" *)
output wire xpipe8_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_valid" *)
output wire xpipe9_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_valid" *)
output wire xpipe10_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_valid" *)
output wire xpipe11_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_valid" *)
output wire xpipe12_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_valid" *)
output wire xpipe13_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_valid" *)
output wire xpipe14_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_valid" *)
output wire xpipe15_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_charisk" *)
input wire [1 : 0] xpipe0_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_charisk" *)
input wire [1 : 0] xpipe1_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_charisk" *)
input wire [1 : 0] xpipe2_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_charisk" *)
input wire [1 : 0] xpipe3_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_charisk" *)
input wire [1 : 0] xpipe4_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_charisk" *)
input wire [1 : 0] xpipe5_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_charisk" *)
input wire [1 : 0] xpipe6_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_charisk" *)
input wire [1 : 0] xpipe7_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_charisk" *)
input wire [1 : 0] xpipe8_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_charisk" *)
input wire [1 : 0] xpipe9_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_charisk" *)
input wire [1 : 0] xpipe10_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_charisk" *)
input wire [1 : 0] xpipe11_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_charisk" *)
input wire [1 : 0] xpipe12_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_charisk" *)
input wire [1 : 0] xpipe13_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_charisk" *)
input wire [1 : 0] xpipe14_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_charisk" *)
input wire [1 : 0] xpipe15_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_compliance" *)
input wire xpipe0_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_compliance" *)
input wire xpipe1_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_compliance" *)
input wire xpipe2_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_compliance" *)
input wire xpipe3_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_compliance" *)
input wire xpipe4_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_compliance" *)
input wire xpipe5_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_compliance" *)
input wire xpipe6_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_compliance" *)
input wire xpipe7_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_compliance" *)
input wire xpipe8_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_compliance" *)
input wire xpipe9_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_compliance" *)
input wire xpipe10_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_compliance" *)
input wire xpipe11_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_compliance" *)
input wire xpipe12_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_compliance" *)
input wire xpipe13_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_compliance" *)
input wire xpipe14_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_compliance" *)
input wire xpipe15_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_data" *)
input wire [31 : 0] xpipe0_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_data" *)
input wire [31 : 0] xpipe1_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_data" *)
input wire [31 : 0] xpipe2_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_data" *)
input wire [31 : 0] xpipe3_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_data" *)
input wire [31 : 0] xpipe4_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_data" *)
input wire [31 : 0] xpipe5_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_data" *)
input wire [31 : 0] xpipe6_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_data" *)
input wire [31 : 0] xpipe7_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_data" *)
input wire [31 : 0] xpipe8_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_data" *)
input wire [31 : 0] xpipe9_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_data" *)
input wire [31 : 0] xpipe10_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_data" *)
input wire [31 : 0] xpipe11_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_data" *)
input wire [31 : 0] xpipe12_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_data" *)
input wire [31 : 0] xpipe13_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_data" *)
input wire [31 : 0] xpipe14_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_data" *)
input wire [31 : 0] xpipe15_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_datavalid" *)
input wire xpipe0_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_datavalid" *)
input wire xpipe1_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_datavalid" *)
input wire xpipe2_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_datavalid" *)
input wire xpipe3_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_datavalid" *)
input wire xpipe4_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_datavalid" *)
input wire xpipe5_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_datavalid" *)
input wire xpipe6_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_datavalid" *)
input wire xpipe7_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_datavalid" *)
input wire xpipe8_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_datavalid" *)
input wire xpipe9_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_datavalid" *)
input wire xpipe10_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_datavalid" *)
input wire xpipe11_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_datavalid" *)
input wire xpipe12_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_datavalid" *)
input wire xpipe13_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_datavalid" *)
input wire xpipe14_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_datavalid" *)
input wire xpipe15_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_deemph" *)
input wire xpipe0_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_deemph" *)
input wire xpipe1_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_deemph" *)
input wire xpipe2_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_deemph" *)
input wire xpipe3_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_deemph" *)
input wire xpipe4_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_deemph" *)
input wire xpipe5_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_deemph" *)
input wire xpipe6_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_deemph" *)
input wire xpipe7_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_deemph" *)
input wire xpipe8_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_deemph" *)
input wire xpipe9_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_deemph" *)
input wire xpipe10_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_deemph" *)
input wire xpipe11_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_deemph" *)
input wire xpipe12_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_deemph" *)
input wire xpipe13_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_deemph" *)
input wire xpipe14_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_deemph" *)
input wire xpipe15_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_detectrxloopback" *)
input wire xpipe0_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_detectrxloopback" *)
input wire xpipe1_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_detectrxloopback" *)
input wire xpipe2_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_detectrxloopback" *)
input wire xpipe3_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_detectrxloopback" *)
input wire xpipe4_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_detectrxloopback" *)
input wire xpipe5_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_detectrxloopback" *)
input wire xpipe6_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_detectrxloopback" *)
input wire xpipe7_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_detectrxloopback" *)
input wire xpipe8_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_detectrxloopback" *)
input wire xpipe9_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_detectrxloopback" *)
input wire xpipe10_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_detectrxloopback" *)
input wire xpipe11_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_detectrxloopback" *)
input wire xpipe12_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_detectrxloopback" *)
input wire xpipe13_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_detectrxloopback" *)
input wire xpipe14_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_detectrxloopback" *)
input wire xpipe15_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_elecidle" *)
input wire xpipe0_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_elecidle" *)
input wire xpipe1_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_elecidle" *)
input wire xpipe2_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_elecidle" *)
input wire xpipe3_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_elecidle" *)
input wire xpipe4_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_elecidle" *)
input wire xpipe5_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_elecidle" *)
input wire xpipe6_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_elecidle" *)
input wire xpipe7_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_elecidle" *)
input wire xpipe8_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_elecidle" *)
input wire xpipe9_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_elecidle" *)
input wire xpipe10_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_elecidle" *)
input wire xpipe11_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_elecidle" *)
input wire xpipe12_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_elecidle" *)
input wire xpipe13_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_elecidle" *)
input wire xpipe14_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_elecidle" *)
input wire xpipe15_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_maincursor" *)
input wire [6 : 0] xpipe0_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_maincursor" *)
input wire [6 : 0] xpipe1_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_maincursor" *)
input wire [6 : 0] xpipe2_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_maincursor" *)
input wire [6 : 0] xpipe3_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_maincursor" *)
input wire [6 : 0] xpipe4_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_maincursor" *)
input wire [6 : 0] xpipe5_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_maincursor" *)
input wire [6 : 0] xpipe6_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_maincursor" *)
input wire [6 : 0] xpipe7_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_maincursor" *)
input wire [6 : 0] xpipe8_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_maincursor" *)
input wire [6 : 0] xpipe9_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_maincursor" *)
input wire [6 : 0] xpipe10_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_maincursor" *)
input wire [6 : 0] xpipe11_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_maincursor" *)
input wire [6 : 0] xpipe12_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_maincursor" *)
input wire [6 : 0] xpipe13_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_maincursor" *)
input wire [6 : 0] xpipe14_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_maincursor" *)
input wire [6 : 0] xpipe15_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_margin" *)
input wire [2 : 0] xpipe0_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_margin" *)
input wire [2 : 0] xpipe1_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_margin" *)
input wire [2 : 0] xpipe2_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_margin" *)
input wire [2 : 0] xpipe3_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_margin" *)
input wire [2 : 0] xpipe4_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_margin" *)
input wire [2 : 0] xpipe5_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_margin" *)
input wire [2 : 0] xpipe6_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_margin" *)
input wire [2 : 0] xpipe7_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_margin" *)
input wire [2 : 0] xpipe8_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_margin" *)
input wire [2 : 0] xpipe9_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_margin" *)
input wire [2 : 0] xpipe10_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_margin" *)
input wire [2 : 0] xpipe11_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_margin" *)
input wire [2 : 0] xpipe12_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_margin" *)
input wire [2 : 0] xpipe13_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_margin" *)
input wire [2 : 0] xpipe14_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_margin" *)
input wire [2 : 0] xpipe15_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_postcursor" *)
input wire [4 : 0] xpipe0_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_postcursor" *)
input wire [4 : 0] xpipe1_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_postcursor" *)
input wire [4 : 0] xpipe2_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_postcursor" *)
input wire [4 : 0] xpipe3_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_postcursor" *)
input wire [4 : 0] xpipe4_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_postcursor" *)
input wire [4 : 0] xpipe5_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_postcursor" *)
input wire [4 : 0] xpipe6_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_postcursor" *)
input wire [4 : 0] xpipe7_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_postcursor" *)
input wire [4 : 0] xpipe8_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_postcursor" *)
input wire [4 : 0] xpipe9_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_postcursor" *)
input wire [4 : 0] xpipe10_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_postcursor" *)
input wire [4 : 0] xpipe11_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_postcursor" *)
input wire [4 : 0] xpipe12_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_postcursor" *)
input wire [4 : 0] xpipe13_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_postcursor" *)
input wire [4 : 0] xpipe14_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_postcursor" *)
input wire [4 : 0] xpipe15_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_precursor" *)
input wire [4 : 0] xpipe0_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_precursor" *)
input wire [4 : 0] xpipe1_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_precursor" *)
input wire [4 : 0] xpipe2_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_precursor" *)
input wire [4 : 0] xpipe3_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_precursor" *)
input wire [4 : 0] xpipe4_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_precursor" *)
input wire [4 : 0] xpipe5_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_precursor" *)
input wire [4 : 0] xpipe6_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_precursor" *)
input wire [4 : 0] xpipe7_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_precursor" *)
input wire [4 : 0] xpipe8_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_precursor" *)
input wire [4 : 0] xpipe9_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_precursor" *)
input wire [4 : 0] xpipe10_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_precursor" *)
input wire [4 : 0] xpipe11_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_precursor" *)
input wire [4 : 0] xpipe12_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_precursor" *)
input wire [4 : 0] xpipe13_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_precursor" *)
input wire [4 : 0] xpipe14_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_precursor" *)
input wire [4 : 0] xpipe15_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_startblock" *)
input wire xpipe0_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_startblock" *)
input wire xpipe1_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_startblock" *)
input wire xpipe2_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_startblock" *)
input wire xpipe3_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_startblock" *)
input wire xpipe4_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_startblock" *)
input wire xpipe5_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_startblock" *)
input wire xpipe6_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_startblock" *)
input wire xpipe7_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_startblock" *)
input wire xpipe8_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_startblock" *)
input wire xpipe9_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_startblock" *)
input wire xpipe10_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_startblock" *)
input wire xpipe11_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_startblock" *)
input wire xpipe12_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_startblock" *)
input wire xpipe13_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_startblock" *)
input wire xpipe14_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_startblock" *)
input wire xpipe15_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_swing" *)
input wire xpipe0_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_swing" *)
input wire xpipe1_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_swing" *)
input wire xpipe2_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_swing" *)
input wire xpipe3_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_swing" *)
input wire xpipe4_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_swing" *)
input wire xpipe5_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_swing" *)
input wire xpipe6_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_swing" *)
input wire xpipe7_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_swing" *)
input wire xpipe8_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_swing" *)
input wire xpipe9_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_swing" *)
input wire xpipe10_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_swing" *)
input wire xpipe11_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_swing" *)
input wire xpipe12_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_swing" *)
input wire xpipe13_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_swing" *)
input wire xpipe14_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_swing" *)
input wire xpipe15_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_syncheader" *)
input wire [1 : 0] xpipe0_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_syncheader" *)
input wire [1 : 0] xpipe1_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_syncheader" *)
input wire [1 : 0] xpipe2_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_syncheader" *)
input wire [1 : 0] xpipe3_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_syncheader" *)
input wire [1 : 0] xpipe4_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_syncheader" *)
input wire [1 : 0] xpipe5_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_syncheader" *)
input wire [1 : 0] xpipe6_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_syncheader" *)
input wire [1 : 0] xpipe7_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_syncheader" *)
input wire [1 : 0] xpipe8_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_syncheader" *)
input wire [1 : 0] xpipe9_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_syncheader" *)
input wire [1 : 0] xpipe10_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_syncheader" *)
input wire [1 : 0] xpipe11_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_syncheader" *)
input wire [1 : 0] xpipe12_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_syncheader" *)
input wire [1 : 0] xpipe13_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_syncheader" *)
input wire [1 : 0] xpipe14_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_syncheader" *)
input wire [1 : 0] xpipe15_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_datavalid" *)
output wire hsdp_xpipe0_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_datavalid" *)
output wire hsdp_xpipe1_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_datavalid" *)
output wire hsdp_xpipe2_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_gearboxslip" *)
input wire hsdp_xpipe0_rx_gearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_gearboxslip" *)
input wire hsdp_xpipe1_rx_gearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_gearboxslip" *)
input wire hsdp_xpipe2_rx_gearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_header" *)
output wire [1 : 0] hsdp_xpipe0_rx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_header" *)
output wire [1 : 0] hsdp_xpipe1_rx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_header" *)
output wire [1 : 0] hsdp_xpipe2_rx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_headervalid" *)
output wire hsdp_xpipe0_rx_headervalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_headervalid" *)
output wire hsdp_xpipe1_rx_headervalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_headervalid" *)
output wire hsdp_xpipe2_rx_headervalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_pcsreset" *)
input wire hsdp_xpipe0_rx_pcsreset;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_pcsreset" *)
input wire hsdp_xpipe1_rx_pcsreset;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_pcsreset" *)
input wire hsdp_xpipe2_rx_pcsreset;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_resetdone" *)
output wire hsdp_xpipe0_rx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_resetdone" *)
output wire hsdp_xpipe1_rx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_resetdone" *)
output wire hsdp_xpipe2_rx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_tx_header" *)
input wire [1 : 0] hsdp_xpipe0_tx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_tx_header" *)
input wire [1 : 0] hsdp_xpipe1_tx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_tx_header" *)
input wire [1 : 0] hsdp_xpipe2_tx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_tx_resetdone" *)
output wire hsdp_xpipe0_tx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_tx_resetdone" *)
output wire hsdp_xpipe1_tx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_tx_resetdone" *)
output wire hsdp_xpipe2_tx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_tx_sequence" *)
input wire [6 : 0] hsdp_xpipe0_tx_sequence;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_tx_sequence" *)
input wire [6 : 0] hsdp_xpipe1_tx_sequence;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_tx_sequence" *)
input wire [6 : 0] hsdp_xpipe2_tx_sequence;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_gt_rxoutclk" *)
output wire hsdp_gt_rxoutclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_gt_txusrclk" *)
input wire hsdp_gt_txusrclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM phy_ready_frbot" *)
input wire phy_ready_frbot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM phy_ready_tobot" *)
output wire phy_ready_tobot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtce" *)
output wire link0_xpipe_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtce" *)
output wire link1_xpipe_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtcemask" *)
output wire [3 : 0] link0_xpipe_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtcemask" *)
output wire [3 : 0] link1_xpipe_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtdiv" *)
output wire [11 : 0] link0_xpipe_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtdiv" *)
output wire [11 : 0] link1_xpipe_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtrst" *)
output wire link0_xpipe_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtrst" *)
output wire link1_xpipe_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtrstmask" *)
output wire [3 : 0] link0_xpipe_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtrstmask" *)
output wire [3 : 0] link1_xpipe_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_gtoutclk" *)
output wire link0_xpipe_gtoutclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_gtoutclk" *)
output wire link1_xpipe_gtoutclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_gtpipeclk" *)
input wire link0_xpipe_gtpipeclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_gtpipeclk" *)
input wire link1_xpipe_gtpipeclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_pcielinkreachtarget" *)
input wire link0_xpipe_pcielinkreachtarget;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_pcielinkreachtarget" *)
input wire link1_xpipe_pcielinkreachtarget;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_pcieltssmstate" *)
input wire [5 : 0] link0_xpipe_pcieltssmstate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_pcieltssmstate" *)
input wire [5 : 0] link1_xpipe_pcieltssmstate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_pcieperstn" *)
input wire link0_xpipe_pcieperstn;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_pcieperstn" *)
input wire link1_xpipe_pcieperstn;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_phyesmadaptationsave" *)
input wire link0_xpipe_phyesmadaptationsave;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_phyesmadaptationsave" *)
input wire link1_xpipe_phyesmadaptationsave;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_phyready" *)
output wire link0_xpipe_phyready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_phyready" *)
output wire link1_xpipe_phyready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_piperate" *)
input wire [2 : 0] link0_xpipe_piperate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_piperate" *)
input wire [2 : 0] link1_xpipe_piperate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_araddr" *)
input wire [63 : 0] s_axi_pcie_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arburst" *)
input wire [1 : 0] s_axi_pcie_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arcache" *)
input wire [3 : 0] s_axi_pcie_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arid" *)
input wire [15 : 0] s_axi_pcie_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arlen" *)
input wire [7 : 0] s_axi_pcie_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arlock" *)
input wire s_axi_pcie_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arprot" *)
input wire [2 : 0] s_axi_pcie_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arqos" *)
input wire [3 : 0] s_axi_pcie_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arready" *)
output wire s_axi_pcie_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arregion" *)
input wire [3 : 0] s_axi_pcie_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arsize" *)
input wire [2 : 0] s_axi_pcie_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_aruser" *)
input wire [17 : 0] s_axi_pcie_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arvalid" *)
input wire s_axi_pcie_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awaddr" *)
input wire [63 : 0] s_axi_pcie_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awburst" *)
input wire [1 : 0] s_axi_pcie_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awcache" *)
input wire [3 : 0] s_axi_pcie_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awid" *)
input wire [15 : 0] s_axi_pcie_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awlen" *)
input wire [7 : 0] s_axi_pcie_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awlock" *)
input wire s_axi_pcie_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awprot" *)
input wire [2 : 0] s_axi_pcie_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awqos" *)
input wire [3 : 0] s_axi_pcie_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awready" *)
output wire s_axi_pcie_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awregion" *)
input wire [3 : 0] s_axi_pcie_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awsize" *)
input wire [2 : 0] s_axi_pcie_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awuser" *)
input wire [17 : 0] s_axi_pcie_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awvalid" *)
input wire s_axi_pcie_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bid" *)
output wire [15 : 0] s_axi_pcie_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bready" *)
input wire s_axi_pcie_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bresp" *)
output wire [1 : 0] s_axi_pcie_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_buser" *)
output wire [15 : 0] s_axi_pcie_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bvalid" *)
output wire s_axi_pcie_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rdata" *)
output wire [127 : 0] s_axi_pcie_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rid" *)
output wire [15 : 0] s_axi_pcie_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rlast" *)
output wire s_axi_pcie_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rready" *)
input wire s_axi_pcie_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rresp" *)
output wire [1 : 0] s_axi_pcie_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_ruser" *)
output wire [16 : 0] s_axi_pcie_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rvalid" *)
output wire s_axi_pcie_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wdata" *)
input wire [127 : 0] s_axi_pcie_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wid" *)
input wire [15 : 0] s_axi_pcie_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wlast" *)
input wire s_axi_pcie_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wready" *)
output wire s_axi_pcie_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wstrb" *)
input wire [15 : 0] s_axi_pcie_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wuser" *)
input wire [16 : 0] s_axi_pcie_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wvalid" *)
input wire s_axi_pcie_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_apb_en" *)
input wire cpm_pcr_apb_en;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_dis_npi_clk" *)
input wire cpm_pcr_dis_npi_clk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_fabric_en" *)
input wire cpm_pcr_fabric_en;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_gate_reg" *)
input wire cpm_pcr_gate_reg;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_hold_state" *)
input wire cpm_pcr_hold_state;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_init_state" *)
input wire cpm_pcr_init_state;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_mem_clr" *)
input wire cpm_pcr_mem_clr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_o_disable" *)
input wire [3 : 0] cpm_pcr_o_disable;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_pcomplete" *)
input wire cpm_pcr_pcomplete;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_pwr_dn" *)
input wire cpm_pcr_pwr_dn;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_scan_clr" *)
input wire cpm_pcr_scan_clr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_start_bisr" *)
input wire cpm_pcr_start_bisr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_start_cal" *)
input wire cpm_pcr_start_cal;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_tristate" *)
input wire cpm_pcr_tristate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_ack" *)
output wire xpipe_q0_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_ack" *)
output wire xpipe_q1_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_ack" *)
output wire xpipe_q2_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_ack" *)
output wire xpipe_q3_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_cmd" *)
input wire [3 : 0] xpipe_q0_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_cmd" *)
input wire [3 : 0] xpipe_q1_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_cmd" *)
input wire [3 : 0] xpipe_q2_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_cmd" *)
input wire [3 : 0] xpipe_q3_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_lanenum" *)
input wire [1 : 0] xpipe_q0_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_lanenum" *)
input wire [1 : 0] xpipe_q1_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_lanenum" *)
input wire [1 : 0] xpipe_q2_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_lanenum" *)
input wire [1 : 0] xpipe_q3_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_payload" *)
input wire [7 : 0] xpipe_q0_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_payload" *)
input wire [7 : 0] xpipe_q1_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_payload" *)
input wire [7 : 0] xpipe_q2_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_payload" *)
input wire [7 : 0] xpipe_q3_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_req" *)
input wire xpipe_q0_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_req" *)
input wire xpipe_q1_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_req" *)
input wire xpipe_q2_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_req" *)
input wire xpipe_q3_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_ack" *)
input wire xpipe_q0_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_ack" *)
input wire xpipe_q1_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_ack" *)
input wire xpipe_q2_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_ack" *)
input wire xpipe_q3_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_cmd" *)
output wire [3 : 0] xpipe_q0_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_cmd" *)
output wire [3 : 0] xpipe_q1_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_cmd" *)
output wire [3 : 0] xpipe_q2_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_cmd" *)
output wire [3 : 0] xpipe_q3_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_lanenum" *)
output wire [1 : 0] xpipe_q0_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_lanenum" *)
output wire [1 : 0] xpipe_q1_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_lanenum" *)
output wire [1 : 0] xpipe_q2_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_lanenum" *)
output wire [1 : 0] xpipe_q3_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_payload" *)
output wire [7 : 0] xpipe_q0_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_payload" *)
output wire [7 : 0] xpipe_q1_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_payload" *)
output wire [7 : 0] xpipe_q2_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_payload" *)
output wire [7 : 0] xpipe_q3_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_req" *)
output wire xpipe_q0_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_req" *)
output wire xpipe_q1_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_req" *)
output wire xpipe_q2_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_req" *)
output wire xpipe_q3_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM lpd_refclk_in" *)
input wire lpd_refclk_in;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM lpd_switch_timeout_cnt" *)
input wire lpd_switch_timeout_cnt;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM lpd_swclk" *)
input wire lpd_swclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM perst0n" *)
input wire perst0n;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM perst1n" *)
input wire perst1n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.pcie0_user_clk, ASSOCIATED_BUSIF pcie0_s_axis_rq:pcie0_s_axis_cc:pcie0_m_axis_cq:pcie0_m_axis_rc:dma0_s_axis_c2h:dma0_s_axis_c2h_cmpt:dma0_m_axis_h2c:dma0_s_axis_c2h_0:dma0_m_axis_h2c_0:dma0_s_axis_c2h_1:dma0_m_axis_h2c_1:dma0_s_axis_c2h_2:dma0_m_axis_h2c_2:dma0_s_axis_c2h_3:dma0_m_axis_h2c_3:dma0_st_rx_msg, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, ASSOCIATED_RESET dma0_axi_aresetn, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.pcie0_user_clk CLK" *)
output wire pcie0_user_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT.cpm_misc_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.cpm_misc_irq INTERRUPT" *)
output wire cpm_misc_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT.cpm_cor_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.cpm_cor_irq INTERRUPT" *)
output wire cpm_cor_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT.cpm_uncor_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.cpm_uncor_irq INTERRUPT" *)
output wire cpm_uncor_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT.cpm_irq0, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.cpm_irq0 INTERRUPT" *)
input wire cpm_irq0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT.cpm_irq1, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.cpm_irq1 INTERRUPT" *)
input wire cpm_irq1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT.dma0_irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.dma0_irq INTERRUPT" *)
output wire dma0_irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.dma0_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.dma0_axi_aresetn RST" *)
output wire dma0_axi_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.dma0_soft_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.dma0_soft_resetn RST" *)
input wire dma0_soft_resetn;
output wire pcie0_user_lnk_up;
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
output wire dma0_st_rx_msg_last;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TVALID" *)
output wire dma0_st_rx_msg_valid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TREADY" *)
input wire dma0_st_rx_msg_rdy;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dma0_st_rx_msg, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 250000000, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dma0_st_rx_msg TDATA" *)
output wire [31 : 0] dma0_st_rx_msg_data;
output wire [0 : 0] xdma0_usr_irq_ack;
input wire [0 : 0] xdma0_usr_irq_req;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_N" *)
output wire [7 : 0] pcie0_gt_txn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GTX_P" *)
output wire [7 : 0] pcie0_gt_txp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_N" *)
input wire [7 : 0] pcie0_gt_rxn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PCIE0_GT, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 PCIE0_GT GRX_P" *)
input wire [7 : 0] pcie0_gt_rxp;
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_N" *)
input wire gt_refclk0_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_refclk0, CAN_DEBUG false, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_refclk0 CLK_P" *)
input wire gt_refclk0_p;

  bd_f512_cpm_0_0_core_top #(
    .C_PS_HSDP_MODE("NONE"),
    .C_PS_HSDP_INGRESS_TRAFFIC("JTAG"),
    .C_CPM_PCIE_CHANNELS_FOR_POWER(1),
    .C_XPIPE_0_LOC("QUAD0"),
    .C_XPIPE_1_LOC("QUAD1"),
    .C_XPIPE_2_LOC("QUAD2"),
    .C_XPIPE_3_LOC("QUAD3"),
    .C_XPIPE_0_LINK0_CFG("X8"),
    .C_XPIPE_1_LINK0_CFG("X8"),
    .C_XPIPE_2_LINK0_CFG("DISABLE"),
    .C_XPIPE_3_LINK0_CFG("DISABLE"),
    .C_XPIPE_0_LINK1_CFG("DISABLE"),
    .C_XPIPE_1_LINK1_CFG("DISABLE"),
    .C_XPIPE_2_LINK1_CFG("DISABLE"),
    .C_XPIPE_3_LINK1_CFG("DISABLE"),
    .C_XPIPE_0_CLK_CFG(1044480),
    .C_XPIPE_1_CLK_CFG(1048320),
    .C_XPIPE_2_CLK_CFG(0),
    .C_XPIPE_3_CLK_CFG(0),
    .C_XPIPE_0_CLKDLY_CFG(268485632),
    .C_XPIPE_1_CLKDLY_CFG(33557632),
    .C_XPIPE_2_CLKDLY_CFG(0),
    .C_XPIPE_3_CLKDLY_CFG(0),
    .C_XPIPE_0_REG_CFG(8146),
    .C_XPIPE_1_REG_CFG(8137),
    .C_XPIPE_2_REG_CFG(0),
    .C_XPIPE_3_REG_CFG(0),
    .C_XPIPE_0_MODE(1),
    .C_XPIPE_1_MODE(1),
    .C_XPIPE_2_MODE(0),
    .C_XPIPE_3_MODE(0),
    .C_XPIPE_0_RSVD(0),
    .C_XPIPE_1_RSVD(0),
    .C_XPIPE_2_RSVD(0),
    .C_XPIPE_3_RSVD(0),
    .C_XPIPE_0_INSTANTIATED(1),
    .C_XPIPE_1_INSTANTIATED(1),
    .C_XPIPE_2_INSTANTIATED(0),
    .C_XPIPE_3_INSTANTIATED(0),
    .C_CPM_PCIE0_USE_MODE(4),
    .C_CPM_PCIE0_FUNCTIONAL_MODE("DMA"),
    .C_CPM_PCIE0_NUM_USR_IRQ(1),
    .C_CPM_PCIE0_PL_LINK_CAP_MAX_LINK_WIDTH(8),
    .C_CPM_PCIE1_PL_LINK_CAP_MAX_LINK_WIDTH(1),
    .C_CPM_PCIE0_AXIS_CC_TUSER_WIDTH(81),
    .C_CPM_PCIE1_AXIS_CC_TUSER_WIDTH(33),
    .C_CPM_PCIE0_AXIS_RC_TUSER_WIDTH(161),
    .C_CPM_PCIE1_AXIS_RC_TUSER_WIDTH(75),
    .C_CPM_PCIE0_AXIS_RQ_TUSER_WIDTH(179),
    .C_CPM_PCIE1_AXIS_RQ_TUSER_WIDTH(62),
    .C_CPM_PCIE0_AXIS_CQ_TUSER_WIDTH(183),
    .C_CPM_PCIE1_AXIS_CQ_TUSER_WIDTH(85),
    .C_CPM_PCIE0_MODES("DMA"),
    .C_CPM_PCIE1_MODES("None"),
    .C_CPM_PCIE0_USER_CLK_FREQ("250_MHz"),
    .C_CPM_PCIE1_USER_CLK_FREQ("125_MHz"),
    .C_CPM_PCIE0_LINK_SPEED_FOR_POWER("GEN4"),
    .C_CPM_PCIE1_LINK_SPEED_FOR_POWER("GEN1"),
    .C_CPM_PCIE0_MODE_FOR_POWER("CPM_STREAM_W_DMA"),
    .C_CPM_PCIE1_MODE_FOR_POWER("NONE"),
    .C_CPM_PCIE0_LINK_WIDTH_FOR_POWER(8),
    .C_CPM_PCIE1_LINK_WIDTH_FOR_POWER(0),
    .C_CPM_PCIE0_ARI_CAP_ENABLE(1),
    .C_CPM_PCIE1_ARI_CAP_ENABLE(1),
    .C_CPM_PCIE0_PF0_MSI_ENABLED(1),
    .C_CPM_PCIE1_PF0_MSI_ENABLED(1),
    .C_CPM_PCIE0_PF0_PASID_CAP_ON(0),
    .C_CPM_PCIE1_PF0_PASID_CAP_ON(0),
    .C_CPM_PCIE0_CONTROLLER_ENABLE(1),
    .C_CPM_PCIE1_CONTROLLER_ENABLE(0),
    .C_CPM_PCIE0_TL_PF_ENABLE_REG(1),
    .C_CPM_PCIE1_TL_PF_ENABLE_REG(1),
    .C_CPM_PCIE0_AXISTEN_IF_WIDTH(512),
    .C_CPM_PCIE1_AXISTEN_IF_WIDTH(64),
    .C_CPM_PCIE0_PL_UPSTREAM_FACING(1),
    .C_CPM_PCIE1_PL_UPSTREAM_FACING(1),
    .C_CPM_PCIE0_SRIOV_CAP_ENABLE(0),
    .C_CPM_PCIE1_SRIOV_CAP_ENABLE(0),
    .C_CPM_PCIE0_PF0_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE1_PF0_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE0_PF1_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE1_PF1_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE0_PF2_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE1_PF2_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE0_PF3_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE1_PF3_SRIOV_CAP_TOTAL_VF(0),
    .C_CPM_PCIE0_PF0_SRIOV_FIRST_VF_OFFSET(4),
    .C_CPM_PCIE1_PF0_SRIOV_FIRST_VF_OFFSET(4),
    .C_CPM_PCIE0_PF1_SRIOV_FIRST_VF_OFFSET(7),
    .C_CPM_PCIE1_PF1_SRIOV_FIRST_VF_OFFSET(7),
    .C_CPM_PCIE0_PF2_SRIOV_FIRST_VF_OFFSET(10),
    .C_CPM_PCIE1_PF2_SRIOV_FIRST_VF_OFFSET(10),
    .C_CPM_PCIE0_PF3_SRIOV_FIRST_VF_OFFSET(13),
    .C_CPM_PCIE1_PF3_SRIOV_FIRST_VF_OFFSET(13),
    .C_CPM_PCIE0_PF0_ATS_CAP_ON(0),
    .C_CPM_PCIE1_PF0_ATS_CAP_ON(0),
    .C_CPM_PCIE0_PF1_ATS_CAP_ON(0),
    .C_CPM_PCIE1_PF1_ATS_CAP_ON(0),
    .C_CPM_PCIE0_PF2_ATS_CAP_ON(0),
    .C_CPM_PCIE1_PF2_ATS_CAP_ON(0),
    .C_CPM_PCIE0_PF3_ATS_CAP_ON(0),
    .C_CPM_PCIE1_PF3_ATS_CAP_ON(0),
    .C_CPM_PCIE0_PF0_PRI_CAP_ON(0),
    .C_CPM_PCIE1_PF0_PRI_CAP_ON(0),
    .C_CPM_PCIE0_PF1_PRI_CAP_ON(0),
    .C_CPM_PCIE1_PF1_PRI_CAP_ON(0),
    .C_CPM_PCIE0_PF2_PRI_CAP_ON(0),
    .C_CPM_PCIE1_PF2_PRI_CAP_ON(0),
    .C_CPM_PCIE0_PF3_PRI_CAP_ON(0),
    .C_CPM_PCIE1_PF3_PRI_CAP_ON(0),
    .C_CPM_PCIE0_VFG0_ATS_CAP_ON(0),
    .C_CPM_PCIE1_VFG0_ATS_CAP_ON(0),
    .C_CPM_PCIE0_VFG1_ATS_CAP_ON(0),
    .C_CPM_PCIE1_VFG1_ATS_CAP_ON(0),
    .C_CPM_PCIE0_VFG2_ATS_CAP_ON(0),
    .C_CPM_PCIE1_VFG2_ATS_CAP_ON(0),
    .C_CPM_PCIE0_VFG3_ATS_CAP_ON(0),
    .C_CPM_PCIE1_VFG3_ATS_CAP_ON(0),
    .C_CPM_PCIE0_VFG0_PRI_CAP_ON(0),
    .C_CPM_PCIE1_VFG0_PRI_CAP_ON(0),
    .C_CPM_PCIE0_VFG1_PRI_CAP_ON(0),
    .C_CPM_PCIE1_VFG1_PRI_CAP_ON(0),
    .C_CPM_PCIE0_VFG2_PRI_CAP_ON(0),
    .C_CPM_PCIE1_VFG2_PRI_CAP_ON(0),
    .C_CPM_PCIE0_VFG3_PRI_CAP_ON(0),
    .C_CPM_PCIE1_VFG3_PRI_CAP_ON(0),
    .C_CPM_DMA_IS_MM_ONLY(0),
    .C_CPM_CCIX_IS_MM_ONLY(0)
  ) inst (
    .cpm_osc_clk_div2(cpm_osc_clk_div2),
    .m_axi0_ps_araddr(m_axi0_ps_araddr),
    .m_axi0_ps_arburst(m_axi0_ps_arburst),
    .m_axi0_ps_arcache(m_axi0_ps_arcache),
    .m_axi0_ps_arid(m_axi0_ps_arid),
    .m_axi0_ps_arlen(m_axi0_ps_arlen),
    .m_axi0_ps_arlock(m_axi0_ps_arlock),
    .m_axi0_ps_arprot(m_axi0_ps_arprot),
    .m_axi0_ps_arqos(m_axi0_ps_arqos),
    .m_axi0_ps_arready(m_axi0_ps_arready),
    .m_axi0_ps_arregion(m_axi0_ps_arregion),
    .m_axi0_ps_arsize(m_axi0_ps_arsize),
    .m_axi0_ps_aruser(m_axi0_ps_aruser),
    .m_axi0_ps_arvalid(m_axi0_ps_arvalid),
    .m_axi0_ps_awaddr(m_axi0_ps_awaddr),
    .m_axi0_ps_awburst(m_axi0_ps_awburst),
    .m_axi0_ps_awcache(m_axi0_ps_awcache),
    .m_axi0_ps_awid(m_axi0_ps_awid),
    .m_axi0_ps_awlen(m_axi0_ps_awlen),
    .m_axi0_ps_awlock(m_axi0_ps_awlock),
    .m_axi0_ps_awprot(m_axi0_ps_awprot),
    .m_axi0_ps_awqos(m_axi0_ps_awqos),
    .m_axi0_ps_awready(m_axi0_ps_awready),
    .m_axi0_ps_awregion(m_axi0_ps_awregion),
    .m_axi0_ps_awsize(m_axi0_ps_awsize),
    .m_axi0_ps_awuser(m_axi0_ps_awuser),
    .m_axi0_ps_awvalid(m_axi0_ps_awvalid),
    .m_axi0_ps_bid(m_axi0_ps_bid),
    .m_axi0_ps_bready(m_axi0_ps_bready),
    .m_axi0_ps_bresp(m_axi0_ps_bresp),
    .m_axi0_ps_buser(m_axi0_ps_buser),
    .m_axi0_ps_bvalid(m_axi0_ps_bvalid),
    .m_axi0_ps_rdata(m_axi0_ps_rdata),
    .m_axi0_ps_rid(m_axi0_ps_rid),
    .m_axi0_ps_rlast(m_axi0_ps_rlast),
    .m_axi0_ps_rready(m_axi0_ps_rready),
    .m_axi0_ps_rresp(m_axi0_ps_rresp),
    .m_axi0_ps_ruser(m_axi0_ps_ruser),
    .m_axi0_ps_rvalid(m_axi0_ps_rvalid),
    .m_axi0_ps_wdata(m_axi0_ps_wdata),
    .m_axi0_ps_wid(m_axi0_ps_wid),
    .m_axi0_ps_wlast(m_axi0_ps_wlast),
    .m_axi0_ps_wready(m_axi0_ps_wready),
    .m_axi0_ps_wstrb(m_axi0_ps_wstrb),
    .m_axi0_ps_wuser(m_axi0_ps_wuser),
    .m_axi0_ps_wvalid(m_axi0_ps_wvalid),
    .m_axi1_ps_araddr(m_axi1_ps_araddr),
    .m_axi1_ps_arburst(m_axi1_ps_arburst),
    .m_axi1_ps_arcache(m_axi1_ps_arcache),
    .m_axi1_ps_arid(m_axi1_ps_arid),
    .m_axi1_ps_arlen(m_axi1_ps_arlen),
    .m_axi1_ps_arlock(m_axi1_ps_arlock),
    .m_axi1_ps_arprot(m_axi1_ps_arprot),
    .m_axi1_ps_arqos(m_axi1_ps_arqos),
    .m_axi1_ps_arready(m_axi1_ps_arready),
    .m_axi1_ps_arregion(m_axi1_ps_arregion),
    .m_axi1_ps_arsize(m_axi1_ps_arsize),
    .m_axi1_ps_aruser(m_axi1_ps_aruser),
    .m_axi1_ps_arvalid(m_axi1_ps_arvalid),
    .m_axi1_ps_awaddr(m_axi1_ps_awaddr),
    .m_axi1_ps_awburst(m_axi1_ps_awburst),
    .m_axi1_ps_awcache(m_axi1_ps_awcache),
    .m_axi1_ps_awid(m_axi1_ps_awid),
    .m_axi1_ps_awlen(m_axi1_ps_awlen),
    .m_axi1_ps_awlock(m_axi1_ps_awlock),
    .m_axi1_ps_awprot(m_axi1_ps_awprot),
    .m_axi1_ps_awqos(m_axi1_ps_awqos),
    .m_axi1_ps_awready(m_axi1_ps_awready),
    .m_axi1_ps_awregion(m_axi1_ps_awregion),
    .m_axi1_ps_awsize(m_axi1_ps_awsize),
    .m_axi1_ps_awuser(m_axi1_ps_awuser),
    .m_axi1_ps_awvalid(m_axi1_ps_awvalid),
    .m_axi1_ps_bid(m_axi1_ps_bid),
    .m_axi1_ps_bready(m_axi1_ps_bready),
    .m_axi1_ps_bresp(m_axi1_ps_bresp),
    .m_axi1_ps_buser(m_axi1_ps_buser),
    .m_axi1_ps_bvalid(m_axi1_ps_bvalid),
    .m_axi1_ps_rdata(m_axi1_ps_rdata),
    .m_axi1_ps_rid(m_axi1_ps_rid),
    .m_axi1_ps_rlast(m_axi1_ps_rlast),
    .m_axi1_ps_rready(m_axi1_ps_rready),
    .m_axi1_ps_rresp(m_axi1_ps_rresp),
    .m_axi1_ps_ruser(m_axi1_ps_ruser),
    .m_axi1_ps_rvalid(m_axi1_ps_rvalid),
    .m_axi1_ps_wdata(m_axi1_ps_wdata),
    .m_axi1_ps_wid(m_axi1_ps_wid),
    .m_axi1_ps_wlast(m_axi1_ps_wlast),
    .m_axi1_ps_wready(m_axi1_ps_wready),
    .m_axi1_ps_wstrb(m_axi1_ps_wstrb),
    .m_axi1_ps_wuser(m_axi1_ps_wuser),
    .m_axi1_ps_wvalid(m_axi1_ps_wvalid),
    .cpmps_corr_irq(cpmps_corr_irq),
    .cpmps_misc_irq(cpmps_misc_irq),
    .cpmps_uncorr_irq(cpmps_uncorr_irq),
    .s_axi_cfg_araddr(s_axi_cfg_araddr),
    .s_axi_cfg_arburst(s_axi_cfg_arburst),
    .s_axi_cfg_arcache(s_axi_cfg_arcache),
    .s_axi_cfg_arid(s_axi_cfg_arid),
    .s_axi_cfg_arlen(s_axi_cfg_arlen),
    .s_axi_cfg_arlock(s_axi_cfg_arlock),
    .s_axi_cfg_arprot(s_axi_cfg_arprot),
    .s_axi_cfg_arqos(s_axi_cfg_arqos),
    .s_axi_cfg_arready(s_axi_cfg_arready),
    .s_axi_cfg_arregion(s_axi_cfg_arregion),
    .s_axi_cfg_arsize(s_axi_cfg_arsize),
    .s_axi_cfg_aruser(s_axi_cfg_aruser),
    .s_axi_cfg_arvalid(s_axi_cfg_arvalid),
    .s_axi_cfg_awaddr(s_axi_cfg_awaddr),
    .s_axi_cfg_awburst(s_axi_cfg_awburst),
    .s_axi_cfg_awcache(s_axi_cfg_awcache),
    .s_axi_cfg_awid(s_axi_cfg_awid),
    .s_axi_cfg_awlen(s_axi_cfg_awlen),
    .s_axi_cfg_awlock(s_axi_cfg_awlock),
    .s_axi_cfg_awprot(s_axi_cfg_awprot),
    .s_axi_cfg_awqos(s_axi_cfg_awqos),
    .s_axi_cfg_awready(s_axi_cfg_awready),
    .s_axi_cfg_awregion(s_axi_cfg_awregion),
    .s_axi_cfg_awsize(s_axi_cfg_awsize),
    .s_axi_cfg_awuser(s_axi_cfg_awuser),
    .s_axi_cfg_awvalid(s_axi_cfg_awvalid),
    .s_axi_cfg_bid(s_axi_cfg_bid),
    .s_axi_cfg_bready(s_axi_cfg_bready),
    .s_axi_cfg_bresp(s_axi_cfg_bresp),
    .s_axi_cfg_buser(s_axi_cfg_buser),
    .s_axi_cfg_bvalid(s_axi_cfg_bvalid),
    .s_axi_cfg_rdata(s_axi_cfg_rdata),
    .s_axi_cfg_rid(s_axi_cfg_rid),
    .s_axi_cfg_rlast(s_axi_cfg_rlast),
    .s_axi_cfg_rready(s_axi_cfg_rready),
    .s_axi_cfg_rresp(s_axi_cfg_rresp),
    .s_axi_cfg_ruser(s_axi_cfg_ruser),
    .s_axi_cfg_rvalid(s_axi_cfg_rvalid),
    .s_axi_cfg_wdata(s_axi_cfg_wdata),
    .s_axi_cfg_wid(s_axi_cfg_wid),
    .s_axi_cfg_wlast(s_axi_cfg_wlast),
    .s_axi_cfg_wready(s_axi_cfg_wready),
    .s_axi_cfg_wstrb(s_axi_cfg_wstrb),
    .s_axi_cfg_wuser(s_axi_cfg_wuser),
    .s_axi_cfg_wvalid(s_axi_cfg_wvalid),
    .xpipe0_powerdown(xpipe0_powerdown),
    .xpipe1_powerdown(xpipe1_powerdown),
    .xpipe2_powerdown(xpipe2_powerdown),
    .xpipe3_powerdown(xpipe3_powerdown),
    .xpipe4_powerdown(xpipe4_powerdown),
    .xpipe5_powerdown(xpipe5_powerdown),
    .xpipe6_powerdown(xpipe6_powerdown),
    .xpipe7_powerdown(xpipe7_powerdown),
    .xpipe8_powerdown(xpipe8_powerdown),
    .xpipe9_powerdown(xpipe9_powerdown),
    .xpipe10_powerdown(xpipe10_powerdown),
    .xpipe11_powerdown(xpipe11_powerdown),
    .xpipe12_powerdown(xpipe12_powerdown),
    .xpipe13_powerdown(xpipe13_powerdown),
    .xpipe14_powerdown(xpipe14_powerdown),
    .xpipe15_powerdown(xpipe15_powerdown),
    .xpipe1_phystatus(xpipe1_phystatus),
    .xpipe2_phystatus(xpipe2_phystatus),
    .xpipe3_phystatus(xpipe3_phystatus),
    .xpipe4_phystatus(xpipe4_phystatus),
    .xpipe5_phystatus(xpipe5_phystatus),
    .xpipe6_phystatus(xpipe6_phystatus),
    .xpipe7_phystatus(xpipe7_phystatus),
    .xpipe8_phystatus(xpipe8_phystatus),
    .xpipe9_phystatus(xpipe9_phystatus),
    .xpipe10_phystatus(xpipe10_phystatus),
    .xpipe11_phystatus(xpipe11_phystatus),
    .xpipe12_phystatus(xpipe12_phystatus),
    .xpipe13_phystatus(xpipe13_phystatus),
    .xpipe14_phystatus(xpipe14_phystatus),
    .xpipe15_phystatus(xpipe15_phystatus),
    .xpipe0_rx_charisk(xpipe0_rx_charisk),
    .xpipe1_rx_charisk(xpipe1_rx_charisk),
    .xpipe2_rx_charisk(xpipe2_rx_charisk),
    .xpipe3_rx_charisk(xpipe3_rx_charisk),
    .xpipe4_rx_charisk(xpipe4_rx_charisk),
    .xpipe5_rx_charisk(xpipe5_rx_charisk),
    .xpipe6_rx_charisk(xpipe6_rx_charisk),
    .xpipe7_rx_charisk(xpipe7_rx_charisk),
    .xpipe8_rx_charisk(xpipe8_rx_charisk),
    .xpipe9_rx_charisk(xpipe9_rx_charisk),
    .xpipe10_rx_charisk(xpipe10_rx_charisk),
    .xpipe11_rx_charisk(xpipe11_rx_charisk),
    .xpipe12_rx_charisk(xpipe12_rx_charisk),
    .xpipe13_rx_charisk(xpipe13_rx_charisk),
    .xpipe14_rx_charisk(xpipe14_rx_charisk),
    .xpipe15_rx_charisk(xpipe15_rx_charisk),
    .xpipe0_rx_data(xpipe0_rx_data),
    .xpipe1_rx_data(xpipe1_rx_data),
    .xpipe2_rx_data(xpipe2_rx_data),
    .xpipe3_rx_data(xpipe3_rx_data),
    .xpipe4_rx_data(xpipe4_rx_data),
    .xpipe5_rx_data(xpipe5_rx_data),
    .xpipe6_rx_data(xpipe6_rx_data),
    .xpipe7_rx_data(xpipe7_rx_data),
    .xpipe8_rx_data(xpipe8_rx_data),
    .xpipe9_rx_data(xpipe9_rx_data),
    .xpipe10_rx_data(xpipe10_rx_data),
    .xpipe11_rx_data(xpipe11_rx_data),
    .xpipe12_rx_data(xpipe12_rx_data),
    .xpipe13_rx_data(xpipe13_rx_data),
    .xpipe14_rx_data(xpipe14_rx_data),
    .xpipe15_rx_data(xpipe15_rx_data),
    .xpipe0_rx_datavalid(xpipe0_rx_datavalid),
    .xpipe1_rx_datavalid(xpipe1_rx_datavalid),
    .xpipe2_rx_datavalid(xpipe2_rx_datavalid),
    .xpipe3_rx_datavalid(xpipe3_rx_datavalid),
    .xpipe4_rx_datavalid(xpipe4_rx_datavalid),
    .xpipe5_rx_datavalid(xpipe5_rx_datavalid),
    .xpipe6_rx_datavalid(xpipe6_rx_datavalid),
    .xpipe7_rx_datavalid(xpipe7_rx_datavalid),
    .xpipe8_rx_datavalid(xpipe8_rx_datavalid),
    .xpipe9_rx_datavalid(xpipe9_rx_datavalid),
    .xpipe10_rx_datavalid(xpipe10_rx_datavalid),
    .xpipe11_rx_datavalid(xpipe11_rx_datavalid),
    .xpipe12_rx_datavalid(xpipe12_rx_datavalid),
    .xpipe13_rx_datavalid(xpipe13_rx_datavalid),
    .xpipe14_rx_datavalid(xpipe14_rx_datavalid),
    .xpipe15_rx_datavalid(xpipe15_rx_datavalid),
    .xpipe0_rx_elecidle(xpipe0_rx_elecidle),
    .xpipe1_rx_elecidle(xpipe1_rx_elecidle),
    .xpipe2_rx_elecidle(xpipe2_rx_elecidle),
    .xpipe3_rx_elecidle(xpipe3_rx_elecidle),
    .xpipe4_rx_elecidle(xpipe4_rx_elecidle),
    .xpipe5_rx_elecidle(xpipe5_rx_elecidle),
    .xpipe6_rx_elecidle(xpipe6_rx_elecidle),
    .xpipe7_rx_elecidle(xpipe7_rx_elecidle),
    .xpipe8_rx_elecidle(xpipe8_rx_elecidle),
    .xpipe9_rx_elecidle(xpipe9_rx_elecidle),
    .xpipe10_rx_elecidle(xpipe10_rx_elecidle),
    .xpipe11_rx_elecidle(xpipe11_rx_elecidle),
    .xpipe12_rx_elecidle(xpipe12_rx_elecidle),
    .xpipe13_rx_elecidle(xpipe13_rx_elecidle),
    .xpipe14_rx_elecidle(xpipe14_rx_elecidle),
    .xpipe15_rx_elecidle(xpipe15_rx_elecidle),
    .xpipe0_rx_polarity(xpipe0_rx_polarity),
    .xpipe1_rx_polarity(xpipe1_rx_polarity),
    .xpipe2_rx_polarity(xpipe2_rx_polarity),
    .xpipe3_rx_polarity(xpipe3_rx_polarity),
    .xpipe4_rx_polarity(xpipe4_rx_polarity),
    .xpipe5_rx_polarity(xpipe5_rx_polarity),
    .xpipe6_rx_polarity(xpipe6_rx_polarity),
    .xpipe7_rx_polarity(xpipe7_rx_polarity),
    .xpipe8_rx_polarity(xpipe8_rx_polarity),
    .xpipe9_rx_polarity(xpipe9_rx_polarity),
    .xpipe10_rx_polarity(xpipe10_rx_polarity),
    .xpipe11_rx_polarity(xpipe11_rx_polarity),
    .xpipe12_rx_polarity(xpipe12_rx_polarity),
    .xpipe13_rx_polarity(xpipe13_rx_polarity),
    .xpipe14_rx_polarity(xpipe14_rx_polarity),
    .xpipe15_rx_polarity(xpipe15_rx_polarity),
    .xpipe0_rx_startblock(xpipe0_rx_startblock),
    .xpipe1_rx_startblock(xpipe1_rx_startblock),
    .xpipe2_rx_startblock(xpipe2_rx_startblock),
    .xpipe3_rx_startblock(xpipe3_rx_startblock),
    .xpipe4_rx_startblock(xpipe4_rx_startblock),
    .xpipe5_rx_startblock(xpipe5_rx_startblock),
    .xpipe6_rx_startblock(xpipe6_rx_startblock),
    .xpipe7_rx_startblock(xpipe7_rx_startblock),
    .xpipe8_rx_startblock(xpipe8_rx_startblock),
    .xpipe9_rx_startblock(xpipe9_rx_startblock),
    .xpipe10_rx_startblock(xpipe10_rx_startblock),
    .xpipe11_rx_startblock(xpipe11_rx_startblock),
    .xpipe12_rx_startblock(xpipe12_rx_startblock),
    .xpipe13_rx_startblock(xpipe13_rx_startblock),
    .xpipe14_rx_startblock(xpipe14_rx_startblock),
    .xpipe15_rx_startblock(xpipe15_rx_startblock),
    .xpipe0_rx_status(xpipe0_rx_status),
    .xpipe1_rx_status(xpipe1_rx_status),
    .xpipe2_rx_status(xpipe2_rx_status),
    .xpipe3_rx_status(xpipe3_rx_status),
    .xpipe4_rx_status(xpipe4_rx_status),
    .xpipe5_rx_status(xpipe5_rx_status),
    .xpipe6_rx_status(xpipe6_rx_status),
    .xpipe7_rx_status(xpipe7_rx_status),
    .xpipe8_rx_status(xpipe8_rx_status),
    .xpipe9_rx_status(xpipe9_rx_status),
    .xpipe10_rx_status(xpipe10_rx_status),
    .xpipe11_rx_status(xpipe11_rx_status),
    .xpipe12_rx_status(xpipe12_rx_status),
    .xpipe13_rx_status(xpipe13_rx_status),
    .xpipe14_rx_status(xpipe14_rx_status),
    .xpipe15_rx_status(xpipe15_rx_status),
    .xpipe0_rx_syncheader(xpipe0_rx_syncheader),
    .xpipe1_rx_syncheader(xpipe1_rx_syncheader),
    .xpipe2_rx_syncheader(xpipe2_rx_syncheader),
    .xpipe3_rx_syncheader(xpipe3_rx_syncheader),
    .xpipe4_rx_syncheader(xpipe4_rx_syncheader),
    .xpipe5_rx_syncheader(xpipe5_rx_syncheader),
    .xpipe6_rx_syncheader(xpipe6_rx_syncheader),
    .xpipe7_rx_syncheader(xpipe7_rx_syncheader),
    .xpipe8_rx_syncheader(xpipe8_rx_syncheader),
    .xpipe9_rx_syncheader(xpipe9_rx_syncheader),
    .xpipe10_rx_syncheader(xpipe10_rx_syncheader),
    .xpipe11_rx_syncheader(xpipe11_rx_syncheader),
    .xpipe12_rx_syncheader(xpipe12_rx_syncheader),
    .xpipe13_rx_syncheader(xpipe13_rx_syncheader),
    .xpipe14_rx_syncheader(xpipe14_rx_syncheader),
    .xpipe15_rx_syncheader(xpipe15_rx_syncheader),
    .xpipe0_rx_termination(xpipe0_rx_termination),
    .xpipe1_rx_termination(xpipe1_rx_termination),
    .xpipe2_rx_termination(xpipe2_rx_termination),
    .xpipe3_rx_termination(xpipe3_rx_termination),
    .xpipe4_rx_termination(xpipe4_rx_termination),
    .xpipe5_rx_termination(xpipe5_rx_termination),
    .xpipe6_rx_termination(xpipe6_rx_termination),
    .xpipe7_rx_termination(xpipe7_rx_termination),
    .xpipe8_rx_termination(xpipe8_rx_termination),
    .xpipe9_rx_termination(xpipe9_rx_termination),
    .xpipe10_rx_termination(xpipe10_rx_termination),
    .xpipe11_rx_termination(xpipe11_rx_termination),
    .xpipe12_rx_termination(xpipe12_rx_termination),
    .xpipe13_rx_termination(xpipe13_rx_termination),
    .xpipe14_rx_termination(xpipe14_rx_termination),
    .xpipe15_rx_termination(xpipe15_rx_termination),
    .xpipe0_rx_valid(xpipe0_rx_valid),
    .xpipe1_rx_valid(xpipe1_rx_valid),
    .xpipe2_rx_valid(xpipe2_rx_valid),
    .xpipe3_rx_valid(xpipe3_rx_valid),
    .xpipe4_rx_valid(xpipe4_rx_valid),
    .xpipe5_rx_valid(xpipe5_rx_valid),
    .xpipe6_rx_valid(xpipe6_rx_valid),
    .xpipe7_rx_valid(xpipe7_rx_valid),
    .xpipe8_rx_valid(xpipe8_rx_valid),
    .xpipe9_rx_valid(xpipe9_rx_valid),
    .xpipe10_rx_valid(xpipe10_rx_valid),
    .xpipe11_rx_valid(xpipe11_rx_valid),
    .xpipe12_rx_valid(xpipe12_rx_valid),
    .xpipe13_rx_valid(xpipe13_rx_valid),
    .xpipe14_rx_valid(xpipe14_rx_valid),
    .xpipe15_rx_valid(xpipe15_rx_valid),
    .xpipe0_tx_charisk(xpipe0_tx_charisk),
    .xpipe1_tx_charisk(xpipe1_tx_charisk),
    .xpipe2_tx_charisk(xpipe2_tx_charisk),
    .xpipe3_tx_charisk(xpipe3_tx_charisk),
    .xpipe4_tx_charisk(xpipe4_tx_charisk),
    .xpipe5_tx_charisk(xpipe5_tx_charisk),
    .xpipe6_tx_charisk(xpipe6_tx_charisk),
    .xpipe7_tx_charisk(xpipe7_tx_charisk),
    .xpipe8_tx_charisk(xpipe8_tx_charisk),
    .xpipe9_tx_charisk(xpipe9_tx_charisk),
    .xpipe10_tx_charisk(xpipe10_tx_charisk),
    .xpipe11_tx_charisk(xpipe11_tx_charisk),
    .xpipe12_tx_charisk(xpipe12_tx_charisk),
    .xpipe13_tx_charisk(xpipe13_tx_charisk),
    .xpipe14_tx_charisk(xpipe14_tx_charisk),
    .xpipe15_tx_charisk(xpipe15_tx_charisk),
    .xpipe0_tx_compliance(xpipe0_tx_compliance),
    .xpipe1_tx_compliance(xpipe1_tx_compliance),
    .xpipe2_tx_compliance(xpipe2_tx_compliance),
    .xpipe3_tx_compliance(xpipe3_tx_compliance),
    .xpipe4_tx_compliance(xpipe4_tx_compliance),
    .xpipe5_tx_compliance(xpipe5_tx_compliance),
    .xpipe6_tx_compliance(xpipe6_tx_compliance),
    .xpipe7_tx_compliance(xpipe7_tx_compliance),
    .xpipe8_tx_compliance(xpipe8_tx_compliance),
    .xpipe9_tx_compliance(xpipe9_tx_compliance),
    .xpipe10_tx_compliance(xpipe10_tx_compliance),
    .xpipe11_tx_compliance(xpipe11_tx_compliance),
    .xpipe12_tx_compliance(xpipe12_tx_compliance),
    .xpipe13_tx_compliance(xpipe13_tx_compliance),
    .xpipe14_tx_compliance(xpipe14_tx_compliance),
    .xpipe15_tx_compliance(xpipe15_tx_compliance),
    .xpipe0_tx_data(xpipe0_tx_data),
    .xpipe1_tx_data(xpipe1_tx_data),
    .xpipe2_tx_data(xpipe2_tx_data),
    .xpipe3_tx_data(xpipe3_tx_data),
    .xpipe4_tx_data(xpipe4_tx_data),
    .xpipe5_tx_data(xpipe5_tx_data),
    .xpipe6_tx_data(xpipe6_tx_data),
    .xpipe7_tx_data(xpipe7_tx_data),
    .xpipe8_tx_data(xpipe8_tx_data),
    .xpipe9_tx_data(xpipe9_tx_data),
    .xpipe10_tx_data(xpipe10_tx_data),
    .xpipe11_tx_data(xpipe11_tx_data),
    .xpipe12_tx_data(xpipe12_tx_data),
    .xpipe13_tx_data(xpipe13_tx_data),
    .xpipe14_tx_data(xpipe14_tx_data),
    .xpipe15_tx_data(xpipe15_tx_data),
    .xpipe0_tx_datavalid(xpipe0_tx_datavalid),
    .xpipe1_tx_datavalid(xpipe1_tx_datavalid),
    .xpipe2_tx_datavalid(xpipe2_tx_datavalid),
    .xpipe3_tx_datavalid(xpipe3_tx_datavalid),
    .xpipe4_tx_datavalid(xpipe4_tx_datavalid),
    .xpipe5_tx_datavalid(xpipe5_tx_datavalid),
    .xpipe6_tx_datavalid(xpipe6_tx_datavalid),
    .xpipe7_tx_datavalid(xpipe7_tx_datavalid),
    .xpipe8_tx_datavalid(xpipe8_tx_datavalid),
    .xpipe9_tx_datavalid(xpipe9_tx_datavalid),
    .xpipe10_tx_datavalid(xpipe10_tx_datavalid),
    .xpipe11_tx_datavalid(xpipe11_tx_datavalid),
    .xpipe12_tx_datavalid(xpipe12_tx_datavalid),
    .xpipe13_tx_datavalid(xpipe13_tx_datavalid),
    .xpipe14_tx_datavalid(xpipe14_tx_datavalid),
    .xpipe15_tx_datavalid(xpipe15_tx_datavalid),
    .xpipe0_tx_deemph(xpipe0_tx_deemph),
    .xpipe1_tx_deemph(xpipe1_tx_deemph),
    .xpipe2_tx_deemph(xpipe2_tx_deemph),
    .xpipe3_tx_deemph(xpipe3_tx_deemph),
    .xpipe4_tx_deemph(xpipe4_tx_deemph),
    .xpipe5_tx_deemph(xpipe5_tx_deemph),
    .xpipe6_tx_deemph(xpipe6_tx_deemph),
    .xpipe7_tx_deemph(xpipe7_tx_deemph),
    .xpipe8_tx_deemph(xpipe8_tx_deemph),
    .xpipe9_tx_deemph(xpipe9_tx_deemph),
    .xpipe10_tx_deemph(xpipe10_tx_deemph),
    .xpipe11_tx_deemph(xpipe11_tx_deemph),
    .xpipe12_tx_deemph(xpipe12_tx_deemph),
    .xpipe13_tx_deemph(xpipe13_tx_deemph),
    .xpipe14_tx_deemph(xpipe14_tx_deemph),
    .xpipe15_tx_deemph(xpipe15_tx_deemph),
    .xpipe0_tx_detectrxloopback(xpipe0_tx_detectrxloopback),
    .xpipe1_tx_detectrxloopback(xpipe1_tx_detectrxloopback),
    .xpipe2_tx_detectrxloopback(xpipe2_tx_detectrxloopback),
    .xpipe3_tx_detectrxloopback(xpipe3_tx_detectrxloopback),
    .xpipe4_tx_detectrxloopback(xpipe4_tx_detectrxloopback),
    .xpipe5_tx_detectrxloopback(xpipe5_tx_detectrxloopback),
    .xpipe6_tx_detectrxloopback(xpipe6_tx_detectrxloopback),
    .xpipe7_tx_detectrxloopback(xpipe7_tx_detectrxloopback),
    .xpipe8_tx_detectrxloopback(xpipe8_tx_detectrxloopback),
    .xpipe9_tx_detectrxloopback(xpipe9_tx_detectrxloopback),
    .xpipe10_tx_detectrxloopback(xpipe10_tx_detectrxloopback),
    .xpipe11_tx_detectrxloopback(xpipe11_tx_detectrxloopback),
    .xpipe12_tx_detectrxloopback(xpipe12_tx_detectrxloopback),
    .xpipe13_tx_detectrxloopback(xpipe13_tx_detectrxloopback),
    .xpipe14_tx_detectrxloopback(xpipe14_tx_detectrxloopback),
    .xpipe15_tx_detectrxloopback(xpipe15_tx_detectrxloopback),
    .xpipe0_tx_elecidle(xpipe0_tx_elecidle),
    .xpipe1_tx_elecidle(xpipe1_tx_elecidle),
    .xpipe2_tx_elecidle(xpipe2_tx_elecidle),
    .xpipe3_tx_elecidle(xpipe3_tx_elecidle),
    .xpipe4_tx_elecidle(xpipe4_tx_elecidle),
    .xpipe5_tx_elecidle(xpipe5_tx_elecidle),
    .xpipe6_tx_elecidle(xpipe6_tx_elecidle),
    .xpipe7_tx_elecidle(xpipe7_tx_elecidle),
    .xpipe8_tx_elecidle(xpipe8_tx_elecidle),
    .xpipe9_tx_elecidle(xpipe9_tx_elecidle),
    .xpipe10_tx_elecidle(xpipe10_tx_elecidle),
    .xpipe11_tx_elecidle(xpipe11_tx_elecidle),
    .xpipe12_tx_elecidle(xpipe12_tx_elecidle),
    .xpipe13_tx_elecidle(xpipe13_tx_elecidle),
    .xpipe14_tx_elecidle(xpipe14_tx_elecidle),
    .xpipe15_tx_elecidle(xpipe15_tx_elecidle),
    .xpipe0_tx_maincursor(xpipe0_tx_maincursor),
    .xpipe1_tx_maincursor(xpipe1_tx_maincursor),
    .xpipe2_tx_maincursor(xpipe2_tx_maincursor),
    .xpipe3_tx_maincursor(xpipe3_tx_maincursor),
    .xpipe4_tx_maincursor(xpipe4_tx_maincursor),
    .xpipe5_tx_maincursor(xpipe5_tx_maincursor),
    .xpipe6_tx_maincursor(xpipe6_tx_maincursor),
    .xpipe7_tx_maincursor(xpipe7_tx_maincursor),
    .xpipe8_tx_maincursor(xpipe8_tx_maincursor),
    .xpipe9_tx_maincursor(xpipe9_tx_maincursor),
    .xpipe10_tx_maincursor(xpipe10_tx_maincursor),
    .xpipe11_tx_maincursor(xpipe11_tx_maincursor),
    .xpipe12_tx_maincursor(xpipe12_tx_maincursor),
    .xpipe13_tx_maincursor(xpipe13_tx_maincursor),
    .xpipe14_tx_maincursor(xpipe14_tx_maincursor),
    .xpipe15_tx_maincursor(xpipe15_tx_maincursor),
    .xpipe0_tx_margin(xpipe0_tx_margin),
    .xpipe1_tx_margin(xpipe1_tx_margin),
    .xpipe2_tx_margin(xpipe2_tx_margin),
    .xpipe3_tx_margin(xpipe3_tx_margin),
    .xpipe4_tx_margin(xpipe4_tx_margin),
    .xpipe5_tx_margin(xpipe5_tx_margin),
    .xpipe6_tx_margin(xpipe6_tx_margin),
    .xpipe7_tx_margin(xpipe7_tx_margin),
    .xpipe8_tx_margin(xpipe8_tx_margin),
    .xpipe9_tx_margin(xpipe9_tx_margin),
    .xpipe10_tx_margin(xpipe10_tx_margin),
    .xpipe11_tx_margin(xpipe11_tx_margin),
    .xpipe12_tx_margin(xpipe12_tx_margin),
    .xpipe13_tx_margin(xpipe13_tx_margin),
    .xpipe14_tx_margin(xpipe14_tx_margin),
    .xpipe15_tx_margin(xpipe15_tx_margin),
    .xpipe0_tx_postcursor(xpipe0_tx_postcursor),
    .xpipe1_tx_postcursor(xpipe1_tx_postcursor),
    .xpipe2_tx_postcursor(xpipe2_tx_postcursor),
    .xpipe3_tx_postcursor(xpipe3_tx_postcursor),
    .xpipe4_tx_postcursor(xpipe4_tx_postcursor),
    .xpipe5_tx_postcursor(xpipe5_tx_postcursor),
    .xpipe6_tx_postcursor(xpipe6_tx_postcursor),
    .xpipe7_tx_postcursor(xpipe7_tx_postcursor),
    .xpipe8_tx_postcursor(xpipe8_tx_postcursor),
    .xpipe9_tx_postcursor(xpipe9_tx_postcursor),
    .xpipe10_tx_postcursor(xpipe10_tx_postcursor),
    .xpipe11_tx_postcursor(xpipe11_tx_postcursor),
    .xpipe12_tx_postcursor(xpipe12_tx_postcursor),
    .xpipe13_tx_postcursor(xpipe13_tx_postcursor),
    .xpipe14_tx_postcursor(xpipe14_tx_postcursor),
    .xpipe15_tx_postcursor(xpipe15_tx_postcursor),
    .xpipe0_tx_precursor(xpipe0_tx_precursor),
    .xpipe1_tx_precursor(xpipe1_tx_precursor),
    .xpipe2_tx_precursor(xpipe2_tx_precursor),
    .xpipe3_tx_precursor(xpipe3_tx_precursor),
    .xpipe4_tx_precursor(xpipe4_tx_precursor),
    .xpipe5_tx_precursor(xpipe5_tx_precursor),
    .xpipe6_tx_precursor(xpipe6_tx_precursor),
    .xpipe7_tx_precursor(xpipe7_tx_precursor),
    .xpipe8_tx_precursor(xpipe8_tx_precursor),
    .xpipe9_tx_precursor(xpipe9_tx_precursor),
    .xpipe10_tx_precursor(xpipe10_tx_precursor),
    .xpipe11_tx_precursor(xpipe11_tx_precursor),
    .xpipe12_tx_precursor(xpipe12_tx_precursor),
    .xpipe13_tx_precursor(xpipe13_tx_precursor),
    .xpipe14_tx_precursor(xpipe14_tx_precursor),
    .xpipe15_tx_precursor(xpipe15_tx_precursor),
    .xpipe0_tx_startblock(xpipe0_tx_startblock),
    .xpipe1_tx_startblock(xpipe1_tx_startblock),
    .xpipe2_tx_startblock(xpipe2_tx_startblock),
    .xpipe3_tx_startblock(xpipe3_tx_startblock),
    .xpipe4_tx_startblock(xpipe4_tx_startblock),
    .xpipe5_tx_startblock(xpipe5_tx_startblock),
    .xpipe6_tx_startblock(xpipe6_tx_startblock),
    .xpipe7_tx_startblock(xpipe7_tx_startblock),
    .xpipe8_tx_startblock(xpipe8_tx_startblock),
    .xpipe9_tx_startblock(xpipe9_tx_startblock),
    .xpipe10_tx_startblock(xpipe10_tx_startblock),
    .xpipe11_tx_startblock(xpipe11_tx_startblock),
    .xpipe12_tx_startblock(xpipe12_tx_startblock),
    .xpipe13_tx_startblock(xpipe13_tx_startblock),
    .xpipe14_tx_startblock(xpipe14_tx_startblock),
    .xpipe15_tx_startblock(xpipe15_tx_startblock),
    .xpipe0_tx_swing(xpipe0_tx_swing),
    .xpipe1_tx_swing(xpipe1_tx_swing),
    .xpipe2_tx_swing(xpipe2_tx_swing),
    .xpipe3_tx_swing(xpipe3_tx_swing),
    .xpipe4_tx_swing(xpipe4_tx_swing),
    .xpipe5_tx_swing(xpipe5_tx_swing),
    .xpipe6_tx_swing(xpipe6_tx_swing),
    .xpipe7_tx_swing(xpipe7_tx_swing),
    .xpipe8_tx_swing(xpipe8_tx_swing),
    .xpipe9_tx_swing(xpipe9_tx_swing),
    .xpipe10_tx_swing(xpipe10_tx_swing),
    .xpipe11_tx_swing(xpipe11_tx_swing),
    .xpipe12_tx_swing(xpipe12_tx_swing),
    .xpipe13_tx_swing(xpipe13_tx_swing),
    .xpipe14_tx_swing(xpipe14_tx_swing),
    .xpipe15_tx_swing(xpipe15_tx_swing),
    .xpipe0_tx_syncheader(xpipe0_tx_syncheader),
    .xpipe1_tx_syncheader(xpipe1_tx_syncheader),
    .xpipe2_tx_syncheader(xpipe2_tx_syncheader),
    .xpipe3_tx_syncheader(xpipe3_tx_syncheader),
    .xpipe4_tx_syncheader(xpipe4_tx_syncheader),
    .xpipe5_tx_syncheader(xpipe5_tx_syncheader),
    .xpipe6_tx_syncheader(xpipe6_tx_syncheader),
    .xpipe7_tx_syncheader(xpipe7_tx_syncheader),
    .xpipe8_tx_syncheader(xpipe8_tx_syncheader),
    .xpipe9_tx_syncheader(xpipe9_tx_syncheader),
    .xpipe10_tx_syncheader(xpipe10_tx_syncheader),
    .xpipe11_tx_syncheader(xpipe11_tx_syncheader),
    .xpipe12_tx_syncheader(xpipe12_tx_syncheader),
    .xpipe13_tx_syncheader(xpipe13_tx_syncheader),
    .xpipe14_tx_syncheader(xpipe14_tx_syncheader),
    .xpipe15_tx_syncheader(xpipe15_tx_syncheader),
    .hsdp_xpipe0_rx_datavalid(hsdp_xpipe0_rx_datavalid),
    .hsdp_xpipe1_rx_datavalid(hsdp_xpipe1_rx_datavalid),
    .hsdp_xpipe2_rx_datavalid(hsdp_xpipe2_rx_datavalid),
    .hsdp_xpipe0_rx_gearboxslip(hsdp_xpipe0_rx_gearboxslip),
    .hsdp_xpipe1_rx_gearboxslip(hsdp_xpipe1_rx_gearboxslip),
    .hsdp_xpipe2_rx_gearboxslip(hsdp_xpipe2_rx_gearboxslip),
    .hsdp_xpipe0_rx_header(hsdp_xpipe0_rx_header),
    .hsdp_xpipe1_rx_header(hsdp_xpipe1_rx_header),
    .hsdp_xpipe2_rx_header(hsdp_xpipe2_rx_header),
    .hsdp_xpipe0_rx_headervalid(hsdp_xpipe0_rx_headervalid),
    .hsdp_xpipe1_rx_headervalid(hsdp_xpipe1_rx_headervalid),
    .hsdp_xpipe2_rx_headervalid(hsdp_xpipe2_rx_headervalid),
    .hsdp_xpipe0_rx_pcsreset(hsdp_xpipe0_rx_pcsreset),
    .hsdp_xpipe1_rx_pcsreset(hsdp_xpipe1_rx_pcsreset),
    .hsdp_xpipe2_rx_pcsreset(hsdp_xpipe2_rx_pcsreset),
    .hsdp_xpipe0_rx_resetdone(hsdp_xpipe0_rx_resetdone),
    .hsdp_xpipe1_rx_resetdone(hsdp_xpipe1_rx_resetdone),
    .hsdp_xpipe2_rx_resetdone(hsdp_xpipe2_rx_resetdone),
    .hsdp_xpipe0_tx_header(hsdp_xpipe0_tx_header),
    .hsdp_xpipe1_tx_header(hsdp_xpipe1_tx_header),
    .hsdp_xpipe2_tx_header(hsdp_xpipe2_tx_header),
    .hsdp_xpipe0_tx_resetdone(hsdp_xpipe0_tx_resetdone),
    .hsdp_xpipe1_tx_resetdone(hsdp_xpipe1_tx_resetdone),
    .hsdp_xpipe2_tx_resetdone(hsdp_xpipe2_tx_resetdone),
    .hsdp_xpipe0_tx_sequence(hsdp_xpipe0_tx_sequence),
    .hsdp_xpipe1_tx_sequence(hsdp_xpipe1_tx_sequence),
    .hsdp_xpipe2_tx_sequence(hsdp_xpipe2_tx_sequence),
    .hsdp_gt_rxoutclk(hsdp_gt_rxoutclk),
    .hsdp_gt_txusrclk(hsdp_gt_txusrclk),
    .phy_ready_frbot(phy_ready_frbot),
    .phy_ready_tobot(phy_ready_tobot),
    .link0_xpipe_bufgtce(link0_xpipe_bufgtce),
    .link1_xpipe_bufgtce(link1_xpipe_bufgtce),
    .link0_xpipe_bufgtcemask(link0_xpipe_bufgtcemask),
    .link1_xpipe_bufgtcemask(link1_xpipe_bufgtcemask),
    .link0_xpipe_bufgtdiv(link0_xpipe_bufgtdiv),
    .link1_xpipe_bufgtdiv(link1_xpipe_bufgtdiv),
    .link0_xpipe_bufgtrst(link0_xpipe_bufgtrst),
    .link1_xpipe_bufgtrst(link1_xpipe_bufgtrst),
    .link0_xpipe_bufgtrstmask(link0_xpipe_bufgtrstmask),
    .link1_xpipe_bufgtrstmask(link1_xpipe_bufgtrstmask),
    .link0_xpipe_gtoutclk(link0_xpipe_gtoutclk),
    .link1_xpipe_gtoutclk(link1_xpipe_gtoutclk),
    .link0_xpipe_gtpipeclk(link0_xpipe_gtpipeclk),
    .link1_xpipe_gtpipeclk(link1_xpipe_gtpipeclk),
    .link0_xpipe_pcielinkreachtarget(link0_xpipe_pcielinkreachtarget),
    .link1_xpipe_pcielinkreachtarget(link1_xpipe_pcielinkreachtarget),
    .link0_xpipe_pcieltssmstate(link0_xpipe_pcieltssmstate),
    .link1_xpipe_pcieltssmstate(link1_xpipe_pcieltssmstate),
    .link0_xpipe_pcieperstn(link0_xpipe_pcieperstn),
    .link1_xpipe_pcieperstn(link1_xpipe_pcieperstn),
    .link0_xpipe_phyesmadaptationsave(link0_xpipe_phyesmadaptationsave),
    .link1_xpipe_phyesmadaptationsave(link1_xpipe_phyesmadaptationsave),
    .link0_xpipe_phyready(link0_xpipe_phyready),
    .link1_xpipe_phyready(link1_xpipe_phyready),
    .link0_xpipe_piperate(link0_xpipe_piperate),
    .link1_xpipe_piperate(link1_xpipe_piperate),
    .s_axi_pcie_araddr(s_axi_pcie_araddr),
    .s_axi_pcie_arburst(s_axi_pcie_arburst),
    .s_axi_pcie_arcache(s_axi_pcie_arcache),
    .s_axi_pcie_arid(s_axi_pcie_arid),
    .s_axi_pcie_arlen(s_axi_pcie_arlen),
    .s_axi_pcie_arlock(s_axi_pcie_arlock),
    .s_axi_pcie_arprot(s_axi_pcie_arprot),
    .s_axi_pcie_arqos(s_axi_pcie_arqos),
    .s_axi_pcie_arready(s_axi_pcie_arready),
    .s_axi_pcie_arregion(s_axi_pcie_arregion),
    .s_axi_pcie_arsize(s_axi_pcie_arsize),
    .s_axi_pcie_aruser(s_axi_pcie_aruser),
    .s_axi_pcie_arvalid(s_axi_pcie_arvalid),
    .s_axi_pcie_awaddr(s_axi_pcie_awaddr),
    .s_axi_pcie_awburst(s_axi_pcie_awburst),
    .s_axi_pcie_awcache(s_axi_pcie_awcache),
    .s_axi_pcie_awid(s_axi_pcie_awid),
    .s_axi_pcie_awlen(s_axi_pcie_awlen),
    .s_axi_pcie_awlock(s_axi_pcie_awlock),
    .s_axi_pcie_awprot(s_axi_pcie_awprot),
    .s_axi_pcie_awqos(s_axi_pcie_awqos),
    .s_axi_pcie_awready(s_axi_pcie_awready),
    .s_axi_pcie_awregion(s_axi_pcie_awregion),
    .s_axi_pcie_awsize(s_axi_pcie_awsize),
    .s_axi_pcie_awuser(s_axi_pcie_awuser),
    .s_axi_pcie_awvalid(s_axi_pcie_awvalid),
    .s_axi_pcie_bid(s_axi_pcie_bid),
    .s_axi_pcie_bready(s_axi_pcie_bready),
    .s_axi_pcie_bresp(s_axi_pcie_bresp),
    .s_axi_pcie_buser(s_axi_pcie_buser),
    .s_axi_pcie_bvalid(s_axi_pcie_bvalid),
    .s_axi_pcie_rdata(s_axi_pcie_rdata),
    .s_axi_pcie_rid(s_axi_pcie_rid),
    .s_axi_pcie_rlast(s_axi_pcie_rlast),
    .s_axi_pcie_rready(s_axi_pcie_rready),
    .s_axi_pcie_rresp(s_axi_pcie_rresp),
    .s_axi_pcie_ruser(s_axi_pcie_ruser),
    .s_axi_pcie_rvalid(s_axi_pcie_rvalid),
    .s_axi_pcie_wdata(s_axi_pcie_wdata),
    .s_axi_pcie_wid(s_axi_pcie_wid),
    .s_axi_pcie_wlast(s_axi_pcie_wlast),
    .s_axi_pcie_wready(s_axi_pcie_wready),
    .s_axi_pcie_wstrb(s_axi_pcie_wstrb),
    .s_axi_pcie_wuser(s_axi_pcie_wuser),
    .s_axi_pcie_wvalid(s_axi_pcie_wvalid),
    .cpm_pcr_apb_en(cpm_pcr_apb_en),
    .cpm_pcr_dis_npi_clk(cpm_pcr_dis_npi_clk),
    .cpm_pcr_fabric_en(cpm_pcr_fabric_en),
    .cpm_pcr_gate_reg(cpm_pcr_gate_reg),
    .cpm_pcr_hold_state(cpm_pcr_hold_state),
    .cpm_pcr_init_state(cpm_pcr_init_state),
    .cpm_pcr_mem_clr(cpm_pcr_mem_clr),
    .cpm_pcr_o_disable(cpm_pcr_o_disable),
    .cpm_pcr_pcomplete(cpm_pcr_pcomplete),
    .cpm_pcr_pwr_dn(cpm_pcr_pwr_dn),
    .cpm_pcr_scan_clr(cpm_pcr_scan_clr),
    .cpm_pcr_start_bisr(cpm_pcr_start_bisr),
    .cpm_pcr_start_cal(cpm_pcr_start_cal),
    .cpm_pcr_tristate(cpm_pcr_tristate),
    .xpipe_q0_rxmargin_req_ack(xpipe_q0_rxmargin_req_ack),
    .xpipe_q1_rxmargin_req_ack(xpipe_q1_rxmargin_req_ack),
    .xpipe_q2_rxmargin_req_ack(xpipe_q2_rxmargin_req_ack),
    .xpipe_q3_rxmargin_req_ack(xpipe_q3_rxmargin_req_ack),
    .xpipe_q0_rxmargin_req_cmd(xpipe_q0_rxmargin_req_cmd),
    .xpipe_q1_rxmargin_req_cmd(xpipe_q1_rxmargin_req_cmd),
    .xpipe_q2_rxmargin_req_cmd(xpipe_q2_rxmargin_req_cmd),
    .xpipe_q3_rxmargin_req_cmd(xpipe_q3_rxmargin_req_cmd),
    .xpipe_q0_rxmargin_req_lanenum(xpipe_q0_rxmargin_req_lanenum),
    .xpipe_q1_rxmargin_req_lanenum(xpipe_q1_rxmargin_req_lanenum),
    .xpipe_q2_rxmargin_req_lanenum(xpipe_q2_rxmargin_req_lanenum),
    .xpipe_q3_rxmargin_req_lanenum(xpipe_q3_rxmargin_req_lanenum),
    .xpipe_q0_rxmargin_req_payload(xpipe_q0_rxmargin_req_payload),
    .xpipe_q1_rxmargin_req_payload(xpipe_q1_rxmargin_req_payload),
    .xpipe_q2_rxmargin_req_payload(xpipe_q2_rxmargin_req_payload),
    .xpipe_q3_rxmargin_req_payload(xpipe_q3_rxmargin_req_payload),
    .xpipe_q0_rxmargin_req_req(xpipe_q0_rxmargin_req_req),
    .xpipe_q1_rxmargin_req_req(xpipe_q1_rxmargin_req_req),
    .xpipe_q2_rxmargin_req_req(xpipe_q2_rxmargin_req_req),
    .xpipe_q3_rxmargin_req_req(xpipe_q3_rxmargin_req_req),
    .xpipe_q0_rxmargin_res_ack(xpipe_q0_rxmargin_res_ack),
    .xpipe_q1_rxmargin_res_ack(xpipe_q1_rxmargin_res_ack),
    .xpipe_q2_rxmargin_res_ack(xpipe_q2_rxmargin_res_ack),
    .xpipe_q3_rxmargin_res_ack(xpipe_q3_rxmargin_res_ack),
    .xpipe_q0_rxmargin_res_cmd(xpipe_q0_rxmargin_res_cmd),
    .xpipe_q1_rxmargin_res_cmd(xpipe_q1_rxmargin_res_cmd),
    .xpipe_q2_rxmargin_res_cmd(xpipe_q2_rxmargin_res_cmd),
    .xpipe_q3_rxmargin_res_cmd(xpipe_q3_rxmargin_res_cmd),
    .xpipe_q0_rxmargin_res_lanenum(xpipe_q0_rxmargin_res_lanenum),
    .xpipe_q1_rxmargin_res_lanenum(xpipe_q1_rxmargin_res_lanenum),
    .xpipe_q2_rxmargin_res_lanenum(xpipe_q2_rxmargin_res_lanenum),
    .xpipe_q3_rxmargin_res_lanenum(xpipe_q3_rxmargin_res_lanenum),
    .xpipe_q0_rxmargin_res_payload(xpipe_q0_rxmargin_res_payload),
    .xpipe_q1_rxmargin_res_payload(xpipe_q1_rxmargin_res_payload),
    .xpipe_q2_rxmargin_res_payload(xpipe_q2_rxmargin_res_payload),
    .xpipe_q3_rxmargin_res_payload(xpipe_q3_rxmargin_res_payload),
    .xpipe_q0_rxmargin_res_req(xpipe_q0_rxmargin_res_req),
    .xpipe_q1_rxmargin_res_req(xpipe_q1_rxmargin_res_req),
    .xpipe_q2_rxmargin_res_req(xpipe_q2_rxmargin_res_req),
    .xpipe_q3_rxmargin_res_req(xpipe_q3_rxmargin_res_req),
    .lpd_refclk_in(lpd_refclk_in),
    .lpd_switch_timeout_cnt(lpd_switch_timeout_cnt),
    .lpd_swclk(lpd_swclk),
    .perst0n(perst0n),
    .perst1n(perst1n),
    .pcie0_user_clk(pcie0_user_clk),
    .pcie1_user_clk(),
    .chi0_clk(1'B0),
    .chi1_clk(1'B0),
    .pl_ref_clk(1'B0),
    .cpm_misc_irq(cpm_misc_irq),
    .cpm_cor_irq(cpm_cor_irq),
    .cpm_uncor_irq(cpm_uncor_irq),
    .cpm_irq0(cpm_irq0),
    .cpm_irq1(cpm_irq1),
    .dma0_irq(dma0_irq),
    .pcie0_user_reset(),
    .pcie1_user_reset(),
    .dma0_axi_aresetn(dma0_axi_aresetn),
    .dma0_soft_resetn(dma0_soft_resetn),
    .pcie0_user_lnk_up(pcie0_user_lnk_up),
    .pcie1_user_lnk_up(),
    .chi0_syscoack(),
    .chi1_syscoack(),
    .chi0_ssactive(),
    .chi1_ssactive(),
    .chi0_reqlcrdv(),
    .chi1_reqlcrdv(),
    .chi0_snpflitv(),
    .chi1_snpflitv(),
    .chi0_crspflitv(),
    .chi1_crspflitv(),
    .chi0_rdatflitv(),
    .chi1_rdatflitv(),
    .chi0_srsplcrdv(),
    .chi1_srsplcrdv(),
    .chi0_wdatlcrdv(),
    .chi1_wdatlcrdv(),
    .chi0_snpflitpend(),
    .chi1_snpflitpend(),
    .chi0_crspflitpend(),
    .chi1_crspflitpend(),
    .chi0_rdatflitpend(),
    .chi1_rdatflitpend(),
    .chi0_mlinkactiveack(),
    .chi1_mlinkactiveack(),
    .chi0_slinkactivereq(),
    .chi1_slinkactivereq(),
    .chi0_syscoreq(1'B0),
    .chi1_syscoreq(1'B0),
    .chi0_msactive(1'B0),
    .chi1_msactive(1'B0),
    .chi0_reqflitv(1'B0),
    .chi1_reqflitv(1'B0),
    .chi0_snplcrdv(1'B0),
    .chi1_snplcrdv(1'B0),
    .chi0_crsplcrdv(1'B0),
    .chi1_crsplcrdv(1'B0),
    .chi0_rdatlcrdv(1'B0),
    .chi1_rdatlcrdv(1'B0),
    .chi0_srspflitv(1'B0),
    .chi1_srspflitv(1'B0),
    .chi0_wdatflitv(1'B0),
    .chi1_wdatflitv(1'B0),
    .chi0_snpflit(),
    .chi1_snpflit(),
    .chi0_crspflit(),
    .chi1_crspflit(),
    .chi0_rdatflit(),
    .chi1_rdatflit(),
    .chi0_reqflitpend(1'B0),
    .chi1_reqflitpend(1'B0),
    .chi0_srspflitpend(1'B0),
    .chi1_srspflitpend(1'B0),
    .chi0_wdatflitpend(1'B0),
    .chi1_wdatflitpend(1'B0),
    .chi0_mlinkactivereq(1'B0),
    .chi1_mlinkactivereq(1'B0),
    .chi0_slinkactiveack(1'B0),
    .chi1_slinkactiveack(1'B0),
    .chi0_reqflit(121'B0),
    .chi1_reqflit(121'B0),
    .chi0_srspflit(51'B0),
    .chi1_srspflit(51'B0),
    .chi0_wdatflit(705'B0),
    .chi1_wdatflit(705'B0),
    .pcie0_m_axis_cq_tdata(),
    .pcie1_m_axis_cq_tdata(),
    .pcie0_m_axis_rc_tdata(),
    .pcie1_m_axis_rc_tdata(),
    .pcie0_m_axis_cq_tkeep(),
    .pcie1_m_axis_cq_tkeep(),
    .pcie0_m_axis_rc_tkeep(),
    .pcie1_m_axis_rc_tkeep(),
    .pcie0_m_axis_cq_tlast(),
    .pcie1_m_axis_cq_tlast(),
    .pcie0_m_axis_rc_tlast(),
    .pcie1_m_axis_rc_tlast(),
    .pcie0_m_axis_cq_tready(1'B1),
    .pcie1_m_axis_cq_tready(1'B1),
    .pcie0_m_axis_rc_tready(1'B1),
    .pcie1_m_axis_rc_tready(1'B1),
    .pcie0_m_axis_cq_tuser(),
    .pcie1_m_axis_cq_tuser(),
    .pcie0_m_axis_rc_tuser(),
    .pcie1_m_axis_rc_tuser(),
    .pcie0_m_axis_cq_tvalid(),
    .pcie1_m_axis_cq_tvalid(),
    .pcie0_m_axis_rc_tvalid(),
    .pcie1_m_axis_rc_tvalid(),
    .pcie0_s_axis_rq_tready(),
    .pcie1_s_axis_rq_tready(),
    .pcie0_s_axis_cc_tready(),
    .pcie1_s_axis_cc_tready(),
    .pcie0_s_axis_rq_tdata(512'B0),
    .pcie1_s_axis_rq_tdata(64'B0),
    .pcie0_s_axis_cc_tdata(512'B0),
    .pcie1_s_axis_cc_tdata(64'B0),
    .pcie0_s_axis_rq_tkeep(16'B0),
    .pcie1_s_axis_rq_tkeep(2'B0),
    .pcie0_s_axis_cc_tkeep(16'B0),
    .pcie1_s_axis_cc_tkeep(2'B0),
    .pcie0_s_axis_rq_tlast(1'B0),
    .pcie1_s_axis_rq_tlast(1'B0),
    .pcie0_s_axis_cc_tlast(1'B0),
    .pcie1_s_axis_cc_tlast(1'B0),
    .pcie0_s_axis_rq_tuser(179'B0),
    .pcie1_s_axis_rq_tuser(62'B0),
    .pcie0_s_axis_cc_tuser(81'B0),
    .pcie1_s_axis_cc_tuser(33'B0),
    .pcie0_s_axis_rq_tvalid(1'B0),
    .pcie1_s_axis_rq_tvalid(1'B0),
    .pcie0_s_axis_cc_tvalid(1'B0),
    .pcie1_s_axis_cc_tvalid(1'B0),
    .pcie0_cfg_interrupt_sent(),
    .pcie1_cfg_interrupt_sent(),
    .pcie0_cfg_interrupt_int(4'B0),
    .pcie1_cfg_interrupt_int(4'B0),
    .pcie0_cfg_interrupt_pending(4'B0),
    .pcie1_cfg_interrupt_pending(4'B0),
    .pcie0_cfg_mgmt_read_en(1'B0),
    .pcie1_cfg_mgmt_read_en(1'B0),
    .pcie0_cfg_mgmt_read_write_done(),
    .pcie1_cfg_mgmt_read_write_done(),
    .pcie0_cfg_mgmt_write_en(1'B0),
    .pcie1_cfg_mgmt_write_en(1'B0),
    .pcie0_cfg_mgmt_debug_access(1'B0),
    .pcie1_cfg_mgmt_debug_access(1'B0),
    .pcie0_cfg_mgmt_read_data(),
    .pcie1_cfg_mgmt_read_data(),
    .pcie0_cfg_mgmt_addr(10'B0),
    .pcie1_cfg_mgmt_addr(10'B0),
    .pcie0_cfg_mgmt_byte_en(4'B0),
    .pcie1_cfg_mgmt_byte_en(4'B0),
    .pcie0_cfg_mgmt_write_data(32'B0),
    .pcie1_cfg_mgmt_write_data(32'B0),
    .pcie0_cfg_mgmt_function_number(8'B0),
    .pcie1_cfg_mgmt_function_number(8'B0),
    .pcie0_cfg_msg_transmit_done(),
    .pcie1_cfg_msg_transmit_done(),
    .pcie0_cfg_msg_transmit(1'B0),
    .pcie1_cfg_msg_transmit(1'B0),
    .pcie0_cfg_msg_transmit_type(3'B0),
    .pcie1_cfg_msg_transmit_type(3'B0),
    .pcie0_cfg_msg_transmit_data(32'B0),
    .pcie1_cfg_msg_transmit_data(32'B0),
    .pcie0_cfg_msg_received(),
    .pcie0_cfg_msg_received_data(),
    .pcie0_cfg_msg_received_type(),
    .pcie0_cfg_fc_ph(),
    .pcie1_cfg_fc_ph(),
    .pcie0_cfg_fc_pd(),
    .pcie1_cfg_fc_pd(),
    .pcie0_cfg_fc_nph(),
    .pcie1_cfg_fc_nph(),
    .pcie0_cfg_fc_npd(),
    .pcie1_cfg_fc_npd(),
    .pcie0_cfg_fc_vc_sel(1'B0),
    .pcie1_cfg_fc_vc_sel(1'B0),
    .pcie0_cfg_fc_pd_scale(),
    .pcie1_cfg_fc_pd_scale(),
    .pcie0_cfg_fc_ph_scale(),
    .pcie1_cfg_fc_ph_scale(),
    .pcie0_cfg_fc_npd_scale(),
    .pcie1_cfg_fc_npd_scale(),
    .pcie0_cfg_fc_nph_scale(),
    .pcie1_cfg_fc_nph_scale(),
    .pcie0_cfg_fc_sel(3'B0),
    .pcie1_cfg_fc_sel(3'B0),
    .pcie0_cfg_fc_cplh(),
    .pcie0_cfg_fc_cpld(),
    .pcie0_cfg_fc_cpld_scale(),
    .pcie0_cfg_fc_cplh_scale(),
    .pcie0_cfg_err_cor_in(1'B0),
    .pcie1_cfg_err_cor_in(1'B0),
    .pcie0_cfg_err_uncor_in(1'B0),
    .pcie1_cfg_err_uncor_in(1'B0),
    .pcie0_cfg_flr_done(4'B0),
    .pcie1_cfg_flr_done(4'B0),
    .pcie0_cfg_flr_in_process(),
    .pcie1_cfg_flr_in_process(),
    .pcie0_cfg_hot_reset_in(1'B0),
    .pcie1_cfg_hot_reset_in(1'B0),
    .pcie0_cfg_hot_reset_out(),
    .pcie1_cfg_hot_reset_out(),
    .pcie0_cfg_power_state_change_ack(1'B0),
    .pcie1_cfg_power_state_change_ack(1'B0),
    .pcie0_cfg_power_state_change_interrupt(),
    .pcie1_cfg_power_state_change_interrupt(),
    .pcie0_cfg_vf_flr_done(1'B0),
    .pcie1_cfg_vf_flr_done(1'B0),
    .pcie0_cfg_vf_flr_func_num(8'B0),
    .pcie1_cfg_vf_flr_func_num(8'B0),
    .pcie0_cfg_vf_flr_in_process(),
    .pcie1_cfg_vf_flr_in_process(),
    .pcie0_cfg_err_cor_out(),
    .pcie1_cfg_err_cor_out(),
    .pcie0_cfg_err_fatal_out(),
    .pcie1_cfg_err_fatal_out(),
    .pcie0_cfg_err_nonfatal_out(),
    .pcie1_cfg_err_nonfatal_out(),
    .pcie0_cfg_local_error_valid(),
    .pcie1_cfg_local_error_valid(),
    .pcie0_cfg_local_error_out(),
    .pcie1_cfg_local_error_out(),
    .pcie0_cfg_pasid_enable(),
    .pcie1_cfg_pasid_enable(),
    .pcie0_cfg_pasid_control(),
    .pcie1_cfg_pasid_control(),
    .pcie0_cfg_max_pasid_width_control(),
    .pcie1_cfg_max_pasid_width_control(),
    .pcie0_cfg_pasid_exec_permission_enable(),
    .pcie1_cfg_pasid_exec_permission_enable(),
    .pcie0_cfg_pasid_privil_mode_enable(),
    .pcie1_cfg_pasid_privil_mode_enable(),
    .pcie0_rq_tag_vld0(),
    .pcie1_rq_tag_vld0(),
    .pcie0_rq_tag_vld1(),
    .pcie1_rq_tag_vld1(),
    .pcie0_rq_seq_num_vld0(),
    .pcie1_rq_seq_num_vld0(),
    .pcie0_rq_seq_num_vld1(),
    .pcie1_rq_seq_num_vld1(),
    .pcie0_rq_tag_av(),
    .pcie1_rq_tag_av(),
    .pcie0_rq_tag0(),
    .pcie1_rq_tag0(),
    .pcie0_rq_tag1(),
    .pcie1_rq_tag1(),
    .pcie0_rq_seq_num0(),
    .pcie1_rq_seq_num0(),
    .pcie0_rq_seq_num1(),
    .pcie1_rq_seq_num1(),
    .pcie0_cq_np_req_count(),
    .pcie1_cq_np_req_count(),
    .pcie0_cq_np_req(2'B0),
    .pcie1_cq_np_req(2'B0),
    .pcie0_cfg_vf_status(),
    .pcie1_cfg_vf_status(),
    .pcie0_cfg_vf_power_state(),
    .pcie1_cfg_vf_power_state(),
    .pcie0_cfg_vf_tph_st_mode(),
    .pcie1_cfg_vf_tph_st_mode(),
    .pcie0_cfg_vf_ats_control_enable(),
    .pcie1_cfg_vf_ats_control_enable(),
    .pcie0_cfg_vf_tph_requester_enable(),
    .pcie1_cfg_vf_tph_requester_enable(),
    .pcie0_cfg_vc1_enable(),
    .pcie0_cfg_vc1_negotiation_pending(),
    .pcie0_cfg_function_power_state(),
    .pcie0_cfg_atomic_requester_enable(),
    .pcie0_cfg_phy_link_down(),
    .pcie1_cfg_phy_link_down(),
    .pcie0_cfg_ext_tag_enable(),
    .pcie1_cfg_ext_tag_enable(),
    .pcie0_cfg_pl_status_change(),
    .pcie1_cfg_pl_status_change(),
    .pcie0_cfg_rcb_status(),
    .pcie1_cfg_rcb_status(),
    .pcie0_cfg_pri_control(),
    .pcie1_cfg_pri_control(),
    .pcie0_cfg_ltssm_state(),
    .pcie1_cfg_ltssm_state(),
    .pcie0_cfg_max_payload(),
    .pcie1_cfg_max_payload(),
    .pcie0_cfg_tph_st_mode(),
    .pcie1_cfg_tph_st_mode(),
    .pcie0_cfg_max_read_req(),
    .pcie1_cfg_max_read_req(),
    .pcie0_cfg_current_speed(),
    .pcie1_cfg_current_speed(),
    .pcie0_cfg_rx_pm_state(),
    .pcie1_cfg_rx_pm_state(),
    .pcie0_cfg_tx_pm_state(),
    .pcie1_cfg_tx_pm_state(),
    .pcie0_cfg_phy_link_status(),
    .pcie1_cfg_phy_link_status(),
    .pcie0_cfg_function_status(),
    .pcie1_cfg_function_status(),
    .pcie0_cfg_link_power_state(),
    .pcie1_cfg_link_power_state(),
    .pcie0_cfg_negotiated_width(),
    .pcie1_cfg_negotiated_width(),
    .pcie0_cfg_ats_control_enable(),
    .pcie1_cfg_ats_control_enable(),
    .pcie0_cfg_tph_requester_enable(),
    .pcie1_cfg_tph_requester_enable(),
    .pcie0_cfg_10b_tag_requester_enable(),
    .pcie1_cfg_10b_tag_requester_enable(),
    .pcie0_cfg_ext_read_received(),
    .pcie1_cfg_ext_read_received(),
    .pcie0_cfg_ext_write_received(),
    .pcie1_cfg_ext_write_received(),
    .pcie0_cfg_ext_write_data(),
    .pcie1_cfg_ext_write_data(),
    .pcie0_cfg_ext_read_data_valid(1'B0),
    .pcie1_cfg_ext_read_data_valid(1'B0),
    .pcie0_cfg_ext_function_number(),
    .pcie1_cfg_ext_function_number(),
    .pcie0_cfg_ext_register_number(),
    .pcie1_cfg_ext_register_number(),
    .pcie0_cfg_ext_read_data(32'B0),
    .pcie1_cfg_ext_read_data(32'B0),
    .pcie0_cfg_ext_write_byte_enable(),
    .pcie1_cfg_ext_write_byte_enable(),
    .pcie0_tfc_npd_av(),
    .pcie1_tfc_npd_av(),
    .pcie0_tfc_nph_av(),
    .pcie1_tfc_nph_av(),
    .pcie0_edr_enable(),
    .pcie1_edr_enable(),
    .pcie0_edr_datarate_change_req(),
    .pcie1_edr_datarate_change_req(),
    .pcie0_edr_datarate_change_ack(1'B0),
    .pcie1_edr_datarate_change_ack(1'B0),
    .pcie0_cfg_msi_fail(),
    .pcie0_cfg_msi_sent(),
    .pcie0_cfg_msi_mask_update(),
    .pcie0_cfg_msi_data(),
    .pcie1_cfg_msi_data(),
    .pcie0_cfg_msi_enable(),
    .pcie1_cfg_msi_enable(),
    .pcie0_cfg_msi_mmenable(),
    .pcie1_cfg_msi_mmenable(),
    .pcie0_cfg_msi_tph_present(1'B0),
    .pcie1_cfg_msi_tph_present(1'B0),
    .pcie0_cfg_msi_attr(3'B0),
    .pcie1_cfg_msi_attr(3'B0),
    .pcie0_cfg_msi_select(2'B0),
    .pcie1_cfg_msi_select(2'B0),
    .pcie0_cfg_msi_tph_type(2'B0),
    .pcie1_cfg_msi_tph_type(2'B0),
    .pcie0_cfg_msi_tph_st_tag(8'B0),
    .pcie1_cfg_msi_tph_st_tag(8'B0),
    .pcie0_cfg_msi_int_vector(32'B0),
    .pcie1_cfg_msi_int_vector(32'B0),
    .pcie0_cfg_msi_pending_status(32'B0),
    .pcie1_cfg_msi_pending_status(32'B0),
    .pcie0_cfg_msi_function_number(8'B0),
    .pcie1_cfg_msi_function_number(8'B0),
    .pcie0_cfg_msi_pending_status_data_enable(1'B0),
    .pcie1_cfg_msi_pending_status_data_enable(1'B0),
    .pcie0_cfg_msi_pending_status_function_number(2'B0),
    .pcie1_cfg_msi_pending_status_function_number(2'B0),
    .pcie0_cfg_msix_fail(),
    .pcie0_cfg_msix_sent(),
    .pcie0_cfg_msix_vec_pending_status(),
    .pcie0_cfg_msix_mask(),
    .pcie1_cfg_msix_mask(),
    .pcie0_cfg_msix_enable(),
    .pcie1_cfg_msix_enable(),
    .pcie0_cfg_msix_vf_mask(),
    .pcie1_cfg_msix_vf_mask(),
    .pcie0_cfg_msix_vf_enable(),
    .pcie1_cfg_msix_vf_enable(),
    .pcie0_cfg_msix_int_vector(1'B0),
    .pcie1_cfg_msix_int_vector(1'B0),
    .pcie0_cfg_msix_tph_present(1'B0),
    .pcie1_cfg_msix_tph_present(1'B0),
    .pcie0_cfg_msix_attr(3'B0),
    .pcie1_cfg_msix_attr(3'B0),
    .pcie0_cfg_msix_data(32'B0),
    .pcie1_cfg_msix_data(32'B0),
    .pcie0_cfg_msix_address(64'B0),
    .pcie1_cfg_msix_address(64'B0),
    .pcie0_cfg_msix_tph_type(2'B0),
    .pcie1_cfg_msix_tph_type(2'B0),
    .pcie0_cfg_msix_tph_st_tag(8'B0),
    .pcie1_cfg_msix_tph_st_tag(8'B0),
    .pcie0_cfg_msix_vec_pending(2'B0),
    .pcie1_cfg_msix_vec_pending(2'B0),
    .pcie0_cfg_msix_mint_vector(32'B0),
    .pcie1_cfg_msix_mint_vector(32'B0),
    .pcie0_cfg_msix_function_number(8'B0),
    .pcie1_cfg_msix_function_number(8'B0),
    .pcie0_m_axis_dbg_tlast(),
    .pcie1_m_axis_dbg_tlast(),
    .pcie0_m_axis_dbg_tdata(),
    .pcie1_m_axis_dbg_tdata(),
    .pcie0_m_axis_dbg_tvalid(),
    .pcie1_m_axis_dbg_tvalid(),
    .pcie0_m_axis_dbg_tready(1'B1),
    .pcie1_m_axis_dbg_tready(1'B1),
    .pcie0_s_axis_dbg_tready(),
    .pcie1_s_axis_dbg_tready(),
    .pcie0_s_axis_dbg_tlast(1'B0),
    .pcie1_s_axis_dbg_tlast(1'B0),
    .pcie0_s_axis_dbg_tdata(32'B0),
    .pcie1_s_axis_dbg_tdata(32'B0),
    .pcie0_s_axis_dbg_tvalid(1'B0),
    .pcie1_s_axis_dbg_tvalid(1'B0),
    .pcie0_dbg_aclk(1'B0),
    .pcie1_dbg_aclk(1'B0),
    .pcie0_dbg_aresetn(1'B1),
    .pcie1_dbg_aresetn(1'B1),
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
    .dma0_m_axis_h2c_0_tdata(),
    .dma0_m_axis_h2c_1_tdata(),
    .dma0_m_axis_h2c_2_tdata(),
    .dma0_m_axis_h2c_3_tdata(),
    .dma0_m_axis_h2c_0_tkeep(),
    .dma0_m_axis_h2c_1_tkeep(),
    .dma0_m_axis_h2c_2_tkeep(),
    .dma0_m_axis_h2c_3_tkeep(),
    .dma0_m_axis_h2c_0_tlast(),
    .dma0_m_axis_h2c_1_tlast(),
    .dma0_m_axis_h2c_2_tlast(),
    .dma0_m_axis_h2c_3_tlast(),
    .dma0_m_axis_h2c_0_tready(1'B1),
    .dma0_m_axis_h2c_1_tready(1'B1),
    .dma0_m_axis_h2c_2_tready(1'B1),
    .dma0_m_axis_h2c_3_tready(1'B1),
    .dma0_m_axis_h2c_0_tuser(),
    .dma0_m_axis_h2c_1_tuser(),
    .dma0_m_axis_h2c_2_tuser(),
    .dma0_m_axis_h2c_3_tuser(),
    .dma0_m_axis_h2c_0_tvalid(),
    .dma0_m_axis_h2c_1_tvalid(),
    .dma0_m_axis_h2c_2_tvalid(),
    .dma0_m_axis_h2c_3_tvalid(),
    .dma0_s_axis_c2h_0_tdata(512'B0),
    .dma0_s_axis_c2h_1_tdata(512'B0),
    .dma0_s_axis_c2h_2_tdata(512'B0),
    .dma0_s_axis_c2h_3_tdata(512'B0),
    .dma0_s_axis_c2h_0_tkeep(64'B0),
    .dma0_s_axis_c2h_1_tkeep(64'B0),
    .dma0_s_axis_c2h_2_tkeep(64'B0),
    .dma0_s_axis_c2h_3_tkeep(64'B0),
    .dma0_s_axis_c2h_0_tlast(1'B0),
    .dma0_s_axis_c2h_1_tlast(1'B0),
    .dma0_s_axis_c2h_2_tlast(1'B0),
    .dma0_s_axis_c2h_3_tlast(1'B0),
    .dma0_s_axis_c2h_0_tready(),
    .dma0_s_axis_c2h_1_tready(),
    .dma0_s_axis_c2h_2_tready(),
    .dma0_s_axis_c2h_3_tready(),
    .dma0_s_axis_c2h_0_tuser(64'B0),
    .dma0_s_axis_c2h_1_tuser(64'B0),
    .dma0_s_axis_c2h_2_tuser(64'B0),
    .dma0_s_axis_c2h_3_tuser(64'B0),
    .dma0_s_axis_c2h_0_tvalid(1'B0),
    .dma0_s_axis_c2h_1_tvalid(1'B0),
    .dma0_s_axis_c2h_2_tvalid(1'B0),
    .dma0_s_axis_c2h_3_tvalid(1'B0),
    .dma0_c2h_dsc_byp_0_ready(),
    .dma0_h2c_dsc_byp_0_ready(),
    .dma0_c2h_dsc_byp_1_ready(),
    .dma0_h2c_dsc_byp_1_ready(),
    .dma0_c2h_dsc_byp_2_ready(),
    .dma0_h2c_dsc_byp_2_ready(),
    .dma0_c2h_dsc_byp_3_ready(),
    .dma0_h2c_dsc_byp_3_ready(),
    .dma0_c2h_dsc_byp_0_load(1'B0),
    .dma0_h2c_dsc_byp_0_load(1'B0),
    .dma0_c2h_dsc_byp_1_load(1'B0),
    .dma0_h2c_dsc_byp_1_load(1'B0),
    .dma0_c2h_dsc_byp_2_load(1'B0),
    .dma0_h2c_dsc_byp_2_load(1'B0),
    .dma0_c2h_dsc_byp_3_load(1'B0),
    .dma0_h2c_dsc_byp_3_load(1'B0),
    .dma0_c2h_dsc_byp_0_ctl(16'B0),
    .dma0_h2c_dsc_byp_0_ctl(16'B0),
    .dma0_c2h_dsc_byp_1_ctl(16'B0),
    .dma0_h2c_dsc_byp_1_ctl(16'B0),
    .dma0_c2h_dsc_byp_2_ctl(16'B0),
    .dma0_h2c_dsc_byp_2_ctl(16'B0),
    .dma0_c2h_dsc_byp_3_ctl(16'B0),
    .dma0_h2c_dsc_byp_3_ctl(16'B0),
    .dma0_c2h_dsc_byp_0_len(28'B0),
    .dma0_h2c_dsc_byp_0_len(28'B0),
    .dma0_c2h_dsc_byp_1_len(28'B0),
    .dma0_h2c_dsc_byp_1_len(28'B0),
    .dma0_c2h_dsc_byp_2_len(28'B0),
    .dma0_h2c_dsc_byp_2_len(28'B0),
    .dma0_c2h_dsc_byp_3_len(28'B0),
    .dma0_h2c_dsc_byp_3_len(28'B0),
    .dma0_c2h_dsc_byp_0_src_addr(64'B0),
    .dma0_h2c_dsc_byp_0_src_addr(64'B0),
    .dma0_c2h_dsc_byp_1_src_addr(64'B0),
    .dma0_h2c_dsc_byp_1_src_addr(64'B0),
    .dma0_c2h_dsc_byp_2_src_addr(64'B0),
    .dma0_h2c_dsc_byp_2_src_addr(64'B0),
    .dma0_c2h_dsc_byp_3_src_addr(64'B0),
    .dma0_h2c_dsc_byp_3_src_addr(64'B0),
    .dma0_c2h_dsc_byp_0_dst_addr(64'B0),
    .dma0_h2c_dsc_byp_0_dst_addr(64'B0),
    .dma0_c2h_dsc_byp_1_dst_addr(64'B0),
    .dma0_h2c_dsc_byp_1_dst_addr(64'B0),
    .dma0_c2h_dsc_byp_2_dst_addr(64'B0),
    .dma0_h2c_dsc_byp_2_dst_addr(64'B0),
    .dma0_c2h_dsc_byp_3_dst_addr(64'B0),
    .dma0_h2c_dsc_byp_3_dst_addr(64'B0),
    .dma0_c2h_sts_0(),
    .dma0_h2c_sts_0(),
    .dma0_c2h_sts_1(),
    .dma0_h2c_sts_1(),
    .dma0_c2h_sts_2(),
    .dma0_h2c_sts_2(),
    .dma0_c2h_sts_3(),
    .dma0_h2c_sts_3(),
    .dma0_st_rx_msg_last(dma0_st_rx_msg_last),
    .dma0_st_rx_msg_valid(dma0_st_rx_msg_valid),
    .dma0_st_rx_msg_rdy(dma0_st_rx_msg_rdy),
    .dma0_st_rx_msg_data(dma0_st_rx_msg_data),
    .xdma0_usr_irq_ack(xdma0_usr_irq_ack),
    .xdma0_usr_irq_req(xdma0_usr_irq_req),
    .xdma0_usr_irq_fnc(8'B0),
    .dma0_usr_flr_set(),
    .dma0_usr_flr_clr(),
    .dma0_usr_flr_fnc(),
    .dma0_usr_flr_done_vld(1'B0),
    .dma0_usr_flr_done_fnc(8'B0),
    .dma0_s_axis_c2h_tready(),
    .dma0_s_axis_c2h_tlast(1'B0),
    .dma0_s_axis_c2h_tvalid(1'B0),
    .dma0_s_axis_c2h_dpar(64'B0),
    .dma0_s_axis_c2h_tdata(512'B0),
    .dma0_s_axis_c2h_mty(6'B0),
    .dma0_s_axis_c2h_ctrl_marker(1'B0),
    .dma0_s_axis_c2h_ctrl_dis_cmpt(1'B0),
    .dma0_s_axis_c2h_ctrl_imm_data(1'B0),
    .dma0_s_axis_c2h_ctrl_user_trig(1'B0),
    .dma0_s_axis_c2h_ctrl_len(16'B0),
    .dma0_s_axis_c2h_ctrl_qid(11'B0),
    .dma0_s_axis_c2h_ctrl_port_id(3'B0),
    .dma0_s_axis_c2h_cmpt_tready(),
    .dma0_s_axis_c2h_cmpt_tlast(1'B0),
    .dma0_s_axis_c2h_cmpt_tvalid(1'B0),
    .dma0_s_axis_c2h_cmpt_dpar(4'B0),
    .dma0_s_axis_c2h_cmpt_tdata(128'B0),
    .dma0_s_axis_c2h_cmpt_size(2'B0),
    .dma0_m_axis_h2c_tlast(),
    .dma0_m_axis_h2c_tuser_err(),
    .dma0_m_axis_h2c_tvalid(),
    .dma0_m_axis_h2c_tdata(),
    .dma0_m_axis_h2c_tuser_zero_byte(),
    .dma0_m_axis_h2c_tready(1'B1),
    .dma0_m_axis_h2c_dpar(),
    .dma0_m_axis_h2c_tuser_mty(),
    .dma0_m_axis_h2c_tuser_qid(),
    .dma0_m_axis_h2c_tuser_mdata(),
    .dma0_m_axis_h2c_tuser_port_id(),
    .dma0_h2c_byp_out_vld(),
    .dma0_h2c_byp_out_error(),
    .dma0_h2c_byp_out_st_mm(),
    .dma0_h2c_byp_out_mrkr_rsp(),
    .dma0_h2c_byp_out_rdy(1'B1),
    .dma0_h2c_byp_out_qid(),
    .dma0_h2c_byp_out_dsc(),
    .dma0_h2c_byp_out_func(),
    .dma0_h2c_byp_out_cidx(),
    .dma0_h2c_byp_out_dsc_sz(),
    .dma0_h2c_byp_out_port_id(),
    .dma0_c2h_byp_out_vld(),
    .dma0_c2h_byp_out_error(),
    .dma0_c2h_byp_out_st_mm(),
    .dma0_c2h_byp_out_mrkr_rsp(),
    .dma0_c2h_byp_out_rdy(1'B1),
    .dma0_c2h_byp_out_qid(),
    .dma0_c2h_byp_out_dsc(),
    .dma0_c2h_byp_out_func(),
    .dma0_c2h_byp_out_cidx(),
    .dma0_c2h_byp_out_dsc_sz(),
    .dma0_c2h_byp_out_port_id(),
    .dma0_c2h_byp_in_mm_rdy(),
    .dma0_c2h_byp_in_mm_sdi(1'B0),
    .dma0_c2h_byp_in_mm_vld(1'B0),
    .dma0_c2h_byp_in_mm_error(1'B0),
    .dma0_c2h_byp_in_mm_mrkr_req(1'B0),
    .dma0_c2h_byp_in_mm_len(28'B0),
    .dma0_c2h_byp_in_mm_qid(11'B0),
    .dma0_c2h_byp_in_mm_func(8'B0),
    .dma0_c2h_byp_in_mm_cidx(16'B0),
    .dma0_c2h_byp_in_mm_radr(64'B0),
    .dma0_c2h_byp_in_mm_wadr(64'B0),
    .dma0_c2h_byp_in_mm_port_id(3'B0),
    .dma0_c2h_byp_in_st_csh_rdy(),
    .dma0_c2h_byp_in_st_csh_vld(1'B0),
    .dma0_c2h_byp_in_st_csh_error(1'B0),
    .dma0_c2h_byp_in_st_csh_qid(11'B0),
    .dma0_c2h_byp_in_st_csh_func(8'B0),
    .dma0_c2h_byp_in_st_csh_addr(64'B0),
    .dma0_c2h_byp_in_st_csh_port_id(3'B0),
    .dma0_c2h_byp_in_st_sim_rdy(),
    .dma0_c2h_byp_in_st_sim_vld(1'B0),
    .dma0_c2h_byp_in_st_sim_error(1'B0),
    .dma0_c2h_byp_in_st_sim_qid(11'B0),
    .dma0_c2h_byp_in_st_sim_func(8'B0),
    .dma0_c2h_byp_in_st_sim_addr(64'B0),
    .dma0_c2h_byp_in_st_sim_port_id(3'B0),
    .dma0_h2c_byp_in_mm_rdy(),
    .dma0_h2c_byp_in_mm_sdi(1'B0),
    .dma0_h2c_byp_in_mm_vld(1'B0),
    .dma0_h2c_byp_in_mm_error(1'B0),
    .dma0_h2c_byp_in_mm_mrkr_req(1'B0),
    .dma0_h2c_byp_in_mm_len(28'B0),
    .dma0_h2c_byp_in_mm_qid(11'B0),
    .dma0_h2c_byp_in_mm_func(8'B0),
    .dma0_h2c_byp_in_mm_cidx(16'B0),
    .dma0_h2c_byp_in_mm_radr(64'B0),
    .dma0_h2c_byp_in_mm_wadr(64'B0),
    .dma0_h2c_byp_in_mm_port_id(3'B0),
    .dma0_h2c_byp_in_st_rdy(),
    .dma0_h2c_byp_in_st_eop(1'B0),
    .dma0_h2c_byp_in_st_sdi(1'B0),
    .dma0_h2c_byp_in_st_sop(1'B0),
    .dma0_h2c_byp_in_st_vld(1'B0),
    .dma0_h2c_byp_in_st_error(1'B0),
    .dma0_h2c_byp_in_st_no_dma(1'B0),
    .dma0_h2c_byp_in_st_mrkr_req(1'B0),
    .dma0_h2c_byp_in_st_len(16'B0),
    .dma0_h2c_byp_in_st_qid(11'B0),
    .dma0_h2c_byp_in_st_func(8'B0),
    .dma0_h2c_byp_in_st_addr(64'B0),
    .dma0_h2c_byp_in_st_cidx(16'B0),
    .dma0_h2c_byp_in_st_port_id(3'B0),
    .dma0_tm_dsc_sts_mm(),
    .dma0_tm_dsc_sts_qen(),
    .dma0_tm_dsc_sts_byp(),
    .dma0_tm_dsc_sts_dir(),
    .dma0_tm_dsc_sts_err(),
    .dma0_tm_dsc_sts_vld(),
    .dma0_tm_dsc_sts_qinv(),
    .dma0_tm_dsc_sts_irq_arm(),
    .dma0_tm_dsc_sts_rdy(1'B1),
    .dma0_tm_dsc_sts_qid(),
    .dma0_tm_dsc_sts_avl(),
    .dma0_tm_dsc_sts_port_id(),
    .dma0_dsc_crdt_in_rdy(),
    .dma0_dsc_crdt_in_sel(1'B0),
    .dma0_dsc_crdt_in_vld(1'B0),
    .dma0_dsc_crdt_in_qid(11'B0),
    .dma0_dsc_crdt_in_crdt(16'B0),
    .dma0_usr_irq_fail(),
    .dma0_usr_irq_vld(1'B0),
    .dma0_usr_irq_ack(),
    .dma0_usr_irq_vec(5'B0),
    .dma0_usr_irq_fnc(8'B0),
    .dma0_axis_c2h_status_drop(),
    .dma0_axis_c2h_status_valid(),
    .dma0_axis_c2h_status_qid(),
    .pcie0_gt_txn(pcie0_gt_txn),
    .pcie1_gt_txn(),
    .pcie0_gt_txp(pcie0_gt_txp),
    .pcie1_gt_txp(),
    .pcie0_gt_rxn(pcie0_gt_rxn),
    .pcie1_gt_rxn(1'B0),
    .pcie0_gt_rxp(pcie0_gt_rxp),
    .pcie1_gt_rxp(1'B0),
    .hsdp0_gt_txn(),
    .hsdp1_gt_txn(),
    .hsdp0_gt_txp(),
    .hsdp1_gt_txp(),
    .hsdp0_gt_rxn(1'B0),
    .hsdp1_gt_rxn(1'B0),
    .hsdp0_gt_rxp(1'B0),
    .hsdp1_gt_rxp(1'B0),
    .gt_refclk0_n(gt_refclk0_n),
    .gt_refclk1_n(1'B0),
    .gt_refclk0_p(gt_refclk0_p),
    .gt_refclk1_p(1'B0),
    .gt_refclk0_ibuf_out(),
    .gt_refclk1_ibuf_out(),
    .gt_refclk0_ibuf_odiv2(),
    .gt_refclk1_ibuf_odiv2()
  );
endmodule
