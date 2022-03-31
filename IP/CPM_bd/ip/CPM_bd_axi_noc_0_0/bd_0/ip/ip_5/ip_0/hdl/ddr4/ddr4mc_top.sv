/******************************************************************************
// (c) Copyright 2013 - 2014 Xilinx, Inc. All rights reserved.
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
/******************************************************************************/
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 1.0
//  \   \         Application        : DDR4, LPDDR4
//  /   /         Filename           : ddrmc_top_v1_0.sv
// /___/   /\     Date Last Modified : $Date: 2016/03/07 $
// \   \  /  \    Date Created       : March 7 2016
//  \___\/\___\
//
// Device           : Versal
// Design Name      : MC (Memory Controller)
// Purpose          : Top 
// 
// Reference        :
// Revision History :
//*****************************************************************************
`timescale 1ps/1ps
`include "noc_na_v1_0_0_dc_common_define.vh"
`include "noc_na_v1_0_0_nsu_packet.sv"
`ifndef BFM_SIMULATION
`include "ddr4mc_monitor.sv"
`include "noc_mc_ddr4_v1_0_address_mapping_checks.sv"
`endif
`define MAIN_REGS_INST \
,.reg_safe_config0                         (reg_safe_config0                       ) \
,.reg_safe_config0_tccd_s_sr               (reg_safe_config0_tccd_s_sr             ) \
,.reg_safe_config0_tccd_l_sr               (reg_safe_config0_tccd_l_sr             ) \
,.reg_safe_config0_trrd_s                  (reg_safe_config0_trrd_s                ) \
,.reg_safe_config0_trrd_l                  (reg_safe_config0_trrd_l                ) \
,.reg_safe_config0_tfaw                    (reg_safe_config0_tfaw                  ) \
,.reg_safe_config1                         (reg_safe_config1                       ) \
,.reg_safe_config1_tcs_r2r_dr              (reg_safe_config1_tcs_r2r_dr            ) \
,.reg_safe_config1_tcs_r2r_sr_dlr          (reg_safe_config1_tcs_r2r_sr_dlr        ) \
,.reg_safe_config1_tcs_w2w_dr              (reg_safe_config1_tcs_w2w_dr            ) \
,.reg_safe_config1_tcs_w2w_sr_dlr          (reg_safe_config1_tcs_w2w_sr_dlr        ) \
,.reg_safe_config1_trrd_dlr                (reg_safe_config1_trrd_dlr              ) \
,.reg_safe_config2                         (reg_safe_config2                       ) \
,.reg_safe_config2_trcd                    (reg_safe_config2_trcd                  ) \
,.reg_safe_config2_trp                     (reg_safe_config2_trp                   ) \
,.reg_safe_config2_tras                    (reg_safe_config2_tras                  ) \
,.reg_safe_config2_trc                     (reg_safe_config2_trc                   ) \
,.reg_safe_config2_tfaw_dlr                (reg_safe_config2_tfaw_dlr              ) \
,.reg_safe_config3                         (reg_safe_config3                       ) \
,.reg_safe_config3_tcs_w2r_l_sr            (reg_safe_config3_tcs_w2r_l_sr          ) \
,.reg_safe_config3_tcs_w2r_s_sr            (reg_safe_config3_tcs_w2r_s_sr          ) \
,.reg_safe_config3_tcs_w2r_dr              (reg_safe_config3_tcs_w2r_dr            ) \
,.reg_safe_config3_tcs_w2r_sr_dlr          (reg_safe_config3_tcs_w2r_sr_dlr        ) \
,.reg_safe_config4                         (reg_safe_config4                       ) \
,.reg_safe_config4_trtp                    (reg_safe_config4_trtp                  ) \
,.reg_safe_config4_tcs_r2w_sr              (reg_safe_config4_tcs_r2w_sr            ) \
,.reg_safe_config4_tcs_r2w_dr              (reg_safe_config4_tcs_r2w_dr            ) \
,.reg_safe_config4_tcs_w2p                 (reg_safe_config4_tcs_w2p               ) \
,.reg_safe_config5                         (reg_safe_config5                       ) \
,.reg_safe_config5_cas_latency             (reg_safe_config5_cas_latency           ) \
,.reg_safe_config5_cwl                     (reg_safe_config5_cwl                   ) \
,.reg_safe_config5_trp_ab                  (reg_safe_config5_trp_ab                ) \
,.reg_safe_config5_tccdmw                  (reg_safe_config5_tccdmw                ) \
,.reg_safe_config5_add_cmd_delay           (reg_safe_config5_add_cmd_delay         ) \
,.reg_safe_config5_add_cmd_delay_en        (reg_safe_config5_add_cmd_delay_en      ) \
,.reg_safe_config6                         (reg_safe_config6                       ) \
,.reg_safe_config6_trefi                   (reg_safe_config6_trefi                 ) \
,.reg_safe_config7                         (reg_safe_config7                       ) \
,.reg_safe_config7_trfc_slr_ab             (reg_safe_config7_trfc_slr_ab           ) \
,.reg_safe_config7_trfc_dlr_pb             (reg_safe_config7_trfc_dlr_pb           ) \
,.reg_safe_config7_trfc_r2r                (reg_safe_config7_trfc_r2r              ) \
,.reg_safe_config8                         (reg_safe_config8                       ) \
,.reg_safe_config8_tzqcs                   (reg_safe_config8_tzqcs                 ) \
,.reg_ref_0                                (reg_ref_0                              ) \
,.reg_ref_0_refresh_speed                  (reg_ref_0_refresh_speed                ) \
,.reg_txn_config                           (reg_txn_config                         ) \
,.reg_wr_config                            (reg_wr_config                          ) \
,.reg_rd_config                            (reg_rd_config                          ) \
,.reg_rd_config_full_threshold             (reg_rd_config_full_threshold           ) \
,.reg_rd_config_iso_timeout                (reg_rd_config_iso_timeout              ) \
,.reg_rd_config_ll_timeout                 (reg_rd_config_ll_timeout               ) \
,.reg_pt_config                            (reg_pt_config                          ) \
,.reg_pt_config_page_policy                (reg_pt_config_page_policy              ) \
,.reg_pt_config_page_timer                 (reg_pt_config_page_timer               ) \
,.reg_dram_arb                             (reg_dram_arb                           ) \
,.reg_dram_arb_write_level_hi              (reg_dram_arb_write_level_hi            ) \
,.reg_dram_arb_write_level_lo              (reg_dram_arb_write_level_lo            ) \
,.reg_adec0                                (reg_adec0                              ) \
,.reg_adec0_low_mem_base                   (reg_adec0_low_mem_base                 ) \
,.reg_adec1                                (reg_adec1                              ) \
,.reg_adec1_low_mem_offset                 (reg_adec1_low_mem_offset               ) \
,.reg_adec2                                (reg_adec2                              ) \
,.reg_adec2_high_mem_base                  (reg_adec2_high_mem_base                ) \
,.reg_adec3                                (reg_adec3                              ) \
,.reg_adec3_high_mem_offset                (reg_adec3_high_mem_offset              ) \
,.reg_adec4                                (reg_adec4                              ) \
,.reg_adec4_rank_0                         (reg_adec4_rank_0                       ) \
,.reg_adec4_rank_1                         (reg_adec4_rank_1                       ) \
,.reg_adec4_lrank_0                        (reg_adec4_lrank_0                      ) \
,.reg_adec4_lrank_1                        (reg_adec4_lrank_1                      ) \
,.reg_adec4_lrank_2                        (reg_adec4_lrank_2                      ) \
,.reg_adec5                                (reg_adec5                              ) \
,.reg_adec5_row_4                          (reg_adec5_row_4                        ) \
,.reg_adec5_row_3                          (reg_adec5_row_3                        ) \
,.reg_adec5_row_2                          (reg_adec5_row_2                        ) \
,.reg_adec5_row_1                          (reg_adec5_row_1                        ) \
,.reg_adec5_row_0                          (reg_adec5_row_0                        ) \
,.reg_adec6                                (reg_adec6                              ) \
,.reg_adec6_row_9                          (reg_adec6_row_9                        ) \
,.reg_adec6_row_8                          (reg_adec6_row_8                        ) \
,.reg_adec6_row_7                          (reg_adec6_row_7                        ) \
,.reg_adec6_row_6                          (reg_adec6_row_6                        ) \
,.reg_adec6_row_5                          (reg_adec6_row_5                        ) \
,.reg_adec7                                (reg_adec7                              ) \
,.reg_adec7_row_14                         (reg_adec7_row_14                       ) \
,.reg_adec7_row_13                         (reg_adec7_row_13                       ) \
,.reg_adec7_row_12                         (reg_adec7_row_12                       ) \
,.reg_adec7_row_11                         (reg_adec7_row_11                       ) \
,.reg_adec7_row_10                         (reg_adec7_row_10                       ) \
,.reg_adec8                                (reg_adec8                              ) \
,.reg_adec8_col_0                          (reg_adec8_col_0                        ) \
,.reg_adec8_row_18                         (reg_adec8_row_18                       ) \
,.reg_adec8_row_17                         (reg_adec8_row_17                       ) \
,.reg_adec8_row_16                         (reg_adec8_row_16                       ) \
,.reg_adec8_row_15                         (reg_adec8_row_15                       ) \
,.reg_adec9                                (reg_adec9                              ) \
,.reg_adec9_col_5                          (reg_adec9_col_5                        ) \
,.reg_adec9_col_4                          (reg_adec9_col_4                        ) \
,.reg_adec9_col_3                          (reg_adec9_col_3                        ) \
,.reg_adec9_col_2                          (reg_adec9_col_2                        ) \
,.reg_adec9_col_1                          (reg_adec9_col_1                        ) \
,.reg_adec10                               (reg_adec10                             ) \
,.reg_adec10_bank_0                        (reg_adec10_bank_0                      ) \
,.reg_adec10_col_9                         (reg_adec10_col_9                       ) \
,.reg_adec10_col_8                         (reg_adec10_col_8                       ) \
,.reg_adec10_col_7                         (reg_adec10_col_7                       ) \
,.reg_adec10_col_6                         (reg_adec10_col_6                       ) \
,.reg_adec11                               (reg_adec11                             ) \
,.reg_adec11_ch_sel                        (reg_adec11_ch_sel                      ) \
,.reg_adec11_group_1                       (reg_adec11_group_1                     ) \
,.reg_adec11_group_0                       (reg_adec11_group_0                     ) \
,.reg_adec11_bank_1                        (reg_adec11_bank_1                      ) \
,.reg_pinout_ecc_encode_en                 (reg_pinout_ecc_encode_en               ) \
,.reg_config0_dm_en                        (reg_config0_dm_en                      ) \
,.reg_wr_config_txnq_wr_rd_pri_timer       (reg_wr_config_txnq_wr_rd_pri_timer     ) \
,.reg_wr_config_txnq_wr_top_timer          (reg_wr_config_txnq_wr_top_timer        ) \
,.txnq_rd_priority                         (txnq_rd_priority                       ) \
,.txnq_rd_priority_th_low                  (txnq_rd_priority_th_low                ) \
,.txnq_rd_priority_th_med                  (txnq_rd_priority_th_med                ) \
,.txnq_rd_priority_th_high                 (txnq_rd_priority_th_high               ) \
,.txnq_rd_priority_skip_count_en           (txnq_rd_priority_skip_count_en         ) \
,.txnq_rd_priority_only_read               (txnq_rd_priority_only_read             ) \
,.txnq_wr_priority                         (txnq_wr_priority                       ) \
,.txnq_wr_priority_th_low                  (txnq_wr_priority_th_low                ) \
,.txnq_wr_priority_th_med                  (txnq_wr_priority_th_med                ) \
,.txnq_wr_priority_th_high                 (txnq_wr_priority_th_high               ) \
,.txnq_wr_priority_skip_count_en           (txnq_wr_priority_skip_count_en         ) \
,.reg_retry_0                              (reg_retry_0                            ) \
,.reg_retry_0_rmw_fifo_dealloc_period      (reg_retry_0_rmw_fifo_dealloc_period    ) \
,.reg_retry_1                              (reg_retry_1                            ) \
,.reg_retry_1_retry_fifo_dealloc_period    (reg_retry_1_retry_fifo_dealloc_period  ) \
,.reg_retry_1_wr_fifo_dealloc_period       (reg_retry_1_wr_fifo_dealloc_period     ) \
,.reg_txn_config_txnq_rd_starved_timer                (reg_txn_config_txnq_rd_starved_timer                ) \
,.reg_txn_config_txnq_all_cmd_arb_mode                (reg_txn_config_txnq_all_cmd_arb_mode                ) \
,.reg_txn_config_txnq_rd_pri_arb_only_mode            (reg_txn_config_txnq_rd_pri_arb_only_mode            ) \
,.reg_txn_config_txnq_rd_pri_and_starved_arb_only_mode(reg_txn_config_txnq_rd_pri_and_starved_arb_only_mode) \
,.reg_txn_config_txnq_rd_pri_wr_pri_arb_only_mode     (reg_txn_config_txnq_rd_pri_wr_pri_arb_only_mode     ) \
,.reg_config2     (reg_config2     ) \
,.reg_config2_per_rd_en     (reg_config2_per_rd_en     ) \
,.reg_config2_per_rd_interval     (reg_config2_per_rd_interval) \
,.xpi_write_dm_dbi_config         (xpi_write_dm_dbi_config) \
,.xpi_read_dbi_en               (xpi_read_dbi_en) \

`define NOC_REGS_INST \
,.npi_reg_ddrmc_nsu_0_ing   (npi_reg_ddrmc_nsu_0_ing   ) \
,.npi_reg_ddrmc_nsu_0_egr   (npi_reg_ddrmc_nsu_0_egr   ) \
,.npi_reg_ddrmc_nsu_0_r_egr (npi_reg_ddrmc_nsu_0_r_egr ) \
,.npi_reg_ddrmc_nsu_0_w_egr (npi_reg_ddrmc_nsu_0_w_egr ) \
,.npi_reg_ddrmc_nsu_1_ing   (npi_reg_ddrmc_nsu_1_ing   ) \
,.npi_reg_ddrmc_nsu_1_egr   (npi_reg_ddrmc_nsu_1_egr   ) \
,.npi_reg_ddrmc_nsu_1_r_egr (npi_reg_ddrmc_nsu_1_r_egr ) \
,.npi_reg_ddrmc_nsu_1_w_egr (npi_reg_ddrmc_nsu_1_w_egr ) \
,.npi_reg_ddrmc_nsu_2_ing   (npi_reg_ddrmc_nsu_2_ing   ) \
,.npi_reg_ddrmc_nsu_2_egr   (npi_reg_ddrmc_nsu_2_egr   ) \
,.npi_reg_ddrmc_nsu_2_r_egr (npi_reg_ddrmc_nsu_2_r_egr ) \
,.npi_reg_ddrmc_nsu_2_w_egr (npi_reg_ddrmc_nsu_2_w_egr ) \
,.npi_reg_ddrmc_nsu_3_ing   (npi_reg_ddrmc_nsu_3_ing   ) \
,.npi_reg_ddrmc_nsu_3_egr   (npi_reg_ddrmc_nsu_3_egr   ) \
,.npi_reg_ddrmc_nsu_3_r_egr (npi_reg_ddrmc_nsu_3_r_egr ) \
,.npi_reg_ddrmc_nsu_3_w_egr (npi_reg_ddrmc_nsu_3_w_egr ) \
,.npi_reg_ddrmc_nsu_0_ing_ecc_chk_en      (npi_reg_ddrmc_nsu_0_ing_ecc_chk_en     ) \
,.npi_reg_ddrmc_nsu_0_ing_dbi_en      	  (npi_reg_ddrmc_nsu_0_ing_dbi_en     	  ) \
,.npi_reg_ddrmc_nsu_0_ing_llr_vc_map      (npi_reg_ddrmc_nsu_0_ing_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_0_ing_isor_vc_map     (npi_reg_ddrmc_nsu_0_ing_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_0_ing_ber_vc_map      (npi_reg_ddrmc_nsu_0_ing_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_0_ing_isow_vc_map     (npi_reg_ddrmc_nsu_0_ing_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_0_ing_bew_vc_map      (npi_reg_ddrmc_nsu_0_ing_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_0_ing_llr_vc_vld      (npi_reg_ddrmc_nsu_0_ing_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_0_ing_isor_vc_vld     (npi_reg_ddrmc_nsu_0_ing_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_0_ing_ber_vc_vld      (npi_reg_ddrmc_nsu_0_ing_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_0_egr_llr_vc_map      (npi_reg_ddrmc_nsu_0_egr_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_0_egr_isor_vc_map     (npi_reg_ddrmc_nsu_0_egr_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_0_egr_ber_vc_map      (npi_reg_ddrmc_nsu_0_egr_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_0_egr_isow_vc_map     (npi_reg_ddrmc_nsu_0_egr_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_0_egr_bew_vc_map      (npi_reg_ddrmc_nsu_0_egr_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_0_egr_llr_vc_vld      (npi_reg_ddrmc_nsu_0_egr_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_0_egr_isor_vc_vld     (npi_reg_ddrmc_nsu_0_egr_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_0_egr_ber_vc_vld      (npi_reg_ddrmc_nsu_0_egr_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_0_r_egr_llr_vc_pri    (npi_reg_ddrmc_nsu_0_r_egr_llr_vc_pri   ) \
,.npi_reg_ddrmc_nsu_0_r_egr_isor_vc_pri   (npi_reg_ddrmc_nsu_0_r_egr_isor_vc_pri  ) \
,.npi_reg_ddrmc_nsu_0_r_egr_ber_vc_pri    (npi_reg_ddrmc_nsu_0_r_egr_ber_vc_pri   ) \
,.npi_reg_ddrmc_nsu_0_r_egr_llr_vc_token  (npi_reg_ddrmc_nsu_0_r_egr_llr_vc_token ) \
,.npi_reg_ddrmc_nsu_0_r_egr_isor_vc_token (npi_reg_ddrmc_nsu_0_r_egr_isor_vc_token) \
,.npi_reg_ddrmc_nsu_0_r_egr_ber_vc_token  (npi_reg_ddrmc_nsu_0_r_egr_ber_vc_token ) \
,.npi_reg_ddrmc_nsu_0_w_egr_isow_vc_pri   (npi_reg_ddrmc_nsu_0_w_egr_isow_vc_pri  ) \
,.npi_reg_ddrmc_nsu_0_w_egr_bew_vc_pri    (npi_reg_ddrmc_nsu_0_w_egr_bew_vc_pri   ) \
,.npi_reg_ddrmc_nsu_0_w_egr_isow_vc_token (npi_reg_ddrmc_nsu_0_w_egr_isow_vc_token) \
,.npi_reg_ddrmc_nsu_0_w_egr_bew_vc_token  (npi_reg_ddrmc_nsu_0_w_egr_bew_vc_token ) \
,.npi_reg_ddrmc_nsu_1_ing_ecc_chk_en      (npi_reg_ddrmc_nsu_1_ing_ecc_chk_en     ) \
,.npi_reg_ddrmc_nsu_1_ing_llr_vc_map      (npi_reg_ddrmc_nsu_1_ing_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_1_ing_isor_vc_map     (npi_reg_ddrmc_nsu_1_ing_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_1_ing_ber_vc_map      (npi_reg_ddrmc_nsu_1_ing_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_1_ing_isow_vc_map     (npi_reg_ddrmc_nsu_1_ing_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_1_ing_bew_vc_map      (npi_reg_ddrmc_nsu_1_ing_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_1_ing_llr_vc_vld      (npi_reg_ddrmc_nsu_1_ing_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_1_ing_isor_vc_vld     (npi_reg_ddrmc_nsu_1_ing_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_1_ing_ber_vc_vld      (npi_reg_ddrmc_nsu_1_ing_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_1_egr_llr_vc_map      (npi_reg_ddrmc_nsu_1_egr_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_1_egr_isor_vc_map     (npi_reg_ddrmc_nsu_1_egr_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_1_egr_ber_vc_map      (npi_reg_ddrmc_nsu_1_egr_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_1_egr_isow_vc_map     (npi_reg_ddrmc_nsu_1_egr_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_1_egr_bew_vc_map      (npi_reg_ddrmc_nsu_1_egr_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_1_egr_llr_vc_vld      (npi_reg_ddrmc_nsu_1_egr_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_1_egr_isor_vc_vld     (npi_reg_ddrmc_nsu_1_egr_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_1_egr_ber_vc_vld      (npi_reg_ddrmc_nsu_1_egr_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_1_r_egr_llr_vc_pri    (npi_reg_ddrmc_nsu_1_r_egr_llr_vc_pri   ) \
,.npi_reg_ddrmc_nsu_1_r_egr_isor_vc_pri   (npi_reg_ddrmc_nsu_1_r_egr_isor_vc_pri  ) \
,.npi_reg_ddrmc_nsu_1_r_egr_ber_vc_pri    (npi_reg_ddrmc_nsu_1_r_egr_ber_vc_pri   ) \
,.npi_reg_ddrmc_nsu_1_r_egr_llr_vc_token  (npi_reg_ddrmc_nsu_1_r_egr_llr_vc_token ) \
,.npi_reg_ddrmc_nsu_1_r_egr_isor_vc_token (npi_reg_ddrmc_nsu_1_r_egr_isor_vc_token) \
,.npi_reg_ddrmc_nsu_1_r_egr_ber_vc_token  (npi_reg_ddrmc_nsu_1_r_egr_ber_vc_token ) \
,.npi_reg_ddrmc_nsu_1_w_egr_isow_vc_pri   (npi_reg_ddrmc_nsu_1_w_egr_isow_vc_pri  ) \
,.npi_reg_ddrmc_nsu_1_w_egr_bew_vc_pri    (npi_reg_ddrmc_nsu_1_w_egr_bew_vc_pri   ) \
,.npi_reg_ddrmc_nsu_1_w_egr_isow_vc_token (npi_reg_ddrmc_nsu_1_w_egr_isow_vc_token) \
,.npi_reg_ddrmc_nsu_1_w_egr_bew_vc_token  (npi_reg_ddrmc_nsu_1_w_egr_bew_vc_token ) \
,.npi_reg_ddrmc_nsu_2_ing_ecc_chk_en      (npi_reg_ddrmc_nsu_2_ing_ecc_chk_en     ) \
,.npi_reg_ddrmc_nsu_2_ing_llr_vc_map      (npi_reg_ddrmc_nsu_2_ing_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_2_ing_isor_vc_map     (npi_reg_ddrmc_nsu_2_ing_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_2_ing_ber_vc_map      (npi_reg_ddrmc_nsu_2_ing_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_2_ing_isow_vc_map     (npi_reg_ddrmc_nsu_2_ing_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_2_ing_bew_vc_map      (npi_reg_ddrmc_nsu_2_ing_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_2_ing_llr_vc_vld      (npi_reg_ddrmc_nsu_2_ing_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_2_ing_isor_vc_vld     (npi_reg_ddrmc_nsu_2_ing_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_2_ing_ber_vc_vld      (npi_reg_ddrmc_nsu_2_ing_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_2_egr_llr_vc_map      (npi_reg_ddrmc_nsu_2_egr_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_2_egr_isor_vc_map     (npi_reg_ddrmc_nsu_2_egr_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_2_egr_ber_vc_map      (npi_reg_ddrmc_nsu_2_egr_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_2_egr_isow_vc_map     (npi_reg_ddrmc_nsu_2_egr_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_2_egr_bew_vc_map      (npi_reg_ddrmc_nsu_2_egr_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_2_egr_llr_vc_vld      (npi_reg_ddrmc_nsu_2_egr_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_2_egr_isor_vc_vld     (npi_reg_ddrmc_nsu_2_egr_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_2_egr_ber_vc_vld      (npi_reg_ddrmc_nsu_2_egr_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_2_r_egr_llr_vc_pri    (npi_reg_ddrmc_nsu_2_r_egr_llr_vc_pri   ) \
,.npi_reg_ddrmc_nsu_2_r_egr_isor_vc_pri   (npi_reg_ddrmc_nsu_2_r_egr_isor_vc_pri  ) \
,.npi_reg_ddrmc_nsu_2_r_egr_ber_vc_pri    (npi_reg_ddrmc_nsu_2_r_egr_ber_vc_pri   ) \
,.npi_reg_ddrmc_nsu_2_r_egr_llr_vc_token  (npi_reg_ddrmc_nsu_2_r_egr_llr_vc_token ) \
,.npi_reg_ddrmc_nsu_2_r_egr_isor_vc_token (npi_reg_ddrmc_nsu_2_r_egr_isor_vc_token) \
,.npi_reg_ddrmc_nsu_2_r_egr_ber_vc_token  (npi_reg_ddrmc_nsu_2_r_egr_ber_vc_token ) \
,.npi_reg_ddrmc_nsu_2_w_egr_isow_vc_pri   (npi_reg_ddrmc_nsu_2_w_egr_isow_vc_pri  ) \
,.npi_reg_ddrmc_nsu_2_w_egr_bew_vc_pri    (npi_reg_ddrmc_nsu_2_w_egr_bew_vc_pri   ) \
,.npi_reg_ddrmc_nsu_2_w_egr_isow_vc_token (npi_reg_ddrmc_nsu_2_w_egr_isow_vc_token) \
,.npi_reg_ddrmc_nsu_2_w_egr_bew_vc_token  (npi_reg_ddrmc_nsu_2_w_egr_bew_vc_token ) \
,.npi_reg_ddrmc_nsu_3_ing_ecc_chk_en      (npi_reg_ddrmc_nsu_3_ing_ecc_chk_en     ) \
,.npi_reg_ddrmc_nsu_3_ing_llr_vc_map      (npi_reg_ddrmc_nsu_3_ing_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_3_ing_isor_vc_map     (npi_reg_ddrmc_nsu_3_ing_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_3_ing_ber_vc_map      (npi_reg_ddrmc_nsu_3_ing_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_3_ing_isow_vc_map     (npi_reg_ddrmc_nsu_3_ing_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_3_ing_bew_vc_map      (npi_reg_ddrmc_nsu_3_ing_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_3_ing_llr_vc_vld      (npi_reg_ddrmc_nsu_3_ing_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_3_ing_isor_vc_vld     (npi_reg_ddrmc_nsu_3_ing_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_3_ing_ber_vc_vld      (npi_reg_ddrmc_nsu_3_ing_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_3_egr_llr_vc_map      (npi_reg_ddrmc_nsu_3_egr_llr_vc_map     ) \
,.npi_reg_ddrmc_nsu_3_egr_isor_vc_map     (npi_reg_ddrmc_nsu_3_egr_isor_vc_map    ) \
,.npi_reg_ddrmc_nsu_3_egr_ber_vc_map      (npi_reg_ddrmc_nsu_3_egr_ber_vc_map     ) \
,.npi_reg_ddrmc_nsu_3_egr_isow_vc_map     (npi_reg_ddrmc_nsu_3_egr_isow_vc_map    ) \
,.npi_reg_ddrmc_nsu_3_egr_bew_vc_map      (npi_reg_ddrmc_nsu_3_egr_bew_vc_map     ) \
,.npi_reg_ddrmc_nsu_3_egr_llr_vc_vld      (npi_reg_ddrmc_nsu_3_egr_llr_vc_vld     ) \
,.npi_reg_ddrmc_nsu_3_egr_isor_vc_vld     (npi_reg_ddrmc_nsu_3_egr_isor_vc_vld    ) \
,.npi_reg_ddrmc_nsu_3_egr_ber_vc_vld      (npi_reg_ddrmc_nsu_3_egr_ber_vc_vld     ) \
,.npi_reg_ddrmc_nsu_3_r_egr_llr_vc_pri    (npi_reg_ddrmc_nsu_3_r_egr_llr_vc_pri   ) \
,.npi_reg_ddrmc_nsu_3_r_egr_isor_vc_pri   (npi_reg_ddrmc_nsu_3_r_egr_isor_vc_pri  ) \
,.npi_reg_ddrmc_nsu_3_r_egr_ber_vc_pri    (npi_reg_ddrmc_nsu_3_r_egr_ber_vc_pri   ) \
,.npi_reg_ddrmc_nsu_3_r_egr_llr_vc_token  (npi_reg_ddrmc_nsu_3_r_egr_llr_vc_token ) \
,.npi_reg_ddrmc_nsu_3_r_egr_isor_vc_token (npi_reg_ddrmc_nsu_3_r_egr_isor_vc_token) \
,.npi_reg_ddrmc_nsu_3_r_egr_ber_vc_token  (npi_reg_ddrmc_nsu_3_r_egr_ber_vc_token ) \
,.npi_reg_ddrmc_nsu_3_w_egr_isow_vc_pri   (npi_reg_ddrmc_nsu_3_w_egr_isow_vc_pri  ) \
,.npi_reg_ddrmc_nsu_3_w_egr_bew_vc_pri    (npi_reg_ddrmc_nsu_3_w_egr_bew_vc_pri   ) \
,.npi_reg_ddrmc_nsu_3_w_egr_isow_vc_token (npi_reg_ddrmc_nsu_3_w_egr_isow_vc_token) \
,.npi_reg_ddrmc_nsu_3_w_egr_bew_vc_token  (npi_reg_ddrmc_nsu_3_w_egr_bew_vc_token ) \
,.reg_nsu0_port                            (reg_nsu0_port                          ) \
,.reg_nsu1_port                            (reg_nsu1_port                          ) \
,.reg_nsu2_port                            (reg_nsu2_port                          ) \
,.reg_nsu3_port                            (reg_nsu3_port                          ) \
,.reg_qos0                                 (reg_qos0                               ) \
,.reg_qos0_arb_mode                        (reg_qos0_arb_mode                      ) \
,.reg_qos0_rd_threshold                    (reg_qos0_rd_threshold                  ) \
,.reg_qos0_wr_threshold                    (reg_qos0_wr_threshold                  ) \
,.reg_qos1                                 (reg_qos1                               ) \
,.reg_qos1_llr_token                       (reg_qos1_llr_token                     ) \
,.reg_qos1_isor_token                      (reg_qos1_isor_token                    ) \
,.reg_qos1_ber_token                       (reg_qos1_ber_token                     ) \
,.reg_qos2                                 (reg_qos2                               ) \
,.reg_qos2_isow_token                      (reg_qos2_isow_token                    ) \
,.reg_qos2_bew_token                       (reg_qos2_bew_token                     ) \
,.reg_qos_timeout0                         (reg_qos_timeout0                       ) \
,.reg_qos_timeout0_llr_scale               (reg_qos_timeout0_llr_scale             ) \
,.reg_qos_timeout0_isr_scale               (reg_qos_timeout0_isr_scale             ) \
,.reg_qos_timeout0_ber_scale               (reg_qos_timeout0_ber_scale             ) \
,.reg_qos_timeout0_isw_scale               (reg_qos_timeout0_isw_scale             ) \
,.reg_qos_timeout0_bew_scale               (reg_qos_timeout0_bew_scale             ) \
,.reg_qos_timeout1                         (reg_qos_timeout1                       ) \
,.reg_qos_timeout1_llr_timeout             (reg_qos_timeout1_llr_timeout           ) \
,.reg_qos_timeout1_isor_timeout            (reg_qos_timeout1_isor_timeout          ) \
,.reg_qos_timeout1_ber_timeout             (reg_qos_timeout1_ber_timeout           ) \
,.reg_qos_timeout1_isow_timeout            (reg_qos_timeout1_isow_timeout          ) \
,.reg_qos_timeout2                         (reg_qos_timeout2                       ) \
,.reg_qos_timeout2_bew_timeout             (reg_qos_timeout2_bew_timeout           ) \
,.reg_rate_ctrl_scale                      (reg_rate_ctrl_scale                    ) \
,.reg_rate_ctrl_scale_llr_update_period    (reg_rate_ctrl_scale_llr_update_period  ) \
,.reg_rate_ctrl_scale_isr_update_period    (reg_rate_ctrl_scale_isr_update_period  ) \
,.reg_rate_ctrl_scale_ber_update_period    (reg_rate_ctrl_scale_ber_update_period  ) \
,.reg_rate_ctrl_scale_isw_update_period    (reg_rate_ctrl_scale_isw_update_period  ) \
,.reg_rate_ctrl_scale_bew_update_period    (reg_rate_ctrl_scale_bew_update_period  ) \
,.reg_p0_llr_rate_ctrl                     (reg_p0_llr_rate_ctrl                   ) \
,.reg_p0_llr_rate_ctrl_credit_update       (reg_p0_llr_rate_ctrl_credit_update     ) \
,.reg_p0_llr_rate_ctrl_credit_limit        (reg_p0_llr_rate_ctrl_credit_limit      ) \
,.reg_p0_isr_rate_ctrl                     (reg_p0_isr_rate_ctrl                   ) \
,.reg_p0_isr_rate_ctrl_credit_update       (reg_p0_isr_rate_ctrl_credit_update     ) \
,.reg_p0_isr_rate_ctrl_credit_limit        (reg_p0_isr_rate_ctrl_credit_limit      ) \
,.reg_p0_ber_rate_ctrl                     (reg_p0_ber_rate_ctrl                   ) \
,.reg_p0_ber_rate_ctrl_credit_update       (reg_p0_ber_rate_ctrl_credit_update     ) \
,.reg_p0_ber_rate_ctrl_credit_limit        (reg_p0_ber_rate_ctrl_credit_limit      ) \
,.reg_p0_isw_rate_ctrl                     (reg_p0_isw_rate_ctrl                   ) \
,.reg_p0_isw_rate_ctrl_credit_update       (reg_p0_isw_rate_ctrl_credit_update     ) \
,.reg_p0_isw_rate_ctrl_credit_limit        (reg_p0_isw_rate_ctrl_credit_limit      ) \
,.reg_p0_bew_rate_ctrl                     (reg_p0_bew_rate_ctrl                   ) \
,.reg_p0_bew_rate_ctrl_credit_update       (reg_p0_bew_rate_ctrl_credit_update     ) \
,.reg_p0_bew_rate_ctrl_credit_limit        (reg_p0_bew_rate_ctrl_credit_limit      ) \
,.reg_p1_llr_rate_ctrl                     (reg_p1_llr_rate_ctrl                   ) \
,.reg_p1_llr_rate_ctrl_credit_update       (reg_p1_llr_rate_ctrl_credit_update     ) \
,.reg_p1_llr_rate_ctrl_credit_limit        (reg_p1_llr_rate_ctrl_credit_limit      ) \
,.reg_p1_isr_rate_ctrl                     (reg_p1_isr_rate_ctrl                   ) \
,.reg_p1_isr_rate_ctrl_credit_update       (reg_p1_isr_rate_ctrl_credit_update     ) \
,.reg_p1_isr_rate_ctrl_credit_limit        (reg_p1_isr_rate_ctrl_credit_limit      ) \
,.reg_p1_ber_rate_ctrl                     (reg_p1_ber_rate_ctrl                   ) \
,.reg_p1_ber_rate_ctrl_credit_update       (reg_p1_ber_rate_ctrl_credit_update     ) \
,.reg_p1_ber_rate_ctrl_credit_limit        (reg_p1_ber_rate_ctrl_credit_limit      ) \
,.reg_p1_isw_rate_ctrl                     (reg_p1_isw_rate_ctrl                   ) \
,.reg_p1_isw_rate_ctrl_credit_update       (reg_p1_isw_rate_ctrl_credit_update     ) \
,.reg_p1_isw_rate_ctrl_credit_limit        (reg_p1_isw_rate_ctrl_credit_limit      ) \
,.reg_p1_bew_rate_ctrl                     (reg_p1_bew_rate_ctrl                   ) \
,.reg_p1_bew_rate_ctrl_credit_update       (reg_p1_bew_rate_ctrl_credit_update     ) \
,.reg_p1_bew_rate_ctrl_credit_limit        (reg_p1_bew_rate_ctrl_credit_limit      ) \
,.reg_p2_llr_rate_ctrl                     (reg_p2_llr_rate_ctrl                   ) \
,.reg_p2_llr_rate_ctrl_credit_update       (reg_p2_llr_rate_ctrl_credit_update     ) \
,.reg_p2_llr_rate_ctrl_credit_limit        (reg_p2_llr_rate_ctrl_credit_limit      ) \
,.reg_p2_isr_rate_ctrl                     (reg_p2_isr_rate_ctrl                   ) \
,.reg_p2_isr_rate_ctrl_credit_update       (reg_p2_isr_rate_ctrl_credit_update     ) \
,.reg_p2_isr_rate_ctrl_credit_limit        (reg_p2_isr_rate_ctrl_credit_limit      ) \
,.reg_p2_ber_rate_ctrl                     (reg_p2_ber_rate_ctrl                   ) \
,.reg_p2_ber_rate_ctrl_credit_update       (reg_p2_ber_rate_ctrl_credit_update     ) \
,.reg_p2_ber_rate_ctrl_credit_limit        (reg_p2_ber_rate_ctrl_credit_limit      ) \
,.reg_p2_isw_rate_ctrl                     (reg_p2_isw_rate_ctrl                   ) \
,.reg_p2_isw_rate_ctrl_credit_update       (reg_p2_isw_rate_ctrl_credit_update     ) \
,.reg_p2_isw_rate_ctrl_credit_limit        (reg_p2_isw_rate_ctrl_credit_limit      ) \
,.reg_p2_bew_rate_ctrl                     (reg_p2_bew_rate_ctrl                   ) \
,.reg_p2_bew_rate_ctrl_credit_update       (reg_p2_bew_rate_ctrl_credit_update     ) \
,.reg_p2_bew_rate_ctrl_credit_limit        (reg_p2_bew_rate_ctrl_credit_limit      ) \
,.reg_p3_llr_rate_ctrl                     (reg_p3_llr_rate_ctrl                   ) \
,.reg_p3_llr_rate_ctrl_credit_update       (reg_p3_llr_rate_ctrl_credit_update     ) \
,.reg_p3_llr_rate_ctrl_credit_limit        (reg_p3_llr_rate_ctrl_credit_limit      ) \
,.reg_p3_isr_rate_ctrl                     (reg_p3_isr_rate_ctrl                   ) \
,.reg_p3_isr_rate_ctrl_credit_update       (reg_p3_isr_rate_ctrl_credit_update     ) \
,.reg_p3_isr_rate_ctrl_credit_limit        (reg_p3_isr_rate_ctrl_credit_limit      ) \
,.reg_p3_ber_rate_ctrl                     (reg_p3_ber_rate_ctrl                   ) \
,.reg_p3_ber_rate_ctrl_credit_update       (reg_p3_ber_rate_ctrl_credit_update     ) \
,.reg_p3_ber_rate_ctrl_credit_limit        (reg_p3_ber_rate_ctrl_credit_limit      ) \
,.reg_p3_isw_rate_ctrl                     (reg_p3_isw_rate_ctrl                   ) \
,.reg_p3_isw_rate_ctrl_credit_update       (reg_p3_isw_rate_ctrl_credit_update     ) \
,.reg_p3_isw_rate_ctrl_credit_limit        (reg_p3_isw_rate_ctrl_credit_limit      ) \
,.reg_p3_bew_rate_ctrl                     (reg_p3_bew_rate_ctrl                   ) \
,.reg_p3_bew_rate_ctrl_credit_update       (reg_p3_bew_rate_ctrl_credit_update     ) \
,.reg_p3_bew_rate_ctrl_credit_limit        (reg_p3_bew_rate_ctrl_credit_limit      ) \
,.reg_cmdq_ctrl0                           (reg_cmdq_ctrl0                         ) \
,.reg_cmdq_ctrl0_llr_threshold_ch0         (reg_cmdq_ctrl0_llr_threshold_ch0       ) \
,.reg_cmdq_ctrl0_isr_threshold_ch0         (reg_cmdq_ctrl0_isr_threshold_ch0       ) \
,.reg_cmdq_ctrl0_ber_threshold_ch0         (reg_cmdq_ctrl0_ber_threshold_ch0       ) \
,.reg_cmdq_ctrl0_isw_threshold_ch0         (reg_cmdq_ctrl0_isw_threshold_ch0       ) \
,.reg_cmdq_ctrl0_bew_threshold_ch0         (reg_cmdq_ctrl0_bew_threshold_ch0       ) \
,.reg_cmdq_ctrl1                           (reg_cmdq_ctrl1                         ) \
,.reg_cmdq_ctrl1_llr_threshold_ch1         (reg_cmdq_ctrl1_llr_threshold_ch1       ) \
,.reg_cmdq_ctrl1_isr_threshold_ch1         (reg_cmdq_ctrl1_isr_threshold_ch1       ) \
,.reg_cmdq_ctrl1_ber_threshold_ch1         (reg_cmdq_ctrl1_ber_threshold_ch1       ) \
,.reg_cmdq_ctrl1_isw_threshold_ch1         (reg_cmdq_ctrl1_isw_threshold_ch1       ) \
,.reg_cmdq_ctrl1_bew_threshold_ch1         (reg_cmdq_ctrl1_bew_threshold_ch1       ) \
,.reg_cmdq_llr_rate_ctrl                   (reg_cmdq_llr_rate_ctrl                 ) \
,.reg_cmdq_llr_rate_ctrl_credit_update     (reg_cmdq_llr_rate_ctrl_credit_update   ) \
,.reg_cmdq_llr_rate_ctrl_credit_limit      (reg_cmdq_llr_rate_ctrl_credit_limit    ) \
,.reg_cmdq_isr_rate_ctrl                   (reg_cmdq_isr_rate_ctrl                 ) \
,.reg_cmdq_isr_rate_ctrl_credit_update     (reg_cmdq_isr_rate_ctrl_credit_update   ) \
,.reg_cmdq_isr_rate_ctrl_credit_limit      (reg_cmdq_isr_rate_ctrl_credit_limit    ) \
,.reg_cmdq_ber_rate_ctrl                   (reg_cmdq_ber_rate_ctrl                 ) \
,.reg_cmdq_ber_rate_ctrl_credit_update     (reg_cmdq_ber_rate_ctrl_credit_update   ) \
,.reg_cmdq_ber_rate_ctrl_credit_limit      (reg_cmdq_ber_rate_ctrl_credit_limit    ) \
,.reg_cmdq_isw_rate_ctrl                   (reg_cmdq_isw_rate_ctrl                 ) \
,.reg_cmdq_isw_rate_ctrl_credit_update     (reg_cmdq_isw_rate_ctrl_credit_update   ) \
,.reg_cmdq_isw_rate_ctrl_credit_limit      (reg_cmdq_isw_rate_ctrl_credit_limit    ) \
,.reg_cmdq_bew_rate_ctrl                   (reg_cmdq_bew_rate_ctrl                 ) \
,.reg_cmdq_bew_rate_ctrl_credit_update     (reg_cmdq_bew_rate_ctrl_credit_update   ) \
,.reg_cmdq_bew_rate_ctrl_credit_limit      (reg_cmdq_bew_rate_ctrl_credit_limit    ) \
,.reg_qos_rate_ctrl_scale                   (reg_qos_rate_ctrl_scale                 ) \
,.reg_qos_rate_ctrl_scale_llr_update_period (reg_qos_rate_ctrl_scale_llr_update_period   ) \
,.reg_qos_rate_ctrl_scale_isr_update_period (reg_qos_rate_ctrl_scale_isr_update_period   ) \
,.reg_qos_rate_ctrl_scale_ber_update_period (reg_qos_rate_ctrl_scale_ber_update_period   ) \
,.reg_qos_rate_ctrl_scale_isw_update_period (reg_qos_rate_ctrl_scale_isw_update_period   ) \
,.reg_qos_rate_ctrl_scale_bew_update_period (reg_qos_rate_ctrl_scale_bew_update_period   ) \
,.reg_rd_drr_tkn_p0                        (reg_rd_drr_tkn_p0                      ) \
,.reg_rd_drr_tkn_p0_llr                    (reg_rd_drr_tkn_p0_llr                  ) \
,.reg_rd_drr_tkn_p0_isocr                  (reg_rd_drr_tkn_p0_isocr                ) \
,.reg_rd_drr_tkn_p0_ber                    (reg_rd_drr_tkn_p0_ber                  ) \
,.reg_wr_drr_tkn_p0                        (reg_wr_drr_tkn_p0                      ) \
,.reg_wr_drr_tkn_p0_isocw                  (reg_wr_drr_tkn_p0_isocw                ) \
,.reg_wr_drr_tkn_p0_bew                    (reg_wr_drr_tkn_p0_bew                  ) \
,.reg_rd_drr_tkn_p1                        (reg_rd_drr_tkn_p1                      ) \
,.reg_rd_drr_tkn_p1_llr                    (reg_rd_drr_tkn_p1_llr                  ) \
,.reg_rd_drr_tkn_p1_isocr                  (reg_rd_drr_tkn_p1_isocr                ) \
,.reg_rd_drr_tkn_p1_ber                    (reg_rd_drr_tkn_p1_ber                  ) \
,.reg_wr_drr_tkn_p1                        (reg_wr_drr_tkn_p1                      ) \
,.reg_wr_drr_tkn_p1_isocw                  (reg_wr_drr_tkn_p1_isocw                ) \
,.reg_wr_drr_tkn_p1_bew                    (reg_wr_drr_tkn_p1_bew                  ) \
,.reg_rd_drr_tkn_p2                        (reg_rd_drr_tkn_p2                      ) \
,.reg_rd_drr_tkn_p2_llr                    (reg_rd_drr_tkn_p2_llr                  ) \
,.reg_rd_drr_tkn_p2_isocr                  (reg_rd_drr_tkn_p2_isocr                ) \
,.reg_rd_drr_tkn_p2_ber                    (reg_rd_drr_tkn_p2_ber                  ) \
,.reg_wr_drr_tkn_p2                        (reg_wr_drr_tkn_p2                      ) \
,.reg_wr_drr_tkn_p2_isocw                  (reg_wr_drr_tkn_p2_isocw                ) \
,.reg_wr_drr_tkn_p2_bew                    (reg_wr_drr_tkn_p2_bew                  ) \
,.reg_rd_drr_tkn_p3                        (reg_rd_drr_tkn_p3                      ) \
,.reg_rd_drr_tkn_p3_llr                    (reg_rd_drr_tkn_p3_llr                  ) \
,.reg_rd_drr_tkn_p3_isocr                  (reg_rd_drr_tkn_p3_isocr                ) \
,.reg_rd_drr_tkn_p3_ber                    (reg_rd_drr_tkn_p3_ber                  ) \
,.reg_wr_drr_tkn_p3                        (reg_wr_drr_tkn_p3                      ) \
,.reg_wr_drr_tkn_p3_isocw                  (reg_wr_drr_tkn_p3_isocw                ) \
,.reg_wr_drr_tkn_p3_bew                    (reg_wr_drr_tkn_p3_bew                  ) \
,.dc_cmd_credits                           (dc_cmd_credits                         ) \
,.dc_cmd_credits_init_credits              (dc_cmd_credits_init_credits            ) \
,.dc_cmd_credits_min_credits               (dc_cmd_credits_min_credits             ) \
,.reg_rrob_return_dly                      (reg_rrob_return_dly) \


/////module declaration
module ddr4mc_top #(
                       parameter [0:0] ARBITER_CONFIG = 1'h1,
                       parameter [1:0] CAL_CS_CH = 2'h0,
                       parameter [0:0] CAL_MODE = 1'h0,
                       parameter [17:0] CLK_GATE = 18'h3FFFF,
                       parameter [4:0] CPLX_BURST_ARRAY0 = 5'h01,
                       parameter [4:0] CPLX_BURST_ARRAY1 = 5'h02,
                       parameter [4:0] CPLX_BURST_ARRAY10 = 5'h05,
                       parameter [4:0] CPLX_BURST_ARRAY11 = 5'h06,
                       parameter [4:0] CPLX_BURST_ARRAY12 = 5'h03,
                       parameter [4:0] CPLX_BURST_ARRAY13 = 5'h04,
                       parameter [4:0] CPLX_BURST_ARRAY14 = 5'h05,
                       parameter [4:0] CPLX_BURST_ARRAY15 = 5'h07,
                       parameter [4:0] CPLX_BURST_ARRAY16 = 5'h08,
                       parameter [4:0] CPLX_BURST_ARRAY17 = 5'h09,
                       parameter [4:0] CPLX_BURST_ARRAY18 = 5'h0A,
                       parameter [4:0] CPLX_BURST_ARRAY19 = 5'h0C,
                       parameter [4:0] CPLX_BURST_ARRAY2 = 5'h03,
                       parameter [4:0] CPLX_BURST_ARRAY20 = 5'h0D,
                       parameter [4:0] CPLX_BURST_ARRAY21 = 5'h0E,
                       parameter [4:0] CPLX_BURST_ARRAY22 = 5'h1E,
                       parameter [4:0] CPLX_BURST_ARRAY3 = 5'h04,
                       parameter [4:0] CPLX_BURST_ARRAY4 = 5'h05,
                       parameter [4:0] CPLX_BURST_ARRAY5 = 5'h06,
                       parameter [4:0] CPLX_BURST_ARRAY6 = 5'h01,
                       parameter [4:0] CPLX_BURST_ARRAY7 = 5'h02,
                       parameter [4:0] CPLX_BURST_ARRAY8 = 5'h03,
                       parameter [4:0] CPLX_BURST_ARRAY9 = 5'h04,
                       parameter [30:0] CPLX_CONFIG = 31'h3B7F8084,
                       parameter [24:0] CPLX_CONFIG2 = 25'h10E0480,
                       parameter [9:0] CPLX_CONFIG3 = 10'h000,
                       parameter [15:0] CPLX_PATTERN0 = 16'hAAAA,
                       parameter [15:0] CPLX_PATTERN1 = 16'hCCCC,
                       parameter [15:0] CPLX_PATTERN10 = 16'hF8F8,
                       parameter [15:0] CPLX_PATTERN100 = 16'hAA31,
                       parameter [15:0] CPLX_PATTERN101 = 16'hBF47,
                       parameter [15:0] CPLX_PATTERN102 = 16'hF525,
                       parameter [15:0] CPLX_PATTERN103 = 16'h549A,
                       parameter [15:0] CPLX_PATTERN104 = 16'h007A,
                       parameter [15:0] CPLX_PATTERN105 = 16'hAA95,
                       parameter [15:0] CPLX_PATTERN106 = 16'hBFDB,
                       parameter [15:0] CPLX_PATTERN107 = 16'hF5F0,
                       parameter [15:0] CPLX_PATTERN108 = 16'h5421,
                       parameter [15:0] CPLX_PATTERN109 = 16'h008A,
                       parameter [15:0] CPLX_PATTERN11 = 16'h3E3E,
                       parameter [15:0] CPLX_PATTERN110 = 16'hAA25,
                       parameter [15:0] CPLX_PATTERN111 = 16'hBF9A,
                       parameter [15:0] CPLX_PATTERN112 = 16'hF57A,
                       parameter [15:0] CPLX_PATTERN113 = 16'hAABF,
                       parameter [15:0] CPLX_PATTERN114 = 16'hA057,
                       parameter [15:0] CPLX_PATTERN115 = 16'h026F,
                       parameter [15:0] CPLX_PATTERN116 = 16'hAAC0,
                       parameter [15:0] CPLX_PATTERN117 = 16'h8084,
                       parameter [15:0] CPLX_PATTERN118 = 16'h0A31,
                       parameter [15:0] CPLX_PATTERN119 = 16'hAA47,
                       parameter [15:0] CPLX_PATTERN12 = 16'h0F0F,
                       parameter [15:0] CPLX_PATTERN120 = 16'h0025,
                       parameter [15:0] CPLX_PATTERN121 = 16'h2A9A,
                       parameter [15:0] CPLX_PATTERN122 = 16'hA87A,
                       parameter [15:0] CPLX_PATTERN123 = 16'h0095,
                       parameter [15:0] CPLX_PATTERN124 = 16'hAADB,
                       parameter [15:0] CPLX_PATTERN125 = 16'hA0F0,
                       parameter [15:0] CPLX_PATTERN126 = 16'h0221,
                       parameter [15:0] CPLX_PATTERN127 = 16'h5757,
                       parameter [15:0] CPLX_PATTERN128 = 16'h6F6F,
                       parameter [15:0] CPLX_PATTERN129 = 16'hC0C0,
                       parameter [15:0] CPLX_PATTERN13 = 16'h8383,
                       parameter [15:0] CPLX_PATTERN130 = 16'h8684,
                       parameter [15:0] CPLX_PATTERN131 = 16'h2831,
                       parameter [15:0] CPLX_PATTERN132 = 16'hE447,
                       parameter [15:0] CPLX_PATTERN133 = 16'hB325,
                       parameter [15:0] CPLX_PATTERN134 = 16'h4F9B,
                       parameter [15:0] CPLX_PATTERN135 = 16'hB555,
                       parameter [15:0] CPLX_PATTERN136 = 16'hB555,
                       parameter [15:0] CPLX_PATTERN137 = 16'h8798,
                       parameter [15:0] CPLX_PATTERN138 = 16'hE31C,
                       parameter [15:0] CPLX_PATTERN139 = 16'h0AF5,
                       parameter [15:0] CPLX_PATTERN14 = 16'hE0E0,
                       parameter [15:0] CPLX_PATTERN140 = 16'hD42B,
                       parameter [15:0] CPLX_PATTERN141 = 16'h48B7,
                       parameter [15:0] CPLX_PATTERN142 = 16'h1FE0,
                       parameter [15:0] CPLX_PATTERN143 = 16'hBC43,
                       parameter [15:0] CPLX_PATTERN144 = 16'h8F14,
                       parameter [15:0] CPLX_PATTERN145 = 16'hB44B,
                       parameter [15:0] CPLX_PATTERN146 = 16'hCB34,
                       parameter [15:0] CPLX_PATTERN147 = 16'h0AF5,
                       parameter [15:0] CPLX_PATTERN148 = 16'h8000,
                       parameter [15:0] CPLX_PATTERN149 = 16'h0000,
                       parameter [15:0] CPLX_PATTERN15 = 16'hFCFC,
                       parameter [15:0] CPLX_PATTERN150 = 16'h5555,
                       parameter [15:0] CPLX_PATTERN151 = 16'h5555,
                       parameter [15:0] CPLX_PATTERN152 = 16'h0000,
                       parameter [15:0] CPLX_PATTERN153 = 16'h0000,
                       parameter [15:0] CPLX_PATTERN154 = 16'h552A,
                       parameter [15:0] CPLX_PATTERN155 = 16'h55AA,
                       parameter [15:0] CPLX_PATTERN156 = 16'h0080,
                       parameter [15:0] CPLX_PATTERN16 = 16'h0F0F,
                       parameter [15:0] CPLX_PATTERN17 = 16'hC0C0,
                       parameter [15:0] CPLX_PATTERN18 = 16'hFCFC,
                       parameter [15:0] CPLX_PATTERN19 = 16'h0F0F,
                       parameter [15:0] CPLX_PATTERN2 = 16'hCCCC,
                       parameter [15:0] CPLX_PATTERN20 = 16'hC0C0,
                       parameter [15:0] CPLX_PATTERN21 = 16'hAA55,
                       parameter [15:0] CPLX_PATTERN22 = 16'hCC33,
                       parameter [15:0] CPLX_PATTERN23 = 16'hCC33,
                       parameter [15:0] CPLX_PATTERN24 = 16'hE31C,
                       parameter [15:0] CPLX_PATTERN25 = 16'hFE71,
                       parameter [15:0] CPLX_PATTERN26 = 16'h38C7,
                       parameter [15:0] CPLX_PATTERN27 = 16'hF00F,
                       parameter [15:0] CPLX_PATTERN28 = 16'hF00F,
                       parameter [15:0] CPLX_PATTERN29 = 16'hF00F,
                       parameter [15:0] CPLX_PATTERN3 = 16'hE3E3,
                       parameter [15:0] CPLX_PATTERN30 = 16'hF00F,
                       parameter [15:0] CPLX_PATTERN31 = 16'hF807,
                       parameter [15:0] CPLX_PATTERN32 = 16'h3EC1,
                       parameter [15:0] CPLX_PATTERN33 = 16'h0FF0,
                       parameter [15:0] CPLX_PATTERN34 = 16'h837C,
                       parameter [15:0] CPLX_PATTERN35 = 16'hE01F,
                       parameter [15:0] CPLX_PATTERN36 = 16'hFC03,
                       parameter [15:0] CPLX_PATTERN37 = 16'h0FF0,
                       parameter [15:0] CPLX_PATTERN38 = 16'hC03F,
                       parameter [15:0] CPLX_PATTERN39 = 16'hFC03,
                       parameter [15:0] CPLX_PATTERN4 = 16'h8E8E,
                       parameter [15:0] CPLX_PATTERN40 = 16'h0FF0,
                       parameter [15:0] CPLX_PATTERN41 = 16'hC03F,
                       parameter [15:0] CPLX_PATTERN42 = 16'hB457,
                       parameter [15:0] CPLX_PATTERN43 = 16'hB46F,
                       parameter [15:0] CPLX_PATTERN44 = 16'hB4C0,
                       parameter [15:0] CPLX_PATTERN45 = 16'hA284,
                       parameter [15:0] CPLX_PATTERN46 = 16'h8A31,
                       parameter [15:0] CPLX_PATTERN47 = 16'h2847,
                       parameter [15:0] CPLX_PATTERN48 = 16'hA225,
                       parameter [15:0] CPLX_PATTERN49 = 16'hAF9A,
                       parameter [15:0] CPLX_PATTERN5 = 16'h3838,
                       parameter [15:0] CPLX_PATTERN50 = 16'h507A,
                       parameter [15:0] CPLX_PATTERN51 = 16'hAF95,
                       parameter [15:0] CPLX_PATTERN52 = 16'h50DB,
                       parameter [15:0] CPLX_PATTERN53 = 16'hAFF0,
                       parameter [15:0] CPLX_PATTERN54 = 16'hA821,
                       parameter [15:0] CPLX_PATTERN55 = 16'h2A8A,
                       parameter [15:0] CPLX_PATTERN56 = 16'h0A25,
                       parameter [15:0] CPLX_PATTERN57 = 16'h829A,
                       parameter [15:0] CPLX_PATTERN58 = 16'hA07A,
                       parameter [15:0] CPLX_PATTERN59 = 16'hA8BF,
                       parameter [15:0] CPLX_PATTERN6 = 16'hF0F0,
                       parameter [15:0] CPLX_PATTERN60 = 16'h2A57,
                       parameter [15:0] CPLX_PATTERN61 = 16'hAB6F,
                       parameter [15:0] CPLX_PATTERN62 = 16'hF5C0,
                       parameter [15:0] CPLX_PATTERN63 = 16'h4084,
                       parameter [15:0] CPLX_PATTERN64 = 16'hAB31,
                       parameter [15:0] CPLX_PATTERN65 = 16'hF547,
                       parameter [15:0] CPLX_PATTERN66 = 16'h4025,
                       parameter [15:0] CPLX_PATTERN67 = 16'hAB9A,
                       parameter [15:0] CPLX_PATTERN68 = 16'hF57A,
                       parameter [15:0] CPLX_PATTERN69 = 16'hAA95,
                       parameter [15:0] CPLX_PATTERN7 = 16'hF0F0,
                       parameter [15:0] CPLX_PATTERN70 = 16'h02DB,
                       parameter [15:0] CPLX_PATTERN71 = 16'hA8F0,
                       parameter [15:0] CPLX_PATTERN72 = 16'h0A21,
                       parameter [15:0] CPLX_PATTERN73 = 16'hA08A,
                       parameter [15:0] CPLX_PATTERN74 = 16'h2A25,
                       parameter [15:0] CPLX_PATTERN75 = 16'h809A,
                       parameter [15:0] CPLX_PATTERN76 = 16'hAA7A,
                       parameter [15:0] CPLX_PATTERN77 = 16'h02BF,
                       parameter [15:0] CPLX_PATTERN78 = 16'hAA57,
                       parameter [15:0] CPLX_PATTERN79 = 16'hFF6F,
                       parameter [15:0] CPLX_PATTERN8 = 16'hF0F0,
                       parameter [15:0] CPLX_PATTERN80 = 16'h55C0,
                       parameter [15:0] CPLX_PATTERN81 = 16'h0084,
                       parameter [15:0] CPLX_PATTERN82 = 16'hAA31,
                       parameter [15:0] CPLX_PATTERN83 = 16'hFF47,
                       parameter [15:0] CPLX_PATTERN84 = 16'h5525,
                       parameter [15:0] CPLX_PATTERN85 = 16'h009A,
                       parameter [15:0] CPLX_PATTERN86 = 16'hAA7A,
                       parameter [15:0] CPLX_PATTERN87 = 16'hFF95,
                       parameter [15:0] CPLX_PATTERN88 = 16'hAADB,
                       parameter [15:0] CPLX_PATTERN89 = 16'h80F0,
                       parameter [15:0] CPLX_PATTERN9 = 16'hF0F0,
                       parameter [15:0] CPLX_PATTERN90 = 16'h2A21,
                       parameter [15:0] CPLX_PATTERN91 = 16'hA08A,
                       parameter [15:0] CPLX_PATTERN92 = 16'h0A25,
                       parameter [15:0] CPLX_PATTERN93 = 16'hA89A,
                       parameter [15:0] CPLX_PATTERN94 = 16'h027A,
                       parameter [15:0] CPLX_PATTERN95 = 16'hAABF,
                       parameter [15:0] CPLX_PATTERN96 = 16'h0057,
                       parameter [15:0] CPLX_PATTERN97 = 16'hAA6F,
                       parameter [15:0] CPLX_PATTERN98 = 16'h80C0,
                       parameter [15:0] CPLX_PATTERN99 = 16'h2A84,
                       parameter [2:0] DBG_TRIGGER = 3'h0,
                       parameter [11:0] DC_CMD_CREDITS = 12'h2A8,
                       parameter [9:0] DEFAULT_PATTERN = 10'h0A5,
                       parameter [8:0] EXMON_CLR_EXE = 9'h100,
                       parameter [6:0] FIFO_RDEN = 7'h00,
                       parameter [17:0] PHY_RANK_READ_OVERRIDE = 18'h00000,
                       parameter [17:0] PHY_RANK_WRITE_OVERRIDE = 18'h00000,
                       parameter [6:0] PHY_RDEN0 = 7'h05,
                       parameter [6:0] PHY_RDEN1 = 7'h05,
                       parameter [6:0] PHY_RDEN10 = 7'h05,
                       parameter [6:0] PHY_RDEN11 = 7'h05,
                       parameter [6:0] PHY_RDEN12 = 7'h05,
                       parameter [6:0] PHY_RDEN13 = 7'h05,
                       parameter [6:0] PHY_RDEN14 = 7'h05,
                       parameter [6:0] PHY_RDEN15 = 7'h05,
                       parameter [6:0] PHY_RDEN16 = 7'h05,
                       parameter [6:0] PHY_RDEN17 = 7'h05,
                       parameter [6:0] PHY_RDEN18 = 7'h05,
                       parameter [6:0] PHY_RDEN19 = 7'h05,
                       parameter [6:0] PHY_RDEN2 = 7'h05,
                       parameter [6:0] PHY_RDEN20 = 7'h05,
                       parameter [6:0] PHY_RDEN21 = 7'h05,
                       parameter [6:0] PHY_RDEN22 = 7'h05,
                       parameter [6:0] PHY_RDEN23 = 7'h05,
                       parameter [6:0] PHY_RDEN24 = 7'h05,
                       parameter [6:0] PHY_RDEN25 = 7'h05,
                       parameter [6:0] PHY_RDEN26 = 7'h05,
                       parameter [6:0] PHY_RDEN3 = 7'h05,
                       parameter [6:0] PHY_RDEN4 = 7'h05,
                       parameter [6:0] PHY_RDEN5 = 7'h05,
                       parameter [6:0] PHY_RDEN6 = 7'h05,
                       parameter [6:0] PHY_RDEN7 = 7'h05,
                       parameter [6:0] PHY_RDEN8 = 7'h05,
                       parameter [6:0] PHY_RDEN9 = 7'h05,
                       parameter [31:0] PRBS_CNT = 32'h00020004,
                       parameter [16:0] PRBS_CONFIG = 17'h08244,
                       parameter [17:0] PRBS_CONFIG2 = 18'h00000,
                       parameter [22:0] PRBS_SEED0 = 23'h000001,
                       parameter [22:0] PRBS_SEED1 = 23'h000002,
                       parameter [22:0] PRBS_SEED2 = 23'h000004,
                       parameter [22:0] PRBS_SEED3 = 23'h000008,
                       parameter [22:0] PRBS_SEED4 = 23'h000010,
                       parameter [22:0] PRBS_SEED5 = 23'h000020,
                       parameter [22:0] PRBS_SEED6 = 23'h000040,
                       parameter [22:0] PRBS_SEED7 = 23'h000080,
                       parameter [22:0] PRBS_SEED8 = 23'h000100,
                       parameter [7:0] RAM_SETTING_RF2PHS = 8'h12,
                       parameter [6:0] RAM_SETTING_RFSPHD = 7'h0A,
                       parameter [6:0] RAM_SETTING_SRSPHD = 7'h0A,
                       parameter [19:0] REG_ADEC0 = 20'h00000,
                       parameter [19:0] REG_ADEC1 = 20'h00000,
                       parameter [20:0] REG_ADEC2 = 21'h000000,
                       parameter [19:0] REG_ADEC3 = 20'h00000,
                       parameter [29:0] REG_ADEC4 = 30'b100111_100110_100101_100100_100011,
                       parameter [29:0] REG_ADEC5 = 30'b010011_010010_010001_010000_001111,
                       parameter [29:0] REG_ADEC6 = 30'b011000_010111_010110_010101_010100,
                       parameter [29:0] REG_ADEC7 = 30'b011101_011100_011011_011010_011001,
                       parameter [29:0] REG_ADEC8 = 30'b000011_000000_100000_011111_011110,
                       parameter [29:0] REG_ADEC9 = 30'b001000_000111_000110_000101_000100,
                       parameter [29:0] REG_ADEC10 =30'b001101_001100_001011_001010_001001,
                       parameter [23:0] REG_ADEC11 =30'b000000_000110_100010_100001_001110, 
                       parameter [21:0] REG_CMDQ_BER_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_CMDQ_BEW_RATE_CTRL = 22'h3FFC0F,
                       parameter [24:0] REG_CMDQ_CTRL0 = 25'h1084210,
                       parameter [24:0] REG_CMDQ_CTRL1 = 25'h1084210,
                       parameter [21:0] REG_CMDQ_ISR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_CMDQ_ISW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_CMDQ_LLR_RATE_CTRL = 22'h3FFC0F,
                       parameter [26:0] REG_COM_1 = 27'h0020000,
                       parameter [26:0] REG_COM_2 = 27'h0020000,
                       parameter [17:0] REG_COM_3 = 18'h14410,
                       parameter [22:0] REG_CONFIG0 = 23'h400000,
                       parameter [2:0] REG_CONFIG1 = 3'h0,
                       parameter [30:0] REG_CONFIG2 = 31'h00000000,
                       parameter [31:0] REG_CONFIG3 = 32'hFEC9FEC6,
                       parameter [22:0] REG_CONFIG4 = 23'h1318A5,
                       parameter [12:0] REG_DRAM_ARB = 13'h0910,
                       parameter [25:0] REG_MRS_0 = 26'h0200924,
                       parameter [31:0] REG_MRS_1 = 32'h92000000,
                       parameter [2:0] REG_MRS_2 = 3'h0,
                       parameter [7:0] REG_MRS_7 = 8'h28,
                       parameter [11:0] REG_NSU0_PORT = 12'h000,
                       parameter [11:0] REG_NSU1_PORT = 12'h000,
                       parameter [11:0] REG_NSU2_PORT = 12'h000,
                       parameter [11:0] REG_NSU3_PORT = 12'h000,
                       parameter [22:0] REG_NSU_0_EGR = 23'h643210,
                       parameter [26:0] REG_NSU_0_ING = 27'h6432101,
                       parameter [27:0] REG_NSU_0_R_EGR = 28'h1010100,
                       parameter [19:0] REG_NSU_0_W_EGR = 20'h10100,
                       parameter [22:0] REG_NSU_1_EGR = 23'h643210,
                       parameter [26:0] REG_NSU_1_ING = 27'h6432101,
                       parameter [27:0] REG_NSU_1_R_EGR = 28'h1010100,
                       parameter [19:0] REG_NSU_1_W_EGR = 20'h10100,
                       parameter [22:0] REG_NSU_2_EGR = 23'h643210,
                       parameter [26:0] REG_NSU_2_ING = 27'h6432101,
                       parameter [27:0] REG_NSU_2_R_EGR = 28'h1010100,
                       parameter [19:0] REG_NSU_2_W_EGR = 20'h10100,
                       parameter [22:0] REG_NSU_3_EGR = 23'h643210,
                       parameter [26:0] REG_NSU_3_ING = 27'h6432101,
                       parameter [27:0] REG_NSU_3_R_EGR = 28'h1010100,
                       parameter [19:0] REG_NSU_3_W_EGR = 20'h10100,
                       parameter [21:0] REG_P0_BER_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P0_BEW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P0_ISR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P0_ISW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P0_LLR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P1_BER_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P1_BEW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P1_ISR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P1_ISW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P1_LLR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P2_BER_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P2_BEW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P2_ISR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P2_ISW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P2_LLR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P3_BER_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P3_BEW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P3_ISR_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P3_ISW_RATE_CTRL = 22'h3FFC0F,
                       parameter [21:0] REG_P3_LLR_RATE_CTRL = 22'h3FFC0F,
                       parameter [9:0] REG_PINOUT = 10'h000,
                       parameter [19:0] REG_PT_CONFIG = 20'h00401,
                       parameter [27:0] REG_QOS0 = 28'h00F00F0,
                       parameter [29:0] REG_QOS1 = 30'h00200804,
                       parameter [19:0] REG_QOS2 = 20'h00802,
                       parameter [24:0] REG_QOS_RATE_CTRL_SCALE = 25'h0000000,
                       parameter [24:0] REG_QOS_TIMEOUT0 = 25'h1084210,
                       parameter [31:0] REG_QOS_TIMEOUT1 = 32'hFFFFFFFF,
                       parameter [7:0] REG_QOS_TIMEOUT2 = 8'hFF,
                       parameter [24:0] REG_RATE_CTRL_SCALE = 25'h0000000,
                       parameter [29:0] REG_RD_CONFIG = 30'h10010010,
                       parameter [23:0] REG_RD_DRR_TKN_P0 = 24'h040404,
                       parameter [23:0] REG_RD_DRR_TKN_P1 = 24'h040404,
                       parameter [23:0] REG_RD_DRR_TKN_P2 = 24'h040404,
                       parameter [23:0] REG_RD_DRR_TKN_P3 = 24'h040404,
                       parameter [1:0] REG_REF_0 = 2'h0,
                       parameter [31:0] REG_REF_1 = 32'h05100080,
                       parameter [1:0] REG_REF_2 = 2'h0,
                       parameter [15:0] REG_REF_3 = 16'hC002,
                       parameter [28:0] REG_RETRY_0 = 29'h0A2B604C,
                       parameter [29:0] REG_RETRY_1 = 30'h14528140,
                       //parameter [31:0] REG_SAFE_CONFIG0 = 32'h0A310304,
                       //parameter [31:0] REG_SAFE_CONFIG1 = 32'h40C20308,
                       //parameter [31:0] REG_SAFE_CONFIG2 = 32'h4181F3D0,
                       //parameter [27:0] REG_SAFE_CONFIG3 = 28'h1018912,
                       //parameter [30:0] REG_SAFE_CONFIG4 = 31'h1A00610F,
                       //parameter [31:0] REG_SAFE_CONFIG5 = 32'h04101012,
                       //parameter [25:0] REG_SAFE_CONFIG6 = 26'h0C80800,
                       //parameter [29:0] REG_SAFE_CONFIG7 = 30'h00040200,
                       //parameter [31:0] REG_SAFE_CONFIG8 = 32'h00002000,
                       parameter [31:0] REG_SCRUB0 = 32'hFF408281,
                       parameter [31:0] REG_SCRUB1 = 32'hFF000001,
                       parameter [1:0] REG_SCRUB8 = 2'h0,
                       parameter [0:0] REG_SCRUB9 = 1'h0,
                       parameter [19:0] REG_TXN_CONFIG = 20'h10500,
                       parameter [31:0] REG_WR_CONFIG = 32'h05000500,
                       parameter [15:0] REG_WR_DRR_TKN_P0 = 16'h0404,
                       parameter [15:0] REG_WR_DRR_TKN_P1 = 16'h0404,
                       parameter [15:0] REG_WR_DRR_TKN_P2 = 16'h0404,
                       parameter [15:0] REG_WR_DRR_TKN_P3 = 16'h0404,
                       parameter [0:0] SEQ_ADDR_DEFAULT = 1'h0,
                       parameter [0:0] SEQ_BA_DEFAULT = 1'h0,
                       parameter [0:0] SEQ_BG_DEFAULT = 1'h0,
                       parameter [0:0] SEQ_CBIT_DEFAULT = 1'h0,
                       parameter [15:0] SEQ_CK_CAL = 16'hF0F0,
                       parameter [6:0] SEQ_CMD_DEFAULT = 7'h00,
                       parameter [6:0] SEQ_CMD_POR = 7'h00,
                       parameter [2:0] SEQ_DQS_DEFAULT = 3'h0,
                       parameter [4:0] SEQ_DQ_DEFAULT = 5'h00,
                       parameter [27:0] SEQ_INIT_ADDR0 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR1 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR10 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR11 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR12 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR13 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR14 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR15 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR16 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR17 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR18 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR19 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR2 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR20 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR21 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR22 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR23 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR24 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR25 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR26 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR27 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR28 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR29 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR3 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR30 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR31 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR32 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR33 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR34 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR35 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR36 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR37 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR38 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR39 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR4 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR40 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR41 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR42 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR43 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR44 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR45 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR46 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR47 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR48 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR49 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR5 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR50 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR51 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR52 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR53 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR54 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR55 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR56 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR57 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR58 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR59 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR6 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR60 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR61 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR62 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR63 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR64 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR65 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR66 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR67 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR68 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR69 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR7 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR70 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR71 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR72 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR73 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR74 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR75 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR76 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR77 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR78 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR79 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR8 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR80 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR81 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR82 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR83 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR84 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR85 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR86 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR87 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR88 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR89 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR9 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR90 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR91 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR92 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR93 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR94 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR95 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR96 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR97 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR98 = 28'h0000000,
                       parameter [27:0] SEQ_INIT_ADDR99 = 28'h0000000,
                       parameter [31:0] SEQ_INIT_CMD0 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD1 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD10 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD11 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD12 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD13 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD14 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD15 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD16 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD17 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD18 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD19 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD2 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD20 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD21 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD22 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD23 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD24 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD25 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD26 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD27 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD28 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD29 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD3 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD30 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD31 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD32 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD33 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD34 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD35 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD36 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD37 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD38 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD39 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD4 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD40 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD41 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD42 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD43 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD44 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD45 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD46 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD47 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD48 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD49 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD5 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD50 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD51 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD52 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD53 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD54 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD55 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD56 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD57 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD58 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD59 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD6 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD60 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD61 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD62 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD63 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD64 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD65 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD66 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD67 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD68 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD69 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD7 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD70 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD71 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD72 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD73 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD74 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD75 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD76 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD77 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD78 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD79 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD8 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD80 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD81 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD82 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD83 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD84 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD85 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD86 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD87 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD88 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD89 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD9 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD90 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD91 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD92 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD93 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD94 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD95 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD96 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD97 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD98 = 32'h00000000,
                       parameter [31:0] SEQ_INIT_CMD99 = 32'h00000000,
                       parameter [8:0] SEQ_INIT_CMD_SET = 9'h000,
                       parameter [6:0] SEQ_INIT_CMD_VALID = 7'h00,
                       parameter [9:0] SEQ_INIT_CNTRL0 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL1 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL10 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL11 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL12 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL13 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL14 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL15 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL16 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL17 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL18 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL19 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL2 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL20 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL21 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL22 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL23 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL24 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL25 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL26 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL27 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL28 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL29 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL3 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL30 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL31 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL32 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL33 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL34 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL35 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL36 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL37 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL38 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL39 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL4 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL40 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL41 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL42 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL43 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL44 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL45 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL46 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL47 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL48 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL49 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL5 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL50 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL51 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL52 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL53 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL54 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL55 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL56 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL57 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL58 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL59 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL6 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL60 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL61 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL62 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL63 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL64 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL65 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL66 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL67 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL68 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL69 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL7 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL70 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL71 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL72 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL73 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL74 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL75 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL76 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL77 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL78 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL79 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL8 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL80 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL81 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL82 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL83 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL84 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL85 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL86 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL87 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL88 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL89 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL9 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL90 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL91 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL92 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL93 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL94 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL95 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL96 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL97 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL98 = 10'h000,
                       parameter [9:0] SEQ_INIT_CNTRL99 = 10'h000,
                       parameter [16:0] SEQ_INIT_CONFIG = 17'h0F0F0,
                       parameter [2:0] SEQ_MODE = 3'h0,
                       parameter [25:0] TXNQ_RD_PRIORITY = 26'h0101010,
                       parameter [24:0] TXNQ_WR_PRIORITY = 25'h0101010,
                       parameter [0:0] T_TXBIT = 1'h1,
                       parameter [1:0] UB_CLK_MUX = 2'h0,
                       parameter [4:0] XMPU_CONFIG0 = 5'h08,
                       parameter [4:0] XMPU_CONFIG1 = 5'h08,
                       parameter [4:0] XMPU_CONFIG10 = 5'h08,
                       parameter [4:0] XMPU_CONFIG11 = 5'h08,
                       parameter [4:0] XMPU_CONFIG12 = 5'h08,
                       parameter [4:0] XMPU_CONFIG13 = 5'h08,
                       parameter [4:0] XMPU_CONFIG14 = 5'h08,
                       parameter [4:0] XMPU_CONFIG15 = 5'h08,
                       parameter [4:0] XMPU_CONFIG2 = 5'h08,
                       parameter [4:0] XMPU_CONFIG3 = 5'h08,
                       parameter [4:0] XMPU_CONFIG4 = 5'h08,
                       parameter [4:0] XMPU_CONFIG5 = 5'h08,
                       parameter [4:0] XMPU_CONFIG6 = 5'h08,
                       parameter [4:0] XMPU_CONFIG7 = 5'h08,
                       parameter [4:0] XMPU_CONFIG8 = 5'h08,
                       parameter [4:0] XMPU_CONFIG9 = 5'h08,
                       parameter [3:0] XMPU_CTRL = 4'hB,
                       parameter [15:0] XMPU_END_HI0 = 16'h0000,
                       parameter [15:0] XMPU_END_HI1 = 16'h0000,
                       parameter [15:0] XMPU_END_HI10 = 16'h0000,
                       parameter [15:0] XMPU_END_HI11 = 16'h0000,
                       parameter [15:0] XMPU_END_HI12 = 16'h0000,
                       parameter [15:0] XMPU_END_HI13 = 16'h0000,
                       parameter [15:0] XMPU_END_HI14 = 16'h0000,
                       parameter [15:0] XMPU_END_HI15 = 16'h0000,
                       parameter [15:0] XMPU_END_HI2 = 16'h0000,
                       parameter [15:0] XMPU_END_HI3 = 16'h0000,
                       parameter [15:0] XMPU_END_HI4 = 16'h0000,
                       parameter [15:0] XMPU_END_HI5 = 16'h0000,
                       parameter [15:0] XMPU_END_HI6 = 16'h0000,
                       parameter [15:0] XMPU_END_HI7 = 16'h0000,
                       parameter [15:0] XMPU_END_HI8 = 16'h0000,
                       parameter [15:0] XMPU_END_HI9 = 16'h0000,
                       parameter [31:0] XMPU_END_LO0 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO1 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO10 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO11 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO12 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO13 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO14 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO15 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO2 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO3 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO4 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO5 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO6 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO7 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO8 = 32'h00000000,
                       parameter [31:0] XMPU_END_LO9 = 32'h00000000,
                       parameter [25:0] XMPU_MASTER0 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER1 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER10 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER11 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER12 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER13 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER14 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER15 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER2 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER3 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER4 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER5 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER6 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER7 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER8 = 26'h0000000,
                       parameter [25:0] XMPU_MASTER9 = 26'h0000000,
                       parameter [15:0] XMPU_START_HI0 = 16'h0000,
                       parameter [15:0] XMPU_START_HI1 = 16'h0000,
                       parameter [15:0] XMPU_START_HI10 = 16'h0000,
                       parameter [15:0] XMPU_START_HI11 = 16'h0000,
                       parameter [15:0] XMPU_START_HI12 = 16'h0000,
                       parameter [15:0] XMPU_START_HI13 = 16'h0000,
                       parameter [15:0] XMPU_START_HI14 = 16'h0000,
                       parameter [15:0] XMPU_START_HI15 = 16'h0000,
                       parameter [15:0] XMPU_START_HI2 = 16'h0000,
                       parameter [15:0] XMPU_START_HI3 = 16'h0000,
                       parameter [15:0] XMPU_START_HI4 = 16'h0000,
                       parameter [15:0] XMPU_START_HI5 = 16'h0000,
                       parameter [15:0] XMPU_START_HI6 = 16'h0000,
                       parameter [15:0] XMPU_START_HI7 = 16'h0000,
                       parameter [15:0] XMPU_START_HI8 = 16'h0000,
                       parameter [15:0] XMPU_START_HI9 = 16'h0000,
                       parameter [31:0] XMPU_START_LO0 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO1 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO10 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO11 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO12 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO13 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO14 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO15 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO2 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO3 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO4 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO5 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO6 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO7 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO8 = 32'h00000000,
                       parameter [31:0] XMPU_START_LO9 = 32'h00000000,
                       parameter [17:0] XPI_DATA_NIB_CHAN = 18'h00000,
                       parameter [7:0] XPI_DQS = 8'h50,
                       parameter [26:0] XPI_NIB_CHAN = 27'h0000000,
                       parameter [15:0] XPI_OE = 16'h0000,
                       parameter [10:0] XPI_OE_ALL_NIB = 11'h408,
                       parameter [8:0] XPI_PMI_CONFIG = 9'h0C0,
                       parameter [1:0] XPI_READ_DBI = 2'h0,
                       parameter [13:0] XPI_READ_OFFSET = 14'h0895,
                       parameter [10:0] XPI_WRDATA_ALL_NIB = 11'h408,
                       parameter [3:0] XPI_WRITE_DM_DBI = 4'h0
                       ,parameter REG_SAFE_CONFIG0          = 32'b00_011010_01000_01000_0001000_0000100 
                     //,parameter REG_SAFE_CONFIG0          = 32'b00_tfaw_trrd_l_trrd_s_tccd_l_sr_tccd_s_sr 
                       ,parameter REG_SAFE_CONFIG1          = 32'b0100_0000110_0000110_0000110_0000110 
                     //,parameter REG_SAFE_CONFIG1          = 32'b0000_trrd_dlr_tcs_w2w_sr_dlr_tcs_w2w_dr_tcs_r2r_sr_dlr_tcs_r2r_dr 
                       ,parameter REG_SAFE_CONFIG2          = 32'b010000_0110011_0101100_010000_010000 
                     //,parameter REG_SAFE_CONFIG2          = 32'btfaw_dlr_trc_tras_trp_trcd 
                       ,parameter [27:0]REG_SAFE_CONFIG3    = 28'b0000_0001000_0010110_0010100_0011100 //w2r=CWL+BL8/2+tWTR_L=16+4+ 
                     //,parameter []REG_SAFE_CONFIG3          = 32'b0000_tcs_w2r_sr_dlr_tcs_w2r_dr_tcs_w2r_s_sr_tcs_w2r_l_sr 
                       ,parameter [30:0]REG_SAFE_CONFIG4    = 31'b0_0101000_00000_0000100_0000100_00110 //r2w = RL+BL/2-WL+2+ = 24+4-16+2+ 
                     //,parameter REG_SAFE_CONFIG4          = 32'b0_tcs_w2p_00000_twr_tcs_r2w_dr_tcs_r2w_sr_trtp 
                       ,parameter REG_SAFE_CONFIG5          = 32'b00000000000_100000_010100_0_0011000 
                     //,parameter REG_SAFE_CONFIG5          = 32'b00000000000_trp_ab_____cwl_0________cl 
                       ,parameter [25:0]REG_SAFE_CONFIG6    = 26'b0000000000000000_0011_0000_1100_0000 
                     //,parameter REG_SAFE_CONFIG6          = 32'b0000000000000000_trefi 
                       ,parameter [29:0]REG_SAFE_CONFIG7    = 30'b00_0000100000_1000000000_1000101000 
                     //,parameter REG_SAFE_CONFIG7          = 32'b00___trfc_r2r___trfc_dlr___trfc_slr 
                       ,parameter REG_SAFE_CONFIG8          = 32'b0000000000000000_0000000000000000
                       ,parameter RCD_DELAY                 = 0
                     
                       ,parameter tck                       = 32'd624
                       //,parameter NOC_PERIOD              = (1000000 / 1200)
                       ,parameter NOC_FREQ                  = 900
                       ,parameter VERBOSITY_EN              = 32'h0
                       ,parameter bit EN_NPP_MONITOR        = 1'b0
                       ,parameter bit DISABLE_DATA_CHECK_MONITOR = 1'b1
                       `ifdef SIDEFILE_EN
                       ,parameter IP_NAME = "UNKNOWN"
                       ,parameter REG_FILE = "UNKNOWN.xdc"
                       `endif
                       ,parameter ADDR_WIDTH = 1
                       ,parameter BANK_WIDTH = 1
                       ,parameter BANK_GROUP_WIDTH = 1
                       ,parameter CKE_WIDTH  = 1
                       ,parameter ODT_WIDTH  = 1
                       ,parameter CS_WIDTH   = 1
                       ,parameter LRANK_WIDTH   = 1
                       ,parameter CK_WIDTH = 1
                       ,parameter DM_WIDTH = 1
                       ,parameter DQ_WIDTH = 1
                       ,parameter DQS_WIDTH  = 1
                       ,parameter NUM_OF_CHS = 1
                       ,parameter MC_TREFI = 7800000
                       ,parameter MC_REFRESH_RATE = "1x"
                       ,parameter XLNX_RESPONDER = 1
                       ,parameter CA_MIRROR =0   //CR : 1088805 - Micron model CA_MIRROR support
   )
   (
    // Clocking and Reset
     input                             pll_rst_n
    ,input                             pll_clk
    ,input                             mc_rst_n
    ,input                             mc_clk
    ,input                             noc_rst_n
    ,input                             noc_clk
    // NoC Interface
    ,input  [7:0]                      noc2dmc_valid_in_0
    ,input  [`NOC_NPP_WIDTH-1:0]       noc2dmc_data_in_0
    ,input                             noc2dmc_credit_rdy_0   //Ready  from NPG to receive Credits
    ,output [7:0]                      dmc2noc_credit_rtn_0 //Credit  from NA to NPG 
    ,input  [7:0]                      noc2dmc_valid_in_1
    ,input  [`NOC_NPP_WIDTH-1:0]       noc2dmc_data_in_1
    ,input                             noc2dmc_credit_rdy_1   //Ready  from NPG to receive Credits
    ,output [7:0]                      dmc2noc_credit_rtn_1 //Credit  from NA to NPG 
    ,input  [7:0]                      noc2dmc_valid_in_2
    ,input  [`NOC_NPP_WIDTH-1:0]       noc2dmc_data_in_2
    ,input                             noc2dmc_credit_rdy_2   //Ready  from NPG to receive Credits
    ,output [7:0]                      dmc2noc_credit_rtn_2 //Credit  from NA to NPG 
    ,input  [7:0]                      noc2dmc_valid_in_3
    ,input  [`NOC_NPP_WIDTH-1:0]       noc2dmc_data_in_3
    ,input                             noc2dmc_credit_rdy_3   //Ready  from NPG to receive Credits
    ,output [7:0]                      dmc2noc_credit_rtn_3 //Credit  from NA to NPG 
    ,output logic [7:0]                dmc2noc_valid_out_0 
    ,output logic [`NOC_NPP_WIDTH-1:0] dmc2noc_data_out_0 
    ,output logic                      dmc2noc_credit_rdy_0 //Ready from NA to NPG to receive credits 
    ,input  [7:0]                      noc2dmc_credit_rtn_0 //Credit from NPG to NA
    ,output logic [7:0]                dmc2noc_valid_out_1 
    ,output logic [`NOC_NPP_WIDTH-1:0] dmc2noc_data_out_1 
    ,output logic                      dmc2noc_credit_rdy_1 //Ready from NA to NPG to receive credits 
    ,input  [7:0]                      noc2dmc_credit_rtn_1 //Credit from NPG to NA
    ,output logic [7:0]                dmc2noc_valid_out_2 
    ,output logic [`NOC_NPP_WIDTH-1:0] dmc2noc_data_out_2 
    ,output logic                      dmc2noc_credit_rdy_2 //Ready from NA to NPG to receive credits 
    ,input  [7:0]                      noc2dmc_credit_rtn_2 //Credit from NPG to NA
    ,output logic [7:0]                dmc2noc_valid_out_3 
    ,output logic [`NOC_NPP_WIDTH-1:0] dmc2noc_data_out_3 
    ,output logic                      dmc2noc_credit_rdy_3 //Ready from NA to NPG to receive credits 
    ,input  [7:0]                      noc2dmc_credit_rtn_3 //Credit from NPG to NA
    `ifdef BFM_SIMULATION
    ,input                            initDone
    ,input                            main_regs_clk
    ,input                            ub_regs_clk
    ,input                            regs_ub_rst
    ,input                            log_inoc_rst_n
    ,input                            log_mc_rst_n
    ,input                            regs_mc_rst
    ,input                            inoc_regs_clk
    ,input                            dmc_init_rst
    ,input                            ddrmc_gatereg_mc
    ,input                            ddrmc_gatereg_noc
    ,input                            ddrmc_slverren_mc
    ,input                            ddrmc_slverren_noc
    ,input                            early_inoc_rst
    ,input                            early_ub_rst
    ,input                            scan_mode_rst_n
    ,input                            scan_en     
    ,input                            scan_mode     
    ,input                            scan_rst_byp
    ,input                            early_mc_rst
    ,input                            sys_inoc_rst
    ,input                            sys_ub_rst
    ,input                            sys_mc_rst
    ,input                            noc_por_inoc_rst
    ,input                            noc_por_ub_rst
    ,input                            noc_por_mc_rst
    ,input                            regs_inoc_rst
    ,input                            bisr_regs_ub_rst_n
    ,npi_prot_if                     if_dmc2reg_prot_main_out
    ,npi_prot_if                     if_npi2dmc_prot_cal_out
    ,ddrmc_ub_regs_status_if         if_ub_npi_regs_status
    ,ddrmc_ub_regs_hwrite_if         if_ub_npi_regs_hwrite
    ,ddrmc_main_regs_hwrite_if       if_npi_regs_hwrite
    ,ddrmc_main_regs_status_if       if_npi_regs_status
    ,ddrmc_main_regs_config_if       if_mc_npi_regs_config
    ,ddrmc_noc_regs_config_if        if_mc_npi_noc_regs_config
    ,npi_prot_if.slave               if_npi2dmc_prot_noc
    ,ddrmc_noc_regs_status_if        if_npi_noc_regs_status
    ,ddrmc_noc_regs_hwrite_if        if_npi_noc_regs_hwrite
    ,input [31:0] tCK                      

    `endif
    ,output                          ch0_ddr4_act_n
    ,output  logic [ADDR_WIDTH-1:0]        ch0_ddr4_adr
    ,output  logic [BANK_WIDTH-1:0]        ch0_ddr4_ba
    ,output  logic [BANK_GROUP_WIDTH-1:0]  ch0_ddr4_bg
    ,output  logic [CKE_WIDTH-1:0]        ch0_ddr4_cke
    ,output  [ODT_WIDTH-1:0]         ch0_ddr4_odt
    ,output  [CS_WIDTH-1:0]          ch0_ddr4_cs_n
    ,output  [LRANK_WIDTH-1:0]       ch0_ddr4_c
    ,output  logic [CK_WIDTH-1:0]         ch0_ddr4_ck_t
    ,output  logic [CK_WIDTH-1:0]         ch0_ddr4_ck_c
    ,output                          ch0_ddr4_reset_n
    ,output                          ch0_ddr4_parity
    ,inout                           ch0_ddr4_alert_n
    ,inout  [DM_WIDTH-1:0]           ch0_ddr4_dm_dbi_n
    ,inout  [DQ_WIDTH-1:0]           ch0_ddr4_dq
    ,inout  [DQS_WIDTH-1:0]          ch0_ddr4_dqs_c
    ,inout  [DQS_WIDTH-1:0]          ch0_ddr4_dqs_t

    ,output                          ch1_ddr4_act_n
    ,output  logic [ADDR_WIDTH-1:0]        ch1_ddr4_adr
    ,output  logic [BANK_WIDTH-1:0]        ch1_ddr4_ba
    ,output  logic [BANK_GROUP_WIDTH-1:0]  ch1_ddr4_bg
    ,output  logic [CKE_WIDTH-1:0]         ch1_ddr4_cke
    ,output  [ODT_WIDTH-1:0]         ch1_ddr4_odt
    ,output  [CS_WIDTH-1:0]          ch1_ddr4_cs_n
    ,output  [LRANK_WIDTH-1:0]       ch1_ddr4_c
    ,output  logic [CK_WIDTH-1:0]          ch1_ddr4_ck_t
    ,output  logic [CK_WIDTH-1:0]          ch1_ddr4_ck_c
    ,output                          ch1_ddr4_reset_n
    ,output                          ch1_ddr4_parity
    ,inout                           ch1_ddr4_alert_n
    ,inout  [DM_WIDTH-1:0]           ch1_ddr4_dm_dbi_n
    ,inout  [DQ_WIDTH-1:0]           ch1_ddr4_dq
    ,inout  [DQS_WIDTH-1:0]          ch1_ddr4_dqs_c
    ,inout  [DQS_WIDTH-1:0]          ch1_ddr4_dqs_t
   );
xmpu_regs_config if_xmpu_regs_config(); //XMPU register interface instantiation
//REG_CONFIG0 DECODING
localparam         NOC_PERIOD = (1000000 / NOC_FREQ);         
localparam         DM_EN       = REG_CONFIG0[22];
localparam integer LRANKS       = REG_CONFIG0[21:20];   //0-none,1-2,2-4,3-8
localparam         WIDTH_PER_CH = REG_CONFIG0[19:18];   //0-64,1-32,2-16
localparam         NUM_CH       = REG_CONFIG0[17];      //0-1,1-2
localparam integer NUM_SLOTS    = REG_CONFIG0[16];      //0-1,1-2
localparam integer NUM_RANKS    = REG_CONFIG0[15:14];   //0-1,1-2,2-4
localparam         DIMM_TYPE    = REG_CONFIG0[13:12];   //0-C,1-U,2-R,3-LR
localparam         DRAM_SIZE    = REG_CONFIG0[10:8];    //0-4G,1-6G,2-8G,3-12G,4-16G,5-32G
localparam         PART_WIDTH   = REG_CONFIG0[5:4];     //0-4,1-8,2-16,3-32
localparam         DRAM_TYPE    = REG_CONFIG0[0];       //0-DDR4 1-LP
localparam         ECC_ENABLE   = REG_PINOUT[4];
//localparam integer CS_WIDTH             = 2**(NUM_RANKS);
localparam integer CK_WIDTH_INT             = 1;
localparam integer CKE_WIDTH_INT            = 1;
//localparam integer ADDR_WIDTH           = 18;
//localparam integer RANK_WIDTH           = ((NUM_RANKS == 0 ) || (NUM_RANKS == 0 ) )?1:NUM_RANKS;
localparam integer RANK_WIDTH           = (NUM_RANKS == 0  && NUM_SLOTS == 0) ?1:(NUM_RANKS + NUM_SLOTS);
//localparam integer LRANK_WIDTH          = (LRANKS == 0) ?1:LRANKS;
localparam         NUM_OF_RANKS         = (2**(NUM_RANKS)) * (2**(NUM_SLOTS));
localparam         NUM_OF_LRANKS        = 2**(LRANKS);
//localparam         NUM_OF_CHS           = 2**(NUM_CH);
localparam         NUM_OF_CHS_1         = 2;
//localparam integer BANK_WIDTH           = (DRAM_TYPE == 0)?2:3;
//localparam integer BANK_GROUP_WIDTH     = (DRAM_TYPE == 0)?((PART_WIDTH ==2)?1:2):0;
localparam integer ROW_WIDTH            = (DRAM_SIZE == 0)? ((PART_WIDTH == 0) ? 16:15):((DRAM_SIZE == 2)? ((PART_WIDTH == 0) ? 17:16):((DRAM_SIZE == 4)? ((PART_WIDTH == 0) ? 18:17):0));
localparam integer COL_WIDTH            = 10;
localparam integer ODT_WIDTH_INT            = 1;
//localparam integer DRAM_WIDTH           = (PART_WIDTH == 0)?4:((PART_WIDTH == 1)?8:((PART_WIDTH == 2)?16:32));
localparam integer DRAM_WIDTH           = (PART_WIDTH == 0)?4:8;
localparam integer DQ_WIDTH_INT             = (DQ_WIDTH == 64 || DQ_WIDTH ==72)?64:((DQ_WIDTH== 32 || DQ_WIDTH==40)?32:((DQ_WIDTH == 16 || DQ_WIDTH==24)?16:0));
localparam integer DQS_WIDTH_INT        = DQ_WIDTH_INT/DRAM_WIDTH;
localparam integer DM_WIDTH_INT         = XPI_WRITE_DM_DBI[2:0] ? (DQ_WIDTH_INT/DRAM_WIDTH) : DM_WIDTH  ;
localparam integer WDB_DATA_WIDTH       = (DRAM_TYPE == 0) ? DQ_WIDTH_INT*8 : DQ_WIDTH_INT*2*8;
localparam integer WDB_DM_WIDTH         = (DRAM_TYPE == 0) ? DQ_WIDTH_INT   : DQ_WIDTH_INT;
localparam CH_SEL      = REG_ADEC11[23:18];
//localparam CH_SEL      = 6;

localparam NUM_PHYSICAL_PARTS            = (DQ_WIDTH_INT/DRAM_WIDTH) ;

localparam MRS                           = 3'b000;
localparam REF                           = 3'b001;
localparam PRE                           = 3'b010;
localparam ACT                           = 3'b011;
localparam WR                            = 3'b100;
localparam RD                            = 3'b101;
localparam ZQC                           = 3'b110;
localparam NOP                           = 3'b111;


`ifndef BFM_SIMULATION
wire  [DM_WIDTH_INT-1:0]          ddr4_dm_dbi_n_int[NUM_OF_CHS];
`else
wire  [8:0]          ddr4_dm_dbi_n_int[NUM_OF_CHS];
`endif

reg  [31:0] cmdName;
bit  en_model;
tri        model_enable = en_model;
initial begin
    en_model = 1'b0; 
   #5 en_model = 1'b1;
end
//clock,reset and tck generation block needed only for vivado gen. designs and NPG. for MC_VERIF these will be coming is an ipnuts
`ifndef BFM_SIMULATION
logic reset_n = 0;
logic noc_c = 0; 
logic [1:0] mc_clk_cnt = 2'b0;
logic mc_c = 0;
logic clk_1 =0;
time t1;
time t2;
reg [31:0] tCK;
real t3;
real t4;
wire                              initDone;  
initial begin
  wait (initDone == 1);
  $info("%m,initDone raised at %t ",$time);
  //$display("%m,initDone raised at %t ",$time);
  @(posedge pll_clk);
  t1=$time;
  t2=$time;
  repeat(10) @(posedge pll_clk);
  t2=$time;
  t4= t2-t1;
  t3 = t4/10;
  tCK = (t3*2);

end
always@(posedge pll_clk) begin
     clk_1 <= ~clk_1;
end
always@(posedge clk_1) begin
     mc_c <= ~mc_c;
end

  initial begin
      noc_c = 1'b0;
      #1
      noc_c = 1'b1;
      forever begin
        #(NOC_PERIOD / 2) noc_c = ~noc_c;
      end
  end
 initial begin
      reset_n = 1'b0;
      `ifdef BFM_SIMULATION
        repeat (400) begin
      `else
        repeat (10) begin //CR-1088629 - reducing the init delays for xlnx responder in VIVADO simulations
      `endif
            @ (posedge pll_clk);
        end
       @ (posedge mc_c);
      reset_n = 1'b1;
    end
`endif


wire [`NOC_NPP_WIDTH -1:0] flit_from_npg [4];
wire [8 -1:0]              valid_from_npg [4];
wire                       credit_rdy_from_npg[4]; 
wire [8-1:0]               credit_return_to_npg[4];
wire [8-1:0]               credit_return_from_npg[4];
wire                       credit_rdy_to_npg[4]; 
wire [`NOC_NPP_WIDTH -1:0] flit_to_npg [4];
wire [8 -1:0]              valid_to_npg [4];
logic [CK_WIDTH_INT-1 : 0]  ch0_ddr4_ck_t_int,ch1_ddr4_ck_t_int;
logic [CK_WIDTH_INT-1 : 0]  ch0_ddr4_ck_c_int,ch1_ddr4_ck_c_int;
logic [CKE_WIDTH_INT-1 :0 ] ch0_ddr4_cke_int,ch1_ddr4_cke_int;
logic [ADDR_WIDTH-1:0]        ch0_ddr4_adr_int , ch1_ddr4_adr_int;
logic [BANK_WIDTH-1:0]        ch0_ddr4_ba_int  , ch1_ddr4_ba_int;
logic [BANK_GROUP_WIDTH-1:0]  ch0_ddr4_bg_int  ,  ch1_ddr4_bg_int;
always @ * begin //CR-1085975 - Duplicating the CK_t/C and CKE to all the ranks.
  for (int i=0; i < CK_WIDTH; i=i+1) begin
    ch0_ddr4_ck_t[i] = ch0_ddr4_ck_t_int[0];
    ch1_ddr4_ck_t[i] = ch1_ddr4_ck_t_int[0];
    ch0_ddr4_ck_c[i] = ch0_ddr4_ck_c_int[0];
    ch1_ddr4_ck_c[i] = ch1_ddr4_ck_c_int[0];
  end
  for (int i=0; i< CKE_WIDTH; i=i+1 ) begin
    ch0_ddr4_cke[i] = ch0_ddr4_cke_int[0];
    ch1_ddr4_cke[i] = ch1_ddr4_cke_int[0];
  end
end
always @ (*) begin
  ch0_ddr4_adr=ch0_ddr4_adr_int;
  ch0_ddr4_ba=ch0_ddr4_ba_int;
  ch0_ddr4_bg = ch0_ddr4_bg_int;
  if ( (CA_MIRROR == 1) && (XLNX_RESPONDER==0))begin //CA mirroring for Odd ranks in DIMM configurations - with 3rdparty responders
    for (int i=0; i <CS_WIDTH ; i=i+1 ) begin
      if ( ((i%2)==1) && ch0_ddr4_cs_n[i]==0) begin
        ch0_ddr4_adr[3]=ch0_ddr4_adr_int[4];
        ch0_ddr4_adr[4]=ch0_ddr4_adr_int[3];
        ch0_ddr4_adr[5]=ch0_ddr4_adr_int[6];
        ch0_ddr4_adr[6]=ch0_ddr4_adr_int[5];
        ch0_ddr4_adr[7]=ch0_ddr4_adr_int[8];
        ch0_ddr4_adr[8]=ch0_ddr4_adr_int[7];
        ch0_ddr4_adr[11]=ch0_ddr4_adr_int[13];
        ch0_ddr4_adr[13]=ch0_ddr4_adr_int[11];
        ch0_ddr4_ba[0] = ch0_ddr4_ba_int[1];
        ch0_ddr4_ba[1] = ch0_ddr4_ba_int[0];
        if (BANK_GROUP_WIDTH >1) begin //BG1 is not valid for x16 DRAM components. For x16 DRAM components signal BG0 will be wired to DRAM ball BG0 for both ranks.
          ch0_ddr4_bg[0] = ch0_ddr4_bg_int[1];
          ch0_ddr4_bg[1] = ch0_ddr4_bg_int[0];
        end
      end
    end
  end
end
always @ (*) begin
  ch1_ddr4_adr=ch1_ddr4_adr_int;
  ch1_ddr4_ba=ch1_ddr4_ba_int;
  ch1_ddr4_bg = ch1_ddr4_bg_int;
  if ( (CA_MIRROR == 1) && (XLNX_RESPONDER==0))begin //CA mirroring for Odd ranks in DIMM configurations - with 3rdparty responders
    for (int i=0; i <CS_WIDTH ; i=i+1 ) begin
      if ( ((i%2)==1) && ch1_ddr4_cs_n[i]==0) begin
        ch1_ddr4_adr[3]=ch1_ddr4_adr_int[4];
        ch1_ddr4_adr[4]=ch1_ddr4_adr_int[3];
        ch1_ddr4_adr[5]=ch1_ddr4_adr_int[6];
        ch1_ddr4_adr[6]=ch1_ddr4_adr_int[5];
        ch1_ddr4_adr[7]=ch1_ddr4_adr_int[8];
        ch1_ddr4_adr[8]=ch1_ddr4_adr_int[7];
        ch1_ddr4_adr[11]=ch1_ddr4_adr_int[13];
        ch1_ddr4_adr[13]=ch1_ddr4_adr_int[11];
        ch1_ddr4_ba[0] = ch1_ddr4_ba_int[1];
        ch1_ddr4_ba[1] = ch1_ddr4_ba_int[0];
        if (BANK_GROUP_WIDTH >1) begin  //BG1 is not valid for x16 DRAM components. For x16 DRAM components signal BG0 will be wired to DRAM ball BG0 for both ranks.
          ch1_ddr4_bg[0] = ch1_ddr4_bg_int[1];
          ch1_ddr4_bg[1] = ch1_ddr4_bg_int[0];
        end
      end
    end
  end
end
//register wires declaration
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_0_ing  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_0_egr  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_0_r_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_0_w_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_1_ing  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_1_egr  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_1_r_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_1_w_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_2_ing  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_2_egr  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_2_r_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_2_w_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_3_ing  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_3_egr  ; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_3_r_egr; 
wire [`REG_WIDTH-1:0]                  npi_reg_ddrmc_nsu_3_w_egr; 
 wire                                  npi_reg_ddrmc_nsu_0_ing_ecc_chk_en     ; 
 wire                                  npi_reg_ddrmc_nsu_0_ing_dbi_en         ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_ing_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_ing_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_ing_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_ing_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_ing_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_0_ing_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_0_ing_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_0_ing_ber_vc_vld     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_egr_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_egr_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_egr_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_egr_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_0_egr_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_0_egr_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_0_egr_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_0_egr_ber_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_0_r_egr_llr_vc_pri   ; 
 wire                                  npi_reg_ddrmc_nsu_0_r_egr_isor_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_0_r_egr_ber_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_0_r_egr_llr_vc_token ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_0_r_egr_isor_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_0_r_egr_ber_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_0_w_egr_isow_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_0_w_egr_bew_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_0_w_egr_isow_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_0_w_egr_bew_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_1_ing_ecc_chk_en     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_ing_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_ing_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_ing_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_ing_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_ing_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_1_ing_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_1_ing_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_1_ing_ber_vc_vld     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_egr_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_egr_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_egr_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_egr_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_1_egr_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_1_egr_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_1_egr_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_1_egr_ber_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_1_r_egr_llr_vc_pri   ; 
 wire                                  npi_reg_ddrmc_nsu_1_r_egr_isor_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_1_r_egr_ber_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_1_r_egr_llr_vc_token ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_1_r_egr_isor_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_1_r_egr_ber_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_1_w_egr_isow_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_1_w_egr_bew_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_1_w_egr_isow_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_1_w_egr_bew_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_2_ing_ecc_chk_en     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_ing_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_ing_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_ing_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_ing_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_ing_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_2_ing_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_2_ing_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_2_ing_ber_vc_vld     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_egr_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_egr_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_egr_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_egr_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_2_egr_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_2_egr_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_2_egr_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_2_egr_ber_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_2_r_egr_llr_vc_pri   ; 
 wire                                  npi_reg_ddrmc_nsu_2_r_egr_isor_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_2_r_egr_ber_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_2_r_egr_llr_vc_token ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_2_r_egr_isor_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_2_r_egr_ber_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_2_w_egr_isow_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_2_w_egr_bew_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_2_w_egr_isow_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_2_w_egr_bew_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_3_ing_ecc_chk_en     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_ing_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_ing_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_ing_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_ing_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_ing_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_3_ing_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_3_ing_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_3_ing_ber_vc_vld     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_egr_llr_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_egr_isor_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_egr_ber_vc_map     ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_egr_isow_vc_map    ; 
 wire [2:0]                            npi_reg_ddrmc_nsu_3_egr_bew_vc_map     ; 
 wire                                  npi_reg_ddrmc_nsu_3_egr_llr_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_3_egr_isor_vc_vld    ; 
 wire                                  npi_reg_ddrmc_nsu_3_egr_ber_vc_vld     ; 
 wire                                  npi_reg_ddrmc_nsu_3_r_egr_llr_vc_pri   ; 
 wire                                  npi_reg_ddrmc_nsu_3_r_egr_isor_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_3_r_egr_ber_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_3_r_egr_llr_vc_token ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_3_r_egr_isor_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_3_r_egr_ber_vc_token ; 
 wire                                  npi_reg_ddrmc_nsu_3_w_egr_isow_vc_pri  ; 
 wire                                  npi_reg_ddrmc_nsu_3_w_egr_bew_vc_pri   ; 
 wire [7:0]                            npi_reg_ddrmc_nsu_3_w_egr_isow_vc_token; 
 wire [7:0]                            npi_reg_ddrmc_nsu_3_w_egr_bew_vc_token ;
 wire [31:0]   reg_nsu0_port;
 wire [31:0]   reg_nsu1_port;
 wire [31:0]   reg_nsu2_port;
 wire [31:0]   reg_nsu3_port;
 wire [31:0] reg_safe_config0                     ;   
 wire [6:0] reg_safe_config0_tccd_s_sr            ;      
 wire [6:0] reg_safe_config0_tccd_l_sr            ;  
 wire [4:0] reg_safe_config0_trrd_s               ;  
 wire [4:0] reg_safe_config0_trrd_l               ;  
 wire [7:0] reg_safe_config0_tfaw                 ;
 wire [31:0] reg_safe_config1                     ;   
 wire [6:0] reg_safe_config1_tcs_r2r_dr           ;     
 wire [6:0] reg_safe_config1_tcs_r2r_sr_dlr       ;     
 wire [6:0] reg_safe_config1_tcs_w2w_dr           ;     
 wire [6:0] reg_safe_config1_tcs_w2w_sr_dlr       ;       
 wire [3:0] reg_safe_config1_trrd_dlr             ;   
 wire [31:0] reg_safe_config2                     ;   
 wire [5:0] reg_safe_config2_trcd                 ;   
 wire [5:0] reg_safe_config2_trp                  ;  
 wire [6:0] reg_safe_config2_tras                 ;  
 wire [6:0] reg_safe_config2_trc                  ; 
 wire [5:0] reg_safe_config2_tfaw_dlr             ;      
 wire [31:0] reg_safe_config3                     ;   
 wire [6:0] reg_safe_config3_tcs_w2r_l_sr         ;       
 wire [6:0] reg_safe_config3_tcs_w2r_s_sr         ;       
 wire [6:0] reg_safe_config3_tcs_w2r_dr           ;    
 wire [6:0] reg_safe_config3_tcs_w2r_sr_dlr       ;         
 wire [31:0] reg_safe_config4                     ;   
 wire [4:0] reg_safe_config4_trtp                 ;  
 wire [6:0] reg_safe_config4_tcs_r2w_sr           ;        
 wire [6:0] reg_safe_config4_tcs_r2w_dr           ;        
 wire [6:0] reg_safe_config4_tcs_w2p              ;     
 wire [31:0] reg_safe_config5                     ;   
 wire [6:0] reg_safe_config5_cas_latency          ;  
 wire [6:0] reg_safe_config5_cwl                  ;  
 wire [5:0] reg_safe_config5_trp_ab               ;
 wire [6:0] reg_safe_config5_tccdmw               ;
 wire [2:0] reg_safe_config5_add_cmd_delay        ;                                           
 wire       reg_safe_config5_add_cmd_delay_en     ;
 wire [31:0] reg_safe_config6                     ;   
 wire [15:0] reg_safe_config6_trefi               ;   
 wire [31:0] reg_safe_config7                     ;   
 wire [9:0] reg_safe_config7_trfc_slr_ab          ;              
 wire [9:0] reg_safe_config7_trfc_dlr_pb          ;              
 wire [9:0] reg_safe_config7_trfc_r2r             ;           
 wire [31:0] reg_safe_config8                     ;   
 wire [15:0] reg_safe_config8_tzqcs               ;
 wire [31:0] reg_ref_0                            ;
 wire [1:0] reg_ref_0_refresh_speed               ;
                                                  
 wire [31:0] reg_txn_config                       ;
 wire [15:0] reg_txn_config_rd_wr_timeout         ;
                                                  
 wire [31:0] reg_wr_config                        ;
 wire [4:0] reg_wr_config_full_threshold          ;
                                                  
 wire [31:0] reg_rd_config                        ;
 wire [4:0] reg_rd_config_full_threshold          ;
 wire [9:0] reg_rd_config_iso_timeout             ;
 wire [9:0] reg_rd_config_ll_timeout              ;
                                                  
 wire [31:0] reg_pt_config                        ;
 wire [1:0] reg_pt_config_page_policy             ;
 wire [15:0] reg_pt_config_page_timer             ;
                                                  
 wire [31:0] reg_dram_arb                         ;
 wire [4:0] reg_dram_arb_write_level_hi           ;
 wire [4:0] reg_dram_arb_write_level_lo           ;
                                                  
 wire [31:0] reg_pinout                           ;
 wire [3:0] reg_pinout_po_select                  ;
 wire       reg_pinout_ecc_encode_en              ;
 wire       reg_pinout_correct_en                 ;
 wire       reg_pinout_ecc_io_enable              ;
                                                  
                                                  
 wire [31:0] reg_config0                          ;   
 wire reg_config0_dram_type                       ;
 wire [1:0] reg_config0_dram_width                ;
 wire [2:0] reg_config0_dram_size                 ;
 wire [1:0] reg_config0_dimm_type                 ;
 wire [1:0] reg_config0_num_ranks                 ;
 wire reg_config0_num_slots                       ;
 wire reg_config0_num_ch                          ;
 wire [1:0] reg_config0_width_per_ch              ;
 wire [1:0] reg_config0_num_lranks                ;
 wire reg_config0_dm_en                           ;
 wire reg_config0_wr_dbi_en                       ;
 wire reg_config0_rd_dbi_en                       ;
                                                  
 wire [31:0] reg_config1                          ;   
 wire  reg_config1_ref_mode                       ;
 wire  reg_config1_ref_en_0                       ;
 wire  reg_config1_ref_en_1                       ;
                                                  
 wire [31:0] reg_config2                          ;                  
 wire reg_config2_per_rd_en                       ;
 wire [19:0]  reg_config2_per_rd_interval         ;
 
 wire [31:0] reg_rd_drr_tkn_p0                    ; 
 wire [7:0] reg_rd_drr_tkn_p0_llr                 ;
 wire [7:0] reg_rd_drr_tkn_p0_isocr               ;
 wire [7:0] reg_rd_drr_tkn_p0_ber                 ;
                            
 wire [31:0] reg_wr_drr_tkn_p0                    ;
 wire [7:0] reg_wr_drr_tkn_p0_isocw               ;
 wire [7:0] reg_wr_drr_tkn_p0_bew                 ;
                            
 wire [31:0] reg_rd_drr_tkn_p1                    ; 
 wire [7:0] reg_rd_drr_tkn_p1_llr                 ;
 wire [7:0] reg_rd_drr_tkn_p1_isocr               ;
 wire [7:0] reg_rd_drr_tkn_p1_ber                 ;
                            
 wire [31:0] reg_wr_drr_tkn_p1                    ;
 wire [7:0] reg_wr_drr_tkn_p1_isocw               ;
 wire [7:0] reg_wr_drr_tkn_p1_bew                 ;
                            
 wire [31:0] reg_rd_drr_tkn_p2                    ; 
 wire [7:0] reg_rd_drr_tkn_p2_llr                 ;
 wire [7:0] reg_rd_drr_tkn_p2_isocr               ;
 wire [7:0] reg_rd_drr_tkn_p2_ber                 ;
                            
 wire [31:0] reg_wr_drr_tkn_p2                    ;
 wire [7:0] reg_wr_drr_tkn_p2_isocw               ;
 wire [7:0] reg_wr_drr_tkn_p2_bew                 ;
                            
 wire [31:0] reg_rd_drr_tkn_p3                    ; 
 wire [7:0] reg_rd_drr_tkn_p3_llr                 ;
 wire [7:0] reg_rd_drr_tkn_p3_isocr               ;
 wire [7:0] reg_rd_drr_tkn_p3_ber                 ;
                            
 wire [31:0] reg_wr_drr_tkn_p3                    ;
 wire [7:0] reg_wr_drr_tkn_p3_isocw               ;
 wire [7:0] reg_wr_drr_tkn_p3_bew                 ;

 wire [31:0] dc_cmd_credits;        
 wire [5:0]  dc_cmd_credits_init_credits;        
 wire [11:6] dc_cmd_credits_min_credits;        

 wire [2:0] reg_rrob_return_dly;

 wire [31:0] reg_adec0                            ;
 wire [19:0] reg_adec0_low_mem_base               ;
                                                  
 wire [31:0] reg_adec1                            ;   
 wire [19:0] reg_adec1_low_mem_offset             ;
                                                  
 wire [31:0] reg_adec2                            ;
 wire [19:0] reg_adec2_high_mem_base              ;
                                                  
 wire [31:0] reg_adec3                            ;
 wire [31:0] reg_adec3_high_mem_offset            ;
                                                  
 wire [31:0] reg_adec4                            ;
 wire [5:0] reg_adec4_rank_0                      ;
 wire  [5:0] reg_adec4_rank_1                     ;
 wire [5:0] reg_adec4_lrank_0                     ;
 wire [5:0] reg_adec4_lrank_1                     ;
 wire [5:0] reg_adec4_lrank_2                     ;
                                                  
 wire [31:0] reg_adec5                            ;   
 wire [5:0] reg_adec5_row_4                       ;  
 wire [5:0] reg_adec5_row_3                       ;  
 wire [5:0] reg_adec5_row_2                       ;  
 wire [5:0] reg_adec5_row_1                       ;  
 wire [5:0] reg_adec5_row_0                       ;
                                                  
 wire [31:0] reg_adec6                            ;   
 wire [5:0] reg_adec6_row_9                       ;  
 wire [5:0] reg_adec6_row_8                       ;  
 wire [5:0] reg_adec6_row_7                       ;  
 wire [5:0] reg_adec6_row_6                       ;  
 wire [5:0] reg_adec6_row_5                       ;  
                                                  
 wire [31:0] reg_adec7                            ;   
 wire [5:0] reg_adec7_row_14                      ;  
 wire [5:0] reg_adec7_row_13                      ;  
 wire [5:0] reg_adec7_row_12                      ;  
 wire [5:0] reg_adec7_row_11                      ;  
 wire [5:0] reg_adec7_row_10                      ;  
                                                  
 wire [31:0] reg_adec8                            ;   
 wire [5:0] reg_adec8_col_0                       ;  
 wire [5:0] reg_adec8_row_18                      ;  
 wire  [5:0] reg_adec8_row_17                     ;   
 wire [5:0] reg_adec8_row_16                      ;  
 wire [5:0] reg_adec8_row_15                      ;  
                                                  
 wire [31:0] reg_adec9                            ;   
 wire [5:0] reg_adec9_col_5                       ;  
 wire [5:0] reg_adec9_col_4                       ;  
 wire [5:0] reg_adec9_col_3                       ;  
 wire [5:0] reg_adec9_col_2                       ;  
 wire [5:0] reg_adec9_col_1                       ;  
                                                  
                                                  
 wire [31:0] reg_adec10                           ;   
 wire [5:0] reg_adec10_bank_0                     ;  
 wire [5:0] reg_adec10_col_9                      ;  
 wire [5:0] reg_adec10_col_8                      ;  
 wire [5:0] reg_adec10_col_7                      ;  
 wire [5:0] reg_adec10_col_6                      ;  
                                                  
 wire [31:0] reg_adec11                           ;   
 wire [5:0] reg_adec11_ch_sel                     ;  
 wire [5:0] reg_adec11_group_1                    ;  
 wire [5:0] reg_adec11_group_0                    ;  
 wire [5:0] reg_adec11_bank_1                     ;  
                                                  
 wire [31:0] reg_qos0                             ;
 wire  reg_qos0_arb_mode                          ;
 wire [11:0] reg_qos0_rd_threshold                ;
 wire [11:0] reg_qos0_wr_threshold                ;
                                                  
 wire [31:0] reg_qos1                             ;
 wire [9:0] reg_qos1_llr_token                    ;
 wire [9:0] reg_qos1_isor_token                   ;
 wire [9:0] reg_qos1_ber_token                    ;
                                                  
 wire [31:0] reg_qos2                             ;
 wire [9:0] reg_qos2_isow_token                   ;
 wire [9:0] reg_qos2_bew_token                    ;
                                                  
 wire [31:0] reg_qos_timeout0                     ;
 wire [4:0] reg_qos_timeout0_llr_scale            ;
 wire [4:0] reg_qos_timeout0_isr_scale            ;
 wire [4:0] reg_qos_timeout0_ber_scale            ;
 wire [4:0] reg_qos_timeout0_isw_scale            ;
 wire [4:0] reg_qos_timeout0_bew_scale            ;
                                                  
 wire [31:0] reg_qos_timeout1                     ;
 wire [7:0] reg_qos_timeout1_llr_timeout          ;
 wire [7:0] reg_qos_timeout1_isor_timeout         ;
 wire [7:0] reg_qos_timeout1_ber_timeout          ;
 wire [7:0] reg_qos_timeout1_isow_timeout         ;
                                                  
 wire [31:0] reg_qos_timeout2                     ;
 wire [7:0] reg_qos_timeout2_bew_timeout          ;
                                                  
 wire [31:0] reg_rate_ctrl_scale                  ;
 wire [4:0] reg_rate_ctrl_scale_llr_update_period ;
 wire [4:0] reg_rate_ctrl_scale_isr_update_period ;
 wire [4:0] reg_rate_ctrl_scale_ber_update_period ;
 wire [4:0] reg_rate_ctrl_scale_isw_update_period ;
 wire [4:0] reg_rate_ctrl_scale_bew_update_period ;

 wire [31:0]reg_p0_llr_rate_ctrl                  ;   
 wire [9:0] reg_p0_llr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p0_llr_rate_ctrl_credit_limit     ;   
                                       
 wire [31:0]reg_p0_isr_rate_ctrl                  ;   
 wire [9:0] reg_p0_isr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p0_isr_rate_ctrl_credit_limit     ;   
                                       
 wire [31:0]reg_p0_ber_rate_ctrl                  ;   
 wire [9:0] reg_p0_ber_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p0_ber_rate_ctrl_credit_limit     ;   
                                       
 wire [31:0]reg_p0_isw_rate_ctrl                  ;   
 wire [9:0] reg_p0_isw_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p0_isw_rate_ctrl_credit_limit     ;   
                                       
 wire [31:0]reg_p0_bew_rate_ctrl                  ;   
 wire [9:0] reg_p0_bew_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p0_bew_rate_ctrl_credit_limit     ;   
                                       
 wire [31:0]reg_p1_llr_rate_ctrl                  ;   
 wire [9:0] reg_p1_llr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p1_llr_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p1_isr_rate_ctrl                  ;   
 wire [9:0] reg_p1_isr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p1_isr_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p1_ber_rate_ctrl                  ;   
 wire [9:0] reg_p1_ber_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p1_ber_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p1_isw_rate_ctrl                  ;   
 wire [9:0] reg_p1_isw_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p1_isw_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p1_bew_rate_ctrl                  ;   
 wire [9:0] reg_p1_bew_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p1_bew_rate_ctrl_credit_limit     ;    
                                               
 wire [31:0]reg_p2_llr_rate_ctrl                  ;   
 wire [9:0] reg_p2_llr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p2_llr_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p2_isr_rate_ctrl                  ;   
 wire [9:0] reg_p2_isr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p2_isr_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p2_ber_rate_ctrl                  ;   
 wire [9:0] reg_p2_ber_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p2_ber_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p2_isw_rate_ctrl                  ;   
 wire [9:0] reg_p2_isw_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p2_isw_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p2_bew_rate_ctrl                  ;   
 wire [9:0] reg_p2_bew_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p2_bew_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p3_llr_rate_ctrl                  ;   
 wire [9:0] reg_p3_llr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p3_llr_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p3_isr_rate_ctrl                  ;   
 wire [9:0] reg_p3_isr_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p3_isr_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p3_ber_rate_ctrl                  ;   
 wire [9:0] reg_p3_ber_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p3_ber_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p3_isw_rate_ctrl                  ;   
 wire [9:0] reg_p3_isw_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p3_isw_rate_ctrl_credit_limit     ;   
                                               
 wire [31:0]reg_p3_bew_rate_ctrl                  ;   
 wire [9:0] reg_p3_bew_rate_ctrl_credit_update    ;   
 wire [11:0]reg_p3_bew_rate_ctrl_credit_limit     ;   

 wire [31:0] reg_cmdq_ctrl0                       ;
 wire [4:0] reg_cmdq_ctrl0_llr_threshold_ch0      ;
 wire [4:0] reg_cmdq_ctrl0_isr_threshold_ch0      ;
 wire [4:0] reg_cmdq_ctrl0_ber_threshold_ch0      ;
 wire [4:0] reg_cmdq_ctrl0_isw_threshold_ch0      ;
 wire [4:0] reg_cmdq_ctrl0_bew_threshold_ch0      ;
                                                  
 wire [31:0] reg_cmdq_ctrl1                       ;
 wire [4:0] reg_cmdq_ctrl1_llr_threshold_ch1      ;
 wire [4:0] reg_cmdq_ctrl1_isr_threshold_ch1      ;
 wire [4:0] reg_cmdq_ctrl1_ber_threshold_ch1      ;
 wire [4:0] reg_cmdq_ctrl1_isw_threshold_ch1      ;
 wire [4:0] reg_cmdq_ctrl1_bew_threshold_ch1      ;
                                                  
 wire [31:0] reg_cmdq_llr_rate_ctrl               ;
 wire [9:0] reg_cmdq_llr_rate_ctrl_credit_update  ;
 wire [11:0] reg_cmdq_llr_rate_ctrl_credit_limit  ;
                                                  
 wire [31:0] reg_cmdq_isr_rate_ctrl               ;
 wire [9:0] reg_cmdq_isr_rate_ctrl_credit_update  ;
 wire [11:0] reg_cmdq_isr_rate_ctrl_credit_limit  ;
                                                  
 wire [31:0] reg_cmdq_ber_rate_ctrl               ;
 wire [9:0] reg_cmdq_ber_rate_ctrl_credit_update  ;
 wire [11:0] reg_cmdq_ber_rate_ctrl_credit_limit  ;
                                                  
 wire [31:0] reg_cmdq_isw_rate_ctrl               ;
 wire [9:0] reg_cmdq_isw_rate_ctrl_credit_update  ;
 wire [11:0] reg_cmdq_isw_rate_ctrl_credit_limit  ;
                                                  
 wire [31:0] reg_cmdq_bew_rate_ctrl               ;
 wire [9:0] reg_cmdq_bew_rate_ctrl_credit_update  ;
 wire [11:0] reg_cmdq_bew_rate_ctrl_credit_limit  ;

 wire [31:0] reg_qos_rate_ctrl_scale;
 wire [4:0] reg_qos_rate_ctrl_scale_llr_update_period;
 wire [9:5] reg_qos_rate_ctrl_scale_isr_update_period;
 wire [14:10] reg_qos_rate_ctrl_scale_ber_update_period;
 wire [19:15] reg_qos_rate_ctrl_scale_isw_update_period;
 wire [24:20] reg_qos_rate_ctrl_scale_bew_update_period;
 
 wire [15:0]reg_txn_config_txnq_rd_starved_timer;
 wire       reg_txn_config_txnq_all_cmd_arb_mode;
 wire       reg_txn_config_txnq_rd_pri_arb_only_mode;
 wire       reg_txn_config_txnq_rd_pri_and_starved_arb_only_mode;
 wire       reg_txn_config_txnq_rd_pri_wr_pri_arb_only_mode;
 

 wire [15:0]reg_wr_config_txnq_wr_rd_pri_timer;
 wire [15:0]reg_wr_config_txnq_wr_top_timer;

  wire [31:0]txnq_rd_priority;
 wire [7:0] txnq_rd_priority_th_low;
 wire [7:0] txnq_rd_priority_th_med;
 wire [7:0] txnq_rd_priority_th_high;
 wire       txnq_rd_priority_skip_count_en;
 wire       txnq_rd_priority_only_read;
 
 wire [31:0]txnq_wr_priority;
 wire [7:0] txnq_wr_priority_th_low;
 wire [7:0] txnq_wr_priority_th_med;
 wire [7:0] txnq_wr_priority_th_high;
 wire       txnq_wr_priority_skip_count_en;                      

 wire [31:0]reg_retry_0;
 wire [5:0] reg_retry_0_rmw_fifo_dealloc_period;
 wire [31:0]reg_retry_1;
 wire [5:0] reg_retry_1_retry_fifo_dealloc_period;
 wire [5:0] reg_retry_1_wr_fifo_dealloc_period;
 
 wire [2:0] xpi_write_dm_dbi_config;
 wire  xpi_read_dbi_en;

//end of registers wire declaration

`ifndef BFM_SIMULATION
    noc_mc_ddr4_v1_0_address_mapping_checks adec_check;
 initial begin
 
     
    adec_check = new();
    adec_check.REG_ADEC0 = REG_ADEC0;
    adec_check.REG_ADEC1 = REG_ADEC1;
    adec_check.REG_ADEC2 = REG_ADEC2;
    adec_check.REG_ADEC3 = REG_ADEC3;
    adec_check.REG_ADEC4 = REG_ADEC4;
    adec_check.REG_ADEC5 = REG_ADEC5;
    adec_check.REG_ADEC6 = REG_ADEC6;
    adec_check.REG_ADEC7 = REG_ADEC7;
    adec_check.REG_ADEC8 = REG_ADEC8;
    adec_check.REG_ADEC9 = REG_ADEC9;
    adec_check.REG_ADEC10 = REG_ADEC10;
    adec_check.REG_ADEC11 = REG_ADEC11;
    adec_check.REG_CONFIG0 = REG_CONFIG0;
    adec_check.check_config_task();

    //adec_check.check_config();

end  
`endif

  assign flit_from_npg[0] = noc2dmc_data_in_0;
  assign valid_from_npg[0] = noc2dmc_valid_in_0;
  assign credit_rdy_from_npg[0] = noc2dmc_credit_rdy_0;
  assign dmc2noc_credit_rtn_0    = credit_return_to_npg[0];  

  assign flit_from_npg[1] = noc2dmc_data_in_1;
  assign valid_from_npg[1] = noc2dmc_valid_in_1;
  assign credit_rdy_from_npg[1] = noc2dmc_credit_rdy_1;
  assign dmc2noc_credit_rtn_1    = credit_return_to_npg[1];  
  
  assign flit_from_npg[2] = noc2dmc_data_in_2;
  assign valid_from_npg[2] = noc2dmc_valid_in_2;
  assign credit_rdy_from_npg[2] = noc2dmc_credit_rdy_2;
  assign dmc2noc_credit_rtn_2    = credit_return_to_npg[2];  

  assign flit_from_npg[3] = noc2dmc_data_in_3;
  assign valid_from_npg[3] = noc2dmc_valid_in_3;
  assign credit_rdy_from_npg[3] = noc2dmc_credit_rdy_3;
  assign dmc2noc_credit_rtn_3    = credit_return_to_npg[3];  

  assign dmc2noc_valid_out_0 = valid_to_npg[0];
  assign dmc2noc_data_out_0  = flit_to_npg[0];
  assign dmc2noc_credit_rdy_0 = credit_rdy_to_npg[0];
  assign credit_return_from_npg[0] = noc2dmc_credit_rtn_0;
  
  assign dmc2noc_valid_out_1 = valid_to_npg[1];
  assign dmc2noc_data_out_1  = flit_to_npg[1];
  assign dmc2noc_credit_rdy_1 = credit_rdy_to_npg[1];
  assign credit_return_from_npg[1] = noc2dmc_credit_rtn_1;
  
  assign dmc2noc_valid_out_2 = valid_to_npg[2];
  assign dmc2noc_data_out_2  = flit_to_npg[2];
  assign dmc2noc_credit_rdy_2 = credit_rdy_to_npg[2];
  assign credit_return_from_npg[2] = noc2dmc_credit_rtn_2;
  
  assign dmc2noc_valid_out_3 = valid_to_npg[3];
  assign dmc2noc_data_out_3  = flit_to_npg[3];
  assign dmc2noc_credit_rdy_3 = credit_rdy_to_npg[3];
  assign credit_return_from_npg[3] = noc2dmc_credit_rtn_3;

// Write port for write data from the NA write buffer 
 bit mc_rst_1;
 logic  [8:0] mc_rst;
// ADEC Interface to NA Block  
wire [1:0]                        na2dc_txn_push;     
wire [1:0]                        na2dc_txn_type_read;
wire [`MC_QOS_CLS-1:0]            na2dc_txn_qos[NUM_OF_CHS_1];      
wire [1:0]                        na2dc_txn_partial;
wire [`TXN_ADDR_WIDTH-1:0]        na2dc_txn_address[NUM_OF_CHS_1];  
wire [1:0]                        na2dc_txn_exokay;   
wire [12:0]                       na2dc_txn_timer[NUM_OF_CHS_1];
wire [1:0]                        na2dc_txn_align_strb;
wire [1:0]                        na2dc_llr_tmr_update;
wire [1:0]                        na2dc_isr_tmr_update;
wire [1:0]                        na2dc_ber_tmr_update;
wire [1:0]                        na2dc_isw_tmr_update;
wire [1:0]                        na2dc_bew_tmr_update;

`ifdef NON_S80
 	wire [`NA_RROB_PTR:0]            na2dc_txn_rrob_add[NUM_OF_CHS_1];
 	wire [`NA_RROB_PTR:0]            na2dc_txn_rrob_add_1;
 	wire [`NA_RROB_PTR:0]            dc2na_rd_wrap_rrob_ptr[NUM_OF_CHS_1];
 	wire [`NA_RROB_PTR:0]            dc2na_rd_addr[NUM_OF_CHS_1];
 	wire [`NA_RROB_PTR:0]            dc2na_rd_wrap_rrob_ptr_0;
 	wire [`NA_RROB_PTR:0]            dc2na_rd_wrap_rrob_ptr_1;
 	wire [`NA_RROB_PTR:0]            dc2na_rd_addr_1;
`else
 	wire [`NA_RROB_PTR-1:0]          na2dc_txn_rrob_add[NUM_OF_CHS_1];
 	wire [`NA_RROB_PTR-1:0]          na2dc_txn_rrob_add_1;
 	wire [`NA_RROB_PTR-1:0]          dc2na_rd_wrap_rrob_ptr[NUM_OF_CHS_1];
 	wire [`NA_RROB_PTR-1:0]          dc2na_rd_addr[NUM_OF_CHS_1];
 	wire [`NA_RROB_PTR-1:0]          dc2na_rd_wrap_rrob_ptr_0;
 	wire [`NA_RROB_PTR-1:0]          dc2na_rd_wrap_rrob_ptr_1;
 	wire [`NA_RROB_PTR-1:0]          dc2na_rd_addr_1;
`endif

wire			          na2dc_rret_almost_full0;
wire			          na2dc_rret_almost_full1;
wire			          na2dc_raww_almost_full0;
wire			          na2dc_raww_almost_full1;



// ACAM Interface to NA Block  
wire                              na2dc_txn_push_1;     
wire                              na2dc_txn_type_read_1;
wire [`MC_QOS_CLS-1:0]            na2dc_txn_qos_1;      
wire                              na2dc_txn_partial_1;
wire [`TXN_ADDR_WIDTH-1:0]        na2dc_txn_address_1;  
wire                              na2dc_txn_exokay_1;   
wire [12:0]                       na2dc_txn_timer_1;
wire                              na2dc_txn_align_strb_1;

wire                              na2dc_llr_tmr_update_1;
wire                              na2dc_isr_tmr_update_1;
wire                              na2dc_ber_tmr_update_1;
wire                              na2dc_isw_tmr_update_1;
wire                              na2dc_bew_tmr_update_1;

wire                              dc2na_full_llr[NUM_OF_CHS_1] ;   
wire                              dc2na_full_isochr[NUM_OF_CHS_1];
wire                              dc2na_full_ber[NUM_OF_CHS_1];   
wire                              dc2na_full_isochw[NUM_OF_CHS_1];
wire                              dc2na_full_bew[NUM_OF_CHS_1];
wire  [WDB_DATA_WIDTH-1:0]        dc2na_rd_data[NUM_OF_CHS_1];
wire                              dc2na_rd_data_en[NUM_OF_CHS_1];
wire                              dc2na_rd_wrap_det[NUM_OF_CHS_1];
wire [4:0]                        dc2na_txnq_pop[1:0];
wire                              dc2na_full_llr_1;   
wire                              dc2na_full_isochr_1;
wire                              dc2na_full_ber_1;   
wire                              dc2na_full_isochw_1;
wire                              dc2na_full_bew_1;

wire  [WDB_DATA_WIDTH-1:0]        na2dc_wr_data[NUM_OF_CHS_1];
wire  [WDB_DM_WIDTH-1:0]          na2dc_byte_en[NUM_OF_CHS_1];
wire  [WDB_DATA_WIDTH-1:0]        wr_data;
wire  [WDB_DM_WIDTH-1:0]          wr_data_byte_en;



wire  [WDB_DATA_WIDTH-1:0]        dc2na_rd_data_0;
wire                              dc2na_rd_data_en_0;
wire                              dc2na_rd_wrap_det_0;


wire  [WDB_DATA_WIDTH-1:0]        dc2na_rd_data_1;
wire                              dc2na_rd_data_en_1;
wire                              dc2na_rd_wrap_det_1;
wire [3:0]   mc_odisable;

assign na2dc_txn_partial[0]     =   ((~&wr_data_byte_en) & ~na2dc_txn_type_read[0] & na2dc_txn_push[0]) ;
 
assign na2dc_txn_align_strb[0]  =   (na2dc_txn_type_read[0] & na2dc_txn_push[0])? 'd0: ~na2dc_txn_partial[0];

assign na2dc_txn_push[1]        =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_push_1;     
assign na2dc_txn_type_read[1]   =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_type_read_1;
assign na2dc_txn_qos[1]         =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_qos_1;      
assign na2dc_txn_partial[1]     =   (NUM_OF_CHS[0] == 1)? 'd0 : ((~&wr_data_byte_en) & na2dc_txn_push[1] & ~na2dc_txn_type_read[1]) ;
//assign na2dc_txn_align_strb[1]  =   (NUM_OF_CHS[0] == 1) ? 'd0 : & na2dc_txn_type_read[0] ? 'd0 : na2dc_txn_align_strb_1;
assign na2dc_txn_align_strb[1]  =   (NUM_OF_CHS[0] == 1)? 'd0 : ((na2dc_txn_type_read[1] & na2dc_txn_push[1]) ? 'd0 :(~na2dc_txn_partial[1]));
assign na2dc_txn_address[1]     =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_address_1;  
assign na2dc_txn_exokay[1]      =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_exokay_1;   
assign na2dc_txn_rrob_add[1]    =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_rrob_add_1;
assign na2dc_txn_timer[1]       =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_txn_timer_1;
assign na2dc_llr_tmr_update[1]  =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_llr_tmr_update[0];
assign na2dc_isr_tmr_update[1]  =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_isr_tmr_update[0];
assign na2dc_ber_tmr_update[1]  =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_ber_tmr_update[0];
assign na2dc_isw_tmr_update[1]  =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_isw_tmr_update[0];
assign na2dc_bew_tmr_update[1]  =   (NUM_OF_CHS[0] == 1)? 'd0 : na2dc_bew_tmr_update[0];

assign na2dc_byte_en[0]         =   wr_data_byte_en;
assign na2dc_wr_data[0]         =   wr_data;

assign na2dc_byte_en[1]         =   (NUM_OF_CHS[0] == 1)? 'd0 : wr_data_byte_en;
assign na2dc_wr_data[1]         =   (NUM_OF_CHS[0] == 1)? 'd0 : wr_data;

assign dc2na_full_llr_1         =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_full_llr[1] ;   
assign dc2na_full_isochr_1      =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_full_isochr[1];
assign dc2na_full_ber_1         =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_full_ber[1];   
assign dc2na_full_isochw_1      =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_full_isochw[1];
assign dc2na_full_bew_1         =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_full_bew[1];
assign dc2na_rd_data_1          =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_rd_data[1] ;
assign dc2na_rd_data_en_1       =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_rd_data_en[1];
assign dc2na_rd_wrap_det_1      =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_rd_wrap_det[1];
assign dc2na_rd_wrap_rrob_ptr_1 =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_rd_wrap_rrob_ptr[1];
assign dc2na_rd_addr_1          =   (NUM_OF_CHS[0] == 1)? 'd0 : dc2na_rd_addr[1];



//*********************************************************
//Immediate Assertions
//*********************************************************

initial 
   begin
    //assert(TCK !=0 )
    //else $error("TCK holding zero value");
    assert(REG_SAFE_CONFIG0 != 0)
    else $error("REG_SAFE_CONFIG0 holding zero values");
    assert(REG_SAFE_CONFIG1 != 0)
    else $error("REG_SAFE_CONFIG1 holding zero values");
    assert(REG_SAFE_CONFIG2 != 0)
    else $error("REG_SAFE_CONFIG2 holding zero values");
    assert(REG_SAFE_CONFIG3 != 0)
    else $error("REG_SAFE_CONFIG3 holding zero values");
    assert(REG_SAFE_CONFIG4 != 0)
    else $error("REG_SAFE_CONFIG4 holding zero values");
    //assert(REG_SAFE_CONFIG5 != 0)// CL and CWL
    //else $error("REG_SAFE_CONFIG5 holding zero values");
    assert(REG_SAFE_CONFIG6 != 0)
    else $error("REG_SAFE_CONFIG6 holding zero values");
    assert(REG_SAFE_CONFIG7 != 0)
    else $error("REG_SAFE_CONFIG7 holding zero values");
    //assert(REG_SAFE_CONFIG8 != 0)
    //else $error("REG_SAFE_CONFIG8 holding zero values");
    assert(REG_ADEC4 != 0)
    else $error("REG_ADEC4 holding zero values");
    assert(REG_ADEC5 != 0)
    else $error("REG_ADEC5 holding zero values");
    assert(REG_ADEC6 != 0)
    else $error("REG_ADEC6 holding zero values");
    assert(REG_ADEC7 != 0)
    else $error("REG_ADEC7 holding zero values");
    assert(REG_ADEC8 != 0)
    else $error("REG_ADEC8 holding zero values");
    assert(REG_ADEC9 != 0)
    else $error("REG_ADEC9 holding zero values");
    assert(REG_ADEC10 != 0)
    else $error("REG_ADEC10 holding zero values");
    assert(REG_ADEC11 != 0)
    else $error("REG_ADEC11 holding zero values");

   end
/////**************************************************************************************************************************///////////////////////////////////
//TODO the VCs checked are currently 0-4. It needs to be updated basde on the register programming. 
`ifdef MULTI_MASTER 
  `define NUM_OF_PORTS_EN 4
`else
  `define NUM_OF_PORTS_EN 1
`endif 
`ifdef EN_SB_MON_BFM
logic [5:0] credit_count[`NUM_OF_PORTS_EN][5];
logic [5:0] credit_count_egr[`NUM_OF_PORTS_EN][5];
genvar j,k,x,y;
generate
  for(k=0;k<`NUM_OF_PORTS_EN;k++)begin
     for(j=0;j<5;j++)begin
        always@(posedge noc_c)begin
           //if(~noc_rst_n)begin
           if(~reset_n)begin
             credit_count[k][j] = '0;
           end else if((credit_return_to_npg[k][j] && valid_from_npg[k][j]))begin
             credit_count[k][j] = credit_count[k][j] ;
             //$display("credit_count[%d][%d] = %p",k,j,credit_count[k][j],$time);
           end else if(credit_return_to_npg[k][j])begin
             credit_count[k][j] = credit_count[k][j] + 1;
             //$display("credit_count[%d][%d]+ = %p",k,j,credit_count[k][j],$time);
           end else if(valid_from_npg[k][j])begin
             credit_count[k][j] = credit_count[k][j] - 1;
             //$display("credit_count[%d][%d]- = %p",k,j,credit_count[k][j],$time);
           end
        end
     end
  end
endgenerate


 
generate
  for(x=0;x<`NUM_OF_PORTS_EN;x++)begin
     for(y=0;y<5;y++)begin
        always@(posedge noc_c)begin
           //if(~noc_rst_n)begin
           if(~reset_n)begin
             credit_count_egr[x][y] = '0;
           end else if((valid_to_npg[x][y] && credit_return_from_npg[x][y] ))begin
             credit_count_egr[x][y] = credit_count_egr[x][y] ;
             //$display("credit_count_egr[%d][%d] = %p",x,y,credit_count_egr[x][y],$time);
           end else if( credit_return_from_npg[x][y] )begin
             credit_count_egr[x][y] = credit_count_egr[x][y] + 1;
             //$display("credit_count_egr[%d][%d]+ = %p",x,y,credit_count_egr[x][y],$time);
           end else if(valid_to_npg[x][y])begin
             credit_count_egr[x][y] = credit_count_egr[x][y] - 1;
             //$display("credit_count_egr[%d][%d]- = %p",x,y,credit_count_egr[x][y],$time);
           end
        end
     end
  end
endgenerate

always@(*)
  for(int m=0;m<`NUM_OF_PORTS_EN;m++)begin
     for(int l=0;l<5;l++)begin
       if(credit_count[m][l]>16)
          $display("ERROR:: incorrect credit_count[%d][%d] = %p",m,l,credit_count[m][l],$time);
     end
  end

always@(*)
  for(int m=0;m<`NUM_OF_PORTS_EN;m++)begin
     for(int l=0;l<5;l++)begin
       if(credit_count_egr[m][l]>16)
          $display("ERROR:: incorrect credit_count_egr[%d][%d] = %p",m,l,credit_count_egr[m][l],$time);
     end
  end
final begin 
    for(int m=0;m<`NUM_OF_PORTS_EN;m++)begin
       for(int l=0;l<5;l++)begin
         if(!((l == 2) || (l == 3) )&& !(credit_count[m][l] == 16))
         //if(!(credit_count[m][l] == 5))
            $display("ERROR:: incorrect credit_count[%d][%d] = %p",m,l,credit_count[m][l],$time);
         else
            $display("INFO:: correct credit_count[%d][%d] = %p",m,l,credit_count[m][l],$time);
         end
    end
end

final begin 
    for(int m=0;m<`NUM_OF_PORTS_EN;m++)begin
       for(int l=0;l<5;l++)begin
         if(!(credit_count_egr[m][l] == 16))
            $display("ERROR:: incorrect credit_count_egr[%d][%d] = %p",m,l,credit_count_egr[m][l],$time);
         else
            $display("INFO:: correct credit_count_egr[%d][%d] = %p",m,l,credit_count_egr[m][l],$time);
       end
    end
end
`endif
/////**************************************************************************************************************************///////////////////////////////////

//reg_block instantiation
noc_na_v1_0_0_reg #(
                      .ARBITER_CONFIG               (ARBITER_CONFIG),
                      .CAL_CS_CH                    (CAL_CS_CH),
                      .CAL_MODE                     (CAL_MODE),
                      .CLK_GATE                     (CLK_GATE),
                      .CPLX_BURST_ARRAY0            (CPLX_BURST_ARRAY0),
                      .CPLX_BURST_ARRAY1            (CPLX_BURST_ARRAY1),
                      .CPLX_BURST_ARRAY10           (CPLX_BURST_ARRAY10),
                      .CPLX_BURST_ARRAY11           (CPLX_BURST_ARRAY11),
                      .CPLX_BURST_ARRAY12           (CPLX_BURST_ARRAY12),
                      .CPLX_BURST_ARRAY13           (CPLX_BURST_ARRAY13),
                      .CPLX_BURST_ARRAY14           (CPLX_BURST_ARRAY14),
                      .CPLX_BURST_ARRAY15           (CPLX_BURST_ARRAY15),
                      .CPLX_BURST_ARRAY16           (CPLX_BURST_ARRAY16),
                      .CPLX_BURST_ARRAY17           (CPLX_BURST_ARRAY17),
                      .CPLX_BURST_ARRAY18           (CPLX_BURST_ARRAY18),
                      .CPLX_BURST_ARRAY19           (CPLX_BURST_ARRAY19),
                      .CPLX_BURST_ARRAY2            (CPLX_BURST_ARRAY2),
                      .CPLX_BURST_ARRAY20           (CPLX_BURST_ARRAY20),
                      .CPLX_BURST_ARRAY21           (CPLX_BURST_ARRAY21),
                      .CPLX_BURST_ARRAY22           (CPLX_BURST_ARRAY22),
                      .CPLX_BURST_ARRAY3            (CPLX_BURST_ARRAY3),
                      .CPLX_BURST_ARRAY4            (CPLX_BURST_ARRAY4),
                      .CPLX_BURST_ARRAY5            (CPLX_BURST_ARRAY5),
                      .CPLX_BURST_ARRAY6            (CPLX_BURST_ARRAY6),
                      .CPLX_BURST_ARRAY7            (CPLX_BURST_ARRAY7),
                      .CPLX_BURST_ARRAY8            (CPLX_BURST_ARRAY8),
                      .CPLX_BURST_ARRAY9            (CPLX_BURST_ARRAY9),
                      .CPLX_CONFIG                  (CPLX_CONFIG),
                      .CPLX_CONFIG2                 (CPLX_CONFIG2),
                      .CPLX_CONFIG3                 (CPLX_CONFIG3),
                      .CPLX_PATTERN0                (CPLX_PATTERN0),
                      .CPLX_PATTERN1                (CPLX_PATTERN1),
                      .CPLX_PATTERN10               (CPLX_PATTERN10),
                      .CPLX_PATTERN100              (CPLX_PATTERN100),
                      .CPLX_PATTERN101              (CPLX_PATTERN101),
                      .CPLX_PATTERN102              (CPLX_PATTERN102),
                      .CPLX_PATTERN103              (CPLX_PATTERN103),
                      .CPLX_PATTERN104              (CPLX_PATTERN104),
                      .CPLX_PATTERN105              (CPLX_PATTERN105),
                      .CPLX_PATTERN106              (CPLX_PATTERN106),
                      .CPLX_PATTERN107              (CPLX_PATTERN107),
                      .CPLX_PATTERN108              (CPLX_PATTERN108),
                      .CPLX_PATTERN109              (CPLX_PATTERN109),
                      .CPLX_PATTERN11               (CPLX_PATTERN11),
                      .CPLX_PATTERN110              (CPLX_PATTERN110),
                      .CPLX_PATTERN111              (CPLX_PATTERN111),
                      .CPLX_PATTERN112              (CPLX_PATTERN112),
                      .CPLX_PATTERN113              (CPLX_PATTERN113),
                      .CPLX_PATTERN114              (CPLX_PATTERN114),
                      .CPLX_PATTERN115              (CPLX_PATTERN115),
                      .CPLX_PATTERN116              (CPLX_PATTERN116),
                      .CPLX_PATTERN117              (CPLX_PATTERN117),
                      .CPLX_PATTERN118              (CPLX_PATTERN118),
                      .CPLX_PATTERN119              (CPLX_PATTERN119),
                      .CPLX_PATTERN12               (CPLX_PATTERN12),
                      .CPLX_PATTERN120              (CPLX_PATTERN120),
                      .CPLX_PATTERN121              (CPLX_PATTERN121),
                      .CPLX_PATTERN122              (CPLX_PATTERN122),
                      .CPLX_PATTERN123              (CPLX_PATTERN123),
                      .CPLX_PATTERN124              (CPLX_PATTERN124),
                      .CPLX_PATTERN125              (CPLX_PATTERN125),
                      .CPLX_PATTERN126              (CPLX_PATTERN126),
                      .CPLX_PATTERN127              (CPLX_PATTERN127),
                      .CPLX_PATTERN128              (CPLX_PATTERN128),
                      .CPLX_PATTERN129              (CPLX_PATTERN129),
                      .CPLX_PATTERN13               (CPLX_PATTERN13),
                      .CPLX_PATTERN130              (CPLX_PATTERN130),
                      .CPLX_PATTERN131              (CPLX_PATTERN131),
                      .CPLX_PATTERN132              (CPLX_PATTERN132),
                      .CPLX_PATTERN133              (CPLX_PATTERN133),
                      .CPLX_PATTERN134              (CPLX_PATTERN134),
                      .CPLX_PATTERN135              (CPLX_PATTERN135),
                      .CPLX_PATTERN136              (CPLX_PATTERN136),
                      .CPLX_PATTERN137              (CPLX_PATTERN137),
                      .CPLX_PATTERN138              (CPLX_PATTERN138),
                      .CPLX_PATTERN139              (CPLX_PATTERN139),
                      .CPLX_PATTERN14               (CPLX_PATTERN14),
                      .CPLX_PATTERN140              (CPLX_PATTERN140),
                      .CPLX_PATTERN141              (CPLX_PATTERN141),
                      .CPLX_PATTERN142              (CPLX_PATTERN142),
                      .CPLX_PATTERN143              (CPLX_PATTERN143),
                      .CPLX_PATTERN144              (CPLX_PATTERN144),
                      .CPLX_PATTERN145              (CPLX_PATTERN145),
                      .CPLX_PATTERN146              (CPLX_PATTERN146),
                      .CPLX_PATTERN147              (CPLX_PATTERN147),
                      .CPLX_PATTERN148              (CPLX_PATTERN148),
                      .CPLX_PATTERN149              (CPLX_PATTERN149),
                      .CPLX_PATTERN15               (CPLX_PATTERN15),
                      .CPLX_PATTERN150              (CPLX_PATTERN150),
                      .CPLX_PATTERN151              (CPLX_PATTERN151),
                      .CPLX_PATTERN152              (CPLX_PATTERN152),
                      .CPLX_PATTERN153              (CPLX_PATTERN153),
                      .CPLX_PATTERN154              (CPLX_PATTERN154),
                      .CPLX_PATTERN155              (CPLX_PATTERN155),
                      .CPLX_PATTERN156              (CPLX_PATTERN156),
                      .CPLX_PATTERN16               (CPLX_PATTERN16),
                      .CPLX_PATTERN17               (CPLX_PATTERN17),
                      .CPLX_PATTERN18               (CPLX_PATTERN18),
                      .CPLX_PATTERN19               (CPLX_PATTERN19),
                      .CPLX_PATTERN2                (CPLX_PATTERN2),
                      .CPLX_PATTERN20               (CPLX_PATTERN20),
                      .CPLX_PATTERN21               (CPLX_PATTERN21),
                      .CPLX_PATTERN22               (CPLX_PATTERN22),
                      .CPLX_PATTERN23               (CPLX_PATTERN23),
                      .CPLX_PATTERN24               (CPLX_PATTERN24),
                      .CPLX_PATTERN25               (CPLX_PATTERN25),
                      .CPLX_PATTERN26               (CPLX_PATTERN26),
                      .CPLX_PATTERN27               (CPLX_PATTERN27),
                      .CPLX_PATTERN28               (CPLX_PATTERN28),
                      .CPLX_PATTERN29               (CPLX_PATTERN29),
                      .CPLX_PATTERN3                (CPLX_PATTERN3),
                      .CPLX_PATTERN30               (CPLX_PATTERN30),
                      .CPLX_PATTERN31               (CPLX_PATTERN31),
                      .CPLX_PATTERN32               (CPLX_PATTERN32),
                      .CPLX_PATTERN33               (CPLX_PATTERN33),
                      .CPLX_PATTERN34               (CPLX_PATTERN34),
                      .CPLX_PATTERN35               (CPLX_PATTERN35),
                      .CPLX_PATTERN36               (CPLX_PATTERN36),
                      .CPLX_PATTERN37               (CPLX_PATTERN37),
                      .CPLX_PATTERN38               (CPLX_PATTERN38),
                      .CPLX_PATTERN39               (CPLX_PATTERN39),
                      .CPLX_PATTERN4                (CPLX_PATTERN4),
                      .CPLX_PATTERN40               (CPLX_PATTERN40),
                      .CPLX_PATTERN41               (CPLX_PATTERN41),
                      .CPLX_PATTERN42               (CPLX_PATTERN42),
                      .CPLX_PATTERN43               (CPLX_PATTERN43),
                      .CPLX_PATTERN44               (CPLX_PATTERN44),
                      .CPLX_PATTERN45               (CPLX_PATTERN45),
                      .CPLX_PATTERN46               (CPLX_PATTERN46),
                      .CPLX_PATTERN47               (CPLX_PATTERN47),
                      .CPLX_PATTERN48               (CPLX_PATTERN48),
                      .CPLX_PATTERN49               (CPLX_PATTERN49),
                      .CPLX_PATTERN5                (CPLX_PATTERN5),
                      .CPLX_PATTERN50               (CPLX_PATTERN50),
                      .CPLX_PATTERN51               (CPLX_PATTERN51),
                      .CPLX_PATTERN52               (CPLX_PATTERN52),
                      .CPLX_PATTERN53               (CPLX_PATTERN53),
                      .CPLX_PATTERN54               (CPLX_PATTERN54),
                      .CPLX_PATTERN55               (CPLX_PATTERN55),
                      .CPLX_PATTERN56               (CPLX_PATTERN56),
                      .CPLX_PATTERN57               (CPLX_PATTERN57),
                      .CPLX_PATTERN58               (CPLX_PATTERN58),
                      .CPLX_PATTERN59               (CPLX_PATTERN59),
                      .CPLX_PATTERN6                (CPLX_PATTERN6),
                      .CPLX_PATTERN60               (CPLX_PATTERN60),
                      .CPLX_PATTERN61               (CPLX_PATTERN61),
                      .CPLX_PATTERN62               (CPLX_PATTERN62),
                      .CPLX_PATTERN63               (CPLX_PATTERN63),
                      .CPLX_PATTERN64               (CPLX_PATTERN64),
                      .CPLX_PATTERN65               (CPLX_PATTERN65),
                      .CPLX_PATTERN66               (CPLX_PATTERN66),
                      .CPLX_PATTERN67               (CPLX_PATTERN67),
                      .CPLX_PATTERN68               (CPLX_PATTERN68),
                      .CPLX_PATTERN69               (CPLX_PATTERN69),
                      .CPLX_PATTERN7                (CPLX_PATTERN7),
                      .CPLX_PATTERN70               (CPLX_PATTERN70),
                      .CPLX_PATTERN71               (CPLX_PATTERN71),
                      .CPLX_PATTERN72               (CPLX_PATTERN72),
                      .CPLX_PATTERN73               (CPLX_PATTERN73),
                      .CPLX_PATTERN74               (CPLX_PATTERN74),
                      .CPLX_PATTERN75               (CPLX_PATTERN75),
                      .CPLX_PATTERN76               (CPLX_PATTERN76),
                      .CPLX_PATTERN77               (CPLX_PATTERN77),
                      .CPLX_PATTERN78               (CPLX_PATTERN78),
                      .CPLX_PATTERN79               (CPLX_PATTERN79),
                      .CPLX_PATTERN8                (CPLX_PATTERN8),
                      .CPLX_PATTERN80               (CPLX_PATTERN80),
                      .CPLX_PATTERN81               (CPLX_PATTERN81),
                      .CPLX_PATTERN82               (CPLX_PATTERN82),
                      .CPLX_PATTERN83               (CPLX_PATTERN83),
                      .CPLX_PATTERN84               (CPLX_PATTERN84),
                      .CPLX_PATTERN85               (CPLX_PATTERN85),
                      .CPLX_PATTERN86               (CPLX_PATTERN86),
                      .CPLX_PATTERN87               (CPLX_PATTERN87),
                      .CPLX_PATTERN88               (CPLX_PATTERN88),
                      .CPLX_PATTERN89               (CPLX_PATTERN89),
                      .CPLX_PATTERN9                (CPLX_PATTERN9),
                      .CPLX_PATTERN90               (CPLX_PATTERN90),
                      .CPLX_PATTERN91               (CPLX_PATTERN91),
                      .CPLX_PATTERN92               (CPLX_PATTERN92),
                      .CPLX_PATTERN93               (CPLX_PATTERN93),
                      .CPLX_PATTERN94               (CPLX_PATTERN94),
                      .CPLX_PATTERN95               (CPLX_PATTERN95),
                      .CPLX_PATTERN96               (CPLX_PATTERN96),
                      .CPLX_PATTERN97               (CPLX_PATTERN97),
                      .CPLX_PATTERN98               (CPLX_PATTERN98),
                      .CPLX_PATTERN99               (CPLX_PATTERN99),
                      .DBG_TRIGGER                  (DBG_TRIGGER),
                      .DC_CMD_CREDITS               (DC_CMD_CREDITS),
                      .DEFAULT_PATTERN              (DEFAULT_PATTERN),
                      .EXMON_CLR_EXE                (EXMON_CLR_EXE), 
                      .FIFO_RDEN                    (FIFO_RDEN),
                      .PHY_RANK_READ_OVERRIDE       (PHY_RANK_READ_OVERRIDE),
                      .PHY_RANK_WRITE_OVERRIDE      (PHY_RANK_WRITE_OVERRIDE),
                      .PHY_RDEN0                    (PHY_RDEN0),
                      .PHY_RDEN1                    (PHY_RDEN1),
                      .PHY_RDEN10                   (PHY_RDEN10),
                      .PHY_RDEN11                   (PHY_RDEN11),
                      .PHY_RDEN12                   (PHY_RDEN12),
                      .PHY_RDEN13                   (PHY_RDEN13),
                      .PHY_RDEN14                   (PHY_RDEN14),
                      .PHY_RDEN15                   (PHY_RDEN15),
                      .PHY_RDEN16                   (PHY_RDEN16),
                      .PHY_RDEN17                   (PHY_RDEN17),
                      .PHY_RDEN18                   (PHY_RDEN18),
                      .PHY_RDEN19                   (PHY_RDEN19),
                      .PHY_RDEN2                    (PHY_RDEN2),
                      .PHY_RDEN20                   (PHY_RDEN20),
                      .PHY_RDEN21                   (PHY_RDEN21),
                      .PHY_RDEN22                   (PHY_RDEN22),
                      .PHY_RDEN23                   (PHY_RDEN23),
                      .PHY_RDEN24                   (PHY_RDEN24),
                      .PHY_RDEN25                   (PHY_RDEN25),
                      .PHY_RDEN26                   (PHY_RDEN26),
                      .PHY_RDEN3                    (PHY_RDEN3),
                      .PHY_RDEN4                    (PHY_RDEN4),
                      .PHY_RDEN5                    (PHY_RDEN5),
                      .PHY_RDEN6                    (PHY_RDEN6),
                      .PHY_RDEN7                    (PHY_RDEN7),
                      .PHY_RDEN8                    (PHY_RDEN8),
                      .PHY_RDEN9                    (PHY_RDEN9),
                      .PRBS_CNT                     (PRBS_CNT),
                      .PRBS_CONFIG                  (PRBS_CONFIG),
                      .PRBS_CONFIG2                 (PRBS_CONFIG2),
                      .PRBS_SEED0                   (PRBS_SEED0),
                      .PRBS_SEED1                   (PRBS_SEED1),
                      .PRBS_SEED2                   (PRBS_SEED2),
                      .PRBS_SEED3                   (PRBS_SEED3),
                      .PRBS_SEED4                   (PRBS_SEED4),
                      .PRBS_SEED5                   (PRBS_SEED5),
                      .PRBS_SEED6                   (PRBS_SEED6),
                      .PRBS_SEED7                   (PRBS_SEED7),
                      .PRBS_SEED8                   (PRBS_SEED8),
                      .RAM_SETTING_RF2PHS           (RAM_SETTING_RF2PHS), 
                      .RAM_SETTING_RFSPHD           (RAM_SETTING_RFSPHD),
                      .RAM_SETTING_SRSPHD           (RAM_SETTING_SRSPHD),
                      .REG_ADEC0                    (REG_ADEC0),
                      .REG_ADEC1                    (REG_ADEC1),
                      .REG_ADEC10                   (REG_ADEC10),
                      .REG_ADEC11                   (REG_ADEC11),
                      .REG_ADEC2                    (REG_ADEC2),
                      .REG_ADEC3                    (REG_ADEC3),
                      .REG_ADEC4                    (REG_ADEC4),
                      .REG_ADEC5                    (REG_ADEC5),
                      .REG_ADEC6                    (REG_ADEC6),
                      .REG_ADEC7                    (REG_ADEC7),
                      .REG_ADEC8                    (REG_ADEC8),
                      .REG_ADEC9                    (REG_ADEC9),
                      .REG_CMDQ_BER_RATE_CTRL       (REG_CMDQ_BER_RATE_CTRL),
                      .REG_CMDQ_BEW_RATE_CTRL       (REG_CMDQ_BEW_RATE_CTRL),
                      .REG_CMDQ_CTRL0               (REG_CMDQ_CTRL0),
                      .REG_CMDQ_CTRL1               (REG_CMDQ_CTRL1),
                      .REG_CMDQ_ISR_RATE_CTRL       (REG_CMDQ_ISR_RATE_CTRL),
                      .REG_CMDQ_ISW_RATE_CTRL       (REG_CMDQ_ISW_RATE_CTRL),
                      .REG_CMDQ_LLR_RATE_CTRL       (REG_CMDQ_LLR_RATE_CTRL),
                      .REG_COM_1                    (REG_COM_1),
                      .REG_COM_2                    (REG_COM_2),
                      .REG_COM_3                    (REG_COM_3),
                      .REG_CONFIG0                  (REG_CONFIG0),
                      .REG_CONFIG1                  (REG_CONFIG1),
                      .REG_CONFIG2                  (REG_CONFIG2),
                      .REG_CONFIG3                  (REG_CONFIG3),
                      .REG_CONFIG4                  (REG_CONFIG4),
                      .REG_DRAM_ARB                 (REG_DRAM_ARB),
                      .REG_MRS_0                    (REG_MRS_0),
                      .REG_MRS_1                    (REG_MRS_1),
                      .REG_MRS_2                    (REG_MRS_2),
                      .REG_MRS_7                    (REG_MRS_7),
                      .REG_NSU0_PORT                (REG_NSU0_PORT),
                      .REG_NSU1_PORT                (REG_NSU1_PORT),
                      .REG_NSU2_PORT                (REG_NSU2_PORT),
                      .REG_NSU3_PORT                (REG_NSU3_PORT),
                      .REG_NSU_0_ING                (REG_NSU_0_ING),
                      .REG_NSU_0_EGR                (REG_NSU_0_EGR),
                      .REG_NSU_0_R_EGR              (REG_NSU_0_R_EGR),
                      .REG_NSU_0_W_EGR              (REG_NSU_0_W_EGR),
                      .REG_NSU_1_ING                (REG_NSU_1_ING),
                      .REG_NSU_1_EGR                (REG_NSU_1_EGR),
                      .REG_NSU_1_R_EGR              (REG_NSU_1_R_EGR),
                      .REG_NSU_1_W_EGR              (REG_NSU_1_W_EGR),
                      .REG_NSU_2_ING                (REG_NSU_2_ING),
                      .REG_NSU_2_EGR                (REG_NSU_2_EGR),
                      .REG_NSU_2_R_EGR              (REG_NSU_2_R_EGR),
                      .REG_NSU_2_W_EGR              (REG_NSU_2_W_EGR),
                      .REG_NSU_3_ING                (REG_NSU_3_ING),
                      .REG_NSU_3_EGR                (REG_NSU_3_EGR),
                      .REG_NSU_3_R_EGR              (REG_NSU_3_R_EGR),
                      .REG_NSU_3_W_EGR              (REG_NSU_3_W_EGR),
                      .REG_P0_BER_RATE_CTRL           (REG_P0_BER_RATE_CTRL),
                      .REG_P0_BEW_RATE_CTRL           (REG_P0_BEW_RATE_CTRL),
                      .REG_P0_ISR_RATE_CTRL           (REG_P0_ISR_RATE_CTRL),
                      .REG_P0_ISW_RATE_CTRL           (REG_P0_ISW_RATE_CTRL),
                      .REG_P0_LLR_RATE_CTRL           (REG_P0_LLR_RATE_CTRL),
                      .REG_P1_BER_RATE_CTRL           (REG_P1_BER_RATE_CTRL),
                      .REG_P1_BEW_RATE_CTRL           (REG_P1_BEW_RATE_CTRL),
                      .REG_P1_ISR_RATE_CTRL           (REG_P1_ISR_RATE_CTRL),
                      .REG_P1_ISW_RATE_CTRL           (REG_P1_ISW_RATE_CTRL),
                      .REG_P1_LLR_RATE_CTRL           (REG_P1_LLR_RATE_CTRL),
                      .REG_P2_BER_RATE_CTRL           (REG_P2_BER_RATE_CTRL),
                      .REG_P2_BEW_RATE_CTRL           (REG_P2_BEW_RATE_CTRL),
                      .REG_P2_ISR_RATE_CTRL           (REG_P2_ISR_RATE_CTRL),
                      .REG_P2_ISW_RATE_CTRL           (REG_P2_ISW_RATE_CTRL),
                      .REG_P2_LLR_RATE_CTRL           (REG_P2_LLR_RATE_CTRL),
                      .REG_P3_BER_RATE_CTRL           (REG_P3_BER_RATE_CTRL),
                      .REG_P3_BEW_RATE_CTRL           (REG_P3_BEW_RATE_CTRL),
                      .REG_P3_ISR_RATE_CTRL           (REG_P3_ISR_RATE_CTRL),
                      .REG_P3_ISW_RATE_CTRL           (REG_P3_ISW_RATE_CTRL),
                      .REG_P3_LLR_RATE_CTRL           (REG_P3_LLR_RATE_CTRL),
                      .REG_PINOUT                     (REG_PINOUT),
                      .REG_PT_CONFIG                  (REG_PT_CONFIG),
                      .REG_QOS0                       (REG_QOS0),
                      .REG_QOS1                       (REG_QOS1),
                      .REG_QOS2                       (REG_QOS2),
                      .REG_QOS_RATE_CTRL_SCALE        (REG_QOS_RATE_CTRL_SCALE),
                      .REG_QOS_TIMEOUT0               (REG_QOS_TIMEOUT0),
                      .REG_QOS_TIMEOUT1               (REG_QOS_TIMEOUT1),
                      .REG_QOS_TIMEOUT2               (REG_QOS_TIMEOUT2),
                      .REG_RATE_CTRL_SCALE            (REG_RATE_CTRL_SCALE),
                      .REG_RD_CONFIG                  (REG_RD_CONFIG),
                      .REG_RD_DRR_TKN_P0              (REG_RD_DRR_TKN_P0),
                      .REG_RD_DRR_TKN_P1              (REG_RD_DRR_TKN_P1),
                      .REG_RD_DRR_TKN_P2              (REG_RD_DRR_TKN_P2),
                      .REG_RD_DRR_TKN_P3              (REG_RD_DRR_TKN_P3),
                      .REG_REF_0                      (REG_REF_0),
                      .REG_REF_1                      (REG_REF_1),
                      .REG_REF_2                      (REG_REF_2),
                      .REG_REF_3                      (REG_REF_3),
                      .REG_RETRY_0                    (REG_RETRY_0),
                      .REG_RETRY_1                    (REG_RETRY_1),
                      .REG_SAFE_CONFIG0               (REG_SAFE_CONFIG0),
                      .REG_SAFE_CONFIG1               (REG_SAFE_CONFIG1),
                      .REG_SAFE_CONFIG2               (REG_SAFE_CONFIG2),
                      .REG_SAFE_CONFIG3               (REG_SAFE_CONFIG3),
                      .REG_SAFE_CONFIG4               (REG_SAFE_CONFIG4), 
                      .REG_SAFE_CONFIG5               (REG_SAFE_CONFIG5), 
                      .REG_SAFE_CONFIG6               (REG_SAFE_CONFIG6), 
                      .REG_SAFE_CONFIG7               (REG_SAFE_CONFIG7), 
                      .REG_SAFE_CONFIG8               (REG_SAFE_CONFIG8),
                      .REG_SCRUB0                     (REG_SCRUB0),
                      .REG_SCRUB1                     (REG_SCRUB1),
                      .REG_SCRUB8                     (REG_SCRUB8),
                      .REG_SCRUB9                     (REG_SCRUB9),
                      .REG_TXN_CONFIG                 (REG_TXN_CONFIG),
                      .REG_WR_CONFIG                  (REG_WR_CONFIG),
                      .REG_WR_DRR_TKN_P0              (REG_WR_DRR_TKN_P0),
                      .REG_WR_DRR_TKN_P1              (REG_WR_DRR_TKN_P1),
                      .REG_WR_DRR_TKN_P2              (REG_WR_DRR_TKN_P2),
                      .REG_WR_DRR_TKN_P3              (REG_WR_DRR_TKN_P3),
                      .SEQ_ADDR_DEFAULT               (SEQ_ADDR_DEFAULT),
                      .SEQ_BA_DEFAULT                 (SEQ_BA_DEFAULT),
                      .SEQ_BG_DEFAULT                 (SEQ_BG_DEFAULT),
                      .SEQ_CBIT_DEFAULT               (SEQ_CBIT_DEFAULT),
                      .SEQ_CK_CAL                     (SEQ_CK_CAL),
                      .SEQ_CMD_DEFAULT                (SEQ_CMD_DEFAULT),
                      .SEQ_CMD_POR                    (SEQ_CMD_POR),
                      .SEQ_DQS_DEFAULT               (SEQ_DQS_DEFAULT),
                      .SEQ_DQ_DEFAULT               (SEQ_DQ_DEFAULT),
                      .SEQ_INIT_ADDR0               (SEQ_INIT_ADDR0),
                      .SEQ_INIT_ADDR1               (SEQ_INIT_ADDR1),
                      .SEQ_INIT_ADDR10               (SEQ_INIT_ADDR10),
                      .SEQ_INIT_ADDR11               (SEQ_INIT_ADDR11),
                      .SEQ_INIT_ADDR12               (SEQ_INIT_ADDR12),
                      .SEQ_INIT_ADDR13               (SEQ_INIT_ADDR13),
                      .SEQ_INIT_ADDR14               (SEQ_INIT_ADDR14),
                      .SEQ_INIT_ADDR15               (SEQ_INIT_ADDR15),
                      .SEQ_INIT_ADDR16               (SEQ_INIT_ADDR16),
                      .SEQ_INIT_ADDR17               (SEQ_INIT_ADDR17),
                      .SEQ_INIT_ADDR18               (SEQ_INIT_ADDR18),
                      .SEQ_INIT_ADDR19               (SEQ_INIT_ADDR19),
                      .SEQ_INIT_ADDR2               (SEQ_INIT_ADDR2),
                      .SEQ_INIT_ADDR20               (SEQ_INIT_ADDR20),
                      .SEQ_INIT_ADDR21               (SEQ_INIT_ADDR21),
                      .SEQ_INIT_ADDR22               (SEQ_INIT_ADDR22),
                      .SEQ_INIT_ADDR23               (SEQ_INIT_ADDR23),
                      .SEQ_INIT_ADDR24               (SEQ_INIT_ADDR24),
                      .SEQ_INIT_ADDR25               (SEQ_INIT_ADDR25),
                      .SEQ_INIT_ADDR26               (SEQ_INIT_ADDR26),
                      .SEQ_INIT_ADDR27               (SEQ_INIT_ADDR27),
                      .SEQ_INIT_ADDR28               (SEQ_INIT_ADDR28),
                      .SEQ_INIT_ADDR29               (SEQ_INIT_ADDR29),
                      .SEQ_INIT_ADDR3               (SEQ_INIT_ADDR3),
                      .SEQ_INIT_ADDR30               (SEQ_INIT_ADDR30),
                      .SEQ_INIT_ADDR31               (SEQ_INIT_ADDR31),
                      .SEQ_INIT_ADDR32               (SEQ_INIT_ADDR32),
                      .SEQ_INIT_ADDR33               (SEQ_INIT_ADDR33),
                      .SEQ_INIT_ADDR34               (SEQ_INIT_ADDR34),
                      .SEQ_INIT_ADDR35               (SEQ_INIT_ADDR35),
                      .SEQ_INIT_ADDR36               (SEQ_INIT_ADDR36),
                      .SEQ_INIT_ADDR37               (SEQ_INIT_ADDR37),
                      .SEQ_INIT_ADDR38               (SEQ_INIT_ADDR38),
                      .SEQ_INIT_ADDR39               (SEQ_INIT_ADDR39),
                      .SEQ_INIT_ADDR4               (SEQ_INIT_ADDR4),
                      .SEQ_INIT_ADDR40               (SEQ_INIT_ADDR40),
                      .SEQ_INIT_ADDR41               (SEQ_INIT_ADDR41),
                      .SEQ_INIT_ADDR42               (SEQ_INIT_ADDR42),
                      .SEQ_INIT_ADDR43               (SEQ_INIT_ADDR43),
                      .SEQ_INIT_ADDR44               (SEQ_INIT_ADDR44),
                      .SEQ_INIT_ADDR45               (SEQ_INIT_ADDR45),
                      .SEQ_INIT_ADDR46               (SEQ_INIT_ADDR46),
                      .SEQ_INIT_ADDR47               (SEQ_INIT_ADDR47),
                      .SEQ_INIT_ADDR48               (SEQ_INIT_ADDR48),
                      .SEQ_INIT_ADDR49               (SEQ_INIT_ADDR49),
                      .SEQ_INIT_ADDR5               (SEQ_INIT_ADDR5),
                      .SEQ_INIT_ADDR50               (SEQ_INIT_ADDR50),
                      .SEQ_INIT_ADDR51               (SEQ_INIT_ADDR51),
                      .SEQ_INIT_ADDR52               (SEQ_INIT_ADDR52),
                      .SEQ_INIT_ADDR53               (SEQ_INIT_ADDR53),
                      .SEQ_INIT_ADDR54               (SEQ_INIT_ADDR54),
                      .SEQ_INIT_ADDR55               (SEQ_INIT_ADDR55),
                      .SEQ_INIT_ADDR56               (SEQ_INIT_ADDR56),
                      .SEQ_INIT_ADDR57               (SEQ_INIT_ADDR57),
                      .SEQ_INIT_ADDR58               (SEQ_INIT_ADDR58),
                      .SEQ_INIT_ADDR59               (SEQ_INIT_ADDR59),
                      .SEQ_INIT_ADDR6               (SEQ_INIT_ADDR6),
                      .SEQ_INIT_ADDR60               (SEQ_INIT_ADDR60),
                      .SEQ_INIT_ADDR61               (SEQ_INIT_ADDR61),
                      .SEQ_INIT_ADDR62               (SEQ_INIT_ADDR62),
                      .SEQ_INIT_ADDR63               (SEQ_INIT_ADDR63),
                      .SEQ_INIT_ADDR64               (SEQ_INIT_ADDR64),
                      .SEQ_INIT_ADDR65               (SEQ_INIT_ADDR65),
                      .SEQ_INIT_ADDR66               (SEQ_INIT_ADDR66),
                      .SEQ_INIT_ADDR67               (SEQ_INIT_ADDR67),
                      .SEQ_INIT_ADDR68               (SEQ_INIT_ADDR68),
                      .SEQ_INIT_ADDR69               (SEQ_INIT_ADDR69),
                      .SEQ_INIT_ADDR7               (SEQ_INIT_ADDR7),
                      .SEQ_INIT_ADDR70               (SEQ_INIT_ADDR70),
                      .SEQ_INIT_ADDR71               (SEQ_INIT_ADDR71),
                      .SEQ_INIT_ADDR72               (SEQ_INIT_ADDR72),
                      .SEQ_INIT_ADDR73               (SEQ_INIT_ADDR73),
                      .SEQ_INIT_ADDR74               (SEQ_INIT_ADDR74),
                      .SEQ_INIT_ADDR75               (SEQ_INIT_ADDR75),
                      .SEQ_INIT_ADDR76               (SEQ_INIT_ADDR76),
                      .SEQ_INIT_ADDR77               (SEQ_INIT_ADDR77),
                      .SEQ_INIT_ADDR78               (SEQ_INIT_ADDR78),
                      .SEQ_INIT_ADDR79               (SEQ_INIT_ADDR79),
                      .SEQ_INIT_ADDR8               (SEQ_INIT_ADDR8),
                      .SEQ_INIT_ADDR80               (SEQ_INIT_ADDR80),
                      .SEQ_INIT_ADDR81               (SEQ_INIT_ADDR81),
                      .SEQ_INIT_ADDR82               (SEQ_INIT_ADDR82),
                      .SEQ_INIT_ADDR83               (SEQ_INIT_ADDR83),
                      .SEQ_INIT_ADDR84               (SEQ_INIT_ADDR84),
                      .SEQ_INIT_ADDR85               (SEQ_INIT_ADDR85),
                      .SEQ_INIT_ADDR86               (SEQ_INIT_ADDR86),
                      .SEQ_INIT_ADDR87               (SEQ_INIT_ADDR87),
                      .SEQ_INIT_ADDR88               (SEQ_INIT_ADDR88),
                      .SEQ_INIT_ADDR89               (SEQ_INIT_ADDR89),
                      .SEQ_INIT_ADDR9               (SEQ_INIT_ADDR9),
                      .SEQ_INIT_ADDR90               (SEQ_INIT_ADDR90),
                      .SEQ_INIT_ADDR91               (SEQ_INIT_ADDR91),
                      .SEQ_INIT_ADDR92               (SEQ_INIT_ADDR92),
                      .SEQ_INIT_ADDR93               (SEQ_INIT_ADDR93),
                      .SEQ_INIT_ADDR94               (SEQ_INIT_ADDR94),
                      .SEQ_INIT_ADDR95               (SEQ_INIT_ADDR95),
                      .SEQ_INIT_ADDR96               (SEQ_INIT_ADDR96),
                      .SEQ_INIT_ADDR97               (SEQ_INIT_ADDR97),
                      .SEQ_INIT_ADDR98               (SEQ_INIT_ADDR98),
                      .SEQ_INIT_ADDR99               (SEQ_INIT_ADDR99),
                      .SEQ_INIT_CMD0               (SEQ_INIT_CMD0),
                      .SEQ_INIT_CMD1               (SEQ_INIT_CMD1),
                      .SEQ_INIT_CMD10               (SEQ_INIT_CMD10),
                      .SEQ_INIT_CMD11               (SEQ_INIT_CMD11),
                      .SEQ_INIT_CMD12               (SEQ_INIT_CMD12),
                      .SEQ_INIT_CMD13               (SEQ_INIT_CMD13),
                      .SEQ_INIT_CMD14               (SEQ_INIT_CMD14),
                      .SEQ_INIT_CMD15               (SEQ_INIT_CMD15),
                      .SEQ_INIT_CMD16               (SEQ_INIT_CMD16),
                      .SEQ_INIT_CMD17               (SEQ_INIT_CMD17),
                      .SEQ_INIT_CMD18               (SEQ_INIT_CMD18),
                      .SEQ_INIT_CMD19               (SEQ_INIT_CMD19),
                      .SEQ_INIT_CMD2               (SEQ_INIT_CMD2),
                      .SEQ_INIT_CMD20               (SEQ_INIT_CMD20),
                      .SEQ_INIT_CMD21               (SEQ_INIT_CMD21),
                      .SEQ_INIT_CMD22               (SEQ_INIT_CMD22),
                      .SEQ_INIT_CMD23               (SEQ_INIT_CMD23),
                      .SEQ_INIT_CMD24               (SEQ_INIT_CMD24),
                      .SEQ_INIT_CMD25               (SEQ_INIT_CMD25),
                      .SEQ_INIT_CMD26               (SEQ_INIT_CMD26),
                      .SEQ_INIT_CMD27               (SEQ_INIT_CMD27),
                      .SEQ_INIT_CMD28               (SEQ_INIT_CMD28),
                      .SEQ_INIT_CMD29               (SEQ_INIT_CMD29),
                      .SEQ_INIT_CMD3               (SEQ_INIT_CMD3),
                      .SEQ_INIT_CMD30               (SEQ_INIT_CMD30),
                      .SEQ_INIT_CMD31               (SEQ_INIT_CMD31),
                      .SEQ_INIT_CMD32               (SEQ_INIT_CMD32),
                      .SEQ_INIT_CMD33               (SEQ_INIT_CMD33),
                      .SEQ_INIT_CMD34               (SEQ_INIT_CMD34),
                      .SEQ_INIT_CMD35               (SEQ_INIT_CMD35),
                      .SEQ_INIT_CMD36               (SEQ_INIT_CMD36),
                      .SEQ_INIT_CMD37               (SEQ_INIT_CMD37),
                      .SEQ_INIT_CMD38               (SEQ_INIT_CMD38),
                      .SEQ_INIT_CMD39               (SEQ_INIT_CMD39),
                      .SEQ_INIT_CMD4               (SEQ_INIT_CMD4),
                      .SEQ_INIT_CMD40               (SEQ_INIT_CMD40),
                      .SEQ_INIT_CMD41               (SEQ_INIT_CMD41),
                      .SEQ_INIT_CMD42               (SEQ_INIT_CMD42),
                      .SEQ_INIT_CMD43               (SEQ_INIT_CMD43),
                      .SEQ_INIT_CMD44               (SEQ_INIT_CMD44),
                      .SEQ_INIT_CMD45               (SEQ_INIT_CMD45),
                      .SEQ_INIT_CMD46               (SEQ_INIT_CMD46),
                      .SEQ_INIT_CMD47               (SEQ_INIT_CMD47),
                      .SEQ_INIT_CMD48               (SEQ_INIT_CMD48),
                      .SEQ_INIT_CMD49               (SEQ_INIT_CMD49),
                      .SEQ_INIT_CMD5               (SEQ_INIT_CMD5),
                      .SEQ_INIT_CMD50               (SEQ_INIT_CMD50),
                      .SEQ_INIT_CMD51               (SEQ_INIT_CMD51),
                      .SEQ_INIT_CMD52               (SEQ_INIT_CMD52),
                      .SEQ_INIT_CMD53               (SEQ_INIT_CMD53),
                      .SEQ_INIT_CMD54               (SEQ_INIT_CMD54),
                      .SEQ_INIT_CMD55               (SEQ_INIT_CMD55),
                      .SEQ_INIT_CMD56               (SEQ_INIT_CMD56),
                      .SEQ_INIT_CMD57               (SEQ_INIT_CMD57),
                      .SEQ_INIT_CMD58               (SEQ_INIT_CMD58),
                      .SEQ_INIT_CMD59               (SEQ_INIT_CMD59),
                      .SEQ_INIT_CMD6               (SEQ_INIT_CMD6),
                      .SEQ_INIT_CMD60               (SEQ_INIT_CMD60),
                      .SEQ_INIT_CMD61               (SEQ_INIT_CMD61),
                      .SEQ_INIT_CMD62               (SEQ_INIT_CMD62),
                      .SEQ_INIT_CMD63               (SEQ_INIT_CMD63),
                      .SEQ_INIT_CMD64               (SEQ_INIT_CMD64),
                      .SEQ_INIT_CMD65               (SEQ_INIT_CMD65),
                      .SEQ_INIT_CMD66               (SEQ_INIT_CMD66),
                      .SEQ_INIT_CMD67               (SEQ_INIT_CMD67),
                      .SEQ_INIT_CMD68               (SEQ_INIT_CMD68),
                      .SEQ_INIT_CMD69               (SEQ_INIT_CMD69),
                      .SEQ_INIT_CMD7               (SEQ_INIT_CMD7),
                      .SEQ_INIT_CMD70               (SEQ_INIT_CMD70),
                      .SEQ_INIT_CMD71               (SEQ_INIT_CMD71),
                      .SEQ_INIT_CMD72               (SEQ_INIT_CMD72),
                      .SEQ_INIT_CMD73               (SEQ_INIT_CMD73),
                      .SEQ_INIT_CMD74               (SEQ_INIT_CMD74),
                      .SEQ_INIT_CMD75               (SEQ_INIT_CMD75),
                      .SEQ_INIT_CMD76               (SEQ_INIT_CMD76),
                      .SEQ_INIT_CMD77               (SEQ_INIT_CMD77),
                      .SEQ_INIT_CMD78               (SEQ_INIT_CMD78),
                      .SEQ_INIT_CMD79               (SEQ_INIT_CMD79),
                      .SEQ_INIT_CMD8               (SEQ_INIT_CMD8),
                      .SEQ_INIT_CMD80               (SEQ_INIT_CMD80),
                      .SEQ_INIT_CMD81               (SEQ_INIT_CMD81),
                      .SEQ_INIT_CMD82               (SEQ_INIT_CMD82),
                      .SEQ_INIT_CMD83               (SEQ_INIT_CMD83),
                      .SEQ_INIT_CMD84               (SEQ_INIT_CMD84),
                      .SEQ_INIT_CMD85               (SEQ_INIT_CMD85),
                      .SEQ_INIT_CMD86               (SEQ_INIT_CMD86),
                      .SEQ_INIT_CMD87               (SEQ_INIT_CMD87),
                      .SEQ_INIT_CMD88               (SEQ_INIT_CMD88),
                      .SEQ_INIT_CMD89               (SEQ_INIT_CMD89),
                      .SEQ_INIT_CMD9               (SEQ_INIT_CMD9),
                      .SEQ_INIT_CMD90               (SEQ_INIT_CMD90),
                      .SEQ_INIT_CMD91               (SEQ_INIT_CMD91),
                      .SEQ_INIT_CMD92               (SEQ_INIT_CMD92),
                      .SEQ_INIT_CMD93               (SEQ_INIT_CMD93),
                      .SEQ_INIT_CMD94               (SEQ_INIT_CMD94),
                      .SEQ_INIT_CMD95               (SEQ_INIT_CMD95),
                      .SEQ_INIT_CMD96               (SEQ_INIT_CMD96),
                      .SEQ_INIT_CMD97               (SEQ_INIT_CMD97),
                      .SEQ_INIT_CMD98               (SEQ_INIT_CMD98),
                      .SEQ_INIT_CMD99               (SEQ_INIT_CMD99),
                      .SEQ_INIT_CMD_SET             (SEQ_INIT_CMD_SET),
                      .SEQ_INIT_CMD_VALID           (SEQ_INIT_CMD_VALID),
                      .SEQ_INIT_CNTRL0               (SEQ_INIT_CNTRL0),
                      .SEQ_INIT_CNTRL1               (SEQ_INIT_CNTRL1),
                      .SEQ_INIT_CNTRL10               (SEQ_INIT_CNTRL10),
                      .SEQ_INIT_CNTRL11               (SEQ_INIT_CNTRL11),
                      .SEQ_INIT_CNTRL12               (SEQ_INIT_CNTRL12),
                      .SEQ_INIT_CNTRL13               (SEQ_INIT_CNTRL13),
                      .SEQ_INIT_CNTRL14               (SEQ_INIT_CNTRL14),
                      .SEQ_INIT_CNTRL15               (SEQ_INIT_CNTRL15),
                      .SEQ_INIT_CNTRL16               (SEQ_INIT_CNTRL16),
                      .SEQ_INIT_CNTRL17               (SEQ_INIT_CNTRL17),
                      .SEQ_INIT_CNTRL18               (SEQ_INIT_CNTRL18),
                      .SEQ_INIT_CNTRL19               (SEQ_INIT_CNTRL19),
                      .SEQ_INIT_CNTRL2               (SEQ_INIT_CNTRL2),
                      .SEQ_INIT_CNTRL20               (SEQ_INIT_CNTRL20),
                      .SEQ_INIT_CNTRL21               (SEQ_INIT_CNTRL21),
                      .SEQ_INIT_CNTRL22               (SEQ_INIT_CNTRL22),
                      .SEQ_INIT_CNTRL23               (SEQ_INIT_CNTRL23),
                      .SEQ_INIT_CNTRL24               (SEQ_INIT_CNTRL24),
                      .SEQ_INIT_CNTRL25               (SEQ_INIT_CNTRL25),
                      .SEQ_INIT_CNTRL26               (SEQ_INIT_CNTRL26),
                      .SEQ_INIT_CNTRL27               (SEQ_INIT_CNTRL27),
                      .SEQ_INIT_CNTRL28               (SEQ_INIT_CNTRL28),
                      .SEQ_INIT_CNTRL29               (SEQ_INIT_CNTRL29),
                      .SEQ_INIT_CNTRL3               (SEQ_INIT_CNTRL3),
                      .SEQ_INIT_CNTRL30               (SEQ_INIT_CNTRL30),
                      .SEQ_INIT_CNTRL31               (SEQ_INIT_CNTRL31),
                      .SEQ_INIT_CNTRL32               (SEQ_INIT_CNTRL32),
                      .SEQ_INIT_CNTRL33               (SEQ_INIT_CNTRL33),
                      .SEQ_INIT_CNTRL34               (SEQ_INIT_CNTRL34),
                      .SEQ_INIT_CNTRL35               (SEQ_INIT_CNTRL35),
                      .SEQ_INIT_CNTRL36               (SEQ_INIT_CNTRL36),
                      .SEQ_INIT_CNTRL37               (SEQ_INIT_CNTRL37),
                      .SEQ_INIT_CNTRL38               (SEQ_INIT_CNTRL38),
                      .SEQ_INIT_CNTRL39               (SEQ_INIT_CNTRL39),
                      .SEQ_INIT_CNTRL4               (SEQ_INIT_CNTRL4),
                      .SEQ_INIT_CNTRL40               (SEQ_INIT_CNTRL40),
                      .SEQ_INIT_CNTRL41               (SEQ_INIT_CNTRL41),
                      .SEQ_INIT_CNTRL42               (SEQ_INIT_CNTRL42),
                      .SEQ_INIT_CNTRL43               (SEQ_INIT_CNTRL43),
                      .SEQ_INIT_CNTRL44               (SEQ_INIT_CNTRL44),
                      .SEQ_INIT_CNTRL45               (SEQ_INIT_CNTRL45),
                      .SEQ_INIT_CNTRL46               (SEQ_INIT_CNTRL46),
                      .SEQ_INIT_CNTRL47               (SEQ_INIT_CNTRL47),
                      .SEQ_INIT_CNTRL48               (SEQ_INIT_CNTRL48),
                      .SEQ_INIT_CNTRL49               (SEQ_INIT_CNTRL49),
                      .SEQ_INIT_CNTRL5               (SEQ_INIT_CNTRL5),
                      .SEQ_INIT_CNTRL50               (SEQ_INIT_CNTRL50),
                      .SEQ_INIT_CNTRL51               (SEQ_INIT_CNTRL51),
                      .SEQ_INIT_CNTRL52               (SEQ_INIT_CNTRL52),
                      .SEQ_INIT_CNTRL53               (SEQ_INIT_CNTRL53),
                      .SEQ_INIT_CNTRL54               (SEQ_INIT_CNTRL54),
                      .SEQ_INIT_CNTRL55               (SEQ_INIT_CNTRL55),
                      .SEQ_INIT_CNTRL56               (SEQ_INIT_CNTRL56),
                      .SEQ_INIT_CNTRL57               (SEQ_INIT_CNTRL57),
                      .SEQ_INIT_CNTRL58               (SEQ_INIT_CNTRL58),
                      .SEQ_INIT_CNTRL59               (SEQ_INIT_CNTRL59),
                      .SEQ_INIT_CNTRL6               (SEQ_INIT_CNTRL6),
                      .SEQ_INIT_CNTRL60               (SEQ_INIT_CNTRL60),
                      .SEQ_INIT_CNTRL61               (SEQ_INIT_CNTRL61),
                      .SEQ_INIT_CNTRL62               (SEQ_INIT_CNTRL62),
                      .SEQ_INIT_CNTRL63               (SEQ_INIT_CNTRL63),
                      .SEQ_INIT_CNTRL64               (SEQ_INIT_CNTRL64),
                      .SEQ_INIT_CNTRL65               (SEQ_INIT_CNTRL65),
                      .SEQ_INIT_CNTRL66               (SEQ_INIT_CNTRL66),
                      .SEQ_INIT_CNTRL67               (SEQ_INIT_CNTRL67),
                      .SEQ_INIT_CNTRL68               (SEQ_INIT_CNTRL68),
                      .SEQ_INIT_CNTRL69               (SEQ_INIT_CNTRL69),
                      .SEQ_INIT_CNTRL7               (SEQ_INIT_CNTRL7),
                      .SEQ_INIT_CNTRL70               (SEQ_INIT_CNTRL70),
                      .SEQ_INIT_CNTRL71               (SEQ_INIT_CNTRL71),
                      .SEQ_INIT_CNTRL72               (SEQ_INIT_CNTRL72),
                      .SEQ_INIT_CNTRL73               (SEQ_INIT_CNTRL73),
                      .SEQ_INIT_CNTRL74               (SEQ_INIT_CNTRL74),
                      .SEQ_INIT_CNTRL75               (SEQ_INIT_CNTRL75),
                      .SEQ_INIT_CNTRL76               (SEQ_INIT_CNTRL76),
                      .SEQ_INIT_CNTRL77               (SEQ_INIT_CNTRL77),
                      .SEQ_INIT_CNTRL78               (SEQ_INIT_CNTRL78),
                      .SEQ_INIT_CNTRL79               (SEQ_INIT_CNTRL79),
                      .SEQ_INIT_CNTRL8               (SEQ_INIT_CNTRL8),
                      .SEQ_INIT_CNTRL80               (SEQ_INIT_CNTRL80),
                      .SEQ_INIT_CNTRL81               (SEQ_INIT_CNTRL81),
                      .SEQ_INIT_CNTRL82               (SEQ_INIT_CNTRL82),
                      .SEQ_INIT_CNTRL83               (SEQ_INIT_CNTRL83),
                      .SEQ_INIT_CNTRL84                (SEQ_INIT_CNTRL84),
                      .SEQ_INIT_CNTRL85                (SEQ_INIT_CNTRL85),
                      .SEQ_INIT_CNTRL86                (SEQ_INIT_CNTRL86),
                      .SEQ_INIT_CNTRL87                (SEQ_INIT_CNTRL87),
                      .SEQ_INIT_CNTRL88                (SEQ_INIT_CNTRL88),
                      .SEQ_INIT_CNTRL89                (SEQ_INIT_CNTRL89),
                      .SEQ_INIT_CNTRL9                 (SEQ_INIT_CNTRL9),
                      .SEQ_INIT_CNTRL90                (SEQ_INIT_CNTRL90),
                      .SEQ_INIT_CNTRL91                (SEQ_INIT_CNTRL91),
                      .SEQ_INIT_CNTRL92                (SEQ_INIT_CNTRL92),
                      .SEQ_INIT_CNTRL93               (SEQ_INIT_CNTRL93),
                      .SEQ_INIT_CNTRL94               (SEQ_INIT_CNTRL94),
                      .SEQ_INIT_CNTRL95               (SEQ_INIT_CNTRL95),
                      .SEQ_INIT_CNTRL96               (SEQ_INIT_CNTRL96),
                      .SEQ_INIT_CNTRL97               (SEQ_INIT_CNTRL97),
                      .SEQ_INIT_CNTRL98               (SEQ_INIT_CNTRL98),
                      .SEQ_INIT_CNTRL99               (SEQ_INIT_CNTRL99),
                      .SEQ_INIT_CONFIG                (SEQ_INIT_CONFIG),
                      .SEQ_MODE                       (SEQ_MODE),
                      .TXNQ_RD_PRIORITY               (TXNQ_RD_PRIORITY),
                      .TXNQ_WR_PRIORITY               (TXNQ_WR_PRIORITY),
                      .T_TXBIT                        (T_TXBIT),
                      .UB_CLK_MUX                     (UB_CLK_MUX),
                      .XMPU_CONFIG0                   (XMPU_CONFIG0),
                      .XMPU_CONFIG1                   (XMPU_CONFIG1),
                      .XMPU_CONFIG10                  (XMPU_CONFIG10),
                      .XMPU_CONFIG11                  (XMPU_CONFIG11),
                      .XMPU_CONFIG12                  (XMPU_CONFIG12),
                      .XMPU_CONFIG13                  (XMPU_CONFIG13),
                      .XMPU_CONFIG14                  (XMPU_CONFIG14),
                      .XMPU_CONFIG15                  (XMPU_CONFIG15),
                      .XMPU_CONFIG2                   (XMPU_CONFIG2),
                      .XMPU_CONFIG3                   (XMPU_CONFIG3),
                      .XMPU_CONFIG4                   (XMPU_CONFIG4),
                      .XMPU_CONFIG5                   (XMPU_CONFIG5),
                      .XMPU_CONFIG6                   (XMPU_CONFIG6),
                      .XMPU_CONFIG7                   (XMPU_CONFIG7),
                      .XMPU_CONFIG8                   (XMPU_CONFIG8),
                      .XMPU_CONFIG9                   (XMPU_CONFIG9),
                      .XMPU_CTRL                      (XMPU_CTRL),
                      .XMPU_END_HI0                   (XMPU_END_HI0),
                      .XMPU_END_HI1                   (XMPU_END_HI1),
                      .XMPU_END_HI10                  (XMPU_END_HI10),
                      .XMPU_END_HI11                  (XMPU_END_HI11),
                      .XMPU_END_HI12                  (XMPU_END_HI12),
                      .XMPU_END_HI13                  (XMPU_END_HI13),
                      .XMPU_END_HI14                  (XMPU_END_HI14),
                      .XMPU_END_HI15                  (XMPU_END_HI15),
                      .XMPU_END_HI2                   (XMPU_END_HI2),
                      .XMPU_END_HI3                   (XMPU_END_HI3),
                      .XMPU_END_HI4                   (XMPU_END_HI4),
                      .XMPU_END_HI5                   (XMPU_END_HI5),
                      .XMPU_END_HI6                   (XMPU_END_HI6),
                      .XMPU_END_HI7                   (XMPU_END_HI7),
                      .XMPU_END_HI8                   (XMPU_END_HI8),
                      .XMPU_END_HI9                   (XMPU_END_HI9),
                      .XMPU_END_LO0                   (XMPU_END_LO0),
                      .XMPU_END_LO1                   (XMPU_END_LO1),
                      .XMPU_END_LO10                  (XMPU_END_LO10),
                      .XMPU_END_LO11                  (XMPU_END_LO11),
                      .XMPU_END_LO12                  (XMPU_END_LO12),
                      .XMPU_END_LO13                  (XMPU_END_LO13),
                      .XMPU_END_LO14                  (XMPU_END_LO14),
                      .XMPU_END_LO15                  (XMPU_END_LO15),
                      .XMPU_END_LO2                   (XMPU_END_LO2),
                      .XMPU_END_LO3                   (XMPU_END_LO3),
                      .XMPU_END_LO4                   (XMPU_END_LO4),
                      .XMPU_END_LO5                   (XMPU_END_LO5),
                      .XMPU_END_LO6                   (XMPU_END_LO6),
                      .XMPU_END_LO7                   (XMPU_END_LO7),
                      .XMPU_END_LO8                   (XMPU_END_LO8),
                      .XMPU_END_LO9                   (XMPU_END_LO9),
                      .XMPU_MASTER0                   (XMPU_MASTER0),
                      .XMPU_MASTER1                   (XMPU_MASTER1),
                      .XMPU_MASTER10                  (XMPU_MASTER10),
                      .XMPU_MASTER11                  (XMPU_MASTER11),
                      .XMPU_MASTER12                  (XMPU_MASTER12),
                      .XMPU_MASTER13                  (XMPU_MASTER13),
                      .XMPU_MASTER14                  (XMPU_MASTER14),
                      .XMPU_MASTER15                  (XMPU_MASTER15),
                      .XMPU_MASTER2                   (XMPU_MASTER2),
                      .XMPU_MASTER3                   (XMPU_MASTER3),
                      .XMPU_MASTER4                   (XMPU_MASTER4),
                      .XMPU_MASTER5                   (XMPU_MASTER5),
                      .XMPU_MASTER6                   (XMPU_MASTER6),
                      .XMPU_MASTER7                   (XMPU_MASTER7),
                      .XMPU_MASTER8                   (XMPU_MASTER8),
                      .XMPU_MASTER9                   (XMPU_MASTER9),
                      .XMPU_START_HI0                 (XMPU_START_HI0),
                      .XMPU_START_HI1                 (XMPU_START_HI1),
                      .XMPU_START_HI10                (XMPU_START_HI10),
                      .XMPU_START_HI11                (XMPU_START_HI11),
                      .XMPU_START_HI12                (XMPU_START_HI12),
                      .XMPU_START_HI13                (XMPU_START_HI13),
                      .XMPU_START_HI14                (XMPU_START_HI14),
                      .XMPU_START_HI15                (XMPU_START_HI15),
                      .XMPU_START_HI2                 (XMPU_START_HI2),
                      .XMPU_START_HI3                 (XMPU_START_HI3),
                      .XMPU_START_HI4                 (XMPU_START_HI4),
                      .XMPU_START_HI5                 (XMPU_START_HI5),
                      .XMPU_START_HI6                 (XMPU_START_HI6),
                      .XMPU_START_HI7                 (XMPU_START_HI7),
                      .XMPU_START_HI8                 (XMPU_START_HI8),
                      .XMPU_START_HI9                 (XMPU_START_HI9),
                      .XMPU_START_LO0                 (XMPU_START_LO0),
                      .XMPU_START_LO1                 (XMPU_START_LO1),
                      .XMPU_START_LO10                (XMPU_START_LO10),
                      .XMPU_START_LO11                (XMPU_START_LO11),
                      .XMPU_START_LO12                (XMPU_START_LO12),
                      .XMPU_START_LO13                (XMPU_START_LO13),
                      .XMPU_START_LO14                (XMPU_START_LO14),
                      .XMPU_START_LO15                (XMPU_START_LO15),
                      .XMPU_START_LO2                 (XMPU_START_LO2),
                      .XMPU_START_LO3                 (XMPU_START_LO3),
                      .XMPU_START_LO4                 (XMPU_START_LO4),
                      .XMPU_START_LO5                 (XMPU_START_LO5),
                      .XMPU_START_LO6                 (XMPU_START_LO6),
                      .XMPU_START_LO7                 (XMPU_START_LO7),
                      .XMPU_START_LO8                 (XMPU_START_LO8),
                      .XMPU_START_LO9                 (XMPU_START_LO9),
                      .XPI_DATA_NIB_CHAN              (XPI_DATA_NIB_CHAN),
                      .XPI_DQS                        (XPI_DQS),
                      .XPI_NIB_CHAN                   (XPI_NIB_CHAN),
                      .XPI_OE                         (XPI_OE),
                      .XPI_OE_ALL_NIB                 (XPI_OE_ALL_NIB),
                      .XPI_PMI_CONFIG                 (XPI_PMI_CONFIG),
                      .XPI_READ_DBI                   (XPI_READ_DBI),
                      .XPI_READ_OFFSET                (XPI_READ_OFFSET),
                      .XPI_WRDATA_ALL_NIB             (XPI_WRDATA_ALL_NIB),
                      `ifdef SIDEFILE_EN
                      .VERBOSITY_EN                   (VERBOSITY_EN),
                      .IP_NAME                        ("UNKNOWN"),
                      .REG_FILE                       ("UNKNOWN.xdc"),
                      `endif
                      .XPI_WRITE_DM_DBI               (XPI_WRITE_DM_DBI)

           )
  ddrmc_reg_u (
           `ifdef BFM_SIMULATION
           .mc_clk                    (mc_clk)
          ,.noc_rst_n(noc_rst_n)
          ,.noc_clk  (noc_clk)
          ,.mc_rst_n (~mc_rst_n)
           `else
           .mc_clk                    (mc_c)
          ,.noc_rst_n(reset_n)
          ,.noc_clk  (noc_c)
          ,.mc_rst_n (reset_n)
           `endif
          `ifdef BFM_SIMULATION //not available in DEV area
          ,.ub_regs_clk   (ub_regs_clk)
          ,.regs_ub_rst   (regs_ub_rst)
          ,.regs_mc_rst   (regs_mc_rst)
          ,.log_inoc_rst_n(log_inoc_rst_n)
          ,.log_mc_rst_n(log_mc_rst_n)
          ,.main_regs_clk (main_regs_clk)
          ,.dmc_init_rst(dmc_init_rst)
          ,.ddrmc_gatereg_mc(ddrmc_gatereg_mc)
          ,.ddrmc_gatereg_noc(ddrmc_gatereg_noc)
          ,.ddrmc_slverren_mc(ddrmc_slverren_mc)
          ,.ddrmc_slverren_noc(ddrmc_slverren_noc)
          ,.early_inoc_rst(early_inoc_rst)
          ,.early_ub_rst(early_ub_rst)
          ,.early_mc_rst			 (early_mc_rst)
          ,.inoc_regs_clk (inoc_regs_clk)
          ,.scan_en      (scan_en)
          ,.scan_mode    (scan_mode)
          ,.scan_rst_byp (scan_rst_byp)  
          ,.scan_mode_rst_n(scan_mode_rst_n)
          ,.sys_inoc_rst   (sys_inoc_rst)
          ,.regs_inoc_rst (regs_inoc_rst)
          ,.sys_ub_rst   (sys_ub_rst)
          ,.sys_mc_rst   (sys_mc_rst)
          ,.noc_por_inoc_rst(noc_por_inoc_rst)
          ,.noc_por_ub_rst(noc_por_ub_rst)
          ,.noc_por_mc_rst(noc_por_mc_rst)
          ,.bisr_regs_ub_rst_n(bisr_regs_ub_rst_n)
          ,.if_dmc2reg_prot_main_out                 (if_dmc2reg_prot_main_out)
          ,.if_npi2dmc_prot_cal_out                  (if_npi2dmc_prot_cal_out)
          ,.if_mc_npi_regs_config                    (if_mc_npi_regs_config)
          ,.if_ub_npi_regs_status                    (if_ub_npi_regs_status)
          ,.if_ub_npi_regs_hwrite                    (if_ub_npi_regs_hwrite)
          ,.if_npi_regs_hwrite                       (if_npi_regs_hwrite)
          ,.if_npi_regs_status                       (if_npi_regs_status)
          //,.if_npi2dmc_prot_noc                      (if_npi2dmc_prot_noc)
          ,.if_npi2dmc_prot_noc                      (if_npi2dmc_prot_noc)
          ,.if_mc_npi_noc_regs_config                (if_mc_npi_noc_regs_config)
          ,.if_npi_noc_regs_status                   (if_npi_noc_regs_status)
          ,.if_npi_noc_regs_hwrite                   (if_npi_noc_regs_hwrite)
          `endif
          ,.if_xmpu_regs_config                      (if_xmpu_regs_config)
          `NOC_REGS_INST
          `MAIN_REGS_INST
          );
                                                                                   

noc_na_v1_0_0_na #(
           .WIDTH_PER_CH              (WIDTH_PER_CH              )
          ,.DRAM_TYPE                 (DRAM_TYPE                 )
          ,.NUM_CH                    (NUM_CH                    )
          ,.CH_SEL                    (CH_SEL                    )
          ,.WDB_DATA_WIDTH            (WDB_DATA_WIDTH            )
          ,.WDB_DM_WIDTH              (WDB_DM_WIDTH              )
          ,.VERBOSITY_EN              (VERBOSITY_EN)
          )
 ddrmc_na_u(
           `ifdef BFM_SIMULATION
           .mc_clk                    (mc_clk)
          ,.mc_rst                    (mc_rst_n)
          ,.noc_clk                   (noc_clk)
          ,.noc_rst_n                 (mc_rst_n)
          `else
           .mc_clk                    (mc_c)
          ,.mc_rst                    (~reset_n) //mc_rst_n)
          ,.noc_clk                   (noc_c)
          ,.noc_rst_n                 (~reset_n) //noc_rst_n) // Kunalpra changed back to noc_rst_n because of pll and sys_rst which are anded with pll_locked
          `endif
          ,.noc2dmc_valid_in          (valid_from_npg)
          ,.noc2dmc_data_in           (flit_from_npg)
          ,.noc2dmc_credit_rdy        (credit_rdy_from_npg)
          ,.dmc2noc_credit_rtn        (credit_return_to_npg)
          ,.initDone                  (initDone)
          ,.mc_odisable    (mc_odisable)  
          ,.dmc2noc_valid_out         (valid_to_npg)
          ,.dmc2noc_data_out          (flit_to_npg)
          ,.dmc2noc_credit_rdy        (credit_rdy_to_npg)
          ,.noc2dmc_credit_rtn        (credit_return_from_npg)
          ,.na2dc_txn_push_0         (na2dc_txn_push[0]) 
          ,.na2dc_txn_type_read_0    (na2dc_txn_type_read[0])
          ,.na2dc_txn_qos_0          (na2dc_txn_qos[0])
          //,.na2dc_txn_partial_0      (na2dc_txn_partial[0])
          ,.na2dc_txn_address_0      (na2dc_txn_address[0])
          ,.na2dc_txn_exokay_0       (na2dc_txn_exokay[0])
          ,.na2dc_txn_rrob_add_0     (na2dc_txn_rrob_add[0])
          ,.na2dc_txn_timer_0        (na2dc_txn_timer[0])
          ,.na2dc_llr_tmr_update     (na2dc_llr_tmr_update[0])
          ,.na2dc_isr_tmr_update     (na2dc_isr_tmr_update[0])
          ,.na2dc_ber_tmr_update     (na2dc_ber_tmr_update[0])
          ,.na2dc_isw_tmr_update     (na2dc_isw_tmr_update[0])
          ,.na2dc_bew_tmr_update     (na2dc_bew_tmr_update[0])
          ,.dc2na_full_llr_0_async         (dc2na_full_llr[0])
          ,.dc2na_full_isochr_0_async      (dc2na_full_isochr[0])
          ,.dc2na_full_ber_0_async         (dc2na_full_ber[0])
          ,.dc2na_full_isochw_0_async      (dc2na_full_isochw[0])
          ,.dc2na_full_bew_0_async         (dc2na_full_bew[0])
          ,.dc2na_rd_data_en_0_async       (dc2na_rd_data_en[0])
          ,.dc2na_rd_data_0_async          (dc2na_rd_data[0])
          ,.dc2na_rd_wrap_det_0_async      (dc2na_rd_wrap_det[0])
          ,.dc2na_rd_wrap_rrob_ptr_0_async (dc2na_rd_wrap_rrob_ptr[0])
          ,.dc2na_rd_ret_addr_0_async      (dc2na_rd_addr[0])
          ,.wr_data                  ({wr_data_byte_en,wr_data})
          ,.na2dc_txn_push_1         (na2dc_txn_push[1]) 
          ,.na2dc_txn_type_read_1    (na2dc_txn_type_read[1])
          ,.na2dc_txn_qos_1          (na2dc_txn_qos[1])
          //,.na2dc_txn_partial_1      (na2dc_txn_partial[1])
          ,.na2dc_txn_address_1      (na2dc_txn_address[1])
          ,.na2dc_txn_exokay_1       (na2dc_txn_exokay[1])
          ,.na2dc_txn_rrob_add_1     (na2dc_txn_rrob_add[1])
          ,.na2dc_txn_timer_1        (na2dc_txn_timer[1])
          ,.dc2na_full_llr_1_async         (dc2na_full_llr_1)
          ,.dc2na_full_isochr_1_async      (dc2na_full_isochr_1)
          ,.dc2na_full_ber_1_async         (dc2na_full_ber_1)
          ,.dc2na_full_isochw_1_async      (dc2na_full_isochw_1)
          ,.dc2na_full_bew_1_async         (dc2na_full_bew_1)
	  ,.reg_rd_config_iso_timeout           (reg_rd_config_iso_timeout) 
	  ,.reg_rd_config_ll_timeout           (reg_rd_config_ll_timeout) 
	  //,.npi_reg_ddrmc_nsu_0_ing_dbi_en      (npi_reg_ddrmc_nsu_0_ing_dbi_en) 	 
	  ,.na2dc_rret_almost_full0              (na2dc_rret_almost_full0)
	  ,.na2dc_rret_almost_full1              (na2dc_rret_almost_full1)
 	  ,.na2dc_raww_almost_full0              (na2dc_raww_almost_full0)
	  ,.na2dc_raww_almost_full1              (na2dc_raww_almost_full1)
 	  ,.dc2na_rd_data_en_1_async          (dc2na_rd_data_en_1)
          ,.dc2na_rd_data_1_async             (dc2na_rd_data_1)
          ,.dc2na_rd_wrap_det_1_async         (dc2na_rd_wrap_det_1)
          ,.dc2na_rd_wrap_rrob_ptr_1_async   (dc2na_rd_wrap_rrob_ptr_1)
          ,.dc2na_rd_ret_addr_1_async         (dc2na_rd_addr_1)
          ,.dc2na_txnq_pop_async              (dc2na_txnq_pop)
          `NOC_REGS_INST
          ,.reg_adec11_ch_sel                 (reg_adec11_ch_sel                      )
          ,.if_xmpu_regs_config               (if_xmpu_regs_config)
  );


generate 
//for (ch = 0; ch < NUM_OF_CHS; ch++) begin :DDRMC_DC_GEN//{
// ============================
noc_mc_ddr4_v1_0_dc #(      
            .REG_CONFIG0        (REG_CONFIG0)
          ,.CS_WIDTH           (CS_WIDTH        ) 
           ,.LRANK_WIDTH        (LRANK_WIDTH     ) 
           ,.CK_WIDTH           (CK_WIDTH_INT    ) 
           ,.CKE_WIDTH          (CKE_WIDTH_INT   ) 
           ,.ADDR_WIDTH         (ADDR_WIDTH      ) 
           ,.RANK_WIDTH         (RANK_WIDTH      )
           ,.BANK_WIDTH         (BANK_WIDTH      )
           ,.BANK_GROUP_WIDTH   (BANK_GROUP_WIDTH)
           ,.ROW_WIDTH          (ROW_WIDTH       )
           ,.COL_WIDTH          (COL_WIDTH       )
           ,.ODT_WIDTH          (ODT_WIDTH_INT   )
           ,.DRAM_WIDTH         (DRAM_WIDTH      )
           ,.DQ_WIDTH           (DQ_WIDTH_INT    )
           ,.DQS_WIDTH          (DQS_WIDTH_INT   ) 
           ,.DM_WIDTH           (DM_WIDTH_INT    )
           ,.WDB_DATA_WIDTH     (WDB_DATA_WIDTH  )
           ,.WDB_DM_WIDTH       (WDB_DM_WIDTH    )
          ,.VERBOSITY_EN        (VERBOSITY_EN)
          ,.MC_REFRESH_RATE     (MC_REFRESH_RATE)
           ,.XLNX_RESPONDER     (XLNX_RESPONDER)
           )
ddrmc_dc_u_0(
          `ifdef BFM_SIMULATION
           .mc_clk                    (mc_clk)
          ,.pll_rst(pll_rst_n)
          ,.pll_clk  (pll_clk)
          ,.mc_rst  (mc_rst_n)
           `else
            .mc_clk                 (mc_c)
           ,.mc_rst                 (~reset_n) //mc_rst_n)
           ,.pll_clk                (pll_clk)
           ,.pll_rst                (~reset_n) //pll_rst_n)
           `endif
           ,.tCK                    (tCK)
           ,.na2dc_txn_push         (na2dc_txn_push[0]) 
           ,.na2dc_txn_type_read    (na2dc_txn_type_read[0])
           ,.na2dc_txn_align_strb   (na2dc_txn_align_strb[0])
           ,.na2dc_txn_qos          (na2dc_txn_qos[0])
           ,.na2dc_txn_partial      (na2dc_txn_partial[0])
           ,.na2dc_txn_address      (na2dc_txn_address[0])
           ,.na2dc_txn_exokay       (na2dc_txn_exokay[0])
           ,.na2dc_txn_rrob_add     (na2dc_txn_rrob_add[0])
           ,.na2dc_txn_timer        (na2dc_txn_timer[0])
           ,.na2dc_llr_tmr_update   (na2dc_llr_tmr_update[0])
           ,.na2dc_ber_tmr_update   (na2dc_ber_tmr_update[0])
           ,.na2dc_isr_tmr_update   (na2dc_isr_tmr_update[0])
           ,.na2dc_bew_tmr_update   (na2dc_bew_tmr_update[0])
           ,.na2dc_isw_tmr_update   (na2dc_isw_tmr_update[0])
           ,.dc2na_full_llr         (dc2na_full_llr[0])
           ,.dc2na_full_isochr      (dc2na_full_isochr[0])
           ,.dc2na_full_ber         (dc2na_full_ber[0])
           ,.dc2na_full_isochw      (dc2na_full_isochw[0])
           ,.dc2na_full_bew         (dc2na_full_bew[0])
           ,.ddr_act_n              (ch0_ddr4_act_n)   
           ,.ddr_adr                (ch0_ddr4_adr_int)
           ,.ddr_ba                 (ch0_ddr4_ba_int)
           ,.ddr_bg                 (ch0_ddr4_bg_int) 
           ,.ddr_c                  (ch0_ddr4_c)
           ,.ddr_cke                (ch0_ddr4_cke_int) 
           ,.ddr_odt                (ch0_ddr4_odt) 
           ,.ddr_cs_n               (ch0_ddr4_cs_n) 
           ,.ddr_ck_t               (ch0_ddr4_ck_t_int)  
           ,.ddr_ck_c               (ch0_ddr4_ck_c_int) 
           ,.ddr_reset_n            (ch0_ddr4_reset_n) 
           //,.ddr_dm_dbi_n           (ddr4_dm_dbi_n_int[0][DM_WIDTH_INT-1:0])   
           //,.ddr_dm_dbi_n           (ch0_ddr4_dm_dbi_n[DM_WIDTH-1:0])   
           ,.ddr_dm_dbi_n           (ch0_ddr4_dm_dbi_n[DM_WIDTH_INT-1:0])   
           ,.ddr_dq                 (ch0_ddr4_dq[DQ_WIDTH_INT-1:0])  
           ,.ddr_dqs_c              (ch0_ddr4_dqs_c[DQS_WIDTH_INT-1:0])
           ,.ddr_dqs_t              (ch0_ddr4_dqs_t[DQS_WIDTH_INT-1:0])
           ,.initDone               (initDone)
           ,.dc2na_rd_data_addr     (dc2na_rd_addr[0])
           ,.na2dc_wr_data          (na2dc_wr_data[0])
           ,.na2dc_byte_en          (na2dc_byte_en[0]) 
           ,.dc2na_read_wrap_det      (dc2na_rd_wrap_det[0])
           ,.dc2na_read_wrap_rrob_ptr (dc2na_rd_wrap_rrob_ptr[0])
           ,.dc2na_rd_data_en       (dc2na_rd_data_en[0])
           ,.dc2na_rd_data          (dc2na_rd_data[0])
           ,.dc2na_txnq_pop         (dc2na_txnq_pop[0])
	  ,.na2dc_rret_almost_full              (na2dc_rret_almost_full0)
 	  ,.na2dc_raww_almost_full              (na2dc_raww_almost_full0)
           `MAIN_REGS_INST 
);
if (NUM_OF_CHS ==2) begin
  noc_mc_ddr4_v1_0_dc #( 
            .REG_CONFIG0        (REG_CONFIG0)
           ,.CS_WIDTH           (CS_WIDTH        ) 
           ,.LRANK_WIDTH        (LRANK_WIDTH     ) 
           ,.CK_WIDTH           (CK_WIDTH_INT    ) 
           ,.CKE_WIDTH          (CKE_WIDTH_INT   ) 
           ,.ADDR_WIDTH         (ADDR_WIDTH      ) 
           ,.RANK_WIDTH         (RANK_WIDTH      )
           ,.BANK_WIDTH         (BANK_WIDTH      )
           ,.BANK_GROUP_WIDTH   (BANK_GROUP_WIDTH)
           ,.ROW_WIDTH          (ROW_WIDTH       )
           ,.COL_WIDTH          (COL_WIDTH       )
           ,.ODT_WIDTH          (ODT_WIDTH_INT   )
           ,.DRAM_WIDTH         (DRAM_WIDTH      )
           ,.DQ_WIDTH           (DQ_WIDTH_INT    )
           ,.DQS_WIDTH          (DQS_WIDTH_INT   ) 
           ,.DM_WIDTH           (DM_WIDTH_INT    )
           ,.WDB_DATA_WIDTH     (WDB_DATA_WIDTH  )
           ,.WDB_DM_WIDTH       (WDB_DM_WIDTH    )
          ,.VERBOSITY_EN        (VERBOSITY_EN)
          ,.MC_REFRESH_RATE     (MC_REFRESH_RATE)
           ,.XLNX_RESPONDER     (XLNX_RESPONDER)

           )
ddrmc_dc_u_1(
           `ifdef BFM_SIMULATION
           .mc_clk                    (mc_clk)
          ,.pll_rst(pll_rst_n)
          ,.pll_clk  (pll_clk)
          ,.mc_rst (mc_rst_n)
           `else
            .mc_clk                 (mc_c)
           ,.mc_rst                 (~reset_n) //mc_rst_n)
           ,.pll_clk                (pll_clk)
           ,.pll_rst                (~reset_n) //pll_rst_n)
           `endif
           ,.tCK                    (tCK)
           ,.na2dc_txn_push         (na2dc_txn_push[1]) 
           ,.na2dc_txn_type_read    (na2dc_txn_type_read[1])
           ,.na2dc_txn_align_strb   (na2dc_txn_align_strb[1])
           ,.na2dc_txn_qos          (na2dc_txn_qos[1])
           ,.na2dc_txn_partial      (na2dc_txn_partial[1])
           ,.na2dc_txn_address      (na2dc_txn_address[1])
           ,.na2dc_txn_exokay       (na2dc_txn_exokay[1])
           ,.na2dc_txn_rrob_add     (na2dc_txn_rrob_add[1])
           ,.na2dc_txn_timer        (na2dc_txn_timer[1])
           ,.na2dc_llr_tmr_update   (na2dc_llr_tmr_update[1])
           ,.na2dc_ber_tmr_update   (na2dc_ber_tmr_update[1])
           ,.na2dc_isr_tmr_update   (na2dc_isr_tmr_update[1])
           ,.na2dc_bew_tmr_update   (na2dc_bew_tmr_update[1])
           ,.na2dc_isw_tmr_update   (na2dc_isw_tmr_update[1])
           ,.dc2na_full_llr         (dc2na_full_llr[1])
           ,.dc2na_full_isochr      (dc2na_full_isochr[1])
           ,.dc2na_full_ber         (dc2na_full_ber[1])
           ,.dc2na_full_isochw      (dc2na_full_isochw[1])
           ,.dc2na_full_bew         (dc2na_full_bew[1])
           ,.ddr_act_n              (ch1_ddr4_act_n)   
           ,.ddr_adr                (ch1_ddr4_adr_int)
           ,.ddr_ba                 (ch1_ddr4_ba_int)
           ,.ddr_bg                 (ch1_ddr4_bg_int) 
           ,.ddr_c                  (ch1_ddr4_c)
           ,.ddr_cke                (ch1_ddr4_cke_int) 
           ,.ddr_odt                (ch1_ddr4_odt) 
           ,.ddr_cs_n               (ch1_ddr4_cs_n) 
           ,.ddr_ck_t               (ch1_ddr4_ck_t_int)  
           ,.ddr_ck_c               (ch1_ddr4_ck_c_int) 
           ,.ddr_reset_n            (ch1_ddr4_reset_n) 
           //,.ddr_dm_dbi_n           (ddr4_dm_dbi_n_int[1][DM_WIDTH_INT-1:0])   
           //,.ddr_dm_dbi_n           (ch1_ddr4_dm_dbi_n[DM_WIDTH-1:0])   
           ,.ddr_dm_dbi_n           (ch1_ddr4_dm_dbi_n[DM_WIDTH_INT-1:0])   
           ,.ddr_dq                 (ch1_ddr4_dq[DQ_WIDTH_INT-1:0])  
           ,.ddr_dqs_c              (ch1_ddr4_dqs_c[DQS_WIDTH_INT-1:0])
           ,.ddr_dqs_t              (ch1_ddr4_dqs_t[DQS_WIDTH_INT-1:0])
           ,.initDone               (initDone)
           ,.dc2na_rd_data_addr     (dc2na_rd_addr[1])
           ,.na2dc_wr_data          (na2dc_wr_data[1])
           ,.na2dc_byte_en          (na2dc_byte_en[1]) 
           ,.dc2na_read_wrap_det      (dc2na_rd_wrap_det[1])
           ,.dc2na_read_wrap_rrob_ptr (dc2na_rd_wrap_rrob_ptr[1])
           ,.dc2na_rd_data_en       (dc2na_rd_data_en[1])
           ,.dc2na_rd_data          (dc2na_rd_data[1])
           ,.dc2na_txnq_pop         (dc2na_txnq_pop[1])
	  ,.na2dc_rret_almost_full              (na2dc_rret_almost_full1)
	  ,.na2dc_raww_almost_full              (na2dc_raww_almost_full1)
           `MAIN_REGS_INST
           );

/*if(DRAM_WIDTH != 4) begin
    assign ch1_ddr4_dm_dbi_n = (reg_config0_dm_en &&(PART_WIDTH!=0) && (NUM_OF_CHS==2)) ? ddr4_dm_dbi_n_int[1][DM_WIDTH_INT-1:0] : {DM_WIDTH{1'b1}};
  end*/
end//}
/*if(DRAM_WIDTH != 4) begin
  assign ch0_ddr4_dm_dbi_n = (reg_config0_dm_en &&(PART_WIDTH!=0)) ? ddr4_dm_dbi_n_int[0][DM_WIDTH_INT-1:0] : {DM_WIDTH{1'b1}};
  end
*/
endgenerate

  
//`ifdef EN_SB_MON_BFM
`ifndef BFM_SIMULATION
generate
if(EN_NPP_MONITOR== 1) begin //{

mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) mb_req_to_sb;
mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) mb_rsp_to_sb;

`define SB_CONNECT connect_all_mb(.rsp(mb_rsp_to_sb),.req(mb_req_to_sb)) 
  noc_npp_if noc_npp_if_from_mc_0(.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_to_mc_0  (.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_from_mc_1(.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_to_mc_1  (.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_from_mc_2(.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_to_mc_2  (.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_from_mc_3(.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));
  noc_npp_if noc_npp_if_to_mc_3  (.clk(noc_c),.rst_n(initDone),.clk_en(1'b1));

assign noc_npp_if_from_mc_0.noc_valid         = dmc2noc_valid_out_0; 
assign noc_npp_if_from_mc_0.noc_flit          = dmc2noc_data_out_0 ;
assign noc_npp_if_from_mc_0.noc_credit_rdy    = dmc2noc_credit_rdy_0; 
assign noc_npp_if_from_mc_0.noc_credit_return = dmc2noc_credit_rtn_0; 

assign noc_npp_if_from_mc_1.noc_valid         = dmc2noc_valid_out_1; 
assign noc_npp_if_from_mc_1.noc_flit          = dmc2noc_data_out_1 ;
assign noc_npp_if_from_mc_1.noc_credit_rdy    = dmc2noc_credit_rdy_1; 
assign noc_npp_if_from_mc_1.noc_credit_return = dmc2noc_credit_rtn_1; 

assign noc_npp_if_from_mc_2.noc_valid         = dmc2noc_valid_out_2; 
assign noc_npp_if_from_mc_2.noc_flit          = dmc2noc_data_out_2 ;
assign noc_npp_if_from_mc_2.noc_credit_rdy    = dmc2noc_credit_rdy_2; 
assign noc_npp_if_from_mc_2.noc_credit_return = dmc2noc_credit_rtn_2;

assign noc_npp_if_from_mc_3.noc_valid         = dmc2noc_valid_out_3; 
assign noc_npp_if_from_mc_3.noc_flit          = dmc2noc_data_out_3 ;
assign noc_npp_if_from_mc_3.noc_credit_rdy    = dmc2noc_credit_rdy_3; 
assign noc_npp_if_from_mc_3.noc_credit_return = dmc2noc_credit_rtn_3; 

assign noc_npp_if_to_mc_0.noc_valid           = noc2dmc_valid_in_0; 
assign noc_npp_if_to_mc_0.noc_flit            = noc2dmc_data_in_0;
assign noc_npp_if_to_mc_0.noc_credit_rdy      = noc2dmc_credit_rdy_0;
assign noc_npp_if_to_mc_0.noc_credit_return   = noc2dmc_credit_rtn_0; 

assign noc_npp_if_to_mc_1.noc_valid           = noc2dmc_valid_in_1; 
assign noc_npp_if_to_mc_1.noc_flit            = noc2dmc_data_in_1;
assign noc_npp_if_to_mc_1.noc_credit_rdy      = noc2dmc_credit_rdy_1;
assign noc_npp_if_to_mc_1.noc_credit_return   = noc2dmc_credit_rtn_1; 

assign noc_npp_if_to_mc_2.noc_valid           = noc2dmc_valid_in_2; 
assign noc_npp_if_to_mc_2.noc_flit            = noc2dmc_data_in_2;
assign noc_npp_if_to_mc_2.noc_credit_rdy      = noc2dmc_credit_rdy_2;
assign noc_npp_if_to_mc_2.noc_credit_return   = noc2dmc_credit_rtn_2; 

assign noc_npp_if_to_mc_3.noc_valid           = noc2dmc_valid_in_3; 
assign noc_npp_if_to_mc_3.noc_flit            = noc2dmc_data_in_3;
assign noc_npp_if_to_mc_3.noc_credit_rdy      = noc2dmc_credit_rdy_3;
assign noc_npp_if_to_mc_3.noc_credit_return   = noc2dmc_credit_rtn_3; 


noc_mc_ddr4_v1_0_scoreboard#(
  .VERBOSITY_EN(VERBOSITY_EN)
  ,.DISABLE_DATA_CHECK(DISABLE_DATA_CHECK_MONITOR)
`ifndef NPS_EN
  ,.DISABLE_E2E_CHECK(1'b1)  
`endif
) sb0(.clk(noc_c),.rst_n(initDone));
initial begin
mb_req_to_sb = new();
mb_rsp_to_sb = new();
sb0.`SB_CONNECT;
end

  noc_mc_ddr4_phy_v1_0_0_monitor#( .NPI_REG_DDRMC_NSU_ING(REG_NSU_1_ING)
                              ,.NPI_REG_DDRMC_NSU_EGR(REG_NSU_1_EGR) 
                              ,.VERBOSITY_EN(VERBOSITY_EN)
                              ) mon_npg1_out(.leaf_node(1'b1),.src_req_port(1'b1),.npp_if_out(noc_npp_if_to_mc_1),.npp_if_in(noc_npp_if_from_mc_1));
  initial begin
  mon_npg1_out.src_comp = "NPG1";
  mon_npg1_out.`SB_CONNECT;
    end
  noc_mc_ddr4_phy_v1_0_0_monitor#( .NPI_REG_DDRMC_NSU_ING(REG_NSU_2_ING)
                              ,.NPI_REG_DDRMC_NSU_EGR(REG_NSU_2_EGR) 
                              ,.VERBOSITY_EN(VERBOSITY_EN)
                              ) mon_npg2_out(.leaf_node(1'b1),.src_req_port(1'b1),.npp_if_out(noc_npp_if_to_mc_2),.npp_if_in(noc_npp_if_from_mc_2));
  initial begin
  mon_npg2_out.src_comp = "NPG2";
  mon_npg2_out.`SB_CONNECT;
  end
  noc_mc_ddr4_phy_v1_0_0_monitor#( .NPI_REG_DDRMC_NSU_ING(REG_NSU_3_ING)
                              ,.NPI_REG_DDRMC_NSU_EGR(REG_NSU_3_EGR) 
                              ,.VERBOSITY_EN(VERBOSITY_EN)
                              ) mon_npg3_out(.leaf_node(1'b1),.src_req_port(1'b1),.npp_if_out(noc_npp_if_to_mc_3),.npp_if_in(noc_npp_if_from_mc_3));
  initial begin
  mon_npg3_out.src_comp = "NPG3";
  mon_npg3_out.`SB_CONNECT;
  end
  noc_mc_ddr4_phy_v1_0_0_monitor#( .NPI_REG_DDRMC_NSU_ING(REG_NSU_0_ING)
                              ,.NPI_REG_DDRMC_NSU_EGR(REG_NSU_0_EGR) 
                              ,.VERBOSITY_EN(VERBOSITY_EN)
                             ) mon_npg0_out(.leaf_node(1'b1),.src_req_port(1'b1),.npp_if_out(noc_npp_if_to_mc_0),.npp_if_in(noc_npp_if_from_mc_0));
  initial begin
  mon_npg0_out.src_comp = "NPG0";
  mon_npg0_out.`SB_CONNECT;
  end
  end //}
endgenerate
`endif



bit flag_rst_n = 0;
bit pll_clk_g = 0;
`ifndef BFM_SIMULATION
always @(posedge mc_c) 
begin
               if(na2dc_txn_push[0]) begin
               adec_check.adec_checker(na2dc_txn_address[0]);
               end

               if((na2dc_txn_push[1])) begin
               adec_check.adec_checker(na2dc_txn_address[1]);
               end
end

final begin
 if(adec_check.flag_error == 1)
    $finish;
  else 
    $display("ADEC checks are passing!");
end
`endif
initial 
   begin
     #(6000ps*NOC_PERIOD);

     fork
       	begin
         	wait(pll_clk);
           	pll_clk_g = 1;
        end

        begin
         	#(100ps*NOC_PERIOD);
        end
     join_any; 
               
     assert((pll_clk_g == 1))
     else 
        begin
           if((pll_clk_g == 0)) 
        	$fatal($time, " Failed: Path: %m - pll_clk is not generated check XPLL block");
        end
      
    end 


 
endmodule




