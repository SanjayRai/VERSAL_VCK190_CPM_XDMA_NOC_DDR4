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


#include "bd_f29c_S01_AXI_nmu_0_sc.h"

#include "bd_f29c_S01_AXI_nmu_0_core.h"

#include <map>
#include <string>

bd_f29c_S01_AXI_nmu_0_sc::bd_f29c_S01_AXI_nmu_0_sc(const sc_core::sc_module_name& nm) : sc_core::sc_module(nm), mp_impl(NULL)
{
  // configure connectivity manager
  xsc::utils::xsc_sim_manager::addInstance("bd_f29c_S01_AXI_nmu_0", this);

  // initialize module
    xsc::common_cpp::properties model_param_props;
    model_param_props.addLong("C_SPP_NOCNMU_TO_CORE_WIDTH", "2000");
    model_param_props.addLong("C_SPP_NOCNMU_FROM_CORE_WIDTH", "200");
    model_param_props.addString("C_XDEVICE", "xcvc1902");
    model_param_props.addString("HDL_ATTR_FILE", "nocattrs.dat");
    model_param_props.addString("HDL_COMPONENT_NAME", "bd_f29c_S01_AXI_nmu_0");
    model_param_props.addString("PHYS_NAME", "NOC_NMU128_X0Y1");
    model_param_props.addBitString("REG_ADDR_DST0", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST1", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST10", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST11", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST12", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST13", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST14", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST15", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST2", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST3", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST4", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST5", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST6", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST7", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST8", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_DST9", "0000000000000000", 16);
    model_param_props.addBitString("REG_ADDR_ENABLE", "0000000000000001", 16);
    model_param_props.addBitString("REG_ADDR_MADDR0", "00000010000000010000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR1", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR10", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR11", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR12", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR13", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR14", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR15", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR2", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR3", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR4", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR5", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR6", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR7", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR8", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MADDR9", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK0", "11111111111111111111111111111111", 32);
    model_param_props.addBitString("REG_ADDR_MASK1", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK10", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK11", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK12", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK13", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK14", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK15", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK2", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK3", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK4", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK5", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK6", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK7", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK8", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_MASK9", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_REMAP", "0000000000000001", 16);
    model_param_props.addBitString("REG_ADDR_RPADDR0", "00000010000000010000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR1", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR10", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR11", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR12", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR13", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR14", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR15", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR2", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR3", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR4", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR5", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR6", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR7", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR8", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADDR_RPADDR9", "00000000000000000000000000000000", 32);
    model_param_props.addBitString("REG_ADR_MAP_CPM", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_FPD_AFI_0", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_FPD_AFI_1", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_LPD_AFI_FS", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_ME_ARRAY_0", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_ME_ARRAY_1", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_ME_ARRAY_2", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_ME_ARRAY_3", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_PCIE", "000001000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_PMC", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_PMC_ALIAS_0", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_PMC_ALIAS_1", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_PMC_ALIAS_2", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_PMC_ALIAS_3", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_QSPI", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_STM_GIC", "111111000000", 12);
    model_param_props.addBitString("REG_ADR_MAP_XPDS", "111111000000", 12);
    model_param_props.addBitString("REG_AXI_NON_MOD_DISABLE", "0", 1);
    model_param_props.addBitString("REG_AXI_PAR_CHK", "00", 2);
    model_param_props.addBitString("REG_CHOPSIZE", "1010", 4);
    model_param_props.addBitString("REG_DDR_ADR_MAP0", "110000000000000", 15);
    model_param_props.addBitString("REG_DDR_ADR_MAP1", "001111111111111", 15);
    model_param_props.addBitString("REG_DDR_ADR_MAP2", "001111111111111", 15);
    model_param_props.addBitString("REG_DDR_ADR_MAP3", "001111111111111", 15);
    model_param_props.addBitString("REG_DDR_ADR_MAP4", "001111111111111", 15);
    model_param_props.addBitString("REG_DDR_ADR_MAP5", "001111111111111", 15);
    model_param_props.addBitString("REG_DDR_ADR_MAP6", "001111111111111", 15);
    model_param_props.addBitString("REG_DDR_DST_MAP0", "000100000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP1", "111111000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP2", "111111000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP3", "111111000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP4", "111111000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP5", "111111000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP6", "111111000000", 12);
    model_param_props.addBitString("REG_DDR_DST_MAP7", "111111000000", 12);
    model_param_props.addBitString("REG_DWIDTH", "100", 3);
    model_param_props.addBitString("REG_ECC_CHK_EN", "1", 1);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH0", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH1", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH10", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH11", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH12", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH13", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH14", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH15", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH2", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH3", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH4", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH5", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH6", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH7", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH8", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T0_CH9", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH0", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH1", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH10", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH11", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH12", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH13", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH14", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH15", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH2", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH3", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH4", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH5", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH6", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH7", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH8", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T1_CH9", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH0", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH1", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH10", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH11", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH12", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH13", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH14", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH15", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH2", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH3", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH4", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH5", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH6", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH7", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH8", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T2_CH9", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH0", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH1", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH10", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH11", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH12", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH13", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH14", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH15", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH2", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH3", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH4", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH5", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH6", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH7", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH8", "111111000000", 12);
    model_param_props.addBitString("REG_HBM_MAP_T3_CH9", "111111000000", 12);
    model_param_props.addBitString("REG_MODE_SELECT", "0000000000000000", 16);
    model_param_props.addBitString("REG_OUTSTANDING_RD_TXN", "1000000", 7);
    model_param_props.addBitString("REG_OUTSTANDING_WR_TXN", "1000000", 7);
    model_param_props.addBitString("REG_PRIORITY", "00", 2);
    model_param_props.addBitString("REG_RD_AXPROT_SEL", "000000", 6);
    model_param_props.addBitString("REG_RD_RATE_CREDIT_DROP", "0000000100", 10);
    model_param_props.addBitString("REG_RD_RATE_CREDIT_LIMIT", "0000100000000", 13);
    model_param_props.addBitString("REG_RD_VCA_TOKEN0", "00110011", 8);
    model_param_props.addBitString("REG_RPOISON_TO_SLVERR", "0", 1);
    model_param_props.addBitString("REG_RROB_RAM_SETTING", "000010010", 9);
    model_param_props.addBitString("REG_SMID_SEL", "00000000000000000000", 20);
    model_param_props.addBitString("REG_SRC", "000011000000", 12);
    model_param_props.addBitString("REG_TBASE_AXI_TIMEOUT", "001", 3);
    model_param_props.addBitString("REG_TBASE_MODE_RLIMIT_RD", "010", 3);
    model_param_props.addBitString("REG_TBASE_MODE_RLIMIT_WR", "010", 3);
    model_param_props.addBitString("REG_TBASE_TRK_TIMEOUT", "001", 3);
    model_param_props.addBitString("REG_VC_MAP", "111110101100", 12);
    model_param_props.addBitString("REG_WBUF_LAUNCH_SIZE", "010000", 6);
    model_param_props.addBitString("REG_WBUF_RAM_SETTING", "000010010", 9);
    model_param_props.addBitString("REG_WR_AXPROT_SEL", "000000", 6);
    model_param_props.addBitString("REG_WR_RATE_CREDIT_DROP", "0000000100", 10);
    model_param_props.addBitString("REG_WR_RATE_CREDIT_LIMIT", "0000100000000", 13);
    model_param_props.addBitString("REG_WR_VCA_TOKEN0", "11111111", 8);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID0", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID1", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID2", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID3", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID4", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID5", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID6", "00000000000000", 14);
    model_param_props.addBitString("REG_ADR_MAP_USER_ID7", "00000000000000", 14);
    model_param_props.addBitString("REG_QOS", "00000000", 8);
    model_param_props.addBitString("REG_HPHY_MODE", "0", 1);

  mp_impl = new bd_f29c_S01_AXI_nmu_0_core("inst", model_param_props);

  // initialize AXI sockets
  SAXI4_rd_socket = mp_impl->SAXI4_rd_socket;
  SAXI4_wr_socket = mp_impl->SAXI4_wr_socket;
}

bd_f29c_S01_AXI_nmu_0_sc::~bd_f29c_S01_AXI_nmu_0_sc()
{
  xsc::utils::xsc_sim_manager::clean();

  delete mp_impl;
}

