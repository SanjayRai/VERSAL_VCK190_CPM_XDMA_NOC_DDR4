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

#include "bd_f29c_M00_AXI_nsu_0_core.h"

#include <map>
#include <string>

bd_f29c_M00_AXI_nsu_0_sc::bd_f29c_M00_AXI_nsu_0_sc(const sc_core::sc_module_name& nm) : sc_core::sc_module(nm), mp_impl(NULL)
{
  // configure connectivity manager
  xsc::utils::xsc_sim_manager::addInstance("bd_f29c_M00_AXI_nsu_0", this);

  // initialize module
    xsc::common_cpp::properties model_param_props;
    model_param_props.addLong("C_SPP_NOCNSU_TO_CORE_WIDTH", "2000");
    model_param_props.addLong("C_SPP_NOCNSU_FROM_CORE_WIDTH", "2000");
    model_param_props.addString("C_XDEVICE", "xcvc1902");
    model_param_props.addString("HDL_ATTR_FILE", "nocattrs.dat");
    model_param_props.addString("HDL_COMPONENT_NAME", "bd_f29c_M00_AXI_nsu_0");
    model_param_props.addString("PHYS_NAME", "NOC_NSU512_X0Y0");
    model_param_props.addBitString("REG_AXI_LOOPBACK", "00", 2);
    model_param_props.addBitString("REG_COMP_ID_INDEX0", "00000", 5);
    model_param_props.addBitString("REG_COMP_ID_INDEX1", "00001", 5);
    model_param_props.addBitString("REG_COMP_ID_MODE", "0", 1);
    model_param_props.addBitString("REG_DISABLE_EX_MON", "1", 1);
    model_param_props.addBitString("REG_DWIDTH", "010", 3);
    model_param_props.addBitString("REG_ECC_CHK_EN", "1", 1);
    model_param_props.addBitString("REG_FIXED_COMP_ID", "00", 2);
    model_param_props.addBitString("REG_MODE_SELECT", "00", 2);
    model_param_props.addBitString("REG_ODISABLE_AXI_RESP", "0", 1);
    model_param_props.addBitString("REG_OUTSTANDING_RD_TXN", "100000", 6);
    model_param_props.addBitString("REG_OUTSTANDING_WR_TXN", "100000", 6);
    model_param_props.addBitString("REG_PAR_CHK", "00", 2);
    model_param_props.addBitString("REG_RDTRK_VCA_TOKEN0", "00010000", 8);
    model_param_props.addBitString("REG_RDTRK_VCA_TOKEN1", "00010000", 8);
    model_param_props.addBitString("REG_RD_REQ_VC_MAP0", "100", 3);
    model_param_props.addBitString("REG_RD_REQ_VC_MAP1", "000", 3);
    model_param_props.addBitString("REG_RD_RESP_VC_MAP0", "110", 3);
    model_param_props.addBitString("REG_RD_RESP_VC_MAP1", "010", 3);
    model_param_props.addBitString("REG_RD_VCA_TOKEN0", "00010000", 8);
    model_param_props.addBitString("REG_RD_VCA_TOKEN1", "00010000", 8);
    model_param_props.addBitString("REG_SRC", "000000000000", 12);
    model_param_props.addBitString("REG_TBASE_AXI_TIMEOUT", "0010", 4);
    model_param_props.addBitString("REG_TBASE_TRK_TIMEOUT", "0010", 4);
    model_param_props.addBitString("REG_VMAP_OUT_RD_TOKEN0", "00010000", 8);
    model_param_props.addBitString("REG_VMAP_OUT_RD_TOKEN1", "00010000", 8);
    model_param_props.addBitString("REG_VMAP_OUT_WR_TOKEN0", "00010000", 8);
    model_param_props.addBitString("REG_VMAP_OUT_WR_TOKEN1", "00010000", 8);
    model_param_props.addBitString("REG_WRTRK_VCA_TOKEN0", "00010000", 8);
    model_param_props.addBitString("REG_WRTRK_VCA_TOKEN1", "00010000", 8);
    model_param_props.addBitString("REG_WR_REQ_VC_MAP0", "101", 3);
    model_param_props.addBitString("REG_WR_REQ_VC_MAP1", "001", 3);
    model_param_props.addBitString("REG_WR_RESP_VC_MAP0", "111", 3);
    model_param_props.addBitString("REG_WR_RESP_VC_MAP1", "011", 3);
    model_param_props.addBitString("REG_WR_VCA_TOKEN0", "00010000", 8);
    model_param_props.addBitString("REG_WR_VCA_TOKEN1", "00010000", 8);

  mp_impl = new bd_f29c_M00_AXI_nsu_0_core("inst", model_param_props);

  // initialize AXI sockets
  MAXI4_rd_socket = mp_impl->MAXI4_rd_socket;
  MAXI4_wr_socket = mp_impl->MAXI4_wr_socket;
}

bd_f29c_M00_AXI_nsu_0_sc::~bd_f29c_M00_AXI_nsu_0_sc()
{
  xsc::utils::xsc_sim_manager::clean();

  delete mp_impl;
}

