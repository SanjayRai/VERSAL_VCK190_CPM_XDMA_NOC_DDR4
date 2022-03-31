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


#include "bd_f29c_M00_AXI_nsu_0_sc.h"

#include "bd_f29c_M00_AXI_nsu_0.h"

#include "bd_f29c_M00_AXI_nsu_0_core.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
bd_f29c_M00_AXI_nsu_0::bd_f29c_M00_AXI_nsu_0(const sc_core::sc_module_name& nm) : bd_f29c_M00_AXI_nsu_0_sc(nm), IF_NOC_AXI_ARADDR("IF_NOC_AXI_ARADDR"), IF_NOC_AXI_ARBURST("IF_NOC_AXI_ARBURST"), IF_NOC_AXI_ARCACHE("IF_NOC_AXI_ARCACHE"), IF_NOC_AXI_ARCID("IF_NOC_AXI_ARCID"), IF_NOC_AXI_ARLEN("IF_NOC_AXI_ARLEN"), IF_NOC_AXI_ARLOCK("IF_NOC_AXI_ARLOCK"), IF_NOC_AXI_ARPROT("IF_NOC_AXI_ARPROT"), IF_NOC_AXI_ARQOS("IF_NOC_AXI_ARQOS"), IF_NOC_AXI_ARREGION("IF_NOC_AXI_ARREGION"), IF_NOC_AXI_ARSIZE("IF_NOC_AXI_ARSIZE"), IF_NOC_AXI_ARUSER("IF_NOC_AXI_ARUSER"), IF_NOC_AXI_ARVALID("IF_NOC_AXI_ARVALID"), IF_NOC_AXI_AWADDR("IF_NOC_AXI_AWADDR"), IF_NOC_AXI_AWBURST("IF_NOC_AXI_AWBURST"), IF_NOC_AXI_AWCACHE("IF_NOC_AXI_AWCACHE"), IF_NOC_AXI_AWCID("IF_NOC_AXI_AWCID"), IF_NOC_AXI_AWLEN("IF_NOC_AXI_AWLEN"), IF_NOC_AXI_AWLOCK("IF_NOC_AXI_AWLOCK"), IF_NOC_AXI_AWPROT("IF_NOC_AXI_AWPROT"), IF_NOC_AXI_AWQOS("IF_NOC_AXI_AWQOS"), IF_NOC_AXI_AWREGION("IF_NOC_AXI_AWREGION"), IF_NOC_AXI_AWSIZE("IF_NOC_AXI_AWSIZE"), IF_NOC_AXI_AWUSER("IF_NOC_AXI_AWUSER"), IF_NOC_AXI_AWVALID("IF_NOC_AXI_AWVALID"), IF_NOC_AXI_BREADY("IF_NOC_AXI_BREADY"), IF_NOC_AXI_RREADY("IF_NOC_AXI_RREADY"), IF_NOC_AXI_WDATA("IF_NOC_AXI_WDATA"), IF_NOC_AXI_WLAST("IF_NOC_AXI_WLAST"), IF_NOC_AXI_WSTRB("IF_NOC_AXI_WSTRB"), IF_NOC_AXI_WVALID("IF_NOC_AXI_WVALID"), IF_NOC_AXI_ARREADY("IF_NOC_AXI_ARREADY"), IF_NOC_AXI_AWREADY("IF_NOC_AXI_AWREADY"), IF_NOC_AXI_BCID("IF_NOC_AXI_BCID"), IF_NOC_AXI_BRESP("IF_NOC_AXI_BRESP"), IF_NOC_AXI_BVALID("IF_NOC_AXI_BVALID"), IF_NOC_AXI_RCID("IF_NOC_AXI_RCID"), IF_NOC_AXI_RDATA("IF_NOC_AXI_RDATA"), IF_NOC_AXI_RLAST("IF_NOC_AXI_RLAST"), IF_NOC_AXI_RRESP("IF_NOC_AXI_RRESP"), IF_NOC_AXI_RVALID("IF_NOC_AXI_RVALID"), IF_NOC_AXI_WREADY("IF_NOC_AXI_WREADY"), IF_NOC_NPP_IN_NOC_CREDIT_RETURN("IF_NOC_NPP_IN_NOC_CREDIT_RETURN"), IF_NOC_NPP_OUT_NOC_CREDIT_RDY("IF_NOC_NPP_OUT_NOC_CREDIT_RDY"), IF_NOC_NPP_OUT_NOC_FLIT("IF_NOC_NPP_OUT_NOC_FLIT"), IF_NOC_NPP_OUT_NOC_VALID("IF_NOC_NPP_OUT_NOC_VALID"), aclk("aclk"), IF_NOC_NPP_IN_NOC_CREDIT_RDY("IF_NOC_NPP_IN_NOC_CREDIT_RDY"), IF_NOC_NPP_IN_NOC_FLIT("IF_NOC_NPP_IN_NOC_FLIT"), IF_NOC_NPP_IN_NOC_VALID("IF_NOC_NPP_IN_NOC_VALID"), IF_NOC_NPP_OUT_NOC_CREDIT_RETURN("IF_NOC_NPP_OUT_NOC_CREDIT_RETURN"), NSU("NSU")
{

  // initialize pins
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RETURN(IF_NOC_NPP_IN_NOC_CREDIT_RETURN);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RDY(IF_NOC_NPP_OUT_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_OUT_NOC_FLIT(IF_NOC_NPP_OUT_NOC_FLIT);
  mp_impl->IF_NOC_NPP_OUT_NOC_VALID(IF_NOC_NPP_OUT_NOC_VALID);
  mp_impl->aclk(aclk);
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RDY(IF_NOC_NPP_IN_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_IN_NOC_FLIT(IF_NOC_NPP_IN_NOC_FLIT);
  mp_impl->IF_NOC_NPP_IN_NOC_VALID(IF_NOC_NPP_IN_NOC_VALID);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT_NOC_CREDIT_RETURN);
  mp_impl->NSU(NSU);

  // initialize transactors
  mp_MAXI4_transactor = NULL;
  mp_IF_NOC_AXI_ARLOCK_converter = NULL;
  mp_IF_NOC_AXI_AWLOCK_converter = NULL;
  mp_IF_NOC_AXI_RLAST_converter = NULL;
  mp_IF_NOC_AXI_WLAST_converter = NULL;

  // initialize socket stubs

}

void bd_f29c_M00_AXI_nsu_0::before_end_of_elaboration()
{
  // configure 'MAXI4' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("bd_f29c_M00_AXI_nsu_0", "MAXI4_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'MAXI4' transactor parameters
    xsc::common_cpp::properties MAXI4_transactor_param_props;
    MAXI4_transactor_param_props.addLong("DATA_WIDTH", "32");
    MAXI4_transactor_param_props.addLong("FREQ_HZ", "250000000");
    MAXI4_transactor_param_props.addLong("ID_WIDTH", "2");
    MAXI4_transactor_param_props.addLong("ADDR_WIDTH", "64");
    MAXI4_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("WUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("RUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("BUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("HAS_BURST", "1");
    MAXI4_transactor_param_props.addLong("HAS_LOCK", "1");
    MAXI4_transactor_param_props.addLong("HAS_PROT", "1");
    MAXI4_transactor_param_props.addLong("HAS_CACHE", "1");
    MAXI4_transactor_param_props.addLong("HAS_QOS", "1");
    MAXI4_transactor_param_props.addLong("HAS_REGION", "1");
    MAXI4_transactor_param_props.addLong("HAS_WSTRB", "1");
    MAXI4_transactor_param_props.addLong("HAS_BRESP", "1");
    MAXI4_transactor_param_props.addLong("HAS_RRESP", "1");
    MAXI4_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    MAXI4_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    MAXI4_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    MAXI4_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("HAS_SIZE", "1");
    MAXI4_transactor_param_props.addLong("HAS_RESET", "0");
    MAXI4_transactor_param_props.addFloat("PHASE", "0.0");
    MAXI4_transactor_param_props.addString("PROTOCOL", "AXI4");
    MAXI4_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    MAXI4_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");

    mp_MAXI4_transactor = new xtlm::xaximm_xtlm2pin_t<32,64,2,18,1,1,18,1>("MAXI4_transactor", MAXI4_transactor_param_props);

    // MAXI4' transactor ports

    mp_MAXI4_transactor->ARADDR(IF_NOC_AXI_ARADDR);
    mp_MAXI4_transactor->ARBURST(IF_NOC_AXI_ARBURST);
    mp_MAXI4_transactor->ARCACHE(IF_NOC_AXI_ARCACHE);
    mp_MAXI4_transactor->ARID(IF_NOC_AXI_ARCID);
    mp_MAXI4_transactor->ARLEN(IF_NOC_AXI_ARLEN);
    mp_IF_NOC_AXI_ARLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_ARLOCK_converter");
    mp_IF_NOC_AXI_ARLOCK_converter->scalar_in(m_IF_NOC_AXI_ARLOCK_converter_signal);
    mp_IF_NOC_AXI_ARLOCK_converter->vector_out(IF_NOC_AXI_ARLOCK);
    mp_MAXI4_transactor->ARLOCK(m_IF_NOC_AXI_ARLOCK_converter_signal);
    mp_MAXI4_transactor->ARPROT(IF_NOC_AXI_ARPROT);
    mp_MAXI4_transactor->ARQOS(IF_NOC_AXI_ARQOS);
    mp_MAXI4_transactor->ARREADY(IF_NOC_AXI_ARREADY);
    mp_MAXI4_transactor->ARREGION(IF_NOC_AXI_ARREGION);
    mp_MAXI4_transactor->ARSIZE(IF_NOC_AXI_ARSIZE);
    mp_MAXI4_transactor->ARUSER(IF_NOC_AXI_ARUSER);
    mp_MAXI4_transactor->ARVALID(IF_NOC_AXI_ARVALID);
    mp_MAXI4_transactor->AWADDR(IF_NOC_AXI_AWADDR);
    mp_MAXI4_transactor->AWBURST(IF_NOC_AXI_AWBURST);
    mp_MAXI4_transactor->AWCACHE(IF_NOC_AXI_AWCACHE);
    mp_MAXI4_transactor->AWID(IF_NOC_AXI_AWCID);
    mp_MAXI4_transactor->AWLEN(IF_NOC_AXI_AWLEN);
    mp_IF_NOC_AXI_AWLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_AWLOCK_converter");
    mp_IF_NOC_AXI_AWLOCK_converter->scalar_in(m_IF_NOC_AXI_AWLOCK_converter_signal);
    mp_IF_NOC_AXI_AWLOCK_converter->vector_out(IF_NOC_AXI_AWLOCK);
    mp_MAXI4_transactor->AWLOCK(m_IF_NOC_AXI_AWLOCK_converter_signal);
    mp_MAXI4_transactor->AWPROT(IF_NOC_AXI_AWPROT);
    mp_MAXI4_transactor->AWQOS(IF_NOC_AXI_AWQOS);
    mp_MAXI4_transactor->AWREADY(IF_NOC_AXI_AWREADY);
    mp_MAXI4_transactor->AWREGION(IF_NOC_AXI_AWREGION);
    mp_MAXI4_transactor->AWSIZE(IF_NOC_AXI_AWSIZE);
    mp_MAXI4_transactor->AWUSER(IF_NOC_AXI_AWUSER);
    mp_MAXI4_transactor->AWVALID(IF_NOC_AXI_AWVALID);
    mp_MAXI4_transactor->BID(IF_NOC_AXI_BCID);
    mp_MAXI4_transactor->BREADY(IF_NOC_AXI_BREADY);
    mp_MAXI4_transactor->BRESP(IF_NOC_AXI_BRESP);
    mp_MAXI4_transactor->BVALID(IF_NOC_AXI_BVALID);
    mp_MAXI4_transactor->RDATA(IF_NOC_AXI_RDATA);
    mp_MAXI4_transactor->RID(IF_NOC_AXI_RCID);
    mp_IF_NOC_AXI_RLAST_converter = new xsc::common::vectorN2scalar_converter<1>("IF_NOC_AXI_RLAST_converter");
    mp_IF_NOC_AXI_RLAST_converter->vector_in(IF_NOC_AXI_RLAST);
    mp_IF_NOC_AXI_RLAST_converter->scalar_out(m_IF_NOC_AXI_RLAST_converter_signal);
    mp_MAXI4_transactor->RLAST(m_IF_NOC_AXI_RLAST_converter_signal);
    mp_MAXI4_transactor->RREADY(IF_NOC_AXI_RREADY);
    mp_MAXI4_transactor->RRESP(IF_NOC_AXI_RRESP);
    mp_MAXI4_transactor->RVALID(IF_NOC_AXI_RVALID);
    mp_MAXI4_transactor->WDATA(IF_NOC_AXI_WDATA);
    mp_IF_NOC_AXI_WLAST_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_WLAST_converter");
    mp_IF_NOC_AXI_WLAST_converter->scalar_in(m_IF_NOC_AXI_WLAST_converter_signal);
    mp_IF_NOC_AXI_WLAST_converter->vector_out(IF_NOC_AXI_WLAST);
    mp_MAXI4_transactor->WLAST(m_IF_NOC_AXI_WLAST_converter_signal);
    mp_MAXI4_transactor->WREADY(IF_NOC_AXI_WREADY);
    mp_MAXI4_transactor->WSTRB(IF_NOC_AXI_WSTRB);
    mp_MAXI4_transactor->WVALID(IF_NOC_AXI_WVALID);
    mp_MAXI4_transactor->CLK(aclk);
    m_MAXI4_transactor_rst_signal.write(1);
    mp_MAXI4_transactor->RST(m_MAXI4_transactor_rst_signal);

    // MAXI4' transactor sockets

    mp_impl->MAXI4_rd_socket->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_impl->MAXI4_wr_socket->bind(*(mp_MAXI4_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
bd_f29c_M00_AXI_nsu_0::bd_f29c_M00_AXI_nsu_0(const sc_core::sc_module_name& nm) : bd_f29c_M00_AXI_nsu_0_sc(nm), IF_NOC_AXI_ARADDR("IF_NOC_AXI_ARADDR"), IF_NOC_AXI_ARBURST("IF_NOC_AXI_ARBURST"), IF_NOC_AXI_ARCACHE("IF_NOC_AXI_ARCACHE"), IF_NOC_AXI_ARCID("IF_NOC_AXI_ARCID"), IF_NOC_AXI_ARLEN("IF_NOC_AXI_ARLEN"), IF_NOC_AXI_ARLOCK("IF_NOC_AXI_ARLOCK"), IF_NOC_AXI_ARPROT("IF_NOC_AXI_ARPROT"), IF_NOC_AXI_ARQOS("IF_NOC_AXI_ARQOS"), IF_NOC_AXI_ARREGION("IF_NOC_AXI_ARREGION"), IF_NOC_AXI_ARSIZE("IF_NOC_AXI_ARSIZE"), IF_NOC_AXI_ARUSER("IF_NOC_AXI_ARUSER"), IF_NOC_AXI_ARVALID("IF_NOC_AXI_ARVALID"), IF_NOC_AXI_AWADDR("IF_NOC_AXI_AWADDR"), IF_NOC_AXI_AWBURST("IF_NOC_AXI_AWBURST"), IF_NOC_AXI_AWCACHE("IF_NOC_AXI_AWCACHE"), IF_NOC_AXI_AWCID("IF_NOC_AXI_AWCID"), IF_NOC_AXI_AWLEN("IF_NOC_AXI_AWLEN"), IF_NOC_AXI_AWLOCK("IF_NOC_AXI_AWLOCK"), IF_NOC_AXI_AWPROT("IF_NOC_AXI_AWPROT"), IF_NOC_AXI_AWQOS("IF_NOC_AXI_AWQOS"), IF_NOC_AXI_AWREGION("IF_NOC_AXI_AWREGION"), IF_NOC_AXI_AWSIZE("IF_NOC_AXI_AWSIZE"), IF_NOC_AXI_AWUSER("IF_NOC_AXI_AWUSER"), IF_NOC_AXI_AWVALID("IF_NOC_AXI_AWVALID"), IF_NOC_AXI_BREADY("IF_NOC_AXI_BREADY"), IF_NOC_AXI_RREADY("IF_NOC_AXI_RREADY"), IF_NOC_AXI_WDATA("IF_NOC_AXI_WDATA"), IF_NOC_AXI_WLAST("IF_NOC_AXI_WLAST"), IF_NOC_AXI_WSTRB("IF_NOC_AXI_WSTRB"), IF_NOC_AXI_WVALID("IF_NOC_AXI_WVALID"), IF_NOC_AXI_ARREADY("IF_NOC_AXI_ARREADY"), IF_NOC_AXI_AWREADY("IF_NOC_AXI_AWREADY"), IF_NOC_AXI_BCID("IF_NOC_AXI_BCID"), IF_NOC_AXI_BRESP("IF_NOC_AXI_BRESP"), IF_NOC_AXI_BVALID("IF_NOC_AXI_BVALID"), IF_NOC_AXI_RCID("IF_NOC_AXI_RCID"), IF_NOC_AXI_RDATA("IF_NOC_AXI_RDATA"), IF_NOC_AXI_RLAST("IF_NOC_AXI_RLAST"), IF_NOC_AXI_RRESP("IF_NOC_AXI_RRESP"), IF_NOC_AXI_RVALID("IF_NOC_AXI_RVALID"), IF_NOC_AXI_WREADY("IF_NOC_AXI_WREADY"), IF_NOC_NPP_IN_NOC_CREDIT_RETURN("IF_NOC_NPP_IN_NOC_CREDIT_RETURN"), IF_NOC_NPP_OUT_NOC_CREDIT_RDY("IF_NOC_NPP_OUT_NOC_CREDIT_RDY"), IF_NOC_NPP_OUT_NOC_FLIT("IF_NOC_NPP_OUT_NOC_FLIT"), IF_NOC_NPP_OUT_NOC_VALID("IF_NOC_NPP_OUT_NOC_VALID"), aclk("aclk"), IF_NOC_NPP_IN_NOC_CREDIT_RDY("IF_NOC_NPP_IN_NOC_CREDIT_RDY"), IF_NOC_NPP_IN_NOC_FLIT("IF_NOC_NPP_IN_NOC_FLIT"), IF_NOC_NPP_IN_NOC_VALID("IF_NOC_NPP_IN_NOC_VALID"), IF_NOC_NPP_OUT_NOC_CREDIT_RETURN("IF_NOC_NPP_OUT_NOC_CREDIT_RETURN"), NSU("NSU")
{

  // initialize pins
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RETURN(IF_NOC_NPP_IN_NOC_CREDIT_RETURN);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RDY(IF_NOC_NPP_OUT_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_OUT_NOC_FLIT(IF_NOC_NPP_OUT_NOC_FLIT);
  mp_impl->IF_NOC_NPP_OUT_NOC_VALID(IF_NOC_NPP_OUT_NOC_VALID);
  mp_impl->aclk(aclk);
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RDY(IF_NOC_NPP_IN_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_IN_NOC_FLIT(IF_NOC_NPP_IN_NOC_FLIT);
  mp_impl->IF_NOC_NPP_IN_NOC_VALID(IF_NOC_NPP_IN_NOC_VALID);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT_NOC_CREDIT_RETURN);
  mp_impl->NSU(NSU);

  // initialize transactors
  mp_MAXI4_transactor = NULL;
  mp_IF_NOC_AXI_ARLOCK_converter = NULL;
  mp_IF_NOC_AXI_AWLOCK_converter = NULL;
  mp_IF_NOC_AXI_RLAST_converter = NULL;
  mp_IF_NOC_AXI_WLAST_converter = NULL;

  // initialize socket stubs

}

void bd_f29c_M00_AXI_nsu_0::before_end_of_elaboration()
{
  // configure 'MAXI4' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("bd_f29c_M00_AXI_nsu_0", "MAXI4_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'MAXI4' transactor parameters
    xsc::common_cpp::properties MAXI4_transactor_param_props;
    MAXI4_transactor_param_props.addLong("DATA_WIDTH", "32");
    MAXI4_transactor_param_props.addLong("FREQ_HZ", "250000000");
    MAXI4_transactor_param_props.addLong("ID_WIDTH", "2");
    MAXI4_transactor_param_props.addLong("ADDR_WIDTH", "64");
    MAXI4_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("WUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("RUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("BUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("HAS_BURST", "1");
    MAXI4_transactor_param_props.addLong("HAS_LOCK", "1");
    MAXI4_transactor_param_props.addLong("HAS_PROT", "1");
    MAXI4_transactor_param_props.addLong("HAS_CACHE", "1");
    MAXI4_transactor_param_props.addLong("HAS_QOS", "1");
    MAXI4_transactor_param_props.addLong("HAS_REGION", "1");
    MAXI4_transactor_param_props.addLong("HAS_WSTRB", "1");
    MAXI4_transactor_param_props.addLong("HAS_BRESP", "1");
    MAXI4_transactor_param_props.addLong("HAS_RRESP", "1");
    MAXI4_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    MAXI4_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    MAXI4_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    MAXI4_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("HAS_SIZE", "1");
    MAXI4_transactor_param_props.addLong("HAS_RESET", "0");
    MAXI4_transactor_param_props.addFloat("PHASE", "0.0");
    MAXI4_transactor_param_props.addString("PROTOCOL", "AXI4");
    MAXI4_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    MAXI4_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");

    mp_MAXI4_transactor = new xtlm::xaximm_xtlm2pin_t<32,64,2,18,1,1,18,1>("MAXI4_transactor", MAXI4_transactor_param_props);

    // MAXI4' transactor ports

    mp_MAXI4_transactor->ARADDR(IF_NOC_AXI_ARADDR);
    mp_MAXI4_transactor->ARBURST(IF_NOC_AXI_ARBURST);
    mp_MAXI4_transactor->ARCACHE(IF_NOC_AXI_ARCACHE);
    mp_MAXI4_transactor->ARID(IF_NOC_AXI_ARCID);
    mp_MAXI4_transactor->ARLEN(IF_NOC_AXI_ARLEN);
    mp_IF_NOC_AXI_ARLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_ARLOCK_converter");
    mp_IF_NOC_AXI_ARLOCK_converter->scalar_in(m_IF_NOC_AXI_ARLOCK_converter_signal);
    mp_IF_NOC_AXI_ARLOCK_converter->vector_out(IF_NOC_AXI_ARLOCK);
    mp_MAXI4_transactor->ARLOCK(m_IF_NOC_AXI_ARLOCK_converter_signal);
    mp_MAXI4_transactor->ARPROT(IF_NOC_AXI_ARPROT);
    mp_MAXI4_transactor->ARQOS(IF_NOC_AXI_ARQOS);
    mp_MAXI4_transactor->ARREADY(IF_NOC_AXI_ARREADY);
    mp_MAXI4_transactor->ARREGION(IF_NOC_AXI_ARREGION);
    mp_MAXI4_transactor->ARSIZE(IF_NOC_AXI_ARSIZE);
    mp_MAXI4_transactor->ARUSER(IF_NOC_AXI_ARUSER);
    mp_MAXI4_transactor->ARVALID(IF_NOC_AXI_ARVALID);
    mp_MAXI4_transactor->AWADDR(IF_NOC_AXI_AWADDR);
    mp_MAXI4_transactor->AWBURST(IF_NOC_AXI_AWBURST);
    mp_MAXI4_transactor->AWCACHE(IF_NOC_AXI_AWCACHE);
    mp_MAXI4_transactor->AWID(IF_NOC_AXI_AWCID);
    mp_MAXI4_transactor->AWLEN(IF_NOC_AXI_AWLEN);
    mp_IF_NOC_AXI_AWLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_AWLOCK_converter");
    mp_IF_NOC_AXI_AWLOCK_converter->scalar_in(m_IF_NOC_AXI_AWLOCK_converter_signal);
    mp_IF_NOC_AXI_AWLOCK_converter->vector_out(IF_NOC_AXI_AWLOCK);
    mp_MAXI4_transactor->AWLOCK(m_IF_NOC_AXI_AWLOCK_converter_signal);
    mp_MAXI4_transactor->AWPROT(IF_NOC_AXI_AWPROT);
    mp_MAXI4_transactor->AWQOS(IF_NOC_AXI_AWQOS);
    mp_MAXI4_transactor->AWREADY(IF_NOC_AXI_AWREADY);
    mp_MAXI4_transactor->AWREGION(IF_NOC_AXI_AWREGION);
    mp_MAXI4_transactor->AWSIZE(IF_NOC_AXI_AWSIZE);
    mp_MAXI4_transactor->AWUSER(IF_NOC_AXI_AWUSER);
    mp_MAXI4_transactor->AWVALID(IF_NOC_AXI_AWVALID);
    mp_MAXI4_transactor->BID(IF_NOC_AXI_BCID);
    mp_MAXI4_transactor->BREADY(IF_NOC_AXI_BREADY);
    mp_MAXI4_transactor->BRESP(IF_NOC_AXI_BRESP);
    mp_MAXI4_transactor->BVALID(IF_NOC_AXI_BVALID);
    mp_MAXI4_transactor->RDATA(IF_NOC_AXI_RDATA);
    mp_MAXI4_transactor->RID(IF_NOC_AXI_RCID);
    mp_IF_NOC_AXI_RLAST_converter = new xsc::common::vectorN2scalar_converter<1>("IF_NOC_AXI_RLAST_converter");
    mp_IF_NOC_AXI_RLAST_converter->vector_in(IF_NOC_AXI_RLAST);
    mp_IF_NOC_AXI_RLAST_converter->scalar_out(m_IF_NOC_AXI_RLAST_converter_signal);
    mp_MAXI4_transactor->RLAST(m_IF_NOC_AXI_RLAST_converter_signal);
    mp_MAXI4_transactor->RREADY(IF_NOC_AXI_RREADY);
    mp_MAXI4_transactor->RRESP(IF_NOC_AXI_RRESP);
    mp_MAXI4_transactor->RVALID(IF_NOC_AXI_RVALID);
    mp_MAXI4_transactor->WDATA(IF_NOC_AXI_WDATA);
    mp_IF_NOC_AXI_WLAST_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_WLAST_converter");
    mp_IF_NOC_AXI_WLAST_converter->scalar_in(m_IF_NOC_AXI_WLAST_converter_signal);
    mp_IF_NOC_AXI_WLAST_converter->vector_out(IF_NOC_AXI_WLAST);
    mp_MAXI4_transactor->WLAST(m_IF_NOC_AXI_WLAST_converter_signal);
    mp_MAXI4_transactor->WREADY(IF_NOC_AXI_WREADY);
    mp_MAXI4_transactor->WSTRB(IF_NOC_AXI_WSTRB);
    mp_MAXI4_transactor->WVALID(IF_NOC_AXI_WVALID);
    mp_MAXI4_transactor->CLK(aclk);
    m_MAXI4_transactor_rst_signal.write(1);
    mp_MAXI4_transactor->RST(m_MAXI4_transactor_rst_signal);

    // MAXI4' transactor sockets

    mp_impl->MAXI4_rd_socket->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_impl->MAXI4_wr_socket->bind(*(mp_MAXI4_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // XM_SYSTEMC




#ifdef RIVIERA
bd_f29c_M00_AXI_nsu_0::bd_f29c_M00_AXI_nsu_0(const sc_core::sc_module_name& nm) : bd_f29c_M00_AXI_nsu_0_sc(nm), IF_NOC_AXI_ARADDR("IF_NOC_AXI_ARADDR"), IF_NOC_AXI_ARBURST("IF_NOC_AXI_ARBURST"), IF_NOC_AXI_ARCACHE("IF_NOC_AXI_ARCACHE"), IF_NOC_AXI_ARCID("IF_NOC_AXI_ARCID"), IF_NOC_AXI_ARLEN("IF_NOC_AXI_ARLEN"), IF_NOC_AXI_ARLOCK("IF_NOC_AXI_ARLOCK"), IF_NOC_AXI_ARPROT("IF_NOC_AXI_ARPROT"), IF_NOC_AXI_ARQOS("IF_NOC_AXI_ARQOS"), IF_NOC_AXI_ARREGION("IF_NOC_AXI_ARREGION"), IF_NOC_AXI_ARSIZE("IF_NOC_AXI_ARSIZE"), IF_NOC_AXI_ARUSER("IF_NOC_AXI_ARUSER"), IF_NOC_AXI_ARVALID("IF_NOC_AXI_ARVALID"), IF_NOC_AXI_AWADDR("IF_NOC_AXI_AWADDR"), IF_NOC_AXI_AWBURST("IF_NOC_AXI_AWBURST"), IF_NOC_AXI_AWCACHE("IF_NOC_AXI_AWCACHE"), IF_NOC_AXI_AWCID("IF_NOC_AXI_AWCID"), IF_NOC_AXI_AWLEN("IF_NOC_AXI_AWLEN"), IF_NOC_AXI_AWLOCK("IF_NOC_AXI_AWLOCK"), IF_NOC_AXI_AWPROT("IF_NOC_AXI_AWPROT"), IF_NOC_AXI_AWQOS("IF_NOC_AXI_AWQOS"), IF_NOC_AXI_AWREGION("IF_NOC_AXI_AWREGION"), IF_NOC_AXI_AWSIZE("IF_NOC_AXI_AWSIZE"), IF_NOC_AXI_AWUSER("IF_NOC_AXI_AWUSER"), IF_NOC_AXI_AWVALID("IF_NOC_AXI_AWVALID"), IF_NOC_AXI_BREADY("IF_NOC_AXI_BREADY"), IF_NOC_AXI_RREADY("IF_NOC_AXI_RREADY"), IF_NOC_AXI_WDATA("IF_NOC_AXI_WDATA"), IF_NOC_AXI_WLAST("IF_NOC_AXI_WLAST"), IF_NOC_AXI_WSTRB("IF_NOC_AXI_WSTRB"), IF_NOC_AXI_WVALID("IF_NOC_AXI_WVALID"), IF_NOC_AXI_ARREADY("IF_NOC_AXI_ARREADY"), IF_NOC_AXI_AWREADY("IF_NOC_AXI_AWREADY"), IF_NOC_AXI_BCID("IF_NOC_AXI_BCID"), IF_NOC_AXI_BRESP("IF_NOC_AXI_BRESP"), IF_NOC_AXI_BVALID("IF_NOC_AXI_BVALID"), IF_NOC_AXI_RCID("IF_NOC_AXI_RCID"), IF_NOC_AXI_RDATA("IF_NOC_AXI_RDATA"), IF_NOC_AXI_RLAST("IF_NOC_AXI_RLAST"), IF_NOC_AXI_RRESP("IF_NOC_AXI_RRESP"), IF_NOC_AXI_RVALID("IF_NOC_AXI_RVALID"), IF_NOC_AXI_WREADY("IF_NOC_AXI_WREADY"), IF_NOC_NPP_IN_NOC_CREDIT_RETURN("IF_NOC_NPP_IN_NOC_CREDIT_RETURN"), IF_NOC_NPP_OUT_NOC_CREDIT_RDY("IF_NOC_NPP_OUT_NOC_CREDIT_RDY"), IF_NOC_NPP_OUT_NOC_FLIT("IF_NOC_NPP_OUT_NOC_FLIT"), IF_NOC_NPP_OUT_NOC_VALID("IF_NOC_NPP_OUT_NOC_VALID"), aclk("aclk"), IF_NOC_NPP_IN_NOC_CREDIT_RDY("IF_NOC_NPP_IN_NOC_CREDIT_RDY"), IF_NOC_NPP_IN_NOC_FLIT("IF_NOC_NPP_IN_NOC_FLIT"), IF_NOC_NPP_IN_NOC_VALID("IF_NOC_NPP_IN_NOC_VALID"), IF_NOC_NPP_OUT_NOC_CREDIT_RETURN("IF_NOC_NPP_OUT_NOC_CREDIT_RETURN"), NSU("NSU")
{

  // initialize pins
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RETURN(IF_NOC_NPP_IN_NOC_CREDIT_RETURN);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RDY(IF_NOC_NPP_OUT_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_OUT_NOC_FLIT(IF_NOC_NPP_OUT_NOC_FLIT);
  mp_impl->IF_NOC_NPP_OUT_NOC_VALID(IF_NOC_NPP_OUT_NOC_VALID);
  mp_impl->aclk(aclk);
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RDY(IF_NOC_NPP_IN_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_IN_NOC_FLIT(IF_NOC_NPP_IN_NOC_FLIT);
  mp_impl->IF_NOC_NPP_IN_NOC_VALID(IF_NOC_NPP_IN_NOC_VALID);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT_NOC_CREDIT_RETURN);
  mp_impl->NSU(NSU);

  // initialize transactors
  mp_MAXI4_transactor = NULL;
  mp_IF_NOC_AXI_ARLOCK_converter = NULL;
  mp_IF_NOC_AXI_AWLOCK_converter = NULL;
  mp_IF_NOC_AXI_RLAST_converter = NULL;
  mp_IF_NOC_AXI_WLAST_converter = NULL;

  // initialize socket stubs

}

void bd_f29c_M00_AXI_nsu_0::before_end_of_elaboration()
{
  // configure 'MAXI4' transactor

  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("bd_f29c_M00_AXI_nsu_0", "MAXI4_TLM_MODE") != 1)
  {
    // Instantiate Socket Stubs

  // 'MAXI4' transactor parameters
    xsc::common_cpp::properties MAXI4_transactor_param_props;
    MAXI4_transactor_param_props.addLong("DATA_WIDTH", "32");
    MAXI4_transactor_param_props.addLong("FREQ_HZ", "250000000");
    MAXI4_transactor_param_props.addLong("ID_WIDTH", "2");
    MAXI4_transactor_param_props.addLong("ADDR_WIDTH", "64");
    MAXI4_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("WUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("RUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("BUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("HAS_BURST", "1");
    MAXI4_transactor_param_props.addLong("HAS_LOCK", "1");
    MAXI4_transactor_param_props.addLong("HAS_PROT", "1");
    MAXI4_transactor_param_props.addLong("HAS_CACHE", "1");
    MAXI4_transactor_param_props.addLong("HAS_QOS", "1");
    MAXI4_transactor_param_props.addLong("HAS_REGION", "1");
    MAXI4_transactor_param_props.addLong("HAS_WSTRB", "1");
    MAXI4_transactor_param_props.addLong("HAS_BRESP", "1");
    MAXI4_transactor_param_props.addLong("HAS_RRESP", "1");
    MAXI4_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    MAXI4_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    MAXI4_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    MAXI4_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("HAS_SIZE", "1");
    MAXI4_transactor_param_props.addLong("HAS_RESET", "0");
    MAXI4_transactor_param_props.addFloat("PHASE", "0.0");
    MAXI4_transactor_param_props.addString("PROTOCOL", "AXI4");
    MAXI4_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    MAXI4_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");

    mp_MAXI4_transactor = new xtlm::xaximm_xtlm2pin_t<32,64,2,18,1,1,18,1>("MAXI4_transactor", MAXI4_transactor_param_props);

    // MAXI4' transactor ports

    mp_MAXI4_transactor->ARADDR(IF_NOC_AXI_ARADDR);
    mp_MAXI4_transactor->ARBURST(IF_NOC_AXI_ARBURST);
    mp_MAXI4_transactor->ARCACHE(IF_NOC_AXI_ARCACHE);
    mp_MAXI4_transactor->ARID(IF_NOC_AXI_ARCID);
    mp_MAXI4_transactor->ARLEN(IF_NOC_AXI_ARLEN);
    mp_IF_NOC_AXI_ARLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_ARLOCK_converter");
    mp_IF_NOC_AXI_ARLOCK_converter->scalar_in(m_IF_NOC_AXI_ARLOCK_converter_signal);
    mp_IF_NOC_AXI_ARLOCK_converter->vector_out(IF_NOC_AXI_ARLOCK);
    mp_MAXI4_transactor->ARLOCK(m_IF_NOC_AXI_ARLOCK_converter_signal);
    mp_MAXI4_transactor->ARPROT(IF_NOC_AXI_ARPROT);
    mp_MAXI4_transactor->ARQOS(IF_NOC_AXI_ARQOS);
    mp_MAXI4_transactor->ARREADY(IF_NOC_AXI_ARREADY);
    mp_MAXI4_transactor->ARREGION(IF_NOC_AXI_ARREGION);
    mp_MAXI4_transactor->ARSIZE(IF_NOC_AXI_ARSIZE);
    mp_MAXI4_transactor->ARUSER(IF_NOC_AXI_ARUSER);
    mp_MAXI4_transactor->ARVALID(IF_NOC_AXI_ARVALID);
    mp_MAXI4_transactor->AWADDR(IF_NOC_AXI_AWADDR);
    mp_MAXI4_transactor->AWBURST(IF_NOC_AXI_AWBURST);
    mp_MAXI4_transactor->AWCACHE(IF_NOC_AXI_AWCACHE);
    mp_MAXI4_transactor->AWID(IF_NOC_AXI_AWCID);
    mp_MAXI4_transactor->AWLEN(IF_NOC_AXI_AWLEN);
    mp_IF_NOC_AXI_AWLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_AWLOCK_converter");
    mp_IF_NOC_AXI_AWLOCK_converter->scalar_in(m_IF_NOC_AXI_AWLOCK_converter_signal);
    mp_IF_NOC_AXI_AWLOCK_converter->vector_out(IF_NOC_AXI_AWLOCK);
    mp_MAXI4_transactor->AWLOCK(m_IF_NOC_AXI_AWLOCK_converter_signal);
    mp_MAXI4_transactor->AWPROT(IF_NOC_AXI_AWPROT);
    mp_MAXI4_transactor->AWQOS(IF_NOC_AXI_AWQOS);
    mp_MAXI4_transactor->AWREADY(IF_NOC_AXI_AWREADY);
    mp_MAXI4_transactor->AWREGION(IF_NOC_AXI_AWREGION);
    mp_MAXI4_transactor->AWSIZE(IF_NOC_AXI_AWSIZE);
    mp_MAXI4_transactor->AWUSER(IF_NOC_AXI_AWUSER);
    mp_MAXI4_transactor->AWVALID(IF_NOC_AXI_AWVALID);
    mp_MAXI4_transactor->BID(IF_NOC_AXI_BCID);
    mp_MAXI4_transactor->BREADY(IF_NOC_AXI_BREADY);
    mp_MAXI4_transactor->BRESP(IF_NOC_AXI_BRESP);
    mp_MAXI4_transactor->BVALID(IF_NOC_AXI_BVALID);
    mp_MAXI4_transactor->RDATA(IF_NOC_AXI_RDATA);
    mp_MAXI4_transactor->RID(IF_NOC_AXI_RCID);
    mp_IF_NOC_AXI_RLAST_converter = new xsc::common::vectorN2scalar_converter<1>("IF_NOC_AXI_RLAST_converter");
    mp_IF_NOC_AXI_RLAST_converter->vector_in(IF_NOC_AXI_RLAST);
    mp_IF_NOC_AXI_RLAST_converter->scalar_out(m_IF_NOC_AXI_RLAST_converter_signal);
    mp_MAXI4_transactor->RLAST(m_IF_NOC_AXI_RLAST_converter_signal);
    mp_MAXI4_transactor->RREADY(IF_NOC_AXI_RREADY);
    mp_MAXI4_transactor->RRESP(IF_NOC_AXI_RRESP);
    mp_MAXI4_transactor->RVALID(IF_NOC_AXI_RVALID);
    mp_MAXI4_transactor->WDATA(IF_NOC_AXI_WDATA);
    mp_IF_NOC_AXI_WLAST_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_WLAST_converter");
    mp_IF_NOC_AXI_WLAST_converter->scalar_in(m_IF_NOC_AXI_WLAST_converter_signal);
    mp_IF_NOC_AXI_WLAST_converter->vector_out(IF_NOC_AXI_WLAST);
    mp_MAXI4_transactor->WLAST(m_IF_NOC_AXI_WLAST_converter_signal);
    mp_MAXI4_transactor->WREADY(IF_NOC_AXI_WREADY);
    mp_MAXI4_transactor->WSTRB(IF_NOC_AXI_WSTRB);
    mp_MAXI4_transactor->WVALID(IF_NOC_AXI_WVALID);
    mp_MAXI4_transactor->CLK(aclk);
    m_MAXI4_transactor_rst_signal.write(1);
    mp_MAXI4_transactor->RST(m_MAXI4_transactor_rst_signal);

    // MAXI4' transactor sockets

    mp_impl->MAXI4_rd_socket->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_impl->MAXI4_wr_socket->bind(*(mp_MAXI4_transactor->wr_socket));
  }
  else
  {
  }

}

#endif // RIVIERA




#ifdef VCSSYSTEMC
bd_f29c_M00_AXI_nsu_0::bd_f29c_M00_AXI_nsu_0(const sc_core::sc_module_name& nm) : bd_f29c_M00_AXI_nsu_0_sc(nm),  IF_NOC_AXI_ARADDR("IF_NOC_AXI_ARADDR"), IF_NOC_AXI_ARBURST("IF_NOC_AXI_ARBURST"), IF_NOC_AXI_ARCACHE("IF_NOC_AXI_ARCACHE"), IF_NOC_AXI_ARCID("IF_NOC_AXI_ARCID"), IF_NOC_AXI_ARLEN("IF_NOC_AXI_ARLEN"), IF_NOC_AXI_ARLOCK("IF_NOC_AXI_ARLOCK"), IF_NOC_AXI_ARPROT("IF_NOC_AXI_ARPROT"), IF_NOC_AXI_ARQOS("IF_NOC_AXI_ARQOS"), IF_NOC_AXI_ARREGION("IF_NOC_AXI_ARREGION"), IF_NOC_AXI_ARSIZE("IF_NOC_AXI_ARSIZE"), IF_NOC_AXI_ARUSER("IF_NOC_AXI_ARUSER"), IF_NOC_AXI_ARVALID("IF_NOC_AXI_ARVALID"), IF_NOC_AXI_AWADDR("IF_NOC_AXI_AWADDR"), IF_NOC_AXI_AWBURST("IF_NOC_AXI_AWBURST"), IF_NOC_AXI_AWCACHE("IF_NOC_AXI_AWCACHE"), IF_NOC_AXI_AWCID("IF_NOC_AXI_AWCID"), IF_NOC_AXI_AWLEN("IF_NOC_AXI_AWLEN"), IF_NOC_AXI_AWLOCK("IF_NOC_AXI_AWLOCK"), IF_NOC_AXI_AWPROT("IF_NOC_AXI_AWPROT"), IF_NOC_AXI_AWQOS("IF_NOC_AXI_AWQOS"), IF_NOC_AXI_AWREGION("IF_NOC_AXI_AWREGION"), IF_NOC_AXI_AWSIZE("IF_NOC_AXI_AWSIZE"), IF_NOC_AXI_AWUSER("IF_NOC_AXI_AWUSER"), IF_NOC_AXI_AWVALID("IF_NOC_AXI_AWVALID"), IF_NOC_AXI_BREADY("IF_NOC_AXI_BREADY"), IF_NOC_AXI_RREADY("IF_NOC_AXI_RREADY"), IF_NOC_AXI_WDATA("IF_NOC_AXI_WDATA"), IF_NOC_AXI_WLAST("IF_NOC_AXI_WLAST"), IF_NOC_AXI_WSTRB("IF_NOC_AXI_WSTRB"), IF_NOC_AXI_WVALID("IF_NOC_AXI_WVALID"), IF_NOC_AXI_ARREADY("IF_NOC_AXI_ARREADY"), IF_NOC_AXI_AWREADY("IF_NOC_AXI_AWREADY"), IF_NOC_AXI_BCID("IF_NOC_AXI_BCID"), IF_NOC_AXI_BRESP("IF_NOC_AXI_BRESP"), IF_NOC_AXI_BVALID("IF_NOC_AXI_BVALID"), IF_NOC_AXI_RCID("IF_NOC_AXI_RCID"), IF_NOC_AXI_RDATA("IF_NOC_AXI_RDATA"), IF_NOC_AXI_RLAST("IF_NOC_AXI_RLAST"), IF_NOC_AXI_RRESP("IF_NOC_AXI_RRESP"), IF_NOC_AXI_RVALID("IF_NOC_AXI_RVALID"), IF_NOC_AXI_WREADY("IF_NOC_AXI_WREADY"), IF_NOC_NPP_IN_NOC_CREDIT_RETURN("IF_NOC_NPP_IN_NOC_CREDIT_RETURN"), IF_NOC_NPP_OUT_NOC_CREDIT_RDY("IF_NOC_NPP_OUT_NOC_CREDIT_RDY"), IF_NOC_NPP_OUT_NOC_FLIT("IF_NOC_NPP_OUT_NOC_FLIT"), IF_NOC_NPP_OUT_NOC_VALID("IF_NOC_NPP_OUT_NOC_VALID"), aclk("aclk"), IF_NOC_NPP_IN_NOC_CREDIT_RDY("IF_NOC_NPP_IN_NOC_CREDIT_RDY"), IF_NOC_NPP_IN_NOC_FLIT("IF_NOC_NPP_IN_NOC_FLIT"), IF_NOC_NPP_IN_NOC_VALID("IF_NOC_NPP_IN_NOC_VALID"), IF_NOC_NPP_OUT_NOC_CREDIT_RETURN("IF_NOC_NPP_OUT_NOC_CREDIT_RETURN"), NSU("NSU")
{
  // initialize pins
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RETURN(IF_NOC_NPP_IN_NOC_CREDIT_RETURN);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RDY(IF_NOC_NPP_OUT_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_OUT_NOC_FLIT(IF_NOC_NPP_OUT_NOC_FLIT);
  mp_impl->IF_NOC_NPP_OUT_NOC_VALID(IF_NOC_NPP_OUT_NOC_VALID);
  mp_impl->aclk(aclk);
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RDY(IF_NOC_NPP_IN_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_IN_NOC_FLIT(IF_NOC_NPP_IN_NOC_FLIT);
  mp_impl->IF_NOC_NPP_IN_NOC_VALID(IF_NOC_NPP_IN_NOC_VALID);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT_NOC_CREDIT_RETURN);
  mp_impl->NSU(NSU);

  // initialize transactors
  mp_MAXI4_transactor = NULL;
  mp_IF_NOC_AXI_ARLOCK_converter = NULL;
  mp_IF_NOC_AXI_AWLOCK_converter = NULL;
  mp_IF_NOC_AXI_RLAST_converter = NULL;
  mp_IF_NOC_AXI_WLAST_converter = NULL;

  // Instantiate Socket Stubs

  // configure MAXI4_transactor
    xsc::common_cpp::properties MAXI4_transactor_param_props;
    MAXI4_transactor_param_props.addLong("DATA_WIDTH", "32");
    MAXI4_transactor_param_props.addLong("FREQ_HZ", "250000000");
    MAXI4_transactor_param_props.addLong("ID_WIDTH", "2");
    MAXI4_transactor_param_props.addLong("ADDR_WIDTH", "64");
    MAXI4_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("WUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("RUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("BUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("HAS_BURST", "1");
    MAXI4_transactor_param_props.addLong("HAS_LOCK", "1");
    MAXI4_transactor_param_props.addLong("HAS_PROT", "1");
    MAXI4_transactor_param_props.addLong("HAS_CACHE", "1");
    MAXI4_transactor_param_props.addLong("HAS_QOS", "1");
    MAXI4_transactor_param_props.addLong("HAS_REGION", "1");
    MAXI4_transactor_param_props.addLong("HAS_WSTRB", "1");
    MAXI4_transactor_param_props.addLong("HAS_BRESP", "1");
    MAXI4_transactor_param_props.addLong("HAS_RRESP", "1");
    MAXI4_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    MAXI4_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    MAXI4_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    MAXI4_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("HAS_SIZE", "1");
    MAXI4_transactor_param_props.addLong("HAS_RESET", "0");
    MAXI4_transactor_param_props.addFloat("PHASE", "0.0");
    MAXI4_transactor_param_props.addString("PROTOCOL", "AXI4");
    MAXI4_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    MAXI4_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");

    mp_MAXI4_transactor = new xtlm::xaximm_xtlm2pin_t<32,64,2,18,1,1,18,1>("MAXI4_transactor", MAXI4_transactor_param_props);
  mp_MAXI4_transactor->ARADDR(IF_NOC_AXI_ARADDR);
  mp_MAXI4_transactor->ARBURST(IF_NOC_AXI_ARBURST);
  mp_MAXI4_transactor->ARCACHE(IF_NOC_AXI_ARCACHE);
  mp_MAXI4_transactor->ARID(IF_NOC_AXI_ARCID);
  mp_MAXI4_transactor->ARLEN(IF_NOC_AXI_ARLEN);
  mp_IF_NOC_AXI_ARLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_ARLOCK_converter");
  mp_IF_NOC_AXI_ARLOCK_converter->scalar_in(m_IF_NOC_AXI_ARLOCK_converter_signal);
  mp_IF_NOC_AXI_ARLOCK_converter->vector_out(IF_NOC_AXI_ARLOCK);
  mp_MAXI4_transactor->ARLOCK(m_IF_NOC_AXI_ARLOCK_converter_signal);
  mp_MAXI4_transactor->ARPROT(IF_NOC_AXI_ARPROT);
  mp_MAXI4_transactor->ARQOS(IF_NOC_AXI_ARQOS);
  mp_MAXI4_transactor->ARREADY(IF_NOC_AXI_ARREADY);
  mp_MAXI4_transactor->ARREGION(IF_NOC_AXI_ARREGION);
  mp_MAXI4_transactor->ARSIZE(IF_NOC_AXI_ARSIZE);
  mp_MAXI4_transactor->ARUSER(IF_NOC_AXI_ARUSER);
  mp_MAXI4_transactor->ARVALID(IF_NOC_AXI_ARVALID);
  mp_MAXI4_transactor->AWADDR(IF_NOC_AXI_AWADDR);
  mp_MAXI4_transactor->AWBURST(IF_NOC_AXI_AWBURST);
  mp_MAXI4_transactor->AWCACHE(IF_NOC_AXI_AWCACHE);
  mp_MAXI4_transactor->AWID(IF_NOC_AXI_AWCID);
  mp_MAXI4_transactor->AWLEN(IF_NOC_AXI_AWLEN);
  mp_IF_NOC_AXI_AWLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_AWLOCK_converter");
  mp_IF_NOC_AXI_AWLOCK_converter->scalar_in(m_IF_NOC_AXI_AWLOCK_converter_signal);
  mp_IF_NOC_AXI_AWLOCK_converter->vector_out(IF_NOC_AXI_AWLOCK);
  mp_MAXI4_transactor->AWLOCK(m_IF_NOC_AXI_AWLOCK_converter_signal);
  mp_MAXI4_transactor->AWPROT(IF_NOC_AXI_AWPROT);
  mp_MAXI4_transactor->AWQOS(IF_NOC_AXI_AWQOS);
  mp_MAXI4_transactor->AWREADY(IF_NOC_AXI_AWREADY);
  mp_MAXI4_transactor->AWREGION(IF_NOC_AXI_AWREGION);
  mp_MAXI4_transactor->AWSIZE(IF_NOC_AXI_AWSIZE);
  mp_MAXI4_transactor->AWUSER(IF_NOC_AXI_AWUSER);
  mp_MAXI4_transactor->AWVALID(IF_NOC_AXI_AWVALID);
  mp_MAXI4_transactor->BID(IF_NOC_AXI_BCID);
  mp_MAXI4_transactor->BREADY(IF_NOC_AXI_BREADY);
  mp_MAXI4_transactor->BRESP(IF_NOC_AXI_BRESP);
  mp_MAXI4_transactor->BVALID(IF_NOC_AXI_BVALID);
  mp_MAXI4_transactor->RDATA(IF_NOC_AXI_RDATA);
  mp_MAXI4_transactor->RID(IF_NOC_AXI_RCID);
  mp_IF_NOC_AXI_RLAST_converter = new xsc::common::vectorN2scalar_converter<1>("IF_NOC_AXI_RLAST_converter");
  mp_IF_NOC_AXI_RLAST_converter->vector_in(IF_NOC_AXI_RLAST);
  mp_IF_NOC_AXI_RLAST_converter->scalar_out(m_IF_NOC_AXI_RLAST_converter_signal);
  mp_MAXI4_transactor->RLAST(m_IF_NOC_AXI_RLAST_converter_signal);
  mp_MAXI4_transactor->RREADY(IF_NOC_AXI_RREADY);
  mp_MAXI4_transactor->RRESP(IF_NOC_AXI_RRESP);
  mp_MAXI4_transactor->RVALID(IF_NOC_AXI_RVALID);
  mp_MAXI4_transactor->WDATA(IF_NOC_AXI_WDATA);
  mp_IF_NOC_AXI_WLAST_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_WLAST_converter");
  mp_IF_NOC_AXI_WLAST_converter->scalar_in(m_IF_NOC_AXI_WLAST_converter_signal);
  mp_IF_NOC_AXI_WLAST_converter->vector_out(IF_NOC_AXI_WLAST);
  mp_MAXI4_transactor->WLAST(m_IF_NOC_AXI_WLAST_converter_signal);
  mp_MAXI4_transactor->WREADY(IF_NOC_AXI_WREADY);
  mp_MAXI4_transactor->WSTRB(IF_NOC_AXI_WSTRB);
  mp_MAXI4_transactor->WVALID(IF_NOC_AXI_WVALID);
  mp_MAXI4_transactor->CLK(aclk);
  m_MAXI4_transactor_rst_signal.write(1);
  mp_MAXI4_transactor->RST(m_MAXI4_transactor_rst_signal);

  // initialize transactors stubs
  MAXI4_transactor_initiator_wr_socket_stub = nullptr;
  MAXI4_transactor_initiator_rd_socket_stub = nullptr;

}

void bd_f29c_M00_AXI_nsu_0::before_end_of_elaboration()
{
  // configure 'MAXI4' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("bd_f29c_M00_AXI_nsu_0", "MAXI4_TLM_MODE") != 1)
  {
    mp_impl->MAXI4_rd_socket->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_impl->MAXI4_wr_socket->bind(*(mp_MAXI4_transactor->wr_socket));
  
  }
  else
  {
    MAXI4_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    MAXI4_transactor_initiator_wr_socket_stub->bind(*(mp_MAXI4_transactor->wr_socket));
    MAXI4_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    MAXI4_transactor_initiator_rd_socket_stub->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_MAXI4_transactor->disable_transactor();
  }

}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
bd_f29c_M00_AXI_nsu_0::bd_f29c_M00_AXI_nsu_0(const sc_core::sc_module_name& nm) : bd_f29c_M00_AXI_nsu_0_sc(nm),  IF_NOC_AXI_ARADDR("IF_NOC_AXI_ARADDR"), IF_NOC_AXI_ARBURST("IF_NOC_AXI_ARBURST"), IF_NOC_AXI_ARCACHE("IF_NOC_AXI_ARCACHE"), IF_NOC_AXI_ARCID("IF_NOC_AXI_ARCID"), IF_NOC_AXI_ARLEN("IF_NOC_AXI_ARLEN"), IF_NOC_AXI_ARLOCK("IF_NOC_AXI_ARLOCK"), IF_NOC_AXI_ARPROT("IF_NOC_AXI_ARPROT"), IF_NOC_AXI_ARQOS("IF_NOC_AXI_ARQOS"), IF_NOC_AXI_ARREGION("IF_NOC_AXI_ARREGION"), IF_NOC_AXI_ARSIZE("IF_NOC_AXI_ARSIZE"), IF_NOC_AXI_ARUSER("IF_NOC_AXI_ARUSER"), IF_NOC_AXI_ARVALID("IF_NOC_AXI_ARVALID"), IF_NOC_AXI_AWADDR("IF_NOC_AXI_AWADDR"), IF_NOC_AXI_AWBURST("IF_NOC_AXI_AWBURST"), IF_NOC_AXI_AWCACHE("IF_NOC_AXI_AWCACHE"), IF_NOC_AXI_AWCID("IF_NOC_AXI_AWCID"), IF_NOC_AXI_AWLEN("IF_NOC_AXI_AWLEN"), IF_NOC_AXI_AWLOCK("IF_NOC_AXI_AWLOCK"), IF_NOC_AXI_AWPROT("IF_NOC_AXI_AWPROT"), IF_NOC_AXI_AWQOS("IF_NOC_AXI_AWQOS"), IF_NOC_AXI_AWREGION("IF_NOC_AXI_AWREGION"), IF_NOC_AXI_AWSIZE("IF_NOC_AXI_AWSIZE"), IF_NOC_AXI_AWUSER("IF_NOC_AXI_AWUSER"), IF_NOC_AXI_AWVALID("IF_NOC_AXI_AWVALID"), IF_NOC_AXI_BREADY("IF_NOC_AXI_BREADY"), IF_NOC_AXI_RREADY("IF_NOC_AXI_RREADY"), IF_NOC_AXI_WDATA("IF_NOC_AXI_WDATA"), IF_NOC_AXI_WLAST("IF_NOC_AXI_WLAST"), IF_NOC_AXI_WSTRB("IF_NOC_AXI_WSTRB"), IF_NOC_AXI_WVALID("IF_NOC_AXI_WVALID"), IF_NOC_AXI_ARREADY("IF_NOC_AXI_ARREADY"), IF_NOC_AXI_AWREADY("IF_NOC_AXI_AWREADY"), IF_NOC_AXI_BCID("IF_NOC_AXI_BCID"), IF_NOC_AXI_BRESP("IF_NOC_AXI_BRESP"), IF_NOC_AXI_BVALID("IF_NOC_AXI_BVALID"), IF_NOC_AXI_RCID("IF_NOC_AXI_RCID"), IF_NOC_AXI_RDATA("IF_NOC_AXI_RDATA"), IF_NOC_AXI_RLAST("IF_NOC_AXI_RLAST"), IF_NOC_AXI_RRESP("IF_NOC_AXI_RRESP"), IF_NOC_AXI_RVALID("IF_NOC_AXI_RVALID"), IF_NOC_AXI_WREADY("IF_NOC_AXI_WREADY"), IF_NOC_NPP_IN_NOC_CREDIT_RETURN("IF_NOC_NPP_IN_NOC_CREDIT_RETURN"), IF_NOC_NPP_OUT_NOC_CREDIT_RDY("IF_NOC_NPP_OUT_NOC_CREDIT_RDY"), IF_NOC_NPP_OUT_NOC_FLIT("IF_NOC_NPP_OUT_NOC_FLIT"), IF_NOC_NPP_OUT_NOC_VALID("IF_NOC_NPP_OUT_NOC_VALID"), aclk("aclk"), IF_NOC_NPP_IN_NOC_CREDIT_RDY("IF_NOC_NPP_IN_NOC_CREDIT_RDY"), IF_NOC_NPP_IN_NOC_FLIT("IF_NOC_NPP_IN_NOC_FLIT"), IF_NOC_NPP_IN_NOC_VALID("IF_NOC_NPP_IN_NOC_VALID"), IF_NOC_NPP_OUT_NOC_CREDIT_RETURN("IF_NOC_NPP_OUT_NOC_CREDIT_RETURN"), NSU("NSU")
{
  // initialize pins
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RETURN(IF_NOC_NPP_IN_NOC_CREDIT_RETURN);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RDY(IF_NOC_NPP_OUT_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_OUT_NOC_FLIT(IF_NOC_NPP_OUT_NOC_FLIT);
  mp_impl->IF_NOC_NPP_OUT_NOC_VALID(IF_NOC_NPP_OUT_NOC_VALID);
  mp_impl->aclk(aclk);
  mp_impl->IF_NOC_NPP_IN_NOC_CREDIT_RDY(IF_NOC_NPP_IN_NOC_CREDIT_RDY);
  mp_impl->IF_NOC_NPP_IN_NOC_FLIT(IF_NOC_NPP_IN_NOC_FLIT);
  mp_impl->IF_NOC_NPP_IN_NOC_VALID(IF_NOC_NPP_IN_NOC_VALID);
  mp_impl->IF_NOC_NPP_OUT_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT_NOC_CREDIT_RETURN);
  mp_impl->NSU(NSU);

  // initialize transactors
  mp_MAXI4_transactor = NULL;
  mp_IF_NOC_AXI_ARLOCK_converter = NULL;
  mp_IF_NOC_AXI_AWLOCK_converter = NULL;
  mp_IF_NOC_AXI_RLAST_converter = NULL;
  mp_IF_NOC_AXI_WLAST_converter = NULL;

  // Instantiate Socket Stubs

  // configure MAXI4_transactor
    xsc::common_cpp::properties MAXI4_transactor_param_props;
    MAXI4_transactor_param_props.addLong("DATA_WIDTH", "32");
    MAXI4_transactor_param_props.addLong("FREQ_HZ", "250000000");
    MAXI4_transactor_param_props.addLong("ID_WIDTH", "2");
    MAXI4_transactor_param_props.addLong("ADDR_WIDTH", "64");
    MAXI4_transactor_param_props.addLong("AWUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("ARUSER_WIDTH", "18");
    MAXI4_transactor_param_props.addLong("WUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("RUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("BUSER_WIDTH", "0");
    MAXI4_transactor_param_props.addLong("HAS_BURST", "1");
    MAXI4_transactor_param_props.addLong("HAS_LOCK", "1");
    MAXI4_transactor_param_props.addLong("HAS_PROT", "1");
    MAXI4_transactor_param_props.addLong("HAS_CACHE", "1");
    MAXI4_transactor_param_props.addLong("HAS_QOS", "1");
    MAXI4_transactor_param_props.addLong("HAS_REGION", "1");
    MAXI4_transactor_param_props.addLong("HAS_WSTRB", "1");
    MAXI4_transactor_param_props.addLong("HAS_BRESP", "1");
    MAXI4_transactor_param_props.addLong("HAS_RRESP", "1");
    MAXI4_transactor_param_props.addLong("SUPPORTS_NARROW_BURST", "1");
    MAXI4_transactor_param_props.addLong("NUM_READ_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_OUTSTANDING", "32");
    MAXI4_transactor_param_props.addLong("MAX_BURST_LENGTH", "256");
    MAXI4_transactor_param_props.addLong("NUM_READ_THREADS", "4");
    MAXI4_transactor_param_props.addLong("NUM_WRITE_THREADS", "4");
    MAXI4_transactor_param_props.addLong("RUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("WUSER_BITS_PER_BYTE", "0");
    MAXI4_transactor_param_props.addLong("HAS_SIZE", "1");
    MAXI4_transactor_param_props.addLong("HAS_RESET", "0");
    MAXI4_transactor_param_props.addFloat("PHASE", "0.0");
    MAXI4_transactor_param_props.addString("PROTOCOL", "AXI4");
    MAXI4_transactor_param_props.addString("READ_WRITE_MODE", "READ_WRITE");
    MAXI4_transactor_param_props.addString("CLK_DOMAIN", "bd_f512_cpm_0_0_pcie0_user_clk");

    mp_MAXI4_transactor = new xtlm::xaximm_xtlm2pin_t<32,64,2,18,1,1,18,1>("MAXI4_transactor", MAXI4_transactor_param_props);
  mp_MAXI4_transactor->ARADDR(IF_NOC_AXI_ARADDR);
  mp_MAXI4_transactor->ARBURST(IF_NOC_AXI_ARBURST);
  mp_MAXI4_transactor->ARCACHE(IF_NOC_AXI_ARCACHE);
  mp_MAXI4_transactor->ARID(IF_NOC_AXI_ARCID);
  mp_MAXI4_transactor->ARLEN(IF_NOC_AXI_ARLEN);
  mp_IF_NOC_AXI_ARLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_ARLOCK_converter");
  mp_IF_NOC_AXI_ARLOCK_converter->scalar_in(m_IF_NOC_AXI_ARLOCK_converter_signal);
  mp_IF_NOC_AXI_ARLOCK_converter->vector_out(IF_NOC_AXI_ARLOCK);
  mp_MAXI4_transactor->ARLOCK(m_IF_NOC_AXI_ARLOCK_converter_signal);
  mp_MAXI4_transactor->ARPROT(IF_NOC_AXI_ARPROT);
  mp_MAXI4_transactor->ARQOS(IF_NOC_AXI_ARQOS);
  mp_MAXI4_transactor->ARREADY(IF_NOC_AXI_ARREADY);
  mp_MAXI4_transactor->ARREGION(IF_NOC_AXI_ARREGION);
  mp_MAXI4_transactor->ARSIZE(IF_NOC_AXI_ARSIZE);
  mp_MAXI4_transactor->ARUSER(IF_NOC_AXI_ARUSER);
  mp_MAXI4_transactor->ARVALID(IF_NOC_AXI_ARVALID);
  mp_MAXI4_transactor->AWADDR(IF_NOC_AXI_AWADDR);
  mp_MAXI4_transactor->AWBURST(IF_NOC_AXI_AWBURST);
  mp_MAXI4_transactor->AWCACHE(IF_NOC_AXI_AWCACHE);
  mp_MAXI4_transactor->AWID(IF_NOC_AXI_AWCID);
  mp_MAXI4_transactor->AWLEN(IF_NOC_AXI_AWLEN);
  mp_IF_NOC_AXI_AWLOCK_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_AWLOCK_converter");
  mp_IF_NOC_AXI_AWLOCK_converter->scalar_in(m_IF_NOC_AXI_AWLOCK_converter_signal);
  mp_IF_NOC_AXI_AWLOCK_converter->vector_out(IF_NOC_AXI_AWLOCK);
  mp_MAXI4_transactor->AWLOCK(m_IF_NOC_AXI_AWLOCK_converter_signal);
  mp_MAXI4_transactor->AWPROT(IF_NOC_AXI_AWPROT);
  mp_MAXI4_transactor->AWQOS(IF_NOC_AXI_AWQOS);
  mp_MAXI4_transactor->AWREADY(IF_NOC_AXI_AWREADY);
  mp_MAXI4_transactor->AWREGION(IF_NOC_AXI_AWREGION);
  mp_MAXI4_transactor->AWSIZE(IF_NOC_AXI_AWSIZE);
  mp_MAXI4_transactor->AWUSER(IF_NOC_AXI_AWUSER);
  mp_MAXI4_transactor->AWVALID(IF_NOC_AXI_AWVALID);
  mp_MAXI4_transactor->BID(IF_NOC_AXI_BCID);
  mp_MAXI4_transactor->BREADY(IF_NOC_AXI_BREADY);
  mp_MAXI4_transactor->BRESP(IF_NOC_AXI_BRESP);
  mp_MAXI4_transactor->BVALID(IF_NOC_AXI_BVALID);
  mp_MAXI4_transactor->RDATA(IF_NOC_AXI_RDATA);
  mp_MAXI4_transactor->RID(IF_NOC_AXI_RCID);
  mp_IF_NOC_AXI_RLAST_converter = new xsc::common::vectorN2scalar_converter<1>("IF_NOC_AXI_RLAST_converter");
  mp_IF_NOC_AXI_RLAST_converter->vector_in(IF_NOC_AXI_RLAST);
  mp_IF_NOC_AXI_RLAST_converter->scalar_out(m_IF_NOC_AXI_RLAST_converter_signal);
  mp_MAXI4_transactor->RLAST(m_IF_NOC_AXI_RLAST_converter_signal);
  mp_MAXI4_transactor->RREADY(IF_NOC_AXI_RREADY);
  mp_MAXI4_transactor->RRESP(IF_NOC_AXI_RRESP);
  mp_MAXI4_transactor->RVALID(IF_NOC_AXI_RVALID);
  mp_MAXI4_transactor->WDATA(IF_NOC_AXI_WDATA);
  mp_IF_NOC_AXI_WLAST_converter = new xsc::common::scalar2vectorN_converter<1>("IF_NOC_AXI_WLAST_converter");
  mp_IF_NOC_AXI_WLAST_converter->scalar_in(m_IF_NOC_AXI_WLAST_converter_signal);
  mp_IF_NOC_AXI_WLAST_converter->vector_out(IF_NOC_AXI_WLAST);
  mp_MAXI4_transactor->WLAST(m_IF_NOC_AXI_WLAST_converter_signal);
  mp_MAXI4_transactor->WREADY(IF_NOC_AXI_WREADY);
  mp_MAXI4_transactor->WSTRB(IF_NOC_AXI_WSTRB);
  mp_MAXI4_transactor->WVALID(IF_NOC_AXI_WVALID);
  mp_MAXI4_transactor->CLK(aclk);
  m_MAXI4_transactor_rst_signal.write(1);
  mp_MAXI4_transactor->RST(m_MAXI4_transactor_rst_signal);

  // initialize transactors stubs
  MAXI4_transactor_initiator_wr_socket_stub = nullptr;
  MAXI4_transactor_initiator_rd_socket_stub = nullptr;

}

void bd_f29c_M00_AXI_nsu_0::before_end_of_elaboration()
{
  // configure 'MAXI4' transactor
  if (xsc::utils::xsc_sim_manager::getInstanceParameterInt("bd_f29c_M00_AXI_nsu_0", "MAXI4_TLM_MODE") != 1)
  {
    mp_impl->MAXI4_rd_socket->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_impl->MAXI4_wr_socket->bind(*(mp_MAXI4_transactor->wr_socket));
  
  }
  else
  {
    MAXI4_transactor_initiator_wr_socket_stub = new xtlm::xtlm_aximm_initiator_stub("wr_socket",0);
    MAXI4_transactor_initiator_wr_socket_stub->bind(*(mp_MAXI4_transactor->wr_socket));
    MAXI4_transactor_initiator_rd_socket_stub = new xtlm::xtlm_aximm_initiator_stub("rd_socket",0);
    MAXI4_transactor_initiator_rd_socket_stub->bind(*(mp_MAXI4_transactor->rd_socket));
    mp_MAXI4_transactor->disable_transactor();
  }

}

#endif // MTI_SYSTEMC




bd_f29c_M00_AXI_nsu_0::~bd_f29c_M00_AXI_nsu_0()
{
  delete mp_MAXI4_transactor;
  delete mp_IF_NOC_AXI_ARLOCK_converter;
  delete mp_IF_NOC_AXI_AWLOCK_converter;
  delete mp_IF_NOC_AXI_RLAST_converter;
  delete mp_IF_NOC_AXI_WLAST_converter;

}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(bd_f29c_M00_AXI_nsu_0);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(bd_f29c_M00_AXI_nsu_0);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(bd_f29c_M00_AXI_nsu_0);
SC_REGISTER_BV(182);
#endif

