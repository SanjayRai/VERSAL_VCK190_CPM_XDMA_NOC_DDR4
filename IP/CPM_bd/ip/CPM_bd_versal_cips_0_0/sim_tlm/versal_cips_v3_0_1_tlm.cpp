 
 
// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
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


#include "versal_cips_v3_0_1_tlm.h"

/***************************************************************************************
*   Global method, get registered with tlm2xtlm bridge
*   This function is called when tlm2xtlm bridge convert tlm payload to xtlm payload.
*
*   caller:     tlm2xtlm bridge
*   purpose:    To get master id and other parameters out of genattr_extension
*               and use master id to AxUSER PIN of xtlm payload.
*
*
***************************************************************************************/
void get_extensions_from_tlm(xtlm::aximm_payload* xtlm_pay, const tlm::tlm_generic_payload* gp)
{
    if((xtlm_pay == NULL) || (gp == NULL))
        return;
    if((gp->get_command() == tlm::TLM_WRITE_COMMAND) && (xtlm_pay->get_awuser_size() > 0))
    {
  genattr_extension* ext = NULL;
  gp->get_extension(ext);
        if(ext == NULL)
            return;
  //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
  uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_awuser_ptr();
    unsigned int size  = xtlm_pay->get_awuser_size();
    *ptr = (unsigned char)val;

    }
    else if((gp->get_command() == tlm::TLM_READ_COMMAND) && (xtlm_pay->get_aruser_size() > 0))
    {
        genattr_extension* ext = NULL;
        gp->get_extension(ext);
        if(ext == NULL)
            return;
        //Portion of master ID(master_id[5:0]) are transfered on AxUSER bits(refere Zynq UltraScale+ TRM page.no:414)
        uint32_t val = ext->get_master_id() && 0x3F;
    unsigned char* ptr = xtlm_pay->get_aruser_ptr();
    unsigned int size  = xtlm_pay->get_aruser_size();
    *ptr = (unsigned char)val;
  }
}

/***************************************************************************************
*   Global method, get registered with xtlm2tlm bridge
*   This function is called when xtlm2tlm bridge convert xtlm payload to tlm payload.
*
*   caller:     xtlm2tlm bridge
*   purpose:    To create and add master id and other parameters to genattr_extension.
*               Master id red from AxID PIN of xtlm payload.
*
*
***************************************************************************************/
void add_extensions_to_tlm(const xtlm::aximm_payload* xtlm_pay, tlm::tlm_generic_payload* gp)
{
    if(gp == NULL)
        return;
  uint8_t val = 0;
    if((gp->get_command() != tlm::TLM_WRITE_COMMAND) && (gp->get_command() != tlm::TLM_READ_COMMAND))
        return;
  //portion of master ID bits(master_id[5:0]) are derived from the AXI ID(AWID/ARID). (refere Zynq UltraScale+ TRM page.no:414,415)
  val = ((uint8_t)(xtlm_pay->get_axi_id())) && 0x3F;
  genattr_extension* ext = new genattr_extension;
  ext->set_master_id(val);
  gp->set_extension(ext);
  gp->set_streaming_width(gp->get_data_length());
  if(gp->get_command() != tlm::TLM_WRITE_COMMAND)
  {
    gp->set_byte_enable_length(0);
    gp->set_byte_enable_ptr(0);
  }
}

/*
template<int INIT_WIDTH, int TARGET_WIDTH>
class tlm_width_conversion :public sc_module {
  public:
    tlm_utils::simple_initiator_socket<tlm_width_conversion<INIT_WIDTH,TARGET_WIDTH>, INIT_WIDTH> initsock;
    tlm_utils::simple_target_socket<tlm_width_conversion<INIT_WIDTH,TARGET_WIDTH>, TARGET_WIDTH> tarsock;
    tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>(sc_module_name name):sc_module(name){
        tarsock.register_b_transport(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::b_transport);
        tarsock.register_get_direct_mem_ptr(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::get_direct_mem_ptr);
        tarsock.register_transport_dbg(this, &tlm_width_conversion<INIT_WIDTH, TARGET_WIDTH>::transport_dbg);
    }
    private:
    void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay){
        initsock->b_transport(trans, delay);
    }
    unsigned int transport_dbg(tlm::tlm_generic_payload& trans){
        return initsock->transport_dbg(trans);
    }
    bool get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data){
        return initsock->get_direct_mem_ptr(trans, dmi_data);
    }
};
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
// File:            versal_cips_v3_0_tlm.cpp                                                                         //
//                                                                                                              //
// Description:     versal_cips_v3_0_1_tlm class is a sc_module, act as intermediate layer between                     //
//                  xilinx_zynqmp qemu wrapper and Vivado generated systemc simulation ip wrapper.              //
//                  it's basically created for supporting tlm based xilinx_zynqmp from xtlm based vivado        //
//                  generated systemc wrapper. this wrapper is live only when SELECTED_SIM_MODEL is set         //
//                  to tlm. it's also act as bridge between vivado wrapper and xilinx_zynqmp wrapper.           //
//                  it fill the the gap between input/output ports of vivado generated wrapper to               //
//                  xilinx_zynqmp wrapper signals. This wrapper is auto generated by ttcl scripts               //
//                  based on IP configuration in vivado.                                                        //
//                                                                                                              //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//TODO update clk with original freq from PARAM
//constructor having three paramters
// 1. module name in sc_module_name objec,
// 2. reference to map object of name and integer value pairs
// 3. reference to map object of name and string value pairs
// All the model parameters (integer and string) which are configuration parameters
// of ZynqUltraScale+ IP propogated from Vivado
versal_cips_v3_0_1_tlm :: versal_cips_v3_0_1_tlm (sc_core::sc_module_name name,
  xsc::common_cpp::properties model_param_props) : sc_module(name) //registering module name with parent
        ,noc_cpm_pcie_axi0_clk("noc_cpm_pcie_axi0_clk")
        ,cpm_pcie_noc_axi0_clk("cpm_pcie_noc_axi0_clk")
        ,cpm_pcie_noc_axi1_clk("cpm_pcie_noc_axi1_clk")
    ,dummy_noc_pcie_sig("dummy_noc_pcie_sig")
    ,dummy_usr_irq_req("dummy_usr_irq_req")
    ,dummy_usr_irq_ack("dummy_usr_irq_ack")
{
  //  Start versal_cips_v3_0_1_tlm()
  //creating instances of xtlm slave sockets
  //initializing input clocks and pointers to NULL of sim_qdma when ps_noc_pcie IF is enabled..
  m_sim_qdma_ptr = NULL;
  sim_qdma_interconnect = NULL;
NOC_CPM_PCIE_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_target_socket("NOC_CPM_PCIE_0_tlm_aximm_write_socket",128);
NOC_CPM_PCIE_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_target_socket("NOC_CPM_PCIE_0_tlm_aximm_read_socket",128);
       aximm_slave_stub.push_back(new xtlm::xtlm_aximm_target_stub("NOC_CPM_PCIE_0_wr_stub", 128));                
NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(aximm_slave_stub.back()->target_socket);        
       aximm_slave_stub.push_back(new xtlm::xtlm_aximm_target_stub("NOC_CPM_PCIE_0_rd_stub", 128));                
NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(aximm_slave_stub.back()->target_socket);        
CPM_PCIE_NOC_0_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_0_tlm_aximm_write_socket",128 );
CPM_PCIE_NOC_0_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_0_tlm_aximm_read_socket",128 );
        aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_0_wr_stub", 128));                
        aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_0_tlm_aximm_write_socket); 
        aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_0_rd_stub", 128));                
        aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_0_tlm_aximm_read_socket); 
CPM_PCIE_NOC_1_tlm_aximm_write_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_1_tlm_aximm_write_socket",128 );
CPM_PCIE_NOC_1_tlm_aximm_read_socket = new xtlm::xtlm_aximm_initiator_socket("CPM_PCIE_NOC_1_tlm_aximm_read_socket",128 );
        aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_1_wr_stub", 128));                
        aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_1_tlm_aximm_write_socket); 
        aximm_master_stub.push_back(new xtlm::xtlm_aximm_initiator_stub("CPM_PCIE_NOC_1_rd_stub", 128));                
        aximm_master_stub.back()->initiator_socket(*CPM_PCIE_NOC_1_tlm_aximm_read_socket); 

        //Adding AXIMM/AXIS interfaces here
  
  char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
  char* skt_name;
  if(tcpip_addr == NULL) {
      skt_name = NULL;
  } else {
      skt_name = strdup(tcpip_addr);
  }
  m_zynq3_tlm_model = new xilinx_versal("xilinx_versal",skt_name);

  //quantumkeeper value update
  char* qk_value = getenv("TLM_QUANTUM_IN_PS");
  if(qk_value != NULL) {
      double value = atof(qk_value);
      m_zynq3_tlm_model->m_qk.set_global_quantum(sc_core::sc_time(value,SC_PS));
  } else {
      m_zynq3_tlm_model->m_qk.set_global_quantum(sc_core::sc_time(20,SC_NS));
  }
  m_zynq3_tlm_model->m_qk.reset();

  m_xtlm2tlm = new xtlm::xaximm_xtlm2tlm*[11];//for slave interfaces of zynq3 -- 11 slave interfaces are exist
  for(int index = 0; index < 11; index++) {
      m_xtlm2tlm[index] = NULL;
  }


  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_pcie_0 initiator socket of zynqmp Qemu tlm wrapper to FPD_AXI_NOC_0_tlm_aximm_write_socket/rd_socket sockets
  enable_sim_qdma();

  //instantiating TLM2XTLM bridge and stiching it between
  //if_ps_noc_pcie_1 initiator socket of zynqmp Qemu tlm wrapper to FPD_AXI_NOC_1_tlm_aximm_write_socket/rd_socket sockets
  m_rp_bridge_CPM_PCIE_NOC_1.clk(cpm_pcie_noc_axi1_clk);
  m_rp_bridge_CPM_PCIE_NOC_1.wr_socket.bind(*CPM_PCIE_NOC_1_tlm_aximm_write_socket);
  m_rp_bridge_CPM_PCIE_NOC_1.rd_socket.bind(*CPM_PCIE_NOC_1_tlm_aximm_read_socket);
  m_rp_bridge_CPM_PCIE_NOC_1.target_socket.bind(*m_zynq3_tlm_model->cpm_pcie_noc_1);

  m_zynq3_tlm_model->tie_off();

  SC_METHOD(pl_ps_irq_method);
  dont_initialize();



  m_zynq3_tlm_model->rst(qemu_rst);

  //initializing input clocks of sim_qdma when ps_noc_pcie IF is enabled..
  if(m_sim_qdma_ptr != NULL){
      m_sim_qdma_ptr->m_aximm_aclk.bind(pmc_noc_clk);
      m_sim_qdma_ptr->m_axictrl_aclk.bind(pmc_noc_clk);
  }
  SC_METHOD(trigger_ps_noc_pcie_axi0_clk_pin);
  sensitive << pmc_noc_clk;
  dont_initialize();
  //  End versal_cips_v3_0_1_tlm()
}

versal_cips_v3_0_1_tlm :: ~versal_cips_v3_0_1_tlm() {
  //deleting dynamically created objects
    delete NOC_CPM_PCIE_0_tlm_aximm_write_socket;
    delete NOC_CPM_PCIE_0_tlm_aximm_read_socket;
NOC_CPM_PCIE_0_tlm_aximm_write_socket = NULL;
NOC_CPM_PCIE_0_tlm_aximm_read_socket = NULL;
    delete CPM_PCIE_NOC_0_tlm_aximm_write_socket;
    delete CPM_PCIE_NOC_0_tlm_aximm_read_socket;
CPM_PCIE_NOC_0_tlm_aximm_write_socket = NULL;
CPM_PCIE_NOC_0_tlm_aximm_read_socket = NULL;
    delete CPM_PCIE_NOC_1_tlm_aximm_write_socket;
    delete CPM_PCIE_NOC_1_tlm_aximm_read_socket;
CPM_PCIE_NOC_1_tlm_aximm_write_socket = NULL;
CPM_PCIE_NOC_1_tlm_aximm_read_socket = NULL;

    for (int index = 0; index < 11; index++) {
        if(m_xtlm2tlm[index] != NULL) {
            delete m_xtlm2tlm[index];
            m_xtlm2tlm[index] = NULL;
        }
    }
    if(m_xtlm2tlm != NULL){
        delete[] m_xtlm2tlm;
    }

  //deleting the thread object, RdWrTCPSocket and rwd_tlmmodel
  if(m_sim_qdma_ptr != NULL){
    delete m_sim_qdma_ptr;
    m_sim_qdma_ptr = NULL;
  }
  if(sim_qdma_interconnect != NULL){
    delete sim_qdma_interconnect;
    sim_qdma_interconnect = NULL;
  }
}

//TODO: use of proper clock freq..
void versal_cips_v3_0_1_tlm :: trigger_ps_noc_pcie_axi0_clk_pin() {
  cpm_pcie_noc_axi0_clk.write(pmc_noc_clk.read());
  noc_cpm_pcie_axi0_clk.write(pmc_noc_clk.read());
}


void versal_cips_v3_0_1_tlm :: pl_ps_irq_method() {
}

void versal_cips_v3_0_1_tlm :: start_of_simulation()
{
  qemu_rst.write(false);
  char* tcpip_addr = getenv("COSIM_MACHINE_TCPIP_ADDRESS");
  if(tcpip_addr == NULL) {
      std::cerr << "\n\n############################################################## \n#\n"
                << " #  Simulation doesnot work as Versal CIPS Emulation (SELECTED_SIM_MODLE=tlm) only works with Vitis tool(launch_emulator tool in Vitis)"
                << "\n#\n##############################################################\n\n";
      exit(0);
  }
}
void versal_cips_v3_0_1_tlm :: rwd_tlmmodule_init() {
}

void versal_cips_v3_0_1_tlm :: enable_sim_qdma() {
  xsc::common_cpp::properties model_param_props;
  model_param_props.addBool("C_M_AXIMM_1_ENABLE", "true");
  model_param_props.addBool("C_M_AXIMM_2_ENABLE", "false");
  model_param_props.addLong("C_M_AXIMM_2_BURST_LEN","16");
  model_param_props.addLong("C_M_AXIMM_2_ID_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_ADDR_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_2_DATA_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_2_AWUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_ARUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_WUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_RUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_2_BUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_BURST_LEN", "16");
  model_param_props.addLong("C_M_AXIMM_1_ID_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_ADDR_WIDTH", "38");
  model_param_props.addLong("C_M_AXIMM_1_DATA_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_1_AWUSER_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_1_ARUSER_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_1_WUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_RUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_1_BUSER_WIDTH", "1");
  model_param_props.addLong("C_M_AXICTRL_ADDR_WIDTH", "64");
  std::string ctrl_data_width = std::to_string(0);
  model_param_props.addLong("C_M_AXICTRL_DATA_WIDTH", ctrl_data_width.c_str());
  model_param_props.addLong("C_M_AXICTRL_TRANSACTIONS_NUM", "4");
  model_param_props.addLong("C_M_AXIMM_BURST_LEN", "16");
  model_param_props.addLong("C_M_AXIMM_ID_WIDTH", "1");
  model_param_props.addLong("C_M_AXIMM_ADDR_WIDTH", "64");
  std::string mm_data_width = std::to_string(128);
  model_param_props.addLong("C_M_AXIMM_DATA_WIDTH", mm_data_width.c_str());
  model_param_props.addLong("C_M_AXIMM_AWUSER_WIDTH", "32");
  model_param_props.addLong("C_M_AXIMM_ARUSER_WIDTH","32");
  model_param_props.addLong("C_M_AXIMM_WUSER_WIDTH","1");
  model_param_props.addLong("C_M_AXIMM_RUSER_WIDTH","1");
  model_param_props.addLong("C_M_AXIMM_BUSER_WIDTH","1");
  model_param_props.addBitString("C_M_AXIMM_2_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXIMM_1_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXICTRL_START_DATA_VALUE", "10101010000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXICTRL_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBitString("C_M_AXIMM_TARGET_SLAVE_BASE_ADDR", "01000000000000000000000000000000",32);
  model_param_props.addBool("C_M_AXIMM_AUX_ENABLE", "false");
  model_param_props.addBool("C_STM_ITF_ENABLE", "false");
  model_param_props.addBool("C_S_AXIMM_ENABLE", "true");
  model_param_props.addLong("C_S_AXIMM_ADDR_WIDTH","64");
  model_param_props.addLong("C_S_AXIMM_WDATA_WIDTH","128");
  model_param_props.addLong("C_M_AXIMM_AUX_ADDR_WIDTH","32");
  model_param_props.addLong("C_M_AXIMM_AUX_DATA_WIDTH", "32");
  model_param_props.addLong("C_M_AXIS_TDATA_WIDTH", "32");
  model_param_props.addLong("C_S_AXIS_TDATA_WIDTH", "32");
  m_sim_qdma_ptr = new sim_qdma("sim_qdma", model_param_props);
  dummy_noc_pcie_sig.write(true);
  m_sim_qdma_ptr->m_aximm_aresetn.bind(dummy_noc_pcie_sig);
  m_sim_qdma_ptr->m_axictrl_aresetn.bind(dummy_noc_pcie_sig);
  m_sim_qdma_ptr->usr_irq_req(dummy_usr_irq_req);
  m_sim_qdma_ptr->usr_irq_ack(dummy_usr_irq_ack);

  xsc::common_cpp::properties imp_prop;
  imp_prop.addLong("C_NUM_SI","2");
  imp_prop.addLong("C_NUM_MI","1");
  imp_prop.addLong("C_ADDR_RANGES","1");

  std::string width = std::to_string(0);
  imp_prop.addLong("C_M00_AXI_DATA_WIDTH",width.c_str());
  imp_prop.addLong("C_M00_AXI_ADDR_WIDTH","64");
  imp_prop.addLong("C_M00_A00_BASE_ADDRESS","0x0");
  imp_prop.addLong("C_M00_A00_ADDR_RANGE","0xFFFFFFFFFFFFFFFF");

  imp_prop.addLong("C_S00_AXI_DATA_WIDTH",width.c_str());
  imp_prop.addLong("C_S00_AXI_ADDR_WIDTH","64");
  imp_prop.addLong("C_S01_AXI_DATA_WIDTH",width.c_str());
  imp_prop.addLong("C_S01_AXI_ADDR_WIDTH","64");

  imp_prop.addLong("C_M00_S00_CONNECTIVITY","1");
  imp_prop.addLong("C_M00_S01_CONNECTIVITY","1");
  sim_qdma_interconnect = new xtlm_simple_interconnect_model("SIM_XDMA_interconnect",imp_prop);
  sim_qdma_interconnect->initiator_wr_sockets[0]->bind(*CPM_PCIE_NOC_0_tlm_aximm_write_socket);
  sim_qdma_interconnect->initiator_rd_sockets[0]->bind(*CPM_PCIE_NOC_0_tlm_aximm_read_socket);
  m_sim_qdma_ptr->initiator_ctrl_rd_socket->bind(*sim_qdma_interconnect->target_rd_sockets[1]);
  m_sim_qdma_ptr->initiator_ctrl_wr_socket->bind(*sim_qdma_interconnect->target_wr_sockets[1]);
  m_sim_qdma_ptr->initiator_mm_wr_socket->bind(*sim_qdma_interconnect->target_wr_sockets[0]);
  m_sim_qdma_ptr->initiator_mm_rd_socket->bind(*sim_qdma_interconnect->target_rd_sockets[0]);

  NOC_CPM_PCIE_0_tlm_aximm_write_socket->bind(*m_sim_qdma_ptr->target_mm_wr_socket);
  NOC_CPM_PCIE_0_tlm_aximm_read_socket->bind(*m_sim_qdma_ptr->target_mm_rd_socket);
  m_sim_qdma_ptr->s_aximm_aresetn.bind(dummy_noc_pcie_sig);
  m_sim_qdma_ptr->s_aximm_aclk.bind(noc_cpm_pcie_axi0_clk);

}
template <int IN_WIDTH, int OUT_WIDTH>
rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::rptlm2xtlm_converter(sc_module_name name):sc_module(name)
  ,target_socket("target_socket")
  ,wr_socket("init_wr_socket",OUT_WIDTH)
  ,rd_socket("init_rd_socket",OUT_WIDTH)
  ,m_btrans_conv("b_transport_converter")
  ,xtlm_bridge("tlm2xtlmbridge")
{
  target_socket.bind(m_btrans_conv.target_socket);
  m_btrans_conv.initiator_socket.bind(xtlm_bridge.target_socket);
  xtlm_bridge.rd_socket->bind(rd_socket);
  xtlm_bridge.wr_socket->bind(wr_socket);
}
template <int IN_WIDTH, int OUT_WIDTH>
void rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::registerUserExtensionHandlerCallback(
  void (*callback)(xtlm::aximm_payload*,
    const tlm::tlm_generic_payload*)) {
  xtlm_bridge.registerUserExtensionHandlerCallback(callback);
}
template <int IN_WIDTH, int OUT_WIDTH>
void rptlm2xtlm_converter<IN_WIDTH, OUT_WIDTH>::before_end_of_elaboration() {
  m_btrans_conv.clk(clk);
}
