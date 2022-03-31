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


#include "CPM_bd_versal_cips_0_0_sc.h"

#include "CPM_bd_versal_cips_0_0.h"

#include "versal_cips_v3_0_1_tlm.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
CPM_bd_versal_cips_0_0::CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm) : CPM_bd_versal_cips_0_0_sc(nm), noc_cpm_pcie_axi0_clk("noc_cpm_pcie_axi0_clk"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), pcie0_user_clk("pcie0_user_clk"), pcie0_user_lnk_up("pcie0_user_lnk_up"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_irq("dma0_irq"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_soft_resetn("dma0_soft_resetn"), xdma0_usr_irq_ack("xdma0_usr_irq_ack"), xdma0_usr_irq_req("xdma0_usr_irq_req"), NOC_CPM_PCIE_0_araddr("NOC_CPM_PCIE_0_araddr"), NOC_CPM_PCIE_0_arburst("NOC_CPM_PCIE_0_arburst"), NOC_CPM_PCIE_0_arcache("NOC_CPM_PCIE_0_arcache"), NOC_CPM_PCIE_0_arid("NOC_CPM_PCIE_0_arid"), NOC_CPM_PCIE_0_arlen("NOC_CPM_PCIE_0_arlen"), NOC_CPM_PCIE_0_arlock("NOC_CPM_PCIE_0_arlock"), NOC_CPM_PCIE_0_arprot("NOC_CPM_PCIE_0_arprot"), NOC_CPM_PCIE_0_arqos("NOC_CPM_PCIE_0_arqos"), NOC_CPM_PCIE_0_arsize("NOC_CPM_PCIE_0_arsize"), NOC_CPM_PCIE_0_aruser("NOC_CPM_PCIE_0_aruser"), NOC_CPM_PCIE_0_arvalid("NOC_CPM_PCIE_0_arvalid"), NOC_CPM_PCIE_0_awaddr("NOC_CPM_PCIE_0_awaddr"), NOC_CPM_PCIE_0_awburst("NOC_CPM_PCIE_0_awburst"), NOC_CPM_PCIE_0_awcache("NOC_CPM_PCIE_0_awcache"), NOC_CPM_PCIE_0_awid("NOC_CPM_PCIE_0_awid"), NOC_CPM_PCIE_0_awlen("NOC_CPM_PCIE_0_awlen"), NOC_CPM_PCIE_0_awlock("NOC_CPM_PCIE_0_awlock"), NOC_CPM_PCIE_0_awprot("NOC_CPM_PCIE_0_awprot"), NOC_CPM_PCIE_0_awqos("NOC_CPM_PCIE_0_awqos"), NOC_CPM_PCIE_0_awsize("NOC_CPM_PCIE_0_awsize"), NOC_CPM_PCIE_0_awuser("NOC_CPM_PCIE_0_awuser"), NOC_CPM_PCIE_0_awvalid("NOC_CPM_PCIE_0_awvalid"), NOC_CPM_PCIE_0_bready("NOC_CPM_PCIE_0_bready"), NOC_CPM_PCIE_0_rready("NOC_CPM_PCIE_0_rready"), NOC_CPM_PCIE_0_wdata("NOC_CPM_PCIE_0_wdata"), NOC_CPM_PCIE_0_wlast("NOC_CPM_PCIE_0_wlast"), NOC_CPM_PCIE_0_wstrb("NOC_CPM_PCIE_0_wstrb"), NOC_CPM_PCIE_0_wvalid("NOC_CPM_PCIE_0_wvalid"), NOC_CPM_PCIE_0_arready("NOC_CPM_PCIE_0_arready"), NOC_CPM_PCIE_0_awready("NOC_CPM_PCIE_0_awready"), NOC_CPM_PCIE_0_bid("NOC_CPM_PCIE_0_bid"), NOC_CPM_PCIE_0_bresp("NOC_CPM_PCIE_0_bresp"), NOC_CPM_PCIE_0_bvalid("NOC_CPM_PCIE_0_bvalid"), NOC_CPM_PCIE_0_rdata("NOC_CPM_PCIE_0_rdata"), NOC_CPM_PCIE_0_rid("NOC_CPM_PCIE_0_rid"), NOC_CPM_PCIE_0_rlast("NOC_CPM_PCIE_0_rlast"), NOC_CPM_PCIE_0_rresp("NOC_CPM_PCIE_0_rresp"), NOC_CPM_PCIE_0_rvalid("NOC_CPM_PCIE_0_rvalid"), NOC_CPM_PCIE_0_wready("NOC_CPM_PCIE_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{

  // initialize pins
  mp_impl->noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->pcie0_user_clk(pcie0_user_clk);
  mp_impl->pcie0_user_lnk_up(pcie0_user_lnk_up);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_irq(dma0_irq);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_soft_resetn(dma0_soft_resetn);
  mp_impl->xdma0_usr_irq_ack(xdma0_usr_irq_ack);
  mp_impl->xdma0_usr_irq_req(xdma0_usr_irq_req);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_NOC_CPM_PCIE_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // initialize socket stubs

}

void CPM_bd_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'NOC_CPM_PCIE_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "NOC_CPM_PCIE_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'NOC_CPM_PCIE_0' transactor parameters
    xsc::common_cpp::properties NOC_CPM_PCIE_0_transactor_param_props;
    NOC_CPM_PCIE_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_REGION", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_CPM_PCIE_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_CPM_PCIE_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PCIE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("HD_TANDEM", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("INDEX", "0");

    mp_NOC_CPM_PCIE_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>("NOC_CPM_PCIE_0_transactor", NOC_CPM_PCIE_0_transactor_param_props);

    // NOC_CPM_PCIE_0' transactor ports

    mp_NOC_CPM_PCIE_0_transactor->ARADDR(NOC_CPM_PCIE_0_araddr);
    mp_NOC_CPM_PCIE_0_transactor->ARBURST(NOC_CPM_PCIE_0_arburst);
    mp_NOC_CPM_PCIE_0_transactor->ARCACHE(NOC_CPM_PCIE_0_arcache);
    mp_NOC_CPM_PCIE_0_transactor->ARID(NOC_CPM_PCIE_0_arid);
    mp_NOC_CPM_PCIE_0_transactor->ARLEN(NOC_CPM_PCIE_0_arlen);
    mp_NOC_CPM_PCIE_0_transactor->ARLOCK(NOC_CPM_PCIE_0_arlock);
    mp_NOC_CPM_PCIE_0_transactor->ARPROT(NOC_CPM_PCIE_0_arprot);
    mp_NOC_CPM_PCIE_0_transactor->ARQOS(NOC_CPM_PCIE_0_arqos);
    mp_NOC_CPM_PCIE_0_transactor->ARSIZE(NOC_CPM_PCIE_0_arsize);
    mp_NOC_CPM_PCIE_0_transactor->ARUSER(NOC_CPM_PCIE_0_aruser);
    mp_NOC_CPM_PCIE_0_transactor->ARVALID(NOC_CPM_PCIE_0_arvalid);
    mp_NOC_CPM_PCIE_0_transactor->AWADDR(NOC_CPM_PCIE_0_awaddr);
    mp_NOC_CPM_PCIE_0_transactor->AWBURST(NOC_CPM_PCIE_0_awburst);
    mp_NOC_CPM_PCIE_0_transactor->AWCACHE(NOC_CPM_PCIE_0_awcache);
    mp_NOC_CPM_PCIE_0_transactor->AWID(NOC_CPM_PCIE_0_awid);
    mp_NOC_CPM_PCIE_0_transactor->AWLEN(NOC_CPM_PCIE_0_awlen);
    mp_NOC_CPM_PCIE_0_transactor->AWLOCK(NOC_CPM_PCIE_0_awlock);
    mp_NOC_CPM_PCIE_0_transactor->AWPROT(NOC_CPM_PCIE_0_awprot);
    mp_NOC_CPM_PCIE_0_transactor->AWQOS(NOC_CPM_PCIE_0_awqos);
    mp_NOC_CPM_PCIE_0_transactor->AWSIZE(NOC_CPM_PCIE_0_awsize);
    mp_NOC_CPM_PCIE_0_transactor->AWUSER(NOC_CPM_PCIE_0_awuser);
    mp_NOC_CPM_PCIE_0_transactor->AWVALID(NOC_CPM_PCIE_0_awvalid);
    mp_NOC_CPM_PCIE_0_transactor->BREADY(NOC_CPM_PCIE_0_bready);
    mp_NOC_CPM_PCIE_0_transactor->RREADY(NOC_CPM_PCIE_0_rready);
    mp_NOC_CPM_PCIE_0_transactor->WDATA(NOC_CPM_PCIE_0_wdata);
    mp_NOC_CPM_PCIE_0_transactor->WLAST(NOC_CPM_PCIE_0_wlast);
    mp_NOC_CPM_PCIE_0_transactor->WSTRB(NOC_CPM_PCIE_0_wstrb);
    mp_NOC_CPM_PCIE_0_transactor->WVALID(NOC_CPM_PCIE_0_wvalid);
    mp_NOC_CPM_PCIE_0_transactor->ARREADY(NOC_CPM_PCIE_0_arready);
    mp_NOC_CPM_PCIE_0_transactor->AWREADY(NOC_CPM_PCIE_0_awready);
    mp_NOC_CPM_PCIE_0_transactor->BID(NOC_CPM_PCIE_0_bid);
    mp_NOC_CPM_PCIE_0_transactor->BRESP(NOC_CPM_PCIE_0_bresp);
    mp_NOC_CPM_PCIE_0_transactor->BVALID(NOC_CPM_PCIE_0_bvalid);
    mp_NOC_CPM_PCIE_0_transactor->RDATA(NOC_CPM_PCIE_0_rdata);
    mp_NOC_CPM_PCIE_0_transactor->RID(NOC_CPM_PCIE_0_rid);
    mp_NOC_CPM_PCIE_0_transactor->RLAST(NOC_CPM_PCIE_0_rlast);
    mp_NOC_CPM_PCIE_0_transactor->RRESP(NOC_CPM_PCIE_0_rresp);
    mp_NOC_CPM_PCIE_0_transactor->RVALID(NOC_CPM_PCIE_0_rvalid);
    mp_NOC_CPM_PCIE_0_transactor->WREADY(NOC_CPM_PCIE_0_wready);
    mp_NOC_CPM_PCIE_0_transactor->CLK(noc_cpm_pcie_axi0_clk);
    m_NOC_CPM_PCIE_0_transactor_rst_signal.write(1);
    mp_NOC_CPM_PCIE_0_transactor->RST(m_NOC_CPM_PCIE_0_transactor_rst_signal);

    // NOC_CPM_PCIE_0' transactor sockets

    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_0' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);

    // CPM_PCIE_NOC_0' transactor ports

    mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
    mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
    mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
    mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
    mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
    mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
    mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
    mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
    mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
    mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
    mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
    mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
    mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
    mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
    mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
    mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
    mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
    mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
    mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
    mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
    mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
    mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
    mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
    mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
    mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
    mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
    mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
    mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
    mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
    mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
    mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
    mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
    mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
    mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
    mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
    mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
    mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
    mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
    mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
    mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
    m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);

    // CPM_PCIE_NOC_0' transactor sockets

    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_1' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);

    // CPM_PCIE_NOC_1' transactor ports

    mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
    mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
    mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
    mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
    mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
    mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
    mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
    mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
    mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
    mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
    mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
    mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
    mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
    mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
    mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
    mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
    mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
    mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
    mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
    mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
    mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
    mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
    mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
    mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
    mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
    mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
    mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
    mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
    mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
    mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
    mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
    mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
    mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
    mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
    mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
    mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
    mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
    mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
    mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
    mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
    m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);

    // CPM_PCIE_NOC_1' transactor sockets

    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'dma0_st_rx_msg' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'dma0_st_rx_msg' transactor parameters
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "250000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);

    // dma0_st_rx_msg' transactor ports

    mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
    mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
    mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
    mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
    mp_dma0_st_rx_msg_transactor->CLK(pcie0_user_clk);
    mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

    // dma0_st_rx_msg' transactor sockets

    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  }
  else
  {
  }

}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
CPM_bd_versal_cips_0_0::CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm) : CPM_bd_versal_cips_0_0_sc(nm), noc_cpm_pcie_axi0_clk("noc_cpm_pcie_axi0_clk"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), pcie0_user_clk("pcie0_user_clk"), pcie0_user_lnk_up("pcie0_user_lnk_up"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_irq("dma0_irq"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_soft_resetn("dma0_soft_resetn"), xdma0_usr_irq_ack("xdma0_usr_irq_ack"), xdma0_usr_irq_req("xdma0_usr_irq_req"), NOC_CPM_PCIE_0_araddr("NOC_CPM_PCIE_0_araddr"), NOC_CPM_PCIE_0_arburst("NOC_CPM_PCIE_0_arburst"), NOC_CPM_PCIE_0_arcache("NOC_CPM_PCIE_0_arcache"), NOC_CPM_PCIE_0_arid("NOC_CPM_PCIE_0_arid"), NOC_CPM_PCIE_0_arlen("NOC_CPM_PCIE_0_arlen"), NOC_CPM_PCIE_0_arlock("NOC_CPM_PCIE_0_arlock"), NOC_CPM_PCIE_0_arprot("NOC_CPM_PCIE_0_arprot"), NOC_CPM_PCIE_0_arqos("NOC_CPM_PCIE_0_arqos"), NOC_CPM_PCIE_0_arsize("NOC_CPM_PCIE_0_arsize"), NOC_CPM_PCIE_0_aruser("NOC_CPM_PCIE_0_aruser"), NOC_CPM_PCIE_0_arvalid("NOC_CPM_PCIE_0_arvalid"), NOC_CPM_PCIE_0_awaddr("NOC_CPM_PCIE_0_awaddr"), NOC_CPM_PCIE_0_awburst("NOC_CPM_PCIE_0_awburst"), NOC_CPM_PCIE_0_awcache("NOC_CPM_PCIE_0_awcache"), NOC_CPM_PCIE_0_awid("NOC_CPM_PCIE_0_awid"), NOC_CPM_PCIE_0_awlen("NOC_CPM_PCIE_0_awlen"), NOC_CPM_PCIE_0_awlock("NOC_CPM_PCIE_0_awlock"), NOC_CPM_PCIE_0_awprot("NOC_CPM_PCIE_0_awprot"), NOC_CPM_PCIE_0_awqos("NOC_CPM_PCIE_0_awqos"), NOC_CPM_PCIE_0_awsize("NOC_CPM_PCIE_0_awsize"), NOC_CPM_PCIE_0_awuser("NOC_CPM_PCIE_0_awuser"), NOC_CPM_PCIE_0_awvalid("NOC_CPM_PCIE_0_awvalid"), NOC_CPM_PCIE_0_bready("NOC_CPM_PCIE_0_bready"), NOC_CPM_PCIE_0_rready("NOC_CPM_PCIE_0_rready"), NOC_CPM_PCIE_0_wdata("NOC_CPM_PCIE_0_wdata"), NOC_CPM_PCIE_0_wlast("NOC_CPM_PCIE_0_wlast"), NOC_CPM_PCIE_0_wstrb("NOC_CPM_PCIE_0_wstrb"), NOC_CPM_PCIE_0_wvalid("NOC_CPM_PCIE_0_wvalid"), NOC_CPM_PCIE_0_arready("NOC_CPM_PCIE_0_arready"), NOC_CPM_PCIE_0_awready("NOC_CPM_PCIE_0_awready"), NOC_CPM_PCIE_0_bid("NOC_CPM_PCIE_0_bid"), NOC_CPM_PCIE_0_bresp("NOC_CPM_PCIE_0_bresp"), NOC_CPM_PCIE_0_bvalid("NOC_CPM_PCIE_0_bvalid"), NOC_CPM_PCIE_0_rdata("NOC_CPM_PCIE_0_rdata"), NOC_CPM_PCIE_0_rid("NOC_CPM_PCIE_0_rid"), NOC_CPM_PCIE_0_rlast("NOC_CPM_PCIE_0_rlast"), NOC_CPM_PCIE_0_rresp("NOC_CPM_PCIE_0_rresp"), NOC_CPM_PCIE_0_rvalid("NOC_CPM_PCIE_0_rvalid"), NOC_CPM_PCIE_0_wready("NOC_CPM_PCIE_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{

  // initialize pins
  mp_impl->noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->pcie0_user_clk(pcie0_user_clk);
  mp_impl->pcie0_user_lnk_up(pcie0_user_lnk_up);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_irq(dma0_irq);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_soft_resetn(dma0_soft_resetn);
  mp_impl->xdma0_usr_irq_ack(xdma0_usr_irq_ack);
  mp_impl->xdma0_usr_irq_req(xdma0_usr_irq_req);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_NOC_CPM_PCIE_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // initialize socket stubs

}

void CPM_bd_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'NOC_CPM_PCIE_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "NOC_CPM_PCIE_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'NOC_CPM_PCIE_0' transactor parameters
    xsc::common_cpp::properties NOC_CPM_PCIE_0_transactor_param_props;
    NOC_CPM_PCIE_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_REGION", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_CPM_PCIE_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_CPM_PCIE_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PCIE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("HD_TANDEM", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("INDEX", "0");

    mp_NOC_CPM_PCIE_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>("NOC_CPM_PCIE_0_transactor", NOC_CPM_PCIE_0_transactor_param_props);

    // NOC_CPM_PCIE_0' transactor ports

    mp_NOC_CPM_PCIE_0_transactor->ARADDR(NOC_CPM_PCIE_0_araddr);
    mp_NOC_CPM_PCIE_0_transactor->ARBURST(NOC_CPM_PCIE_0_arburst);
    mp_NOC_CPM_PCIE_0_transactor->ARCACHE(NOC_CPM_PCIE_0_arcache);
    mp_NOC_CPM_PCIE_0_transactor->ARID(NOC_CPM_PCIE_0_arid);
    mp_NOC_CPM_PCIE_0_transactor->ARLEN(NOC_CPM_PCIE_0_arlen);
    mp_NOC_CPM_PCIE_0_transactor->ARLOCK(NOC_CPM_PCIE_0_arlock);
    mp_NOC_CPM_PCIE_0_transactor->ARPROT(NOC_CPM_PCIE_0_arprot);
    mp_NOC_CPM_PCIE_0_transactor->ARQOS(NOC_CPM_PCIE_0_arqos);
    mp_NOC_CPM_PCIE_0_transactor->ARSIZE(NOC_CPM_PCIE_0_arsize);
    mp_NOC_CPM_PCIE_0_transactor->ARUSER(NOC_CPM_PCIE_0_aruser);
    mp_NOC_CPM_PCIE_0_transactor->ARVALID(NOC_CPM_PCIE_0_arvalid);
    mp_NOC_CPM_PCIE_0_transactor->AWADDR(NOC_CPM_PCIE_0_awaddr);
    mp_NOC_CPM_PCIE_0_transactor->AWBURST(NOC_CPM_PCIE_0_awburst);
    mp_NOC_CPM_PCIE_0_transactor->AWCACHE(NOC_CPM_PCIE_0_awcache);
    mp_NOC_CPM_PCIE_0_transactor->AWID(NOC_CPM_PCIE_0_awid);
    mp_NOC_CPM_PCIE_0_transactor->AWLEN(NOC_CPM_PCIE_0_awlen);
    mp_NOC_CPM_PCIE_0_transactor->AWLOCK(NOC_CPM_PCIE_0_awlock);
    mp_NOC_CPM_PCIE_0_transactor->AWPROT(NOC_CPM_PCIE_0_awprot);
    mp_NOC_CPM_PCIE_0_transactor->AWQOS(NOC_CPM_PCIE_0_awqos);
    mp_NOC_CPM_PCIE_0_transactor->AWSIZE(NOC_CPM_PCIE_0_awsize);
    mp_NOC_CPM_PCIE_0_transactor->AWUSER(NOC_CPM_PCIE_0_awuser);
    mp_NOC_CPM_PCIE_0_transactor->AWVALID(NOC_CPM_PCIE_0_awvalid);
    mp_NOC_CPM_PCIE_0_transactor->BREADY(NOC_CPM_PCIE_0_bready);
    mp_NOC_CPM_PCIE_0_transactor->RREADY(NOC_CPM_PCIE_0_rready);
    mp_NOC_CPM_PCIE_0_transactor->WDATA(NOC_CPM_PCIE_0_wdata);
    mp_NOC_CPM_PCIE_0_transactor->WLAST(NOC_CPM_PCIE_0_wlast);
    mp_NOC_CPM_PCIE_0_transactor->WSTRB(NOC_CPM_PCIE_0_wstrb);
    mp_NOC_CPM_PCIE_0_transactor->WVALID(NOC_CPM_PCIE_0_wvalid);
    mp_NOC_CPM_PCIE_0_transactor->ARREADY(NOC_CPM_PCIE_0_arready);
    mp_NOC_CPM_PCIE_0_transactor->AWREADY(NOC_CPM_PCIE_0_awready);
    mp_NOC_CPM_PCIE_0_transactor->BID(NOC_CPM_PCIE_0_bid);
    mp_NOC_CPM_PCIE_0_transactor->BRESP(NOC_CPM_PCIE_0_bresp);
    mp_NOC_CPM_PCIE_0_transactor->BVALID(NOC_CPM_PCIE_0_bvalid);
    mp_NOC_CPM_PCIE_0_transactor->RDATA(NOC_CPM_PCIE_0_rdata);
    mp_NOC_CPM_PCIE_0_transactor->RID(NOC_CPM_PCIE_0_rid);
    mp_NOC_CPM_PCIE_0_transactor->RLAST(NOC_CPM_PCIE_0_rlast);
    mp_NOC_CPM_PCIE_0_transactor->RRESP(NOC_CPM_PCIE_0_rresp);
    mp_NOC_CPM_PCIE_0_transactor->RVALID(NOC_CPM_PCIE_0_rvalid);
    mp_NOC_CPM_PCIE_0_transactor->WREADY(NOC_CPM_PCIE_0_wready);
    mp_NOC_CPM_PCIE_0_transactor->CLK(noc_cpm_pcie_axi0_clk);
    m_NOC_CPM_PCIE_0_transactor_rst_signal.write(1);
    mp_NOC_CPM_PCIE_0_transactor->RST(m_NOC_CPM_PCIE_0_transactor_rst_signal);

    // NOC_CPM_PCIE_0' transactor sockets

    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_0' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);

    // CPM_PCIE_NOC_0' transactor ports

    mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
    mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
    mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
    mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
    mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
    mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
    mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
    mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
    mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
    mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
    mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
    mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
    mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
    mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
    mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
    mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
    mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
    mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
    mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
    mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
    mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
    mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
    mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
    mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
    mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
    mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
    mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
    mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
    mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
    mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
    mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
    mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
    mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
    mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
    mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
    mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
    mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
    mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
    mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
    mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
    m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);

    // CPM_PCIE_NOC_0' transactor sockets

    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_1' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);

    // CPM_PCIE_NOC_1' transactor ports

    mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
    mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
    mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
    mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
    mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
    mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
    mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
    mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
    mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
    mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
    mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
    mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
    mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
    mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
    mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
    mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
    mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
    mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
    mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
    mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
    mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
    mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
    mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
    mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
    mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
    mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
    mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
    mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
    mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
    mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
    mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
    mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
    mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
    mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
    mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
    mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
    mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
    mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
    mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
    mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
    m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);

    // CPM_PCIE_NOC_1' transactor sockets

    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'dma0_st_rx_msg' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'dma0_st_rx_msg' transactor parameters
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "250000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);

    // dma0_st_rx_msg' transactor ports

    mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
    mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
    mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
    mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
    mp_dma0_st_rx_msg_transactor->CLK(pcie0_user_clk);
    mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

    // dma0_st_rx_msg' transactor sockets

    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  }
  else
  {
  }

}

#endif // XM_SYSTEMC




#ifdef RIVIERA
CPM_bd_versal_cips_0_0::CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm) : CPM_bd_versal_cips_0_0_sc(nm), noc_cpm_pcie_axi0_clk("noc_cpm_pcie_axi0_clk"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), pcie0_user_clk("pcie0_user_clk"), pcie0_user_lnk_up("pcie0_user_lnk_up"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_irq("dma0_irq"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_soft_resetn("dma0_soft_resetn"), xdma0_usr_irq_ack("xdma0_usr_irq_ack"), xdma0_usr_irq_req("xdma0_usr_irq_req"), NOC_CPM_PCIE_0_araddr("NOC_CPM_PCIE_0_araddr"), NOC_CPM_PCIE_0_arburst("NOC_CPM_PCIE_0_arburst"), NOC_CPM_PCIE_0_arcache("NOC_CPM_PCIE_0_arcache"), NOC_CPM_PCIE_0_arid("NOC_CPM_PCIE_0_arid"), NOC_CPM_PCIE_0_arlen("NOC_CPM_PCIE_0_arlen"), NOC_CPM_PCIE_0_arlock("NOC_CPM_PCIE_0_arlock"), NOC_CPM_PCIE_0_arprot("NOC_CPM_PCIE_0_arprot"), NOC_CPM_PCIE_0_arqos("NOC_CPM_PCIE_0_arqos"), NOC_CPM_PCIE_0_arsize("NOC_CPM_PCIE_0_arsize"), NOC_CPM_PCIE_0_aruser("NOC_CPM_PCIE_0_aruser"), NOC_CPM_PCIE_0_arvalid("NOC_CPM_PCIE_0_arvalid"), NOC_CPM_PCIE_0_awaddr("NOC_CPM_PCIE_0_awaddr"), NOC_CPM_PCIE_0_awburst("NOC_CPM_PCIE_0_awburst"), NOC_CPM_PCIE_0_awcache("NOC_CPM_PCIE_0_awcache"), NOC_CPM_PCIE_0_awid("NOC_CPM_PCIE_0_awid"), NOC_CPM_PCIE_0_awlen("NOC_CPM_PCIE_0_awlen"), NOC_CPM_PCIE_0_awlock("NOC_CPM_PCIE_0_awlock"), NOC_CPM_PCIE_0_awprot("NOC_CPM_PCIE_0_awprot"), NOC_CPM_PCIE_0_awqos("NOC_CPM_PCIE_0_awqos"), NOC_CPM_PCIE_0_awsize("NOC_CPM_PCIE_0_awsize"), NOC_CPM_PCIE_0_awuser("NOC_CPM_PCIE_0_awuser"), NOC_CPM_PCIE_0_awvalid("NOC_CPM_PCIE_0_awvalid"), NOC_CPM_PCIE_0_bready("NOC_CPM_PCIE_0_bready"), NOC_CPM_PCIE_0_rready("NOC_CPM_PCIE_0_rready"), NOC_CPM_PCIE_0_wdata("NOC_CPM_PCIE_0_wdata"), NOC_CPM_PCIE_0_wlast("NOC_CPM_PCIE_0_wlast"), NOC_CPM_PCIE_0_wstrb("NOC_CPM_PCIE_0_wstrb"), NOC_CPM_PCIE_0_wvalid("NOC_CPM_PCIE_0_wvalid"), NOC_CPM_PCIE_0_arready("NOC_CPM_PCIE_0_arready"), NOC_CPM_PCIE_0_awready("NOC_CPM_PCIE_0_awready"), NOC_CPM_PCIE_0_bid("NOC_CPM_PCIE_0_bid"), NOC_CPM_PCIE_0_bresp("NOC_CPM_PCIE_0_bresp"), NOC_CPM_PCIE_0_bvalid("NOC_CPM_PCIE_0_bvalid"), NOC_CPM_PCIE_0_rdata("NOC_CPM_PCIE_0_rdata"), NOC_CPM_PCIE_0_rid("NOC_CPM_PCIE_0_rid"), NOC_CPM_PCIE_0_rlast("NOC_CPM_PCIE_0_rlast"), NOC_CPM_PCIE_0_rresp("NOC_CPM_PCIE_0_rresp"), NOC_CPM_PCIE_0_rvalid("NOC_CPM_PCIE_0_rvalid"), NOC_CPM_PCIE_0_wready("NOC_CPM_PCIE_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{

  // initialize pins
  mp_impl->noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->pcie0_user_clk(pcie0_user_clk);
  mp_impl->pcie0_user_lnk_up(pcie0_user_lnk_up);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_irq(dma0_irq);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_soft_resetn(dma0_soft_resetn);
  mp_impl->xdma0_usr_irq_ack(xdma0_usr_irq_ack);
  mp_impl->xdma0_usr_irq_req(xdma0_usr_irq_req);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_NOC_CPM_PCIE_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // initialize socket stubs

}

void CPM_bd_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'NOC_CPM_PCIE_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "NOC_CPM_PCIE_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'NOC_CPM_PCIE_0' transactor parameters
    xsc::common_cpp::properties NOC_CPM_PCIE_0_transactor_param_props;
    NOC_CPM_PCIE_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_REGION", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_CPM_PCIE_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_CPM_PCIE_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PCIE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("HD_TANDEM", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("INDEX", "0");

    mp_NOC_CPM_PCIE_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>("NOC_CPM_PCIE_0_transactor", NOC_CPM_PCIE_0_transactor_param_props);

    // NOC_CPM_PCIE_0' transactor ports

    mp_NOC_CPM_PCIE_0_transactor->ARADDR(NOC_CPM_PCIE_0_araddr);
    mp_NOC_CPM_PCIE_0_transactor->ARBURST(NOC_CPM_PCIE_0_arburst);
    mp_NOC_CPM_PCIE_0_transactor->ARCACHE(NOC_CPM_PCIE_0_arcache);
    mp_NOC_CPM_PCIE_0_transactor->ARID(NOC_CPM_PCIE_0_arid);
    mp_NOC_CPM_PCIE_0_transactor->ARLEN(NOC_CPM_PCIE_0_arlen);
    mp_NOC_CPM_PCIE_0_transactor->ARLOCK(NOC_CPM_PCIE_0_arlock);
    mp_NOC_CPM_PCIE_0_transactor->ARPROT(NOC_CPM_PCIE_0_arprot);
    mp_NOC_CPM_PCIE_0_transactor->ARQOS(NOC_CPM_PCIE_0_arqos);
    mp_NOC_CPM_PCIE_0_transactor->ARSIZE(NOC_CPM_PCIE_0_arsize);
    mp_NOC_CPM_PCIE_0_transactor->ARUSER(NOC_CPM_PCIE_0_aruser);
    mp_NOC_CPM_PCIE_0_transactor->ARVALID(NOC_CPM_PCIE_0_arvalid);
    mp_NOC_CPM_PCIE_0_transactor->AWADDR(NOC_CPM_PCIE_0_awaddr);
    mp_NOC_CPM_PCIE_0_transactor->AWBURST(NOC_CPM_PCIE_0_awburst);
    mp_NOC_CPM_PCIE_0_transactor->AWCACHE(NOC_CPM_PCIE_0_awcache);
    mp_NOC_CPM_PCIE_0_transactor->AWID(NOC_CPM_PCIE_0_awid);
    mp_NOC_CPM_PCIE_0_transactor->AWLEN(NOC_CPM_PCIE_0_awlen);
    mp_NOC_CPM_PCIE_0_transactor->AWLOCK(NOC_CPM_PCIE_0_awlock);
    mp_NOC_CPM_PCIE_0_transactor->AWPROT(NOC_CPM_PCIE_0_awprot);
    mp_NOC_CPM_PCIE_0_transactor->AWQOS(NOC_CPM_PCIE_0_awqos);
    mp_NOC_CPM_PCIE_0_transactor->AWSIZE(NOC_CPM_PCIE_0_awsize);
    mp_NOC_CPM_PCIE_0_transactor->AWUSER(NOC_CPM_PCIE_0_awuser);
    mp_NOC_CPM_PCIE_0_transactor->AWVALID(NOC_CPM_PCIE_0_awvalid);
    mp_NOC_CPM_PCIE_0_transactor->BREADY(NOC_CPM_PCIE_0_bready);
    mp_NOC_CPM_PCIE_0_transactor->RREADY(NOC_CPM_PCIE_0_rready);
    mp_NOC_CPM_PCIE_0_transactor->WDATA(NOC_CPM_PCIE_0_wdata);
    mp_NOC_CPM_PCIE_0_transactor->WLAST(NOC_CPM_PCIE_0_wlast);
    mp_NOC_CPM_PCIE_0_transactor->WSTRB(NOC_CPM_PCIE_0_wstrb);
    mp_NOC_CPM_PCIE_0_transactor->WVALID(NOC_CPM_PCIE_0_wvalid);
    mp_NOC_CPM_PCIE_0_transactor->ARREADY(NOC_CPM_PCIE_0_arready);
    mp_NOC_CPM_PCIE_0_transactor->AWREADY(NOC_CPM_PCIE_0_awready);
    mp_NOC_CPM_PCIE_0_transactor->BID(NOC_CPM_PCIE_0_bid);
    mp_NOC_CPM_PCIE_0_transactor->BRESP(NOC_CPM_PCIE_0_bresp);
    mp_NOC_CPM_PCIE_0_transactor->BVALID(NOC_CPM_PCIE_0_bvalid);
    mp_NOC_CPM_PCIE_0_transactor->RDATA(NOC_CPM_PCIE_0_rdata);
    mp_NOC_CPM_PCIE_0_transactor->RID(NOC_CPM_PCIE_0_rid);
    mp_NOC_CPM_PCIE_0_transactor->RLAST(NOC_CPM_PCIE_0_rlast);
    mp_NOC_CPM_PCIE_0_transactor->RRESP(NOC_CPM_PCIE_0_rresp);
    mp_NOC_CPM_PCIE_0_transactor->RVALID(NOC_CPM_PCIE_0_rvalid);
    mp_NOC_CPM_PCIE_0_transactor->WREADY(NOC_CPM_PCIE_0_wready);
    mp_NOC_CPM_PCIE_0_transactor->CLK(noc_cpm_pcie_axi0_clk);
    m_NOC_CPM_PCIE_0_transactor_rst_signal.write(1);
    mp_NOC_CPM_PCIE_0_transactor->RST(m_NOC_CPM_PCIE_0_transactor_rst_signal);

    // NOC_CPM_PCIE_0' transactor sockets

    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_0' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_0' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);

    // CPM_PCIE_NOC_0' transactor ports

    mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
    mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
    mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
    mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
    mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
    mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
    mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
    mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
    mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
    mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
    mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
    mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
    mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
    mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
    mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
    mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
    mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
    mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
    mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
    mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
    mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
    mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
    mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
    mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
    mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
    mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
    mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
    mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
    mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
    mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
    mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
    mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
    mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
    mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
    mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
    mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
    mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
    mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
    mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
    mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
    m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);

    // CPM_PCIE_NOC_0' transactor sockets

    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'CPM_PCIE_NOC_1' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'CPM_PCIE_NOC_1' transactor parameters
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);

    // CPM_PCIE_NOC_1' transactor ports

    mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
    mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
    mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
    mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
    mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
    mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
    mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
    mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
    mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
    mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
    mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
    mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
    mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
    mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
    mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
    mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
    mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
    mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
    mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
    mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
    mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
    mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
    mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
    mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
    mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
    mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
    mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
    mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
    mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
    mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
    mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
    mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
    mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
    mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
    mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
    mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
    mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
    mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
    mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
    mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
    m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
    mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);

    // CPM_PCIE_NOC_1' transactor sockets

    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  }
  else
  {
  }

  // configure 'dma0_st_rx_msg' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'dma0_st_rx_msg' transactor parameters
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "250000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);

    // dma0_st_rx_msg' transactor ports

    mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
    mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
    mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
    mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
    mp_dma0_st_rx_msg_transactor->CLK(pcie0_user_clk);
    mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

    // dma0_st_rx_msg' transactor sockets

    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  }
  else
  {
  }

}

#endif // RIVIERA




#ifdef VCSSYSTEMC
CPM_bd_versal_cips_0_0::CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm) : CPM_bd_versal_cips_0_0_sc(nm),  noc_cpm_pcie_axi0_clk("noc_cpm_pcie_axi0_clk"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), pcie0_user_clk("pcie0_user_clk"), pcie0_user_lnk_up("pcie0_user_lnk_up"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_irq("dma0_irq"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_soft_resetn("dma0_soft_resetn"), xdma0_usr_irq_ack("xdma0_usr_irq_ack"), xdma0_usr_irq_req("xdma0_usr_irq_req"), NOC_CPM_PCIE_0_araddr("NOC_CPM_PCIE_0_araddr"), NOC_CPM_PCIE_0_arburst("NOC_CPM_PCIE_0_arburst"), NOC_CPM_PCIE_0_arcache("NOC_CPM_PCIE_0_arcache"), NOC_CPM_PCIE_0_arid("NOC_CPM_PCIE_0_arid"), NOC_CPM_PCIE_0_arlen("NOC_CPM_PCIE_0_arlen"), NOC_CPM_PCIE_0_arlock("NOC_CPM_PCIE_0_arlock"), NOC_CPM_PCIE_0_arprot("NOC_CPM_PCIE_0_arprot"), NOC_CPM_PCIE_0_arqos("NOC_CPM_PCIE_0_arqos"), NOC_CPM_PCIE_0_arsize("NOC_CPM_PCIE_0_arsize"), NOC_CPM_PCIE_0_aruser("NOC_CPM_PCIE_0_aruser"), NOC_CPM_PCIE_0_arvalid("NOC_CPM_PCIE_0_arvalid"), NOC_CPM_PCIE_0_awaddr("NOC_CPM_PCIE_0_awaddr"), NOC_CPM_PCIE_0_awburst("NOC_CPM_PCIE_0_awburst"), NOC_CPM_PCIE_0_awcache("NOC_CPM_PCIE_0_awcache"), NOC_CPM_PCIE_0_awid("NOC_CPM_PCIE_0_awid"), NOC_CPM_PCIE_0_awlen("NOC_CPM_PCIE_0_awlen"), NOC_CPM_PCIE_0_awlock("NOC_CPM_PCIE_0_awlock"), NOC_CPM_PCIE_0_awprot("NOC_CPM_PCIE_0_awprot"), NOC_CPM_PCIE_0_awqos("NOC_CPM_PCIE_0_awqos"), NOC_CPM_PCIE_0_awsize("NOC_CPM_PCIE_0_awsize"), NOC_CPM_PCIE_0_awuser("NOC_CPM_PCIE_0_awuser"), NOC_CPM_PCIE_0_awvalid("NOC_CPM_PCIE_0_awvalid"), NOC_CPM_PCIE_0_bready("NOC_CPM_PCIE_0_bready"), NOC_CPM_PCIE_0_rready("NOC_CPM_PCIE_0_rready"), NOC_CPM_PCIE_0_wdata("NOC_CPM_PCIE_0_wdata"), NOC_CPM_PCIE_0_wlast("NOC_CPM_PCIE_0_wlast"), NOC_CPM_PCIE_0_wstrb("NOC_CPM_PCIE_0_wstrb"), NOC_CPM_PCIE_0_wvalid("NOC_CPM_PCIE_0_wvalid"), NOC_CPM_PCIE_0_arready("NOC_CPM_PCIE_0_arready"), NOC_CPM_PCIE_0_awready("NOC_CPM_PCIE_0_awready"), NOC_CPM_PCIE_0_bid("NOC_CPM_PCIE_0_bid"), NOC_CPM_PCIE_0_bresp("NOC_CPM_PCIE_0_bresp"), NOC_CPM_PCIE_0_bvalid("NOC_CPM_PCIE_0_bvalid"), NOC_CPM_PCIE_0_rdata("NOC_CPM_PCIE_0_rdata"), NOC_CPM_PCIE_0_rid("NOC_CPM_PCIE_0_rid"), NOC_CPM_PCIE_0_rlast("NOC_CPM_PCIE_0_rlast"), NOC_CPM_PCIE_0_rresp("NOC_CPM_PCIE_0_rresp"), NOC_CPM_PCIE_0_rvalid("NOC_CPM_PCIE_0_rvalid"), NOC_CPM_PCIE_0_wready("NOC_CPM_PCIE_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{
  // initialize pins
  mp_impl->noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->pcie0_user_clk(pcie0_user_clk);
  mp_impl->pcie0_user_lnk_up(pcie0_user_lnk_up);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_irq(dma0_irq);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_soft_resetn(dma0_soft_resetn);
  mp_impl->xdma0_usr_irq_ack(xdma0_usr_irq_ack);
  mp_impl->xdma0_usr_irq_req(xdma0_usr_irq_req);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_NOC_CPM_PCIE_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // Instantiate Socket Stubs

  // configure NOC_CPM_PCIE_0_transactor
    xsc::common_cpp::properties NOC_CPM_PCIE_0_transactor_param_props;
    NOC_CPM_PCIE_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_REGION", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_CPM_PCIE_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_CPM_PCIE_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PCIE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("HD_TANDEM", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("INDEX", "0");

    mp_NOC_CPM_PCIE_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>("NOC_CPM_PCIE_0_transactor", NOC_CPM_PCIE_0_transactor_param_props);
  mp_NOC_CPM_PCIE_0_transactor->ARADDR(NOC_CPM_PCIE_0_araddr);
  mp_NOC_CPM_PCIE_0_transactor->ARBURST(NOC_CPM_PCIE_0_arburst);
  mp_NOC_CPM_PCIE_0_transactor->ARCACHE(NOC_CPM_PCIE_0_arcache);
  mp_NOC_CPM_PCIE_0_transactor->ARID(NOC_CPM_PCIE_0_arid);
  mp_NOC_CPM_PCIE_0_transactor->ARLEN(NOC_CPM_PCIE_0_arlen);
  mp_NOC_CPM_PCIE_0_transactor->ARLOCK(NOC_CPM_PCIE_0_arlock);
  mp_NOC_CPM_PCIE_0_transactor->ARPROT(NOC_CPM_PCIE_0_arprot);
  mp_NOC_CPM_PCIE_0_transactor->ARQOS(NOC_CPM_PCIE_0_arqos);
  mp_NOC_CPM_PCIE_0_transactor->ARSIZE(NOC_CPM_PCIE_0_arsize);
  mp_NOC_CPM_PCIE_0_transactor->ARUSER(NOC_CPM_PCIE_0_aruser);
  mp_NOC_CPM_PCIE_0_transactor->ARVALID(NOC_CPM_PCIE_0_arvalid);
  mp_NOC_CPM_PCIE_0_transactor->AWADDR(NOC_CPM_PCIE_0_awaddr);
  mp_NOC_CPM_PCIE_0_transactor->AWBURST(NOC_CPM_PCIE_0_awburst);
  mp_NOC_CPM_PCIE_0_transactor->AWCACHE(NOC_CPM_PCIE_0_awcache);
  mp_NOC_CPM_PCIE_0_transactor->AWID(NOC_CPM_PCIE_0_awid);
  mp_NOC_CPM_PCIE_0_transactor->AWLEN(NOC_CPM_PCIE_0_awlen);
  mp_NOC_CPM_PCIE_0_transactor->AWLOCK(NOC_CPM_PCIE_0_awlock);
  mp_NOC_CPM_PCIE_0_transactor->AWPROT(NOC_CPM_PCIE_0_awprot);
  mp_NOC_CPM_PCIE_0_transactor->AWQOS(NOC_CPM_PCIE_0_awqos);
  mp_NOC_CPM_PCIE_0_transactor->AWSIZE(NOC_CPM_PCIE_0_awsize);
  mp_NOC_CPM_PCIE_0_transactor->AWUSER(NOC_CPM_PCIE_0_awuser);
  mp_NOC_CPM_PCIE_0_transactor->AWVALID(NOC_CPM_PCIE_0_awvalid);
  mp_NOC_CPM_PCIE_0_transactor->BREADY(NOC_CPM_PCIE_0_bready);
  mp_NOC_CPM_PCIE_0_transactor->RREADY(NOC_CPM_PCIE_0_rready);
  mp_NOC_CPM_PCIE_0_transactor->WDATA(NOC_CPM_PCIE_0_wdata);
  mp_NOC_CPM_PCIE_0_transactor->WLAST(NOC_CPM_PCIE_0_wlast);
  mp_NOC_CPM_PCIE_0_transactor->WSTRB(NOC_CPM_PCIE_0_wstrb);
  mp_NOC_CPM_PCIE_0_transactor->WVALID(NOC_CPM_PCIE_0_wvalid);
  mp_NOC_CPM_PCIE_0_transactor->ARREADY(NOC_CPM_PCIE_0_arready);
  mp_NOC_CPM_PCIE_0_transactor->AWREADY(NOC_CPM_PCIE_0_awready);
  mp_NOC_CPM_PCIE_0_transactor->BID(NOC_CPM_PCIE_0_bid);
  mp_NOC_CPM_PCIE_0_transactor->BRESP(NOC_CPM_PCIE_0_bresp);
  mp_NOC_CPM_PCIE_0_transactor->BVALID(NOC_CPM_PCIE_0_bvalid);
  mp_NOC_CPM_PCIE_0_transactor->RDATA(NOC_CPM_PCIE_0_rdata);
  mp_NOC_CPM_PCIE_0_transactor->RID(NOC_CPM_PCIE_0_rid);
  mp_NOC_CPM_PCIE_0_transactor->RLAST(NOC_CPM_PCIE_0_rlast);
  mp_NOC_CPM_PCIE_0_transactor->RRESP(NOC_CPM_PCIE_0_rresp);
  mp_NOC_CPM_PCIE_0_transactor->RVALID(NOC_CPM_PCIE_0_rvalid);
  mp_NOC_CPM_PCIE_0_transactor->WREADY(NOC_CPM_PCIE_0_wready);
  mp_NOC_CPM_PCIE_0_transactor->CLK(noc_cpm_pcie_axi0_clk);
  m_NOC_CPM_PCIE_0_transactor_rst_signal.write(1);
  mp_NOC_CPM_PCIE_0_transactor->RST(m_NOC_CPM_PCIE_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_0_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);
  mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
  mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
  mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
  mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
  mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
  mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
  mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
  mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
  mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
  mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
  mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
  mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
  mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
  mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
  mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
  mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
  mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
  mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
  mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
  mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
  mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
  mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
  mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
  mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
  mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
  mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
  mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
  mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
  mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
  mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
  mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
  mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
  mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
  mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
  mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
  mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
  mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
  mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
  mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
  mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
  m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_1_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);
  mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
  mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
  mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
  mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
  mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
  mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
  mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
  mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
  mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
  mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
  mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
  mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
  mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
  mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
  mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
  mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
  mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
  mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
  mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
  mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
  mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
  mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
  mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
  mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
  mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
  mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
  mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
  mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
  mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
  mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
  mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
  mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
  mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
  mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
  mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
  mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
  mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
  mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
  mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
  mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
  m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);
  // configure dma0_st_rx_msg_transactor
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "250000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);
  mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
  mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
  mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
  mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
  mp_dma0_st_rx_msg_transactor->CLK(pcie0_user_clk);
  mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

  // initialize transactors stubs
  NOC_CPM_PCIE_0_transactor_target_wr_socket_stub = nullptr;
  NOC_CPM_PCIE_0_transactor_target_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = nullptr;
  dma0_st_rx_msg_transactor_initiator_socket_stub = nullptr;

}

void CPM_bd_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'NOC_CPM_PCIE_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "NOC_CPM_PCIE_0_TLM_MODE") != 1)
  {
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
  
  }
  else
  {
    NOC_CPM_PCIE_0_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    NOC_CPM_PCIE_0_transactor_target_wr_socket_stub->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
    NOC_CPM_PCIE_0_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    NOC_CPM_PCIE_0_transactor_target_rd_socket_stub->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_NOC_CPM_PCIE_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_CPM_PCIE_NOC_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_1' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_CPM_PCIE_NOC_1_transactor->disable_transactor();
  }

  // configure 'dma0_st_rx_msg' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  
  }
  else
  {
    dma0_st_rx_msg_transactor_initiator_socket_stub = new xtlm::xtlm_axis_initiator_stub("socket",0);
    dma0_st_rx_msg_transactor_initiator_socket_stub->bind(*(mp_dma0_st_rx_msg_transactor->socket));
    mp_dma0_st_rx_msg_transactor->disable_transactor();
  }

}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
CPM_bd_versal_cips_0_0::CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm) : CPM_bd_versal_cips_0_0_sc(nm),  noc_cpm_pcie_axi0_clk("noc_cpm_pcie_axi0_clk"), cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk"), cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk"), pcie0_user_clk("pcie0_user_clk"), pcie0_user_lnk_up("pcie0_user_lnk_up"), cpm_misc_irq("cpm_misc_irq"), cpm_cor_irq("cpm_cor_irq"), cpm_uncor_irq("cpm_uncor_irq"), cpm_irq0("cpm_irq0"), cpm_irq1("cpm_irq1"), dma0_irq("dma0_irq"), dma0_axi_aresetn("dma0_axi_aresetn"), dma0_soft_resetn("dma0_soft_resetn"), xdma0_usr_irq_ack("xdma0_usr_irq_ack"), xdma0_usr_irq_req("xdma0_usr_irq_req"), NOC_CPM_PCIE_0_araddr("NOC_CPM_PCIE_0_araddr"), NOC_CPM_PCIE_0_arburst("NOC_CPM_PCIE_0_arburst"), NOC_CPM_PCIE_0_arcache("NOC_CPM_PCIE_0_arcache"), NOC_CPM_PCIE_0_arid("NOC_CPM_PCIE_0_arid"), NOC_CPM_PCIE_0_arlen("NOC_CPM_PCIE_0_arlen"), NOC_CPM_PCIE_0_arlock("NOC_CPM_PCIE_0_arlock"), NOC_CPM_PCIE_0_arprot("NOC_CPM_PCIE_0_arprot"), NOC_CPM_PCIE_0_arqos("NOC_CPM_PCIE_0_arqos"), NOC_CPM_PCIE_0_arsize("NOC_CPM_PCIE_0_arsize"), NOC_CPM_PCIE_0_aruser("NOC_CPM_PCIE_0_aruser"), NOC_CPM_PCIE_0_arvalid("NOC_CPM_PCIE_0_arvalid"), NOC_CPM_PCIE_0_awaddr("NOC_CPM_PCIE_0_awaddr"), NOC_CPM_PCIE_0_awburst("NOC_CPM_PCIE_0_awburst"), NOC_CPM_PCIE_0_awcache("NOC_CPM_PCIE_0_awcache"), NOC_CPM_PCIE_0_awid("NOC_CPM_PCIE_0_awid"), NOC_CPM_PCIE_0_awlen("NOC_CPM_PCIE_0_awlen"), NOC_CPM_PCIE_0_awlock("NOC_CPM_PCIE_0_awlock"), NOC_CPM_PCIE_0_awprot("NOC_CPM_PCIE_0_awprot"), NOC_CPM_PCIE_0_awqos("NOC_CPM_PCIE_0_awqos"), NOC_CPM_PCIE_0_awsize("NOC_CPM_PCIE_0_awsize"), NOC_CPM_PCIE_0_awuser("NOC_CPM_PCIE_0_awuser"), NOC_CPM_PCIE_0_awvalid("NOC_CPM_PCIE_0_awvalid"), NOC_CPM_PCIE_0_bready("NOC_CPM_PCIE_0_bready"), NOC_CPM_PCIE_0_rready("NOC_CPM_PCIE_0_rready"), NOC_CPM_PCIE_0_wdata("NOC_CPM_PCIE_0_wdata"), NOC_CPM_PCIE_0_wlast("NOC_CPM_PCIE_0_wlast"), NOC_CPM_PCIE_0_wstrb("NOC_CPM_PCIE_0_wstrb"), NOC_CPM_PCIE_0_wvalid("NOC_CPM_PCIE_0_wvalid"), NOC_CPM_PCIE_0_arready("NOC_CPM_PCIE_0_arready"), NOC_CPM_PCIE_0_awready("NOC_CPM_PCIE_0_awready"), NOC_CPM_PCIE_0_bid("NOC_CPM_PCIE_0_bid"), NOC_CPM_PCIE_0_bresp("NOC_CPM_PCIE_0_bresp"), NOC_CPM_PCIE_0_bvalid("NOC_CPM_PCIE_0_bvalid"), NOC_CPM_PCIE_0_rdata("NOC_CPM_PCIE_0_rdata"), NOC_CPM_PCIE_0_rid("NOC_CPM_PCIE_0_rid"), NOC_CPM_PCIE_0_rlast("NOC_CPM_PCIE_0_rlast"), NOC_CPM_PCIE_0_rresp("NOC_CPM_PCIE_0_rresp"), NOC_CPM_PCIE_0_rvalid("NOC_CPM_PCIE_0_rvalid"), NOC_CPM_PCIE_0_wready("NOC_CPM_PCIE_0_wready"), CPM_PCIE_NOC_0_araddr("CPM_PCIE_NOC_0_araddr"), CPM_PCIE_NOC_0_arburst("CPM_PCIE_NOC_0_arburst"), CPM_PCIE_NOC_0_arcache("CPM_PCIE_NOC_0_arcache"), CPM_PCIE_NOC_0_arid("CPM_PCIE_NOC_0_arid"), CPM_PCIE_NOC_0_arlen("CPM_PCIE_NOC_0_arlen"), CPM_PCIE_NOC_0_arlock("CPM_PCIE_NOC_0_arlock"), CPM_PCIE_NOC_0_arprot("CPM_PCIE_NOC_0_arprot"), CPM_PCIE_NOC_0_arqos("CPM_PCIE_NOC_0_arqos"), CPM_PCIE_NOC_0_arsize("CPM_PCIE_NOC_0_arsize"), CPM_PCIE_NOC_0_aruser("CPM_PCIE_NOC_0_aruser"), CPM_PCIE_NOC_0_arvalid("CPM_PCIE_NOC_0_arvalid"), CPM_PCIE_NOC_0_awaddr("CPM_PCIE_NOC_0_awaddr"), CPM_PCIE_NOC_0_awburst("CPM_PCIE_NOC_0_awburst"), CPM_PCIE_NOC_0_awcache("CPM_PCIE_NOC_0_awcache"), CPM_PCIE_NOC_0_awid("CPM_PCIE_NOC_0_awid"), CPM_PCIE_NOC_0_awlen("CPM_PCIE_NOC_0_awlen"), CPM_PCIE_NOC_0_awlock("CPM_PCIE_NOC_0_awlock"), CPM_PCIE_NOC_0_awprot("CPM_PCIE_NOC_0_awprot"), CPM_PCIE_NOC_0_awqos("CPM_PCIE_NOC_0_awqos"), CPM_PCIE_NOC_0_awsize("CPM_PCIE_NOC_0_awsize"), CPM_PCIE_NOC_0_awuser("CPM_PCIE_NOC_0_awuser"), CPM_PCIE_NOC_0_awvalid("CPM_PCIE_NOC_0_awvalid"), CPM_PCIE_NOC_0_bready("CPM_PCIE_NOC_0_bready"), CPM_PCIE_NOC_0_rready("CPM_PCIE_NOC_0_rready"), CPM_PCIE_NOC_0_wdata("CPM_PCIE_NOC_0_wdata"), CPM_PCIE_NOC_0_wlast("CPM_PCIE_NOC_0_wlast"), CPM_PCIE_NOC_0_wstrb("CPM_PCIE_NOC_0_wstrb"), CPM_PCIE_NOC_0_wvalid("CPM_PCIE_NOC_0_wvalid"), CPM_PCIE_NOC_0_arready("CPM_PCIE_NOC_0_arready"), CPM_PCIE_NOC_0_awready("CPM_PCIE_NOC_0_awready"), CPM_PCIE_NOC_0_bid("CPM_PCIE_NOC_0_bid"), CPM_PCIE_NOC_0_bresp("CPM_PCIE_NOC_0_bresp"), CPM_PCIE_NOC_0_bvalid("CPM_PCIE_NOC_0_bvalid"), CPM_PCIE_NOC_0_rdata("CPM_PCIE_NOC_0_rdata"), CPM_PCIE_NOC_0_rid("CPM_PCIE_NOC_0_rid"), CPM_PCIE_NOC_0_rlast("CPM_PCIE_NOC_0_rlast"), CPM_PCIE_NOC_0_rresp("CPM_PCIE_NOC_0_rresp"), CPM_PCIE_NOC_0_rvalid("CPM_PCIE_NOC_0_rvalid"), CPM_PCIE_NOC_0_wready("CPM_PCIE_NOC_0_wready"), CPM_PCIE_NOC_1_araddr("CPM_PCIE_NOC_1_araddr"), CPM_PCIE_NOC_1_arburst("CPM_PCIE_NOC_1_arburst"), CPM_PCIE_NOC_1_arcache("CPM_PCIE_NOC_1_arcache"), CPM_PCIE_NOC_1_arid("CPM_PCIE_NOC_1_arid"), CPM_PCIE_NOC_1_arlen("CPM_PCIE_NOC_1_arlen"), CPM_PCIE_NOC_1_arlock("CPM_PCIE_NOC_1_arlock"), CPM_PCIE_NOC_1_arprot("CPM_PCIE_NOC_1_arprot"), CPM_PCIE_NOC_1_arqos("CPM_PCIE_NOC_1_arqos"), CPM_PCIE_NOC_1_arsize("CPM_PCIE_NOC_1_arsize"), CPM_PCIE_NOC_1_aruser("CPM_PCIE_NOC_1_aruser"), CPM_PCIE_NOC_1_arvalid("CPM_PCIE_NOC_1_arvalid"), CPM_PCIE_NOC_1_awaddr("CPM_PCIE_NOC_1_awaddr"), CPM_PCIE_NOC_1_awburst("CPM_PCIE_NOC_1_awburst"), CPM_PCIE_NOC_1_awcache("CPM_PCIE_NOC_1_awcache"), CPM_PCIE_NOC_1_awid("CPM_PCIE_NOC_1_awid"), CPM_PCIE_NOC_1_awlen("CPM_PCIE_NOC_1_awlen"), CPM_PCIE_NOC_1_awlock("CPM_PCIE_NOC_1_awlock"), CPM_PCIE_NOC_1_awprot("CPM_PCIE_NOC_1_awprot"), CPM_PCIE_NOC_1_awqos("CPM_PCIE_NOC_1_awqos"), CPM_PCIE_NOC_1_awsize("CPM_PCIE_NOC_1_awsize"), CPM_PCIE_NOC_1_awuser("CPM_PCIE_NOC_1_awuser"), CPM_PCIE_NOC_1_awvalid("CPM_PCIE_NOC_1_awvalid"), CPM_PCIE_NOC_1_bready("CPM_PCIE_NOC_1_bready"), CPM_PCIE_NOC_1_rready("CPM_PCIE_NOC_1_rready"), CPM_PCIE_NOC_1_wdata("CPM_PCIE_NOC_1_wdata"), CPM_PCIE_NOC_1_wlast("CPM_PCIE_NOC_1_wlast"), CPM_PCIE_NOC_1_wstrb("CPM_PCIE_NOC_1_wstrb"), CPM_PCIE_NOC_1_wvalid("CPM_PCIE_NOC_1_wvalid"), CPM_PCIE_NOC_1_arready("CPM_PCIE_NOC_1_arready"), CPM_PCIE_NOC_1_awready("CPM_PCIE_NOC_1_awready"), CPM_PCIE_NOC_1_bid("CPM_PCIE_NOC_1_bid"), CPM_PCIE_NOC_1_bresp("CPM_PCIE_NOC_1_bresp"), CPM_PCIE_NOC_1_bvalid("CPM_PCIE_NOC_1_bvalid"), CPM_PCIE_NOC_1_rdata("CPM_PCIE_NOC_1_rdata"), CPM_PCIE_NOC_1_rid("CPM_PCIE_NOC_1_rid"), CPM_PCIE_NOC_1_rlast("CPM_PCIE_NOC_1_rlast"), CPM_PCIE_NOC_1_rresp("CPM_PCIE_NOC_1_rresp"), CPM_PCIE_NOC_1_rvalid("CPM_PCIE_NOC_1_rvalid"), CPM_PCIE_NOC_1_wready("CPM_PCIE_NOC_1_wready"), PCIE0_GT_gtx_n("PCIE0_GT_gtx_n"), PCIE0_GT_gtx_p("PCIE0_GT_gtx_p"), PCIE0_GT_grx_n("PCIE0_GT_grx_n"), PCIE0_GT_grx_p("PCIE0_GT_grx_p"), dma0_mgmt_cpl_vld("dma0_mgmt_cpl_vld"), dma0_mgmt_req_rdy("dma0_mgmt_req_rdy"), dma0_mgmt_cpl_rdy("dma0_mgmt_cpl_rdy"), dma0_mgmt_req_vld("dma0_mgmt_req_vld"), dma0_mgmt_cpl_sts("dma0_mgmt_cpl_sts"), dma0_mgmt_cpl_dat("dma0_mgmt_cpl_dat"), dma0_mgmt_req_cmd("dma0_mgmt_req_cmd"), dma0_mgmt_req_fnc("dma0_mgmt_req_fnc"), dma0_mgmt_req_msc("dma0_mgmt_req_msc"), dma0_mgmt_req_adr("dma0_mgmt_req_adr"), dma0_mgmt_req_dat("dma0_mgmt_req_dat"), dma0_st_rx_msg_tlast("dma0_st_rx_msg_tlast"), dma0_st_rx_msg_tvalid("dma0_st_rx_msg_tvalid"), dma0_st_rx_msg_tready("dma0_st_rx_msg_tready"), dma0_st_rx_msg_tdata("dma0_st_rx_msg_tdata"), gt_refclk0_clk_n("gt_refclk0_clk_n"), gt_refclk0_clk_p("gt_refclk0_clk_p")
{
  // initialize pins
  mp_impl->noc_cpm_pcie_axi0_clk(noc_cpm_pcie_axi0_clk);
  mp_impl->cpm_pcie_noc_axi0_clk(cpm_pcie_noc_axi0_clk);
  mp_impl->cpm_pcie_noc_axi1_clk(cpm_pcie_noc_axi1_clk);
  mp_impl->pcie0_user_clk(pcie0_user_clk);
  mp_impl->pcie0_user_lnk_up(pcie0_user_lnk_up);
  mp_impl->cpm_misc_irq(cpm_misc_irq);
  mp_impl->cpm_cor_irq(cpm_cor_irq);
  mp_impl->cpm_uncor_irq(cpm_uncor_irq);
  mp_impl->cpm_irq0(cpm_irq0);
  mp_impl->cpm_irq1(cpm_irq1);
  mp_impl->dma0_irq(dma0_irq);
  mp_impl->dma0_axi_aresetn(dma0_axi_aresetn);
  mp_impl->dma0_soft_resetn(dma0_soft_resetn);
  mp_impl->xdma0_usr_irq_ack(xdma0_usr_irq_ack);
  mp_impl->xdma0_usr_irq_req(xdma0_usr_irq_req);
  mp_impl->PCIE0_GT_gtx_n(PCIE0_GT_gtx_n);
  mp_impl->PCIE0_GT_gtx_p(PCIE0_GT_gtx_p);
  mp_impl->PCIE0_GT_grx_n(PCIE0_GT_grx_n);
  mp_impl->PCIE0_GT_grx_p(PCIE0_GT_grx_p);
  mp_impl->dma0_mgmt_cpl_vld(dma0_mgmt_cpl_vld);
  mp_impl->dma0_mgmt_req_rdy(dma0_mgmt_req_rdy);
  mp_impl->dma0_mgmt_cpl_rdy(dma0_mgmt_cpl_rdy);
  mp_impl->dma0_mgmt_req_vld(dma0_mgmt_req_vld);
  mp_impl->dma0_mgmt_cpl_sts(dma0_mgmt_cpl_sts);
  mp_impl->dma0_mgmt_cpl_dat(dma0_mgmt_cpl_dat);
  mp_impl->dma0_mgmt_req_cmd(dma0_mgmt_req_cmd);
  mp_impl->dma0_mgmt_req_fnc(dma0_mgmt_req_fnc);
  mp_impl->dma0_mgmt_req_msc(dma0_mgmt_req_msc);
  mp_impl->dma0_mgmt_req_adr(dma0_mgmt_req_adr);
  mp_impl->dma0_mgmt_req_dat(dma0_mgmt_req_dat);
  mp_impl->gt_refclk0_clk_n(gt_refclk0_clk_n);
  mp_impl->gt_refclk0_clk_p(gt_refclk0_clk_p);

  // initialize transactors
  mp_NOC_CPM_PCIE_0_transactor = NULL;
  mp_CPM_PCIE_NOC_0_transactor = NULL;
  mp_CPM_PCIE_NOC_1_transactor = NULL;
  mp_dma0_st_rx_msg_transactor = NULL;

  // Instantiate Socket Stubs

  // configure NOC_CPM_PCIE_0_transactor
    xsc::common_cpp::properties NOC_CPM_PCIE_0_transactor_param_props;
    NOC_CPM_PCIE_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ID_WIDTH", "2");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_LOCK", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_PROT", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_CACHE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_QOS", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_REGION", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_BRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RRESP", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_SIZE", "1");
    NOC_CPM_PCIE_0_transactor_param_props.addLong("HAS_RESET", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addFloat("PHASE", "0.0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    NOC_CPM_PCIE_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CONNECTIONS", "");
    NOC_CPM_PCIE_0_transactor_param_props.addString("CATEGORY", "noc");
    NOC_CPM_PCIE_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    NOC_CPM_PCIE_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "NOC_NSU_TO_PS_PCIE");
    NOC_CPM_PCIE_0_transactor_param_props.addString("HD_TANDEM", "0");
    NOC_CPM_PCIE_0_transactor_param_props.addString("INDEX", "0");

    mp_NOC_CPM_PCIE_0_transactor = new xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>("NOC_CPM_PCIE_0_transactor", NOC_CPM_PCIE_0_transactor_param_props);
  mp_NOC_CPM_PCIE_0_transactor->ARADDR(NOC_CPM_PCIE_0_araddr);
  mp_NOC_CPM_PCIE_0_transactor->ARBURST(NOC_CPM_PCIE_0_arburst);
  mp_NOC_CPM_PCIE_0_transactor->ARCACHE(NOC_CPM_PCIE_0_arcache);
  mp_NOC_CPM_PCIE_0_transactor->ARID(NOC_CPM_PCIE_0_arid);
  mp_NOC_CPM_PCIE_0_transactor->ARLEN(NOC_CPM_PCIE_0_arlen);
  mp_NOC_CPM_PCIE_0_transactor->ARLOCK(NOC_CPM_PCIE_0_arlock);
  mp_NOC_CPM_PCIE_0_transactor->ARPROT(NOC_CPM_PCIE_0_arprot);
  mp_NOC_CPM_PCIE_0_transactor->ARQOS(NOC_CPM_PCIE_0_arqos);
  mp_NOC_CPM_PCIE_0_transactor->ARSIZE(NOC_CPM_PCIE_0_arsize);
  mp_NOC_CPM_PCIE_0_transactor->ARUSER(NOC_CPM_PCIE_0_aruser);
  mp_NOC_CPM_PCIE_0_transactor->ARVALID(NOC_CPM_PCIE_0_arvalid);
  mp_NOC_CPM_PCIE_0_transactor->AWADDR(NOC_CPM_PCIE_0_awaddr);
  mp_NOC_CPM_PCIE_0_transactor->AWBURST(NOC_CPM_PCIE_0_awburst);
  mp_NOC_CPM_PCIE_0_transactor->AWCACHE(NOC_CPM_PCIE_0_awcache);
  mp_NOC_CPM_PCIE_0_transactor->AWID(NOC_CPM_PCIE_0_awid);
  mp_NOC_CPM_PCIE_0_transactor->AWLEN(NOC_CPM_PCIE_0_awlen);
  mp_NOC_CPM_PCIE_0_transactor->AWLOCK(NOC_CPM_PCIE_0_awlock);
  mp_NOC_CPM_PCIE_0_transactor->AWPROT(NOC_CPM_PCIE_0_awprot);
  mp_NOC_CPM_PCIE_0_transactor->AWQOS(NOC_CPM_PCIE_0_awqos);
  mp_NOC_CPM_PCIE_0_transactor->AWSIZE(NOC_CPM_PCIE_0_awsize);
  mp_NOC_CPM_PCIE_0_transactor->AWUSER(NOC_CPM_PCIE_0_awuser);
  mp_NOC_CPM_PCIE_0_transactor->AWVALID(NOC_CPM_PCIE_0_awvalid);
  mp_NOC_CPM_PCIE_0_transactor->BREADY(NOC_CPM_PCIE_0_bready);
  mp_NOC_CPM_PCIE_0_transactor->RREADY(NOC_CPM_PCIE_0_rready);
  mp_NOC_CPM_PCIE_0_transactor->WDATA(NOC_CPM_PCIE_0_wdata);
  mp_NOC_CPM_PCIE_0_transactor->WLAST(NOC_CPM_PCIE_0_wlast);
  mp_NOC_CPM_PCIE_0_transactor->WSTRB(NOC_CPM_PCIE_0_wstrb);
  mp_NOC_CPM_PCIE_0_transactor->WVALID(NOC_CPM_PCIE_0_wvalid);
  mp_NOC_CPM_PCIE_0_transactor->ARREADY(NOC_CPM_PCIE_0_arready);
  mp_NOC_CPM_PCIE_0_transactor->AWREADY(NOC_CPM_PCIE_0_awready);
  mp_NOC_CPM_PCIE_0_transactor->BID(NOC_CPM_PCIE_0_bid);
  mp_NOC_CPM_PCIE_0_transactor->BRESP(NOC_CPM_PCIE_0_bresp);
  mp_NOC_CPM_PCIE_0_transactor->BVALID(NOC_CPM_PCIE_0_bvalid);
  mp_NOC_CPM_PCIE_0_transactor->RDATA(NOC_CPM_PCIE_0_rdata);
  mp_NOC_CPM_PCIE_0_transactor->RID(NOC_CPM_PCIE_0_rid);
  mp_NOC_CPM_PCIE_0_transactor->RLAST(NOC_CPM_PCIE_0_rlast);
  mp_NOC_CPM_PCIE_0_transactor->RRESP(NOC_CPM_PCIE_0_rresp);
  mp_NOC_CPM_PCIE_0_transactor->RVALID(NOC_CPM_PCIE_0_rvalid);
  mp_NOC_CPM_PCIE_0_transactor->WREADY(NOC_CPM_PCIE_0_wready);
  mp_NOC_CPM_PCIE_0_transactor->CLK(noc_cpm_pcie_axi0_clk);
  m_NOC_CPM_PCIE_0_transactor_rst_signal.write(1);
  mp_NOC_CPM_PCIE_0_transactor->RST(m_NOC_CPM_PCIE_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_0_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_0_transactor_param_props;
    CPM_PCIE_NOC_0_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_0_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_0_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk");
    CPM_PCIE_NOC_0_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_0_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_0_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_0_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_0_transactor_param_props.addString("INDEX", "0");

    mp_CPM_PCIE_NOC_0_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_0_transactor", CPM_PCIE_NOC_0_transactor_param_props);
  mp_CPM_PCIE_NOC_0_transactor->ARADDR(CPM_PCIE_NOC_0_araddr);
  mp_CPM_PCIE_NOC_0_transactor->ARBURST(CPM_PCIE_NOC_0_arburst);
  mp_CPM_PCIE_NOC_0_transactor->ARCACHE(CPM_PCIE_NOC_0_arcache);
  mp_CPM_PCIE_NOC_0_transactor->ARID(CPM_PCIE_NOC_0_arid);
  mp_CPM_PCIE_NOC_0_transactor->ARLEN(CPM_PCIE_NOC_0_arlen);
  mp_CPM_PCIE_NOC_0_transactor->ARLOCK(CPM_PCIE_NOC_0_arlock);
  mp_CPM_PCIE_NOC_0_transactor->ARPROT(CPM_PCIE_NOC_0_arprot);
  mp_CPM_PCIE_NOC_0_transactor->ARQOS(CPM_PCIE_NOC_0_arqos);
  mp_CPM_PCIE_NOC_0_transactor->ARSIZE(CPM_PCIE_NOC_0_arsize);
  mp_CPM_PCIE_NOC_0_transactor->ARUSER(CPM_PCIE_NOC_0_aruser);
  mp_CPM_PCIE_NOC_0_transactor->ARVALID(CPM_PCIE_NOC_0_arvalid);
  mp_CPM_PCIE_NOC_0_transactor->AWADDR(CPM_PCIE_NOC_0_awaddr);
  mp_CPM_PCIE_NOC_0_transactor->AWBURST(CPM_PCIE_NOC_0_awburst);
  mp_CPM_PCIE_NOC_0_transactor->AWCACHE(CPM_PCIE_NOC_0_awcache);
  mp_CPM_PCIE_NOC_0_transactor->AWID(CPM_PCIE_NOC_0_awid);
  mp_CPM_PCIE_NOC_0_transactor->AWLEN(CPM_PCIE_NOC_0_awlen);
  mp_CPM_PCIE_NOC_0_transactor->AWLOCK(CPM_PCIE_NOC_0_awlock);
  mp_CPM_PCIE_NOC_0_transactor->AWPROT(CPM_PCIE_NOC_0_awprot);
  mp_CPM_PCIE_NOC_0_transactor->AWQOS(CPM_PCIE_NOC_0_awqos);
  mp_CPM_PCIE_NOC_0_transactor->AWSIZE(CPM_PCIE_NOC_0_awsize);
  mp_CPM_PCIE_NOC_0_transactor->AWUSER(CPM_PCIE_NOC_0_awuser);
  mp_CPM_PCIE_NOC_0_transactor->AWVALID(CPM_PCIE_NOC_0_awvalid);
  mp_CPM_PCIE_NOC_0_transactor->BREADY(CPM_PCIE_NOC_0_bready);
  mp_CPM_PCIE_NOC_0_transactor->RREADY(CPM_PCIE_NOC_0_rready);
  mp_CPM_PCIE_NOC_0_transactor->WDATA(CPM_PCIE_NOC_0_wdata);
  mp_CPM_PCIE_NOC_0_transactor->WLAST(CPM_PCIE_NOC_0_wlast);
  mp_CPM_PCIE_NOC_0_transactor->WSTRB(CPM_PCIE_NOC_0_wstrb);
  mp_CPM_PCIE_NOC_0_transactor->WVALID(CPM_PCIE_NOC_0_wvalid);
  mp_CPM_PCIE_NOC_0_transactor->ARREADY(CPM_PCIE_NOC_0_arready);
  mp_CPM_PCIE_NOC_0_transactor->AWREADY(CPM_PCIE_NOC_0_awready);
  mp_CPM_PCIE_NOC_0_transactor->BID(CPM_PCIE_NOC_0_bid);
  mp_CPM_PCIE_NOC_0_transactor->BRESP(CPM_PCIE_NOC_0_bresp);
  mp_CPM_PCIE_NOC_0_transactor->BVALID(CPM_PCIE_NOC_0_bvalid);
  mp_CPM_PCIE_NOC_0_transactor->RDATA(CPM_PCIE_NOC_0_rdata);
  mp_CPM_PCIE_NOC_0_transactor->RID(CPM_PCIE_NOC_0_rid);
  mp_CPM_PCIE_NOC_0_transactor->RLAST(CPM_PCIE_NOC_0_rlast);
  mp_CPM_PCIE_NOC_0_transactor->RRESP(CPM_PCIE_NOC_0_rresp);
  mp_CPM_PCIE_NOC_0_transactor->RVALID(CPM_PCIE_NOC_0_rvalid);
  mp_CPM_PCIE_NOC_0_transactor->WREADY(CPM_PCIE_NOC_0_wready);
  mp_CPM_PCIE_NOC_0_transactor->CLK(cpm_pcie_noc_axi0_clk);
  m_CPM_PCIE_NOC_0_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_0_transactor->RST(m_CPM_PCIE_NOC_0_transactor_rst_signal);
  // configure CPM_PCIE_NOC_1_transactor
    xsc::common_cpp::properties CPM_PCIE_NOC_1_transactor_param_props;
    CPM_PCIE_NOC_1_transactor_param_props.addLong("DATA_WIDTH", "128");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("FREQ_HZ", "100000000");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ID_WIDTH", "16");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ADDR_WIDTH", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("BUSER_WIDTH", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_LOCK", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_PROT", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_CACHE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_QOS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_REGION", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_WSTRB", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_BRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RRESP", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "64");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_READ_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("NUM_WRITE_THREADS", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_SIZE", "1");
    CPM_PCIE_NOC_1_transactor_param_props.addLong("HAS_RESET", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addFloat("PHASE", "0.0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PROTOCOL", "AXI4");
    CPM_PCIE_NOC_1_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk");
    CPM_PCIE_NOC_1_transactor_param_props.addString("CATEGORY", "noc");
    CPM_PCIE_NOC_1_transactor_param_props.addString("MY_CATEGORY", "ps_pcie");
    CPM_PCIE_NOC_1_transactor_param_props.addString("PHYSICAL_CHANNEL", "PS_PCIE_TO_NOC_NMU");
    CPM_PCIE_NOC_1_transactor_param_props.addString("HD_TANDEM", "0");
    CPM_PCIE_NOC_1_transactor_param_props.addString("INDEX", "1");

    mp_CPM_PCIE_NOC_1_transactor = new xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>("CPM_PCIE_NOC_1_transactor", CPM_PCIE_NOC_1_transactor_param_props);
  mp_CPM_PCIE_NOC_1_transactor->ARADDR(CPM_PCIE_NOC_1_araddr);
  mp_CPM_PCIE_NOC_1_transactor->ARBURST(CPM_PCIE_NOC_1_arburst);
  mp_CPM_PCIE_NOC_1_transactor->ARCACHE(CPM_PCIE_NOC_1_arcache);
  mp_CPM_PCIE_NOC_1_transactor->ARID(CPM_PCIE_NOC_1_arid);
  mp_CPM_PCIE_NOC_1_transactor->ARLEN(CPM_PCIE_NOC_1_arlen);
  mp_CPM_PCIE_NOC_1_transactor->ARLOCK(CPM_PCIE_NOC_1_arlock);
  mp_CPM_PCIE_NOC_1_transactor->ARPROT(CPM_PCIE_NOC_1_arprot);
  mp_CPM_PCIE_NOC_1_transactor->ARQOS(CPM_PCIE_NOC_1_arqos);
  mp_CPM_PCIE_NOC_1_transactor->ARSIZE(CPM_PCIE_NOC_1_arsize);
  mp_CPM_PCIE_NOC_1_transactor->ARUSER(CPM_PCIE_NOC_1_aruser);
  mp_CPM_PCIE_NOC_1_transactor->ARVALID(CPM_PCIE_NOC_1_arvalid);
  mp_CPM_PCIE_NOC_1_transactor->AWADDR(CPM_PCIE_NOC_1_awaddr);
  mp_CPM_PCIE_NOC_1_transactor->AWBURST(CPM_PCIE_NOC_1_awburst);
  mp_CPM_PCIE_NOC_1_transactor->AWCACHE(CPM_PCIE_NOC_1_awcache);
  mp_CPM_PCIE_NOC_1_transactor->AWID(CPM_PCIE_NOC_1_awid);
  mp_CPM_PCIE_NOC_1_transactor->AWLEN(CPM_PCIE_NOC_1_awlen);
  mp_CPM_PCIE_NOC_1_transactor->AWLOCK(CPM_PCIE_NOC_1_awlock);
  mp_CPM_PCIE_NOC_1_transactor->AWPROT(CPM_PCIE_NOC_1_awprot);
  mp_CPM_PCIE_NOC_1_transactor->AWQOS(CPM_PCIE_NOC_1_awqos);
  mp_CPM_PCIE_NOC_1_transactor->AWSIZE(CPM_PCIE_NOC_1_awsize);
  mp_CPM_PCIE_NOC_1_transactor->AWUSER(CPM_PCIE_NOC_1_awuser);
  mp_CPM_PCIE_NOC_1_transactor->AWVALID(CPM_PCIE_NOC_1_awvalid);
  mp_CPM_PCIE_NOC_1_transactor->BREADY(CPM_PCIE_NOC_1_bready);
  mp_CPM_PCIE_NOC_1_transactor->RREADY(CPM_PCIE_NOC_1_rready);
  mp_CPM_PCIE_NOC_1_transactor->WDATA(CPM_PCIE_NOC_1_wdata);
  mp_CPM_PCIE_NOC_1_transactor->WLAST(CPM_PCIE_NOC_1_wlast);
  mp_CPM_PCIE_NOC_1_transactor->WSTRB(CPM_PCIE_NOC_1_wstrb);
  mp_CPM_PCIE_NOC_1_transactor->WVALID(CPM_PCIE_NOC_1_wvalid);
  mp_CPM_PCIE_NOC_1_transactor->ARREADY(CPM_PCIE_NOC_1_arready);
  mp_CPM_PCIE_NOC_1_transactor->AWREADY(CPM_PCIE_NOC_1_awready);
  mp_CPM_PCIE_NOC_1_transactor->BID(CPM_PCIE_NOC_1_bid);
  mp_CPM_PCIE_NOC_1_transactor->BRESP(CPM_PCIE_NOC_1_bresp);
  mp_CPM_PCIE_NOC_1_transactor->BVALID(CPM_PCIE_NOC_1_bvalid);
  mp_CPM_PCIE_NOC_1_transactor->RDATA(CPM_PCIE_NOC_1_rdata);
  mp_CPM_PCIE_NOC_1_transactor->RID(CPM_PCIE_NOC_1_rid);
  mp_CPM_PCIE_NOC_1_transactor->RLAST(CPM_PCIE_NOC_1_rlast);
  mp_CPM_PCIE_NOC_1_transactor->RRESP(CPM_PCIE_NOC_1_rresp);
  mp_CPM_PCIE_NOC_1_transactor->RVALID(CPM_PCIE_NOC_1_rvalid);
  mp_CPM_PCIE_NOC_1_transactor->WREADY(CPM_PCIE_NOC_1_wready);
  mp_CPM_PCIE_NOC_1_transactor->CLK(cpm_pcie_noc_axi1_clk);
  m_CPM_PCIE_NOC_1_transactor_rst_signal.write(1);
  mp_CPM_PCIE_NOC_1_transactor->RST(m_CPM_PCIE_NOC_1_transactor_rst_signal);
  // configure dma0_st_rx_msg_transactor
    xsc::common_cpp::properties dma0_st_rx_msg_transactor_param_props;
    dma0_st_rx_msg_transactor_param_props.addLong("TDATA_NUM_BYTES", "4");
    dma0_st_rx_msg_transactor_param_props.addLong("TDEST_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TID_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TUSER_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TREADY", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TSTRB", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TKEEP", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_TLAST", "1");
    dma0_st_rx_msg_transactor_param_props.addLong("FREQ_HZ", "250000000");
    dma0_st_rx_msg_transactor_param_props.addLong("HAS_RESET", "1");
    dma0_st_rx_msg_transactor_param_props.addFloat("PHASE", "0.0");
    dma0_st_rx_msg_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");
    dma0_st_rx_msg_transactor_param_props.addString("LAYERED_METADATA", "undef");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_1_WIDTH", "0");
    dma0_st_rx_msg_transactor_param_props.addLong("TSIDE_BAND_2_WIDTH", "0");

    mp_dma0_st_rx_msg_transactor = new xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>("dma0_st_rx_msg_transactor", dma0_st_rx_msg_transactor_param_props);
  mp_dma0_st_rx_msg_transactor->TLAST(dma0_st_rx_msg_tlast);
  mp_dma0_st_rx_msg_transactor->TVALID(dma0_st_rx_msg_tvalid);
  mp_dma0_st_rx_msg_transactor->TREADY(dma0_st_rx_msg_tready);
  mp_dma0_st_rx_msg_transactor->TDATA(dma0_st_rx_msg_tdata);
  mp_dma0_st_rx_msg_transactor->CLK(pcie0_user_clk);
  mp_dma0_st_rx_msg_transactor->RST(dma0_axi_aresetn);

  // initialize transactors stubs
  NOC_CPM_PCIE_0_transactor_target_wr_socket_stub = nullptr;
  NOC_CPM_PCIE_0_transactor_target_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = nullptr;
  CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = nullptr;
  dma0_st_rx_msg_transactor_initiator_socket_stub = nullptr;

}

void CPM_bd_versal_cips_0_0::before_end_of_elaboration()
{
  // configure 'NOC_CPM_PCIE_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "NOC_CPM_PCIE_0_TLM_MODE") != 1)
  {
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_impl->NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
  
  }
  else
  {
    NOC_CPM_PCIE_0_transactor_target_wr_socket_stub = new xtlm::xtlm_aximm_target_stub("wr_socket",0);
    NOC_CPM_PCIE_0_transactor_target_wr_socket_stub->bind(*(mp_NOC_CPM_PCIE_0_transactor->wr_socket));
    NOC_CPM_PCIE_0_transactor_target_rd_socket_stub = new xtlm::xtlm_aximm_target_stub("rd_socket",0);
    NOC_CPM_PCIE_0_transactor_target_rd_socket_stub->bind(*(mp_NOC_CPM_PCIE_0_transactor->rd_socket));
    mp_NOC_CPM_PCIE_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_0' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_0_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_0_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->wr_socket));
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_0_transactor->rd_socket));
    mp_CPM_PCIE_NOC_0_transactor->disable_transactor();
  }

  // configure 'CPM_PCIE_NOC_1' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "CPM_PCIE_NOC_1_TLM_MODE") != 1)
  {
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_read_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_impl->CPM_PCIE_NOC_1_tlm_aximm_write_socket->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
  
  }
  else
  {
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->wr_socket));
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub->bind(*(mp_CPM_PCIE_NOC_1_transactor->rd_socket));
    mp_CPM_PCIE_NOC_1_transactor->disable_transactor();
  }

  // configure 'dma0_st_rx_msg' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("CPM_bd_versal_cips_0_0", "dma0_st_rx_msg_TLM_MODE") != 1)
  {
    mp_impl->dma0_st_rx_msg_tlm_axis_socket->bind(*(mp_dma0_st_rx_msg_transactor->socket));
  
  }
  else
  {
    dma0_st_rx_msg_transactor_initiator_socket_stub = new xtlm::xtlm_axis_initiator_stub("socket",0);
    dma0_st_rx_msg_transactor_initiator_socket_stub->bind(*(mp_dma0_st_rx_msg_transactor->socket));
    mp_dma0_st_rx_msg_transactor->disable_transactor();
  }

}

#endif // MTI_SYSTEMC




CPM_bd_versal_cips_0_0::~CPM_bd_versal_cips_0_0()
{
  delete mp_NOC_CPM_PCIE_0_transactor;

  delete mp_CPM_PCIE_NOC_0_transactor;

  delete mp_CPM_PCIE_NOC_1_transactor;

  delete mp_dma0_st_rx_msg_transactor;

}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(CPM_bd_versal_cips_0_0);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(CPM_bd_versal_cips_0_0);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(CPM_bd_versal_cips_0_0);
SC_REGISTER_BV(128);
#endif

