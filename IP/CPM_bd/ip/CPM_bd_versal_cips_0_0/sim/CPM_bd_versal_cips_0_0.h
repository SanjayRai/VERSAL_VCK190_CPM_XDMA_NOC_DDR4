#ifndef IP_CPM_BD_VERSAL_CIPS_0_0_H_
#define IP_CPM_BD_VERSAL_CIPS_0_0_H_

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


#ifndef XTLM
#include "xtlm.h"
#endif
#ifndef SYSTEMC_INCLUDED
#include <systemc>
#endif

#if defined(_MSC_VER)
#define DllExport __declspec(dllexport)
#elif defined(__GNUC__)
#define DllExport __attribute__ ((visibility("default")))
#else
#define DllExport
#endif

#include "CPM_bd_versal_cips_0_0_sc.h"




#ifdef XILINX_SIMULATOR
class DllExport CPM_bd_versal_cips_0_0 : public CPM_bd_versal_cips_0_0_sc
{
public:

  CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~CPM_bd_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > noc_cpm_pcie_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi1_clk;
  sc_core::sc_out< bool > pcie0_user_clk;
  sc_core::sc_out< bool > pcie0_user_lnk_up;
  sc_core::sc_out< bool > cpm_misc_irq;
  sc_core::sc_out< bool > cpm_cor_irq;
  sc_core::sc_out< bool > cpm_uncor_irq;
  sc_core::sc_in< bool > cpm_irq0;
  sc_core::sc_in< bool > cpm_irq1;
  sc_core::sc_out< bool > dma0_irq;
  sc_core::sc_out< bool > dma0_axi_aresetn;
  sc_core::sc_in< bool > dma0_soft_resetn;
  sc_core::sc_out< sc_dt::sc_bv<1> > xdma0_usr_irq_ack;
  sc_core::sc_in< sc_dt::sc_bv<1> > xdma0_usr_irq_req;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_araddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_arlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_aruser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arvalid;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_awaddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_awlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_awuser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awvalid;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_bready;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_rready;
  sc_core::sc_in< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_wdata;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wlast;
  sc_core::sc_in< sc_dt::sc_bv<16> > NOC_CPM_PCIE_0_wstrb;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_arready;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_awready;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bid;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_bvalid;
  sc_core::sc_out< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_rdata;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rlast;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_wready;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_n;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_p;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_n;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_p;
  sc_core::sc_out< bool > dma0_mgmt_cpl_vld;
  sc_core::sc_out< bool > dma0_mgmt_req_rdy;
  sc_core::sc_in< bool > dma0_mgmt_cpl_rdy;
  sc_core::sc_in< bool > dma0_mgmt_req_vld;
  sc_core::sc_out< sc_dt::sc_bv<2> > dma0_mgmt_cpl_sts;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_mgmt_cpl_dat;
  sc_core::sc_in< sc_dt::sc_bv<2> > dma0_mgmt_req_cmd;
  sc_core::sc_in< sc_dt::sc_bv<8> > dma0_mgmt_req_fnc;
  sc_core::sc_in< sc_dt::sc_bv<6> > dma0_mgmt_req_msc;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_adr;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_dat;
  sc_core::sc_out< bool > dma0_st_rx_msg_tlast;
  sc_core::sc_out< bool > dma0_st_rx_msg_tvalid;
  sc_core::sc_in< bool > dma0_st_rx_msg_tready;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_st_rx_msg_tdata;
  sc_core::sc_in< bool > gt_refclk0_clk_n;
  sc_core::sc_in< bool > gt_refclk0_clk_p;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>* mp_NOC_CPM_PCIE_0_transactor;
  sc_signal< bool > m_NOC_CPM_PCIE_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_0_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_1_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_1_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>* mp_dma0_st_rx_msg_transactor;

};
#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
class DllExport CPM_bd_versal_cips_0_0 : public CPM_bd_versal_cips_0_0_sc
{
public:

  CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~CPM_bd_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > noc_cpm_pcie_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi1_clk;
  sc_core::sc_out< bool > pcie0_user_clk;
  sc_core::sc_out< bool > pcie0_user_lnk_up;
  sc_core::sc_out< bool > cpm_misc_irq;
  sc_core::sc_out< bool > cpm_cor_irq;
  sc_core::sc_out< bool > cpm_uncor_irq;
  sc_core::sc_in< bool > cpm_irq0;
  sc_core::sc_in< bool > cpm_irq1;
  sc_core::sc_out< bool > dma0_irq;
  sc_core::sc_out< bool > dma0_axi_aresetn;
  sc_core::sc_in< bool > dma0_soft_resetn;
  sc_core::sc_out< sc_dt::sc_bv<1> > xdma0_usr_irq_ack;
  sc_core::sc_in< sc_dt::sc_bv<1> > xdma0_usr_irq_req;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_araddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_arlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_aruser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arvalid;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_awaddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_awlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_awuser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awvalid;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_bready;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_rready;
  sc_core::sc_in< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_wdata;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wlast;
  sc_core::sc_in< sc_dt::sc_bv<16> > NOC_CPM_PCIE_0_wstrb;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_arready;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_awready;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bid;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_bvalid;
  sc_core::sc_out< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_rdata;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rlast;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_wready;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_n;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_p;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_n;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_p;
  sc_core::sc_out< bool > dma0_mgmt_cpl_vld;
  sc_core::sc_out< bool > dma0_mgmt_req_rdy;
  sc_core::sc_in< bool > dma0_mgmt_cpl_rdy;
  sc_core::sc_in< bool > dma0_mgmt_req_vld;
  sc_core::sc_out< sc_dt::sc_bv<2> > dma0_mgmt_cpl_sts;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_mgmt_cpl_dat;
  sc_core::sc_in< sc_dt::sc_bv<2> > dma0_mgmt_req_cmd;
  sc_core::sc_in< sc_dt::sc_bv<8> > dma0_mgmt_req_fnc;
  sc_core::sc_in< sc_dt::sc_bv<6> > dma0_mgmt_req_msc;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_adr;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_dat;
  sc_core::sc_out< bool > dma0_st_rx_msg_tlast;
  sc_core::sc_out< bool > dma0_st_rx_msg_tvalid;
  sc_core::sc_in< bool > dma0_st_rx_msg_tready;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_st_rx_msg_tdata;
  sc_core::sc_in< bool > gt_refclk0_clk_n;
  sc_core::sc_in< bool > gt_refclk0_clk_p;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>* mp_NOC_CPM_PCIE_0_transactor;
  sc_signal< bool > m_NOC_CPM_PCIE_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_0_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_1_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_1_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>* mp_dma0_st_rx_msg_transactor;

};
#endif // XM_SYSTEMC




#ifdef RIVIERA
class DllExport CPM_bd_versal_cips_0_0 : public CPM_bd_versal_cips_0_0_sc
{
public:

  CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~CPM_bd_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > noc_cpm_pcie_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi1_clk;
  sc_core::sc_out< bool > pcie0_user_clk;
  sc_core::sc_out< bool > pcie0_user_lnk_up;
  sc_core::sc_out< bool > cpm_misc_irq;
  sc_core::sc_out< bool > cpm_cor_irq;
  sc_core::sc_out< bool > cpm_uncor_irq;
  sc_core::sc_in< bool > cpm_irq0;
  sc_core::sc_in< bool > cpm_irq1;
  sc_core::sc_out< bool > dma0_irq;
  sc_core::sc_out< bool > dma0_axi_aresetn;
  sc_core::sc_in< bool > dma0_soft_resetn;
  sc_core::sc_out< sc_dt::sc_bv<1> > xdma0_usr_irq_ack;
  sc_core::sc_in< sc_dt::sc_bv<1> > xdma0_usr_irq_req;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_araddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_arlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_aruser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arvalid;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_awaddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_awlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_awuser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awvalid;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_bready;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_rready;
  sc_core::sc_in< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_wdata;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wlast;
  sc_core::sc_in< sc_dt::sc_bv<16> > NOC_CPM_PCIE_0_wstrb;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_arready;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_awready;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bid;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_bvalid;
  sc_core::sc_out< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_rdata;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rlast;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_wready;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_n;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_p;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_n;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_p;
  sc_core::sc_out< bool > dma0_mgmt_cpl_vld;
  sc_core::sc_out< bool > dma0_mgmt_req_rdy;
  sc_core::sc_in< bool > dma0_mgmt_cpl_rdy;
  sc_core::sc_in< bool > dma0_mgmt_req_vld;
  sc_core::sc_out< sc_dt::sc_bv<2> > dma0_mgmt_cpl_sts;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_mgmt_cpl_dat;
  sc_core::sc_in< sc_dt::sc_bv<2> > dma0_mgmt_req_cmd;
  sc_core::sc_in< sc_dt::sc_bv<8> > dma0_mgmt_req_fnc;
  sc_core::sc_in< sc_dt::sc_bv<6> > dma0_mgmt_req_msc;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_adr;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_dat;
  sc_core::sc_out< bool > dma0_st_rx_msg_tlast;
  sc_core::sc_out< bool > dma0_st_rx_msg_tvalid;
  sc_core::sc_in< bool > dma0_st_rx_msg_tready;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_st_rx_msg_tdata;
  sc_core::sc_in< bool > gt_refclk0_clk_n;
  sc_core::sc_in< bool > gt_refclk0_clk_p;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>* mp_NOC_CPM_PCIE_0_transactor;
  sc_signal< bool > m_NOC_CPM_PCIE_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_0_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_1_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_1_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>* mp_dma0_st_rx_msg_transactor;

};
#endif // RIVIERA




#ifdef VCSSYSTEMC
#include "utils/xtlm_aximm_initiator_stub.h"

#include "utils/xtlm_aximm_target_stub.h"

#include "utils/xtlm_axis_initiator_stub.h"

class DllExport CPM_bd_versal_cips_0_0 : public CPM_bd_versal_cips_0_0_sc
{
public:

  CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~CPM_bd_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > noc_cpm_pcie_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi1_clk;
  sc_core::sc_out< bool > pcie0_user_clk;
  sc_core::sc_out< bool > pcie0_user_lnk_up;
  sc_core::sc_out< bool > cpm_misc_irq;
  sc_core::sc_out< bool > cpm_cor_irq;
  sc_core::sc_out< bool > cpm_uncor_irq;
  sc_core::sc_in< bool > cpm_irq0;
  sc_core::sc_in< bool > cpm_irq1;
  sc_core::sc_out< bool > dma0_irq;
  sc_core::sc_out< bool > dma0_axi_aresetn;
  sc_core::sc_in< bool > dma0_soft_resetn;
  sc_core::sc_out< sc_dt::sc_bv<1> > xdma0_usr_irq_ack;
  sc_core::sc_in< sc_dt::sc_bv<1> > xdma0_usr_irq_req;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_araddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_arlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_aruser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arvalid;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_awaddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_awlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_awuser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awvalid;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_bready;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_rready;
  sc_core::sc_in< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_wdata;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wlast;
  sc_core::sc_in< sc_dt::sc_bv<16> > NOC_CPM_PCIE_0_wstrb;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_arready;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_awready;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bid;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_bvalid;
  sc_core::sc_out< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_rdata;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rlast;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_wready;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_n;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_p;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_n;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_p;
  sc_core::sc_out< bool > dma0_mgmt_cpl_vld;
  sc_core::sc_out< bool > dma0_mgmt_req_rdy;
  sc_core::sc_in< bool > dma0_mgmt_cpl_rdy;
  sc_core::sc_in< bool > dma0_mgmt_req_vld;
  sc_core::sc_out< sc_dt::sc_bv<2> > dma0_mgmt_cpl_sts;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_mgmt_cpl_dat;
  sc_core::sc_in< sc_dt::sc_bv<2> > dma0_mgmt_req_cmd;
  sc_core::sc_in< sc_dt::sc_bv<8> > dma0_mgmt_req_fnc;
  sc_core::sc_in< sc_dt::sc_bv<6> > dma0_mgmt_req_msc;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_adr;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_dat;
  sc_core::sc_out< bool > dma0_st_rx_msg_tlast;
  sc_core::sc_out< bool > dma0_st_rx_msg_tvalid;
  sc_core::sc_in< bool > dma0_st_rx_msg_tready;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_st_rx_msg_tdata;
  sc_core::sc_in< bool > gt_refclk0_clk_n;
  sc_core::sc_in< bool > gt_refclk0_clk_p;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>* mp_NOC_CPM_PCIE_0_transactor;
  sc_signal< bool > m_NOC_CPM_PCIE_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_0_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_1_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_1_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>* mp_dma0_st_rx_msg_transactor;

  // Transactor stubs
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub;
  xtlm::xtlm_aximm_target_stub * NOC_CPM_PCIE_0_transactor_target_rd_socket_stub;
  xtlm::xtlm_aximm_target_stub * NOC_CPM_PCIE_0_transactor_target_wr_socket_stub;
  xtlm::xtlm_axis_initiator_stub * dma0_st_rx_msg_transactor_initiator_socket_stub;

  // Socket stubs

};
#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
#include "utils/xtlm_aximm_initiator_stub.h"

#include "utils/xtlm_aximm_target_stub.h"

#include "utils/xtlm_axis_initiator_stub.h"

class DllExport CPM_bd_versal_cips_0_0 : public CPM_bd_versal_cips_0_0_sc
{
public:

  CPM_bd_versal_cips_0_0(const sc_core::sc_module_name& nm);
  virtual ~CPM_bd_versal_cips_0_0();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > noc_cpm_pcie_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi0_clk;
  sc_core::sc_out< bool > cpm_pcie_noc_axi1_clk;
  sc_core::sc_out< bool > pcie0_user_clk;
  sc_core::sc_out< bool > pcie0_user_lnk_up;
  sc_core::sc_out< bool > cpm_misc_irq;
  sc_core::sc_out< bool > cpm_cor_irq;
  sc_core::sc_out< bool > cpm_uncor_irq;
  sc_core::sc_in< bool > cpm_irq0;
  sc_core::sc_in< bool > cpm_irq1;
  sc_core::sc_out< bool > dma0_irq;
  sc_core::sc_out< bool > dma0_axi_aresetn;
  sc_core::sc_in< bool > dma0_soft_resetn;
  sc_core::sc_out< sc_dt::sc_bv<1> > xdma0_usr_irq_ack;
  sc_core::sc_in< sc_dt::sc_bv<1> > xdma0_usr_irq_req;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_araddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_arid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_arlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_arqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_arsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_aruser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_arvalid;
  sc_core::sc_in< sc_dt::sc_bv<64> > NOC_CPM_PCIE_0_awaddr;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awburst;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awcache;
  sc_core::sc_in< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_awid;
  sc_core::sc_in< sc_dt::sc_bv<8> > NOC_CPM_PCIE_0_awlen;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awlock;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awprot;
  sc_core::sc_in< sc_dt::sc_bv<4> > NOC_CPM_PCIE_0_awqos;
  sc_core::sc_in< sc_dt::sc_bv<3> > NOC_CPM_PCIE_0_awsize;
  sc_core::sc_in< sc_dt::sc_bv<18> > NOC_CPM_PCIE_0_awuser;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_awvalid;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_bready;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_rready;
  sc_core::sc_in< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_wdata;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wlast;
  sc_core::sc_in< sc_dt::sc_bv<16> > NOC_CPM_PCIE_0_wstrb;
  sc_core::sc_in< bool > NOC_CPM_PCIE_0_wvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_arready;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_awready;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bid;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_bresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_bvalid;
  sc_core::sc_out< sc_dt::sc_bv<128> > NOC_CPM_PCIE_0_rdata;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rlast;
  sc_core::sc_out< sc_dt::sc_bv<2> > NOC_CPM_PCIE_0_rresp;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_rvalid;
  sc_core::sc_out< bool > NOC_CPM_PCIE_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_0_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_0_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_0_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_0_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_0_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_0_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_0_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_0_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_0_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_0_wready;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_araddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_arburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_arid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_arlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_arqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_arsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_aruser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_arvalid;
  sc_core::sc_out< sc_dt::sc_bv<64> > CPM_PCIE_NOC_1_awaddr;
  sc_core::sc_out< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_awburst;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awcache;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_awid;
  sc_core::sc_out< sc_dt::sc_bv<8> > CPM_PCIE_NOC_1_awlen;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awlock;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awprot;
  sc_core::sc_out< sc_dt::sc_bv<4> > CPM_PCIE_NOC_1_awqos;
  sc_core::sc_out< sc_dt::sc_bv<3> > CPM_PCIE_NOC_1_awsize;
  sc_core::sc_out< sc_dt::sc_bv<18> > CPM_PCIE_NOC_1_awuser;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_awvalid;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_bready;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_rready;
  sc_core::sc_out< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_wdata;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wlast;
  sc_core::sc_out< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_wstrb;
  sc_core::sc_out< bool > CPM_PCIE_NOC_1_wvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_arready;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_awready;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_bid;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_bresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_bvalid;
  sc_core::sc_in< sc_dt::sc_bv<128> > CPM_PCIE_NOC_1_rdata;
  sc_core::sc_in< sc_dt::sc_bv<16> > CPM_PCIE_NOC_1_rid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rlast;
  sc_core::sc_in< sc_dt::sc_bv<2> > CPM_PCIE_NOC_1_rresp;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_rvalid;
  sc_core::sc_in< bool > CPM_PCIE_NOC_1_wready;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_n;
  sc_core::sc_out< sc_dt::sc_bv<8> > PCIE0_GT_gtx_p;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_n;
  sc_core::sc_in< sc_dt::sc_bv<8> > PCIE0_GT_grx_p;
  sc_core::sc_out< bool > dma0_mgmt_cpl_vld;
  sc_core::sc_out< bool > dma0_mgmt_req_rdy;
  sc_core::sc_in< bool > dma0_mgmt_cpl_rdy;
  sc_core::sc_in< bool > dma0_mgmt_req_vld;
  sc_core::sc_out< sc_dt::sc_bv<2> > dma0_mgmt_cpl_sts;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_mgmt_cpl_dat;
  sc_core::sc_in< sc_dt::sc_bv<2> > dma0_mgmt_req_cmd;
  sc_core::sc_in< sc_dt::sc_bv<8> > dma0_mgmt_req_fnc;
  sc_core::sc_in< sc_dt::sc_bv<6> > dma0_mgmt_req_msc;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_adr;
  sc_core::sc_in< sc_dt::sc_bv<32> > dma0_mgmt_req_dat;
  sc_core::sc_out< bool > dma0_st_rx_msg_tlast;
  sc_core::sc_out< bool > dma0_st_rx_msg_tvalid;
  sc_core::sc_in< bool > dma0_st_rx_msg_tready;
  sc_core::sc_out< sc_dt::sc_bv<32> > dma0_st_rx_msg_tdata;
  sc_core::sc_in< bool > gt_refclk0_clk_n;
  sc_core::sc_in< bool > gt_refclk0_clk_p;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:

  xtlm::xaximm_pin2xtlm_t<128,64,2,18,1,1,18,1>* mp_NOC_CPM_PCIE_0_transactor;
  sc_signal< bool > m_NOC_CPM_PCIE_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_0_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_0_transactor_rst_signal;
  xtlm::xaximm_xtlm2pin_t<128,64,16,18,1,1,18,1>* mp_CPM_PCIE_NOC_1_transactor;
  sc_signal< bool > m_CPM_PCIE_NOC_1_transactor_rst_signal;
  xtlm::xaxis_xtlm2pin_t<4,1,1,1,1,1>* mp_dma0_st_rx_msg_transactor;

  // Transactor stubs
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_0_transactor_initiator_rd_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_0_transactor_initiator_wr_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_1_transactor_initiator_rd_socket_stub;
  xtlm::xtlm_aximm_initiator_stub * CPM_PCIE_NOC_1_transactor_initiator_wr_socket_stub;
  xtlm::xtlm_aximm_target_stub * NOC_CPM_PCIE_0_transactor_target_rd_socket_stub;
  xtlm::xtlm_aximm_target_stub * NOC_CPM_PCIE_0_transactor_target_wr_socket_stub;
  xtlm::xtlm_axis_initiator_stub * dma0_st_rx_msg_transactor_initiator_socket_stub;

  // Socket stubs

};
#endif // MTI_SYSTEMC
#endif // IP_CPM_BD_VERSAL_CIPS_0_0_H_
