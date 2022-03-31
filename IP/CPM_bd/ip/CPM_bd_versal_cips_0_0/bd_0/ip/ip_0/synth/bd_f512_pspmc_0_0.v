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


// IP VLNV: xilinx.com:ip:pspmc:1.0
// IP Revision: 3

(* X_CORE_INFO = "pspmc_v1_0_3_pspmc,Vivado 2021.1" *)
(* CHECK_LICENSE_TYPE = "bd_f512_pspmc_0_0,pspmc_v1_0_3_pspmc,{}" *)
(* CORE_GENERATION_INFO = "bd_f512_pspmc_0_0,pspmc_v1_0_3_pspmc,{x_ipProduct=Vivado 2021.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=pspmc,x_ipVersion=1.0,x_ipCoreRevision=3,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_M_AXI_GP0_DATA_WIDTH=128,C_M_AXI_GP2_DATA_WIDTH=128,C_DIFF_RW_CLK_S_AXI_GP0=0,C_DIFF_RW_CLK_S_AXI_GP2=0,C_DIFF_RW_CLK_S_AXI_GP4=0,C_S_AXI_GP0_DATA_WIDTH=128,C_S_AXI_GP2_DATA_WIDTH=128,C_S_AXI_GP4_DATA_WIDTH=128,C_S_AXI_ACP_DATA_WIDTH=128,C_S_AXI_ACE_DATA_WIDTH=128,C_PS_NOC_CCI_DATA_WIDTH=128,C_PS_NOC_NC\
I_DATA_WIDTH=128,C_NOC_PS_CCI_DATA_WIDTH=128,C_PS_NOC_PMC_DATA_WIDTH=128,C_NOC_PS_PMC_DATA_WIDTH=128,C_PS_NOC_RPU_DATA_WIDTH=128,C_PS_EMIO_GPIO_WIDTH=32,C_PMC_EMIO_GPIO_WIDTH=64,C_PMC_GPO_WIDTH=32,C_PMC_GPI_WIDTH=32,C_PMC_NOC_ADDR_WIDTH=64,C_PMC_NOC_DATA_WIDTH=128,C_NOC_PMC_ADDR_WIDTH=64,C_NOC_PMC_DATA_WIDTH=128,C_XDEVICE=xcvc1902,C_SIM_DEVICE=VERSAL_AI_CORE,C_SPP_PSPMC_TO_CORE_WIDTH=12000,C_SPP_PSPMC_FROM_CORE_WIDTH=12000,C_NUM_F2P0_INTR_INPUTS=1,C_NUM_F2P1_INTR_INPUTS=1,C_PMCPL_CLK0_BUF=1,C_PM\
CPL_CLK1_BUF=1,C_PMCPL_CLK2_BUF=1,C_PMCPL_CLK3_BUF=1,C_PMCPL_IRO_CLK_BUF=1,C_ACE_LITE=0,C_PS_USE_S_AXI_GP2=0,C_AXI4_EXT_USER_BITS=0,C_SUBCORE_NAME=design_2_versal_cips_0_0_gt_quad_base,C_VIP_SUBCORE_NAME=versal_cips_ps_vip,C_CORE_NAME=design_2_versal_cips_0_0,C_SD0_DATA_WIDTH=4,C_SD1_DATA_WIDTH=4,C_PS_TRACE_WIDTH=32,C_PS_USE_STARTUP=0,C_PS_USE_CAPTURE=0,C_PS_USE_RPU_INTERRUPT=0,C_PS_PCIE_EP_RESET1_IO=_PMC_MIO 38_,C_PS_PCIE_EP_RESET2_IO=_PS_MIO 19_}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_f512_pspmc_0_0 (
  noc_cpm_pcie_axi0_clk,
  noc_cpm_pcie_axi0_araddr,
  noc_cpm_pcie_axi0_arburst,
  noc_cpm_pcie_axi0_arcache,
  noc_cpm_pcie_axi0_arid,
  noc_cpm_pcie_axi0_arlen,
  noc_cpm_pcie_axi0_arlock,
  noc_cpm_pcie_axi0_arprot,
  noc_cpm_pcie_axi0_arqos,
  noc_cpm_pcie_axi0_arsize,
  noc_cpm_pcie_axi0_aruser,
  noc_cpm_pcie_axi0_arvalid,
  noc_cpm_pcie_axi0_awaddr,
  noc_cpm_pcie_axi0_awburst,
  noc_cpm_pcie_axi0_awcache,
  noc_cpm_pcie_axi0_awid,
  noc_cpm_pcie_axi0_awlen,
  noc_cpm_pcie_axi0_awlock,
  noc_cpm_pcie_axi0_awprot,
  noc_cpm_pcie_axi0_awqos,
  noc_cpm_pcie_axi0_awsize,
  noc_cpm_pcie_axi0_awuser,
  noc_cpm_pcie_axi0_awvalid,
  noc_cpm_pcie_axi0_bready,
  noc_cpm_pcie_axi0_rready,
  noc_cpm_pcie_axi0_wdata,
  noc_cpm_pcie_axi0_wlast,
  noc_cpm_pcie_axi0_wstrb,
  noc_cpm_pcie_axi0_wvalid,
  noc_cpm_pcie_axi0_arready,
  noc_cpm_pcie_axi0_awready,
  noc_cpm_pcie_axi0_bid,
  noc_cpm_pcie_axi0_bresp,
  noc_cpm_pcie_axi0_bvalid,
  noc_cpm_pcie_axi0_rdata,
  noc_cpm_pcie_axi0_rid,
  noc_cpm_pcie_axi0_rlast,
  noc_cpm_pcie_axi0_rresp,
  noc_cpm_pcie_axi0_rvalid,
  noc_cpm_pcie_axi0_wready,
  cpm_pcie_noc_axi0_clk,
  cpm_pcie_noc_axi0_araddr,
  cpm_pcie_noc_axi0_arburst,
  cpm_pcie_noc_axi0_arcache,
  cpm_pcie_noc_axi0_arid,
  cpm_pcie_noc_axi0_arlen,
  cpm_pcie_noc_axi0_arlock,
  cpm_pcie_noc_axi0_arprot,
  cpm_pcie_noc_axi0_arqos,
  cpm_pcie_noc_axi0_arsize,
  cpm_pcie_noc_axi0_aruser,
  cpm_pcie_noc_axi0_arvalid,
  cpm_pcie_noc_axi0_awaddr,
  cpm_pcie_noc_axi0_awburst,
  cpm_pcie_noc_axi0_awcache,
  cpm_pcie_noc_axi0_awid,
  cpm_pcie_noc_axi0_awlen,
  cpm_pcie_noc_axi0_awlock,
  cpm_pcie_noc_axi0_awprot,
  cpm_pcie_noc_axi0_awqos,
  cpm_pcie_noc_axi0_awsize,
  cpm_pcie_noc_axi0_awuser,
  cpm_pcie_noc_axi0_awvalid,
  cpm_pcie_noc_axi0_bready,
  cpm_pcie_noc_axi0_rready,
  cpm_pcie_noc_axi0_wdata,
  cpm_pcie_noc_axi0_wlast,
  cpm_pcie_noc_axi0_wstrb,
  cpm_pcie_noc_axi0_wvalid,
  cpm_pcie_noc_axi0_arready,
  cpm_pcie_noc_axi0_awready,
  cpm_pcie_noc_axi0_bid,
  cpm_pcie_noc_axi0_bresp,
  cpm_pcie_noc_axi0_bvalid,
  cpm_pcie_noc_axi0_rdata,
  cpm_pcie_noc_axi0_rid,
  cpm_pcie_noc_axi0_rlast,
  cpm_pcie_noc_axi0_rresp,
  cpm_pcie_noc_axi0_rvalid,
  cpm_pcie_noc_axi0_wready,
  cpm_pcie_noc_axi1_clk,
  cpm_pcie_noc_axi1_araddr,
  cpm_pcie_noc_axi1_arburst,
  cpm_pcie_noc_axi1_arcache,
  cpm_pcie_noc_axi1_arid,
  cpm_pcie_noc_axi1_arlen,
  cpm_pcie_noc_axi1_arlock,
  cpm_pcie_noc_axi1_arprot,
  cpm_pcie_noc_axi1_arqos,
  cpm_pcie_noc_axi1_arsize,
  cpm_pcie_noc_axi1_aruser,
  cpm_pcie_noc_axi1_arvalid,
  cpm_pcie_noc_axi1_awaddr,
  cpm_pcie_noc_axi1_awburst,
  cpm_pcie_noc_axi1_awcache,
  cpm_pcie_noc_axi1_awid,
  cpm_pcie_noc_axi1_awlen,
  cpm_pcie_noc_axi1_awlock,
  cpm_pcie_noc_axi1_awprot,
  cpm_pcie_noc_axi1_awqos,
  cpm_pcie_noc_axi1_awsize,
  cpm_pcie_noc_axi1_awuser,
  cpm_pcie_noc_axi1_awvalid,
  cpm_pcie_noc_axi1_bready,
  cpm_pcie_noc_axi1_rready,
  cpm_pcie_noc_axi1_wdata,
  cpm_pcie_noc_axi1_wlast,
  cpm_pcie_noc_axi1_wstrb,
  cpm_pcie_noc_axi1_wvalid,
  cpm_pcie_noc_axi1_arready,
  cpm_pcie_noc_axi1_awready,
  cpm_pcie_noc_axi1_bid,
  cpm_pcie_noc_axi1_bresp,
  cpm_pcie_noc_axi1_bvalid,
  cpm_pcie_noc_axi1_rdata,
  cpm_pcie_noc_axi1_rid,
  cpm_pcie_noc_axi1_rlast,
  cpm_pcie_noc_axi1_rresp,
  cpm_pcie_noc_axi1_rvalid,
  cpm_pcie_noc_axi1_wready,
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
  perst1n
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME noc_cpm_pcie_axi0_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, ASSOCIATED_BUSIF NOC_CPM_PCIE_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NSU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 noc_cpm_pcie_axi0_clk CLK" *)
output wire noc_cpm_pcie_axi0_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARADDR" *)
input wire [63 : 0] noc_cpm_pcie_axi0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARBURST" *)
input wire [1 : 0] noc_cpm_pcie_axi0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARCACHE" *)
input wire [3 : 0] noc_cpm_pcie_axi0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARID" *)
input wire [1 : 0] noc_cpm_pcie_axi0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARLEN" *)
input wire [7 : 0] noc_cpm_pcie_axi0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARLOCK" *)
input wire noc_cpm_pcie_axi0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARPROT" *)
input wire [2 : 0] noc_cpm_pcie_axi0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARQOS" *)
input wire [3 : 0] noc_cpm_pcie_axi0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARSIZE" *)
input wire [2 : 0] noc_cpm_pcie_axi0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARUSER" *)
input wire [17 : 0] noc_cpm_pcie_axi0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARVALID" *)
input wire noc_cpm_pcie_axi0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWADDR" *)
input wire [63 : 0] noc_cpm_pcie_axi0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWBURST" *)
input wire [1 : 0] noc_cpm_pcie_axi0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWCACHE" *)
input wire [3 : 0] noc_cpm_pcie_axi0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWID" *)
input wire [1 : 0] noc_cpm_pcie_axi0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWLEN" *)
input wire [7 : 0] noc_cpm_pcie_axi0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWLOCK" *)
input wire noc_cpm_pcie_axi0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWPROT" *)
input wire [2 : 0] noc_cpm_pcie_axi0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWQOS" *)
input wire [3 : 0] noc_cpm_pcie_axi0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWSIZE" *)
input wire [2 : 0] noc_cpm_pcie_axi0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWUSER" *)
input wire [17 : 0] noc_cpm_pcie_axi0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWVALID" *)
input wire noc_cpm_pcie_axi0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BREADY" *)
input wire noc_cpm_pcie_axi0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RREADY" *)
input wire noc_cpm_pcie_axi0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WDATA" *)
input wire [127 : 0] noc_cpm_pcie_axi0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WLAST" *)
input wire noc_cpm_pcie_axi0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WSTRB" *)
input wire [15 : 0] noc_cpm_pcie_axi0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WVALID" *)
input wire noc_cpm_pcie_axi0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 ARREADY" *)
output wire noc_cpm_pcie_axi0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 AWREADY" *)
output wire noc_cpm_pcie_axi0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BID" *)
output wire [1 : 0] noc_cpm_pcie_axi0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BRESP" *)
output wire [1 : 0] noc_cpm_pcie_axi0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 BVALID" *)
output wire noc_cpm_pcie_axi0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RDATA" *)
output wire [127 : 0] noc_cpm_pcie_axi0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RID" *)
output wire [1 : 0] noc_cpm_pcie_axi0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RLAST" *)
output wire noc_cpm_pcie_axi0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RRESP" *)
output wire [1 : 0] noc_cpm_pcie_axi0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 RVALID" *)
output wire noc_cpm_pcie_axi0_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME NOC_CPM_PCIE_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 2, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, NUM_REA\
D_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL NOC_NSU_TO_PS_PCIE, HD_TANDEM 0, INDEX 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 NOC_CPM_PCIE_0 WREADY" *)
output wire noc_cpm_pcie_axi0_wready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cpm_pcie_noc_axi0_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, ASSOCIATED_BUSIF CPM_PCIE_NOC_0, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 cpm_pcie_noc_axi0_clk CLK" *)
output wire cpm_pcie_noc_axi0_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARADDR" *)
output wire [63 : 0] cpm_pcie_noc_axi0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARBURST" *)
output wire [1 : 0] cpm_pcie_noc_axi0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARCACHE" *)
output wire [3 : 0] cpm_pcie_noc_axi0_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARID" *)
output wire [15 : 0] cpm_pcie_noc_axi0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLEN" *)
output wire [7 : 0] cpm_pcie_noc_axi0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARLOCK" *)
output wire cpm_pcie_noc_axi0_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARPROT" *)
output wire [2 : 0] cpm_pcie_noc_axi0_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARQOS" *)
output wire [3 : 0] cpm_pcie_noc_axi0_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARSIZE" *)
output wire [2 : 0] cpm_pcie_noc_axi0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARUSER" *)
output wire [17 : 0] cpm_pcie_noc_axi0_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARVALID" *)
output wire cpm_pcie_noc_axi0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWADDR" *)
output wire [63 : 0] cpm_pcie_noc_axi0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWBURST" *)
output wire [1 : 0] cpm_pcie_noc_axi0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWCACHE" *)
output wire [3 : 0] cpm_pcie_noc_axi0_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWID" *)
output wire [15 : 0] cpm_pcie_noc_axi0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLEN" *)
output wire [7 : 0] cpm_pcie_noc_axi0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWLOCK" *)
output wire cpm_pcie_noc_axi0_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWPROT" *)
output wire [2 : 0] cpm_pcie_noc_axi0_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWQOS" *)
output wire [3 : 0] cpm_pcie_noc_axi0_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWSIZE" *)
output wire [2 : 0] cpm_pcie_noc_axi0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWUSER" *)
output wire [17 : 0] cpm_pcie_noc_axi0_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWVALID" *)
output wire cpm_pcie_noc_axi0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BREADY" *)
output wire cpm_pcie_noc_axi0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RREADY" *)
output wire cpm_pcie_noc_axi0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WDATA" *)
output wire [127 : 0] cpm_pcie_noc_axi0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WLAST" *)
output wire cpm_pcie_noc_axi0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WSTRB" *)
output wire [15 : 0] cpm_pcie_noc_axi0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WVALID" *)
output wire cpm_pcie_noc_axi0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 ARREADY" *)
input wire cpm_pcie_noc_axi0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 AWREADY" *)
input wire cpm_pcie_noc_axi0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BID" *)
input wire [15 : 0] cpm_pcie_noc_axi0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BRESP" *)
input wire [1 : 0] cpm_pcie_noc_axi0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 BVALID" *)
input wire cpm_pcie_noc_axi0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RDATA" *)
input wire [127 : 0] cpm_pcie_noc_axi0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RID" *)
input wire [15 : 0] cpm_pcie_noc_axi0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RLAST" *)
input wire cpm_pcie_noc_axi0_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RRESP" *)
input wire [1 : 0] cpm_pcie_noc_axi0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 RVALID" *)
input wire cpm_pcie_noc_axi0_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, NUM_RE\
AD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, HD_TANDEM 0, INDEX 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_0 WREADY" *)
input wire cpm_pcie_noc_axi0_wready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cpm_pcie_noc_axi1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, ASSOCIATED_BUSIF CPM_PCIE_NOC_1, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 cpm_pcie_noc_axi1_clk CLK" *)
output wire cpm_pcie_noc_axi1_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARADDR" *)
output wire [63 : 0] cpm_pcie_noc_axi1_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARBURST" *)
output wire [1 : 0] cpm_pcie_noc_axi1_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARCACHE" *)
output wire [3 : 0] cpm_pcie_noc_axi1_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARID" *)
output wire [15 : 0] cpm_pcie_noc_axi1_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLEN" *)
output wire [7 : 0] cpm_pcie_noc_axi1_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARLOCK" *)
output wire cpm_pcie_noc_axi1_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARPROT" *)
output wire [2 : 0] cpm_pcie_noc_axi1_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARQOS" *)
output wire [3 : 0] cpm_pcie_noc_axi1_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARSIZE" *)
output wire [2 : 0] cpm_pcie_noc_axi1_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARUSER" *)
output wire [17 : 0] cpm_pcie_noc_axi1_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARVALID" *)
output wire cpm_pcie_noc_axi1_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWADDR" *)
output wire [63 : 0] cpm_pcie_noc_axi1_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWBURST" *)
output wire [1 : 0] cpm_pcie_noc_axi1_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWCACHE" *)
output wire [3 : 0] cpm_pcie_noc_axi1_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWID" *)
output wire [15 : 0] cpm_pcie_noc_axi1_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLEN" *)
output wire [7 : 0] cpm_pcie_noc_axi1_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWLOCK" *)
output wire cpm_pcie_noc_axi1_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWPROT" *)
output wire [2 : 0] cpm_pcie_noc_axi1_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWQOS" *)
output wire [3 : 0] cpm_pcie_noc_axi1_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWSIZE" *)
output wire [2 : 0] cpm_pcie_noc_axi1_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWUSER" *)
output wire [17 : 0] cpm_pcie_noc_axi1_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWVALID" *)
output wire cpm_pcie_noc_axi1_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BREADY" *)
output wire cpm_pcie_noc_axi1_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RREADY" *)
output wire cpm_pcie_noc_axi1_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WDATA" *)
output wire [127 : 0] cpm_pcie_noc_axi1_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WLAST" *)
output wire cpm_pcie_noc_axi1_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WSTRB" *)
output wire [15 : 0] cpm_pcie_noc_axi1_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WVALID" *)
output wire cpm_pcie_noc_axi1_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 ARREADY" *)
input wire cpm_pcie_noc_axi1_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 AWREADY" *)
input wire cpm_pcie_noc_axi1_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BID" *)
input wire [15 : 0] cpm_pcie_noc_axi1_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BRESP" *)
input wire [1 : 0] cpm_pcie_noc_axi1_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 BVALID" *)
input wire cpm_pcie_noc_axi1_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RDATA" *)
input wire [127 : 0] cpm_pcie_noc_axi1_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RID" *)
input wire [15 : 0] cpm_pcie_noc_axi1_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RLAST" *)
input wire cpm_pcie_noc_axi1_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RRESP" *)
input wire [1 : 0] cpm_pcie_noc_axi1_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 RVALID" *)
input wire cpm_pcie_noc_axi1_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPM_PCIE_NOC_1, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, NUM_RE\
AD_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, CATEGORY noc, MY_CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU, HD_TANDEM 0, INDEX 1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPM_PCIE_NOC_1 WREADY" *)
input wire cpm_pcie_noc_axi1_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_osc_clk_div2" *)
output wire cpm_osc_clk_div2;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_araddr" *)
input wire [63 : 0] m_axi0_ps_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arburst" *)
input wire [1 : 0] m_axi0_ps_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arcache" *)
input wire [3 : 0] m_axi0_ps_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arid" *)
input wire [15 : 0] m_axi0_ps_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arlen" *)
input wire [7 : 0] m_axi0_ps_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arlock" *)
input wire m_axi0_ps_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arprot" *)
input wire [2 : 0] m_axi0_ps_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arqos" *)
input wire [3 : 0] m_axi0_ps_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arready" *)
output wire m_axi0_ps_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arregion" *)
input wire [3 : 0] m_axi0_ps_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arsize" *)
input wire [2 : 0] m_axi0_ps_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_aruser" *)
input wire [31 : 0] m_axi0_ps_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_arvalid" *)
input wire m_axi0_ps_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awaddr" *)
input wire [63 : 0] m_axi0_ps_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awburst" *)
input wire [1 : 0] m_axi0_ps_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awcache" *)
input wire [3 : 0] m_axi0_ps_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awid" *)
input wire [15 : 0] m_axi0_ps_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awlen" *)
input wire [7 : 0] m_axi0_ps_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awlock" *)
input wire m_axi0_ps_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awprot" *)
input wire [2 : 0] m_axi0_ps_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awqos" *)
input wire [3 : 0] m_axi0_ps_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awready" *)
output wire m_axi0_ps_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awregion" *)
input wire [3 : 0] m_axi0_ps_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awsize" *)
input wire [2 : 0] m_axi0_ps_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awuser" *)
input wire [31 : 0] m_axi0_ps_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_awvalid" *)
input wire m_axi0_ps_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bid" *)
output wire [15 : 0] m_axi0_ps_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bready" *)
input wire m_axi0_ps_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bresp" *)
output wire [1 : 0] m_axi0_ps_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_buser" *)
output wire m_axi0_ps_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_bvalid" *)
output wire m_axi0_ps_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rdata" *)
output wire [127 : 0] m_axi0_ps_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rid" *)
output wire [15 : 0] m_axi0_ps_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rlast" *)
output wire m_axi0_ps_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rready" *)
input wire m_axi0_ps_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rresp" *)
output wire [1 : 0] m_axi0_ps_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_ruser" *)
output wire [17 : 0] m_axi0_ps_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_rvalid" *)
output wire m_axi0_ps_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wdata" *)
input wire [127 : 0] m_axi0_ps_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wid" *)
input wire [15 : 0] m_axi0_ps_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wlast" *)
input wire m_axi0_ps_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wready" *)
output wire m_axi0_ps_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wstrb" *)
input wire [15 : 0] m_axi0_ps_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wuser" *)
input wire [17 : 0] m_axi0_ps_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi0_ps_wvalid" *)
input wire m_axi0_ps_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_araddr" *)
input wire [63 : 0] m_axi1_ps_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arburst" *)
input wire [1 : 0] m_axi1_ps_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arcache" *)
input wire [3 : 0] m_axi1_ps_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arid" *)
input wire [15 : 0] m_axi1_ps_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arlen" *)
input wire [7 : 0] m_axi1_ps_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arlock" *)
input wire m_axi1_ps_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arprot" *)
input wire [2 : 0] m_axi1_ps_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arqos" *)
input wire [3 : 0] m_axi1_ps_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arready" *)
output wire m_axi1_ps_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arregion" *)
input wire [3 : 0] m_axi1_ps_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arsize" *)
input wire [2 : 0] m_axi1_ps_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_aruser" *)
input wire [17 : 0] m_axi1_ps_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_arvalid" *)
input wire m_axi1_ps_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awaddr" *)
input wire [63 : 0] m_axi1_ps_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awburst" *)
input wire [1 : 0] m_axi1_ps_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awcache" *)
input wire [3 : 0] m_axi1_ps_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awid" *)
input wire [15 : 0] m_axi1_ps_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awlen" *)
input wire [7 : 0] m_axi1_ps_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awlock" *)
input wire m_axi1_ps_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awprot" *)
input wire [2 : 0] m_axi1_ps_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awqos" *)
input wire [3 : 0] m_axi1_ps_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awready" *)
output wire m_axi1_ps_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awregion" *)
input wire [3 : 0] m_axi1_ps_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awsize" *)
input wire [2 : 0] m_axi1_ps_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awuser" *)
input wire [17 : 0] m_axi1_ps_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_awvalid" *)
input wire m_axi1_ps_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bid" *)
output wire [15 : 0] m_axi1_ps_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bready" *)
input wire m_axi1_ps_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bresp" *)
output wire [1 : 0] m_axi1_ps_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_buser" *)
output wire [15 : 0] m_axi1_ps_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_bvalid" *)
output wire m_axi1_ps_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rdata" *)
output wire [127 : 0] m_axi1_ps_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rid" *)
output wire [15 : 0] m_axi1_ps_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rlast" *)
output wire m_axi1_ps_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rready" *)
input wire m_axi1_ps_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rresp" *)
output wire [1 : 0] m_axi1_ps_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_ruser" *)
output wire [16 : 0] m_axi1_ps_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_rvalid" *)
output wire m_axi1_ps_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wdata" *)
input wire [127 : 0] m_axi1_ps_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wid" *)
input wire [15 : 0] m_axi1_ps_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wlast" *)
input wire m_axi1_ps_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wready" *)
output wire m_axi1_ps_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wstrb" *)
input wire [15 : 0] m_axi1_ps_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wuser" *)
input wire [16 : 0] m_axi1_ps_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM m_axi1_ps_wvalid" *)
input wire m_axi1_ps_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpmps_corr_irq" *)
input wire cpmps_corr_irq;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpmps_misc_irq" *)
input wire cpmps_misc_irq;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpmps_uncorr_irq" *)
input wire cpmps_uncorr_irq;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_araddr" *)
output wire [63 : 0] s_axi_cfg_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arburst" *)
output wire [1 : 0] s_axi_cfg_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arcache" *)
output wire [3 : 0] s_axi_cfg_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arid" *)
output wire [15 : 0] s_axi_cfg_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arlen" *)
output wire [7 : 0] s_axi_cfg_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arlock" *)
output wire s_axi_cfg_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arprot" *)
output wire [2 : 0] s_axi_cfg_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arqos" *)
output wire [3 : 0] s_axi_cfg_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arready" *)
input wire s_axi_cfg_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arregion" *)
output wire [3 : 0] s_axi_cfg_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arsize" *)
output wire [2 : 0] s_axi_cfg_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_aruser" *)
output wire [15 : 0] s_axi_cfg_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_arvalid" *)
output wire s_axi_cfg_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awaddr" *)
output wire [63 : 0] s_axi_cfg_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awburst" *)
output wire [1 : 0] s_axi_cfg_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awcache" *)
output wire [3 : 0] s_axi_cfg_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awid" *)
output wire [15 : 0] s_axi_cfg_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awlen" *)
output wire [7 : 0] s_axi_cfg_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awlock" *)
output wire s_axi_cfg_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awprot" *)
output wire [2 : 0] s_axi_cfg_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awqos" *)
output wire [3 : 0] s_axi_cfg_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awready" *)
input wire s_axi_cfg_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awregion" *)
output wire [3 : 0] s_axi_cfg_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awsize" *)
output wire [2 : 0] s_axi_cfg_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awuser" *)
output wire [15 : 0] s_axi_cfg_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_awvalid" *)
output wire s_axi_cfg_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bid" *)
input wire [15 : 0] s_axi_cfg_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bready" *)
output wire s_axi_cfg_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bresp" *)
input wire [1 : 0] s_axi_cfg_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_buser" *)
input wire s_axi_cfg_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_bvalid" *)
input wire s_axi_cfg_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rdata" *)
input wire [31 : 0] s_axi_cfg_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rid" *)
input wire [15 : 0] s_axi_cfg_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rlast" *)
input wire s_axi_cfg_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rready" *)
output wire s_axi_cfg_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rresp" *)
input wire [1 : 0] s_axi_cfg_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_ruser" *)
input wire [5 : 0] s_axi_cfg_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_rvalid" *)
input wire s_axi_cfg_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wdata" *)
output wire [31 : 0] s_axi_cfg_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wid" *)
output wire [15 : 0] s_axi_cfg_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wlast" *)
output wire s_axi_cfg_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wready" *)
input wire s_axi_cfg_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wstrb" *)
output wire [3 : 0] s_axi_cfg_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wuser" *)
output wire [5 : 0] s_axi_cfg_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_cfg_wvalid" *)
output wire s_axi_cfg_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_powerdown" *)
output wire [1 : 0] xpipe0_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_powerdown" *)
output wire [1 : 0] xpipe1_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_powerdown" *)
output wire [1 : 0] xpipe2_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_powerdown" *)
output wire [1 : 0] xpipe3_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_powerdown" *)
output wire [1 : 0] xpipe4_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_powerdown" *)
output wire [1 : 0] xpipe5_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_powerdown" *)
output wire [1 : 0] xpipe6_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_powerdown" *)
output wire [1 : 0] xpipe7_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_powerdown" *)
output wire [1 : 0] xpipe8_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_powerdown" *)
output wire [1 : 0] xpipe9_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_powerdown" *)
output wire [1 : 0] xpipe10_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_powerdown" *)
output wire [1 : 0] xpipe11_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_powerdown" *)
output wire [1 : 0] xpipe12_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_powerdown" *)
output wire [1 : 0] xpipe13_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_powerdown" *)
output wire [1 : 0] xpipe14_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_powerdown" *)
output wire [1 : 0] xpipe15_powerdown;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_phystatus" *)
input wire xpipe1_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_phystatus" *)
input wire xpipe2_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_phystatus" *)
input wire xpipe3_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_phystatus" *)
input wire xpipe4_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_phystatus" *)
input wire xpipe5_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_phystatus" *)
input wire xpipe6_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_phystatus" *)
input wire xpipe7_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_phystatus" *)
input wire xpipe8_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_phystatus" *)
input wire xpipe9_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_phystatus" *)
input wire xpipe10_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_phystatus" *)
input wire xpipe11_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_phystatus" *)
input wire xpipe12_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_phystatus" *)
input wire xpipe13_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_phystatus" *)
input wire xpipe14_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_phystatus" *)
input wire xpipe15_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_charisk" *)
input wire [1 : 0] xpipe0_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_charisk" *)
input wire [1 : 0] xpipe1_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_charisk" *)
input wire [1 : 0] xpipe2_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_charisk" *)
input wire [1 : 0] xpipe3_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_charisk" *)
input wire [1 : 0] xpipe4_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_charisk" *)
input wire [1 : 0] xpipe5_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_charisk" *)
input wire [1 : 0] xpipe6_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_charisk" *)
input wire [1 : 0] xpipe7_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_charisk" *)
input wire [1 : 0] xpipe8_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_charisk" *)
input wire [1 : 0] xpipe9_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_charisk" *)
input wire [1 : 0] xpipe10_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_charisk" *)
input wire [1 : 0] xpipe11_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_charisk" *)
input wire [1 : 0] xpipe12_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_charisk" *)
input wire [1 : 0] xpipe13_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_charisk" *)
input wire [1 : 0] xpipe14_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_charisk" *)
input wire [1 : 0] xpipe15_rx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_data" *)
input wire [31 : 0] xpipe0_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_data" *)
input wire [31 : 0] xpipe1_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_data" *)
input wire [31 : 0] xpipe2_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_data" *)
input wire [31 : 0] xpipe3_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_data" *)
input wire [31 : 0] xpipe4_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_data" *)
input wire [31 : 0] xpipe5_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_data" *)
input wire [31 : 0] xpipe6_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_data" *)
input wire [31 : 0] xpipe7_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_data" *)
input wire [31 : 0] xpipe8_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_data" *)
input wire [31 : 0] xpipe9_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_data" *)
input wire [31 : 0] xpipe10_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_data" *)
input wire [31 : 0] xpipe11_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_data" *)
input wire [31 : 0] xpipe12_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_data" *)
input wire [31 : 0] xpipe13_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_data" *)
input wire [31 : 0] xpipe14_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_data" *)
input wire [31 : 0] xpipe15_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_datavalid" *)
input wire xpipe0_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_datavalid" *)
input wire xpipe1_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_datavalid" *)
input wire xpipe2_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_datavalid" *)
input wire xpipe3_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_datavalid" *)
input wire xpipe4_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_datavalid" *)
input wire xpipe5_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_datavalid" *)
input wire xpipe6_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_datavalid" *)
input wire xpipe7_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_datavalid" *)
input wire xpipe8_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_datavalid" *)
input wire xpipe9_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_datavalid" *)
input wire xpipe10_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_datavalid" *)
input wire xpipe11_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_datavalid" *)
input wire xpipe12_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_datavalid" *)
input wire xpipe13_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_datavalid" *)
input wire xpipe14_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_datavalid" *)
input wire xpipe15_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_elecidle" *)
input wire xpipe0_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_elecidle" *)
input wire xpipe1_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_elecidle" *)
input wire xpipe2_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_elecidle" *)
input wire xpipe3_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_elecidle" *)
input wire xpipe4_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_elecidle" *)
input wire xpipe5_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_elecidle" *)
input wire xpipe6_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_elecidle" *)
input wire xpipe7_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_elecidle" *)
input wire xpipe8_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_elecidle" *)
input wire xpipe9_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_elecidle" *)
input wire xpipe10_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_elecidle" *)
input wire xpipe11_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_elecidle" *)
input wire xpipe12_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_elecidle" *)
input wire xpipe13_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_elecidle" *)
input wire xpipe14_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_elecidle" *)
input wire xpipe15_rx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_polarity" *)
output wire xpipe0_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_polarity" *)
output wire xpipe1_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_polarity" *)
output wire xpipe2_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_polarity" *)
output wire xpipe3_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_polarity" *)
output wire xpipe4_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_polarity" *)
output wire xpipe5_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_polarity" *)
output wire xpipe6_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_polarity" *)
output wire xpipe7_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_polarity" *)
output wire xpipe8_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_polarity" *)
output wire xpipe9_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_polarity" *)
output wire xpipe10_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_polarity" *)
output wire xpipe11_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_polarity" *)
output wire xpipe12_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_polarity" *)
output wire xpipe13_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_polarity" *)
output wire xpipe14_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_polarity" *)
output wire xpipe15_rx_polarity;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_startblock" *)
input wire xpipe0_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_startblock" *)
input wire xpipe1_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_startblock" *)
input wire xpipe2_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_startblock" *)
input wire xpipe3_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_startblock" *)
input wire xpipe4_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_startblock" *)
input wire xpipe5_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_startblock" *)
input wire xpipe6_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_startblock" *)
input wire xpipe7_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_startblock" *)
input wire xpipe8_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_startblock" *)
input wire xpipe9_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_startblock" *)
input wire xpipe10_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_startblock" *)
input wire xpipe11_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_startblock" *)
input wire xpipe12_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_startblock" *)
input wire xpipe13_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_startblock" *)
input wire xpipe14_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_startblock" *)
input wire xpipe15_rx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_status" *)
input wire [2 : 0] xpipe0_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_status" *)
input wire [2 : 0] xpipe1_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_status" *)
input wire [2 : 0] xpipe2_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_status" *)
input wire [2 : 0] xpipe3_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_status" *)
input wire [2 : 0] xpipe4_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_status" *)
input wire [2 : 0] xpipe5_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_status" *)
input wire [2 : 0] xpipe6_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_status" *)
input wire [2 : 0] xpipe7_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_status" *)
input wire [2 : 0] xpipe8_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_status" *)
input wire [2 : 0] xpipe9_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_status" *)
input wire [2 : 0] xpipe10_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_status" *)
input wire [2 : 0] xpipe11_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_status" *)
input wire [2 : 0] xpipe12_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_status" *)
input wire [2 : 0] xpipe13_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_status" *)
input wire [2 : 0] xpipe14_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_status" *)
input wire [2 : 0] xpipe15_rx_status;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_syncheader" *)
input wire [1 : 0] xpipe0_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_syncheader" *)
input wire [1 : 0] xpipe1_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_syncheader" *)
input wire [1 : 0] xpipe2_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_syncheader" *)
input wire [1 : 0] xpipe3_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_syncheader" *)
input wire [1 : 0] xpipe4_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_syncheader" *)
input wire [1 : 0] xpipe5_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_syncheader" *)
input wire [1 : 0] xpipe6_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_syncheader" *)
input wire [1 : 0] xpipe7_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_syncheader" *)
input wire [1 : 0] xpipe8_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_syncheader" *)
input wire [1 : 0] xpipe9_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_syncheader" *)
input wire [1 : 0] xpipe10_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_syncheader" *)
input wire [1 : 0] xpipe11_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_syncheader" *)
input wire [1 : 0] xpipe12_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_syncheader" *)
input wire [1 : 0] xpipe13_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_syncheader" *)
input wire [1 : 0] xpipe14_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_syncheader" *)
input wire [1 : 0] xpipe15_rx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_termination" *)
output wire xpipe0_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_termination" *)
output wire xpipe1_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_termination" *)
output wire xpipe2_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_termination" *)
output wire xpipe3_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_termination" *)
output wire xpipe4_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_termination" *)
output wire xpipe5_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_termination" *)
output wire xpipe6_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_termination" *)
output wire xpipe7_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_termination" *)
output wire xpipe8_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_termination" *)
output wire xpipe9_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_termination" *)
output wire xpipe10_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_termination" *)
output wire xpipe11_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_termination" *)
output wire xpipe12_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_termination" *)
output wire xpipe13_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_termination" *)
output wire xpipe14_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_termination" *)
output wire xpipe15_rx_termination;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_rx_valid" *)
input wire xpipe0_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_rx_valid" *)
input wire xpipe1_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_rx_valid" *)
input wire xpipe2_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_rx_valid" *)
input wire xpipe3_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_rx_valid" *)
input wire xpipe4_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_rx_valid" *)
input wire xpipe5_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_rx_valid" *)
input wire xpipe6_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_rx_valid" *)
input wire xpipe7_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_rx_valid" *)
input wire xpipe8_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_rx_valid" *)
input wire xpipe9_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_rx_valid" *)
input wire xpipe10_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_rx_valid" *)
input wire xpipe11_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_rx_valid" *)
input wire xpipe12_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_rx_valid" *)
input wire xpipe13_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_rx_valid" *)
input wire xpipe14_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_rx_valid" *)
input wire xpipe15_rx_valid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_charisk" *)
output wire [1 : 0] xpipe0_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_charisk" *)
output wire [1 : 0] xpipe1_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_charisk" *)
output wire [1 : 0] xpipe2_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_charisk" *)
output wire [1 : 0] xpipe3_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_charisk" *)
output wire [1 : 0] xpipe4_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_charisk" *)
output wire [1 : 0] xpipe5_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_charisk" *)
output wire [1 : 0] xpipe6_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_charisk" *)
output wire [1 : 0] xpipe7_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_charisk" *)
output wire [1 : 0] xpipe8_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_charisk" *)
output wire [1 : 0] xpipe9_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_charisk" *)
output wire [1 : 0] xpipe10_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_charisk" *)
output wire [1 : 0] xpipe11_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_charisk" *)
output wire [1 : 0] xpipe12_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_charisk" *)
output wire [1 : 0] xpipe13_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_charisk" *)
output wire [1 : 0] xpipe14_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_charisk" *)
output wire [1 : 0] xpipe15_tx_charisk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_compliance" *)
output wire xpipe0_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_compliance" *)
output wire xpipe1_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_compliance" *)
output wire xpipe2_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_compliance" *)
output wire xpipe3_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_compliance" *)
output wire xpipe4_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_compliance" *)
output wire xpipe5_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_compliance" *)
output wire xpipe6_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_compliance" *)
output wire xpipe7_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_compliance" *)
output wire xpipe8_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_compliance" *)
output wire xpipe9_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_compliance" *)
output wire xpipe10_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_compliance" *)
output wire xpipe11_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_compliance" *)
output wire xpipe12_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_compliance" *)
output wire xpipe13_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_compliance" *)
output wire xpipe14_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_compliance" *)
output wire xpipe15_tx_compliance;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_data" *)
output wire [31 : 0] xpipe0_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_data" *)
output wire [31 : 0] xpipe1_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_data" *)
output wire [31 : 0] xpipe2_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_data" *)
output wire [31 : 0] xpipe3_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_data" *)
output wire [31 : 0] xpipe4_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_data" *)
output wire [31 : 0] xpipe5_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_data" *)
output wire [31 : 0] xpipe6_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_data" *)
output wire [31 : 0] xpipe7_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_data" *)
output wire [31 : 0] xpipe8_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_data" *)
output wire [31 : 0] xpipe9_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_data" *)
output wire [31 : 0] xpipe10_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_data" *)
output wire [31 : 0] xpipe11_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_data" *)
output wire [31 : 0] xpipe12_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_data" *)
output wire [31 : 0] xpipe13_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_data" *)
output wire [31 : 0] xpipe14_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_data" *)
output wire [31 : 0] xpipe15_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_datavalid" *)
output wire xpipe0_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_datavalid" *)
output wire xpipe1_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_datavalid" *)
output wire xpipe2_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_datavalid" *)
output wire xpipe3_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_datavalid" *)
output wire xpipe4_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_datavalid" *)
output wire xpipe5_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_datavalid" *)
output wire xpipe6_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_datavalid" *)
output wire xpipe7_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_datavalid" *)
output wire xpipe8_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_datavalid" *)
output wire xpipe9_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_datavalid" *)
output wire xpipe10_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_datavalid" *)
output wire xpipe11_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_datavalid" *)
output wire xpipe12_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_datavalid" *)
output wire xpipe13_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_datavalid" *)
output wire xpipe14_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_datavalid" *)
output wire xpipe15_tx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_deemph" *)
output wire xpipe0_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_deemph" *)
output wire xpipe1_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_deemph" *)
output wire xpipe2_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_deemph" *)
output wire xpipe3_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_deemph" *)
output wire xpipe4_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_deemph" *)
output wire xpipe5_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_deemph" *)
output wire xpipe6_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_deemph" *)
output wire xpipe7_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_deemph" *)
output wire xpipe8_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_deemph" *)
output wire xpipe9_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_deemph" *)
output wire xpipe10_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_deemph" *)
output wire xpipe11_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_deemph" *)
output wire xpipe12_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_deemph" *)
output wire xpipe13_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_deemph" *)
output wire xpipe14_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_deemph" *)
output wire xpipe15_tx_deemph;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_detectrxloopback" *)
output wire xpipe0_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_detectrxloopback" *)
output wire xpipe1_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_detectrxloopback" *)
output wire xpipe2_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_detectrxloopback" *)
output wire xpipe3_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_detectrxloopback" *)
output wire xpipe4_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_detectrxloopback" *)
output wire xpipe5_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_detectrxloopback" *)
output wire xpipe6_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_detectrxloopback" *)
output wire xpipe7_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_detectrxloopback" *)
output wire xpipe8_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_detectrxloopback" *)
output wire xpipe9_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_detectrxloopback" *)
output wire xpipe10_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_detectrxloopback" *)
output wire xpipe11_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_detectrxloopback" *)
output wire xpipe12_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_detectrxloopback" *)
output wire xpipe13_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_detectrxloopback" *)
output wire xpipe14_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_detectrxloopback" *)
output wire xpipe15_tx_detectrxloopback;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_elecidle" *)
output wire xpipe0_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_elecidle" *)
output wire xpipe1_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_elecidle" *)
output wire xpipe2_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_elecidle" *)
output wire xpipe3_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_elecidle" *)
output wire xpipe4_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_elecidle" *)
output wire xpipe5_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_elecidle" *)
output wire xpipe6_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_elecidle" *)
output wire xpipe7_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_elecidle" *)
output wire xpipe8_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_elecidle" *)
output wire xpipe9_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_elecidle" *)
output wire xpipe10_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_elecidle" *)
output wire xpipe11_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_elecidle" *)
output wire xpipe12_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_elecidle" *)
output wire xpipe13_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_elecidle" *)
output wire xpipe14_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_elecidle" *)
output wire xpipe15_tx_elecidle;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_maincursor" *)
output wire [6 : 0] xpipe0_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_maincursor" *)
output wire [6 : 0] xpipe1_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_maincursor" *)
output wire [6 : 0] xpipe2_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_maincursor" *)
output wire [6 : 0] xpipe3_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_maincursor" *)
output wire [6 : 0] xpipe4_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_maincursor" *)
output wire [6 : 0] xpipe5_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_maincursor" *)
output wire [6 : 0] xpipe6_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_maincursor" *)
output wire [6 : 0] xpipe7_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_maincursor" *)
output wire [6 : 0] xpipe8_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_maincursor" *)
output wire [6 : 0] xpipe9_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_maincursor" *)
output wire [6 : 0] xpipe10_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_maincursor" *)
output wire [6 : 0] xpipe11_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_maincursor" *)
output wire [6 : 0] xpipe12_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_maincursor" *)
output wire [6 : 0] xpipe13_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_maincursor" *)
output wire [6 : 0] xpipe14_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_maincursor" *)
output wire [6 : 0] xpipe15_tx_maincursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_margin" *)
output wire [2 : 0] xpipe0_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_margin" *)
output wire [2 : 0] xpipe1_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_margin" *)
output wire [2 : 0] xpipe2_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_margin" *)
output wire [2 : 0] xpipe3_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_margin" *)
output wire [2 : 0] xpipe4_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_margin" *)
output wire [2 : 0] xpipe5_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_margin" *)
output wire [2 : 0] xpipe6_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_margin" *)
output wire [2 : 0] xpipe7_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_margin" *)
output wire [2 : 0] xpipe8_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_margin" *)
output wire [2 : 0] xpipe9_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_margin" *)
output wire [2 : 0] xpipe10_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_margin" *)
output wire [2 : 0] xpipe11_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_margin" *)
output wire [2 : 0] xpipe12_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_margin" *)
output wire [2 : 0] xpipe13_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_margin" *)
output wire [2 : 0] xpipe14_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_margin" *)
output wire [2 : 0] xpipe15_tx_margin;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_postcursor" *)
output wire [4 : 0] xpipe0_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_postcursor" *)
output wire [4 : 0] xpipe1_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_postcursor" *)
output wire [4 : 0] xpipe2_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_postcursor" *)
output wire [4 : 0] xpipe3_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_postcursor" *)
output wire [4 : 0] xpipe4_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_postcursor" *)
output wire [4 : 0] xpipe5_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_postcursor" *)
output wire [4 : 0] xpipe6_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_postcursor" *)
output wire [4 : 0] xpipe7_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_postcursor" *)
output wire [4 : 0] xpipe8_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_postcursor" *)
output wire [4 : 0] xpipe9_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_postcursor" *)
output wire [4 : 0] xpipe10_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_postcursor" *)
output wire [4 : 0] xpipe11_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_postcursor" *)
output wire [4 : 0] xpipe12_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_postcursor" *)
output wire [4 : 0] xpipe13_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_postcursor" *)
output wire [4 : 0] xpipe14_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_postcursor" *)
output wire [4 : 0] xpipe15_tx_postcursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_precursor" *)
output wire [4 : 0] xpipe0_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_precursor" *)
output wire [4 : 0] xpipe1_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_precursor" *)
output wire [4 : 0] xpipe2_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_precursor" *)
output wire [4 : 0] xpipe3_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_precursor" *)
output wire [4 : 0] xpipe4_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_precursor" *)
output wire [4 : 0] xpipe5_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_precursor" *)
output wire [4 : 0] xpipe6_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_precursor" *)
output wire [4 : 0] xpipe7_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_precursor" *)
output wire [4 : 0] xpipe8_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_precursor" *)
output wire [4 : 0] xpipe9_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_precursor" *)
output wire [4 : 0] xpipe10_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_precursor" *)
output wire [4 : 0] xpipe11_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_precursor" *)
output wire [4 : 0] xpipe12_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_precursor" *)
output wire [4 : 0] xpipe13_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_precursor" *)
output wire [4 : 0] xpipe14_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_precursor" *)
output wire [4 : 0] xpipe15_tx_precursor;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_startblock" *)
output wire xpipe0_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_startblock" *)
output wire xpipe1_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_startblock" *)
output wire xpipe2_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_startblock" *)
output wire xpipe3_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_startblock" *)
output wire xpipe4_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_startblock" *)
output wire xpipe5_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_startblock" *)
output wire xpipe6_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_startblock" *)
output wire xpipe7_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_startblock" *)
output wire xpipe8_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_startblock" *)
output wire xpipe9_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_startblock" *)
output wire xpipe10_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_startblock" *)
output wire xpipe11_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_startblock" *)
output wire xpipe12_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_startblock" *)
output wire xpipe13_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_startblock" *)
output wire xpipe14_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_startblock" *)
output wire xpipe15_tx_startblock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_swing" *)
output wire xpipe0_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_swing" *)
output wire xpipe1_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_swing" *)
output wire xpipe2_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_swing" *)
output wire xpipe3_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_swing" *)
output wire xpipe4_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_swing" *)
output wire xpipe5_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_swing" *)
output wire xpipe6_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_swing" *)
output wire xpipe7_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_swing" *)
output wire xpipe8_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_swing" *)
output wire xpipe9_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_swing" *)
output wire xpipe10_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_swing" *)
output wire xpipe11_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_swing" *)
output wire xpipe12_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_swing" *)
output wire xpipe13_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_swing" *)
output wire xpipe14_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_swing" *)
output wire xpipe15_tx_swing;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe0_tx_syncheader" *)
output wire [1 : 0] xpipe0_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe1_tx_syncheader" *)
output wire [1 : 0] xpipe1_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe2_tx_syncheader" *)
output wire [1 : 0] xpipe2_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe3_tx_syncheader" *)
output wire [1 : 0] xpipe3_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe4_tx_syncheader" *)
output wire [1 : 0] xpipe4_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe5_tx_syncheader" *)
output wire [1 : 0] xpipe5_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe6_tx_syncheader" *)
output wire [1 : 0] xpipe6_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe7_tx_syncheader" *)
output wire [1 : 0] xpipe7_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe8_tx_syncheader" *)
output wire [1 : 0] xpipe8_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe9_tx_syncheader" *)
output wire [1 : 0] xpipe9_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe10_tx_syncheader" *)
output wire [1 : 0] xpipe10_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe11_tx_syncheader" *)
output wire [1 : 0] xpipe11_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe12_tx_syncheader" *)
output wire [1 : 0] xpipe12_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe13_tx_syncheader" *)
output wire [1 : 0] xpipe13_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe14_tx_syncheader" *)
output wire [1 : 0] xpipe14_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe15_tx_syncheader" *)
output wire [1 : 0] xpipe15_tx_syncheader;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_datavalid" *)
input wire hsdp_xpipe0_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_datavalid" *)
input wire hsdp_xpipe1_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_datavalid" *)
input wire hsdp_xpipe2_rx_datavalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_gearboxslip" *)
output wire hsdp_xpipe0_rx_gearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_gearboxslip" *)
output wire hsdp_xpipe1_rx_gearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_gearboxslip" *)
output wire hsdp_xpipe2_rx_gearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_header" *)
input wire [1 : 0] hsdp_xpipe0_rx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_header" *)
input wire [1 : 0] hsdp_xpipe1_rx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_header" *)
input wire [1 : 0] hsdp_xpipe2_rx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_headervalid" *)
input wire hsdp_xpipe0_rx_headervalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_headervalid" *)
input wire hsdp_xpipe1_rx_headervalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_headervalid" *)
input wire hsdp_xpipe2_rx_headervalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_pcsreset" *)
output wire hsdp_xpipe0_rx_pcsreset;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_pcsreset" *)
output wire hsdp_xpipe1_rx_pcsreset;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_pcsreset" *)
output wire hsdp_xpipe2_rx_pcsreset;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_rx_resetdone" *)
input wire hsdp_xpipe0_rx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_rx_resetdone" *)
input wire hsdp_xpipe1_rx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_rx_resetdone" *)
input wire hsdp_xpipe2_rx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_tx_header" *)
output wire [1 : 0] hsdp_xpipe0_tx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_tx_header" *)
output wire [1 : 0] hsdp_xpipe1_tx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_tx_header" *)
output wire [1 : 0] hsdp_xpipe2_tx_header;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_tx_resetdone" *)
input wire hsdp_xpipe0_tx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_tx_resetdone" *)
input wire hsdp_xpipe1_tx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_tx_resetdone" *)
input wire hsdp_xpipe2_tx_resetdone;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe0_tx_sequence" *)
output wire [6 : 0] hsdp_xpipe0_tx_sequence;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe1_tx_sequence" *)
output wire [6 : 0] hsdp_xpipe1_tx_sequence;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_xpipe2_tx_sequence" *)
output wire [6 : 0] hsdp_xpipe2_tx_sequence;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_gt_rxoutclk" *)
input wire hsdp_gt_rxoutclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM hsdp_gt_txusrclk" *)
output wire hsdp_gt_txusrclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM phy_ready_frbot" *)
output wire phy_ready_frbot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM phy_ready_tobot" *)
input wire phy_ready_tobot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtce" *)
input wire link0_xpipe_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtce" *)
input wire link1_xpipe_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtcemask" *)
input wire [3 : 0] link0_xpipe_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtcemask" *)
input wire [3 : 0] link1_xpipe_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtdiv" *)
input wire [11 : 0] link0_xpipe_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtdiv" *)
input wire [11 : 0] link1_xpipe_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtrst" *)
input wire link0_xpipe_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtrst" *)
input wire link1_xpipe_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_bufgtrstmask" *)
input wire [3 : 0] link0_xpipe_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_bufgtrstmask" *)
input wire [3 : 0] link1_xpipe_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_gtoutclk" *)
input wire link0_xpipe_gtoutclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_gtoutclk" *)
input wire link1_xpipe_gtoutclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_gtpipeclk" *)
output wire link0_xpipe_gtpipeclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_gtpipeclk" *)
output wire link1_xpipe_gtpipeclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_pcielinkreachtarget" *)
output wire link0_xpipe_pcielinkreachtarget;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_pcielinkreachtarget" *)
output wire link1_xpipe_pcielinkreachtarget;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_pcieltssmstate" *)
output wire [5 : 0] link0_xpipe_pcieltssmstate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_pcieltssmstate" *)
output wire [5 : 0] link1_xpipe_pcieltssmstate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_pcieperstn" *)
output wire link0_xpipe_pcieperstn;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_pcieperstn" *)
output wire link1_xpipe_pcieperstn;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_phyesmadaptationsave" *)
output wire link0_xpipe_phyesmadaptationsave;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_phyesmadaptationsave" *)
output wire link1_xpipe_phyesmadaptationsave;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_phyready" *)
input wire link0_xpipe_phyready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_phyready" *)
input wire link1_xpipe_phyready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link0_xpipe_piperate" *)
output wire [2 : 0] link0_xpipe_piperate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM link1_xpipe_piperate" *)
output wire [2 : 0] link1_xpipe_piperate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_araddr" *)
output wire [63 : 0] s_axi_pcie_araddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arburst" *)
output wire [1 : 0] s_axi_pcie_arburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arcache" *)
output wire [3 : 0] s_axi_pcie_arcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arid" *)
output wire [15 : 0] s_axi_pcie_arid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arlen" *)
output wire [7 : 0] s_axi_pcie_arlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arlock" *)
output wire s_axi_pcie_arlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arprot" *)
output wire [2 : 0] s_axi_pcie_arprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arqos" *)
output wire [3 : 0] s_axi_pcie_arqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arready" *)
input wire s_axi_pcie_arready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arregion" *)
output wire [3 : 0] s_axi_pcie_arregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arsize" *)
output wire [2 : 0] s_axi_pcie_arsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_aruser" *)
output wire [17 : 0] s_axi_pcie_aruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_arvalid" *)
output wire s_axi_pcie_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awaddr" *)
output wire [63 : 0] s_axi_pcie_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awburst" *)
output wire [1 : 0] s_axi_pcie_awburst;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awcache" *)
output wire [3 : 0] s_axi_pcie_awcache;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awid" *)
output wire [15 : 0] s_axi_pcie_awid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awlen" *)
output wire [7 : 0] s_axi_pcie_awlen;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awlock" *)
output wire s_axi_pcie_awlock;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awprot" *)
output wire [2 : 0] s_axi_pcie_awprot;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awqos" *)
output wire [3 : 0] s_axi_pcie_awqos;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awready" *)
input wire s_axi_pcie_awready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awregion" *)
output wire [3 : 0] s_axi_pcie_awregion;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awsize" *)
output wire [2 : 0] s_axi_pcie_awsize;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awuser" *)
output wire [17 : 0] s_axi_pcie_awuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_awvalid" *)
output wire s_axi_pcie_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bid" *)
input wire [15 : 0] s_axi_pcie_bid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bready" *)
output wire s_axi_pcie_bready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bresp" *)
input wire [1 : 0] s_axi_pcie_bresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_buser" *)
input wire [15 : 0] s_axi_pcie_buser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_bvalid" *)
input wire s_axi_pcie_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rdata" *)
input wire [127 : 0] s_axi_pcie_rdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rid" *)
input wire [15 : 0] s_axi_pcie_rid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rlast" *)
input wire s_axi_pcie_rlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rready" *)
output wire s_axi_pcie_rready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rresp" *)
input wire [1 : 0] s_axi_pcie_rresp;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_ruser" *)
input wire [16 : 0] s_axi_pcie_ruser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_rvalid" *)
input wire s_axi_pcie_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wdata" *)
output wire [127 : 0] s_axi_pcie_wdata;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wid" *)
output wire [15 : 0] s_axi_pcie_wid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wlast" *)
output wire s_axi_pcie_wlast;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wready" *)
input wire s_axi_pcie_wready;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wstrb" *)
output wire [15 : 0] s_axi_pcie_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wuser" *)
output wire [16 : 0] s_axi_pcie_wuser;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM s_axi_pcie_wvalid" *)
output wire s_axi_pcie_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_apb_en" *)
output wire cpm_pcr_apb_en;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_dis_npi_clk" *)
output wire cpm_pcr_dis_npi_clk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_fabric_en" *)
output wire cpm_pcr_fabric_en;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_gate_reg" *)
output wire cpm_pcr_gate_reg;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_hold_state" *)
output wire cpm_pcr_hold_state;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_init_state" *)
output wire cpm_pcr_init_state;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_mem_clr" *)
output wire cpm_pcr_mem_clr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_o_disable" *)
output wire [3 : 0] cpm_pcr_o_disable;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_pcomplete" *)
output wire cpm_pcr_pcomplete;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_pwr_dn" *)
output wire cpm_pcr_pwr_dn;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_scan_clr" *)
output wire cpm_pcr_scan_clr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_start_bisr" *)
output wire cpm_pcr_start_bisr;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_start_cal" *)
output wire cpm_pcr_start_cal;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM cpm_pcr_tristate" *)
output wire cpm_pcr_tristate;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_ack" *)
input wire xpipe_q0_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_ack" *)
input wire xpipe_q1_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_ack" *)
input wire xpipe_q2_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_ack" *)
input wire xpipe_q3_rxmargin_req_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_cmd" *)
output wire [3 : 0] xpipe_q0_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_cmd" *)
output wire [3 : 0] xpipe_q1_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_cmd" *)
output wire [3 : 0] xpipe_q2_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_cmd" *)
output wire [3 : 0] xpipe_q3_rxmargin_req_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_lanenum" *)
output wire [1 : 0] xpipe_q0_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_lanenum" *)
output wire [1 : 0] xpipe_q1_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_lanenum" *)
output wire [1 : 0] xpipe_q2_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_lanenum" *)
output wire [1 : 0] xpipe_q3_rxmargin_req_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_payload" *)
output wire [7 : 0] xpipe_q0_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_payload" *)
output wire [7 : 0] xpipe_q1_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_payload" *)
output wire [7 : 0] xpipe_q2_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_payload" *)
output wire [7 : 0] xpipe_q3_rxmargin_req_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_req_req" *)
output wire xpipe_q0_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_req_req" *)
output wire xpipe_q1_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_req_req" *)
output wire xpipe_q2_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_req_req" *)
output wire xpipe_q3_rxmargin_req_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_ack" *)
output wire xpipe_q0_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_ack" *)
output wire xpipe_q1_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_ack" *)
output wire xpipe_q2_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_ack" *)
output wire xpipe_q3_rxmargin_res_ack;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_cmd" *)
input wire [3 : 0] xpipe_q0_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_cmd" *)
input wire [3 : 0] xpipe_q1_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_cmd" *)
input wire [3 : 0] xpipe_q2_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_cmd" *)
input wire [3 : 0] xpipe_q3_rxmargin_res_cmd;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_lanenum" *)
input wire [1 : 0] xpipe_q0_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_lanenum" *)
input wire [1 : 0] xpipe_q1_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_lanenum" *)
input wire [1 : 0] xpipe_q2_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_lanenum" *)
input wire [1 : 0] xpipe_q3_rxmargin_res_lanenum;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_payload" *)
input wire [7 : 0] xpipe_q0_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_payload" *)
input wire [7 : 0] xpipe_q1_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_payload" *)
input wire [7 : 0] xpipe_q2_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_payload" *)
input wire [7 : 0] xpipe_q3_rxmargin_res_payload;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q0_rxmargin_res_req" *)
input wire xpipe_q0_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q1_rxmargin_res_req" *)
input wire xpipe_q1_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q2_rxmargin_res_req" *)
input wire xpipe_q2_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM xpipe_q3_rxmargin_res_req" *)
input wire xpipe_q3_rxmargin_res_req;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM lpd_refclk_in" *)
output wire lpd_refclk_in;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM lpd_switch_timeout_cnt" *)
output wire lpd_switch_timeout_cnt;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM lpd_swclk" *)
output wire lpd_swclk;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM perst0n" *)
output wire perst0n;
(* X_INTERFACE_INFO = "xilinx.com:display_cpm4:ps_cpm:1.0 IF_PS_CPM perst1n" *)
output wire perst1n;

  pspmc_v1_0_3_pspmc #(
    .C_M_AXI_GP0_DATA_WIDTH(128),
    .C_M_AXI_GP2_DATA_WIDTH(128),
    .C_DIFF_RW_CLK_S_AXI_GP0(0),
    .C_DIFF_RW_CLK_S_AXI_GP2(0),
    .C_DIFF_RW_CLK_S_AXI_GP4(0),
    .C_S_AXI_GP0_DATA_WIDTH(128),
    .C_S_AXI_GP2_DATA_WIDTH(128),
    .C_S_AXI_GP4_DATA_WIDTH(128),
    .C_S_AXI_ACP_DATA_WIDTH(128),
    .C_S_AXI_ACE_DATA_WIDTH(128),
    .C_PS_NOC_CCI_DATA_WIDTH(128),
    .C_PS_NOC_NCI_DATA_WIDTH(128),
    .C_NOC_PS_CCI_DATA_WIDTH(128),
    .C_PS_NOC_PMC_DATA_WIDTH(128),
    .C_NOC_PS_PMC_DATA_WIDTH(128),
    .C_PS_NOC_RPU_DATA_WIDTH(128),
    .C_PS_EMIO_GPIO_WIDTH(32),
    .C_PMC_EMIO_GPIO_WIDTH(64),
    .C_PMC_GPO_WIDTH(32),
    .C_PMC_GPI_WIDTH(32),
    .C_PMC_NOC_ADDR_WIDTH(64),
    .C_PMC_NOC_DATA_WIDTH(128),
    .C_NOC_PMC_ADDR_WIDTH(64),
    .C_NOC_PMC_DATA_WIDTH(128),
    .C_XDEVICE("xcvc1902"),
    .C_SIM_DEVICE("VERSAL_AI_CORE"),
    .C_SPP_PSPMC_TO_CORE_WIDTH(12000),
    .C_SPP_PSPMC_FROM_CORE_WIDTH(12000),
    .C_NUM_F2P0_INTR_INPUTS("1"),
    .C_NUM_F2P1_INTR_INPUTS("1"),
    .C_PMCPL_CLK0_BUF(1),
    .C_PMCPL_CLK1_BUF(1),
    .C_PMCPL_CLK2_BUF(1),
    .C_PMCPL_CLK3_BUF(1),
    .C_PMCPL_IRO_CLK_BUF(1),
    .C_ACE_LITE(0),
    .C_PS_USE_S_AXI_GP2(0),
    .C_AXI4_EXT_USER_BITS(0),
    .C_SUBCORE_NAME("design_2_versal_cips_0_0_gt_quad_base"),
    .C_VIP_SUBCORE_NAME("versal_cips_ps_vip"),
    .C_CORE_NAME("design_2_versal_cips_0_0"),
    .C_SD0_DATA_WIDTH(4),
    .C_SD1_DATA_WIDTH(4),
    .C_PS_TRACE_WIDTH(32),
    .C_PS_USE_STARTUP(0),
    .C_PS_USE_CAPTURE(0),
    .C_PS_USE_RPU_INTERRUPT(0),
    .C_PS_PCIE_EP_RESET1_IO("{PMC_MIO 38}"),
    .C_PS_PCIE_EP_RESET2_IO("{PS_MIO 19}")
  ) inst (
    .noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk),
    .noc_cpm_pcie_axi0_araddr(noc_cpm_pcie_axi0_araddr),
    .noc_cpm_pcie_axi0_arburst(noc_cpm_pcie_axi0_arburst),
    .noc_cpm_pcie_axi0_arcache(noc_cpm_pcie_axi0_arcache),
    .noc_cpm_pcie_axi0_arid(noc_cpm_pcie_axi0_arid),
    .noc_cpm_pcie_axi0_arlen(noc_cpm_pcie_axi0_arlen),
    .noc_cpm_pcie_axi0_arlock(noc_cpm_pcie_axi0_arlock),
    .noc_cpm_pcie_axi0_arprot(noc_cpm_pcie_axi0_arprot),
    .noc_cpm_pcie_axi0_arqos(noc_cpm_pcie_axi0_arqos),
    .noc_cpm_pcie_axi0_arsize(noc_cpm_pcie_axi0_arsize),
    .noc_cpm_pcie_axi0_aruser(noc_cpm_pcie_axi0_aruser),
    .noc_cpm_pcie_axi0_arvalid(noc_cpm_pcie_axi0_arvalid),
    .noc_cpm_pcie_axi0_awaddr(noc_cpm_pcie_axi0_awaddr),
    .noc_cpm_pcie_axi0_awburst(noc_cpm_pcie_axi0_awburst),
    .noc_cpm_pcie_axi0_awcache(noc_cpm_pcie_axi0_awcache),
    .noc_cpm_pcie_axi0_awid(noc_cpm_pcie_axi0_awid),
    .noc_cpm_pcie_axi0_awlen(noc_cpm_pcie_axi0_awlen),
    .noc_cpm_pcie_axi0_awlock(noc_cpm_pcie_axi0_awlock),
    .noc_cpm_pcie_axi0_awprot(noc_cpm_pcie_axi0_awprot),
    .noc_cpm_pcie_axi0_awqos(noc_cpm_pcie_axi0_awqos),
    .noc_cpm_pcie_axi0_awsize(noc_cpm_pcie_axi0_awsize),
    .noc_cpm_pcie_axi0_awuser(noc_cpm_pcie_axi0_awuser),
    .noc_cpm_pcie_axi0_awvalid(noc_cpm_pcie_axi0_awvalid),
    .noc_cpm_pcie_axi0_bready(noc_cpm_pcie_axi0_bready),
    .noc_cpm_pcie_axi0_rready(noc_cpm_pcie_axi0_rready),
    .noc_cpm_pcie_axi0_wdata(noc_cpm_pcie_axi0_wdata),
    .noc_cpm_pcie_axi0_wlast(noc_cpm_pcie_axi0_wlast),
    .noc_cpm_pcie_axi0_wstrb(noc_cpm_pcie_axi0_wstrb),
    .noc_cpm_pcie_axi0_wvalid(noc_cpm_pcie_axi0_wvalid),
    .noc_cpm_pcie_axi0_arready(noc_cpm_pcie_axi0_arready),
    .noc_cpm_pcie_axi0_awready(noc_cpm_pcie_axi0_awready),
    .noc_cpm_pcie_axi0_bid(noc_cpm_pcie_axi0_bid),
    .noc_cpm_pcie_axi0_bresp(noc_cpm_pcie_axi0_bresp),
    .noc_cpm_pcie_axi0_bvalid(noc_cpm_pcie_axi0_bvalid),
    .noc_cpm_pcie_axi0_rdata(noc_cpm_pcie_axi0_rdata),
    .noc_cpm_pcie_axi0_rid(noc_cpm_pcie_axi0_rid),
    .noc_cpm_pcie_axi0_rlast(noc_cpm_pcie_axi0_rlast),
    .noc_cpm_pcie_axi0_rresp(noc_cpm_pcie_axi0_rresp),
    .noc_cpm_pcie_axi0_rvalid(noc_cpm_pcie_axi0_rvalid),
    .noc_cpm_pcie_axi0_wready(noc_cpm_pcie_axi0_wready),
    .cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk),
    .cpm_pcie_noc_axi0_araddr(cpm_pcie_noc_axi0_araddr),
    .cpm_pcie_noc_axi0_arburst(cpm_pcie_noc_axi0_arburst),
    .cpm_pcie_noc_axi0_arcache(cpm_pcie_noc_axi0_arcache),
    .cpm_pcie_noc_axi0_arid(cpm_pcie_noc_axi0_arid),
    .cpm_pcie_noc_axi0_arlen(cpm_pcie_noc_axi0_arlen),
    .cpm_pcie_noc_axi0_arlock(cpm_pcie_noc_axi0_arlock),
    .cpm_pcie_noc_axi0_arprot(cpm_pcie_noc_axi0_arprot),
    .cpm_pcie_noc_axi0_arqos(cpm_pcie_noc_axi0_arqos),
    .cpm_pcie_noc_axi0_arsize(cpm_pcie_noc_axi0_arsize),
    .cpm_pcie_noc_axi0_aruser(cpm_pcie_noc_axi0_aruser),
    .cpm_pcie_noc_axi0_arvalid(cpm_pcie_noc_axi0_arvalid),
    .cpm_pcie_noc_axi0_awaddr(cpm_pcie_noc_axi0_awaddr),
    .cpm_pcie_noc_axi0_awburst(cpm_pcie_noc_axi0_awburst),
    .cpm_pcie_noc_axi0_awcache(cpm_pcie_noc_axi0_awcache),
    .cpm_pcie_noc_axi0_awid(cpm_pcie_noc_axi0_awid),
    .cpm_pcie_noc_axi0_awlen(cpm_pcie_noc_axi0_awlen),
    .cpm_pcie_noc_axi0_awlock(cpm_pcie_noc_axi0_awlock),
    .cpm_pcie_noc_axi0_awprot(cpm_pcie_noc_axi0_awprot),
    .cpm_pcie_noc_axi0_awqos(cpm_pcie_noc_axi0_awqos),
    .cpm_pcie_noc_axi0_awsize(cpm_pcie_noc_axi0_awsize),
    .cpm_pcie_noc_axi0_awuser(cpm_pcie_noc_axi0_awuser),
    .cpm_pcie_noc_axi0_awvalid(cpm_pcie_noc_axi0_awvalid),
    .cpm_pcie_noc_axi0_bready(cpm_pcie_noc_axi0_bready),
    .cpm_pcie_noc_axi0_rready(cpm_pcie_noc_axi0_rready),
    .cpm_pcie_noc_axi0_wdata(cpm_pcie_noc_axi0_wdata),
    .cpm_pcie_noc_axi0_wlast(cpm_pcie_noc_axi0_wlast),
    .cpm_pcie_noc_axi0_wstrb(cpm_pcie_noc_axi0_wstrb),
    .cpm_pcie_noc_axi0_wvalid(cpm_pcie_noc_axi0_wvalid),
    .cpm_pcie_noc_axi0_arready(cpm_pcie_noc_axi0_arready),
    .cpm_pcie_noc_axi0_awready(cpm_pcie_noc_axi0_awready),
    .cpm_pcie_noc_axi0_bid(cpm_pcie_noc_axi0_bid),
    .cpm_pcie_noc_axi0_bresp(cpm_pcie_noc_axi0_bresp),
    .cpm_pcie_noc_axi0_bvalid(cpm_pcie_noc_axi0_bvalid),
    .cpm_pcie_noc_axi0_rdata(cpm_pcie_noc_axi0_rdata),
    .cpm_pcie_noc_axi0_rid(cpm_pcie_noc_axi0_rid),
    .cpm_pcie_noc_axi0_rlast(cpm_pcie_noc_axi0_rlast),
    .cpm_pcie_noc_axi0_rresp(cpm_pcie_noc_axi0_rresp),
    .cpm_pcie_noc_axi0_rvalid(cpm_pcie_noc_axi0_rvalid),
    .cpm_pcie_noc_axi0_wready(cpm_pcie_noc_axi0_wready),
    .cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk),
    .cpm_pcie_noc_axi1_araddr(cpm_pcie_noc_axi1_araddr),
    .cpm_pcie_noc_axi1_arburst(cpm_pcie_noc_axi1_arburst),
    .cpm_pcie_noc_axi1_arcache(cpm_pcie_noc_axi1_arcache),
    .cpm_pcie_noc_axi1_arid(cpm_pcie_noc_axi1_arid),
    .cpm_pcie_noc_axi1_arlen(cpm_pcie_noc_axi1_arlen),
    .cpm_pcie_noc_axi1_arlock(cpm_pcie_noc_axi1_arlock),
    .cpm_pcie_noc_axi1_arprot(cpm_pcie_noc_axi1_arprot),
    .cpm_pcie_noc_axi1_arqos(cpm_pcie_noc_axi1_arqos),
    .cpm_pcie_noc_axi1_arsize(cpm_pcie_noc_axi1_arsize),
    .cpm_pcie_noc_axi1_aruser(cpm_pcie_noc_axi1_aruser),
    .cpm_pcie_noc_axi1_arvalid(cpm_pcie_noc_axi1_arvalid),
    .cpm_pcie_noc_axi1_awaddr(cpm_pcie_noc_axi1_awaddr),
    .cpm_pcie_noc_axi1_awburst(cpm_pcie_noc_axi1_awburst),
    .cpm_pcie_noc_axi1_awcache(cpm_pcie_noc_axi1_awcache),
    .cpm_pcie_noc_axi1_awid(cpm_pcie_noc_axi1_awid),
    .cpm_pcie_noc_axi1_awlen(cpm_pcie_noc_axi1_awlen),
    .cpm_pcie_noc_axi1_awlock(cpm_pcie_noc_axi1_awlock),
    .cpm_pcie_noc_axi1_awprot(cpm_pcie_noc_axi1_awprot),
    .cpm_pcie_noc_axi1_awqos(cpm_pcie_noc_axi1_awqos),
    .cpm_pcie_noc_axi1_awsize(cpm_pcie_noc_axi1_awsize),
    .cpm_pcie_noc_axi1_awuser(cpm_pcie_noc_axi1_awuser),
    .cpm_pcie_noc_axi1_awvalid(cpm_pcie_noc_axi1_awvalid),
    .cpm_pcie_noc_axi1_bready(cpm_pcie_noc_axi1_bready),
    .cpm_pcie_noc_axi1_rready(cpm_pcie_noc_axi1_rready),
    .cpm_pcie_noc_axi1_wdata(cpm_pcie_noc_axi1_wdata),
    .cpm_pcie_noc_axi1_wlast(cpm_pcie_noc_axi1_wlast),
    .cpm_pcie_noc_axi1_wstrb(cpm_pcie_noc_axi1_wstrb),
    .cpm_pcie_noc_axi1_wvalid(cpm_pcie_noc_axi1_wvalid),
    .cpm_pcie_noc_axi1_arready(cpm_pcie_noc_axi1_arready),
    .cpm_pcie_noc_axi1_awready(cpm_pcie_noc_axi1_awready),
    .cpm_pcie_noc_axi1_bid(cpm_pcie_noc_axi1_bid),
    .cpm_pcie_noc_axi1_bresp(cpm_pcie_noc_axi1_bresp),
    .cpm_pcie_noc_axi1_bvalid(cpm_pcie_noc_axi1_bvalid),
    .cpm_pcie_noc_axi1_rdata(cpm_pcie_noc_axi1_rdata),
    .cpm_pcie_noc_axi1_rid(cpm_pcie_noc_axi1_rid),
    .cpm_pcie_noc_axi1_rlast(cpm_pcie_noc_axi1_rlast),
    .cpm_pcie_noc_axi1_rresp(cpm_pcie_noc_axi1_rresp),
    .cpm_pcie_noc_axi1_rvalid(cpm_pcie_noc_axi1_rvalid),
    .cpm_pcie_noc_axi1_wready(cpm_pcie_noc_axi1_wready),
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
    .perst1n(perst1n)
  );
endmodule
