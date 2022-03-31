`ifndef _DDRMC_DC_ 
`define _DDRMC_DC_ 
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
//  /   /         Filename           : ddrmc_dc.sv 
// /___/   /\     Date Last Modified : $Date: 2016/03/07 $
// \   \  /  \    Date Created       : March 7 2016
//  \___\/\___\
//
// Device           : Everest
// Design Name      : MC (Memory Controller)
// Purpose          : DRAM Controller 
// 
// Reference        :
// Revision History :
//*****************************************************************************
`include "noc_na_v1_0_0_dc_common_define.vh"
`include "mc_macros.svh"
`ifndef BFM_SIMULATION
`include "noc_mc_ddr4_v1_0_txnq.sv"
`endif
`timescale 1ps / 1ps

module noc_mc_ddr4_v1_0_dc # (parameter REG_SAFE_CONFIG0 = 32'h0 
                  ,parameter REG_SAFE_CONFIG1 = 32'h0 
                  ,parameter REG_SAFE_CONFIG2 = 32'h0 
                  ,parameter REG_SAFE_CONFIG3 = 32'h0 
                  ,parameter REG_SAFE_CONFIG4 = 32'h0 
                  ,parameter REG_SAFE_CONFIG5 = 32'h0 
                  ,parameter REG_SAFE_CONFIG6 = 32'h0 
                  ,parameter REG_SAFE_CONFIG7 = 32'h0 
                  ,parameter REG_SAFE_CONFIG8 = 32'h0 
                  ,parameter REG_REF_0        = 32'h0 
                  ,parameter REG_TXN_CONFIG   = 32'h0 
                  ,parameter REG_WR_CONFIG    = 32'h0 
                  ,parameter REG_RD_CONFIG    = 32'h0 
                  ,parameter REG_PT_CONFIG    = 32'h0 
                  ,parameter REG_DRAM_ARB     = 32'h0 
                  ,parameter REG_CONFIG0      = 32'h0
                  ,parameter REG_ADEC0        = 32'h0 
                  ,parameter REG_ADEC1        = 32'h0 
                  ,parameter REG_ADEC2        = 32'h0 
                  ,parameter REG_ADEC3        = 32'h0 
                  ,parameter REG_ADEC4        = 32'h0 
                  ,parameter REG_ADEC5        = 32'h0 
                  ,parameter REG_ADEC6        = 32'h0 
                  ,parameter REG_ADEC7        = 32'h0 
                  ,parameter REG_ADEC8        = 32'h0 
                  ,parameter REG_ADEC9        = 32'h0 
                  ,parameter REG_ADEC10       = 32'h0 
                  ,parameter REG_ADEC11       = 32'h0 
                  ,parameter CS_WIDTH         = 1
                  ,parameter LRANK_WIDTH      = 1
                  ,parameter CK_WIDTH         = 1
                  ,parameter CKE_WIDTH        = 1
                  ,parameter ADDR_WIDTH       = 1
                  ,parameter RANK_WIDTH       = 1
                  ,parameter BANK_WIDTH       = 1
                  ,parameter BANK_GROUP_WIDTH = 1
                  ,parameter ROW_WIDTH        = 1
                  ,parameter COL_WIDTH        = 1
                  ,parameter ODT_WIDTH        = 1
                  ,parameter DRAM_WIDTH       = 1
                  ,parameter DQ_WIDTH         = 1
                  ,parameter DQS_WIDTH        = 1
                  ,parameter DM_WIDTH         = 1
                  ,parameter WDB_DATA_WIDTH   = 1
                  ,parameter WDB_DM_WIDTH     = 1
                  ,parameter bit VERBOSITY_EN = 0
                  ,parameter MC_REFRESH_RATE = "1x"
		              ,parameter bit XLNX_RESPONDER= 1
  )(
// Clocking and Reset
   input                                                 mc_clk
  ,input                                                 mc_rst
  ,input                                                 pll_clk
  ,input                                                 pll_rst
  `ifdef BFM_SIMULATION
	,input                                                 initDone	
  `else
  ,output   reg                                          initDone
  `endif
// ============================
// Write port for write data from the NA write buffer 
// ADEC Interface to NA Block
  ,input [1:0]                                           na2dc_txn_push     
  ,input                                                 na2dc_txn_type_read
  ,input [`MC_QOS_CLS-1:0]                               na2dc_txn_qos      
  ,input                                                 na2dc_txn_partial
  ,input [`TXN_ADDR_WIDTH-1:0]                           na2dc_txn_address
  ,input [7:0]                                           na2dc_txn_timer
  ,input                                                 na2dc_txn_align_strb

  ,input                                                 na2dc_txn_exokay   
  ,input  [WDB_DATA_WIDTH-1:0]                           na2dc_wr_data
  ,input  [WDB_DM_WIDTH-1:0]                             na2dc_byte_en
  
  ,input                                                 na2dc_llr_tmr_update
  ,input                                                 na2dc_ber_tmr_update
  ,input                                                 na2dc_isr_tmr_update
  ,input                                                 na2dc_bew_tmr_update
  ,input                                                 na2dc_isw_tmr_update
  ,input			           		 na2dc_rret_almost_full //If NON_S80 (read ret data AFIFO fill level exceeds threshold - Stop processing full read txns,allow full wr/RMW/Partial writes) else (Always 0)
  ,input			           		 na2dc_raww_almost_full //If NON_S80 (wrap-raw hit indication to RROB related AFIFO fill level exceeds threshold - Back pressures NA)  else (Always 0)
  /*`ifdef NON_S80
  ,input [`DC_RROB_PTR:0]                                na2dc_txn_rrob_add      //Assuming that this signal is the Read Pointer from RROB
  ,output logic [`DC_RROB_PTR:0]                         dc2na_read_wrap_rrob_ptr
  ,output logic [`DC_RROB_PTR:0]                         dc2na_rd_data_addr  
  `else*/
  ,output logic [`DC_RROB_PTR-1:0]                       dc2na_rd_data_addr      
  ,output logic [`DC_RROB_PTR-1:0]                       dc2na_read_wrap_rrob_ptr
  ,input [`DC_RROB_PTR-1:0]                              na2dc_txn_rrob_add      //Assuming that this signal is the Read Pointer from RROB
  //`endif
  // ACAM Interface to NA Block
  ,output                                                dc2na_full_llr   
  ,output                                                dc2na_full_isochr
  ,output                                                dc2na_full_ber   
  ,output                                                dc2na_full_isochw
  ,output                                                dc2na_full_bew
  ,output logic                                          dc2na_read_wrap_det
  ,output logic [WDB_DATA_WIDTH-1:0]                     dc2na_rd_data
  ,output logic                                          dc2na_rd_data_en
  ,input [31:0]                                          tCK

  ,input [31:0] reg_safe_config0                     
	,input [6:0] reg_safe_config0_tccd_s_sr            
	,input [6:0] reg_safe_config0_tccd_l_sr            
	,input [4:0] reg_safe_config0_trrd_s               
	,input [4:0] reg_safe_config0_trrd_l               
  ,input [7:0] reg_safe_config0_tfaw                 
	,input [31:0] reg_safe_config1                     
  ,input [6:0] reg_safe_config1_tcs_r2r_dr           
	,input [6:0] reg_safe_config1_tcs_r2r_sr_dlr       
	,input [6:0] reg_safe_config1_tcs_w2w_dr           
	,input [6:0] reg_safe_config1_tcs_w2w_sr_dlr       
	,input [3:0] reg_safe_config1_trrd_dlr             
	,input [31:0] reg_safe_config2                     
  ,input [5:0] reg_safe_config2_trcd                 
  ,input [5:0] reg_safe_config2_trp                  
	,input [6:0] reg_safe_config2_tras                 
  ,input [6:0] reg_safe_config2_trc                  
	,input [5:0] reg_safe_config2_tfaw_dlr             
	,input [31:0] reg_safe_config3                     
	,input [6:0] reg_safe_config3_tcs_w2r_l_sr         
	,input [6:0] reg_safe_config3_tcs_w2r_s_sr         
	,input [6:0] reg_safe_config3_tcs_w2r_dr            
	,input [6:0] reg_safe_config3_tcs_w2r_sr_dlr       
  ,input [31:0] reg_safe_config4                     
	,input [4:0] reg_safe_config4_trtp                 
  ,input [6:0] reg_safe_config4_tcs_r2w_sr           
	,input [6:0] reg_safe_config4_tcs_r2w_dr           
	,input [6:0] reg_safe_config4_tcs_w2p              
	,input [31:0] reg_safe_config5                     
	,input [6:0] reg_safe_config5_cas_latency          
	,input [6:0] reg_safe_config5_cwl                  
  ,input [5:0] reg_safe_config5_trp_ab               
  ,input [6:0] reg_safe_config5_tccdmw               
  ,input [2:0] reg_safe_config5_add_cmd_delay        
  ,input       reg_safe_config5_add_cmd_delay_en     
	,input [31:0] reg_safe_config6                     
  ,input [15:0] reg_safe_config6_trefi               
	,input [31:0] reg_safe_config7                     
	,input [9:0] reg_safe_config7_trfc_slr_ab          
	,input [9:0] reg_safe_config7_trfc_dlr_pb          
	,input [9:0] reg_safe_config7_trfc_r2r             
  ,input [31:0] reg_safe_config8                     
  ,input [15:0] reg_safe_config8_tzqcs               
  ,input [31:0] reg_ref_0                            
	,input [1:0] reg_ref_0_refresh_speed               
  ,input [31:0] reg_rd_config                        
	,input [4:0] reg_rd_config_full_threshold          
  ,input [9:0] reg_rd_config_iso_timeout             
	,input [9:0] reg_rd_config_ll_timeout              
	,input [31:0] reg_pt_config                        
	,input [1:0] reg_pt_config_page_policy             
	,input [15:0] reg_pt_config_page_timer             
	,input [31:0] reg_dram_arb                         
  ,input [4:0] reg_dram_arb_write_level_hi           
  ,input [4:0] reg_dram_arb_write_level_lo           
	,input  [31:0] reg_adec0                            
	,input  [19:0] reg_adec0_low_mem_base               
	,input  [31:0] reg_adec1                            
	,input  [19:0] reg_adec1_low_mem_offset             
	,input  [31:0] reg_adec2                            
  ,input  [19:0] reg_adec2_high_mem_base              
	,input  [31:0] reg_adec3                            
	,input  [31:0] reg_adec3_high_mem_offset            
	,input  [31:0] reg_adec4                            
  ,input  [5:0] reg_adec4_rank_0                      
  ,input   [5:0] reg_adec4_rank_1                     
	,input  [5:0] reg_adec4_lrank_0                     
  ,input  [5:0] reg_adec4_lrank_1                     
	,input  [5:0] reg_adec4_lrank_2                     
	,input  [31:0] reg_adec5                            
	,input  [5:0] reg_adec5_row_4                       
	,input  [5:0] reg_adec5_row_3                       
	,input  [5:0] reg_adec5_row_2                       
  ,input  [5:0] reg_adec5_row_1                       
	,input  [5:0] reg_adec5_row_0                       
	,input  [31:0] reg_adec6                            
	,input  [5:0] reg_adec6_row_9                       
	,input  [5:0] reg_adec6_row_8                       
	,input  [5:0] reg_adec6_row_7                       
	,input  [5:0] reg_adec6_row_6                       
  ,input  [5:0] reg_adec6_row_5                       
  ,input  [31:0] reg_adec7                            
	,input  [5:0] reg_adec7_row_14                      
	,input  [5:0] reg_adec7_row_13                      
	,input  [5:0] reg_adec7_row_12                      
	,input  [5:0] reg_adec7_row_11                      
  ,input  [5:0] reg_adec7_row_10                      
  ,input  [31:0] reg_adec8                            
	,input  [5:0] reg_adec8_col_0                       
	,input  [5:0] reg_adec8_row_18                      
	,input   [5:0] reg_adec8_row_17                     
	,input  [5:0] reg_adec8_row_16                      
	,input  [5:0] reg_adec8_row_15                      
	,input  [31:0] reg_adec9                            
  ,input  [5:0] reg_adec9_col_5                       
	,input  [5:0] reg_adec9_col_4                       
	,input  [5:0] reg_adec9_col_3                       
	,input  [5:0] reg_adec9_col_2                       
	,input  [5:0] reg_adec9_col_1                       
  ,input  [31:0] reg_adec10                           
	,input   [5:0] reg_adec10_bank_0                     
	,input   [5:0] reg_adec10_col_9                      
	,input   [5:0] reg_adec10_col_8                      
	,input   [5:0] reg_adec10_col_7                      
	,input   [5:0] reg_adec10_col_6                      
	,input   [31:0] reg_adec11                           
  ,input   [5:0] reg_adec11_ch_sel                     
	,input   [5:0] reg_adec11_group_1                    
	,input   [5:0] reg_adec11_group_0                    
	,input   [5:0] reg_adec11_bank_1        
  ,input   reg_pinout_ecc_encode_en
  ,input   reg_config0_dm_en
	,input   [31:0]reg_txn_config
	,input   [15:0]reg_txn_config_txnq_rd_starved_timer
  ,input         reg_txn_config_txnq_all_cmd_arb_mode
  ,input         reg_txn_config_txnq_rd_pri_arb_only_mode
	,input         reg_txn_config_txnq_rd_pri_and_starved_arb_only_mode
	,input         reg_txn_config_txnq_rd_pri_wr_pri_arb_only_mode
	,input   [31:0]reg_wr_config
	,input   [15:0]reg_wr_config_txnq_wr_rd_pri_timer
  ,input   [15:0]reg_wr_config_txnq_wr_top_timer
  ,input   [31:0]txnq_rd_priority
	,input   [7:0] txnq_rd_priority_th_low
	,input   [7:0] txnq_rd_priority_th_med
	,input   [7:0] txnq_rd_priority_th_high
	,input         txnq_rd_priority_skip_count_en
  ,input         txnq_rd_priority_only_read
	,input   [31:0]txnq_wr_priority
	,input   [7:0] txnq_wr_priority_th_low
	,input   [7:0] txnq_wr_priority_th_med
	,input   [7:0] txnq_wr_priority_th_high
	,input         txnq_wr_priority_skip_count_en                      
	,input   [31:0]reg_retry_0
	,input   [5:0] reg_retry_0_rmw_fifo_dealloc_period
	,input   [31:0]reg_retry_1
	,input   [5:0] reg_retry_1_retry_fifo_dealloc_period
	,input   [5:0] reg_retry_1_wr_fifo_dealloc_period
  ,input   [6:0] fifo_rden_dly
  ,input [31:0] reg_config2                  
  ,input   reg_config2_per_rd_en
  ,input [19:0]  reg_config2_per_rd_interval
  ,input [2:0]  xpi_write_dm_dbi_config
  ,input   xpi_read_dbi_en

	,output                                                ddr_act_n
  ,output [ADDR_WIDTH-1:0]                               ddr_adr
	,output [BANK_WIDTH-1:0]                               ddr_ba
	,output [BANK_GROUP_WIDTH-1:0]                         ddr_bg
	,output [LRANK_WIDTH-1:0]                              ddr_c
  ,output [CKE_WIDTH-1:0]                                ddr_cke
  ,output [ODT_WIDTH-1:0]                                ddr_odt
  ,output [CS_WIDTH-1:0]                                 ddr_cs_n
  ,output [CK_WIDTH-1:0]                                 ddr_ck_t
  ,output [CK_WIDTH-1:0]                                 ddr_ck_c
  ,output  reg                                           ddr_reset_n
  //`ifndef BFM_SIMULATION
  ,inout  [DM_WIDTH-1:0]                                 ddr_dm_dbi_n
  ,inout  [DQ_WIDTH-1:0]                                 ddr_dq
  ,inout  [DQS_WIDTH-1:0]                                ddr_dqs_c
  ,inout  [DQS_WIDTH-1:0]                                ddr_dqs_t
  //`else
  //,inout  [8:0]                                          ddr_dm_dbi_n
  //,inout  [79:0]                                 ddr_dq
 // ,inout  [17:0]                                ddr_dqs_c
 // ,inout  [17:0]                                ddr_dqs_t
  //`endif
  ,output logic [4:0]                                          dc2na_txnq_pop   
);

  parameter DELAY_ADEC =6;
  parameter DELAY_RD   =4;

//Reister Decoding
integer tccd_s_sr      ;
integer tccd_l_sr      ;
integer trrd_s         ;
integer trrd_l         ;
integer tfaw           ;
integer tcs_r2r_dr     ;
integer tcs_r2r_sr_dlr ;
integer tcs_w2w_dr     ;
integer tcs_w2w_sr_dlr ;
integer trrd_dlr       ;
integer trcd           ;
integer trp            ;
integer tras           ;
integer trc            ; 
integer tfaw_dlr       ; //NEW
integer tcs_w2r_s_sr   ;
integer tcs_w2r_l_sr   ;
integer tcs_w2r_dr     ;
integer tcs_w2r_sr_dlr ;
integer trtp           ;   
integer tcs_r2w_sr     ;   
integer tcs_r2w_dr     ;   
integer twr            ; //check this  
integer twtp           ; //check this  
integer tcs_w2p        ;   
integer cl             ; //check this same as cas_latency  
integer cwl            ;   
integer trp_ab         ;   
integer trefi          ;     
integer trefi_d          ;     
integer trfc_slr       ; //=trfc_slr_ab
integer trfc_dlr       ; //=trfc_dlr_pb  
integer trfc_r2r       ;   
integer tzqcs          ;   
integer refresh_speed  ;   
integer rd_wr_timeout  ;   
integer full_wr_th     ;    
integer full_rd_th     ;   
integer iso_timeout    ;   
integer ll_timeout     ;   
integer page_policy    ;   
integer page_timer     ;   
integer write_level_hi ;   
integer write_level_lo ;    
integer LOW_MEM_BASE   ; 
integer LOW_MEM_OFFSET ; 
integer HIGH_MEM_BASE  ; 
integer HIGH_MEM_OFFSET;
integer RANK_0  ;
integer RANK_1  ;
integer LRANK_0 ;
integer LRANK_1 ;
integer LRANK_2 ;
integer ROW_0   ;
integer ROW_1   ;
integer ROW_2   ;
integer ROW_3   ;
integer ROW_4   ;
integer ROW_5   ;
integer ROW_6   ;
integer ROW_7   ;
integer ROW_8   ;
integer ROW_9   ;
integer ROW_10  ;
integer ROW_11  ;
integer ROW_12  ;
integer ROW_13  ;
integer ROW_14  ;
integer ROW_15  ;
integer ROW_16  ;
integer ROW_17  ;
integer ROW_18  ;
integer COL_0   ;
integer COL_1   ;
integer COL_2   ;
integer COL_3   ;
integer COL_4   ;
integer COL_5   ;
integer COL_6   ;
integer COL_7   ;
integer COL_8   ; 
integer COL_9   ;
integer BANK_0   ;      
integer BANK_1  ;
integer GROUP_0 ;
integer GROUP_1 ;
integer CH_SEL  ;
integer DM_DIS;
  bit ecc_en;
  bit dm_enable;
integer add_cmd_delay;
bit add_cmd_delay_en;
integer push_count;
integer push_count_ff;

//Periodic read signals
logic   per_rd_en ;
logic   periodic_rd_1; 
logic   per_rd_array[32];
int     Periodic_rd_interval;
int     per_rd_cnt;
integer  PERIOD_RD;

//REG_CONFIG0 DECODING
  localparam RD_DBI_EN          = REG_CONFIG0[24];
  localparam WR_DBI_EN          = REG_CONFIG0[23];
  localparam LRANKS             = REG_CONFIG0[21:20];   //0-none,1-2,2-4,3-8
  localparam WIDTH_PER_CH       = REG_CONFIG0[19:18];   //0-64,1-32,2-16
  localparam NUM_CH             = REG_CONFIG0[17];      //0-1,1-2
  localparam NUM_SLOTS          = REG_CONFIG0[16];      //0-1,1-2
  localparam NUM_RANKS          = REG_CONFIG0[15:14];   //0-1,1-2,2-4
  localparam DIMM_TYPE          = REG_CONFIG0[13:12];   //0-C,1-U,2-R,3-LR
  localparam DRAM_SIZE          = REG_CONFIG0[10:8];    //0-4G,1-6G,2-8G,3-12G,4-16G,5-32G
  localparam PART_WIDTH         = REG_CONFIG0[5:4];     //0-4,1-8,2-16,3-32
  localparam DRAM_TYPE          = REG_CONFIG0[0];       //0-DDR4 1-LP
  localparam NUM_OF_RANKS       = (2**(NUM_RANKS)) * (2**(NUM_SLOTS));//2**(NUM_RANKS); 
  localparam NUM_OF_LRANKS      = 2**(LRANKS); 
 logic init_done;
  noc_mc_ddr4_v1_0_txnq txnq_fsm;

  // SKIP-FSM Config Regs
  wire [7:0] reg_retry_0_tpar_alert_pw = reg_retry_0[15:8];
  wire [4:0] reg_retry_0_tpar_alert_on = reg_retry_0[7:3];
  wire early_skip_wr_exit_en     = reg_retry_0_tpar_alert_pw[0];
  wire early_skip_rd_exit_en     = reg_retry_0_tpar_alert_pw[1];
  wire clr_wr_seq_no_pend_rd_dis = reg_retry_0_tpar_alert_pw[2];
  wire clr_rd_seq_no_pend_wr_dis = reg_retry_0_tpar_alert_pw[3];
  wire wr_cas_in_read_skip_dis   = reg_retry_0_tpar_alert_pw[4];  //TODO :Dont know the usage ,revisit later
  wire act_pre_es2_mode_en       = reg_retry_0_tpar_alert_pw[5];
  wire rd_cas_in_write_skip_dis  = reg_retry_0_tpar_alert_pw[7];  //TODO :Dont know the usage ,revisit later
  wire wr_dribble_half_speed_en  = reg_retry_0_tpar_alert_on[1];  // disabled by default  EDT 995512
  wire wr_dribble_en             = reg_retry_0_tpar_alert_on[0];  // enabled by default   EDT 995512
  // Enabled by default
  wire eco_1000556_hit_count_chicken_en = reg_retry_0_tpar_alert_pw[6];
  logic [7:0] wr_seq_cas_thresh,rd_seq_cas_thresh;
  logic    wr_pend_count_nz ;
  logic    wr_pend_count_z  ;
  logic    rd_pend_count_nz ;
  logic    rd_pend_count_z  ;
  logic         dribble_wr_seq_cas_count_inc ;
  logic  [7:0]  dribble_wr_seq_cas_count_vec ;
  logic         wr_seq_cas_count_nf  ;
  logic  [7:0]  wr_seq_cas_count_inc ;
  logic  [7:0]  wr_seq_cas_count,rd_seq_cas_count  ;
  logic         rd_seq_cas_count_nf  ;
  logic  [7:0]  rd_seq_cas_count_inc ;
  logic  [7:0]  rd_seq_cas_count_nxt ;
  logic         wr_seq_cas_count_over_thresh;
  logic         rd_seq_cas_count_over_thresh;
  logic         farb_rd_cas_won,farb_wr_cas_won;
  


always @(*) begin
//REG_SAFE_CONFIG0
`ifdef PERF_TESTS_RUN
  tccd_s_sr          = reg_safe_config0_tccd_s_sr;//*tCK;
`else
  tccd_s_sr          = reg_safe_config0_tccd_s_sr;//*tCK;
`endif
  tccd_l_sr          = reg_safe_config0_tccd_l_sr;//*tCK;
  trrd_s             = reg_safe_config0_trrd_s;//*tCK;
  trrd_l             = reg_safe_config0_trrd_l;//*tCK;
  tfaw               = (reg_safe_config0_tfaw+8);//*tCK;  
//REG_SAFE_CONFIG1
  tcs_r2r_dr         = reg_safe_config1_tcs_r2r_dr;// *tCK;
  tcs_r2r_sr_dlr     = reg_safe_config1_tcs_r2r_sr_dlr;// *tCK;
  tcs_w2w_dr         = reg_safe_config1_tcs_w2w_dr;// *tCK;
  tcs_w2w_sr_dlr     = reg_safe_config1_tcs_w2w_sr_dlr;// *tCK;
  trrd_dlr           = reg_safe_config1_trrd_dlr; // *tCK;
//REG_SAFE_CONFIG2
   trcd               = (reg_safe_config2_trcd+8);//*tCK;
   trp                = (reg_safe_config2_trp+8);//*tCK;
   tras               = (reg_safe_config2_tras+8);//*tCK;
   trc                = tras+trp;
   tfaw_dlr           = (reg_safe_config2_tfaw_dlr+8);// *tCK; //check this
//REG_SAFE_CONFIG3
   tcs_w2r_s_sr       = (reg_safe_config3_tcs_w2r_s_sr+8);//*tCK;
   tcs_w2r_l_sr       = (reg_safe_config3_tcs_w2r_l_sr+8);//*tCK;
   tcs_w2r_dr         = (reg_safe_config3_tcs_w2r_dr+8);//*tCK;
   tcs_w2r_sr_dlr     = (reg_safe_config3_tcs_w2r_sr_dlr+8);//*tCK;
//REG_SAFE_CONFIG4
   trtp               = (reg_safe_config4_trtp+6);//*tCK;//NAREDDY TB Issue
   tcs_r2w_sr         = (reg_safe_config4_tcs_r2w_sr+6);//*tCK;
   tcs_r2w_dr         = (reg_safe_config4_tcs_r2w_dr+8);//tCK;
   twr                = 1*tCK;//
   twtp               =  twr + (4 + 16);// * tCK); // tWR + BL8/2 + tCWL
   tcs_w2p            =  (reg_safe_config4_tcs_w2p+8);//*tCK;//NAREDDY TB Issue
//REG_SAFE_CONFIG5
   //cl                 =  reg_safe_config5_cas_latency;//REG_SAFE_CONFIG5[6:0];
   //cwl                =  reg_safe_config5_cwl;
  add_cmd_delay_en = reg_safe_config5_add_cmd_delay_en;
  add_cmd_delay = reg_safe_config5_add_cmd_delay;
//REG_REF_0 
   refresh_speed      = reg_ref_0_refresh_speed ;
//REG_SAFE_CONFIG6
   trefi              =  ((reg_safe_config6_trefi/(NUM_OF_LRANKS*NUM_OF_RANKS)))/(2**(refresh_speed));//*tCK;
//REG_SAFE_CONFIG7
   trfc_slr           = (reg_safe_config7_trfc_slr_ab+8);//*tCK;
   trfc_dlr           = (reg_safe_config7_trfc_dlr_pb+8);//*tCK;
   trfc_r2r           = (reg_safe_config7_trfc_r2r+8);//*tCK;
//REG_SAFE_CONFIG8
   tzqcs              = reg_safe_config8_tzqcs;//*tCK;
//REG_WR_CONFIG
   //full_wr_th         = reg_wr_config_full_threshold ;
//REG_RD_CONFIG
   full_rd_th         = reg_rd_config_full_threshold ;
   iso_timeout        = reg_rd_config_iso_timeout ;
   ll_timeout         = reg_rd_config_ll_timeout ;
//REG_PT_CONFIG
   page_policy        = reg_pt_config_page_policy ;
   page_timer         = reg_pt_config_page_timer ;
//REG_DRAM_ARB
   write_level_hi     = reg_dram_arb_write_level_hi ;
   write_level_lo     = reg_dram_arb_write_level_lo ;  
//REG_ADEC0
  LOW_MEM_BASE    =reg_adec0_low_mem_base ;
//REG_ADEC1
   LOW_MEM_OFFSET  = reg_adec1_low_mem_offset;
//REG_ADEC2
   HIGH_MEM_BASE   = reg_adec2_high_mem_base;
//REG_ADEC3
   HIGH_MEM_OFFSET = reg_adec3_high_mem_offset;
//REG_ADEC4
   RANK_0  = reg_adec4_rank_0;
   RANK_1  = reg_adec4_rank_1;
   LRANK_0 = reg_adec4_lrank_0; 
   LRANK_1 = reg_adec4_lrank_1; 
   LRANK_2 = reg_adec4_lrank_2; 
//REG_ADEC5
   ROW_0   = reg_adec5_row_0;
   ROW_1   = reg_adec5_row_1;
   ROW_2   = reg_adec5_row_2;
   ROW_3   = reg_adec5_row_3;
   ROW_4   = reg_adec5_row_4;
//REG_ADEC6         
   ROW_5   = reg_adec6_row_5;
   ROW_6   = reg_adec6_row_6;
   ROW_7   = reg_adec6_row_7;
   ROW_8   = reg_adec6_row_8;
   ROW_9   = reg_adec6_row_9;
//REG_ADEC7
  ROW_10  = reg_adec7_row_10;
  ROW_11  = reg_adec7_row_11;
  ROW_12  = reg_adec7_row_12;
  ROW_13  = reg_adec7_row_13;
  ROW_14  = reg_adec7_row_14;
//REG_ADEC8
  ROW_15  = reg_adec8_row_15;
  ROW_16  = reg_adec8_row_16;
  ROW_17  = reg_adec8_row_17;
  ROW_18  = reg_adec8_row_18;
  COL_0   = reg_adec8_col_0;
//REG_ADEC9
  COL_1   = reg_adec9_col_1;
  COL_2   = reg_adec9_col_2;
  COL_3   = reg_adec9_col_3;
  COL_4   = reg_adec9_col_4;
  COL_5   = reg_adec9_col_5;
//REG_ADEC10
  COL_6   = reg_adec10_col_6;
  COL_7   = reg_adec10_col_7;
  COL_8   = reg_adec10_col_8;
  COL_9   = reg_adec10_col_9;
  BANK_0  = reg_adec10_bank_0;
//REG_ADEC11
  BANK_1  = reg_adec11_bank_1;
  GROUP_0 = reg_adec11_group_0;
  GROUP_1 = reg_adec11_group_1;
  CH_SEL  = reg_adec11_ch_sel;
//REG_PINOUT
  ecc_en = reg_pinout_ecc_encode_en; 
//REG_CONFOG0
  DM_DIS  = reg_config0_dm_en?0:1;
  dm_enable = reg_config0_dm_en;
  //REG_CONFIG2 
  per_rd_en  = reg_config2_per_rd_en;   //CR-1088036 : per_rd_en & interval are not loading from initial block 
  Periodic_rd_interval=reg_config2_per_rd_interval;
end

//Periodic read signal initialization
initial begin
  //per_rd_en  = reg_config2_per_rd_en;
  //Periodic_rd_interval=reg_config2_per_rd_interval;
  //per_rd_en            = 1'b0;
  //Periodic_rd_interval = 1593;
  per_rd_cnt           = 0;
  periodic_rd_1        = 'b0;
  PERIOD_RD            = 'b0;
  for (int i=0;i<32;i++)
    per_rd_array[i]=1'b0;
end


always @(*) begin
if(add_cmd_delay_en==1) begin
   cl                 = (reg_safe_config5_cas_latency) - (2*(add_cmd_delay+1));//REG_SAFE_CONFIG5[6:0];
   cwl                = (reg_safe_config5_cwl) - (2*(add_cmd_delay+1));
end
else begin
    cl                 = (reg_safe_config5_cas_latency);
    cwl                = (reg_safe_config5_cwl);
end

if (DIMM_TYPE==3) begin
    cl                 = cl+1;
    cwl                = cwl-1;
end
end



initial begin
  txnq_fsm = new();
end
always @(*) begin
  txnq_fsm.rst = mc_rst;
  txnq_fsm.all_cmd_arb_mode                 = reg_txn_config_txnq_all_cmd_arb_mode;
  txnq_fsm.rd_pri_arb_only_mode             = reg_txn_config_txnq_rd_pri_arb_only_mode;
  txnq_fsm.rd_pri_and_starved_arb_only_mode = reg_txn_config_txnq_rd_pri_and_starved_arb_only_mode;
  txnq_fsm.txnq_rd_starved_timer            = reg_txn_config_txnq_rd_starved_timer  ;         
  txnq_fsm.txnq_wr_rd_pri_timer = reg_wr_config_txnq_wr_rd_pri_timer;               
  txnq_fsm.txnq_wr_top_timer = reg_wr_config_txnq_wr_top_timer;
  
  //SKIP- FSM Details
  txnq_fsm.txnq_rd_priority_skip_count_en   = txnq_rd_priority_skip_count_en;
  txnq_fsm.txnq_wr_priority_skip_count_en  = txnq_wr_priority_skip_count_en;

  end
logic MR0_13;
logic[2:0] MR0_11_10_9;
logic[4:0] MR0_12_6_5_4_2;
logic[2:0] MR2_5_4_3;
logic[2:0] MR3_8_7_6;
logic[2:0] MR6_12_11_10;
logic[31:0] MR0;
logic[31:0] MR1;
logic[31:0] MR2;
logic[31:0] MR3;
logic[31:0] MR4;
logic[31:0] MR5;
logic[31:0] MR6;
always @(*) begin
  MR0_13 = (trtp==13) ? 1'b1: 1'b0; //CR-1082879 - To support initialization in lower speed grids, modify MR0[13,11,10,9] bits
  //MR0_11_10_9 = 3'b110; 
  MR0_11_10_9 =  (trtp==5) ? 3'b000 : (trtp==6) ? 3'b001 :  (trtp==7) ? 3'b010 : (trtp==8) ? 3'b011 : (trtp==9) ? 3'b100 : (trtp==10) ? 3'b101 :(trtp==12) ? 3'b110 : (trtp==11) ? 3'b111 : (trtp==13) ? 3'b000 : 3'b110 ; //Supporting for All the values of RTP 
  MR0_12_6_5_4_2 = (cl==9) ? 5'b00000:(cl==10) ? 5'b00001:(cl==11) ? 5'b00010:(cl==12) ? 5'b00011:(cl==13) ? 5'b00100:(cl==14) ? 5'b00101:(cl==15) ? 5'b00110:(cl==16) ? 5'b00111:(cl==18) ? 5'b01000:(cl==20) ? 5'b01001:(cl==22) ? 5'b01010:(cl==24) ? 5'b01011:(cl==23) ? 5'b01100:(cl==17) ? 5'b01101:(cl==19) ? 5'b01110:(cl==21) ? 5'b01111:(cl==25) ? 5'b10000:(cl==26) ? 5'b10001:(cl==27) ? 5'b10010:(cl==28) ? 5'b10011:(cl==29) ? 5'b10100:(cl==30) ? 5'b10101:(cl==31) ? 5'b10110:(cl==32) ? 5'b10111:5'b01011;
  //MR0       = {MR0_12_6_5_4_2[4],MR0_11_10_9,1'b1,1'b0,MR0_12_6_5_4_2[3:1],1'b0,MR0_12_6_5_4_2[0],2'b00};//13'b0110101010100; //CL = 24
  MR0       = {MR0_13,MR0_12_6_5_4_2[4],MR0_11_10_9,1'b1,1'b0,MR0_12_6_5_4_2[3:1],1'b0,MR0_12_6_5_4_2[0],2'b00};//13'b0110101010100; //CL = 24
  MR2_5_4_3 = (cwl==9) ? 3'b000:(cwl==10) ? 3'b001:(cwl==11) ? 3'b010:(cwl==12) ? 3'b011:(cwl==14) ? 3'b100:(cwl==16) ? 3'b101:(cwl==18) ? 3'b110:(cwl==20) ? 3'b111: 3'b101;
  MR2       = {7'b0000000,MR2_5_4_3,3'b000};// ;13'b0000000101000; //CWL = 16
  MR1       = 13'b0001100000001;
  //MR3       = 13'b0001000000000; //CR-1088167 : Chnage MR according to refresh rate and disable CRC wr latency parameter
  MR3_8_7_6 = (MC_REFRESH_RATE == "1x") ? 3'b000:  (MC_REFRESH_RATE == "2x") ? 3'b001:  (MC_REFRESH_RATE == "4x") ? 3'b010 : 3'b000;
  MR3       = {4'b0000,MR3_8_7_6,6'b000000}; 
  MR4       = 13'b0000000000000;
  MR5       = 13'b0010000000000;
  //MR6       = 13'b0 1000 0001 0100; //CR-1088167 : Change MR according to tccdl
  MR6_12_11_10 =  (tccd_l_sr >= 8) ? 3'b100 : (tccd_l_sr == 7) ?  3'b011: (tccd_l_sr == 6) ?  3'b010 : (tccd_l_sr == 5) ?  3'b001 :   (tccd_l_sr == 4) ?  3'b000 :  3'b000     ;
  MR6          = {MR6_12_11_10 ,10'b0000010100  };
  //localparam         tfabric = tCK*2;
end
//  localparam integer LRANK_WIDTH          = ((LRANKS == 0) || (LRANKS == 1))?1:LRANKS;
  localparam integer NUM_OF_BANKS         = (DRAM_TYPE == 0)?4:8;
  localparam integer NUM_OF_BGS           = (DRAM_TYPE == 0)?((PART_WIDTH ==2)?2:4):0;;
  localparam integer PT_RNK_WID           = NUM_RANKS;
  localparam integer INTR_WIDTH           = NUM_OF_RANKS + LRANKS + BANK_GROUP_WIDTH + BANK_WIDTH;
  localparam integer PT_DEPTH             = 2**(INTR_WIDTH);
  localparam integer PT_STATUS            = 1;
  localparam         NA_QOS_WIDTH         = 5;
  
  //CR-1088629 - reducing the init delays for xlnx responder in VIVADO simulations
  localparam    tXPR      = XLNX_RESPONDER ? 2  : 287; //This is approx trfc_slr+10ns
  localparam    tMOD      = XLNX_RESPONDER ? 2  : 12;
  localparam    tMRD      = 6;
  localparam    tZQINIT   = XLNX_RESPONDER ? 2  : 512;
  localparam    t200us    = XLNX_RESPONDER ? 2  : 200;
  localparam    t500us    = XLNX_RESPONDER ? 2  : 300;
  localparam    DMC2PHY_CMD_ADDR_WIDTH = ODT_WIDTH+CKE_WIDTH+LRANK_WIDTH+CS_WIDTH+1+2*CK_WIDTH+BANK_GROUP_WIDTH+BANK_WIDTH+ADDR_WIDTH;// 1 ->for act_n pin
  localparam    PHY2DMC_DATA_WIDTH  = DQ_WIDTH;
  localparam    DMC2PHY_TOTAL_WIDTH = DM_WIDTH+2*DQS_WIDTH+DQ_WIDTH+DMC2PHY_CMD_ADDR_WIDTH;
  localparam    DMC2PHY_TOTAL_DATA_WIDTH  = DM_WIDTH+2*DQS_WIDTH+DQ_WIDTH;
  localparam    integer TXN_DEPTH = 32;

  time TRRD_L[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS] ;
  time TRRD_S[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS] ;
  time TRRD_DLR[NUM_OF_RANKS][NUM_OF_LRANKS] ;
  time TFAW[NUM_OF_RANKS];
  time TACT[NUM_OF_RANKS][5];
  time TRC[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS][NUM_OF_BANKS]; //tRC(ACT to ACT or REF) = tRAS(ACT to PRE) + tRP(PRE CMD time) 
  time TRP[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS][NUM_OF_BANKS];
  time TRFC[NUM_OF_RANKS][NUM_OF_LRANKS];
  time TRAS[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS][NUM_OF_BANKS];
  time TRTP[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS][NUM_OF_BANKS];
  time TWR[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS][NUM_OF_BANKS];
  time TRCD[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS][NUM_OF_BANKS];
  time TWTR_L[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS];
  time TWTR_S[NUM_OF_RANKS][NUM_OF_LRANKS][NUM_OF_BGS];
  time TWTR_SR_DLR[NUM_OF_RANKS][NUM_OF_LRANKS];
  time TWTR_DR[NUM_OF_RANKS];
  time TCCD_L[NUM_OF_RANKS][NUM_OF_BGS];
  time TRTR[NUM_OF_RANKS][NUM_OF_LRANKS];
  time TWTW[NUM_OF_RANKS][NUM_OF_LRANKS];
  time TCCD_S[NUM_OF_RANKS][NUM_OF_BGS];
  time TRTW[NUM_OF_RANKS][NUM_OF_LRANKS];//Read to Write = RL+BL/2-WL+2tCK; 
  time TREFI[NUM_OF_RANKS];
  time TREFI_PEND[NUM_OF_RANKS];
  
  
  logic [WDB_DATA_WIDTH-1:0]   dc2na_rd_data_nxt[DELAY_RD:0];
  logic                        dc2na_rd_data_en_nxt[DELAY_RD:0];
  logic [`DC_RROB_PTR-1:0]     dc2na_rd_data_addr_nxt[DELAY_RD:0];      

  
  wdb_req_dc                   wdb_req_int();
  
  logic                        read_hit_write;
  logic                        read_hit_read;
  logic                        write_hit_write;
  logic                        write_hit_read;
  logic                        valid_req_gen;
  logic                        waw_overwrite;
  logic                        rmw_overwrite;
  logic                        rmw_overwrite_nxt;
  logic                        read_wrap_det;
  logic                         wr_data_en;
  logic                         wr_data_en_nxt,wr_data_en_nxt_ff ;
  logic [WDB_DATA_WIDTH-1:0]    wr_data;
  logic [WDB_DM_WIDTH-1:0]      byte_en ;
  logic [WDB_DATA_WIDTH-1:0]    wr_data_temp;
  logic [WDB_DM_WIDTH-1:0]      byte_en_temp ;
  logic [`MC_BUFADDR_WIDTH-1:0] wr_data_addr;  
  logic [`MC_BUFADDR_WIDTH-1:0] wr_data_addr_nxt, wr_data_addr_nxt_ff ;  
  logic [`MC_BUFADDR_WIDTH-1:0] wr_data_addr_1;  
  wire  [5:0]                   size;
  logic [5:0]                   size_count;
  logic [ROW_WIDTH+BANK_WIDTH+BANK_GROUP_WIDTH+LRANK_WIDTH+RANK_WIDTH+COL_WIDTH-1:0] cur_addr;
  logic [ROW_WIDTH+BANK_WIDTH+BANK_GROUP_WIDTH+LRANK_WIDTH+RANK_WIDTH+COL_WIDTH-1:0] txn_addr;
  logic [ROW_WIDTH+BANK_WIDTH+BANK_GROUP_WIDTH+LRANK_WIDTH+RANK_WIDTH+COL_WIDTH-1:0] pre_addr_wr;
  logic [ROW_WIDTH+BANK_WIDTH+BANK_GROUP_WIDTH+LRANK_WIDTH+RANK_WIDTH+COL_WIDTH-1:0] hit_addr_wr;
  logic                        db_req;
  logic                        gnt;
  logic rd_en;
  logic [WDB_DATA_WIDTH-1:0]    dram_rd_data_2na;
  logic                         dram_rd_data_en_2na;
  logic [`DC_RROB_PTR-1:0]      dram_rd_addr_2na;      
  logic [5-1:0]                 dram_rd_txnq_loc_2na;      
  logic [WDB_DATA_WIDTH-1:0]    dram_rd_data_2db;
  logic                         dram_rd_data_en_2db;
  logic [`DC_RROB_PTR-1:0]      dram_rd_addr_2db;      
  logic [5-1:0]                 dram_rd_data_db_buf_addr_2db;      
  logic [5-1:0]                 dram_rd_txnq_loc_2db;      
  logic [WDB_DATA_WIDTH-1:0]    dram_rd_data_2db_nxt;
  logic                         dram_rd_data_en_2db_nxt;
  logic                         dram_rd_data_en_2db_nxt_1;
  logic [`DC_RROB_PTR-1:0]      dram_rd_addr_2db_nxt;      
  logic [5-1:0]                 dram_rd_data_db_buf_addr_2db_nxt;      
  logic [5-1:0]                 dram_rd_txnq_loc_2db_nxt;      
  logic [5-1:0]                 dram_rd_txnq_loc_2db_nxt_1;      
  logic                         bypass_data_en     ; 
  logic [WDB_DATA_WIDTH-1:0]    bypass_data        ; 
  logic [`MC_BUFADDR_WIDTH-1:0] bypass_data_addr   ;
  logic [`DC_RROB_PTR-1:0]      bypass_rrob_ptr    ; 
  logic [4:0]                   bypass_rd_location ; 
  logic [4:0]                   bypass_wr_location ;  
  logic [31:0]                  wdb_valid_reg;
  logic [`MC_BUFADDR_WIDTH-1:0] wdb_buf_ptr;
  logic [4:0]                   by_count;  
  logic [4:0]                   wr_id;  
  logic rd_bypass_out;  
  logic [4:0] rd_bypass_out_t;  
  logic [4:0] rd_bypass_out_s1_t;  
  logic rd_bypass_out_s1;  
  logic [`DC_RROB_PTR-1:0] dram_rd_addr_1;
  logic [`DC_RROB_PTR-1:0] dram_rd_addr_1_2na;
  logic [`MC_BUFADDR_WIDTH-1:0] db_addr_1;
  logic [5:0] rd_addr_1;
  logic rd_bypass;
  
  event farb_done;
  event read_location_updated;
  event dmc2phy_fifo_rden_done;
  event dram_rd_data_avail;
  event bypass_rd_data_avail;
  event bypass_update_done;
  
  
  
  logic [4:0]                  wr_count;
  logic [4:0]                  rd_count;
  logic [5:0]                  free_count;
  
  logic wr_count_stat;
  logic wr_count_stat_1;
 
  logic [BANK_GROUP_WIDTH-1:0] pre_req_bg;
  logic [BANK_WIDTH-1:0]       pre_req_ba;
  logic [BANK_GROUP_WIDTH-1:0] pre_all_req_bg;
  logic [BANK_WIDTH-1:0]       pre_all_req_ba;
  logic                        ref_req_pend;
  logic                        ref_req_pend_d;
  logic [NUM_OF_BANKS*NUM_OF_BGS-1:0]          pre_pend;
  logic [LRANK_WIDTH-1:0]      ref_req_lr;
  logic [RANK_WIDTH-1:0]       ref_req_r;
  logic [NUM_OF_RANKS-1:0]     ref_req_one_hot_r;
  logic [NUM_OF_LRANKS-1:0]    ref_req_one_hot_lr;
  logic [NUM_OF_RANKS-1:0]     farb_r_one_cold0,farb_r_one_cold1;
  logic [NUM_OF_RANKS-1:0]     farb_r_one_cold0_f,farb_r_one_cold1_f;
  logic                        ref_req_done;
  logic                        ref_status, p_rd_ref_status;
  logic                        ref_req_rank;

  logic                        farb_wr_won;
  logic                        farb_rd_won;
  logic                        farb_act_won;
  logic                        farb_pre_won;
  logic                        farb_ref_won;
  logic                        farb_pre_all_won;
  
  logic                        farb_wr_won_slot0;
  logic                        farb_rd_won_slot0;
  logic                        farb_cas_slot0;
  logic                        farb_bypass_slot0;
  logic                        farb_act_slot0;
  logic                        farb_pre_slot0;
  logic                        farb_pre_all_slot0;
  logic                        farb_ref_slot0;
  logic [ADDR_WIDTH-1:0]       farb_addr_slot0;
  logic [BANK_WIDTH-1:0]       farb_bank_slot0;
  logic [BANK_GROUP_WIDTH-1:0] farb_bg_slot0;
  logic [LRANK_WIDTH-1:0]      farb_lrank_slot0;
  logic [RANK_WIDTH-1:0]       farb_rank_slot0;
  
  logic                        farb_wr_won_slot1;
  logic                        farb_rd_won_slot1;
  logic                        farb_ref_slot1;
  logic                        farb_pre_slot1;
  logic                        farb_act_slot1;
  logic                        farb_cas_slot1;
  logic                        farb_bypass_slot1;
  logic                        farb_pre_all_slot1;
  logic [ADDR_WIDTH-1:0]       farb_addr_slot1;
  logic [BANK_WIDTH-1:0]       farb_bank_slot1;
  logic [BANK_GROUP_WIDTH-1:0] farb_bg_slot1;
  logic [LRANK_WIDTH-1:0]      farb_lrank_slot1;
  logic [RANK_WIDTH-1:0]       farb_rank_slot1;
  logic [2:0]                  act_c;
  
  
  logic [4:0]                  farb_id_slot0;
  logic [4:0]                  access_id;
  
  logic [4:0]                  farb_id_slot1;
  logic [4:0]                  access_id_slot1;
  logic [31:0]                 win_act;
  logic [4:0]                  count;
  logic [4:0]                  n_count;
  logic [31:0]                 win_pre;
  logic [4:0]                  count_pre;
  logic [4:0]                  n_count_pre;
  logic [31:0]                 win_cas;
  logic [4:0]                  count_cas;
  logic [4:0]                  n_count_cas;
  logic [5:0]                  wrra_act_won;
  logic [5:0]                  wrra_pre_won;
  logic [5:0]                  wrra_cas_won;
  
  logic [31:0]                 rin_act;
  logic [4:0]                  n_count_rd;
  logic [31:0]                 rin_pre;
  logic [4:0]                  n_count_pre_rd;
  logic [31:0]                 rin_cas;
  logic [4:0]                  n_count_cas_rd;
  logic [5:0]                  raom_act_won;
  logic [5:0]                  raom_pre_won;
  logic [5:0]                  raom_cas_won;
  logic [31:0]                 valid_act[31:0];
  logic [31:0]                 valid_pre[31:0];
  logic [31:0]                 valid_cas[31:0];
  
  
  logic [31:0]                 win_act1;
  logic [4:0]                  count1;
  logic [4:0]                  n_count1;
  logic [31:0]                 win_pre1;
  logic [4:0]                  count_pre1;
  logic [4:0]                  n_count_pre1;
  logic [31:0]                 win_cas1;
  logic [4:0]                  count_cas1;
  logic [4:0]                  n_count_cas1;
  logic [5:0]                  wrra_act_won1;
  logic [5:0]                  wrra_pre_won1;
  logic [5:0]                  wrra_cas_won1;
  
  logic [31:0]                 rin_act1;
  logic [4:0]                  n_count_rd1;
  logic [31:0]                 rin_pre1;
  logic [4:0]                  n_count_pre_rd1;
  logic [31:0]                 rin_cas1;
  logic [4:0]                  n_count_cas_rd1;
  logic [5:0]                  raom_act_won1;
  logic [5:0]                  raom_pre_won1;
  logic [5:0]                  raom_cas_won1;
  logic [31:0]                 valid_act1[31:0];
  logic [31:0]                 valid_pre1[31:0];
  logic [31:0]                 valid_cas1[31:0];
  logic                        pre_all_req_rank;

  logic [NUM_OF_RANKS+(2*NUM_OF_LRANKS)+NUM_OF_BGS-1+2:0]           safe_wr_act_req[32];
  logic [NUM_OF_RANKS+(2*NUM_OF_LRANKS)+NUM_OF_BGS-1+2:0]           safe_rd_act_req[32];
  logic [2*NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS-1+1:0]       safe_wr_cas_req[32];
  logic [2*NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS-1+1:0]       safe_rd_cas_req[32];
  
  logic  [NUM_OF_RANKS+(2*NUM_OF_LRANKS)+NUM_OF_BGS-1+2:0]                     safe_wr_act_req1[32];
  logic  [NUM_OF_RANKS+(2*NUM_OF_LRANKS)+NUM_OF_BGS-1+2:0]                     safe_rd_act_req1[32];
  logic  [2*NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS-1+1:0]                 safe_wr_cas_req1[32];
  logic  [2*NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS-1+1:0]                 safe_rd_cas_req1[32];
  
  logic [TXN_DEPTH -1:0]       safe_wrra_act_req;
  logic [TXN_DEPTH -1:0]       safe_wrra_pre_req;
  logic [TXN_DEPTH -1:0]       safe_wrra_cas_req;
  logic [TXN_DEPTH -1:0]       safe_raom_act_req;
  logic [TXN_DEPTH -1:0]       safe_raom_pre_req;
  logic [TXN_DEPTH -1:0]       safe_raom_cas_req;
  
  logic [TXN_DEPTH -1:0]       safe_wrra_act_req1;
  logic [TXN_DEPTH -1:0]       safe_wrra_pre_req1;
  logic [TXN_DEPTH -1:0]       safe_wrra_cas_req1;
  logic [TXN_DEPTH -1:0]       safe_raom_act_req1;
  logic [TXN_DEPTH -1:0]       safe_raom_pre_req1;
  logic [TXN_DEPTH -1:0]       safe_raom_cas_req1;
 
  logic [TXN_DEPTH -1:0]       safe_wrra_act_req_temp;
  logic [TXN_DEPTH -1:0]       safe_wrra_pre_req_temp;
  logic [TXN_DEPTH -1:0]       safe_wrra_cas_req_temp;
  logic [TXN_DEPTH -1:0]       safe_raom_act_req_temp;
  logic [TXN_DEPTH -1:0]       safe_raom_pre_req_temp;
  logic [TXN_DEPTH -1:0]       safe_raom_cas_req_temp;

  logic block_rd_pre_slot1;
  logic block_wr_pre_slot1;
  logic block_same_pg_rd_pre_slot1;
  logic block_same_pg_wr_pre_slot1;
  logic block_rd_pre_slot0;
  logic block_wr_pre_slot0;
  logic block_rd_act_slot1;
  logic block_wr_act_slot1;
  
  logic block_same_rd_pre_slot1;
  logic block_same_wr_act_slot1;
  logic block_same_wr_pre_slot1;
  logic block_same_rd_act_slot1;
  
  
  logic [TXN_DEPTH -1:0]       safe_wrra_act_req1_true;
  logic [TXN_DEPTH -1:0]       safe_wrra_pre_req1_true;
  logic [TXN_DEPTH -1:0]       safe_wrra_cas_req1_true;
  logic [TXN_DEPTH -1:0]       safe_raom_act_req1_true;
  logic [TXN_DEPTH -1:0]       safe_raom_pre_req1_true;
  logic [TXN_DEPTH -1:0]       safe_raom_cas_req1_true;
  
  
  logic [NUM_OF_BGS*NUM_OF_BANKS -1:0]       safe_pre_all_req;
  logic [NUM_OF_BGS*NUM_OF_BANKS -1:0]       safe_pre_req;
  logic [NUM_OF_BGS*NUM_OF_BANKS -1:0]       safe_pre_all_req1;
  
  logic [`NA_ADDR_WIDTH-1:0]   adec_addr;
  logic [`NA_ADDR_WIDTH-1:0]   adec_addr_eff;
  logic [`NA_ADDR_WIDTH-1:0]   adec_addr1[DELAY_ADEC:0];
  logic [ROW_WIDTH-1:0]        adec_row[DELAY_ADEC:0];
  logic [COL_WIDTH-1:0]        adec_col[DELAY_ADEC:0];
  logic [BANK_WIDTH-1:0]       adec_bank[DELAY_ADEC:0];
  logic [BANK_GROUP_WIDTH-1:0] adec_bg[DELAY_ADEC:0];
  logic [LRANK_WIDTH-1:0]      adec_lrank[DELAY_ADEC:0];
  logic [RANK_WIDTH-1:0]       adec_rank[DELAY_ADEC:0];
  logic [NUM_OF_RANKS-1:0]     adec_rank_one_hot[DELAY_ADEC:0];
  logic [NUM_OF_LRANKS-1:0]    adec_lrank_one_hot[DELAY_ADEC:0];
  logic                        adec_read[DELAY_ADEC:0];
  logic                        adec_write[DELAY_ADEC:0];
  logic                        adec_partial[DELAY_ADEC:0];
  logic                        adec_txn_push[DELAY_ADEC:0];     
  logic                        adec_txn_type_read[DELAY_ADEC:0];
  logic                        adec_txn_align_strb[DELAY_ADEC:0];
  logic  [WDB_DATA_WIDTH-1:0]  adec_wr_data[DELAY_ADEC:0];
  logic  [WDB_DM_WIDTH-1:0]    adec_byte_en[DELAY_ADEC:0];
  logic                        adec_rmw[DELAY_ADEC:0];
  logic                        adec_par_done[DELAY_ADEC:0];
  logic                        adec_rmw_rd_done[DELAY_ADEC:0];
  logic                        adec_wr_done[DELAY_ADEC:0];
  logic [NA_QOS_WIDTH-1:0]     adec_qos_type[DELAY_ADEC:0];
  logic [`MC_BUFADDR_WIDTH-1:0] adec_db[DELAY_ADEC:0];
  logic [`DC_RROB_PTR-1:0]      adec_db_rd[DELAY_ADEC:0];
  logic [7:0]                  adec_timer[DELAY_ADEC:0];
  logic [`NA_ADDR_WIDTH-1:0]   adec_addr_eff_ff;
  logic [`NA_ADDR_WIDTH-1:0]   adec_addr1_ff;
  logic [ROW_WIDTH-1:0]        adec_row_ff;
  logic [COL_WIDTH-1:0]        adec_col_ff;
  logic [BANK_WIDTH-1:0]       adec_bank_ff;
  logic [BANK_GROUP_WIDTH-1:0] adec_bg_ff;
  logic [LRANK_WIDTH-1:0]      adec_lrank_ff;
  logic [RANK_WIDTH-1:0]       adec_rank_ff;
  logic [NUM_OF_RANKS-1:0]     adec_rank_one_hot_ff, p_rd_adec_rank_one_hot_ff;
  logic [NUM_OF_LRANKS-1:0]    adec_lrank_one_hot_ff,p_rd_adec_lrank_one_hot_ff ;
  logic                        adec_read_ff;
  logic                        adec_read_push;
  logic                        adec_write_ff;
  logic                        adec_write_push;
  logic                        adec_partial_ff;
  logic                        adec_txn_push_ff;     
  logic                        adec_txn_type_read_ff;
  logic                        adec_txn_align_strb_ff;
  logic  [WDB_DATA_WIDTH-1:0]  adec_wr_data_ff;
  logic  [WDB_DM_WIDTH-1:0]    adec_byte_en_ff;
  logic                        adec_rmw_ff;
  logic                        adec_rmw_push;
  logic                        adec_par_done_ff;
  logic                        adec_rmw_rd_done_ff;
  logic                        adec_wr_done_ff;
  logic [NA_QOS_WIDTH-1:0]     adec_qos_type_ff;
  logic [`MC_BUFADDR_WIDTH-1:0] adec_db_ff;
  logic [`DC_RROB_PTR-1:0]      adec_db_rd_ff;
  logic [7:0]                  adec_timer_ff;

  logic [4:0] txnq_loca,prev_txnq_loca;
  logic [1:0]                  page_status,p_rd_page_status ;
  logic                                                                              dm_rmw_flow;
  logic                                                                              ndm_rmw_flow;
  
  
  integer                                                                            dram_width = PART_WIDTH;
  
  logic [LRANK_WIDTH*4-1:0]            mcal_C;
  logic [4-1:0]                        mcal_ACT_n;
  logic [ADDR_WIDTH*4-1:0]             mcal_ADR;
  logic [BANK_WIDTH*4-1:0]             mcal_BA;
  logic [BANK_GROUP_WIDTH*4-1:0]       mcal_BG;
  logic [CKE_WIDTH*4-1:0]              mcal_CKE;
  logic [CS_WIDTH*4-1:0]               mcal_CS_n;
  logic [ODT_WIDTH * 4-1:0]            mcal_ODT;
  logic [1:0]                          mcal_addr_41_40;
  logic [1:0]                          mcal_addr_43_42;
  logic [1:0]                          mcal_addr_57_56;
  logic [1:0]                          mcal_addr_59_58;
  logic [1:0]                          mcal_addr_61_60;
  logic [1:0]                          mcal_addr_63_62;
  logic [1:0]                          mcal_addr_65_64;
  logic [1:0]                          mcal_addr_67_66;
  
  logic [3:0]                          dmc2phy_t_b;
  logic [1:0]                          dmc2phy_rden;
  logic                                dmc2phy_fifo_rden;
  logic [PHY2DMC_DATA_WIDTH*4 - 1:0]   mcal_DQOut;
  logic [PHY2DMC_DATA_WIDTH*4 - 1:0]   mcal_DQIn;
  logic [PHY2DMC_DATA_WIDTH*4 - 1:0]   mcal_DQIn_1;
  logic [DM_WIDTH*4-1:0]               mcal_DMOut_n;
  logic [3:0]                          mcal_DQSOut;
  logic [3:0]                          mcal_DQSOut_c;
  logic                                xphy_rst;
  logic [WDB_DATA_WIDTH-1:0]           wr_data_1;
  logic [WDB_DATA_WIDTH-1:0]           wr_data_2;
  logic [WDB_DATA_WIDTH-1:0]           wr_data_s1_c0;
  logic [WDB_DATA_WIDTH-1:0]           wr_data_s1_1;
  logic [WDB_DATA_WIDTH-1:0]           wr_data_s1_2;
  logic [WDB_DM_WIDTH-1:0]             wr_data_en_1;
  logic [WDB_DM_WIDTH-1:0]             wr_data_en_2;
  logic [WDB_DM_WIDTH-1:0]             wr_data_en_s1;
  logic [WDB_DM_WIDTH-1:0]             wr_data_en_s1_1;
  logic [WDB_DM_WIDTH-1:0]             wr_data_en_s1_2;
  logic rd_priority;     
  logic wr_priority ;    
  logic wr_rd_priority;  
  logic wr_top;          
  logic starved_priority;
  logic farb_rd_priority;
  logic farb_wr_priority;
  logic read_arb_only;
  logic write_arb_only;
  logic default_read_only;
  logic wr_cas_count_over_high_th;
  logic wr_cas_count_over_low_th;
  logic wr_cas_count_below_low_th;
  logic skip_fsm_read_only,skip_fsm_write_only;
  logic  [5-1:0] txnq_normal_arb_state ;
  logic  [3-1:0]  txnq_skip_arb_state ;
 //Perf changes
 logic farb_wr_won_slot0_d,farb_wr_won_slot0_2d,farb_wr_won_slot0_3d;
 logic farb_wr_won_slot1_d,farb_wr_won_slot1_2d,farb_wr_won_slot1_3d;
 logic [4:0]         farb_id_slot0_3d,farb_id_slot0_2d,farb_id_slot0_d;
 logic [4:0]         farb_id_slot1_3d,farb_id_slot1_2d,farb_id_slot1_d;
 logic [31:0]        block_wr_cas_incr_id;
 logic delay_wr_cas_farb_d,delay_wr_cas_farb_2d,delay_wr_cas_farb_3d;
//Perf changes

  `define TXN_CNTL            10 
  `define REF_ZQ_STATUS        1 
  `define ADDR_RANGE         `TXN_CNTL+BANK_GROUP_WIDTH+BANK_WIDTH+ROW_WIDTH+COL_WIDTH+LRANK_WIDTH+RANK_WIDTH-1:`TXN_CNTL
  `define ADDR_RANGE_SAFE    `TXN_CNTL+BANK_GROUP_WIDTH+BANK_WIDTH+ROW_WIDTH+LRANK_WIDTH+RANK_WIDTH-1:`TXN_CNTL
  `define PT_RANGE           `TXN_CNTL+BANK_GROUP_WIDTH+BANK_WIDTH+LRANK_WIDTH+RANK_WIDTH-1:`TXN_CNTL
  localparam INDX_1         =  BANK_WIDTH+10;
  localparam INDX_2         =  BANK_GROUP_WIDTH+INDX_1;
  localparam INDX_3         =  LRANK_WIDTH+INDX_2;
  localparam INDX_4         =  RANK_WIDTH+INDX_3;
  localparam INDX_5         =  ROW_WIDTH+INDX_4;
  localparam INDX_6         =  COL_WIDTH+INDX_5;
  localparam INDX_7         =  NA_QOS_WIDTH+INDX_6;
  localparam INDX_8         =  `MC_BUFADDR_WIDTH+INDX_7;
  localparam INDX_9         =  `DC_RROB_PTR+INDX_8;
  localparam INDX_10        = 1+INDX_9;
  localparam INDX_11        = `MC_BUFADDR_WIDTH+INDX_10;
  localparam INDX_12        = 5+INDX_11;
  localparam INDX_13        = 1+INDX_12;
  localparam BLN_COL        = 3; 


  `define TXN_VAL            0:0
  `define TXN_PG_STS         2:1
  `define TXN_READ           3:3 //read txn
  `define TXN_WRITE          4:4 //write txn
  `define TXN_PARTIAL        5:5 //partial write
  `define TXN_PRW            6:6 //read hit a partial write 
  `define TXN_PWR_DONE       7:7
  `define TXN_RMW_RD_DONE    8:8
  `define TXN_WRITE_DONE     9:9 
  `define TXN_BANK           INDX_1-1:10
  `define TXN_GROUP          INDX_2-1:INDX_1
  `define TXN_LRANK          INDX_3-1:INDX_2
  `define TXN_RANK           INDX_4-1:INDX_3
  `define TXN_ROW            INDX_5-1:INDX_4 
  `define TXN_COL            INDX_6-1:INDX_5
  `define TXN_COL_SAFE       INDX_6-1:INDX_5+BLN_COL
  `define TXN_QOS            INDX_7-1:INDX_6
  `define TXN_WDB            INDX_8-1:INDX_7
  `define TXN_RDB            INDX_9-1:INDX_8
  `define TXN_BYP            INDX_10-1:INDX_9
  `define TXN_BYP_ID         INDX_11-1:INDX_10
  `define TXN_BYP_CNTR       INDX_12-1:INDX_11
  `define TXN_REF_ZQ_STATUS  INDX_13-1:INDX_12
  
  `define TXNQ_REQ_HIT       0
  `define TXNQ_REQ_CLOSE     1
  `define TXNQ_REQ_MISS      2
  `define TXNQ_REQ_RD        3
  `define TXNQ_WIDTH         `REF_ZQ_STATUS+5+`MC_BUFADDR_WIDTH+1+`DC_RROB_PTR+NA_QOS_WIDTH+`MC_BUFADDR_WIDTH+ROW_WIDTH+COL_WIDTH+BANK_WIDTH+BANK_GROUP_WIDTH+LRANK_WIDTH+RANK_WIDTH+`TXN_CNTL
  
  reg [ROW_WIDTH+PT_STATUS-1:0] PAGE_TABLE [PT_DEPTH-1:0];
  logic [`TXNQ_WIDTH-1:0] TXNQ[32];
  logic txnq_wr_cas[32];
  logic txnq_rd_cas[32];
  logic [31:0]wr_cas_count[32];
  logic [12:0] TXNQ_TIMER[32];
  logic [64-1:0] TXNQ_T[32];
  logic [3:0] TXNQ_REQ[32];
  logic RD_any_pg_hit,WR_any_pg_hit;
  logic [31:0] pending_hit;
  logic [31:0] wr_hit_pending ;
  logic [31:0] rd_hit_pending ;
  logic [31:0] bypass_rd_hit_pending ;
  int   byp_rd_PG_hit_id ;
  integer WR_FIFO_DEALLOC[32][$]; 
  time RETRY_FIFO_DEALLOC[32]; 
  time RMW_FIFO_DEALLOC[32];
  integer PHY_FIFO_RDEN[32];
  int index ;
  
  logic [31:0] starved_xfer;
  logic [31:0] starved_xfer_byp;
  logic starv_mode;
  logic [`MC_BUFADDR_WIDTH-1:0] bypass_wdb;
  logic [`MC_BUFADDR_WIDTH-1:0] waw_wdb_addr;
  logic [`MC_BUFADDR_WIDTH-1:0] waw_txnq_loc;
  logic [4:0] bypass_cntr;
  logic [4:0]  write_index;
  logic [4:0]  cur_bypass_cntr;
  logic bypass;
  
  integer k;
  reg [7:0] CL,CWL;
  logic [1:0] cwl_delay;
  logic [31:0] cwl_delay_time;
  logic [1:0] crl_delay;

  logic [4:0]                   tmr_update;
  
  noc_mc_ddr4_v1_0_ddrmc_wdb #(
         .WDB_DATA_WIDTH(WDB_DATA_WIDTH)
        ,.WDB_DM_WIDTH  (WDB_DM_WIDTH)
  
  )ddrmc_wdb_u
  (
  .clk   			            (mc_clk            )
  ,.rst_n 			          (mc_rst            )
  ,.rd_data_en            (wr_data_en        )  //read from wbuf and write to xphy(WDB -> DC -> XPHY -> DRAM)
  ,.rd_data_addr          (wr_data_addr      )  //read from wbuf and write to xphy(WDB -> DC -> XPHY -> DRAM)
  ,.rd_data               ({byte_en_temp,wr_data_temp} )
  ,.bypass_data_en        (bypass_data_en    )
  ,.bypass_data_addr      (bypass_data_addr  )
  ,.bypass_data           (bypass_data       )
  ,.bypass_data_avail     (bypass_data_avail )
  ,.wdb_req_1		          (wdb_req_int       )
  );
  
  
logic [31:0] dram_clock_count;
always @(mc_clk) begin
  if(mc_rst)
    dram_clock_count <= 0;
  else
    dram_clock_count <= dram_clock_count+1;

end

logic [31:0] mc_clock_count;
always @(posedge mc_clk) begin
  if(mc_rst)
    mc_clock_count = 0;
  else
    mc_clock_count = mc_clock_count+1;

end

  logic [31:0] pll_clock_count;
always @(negedge pll_clk or posedge pll_rst) begin
  if(pll_rst)
    pll_clock_count = 0;
  else
    pll_clock_count = pll_clock_count+1;

end
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
initial
  begin//{
    adec_addr            = 'd0;
    adec_addr_eff        = 'd0;                                  
    adec_addr1[0]           = 'd0;
    adec_row[0]             = 'd0;
    adec_col[0]             = 'd0;
    adec_bank[0]            = 'd0;
    adec_bg[0]              = 'd0;
    adec_lrank[0]           = 'd0;
    adec_rank[0]            = 'd0;
    adec_rank_one_hot[0]    = 'd0;
    adec_lrank_one_hot[0]   = 'd0;
    adec_read[0]            = 'd0;
    adec_write[0]           = 'd0;
    adec_partial[0]         = 'd0;
    adec_txn_align_strb[0]  = 'd0;
    adec_rmw[0]             = 'd0;
    adec_rmw_rd_done[0]     = 'd0;
    adec_wr_done[0]         = 'd0;
    adec_par_done[0]        = 'd0; 
    adec_qos_type[0]        = 'd0;
    adec_db_rd[0]           = 'd0;
    adec_timer[0]           = 'd0;
    win_act                = 'b0;
    page_status            = 'b0;
    p_rd_page_status       = 'b0;
    bypass                 = 'b0;
    bypass_wdb             = 'b0;
    farb_id_slot0          = 'b0;
    access_id              = 'b0;
    RD_any_pg_hit          = 1'b0;
    WR_any_pg_hit          = 1'b0;    
    count                  = 'b0;
    n_count                = 'b0;
    count_pre              = 'b0;
    n_count_pre            = 'b0;
    count_cas              = 'b0;
    n_count_cas            = 'b0;
    n_count_rd             = 'b0;
    n_count_pre_rd         = 'b0;
    n_count_cas_rd         = 'b0;

    count1                 = 'd31;
    n_count1               = 'b0;
    count_pre1             = 'd31;
    n_count_pre1           = 'b0;
    count_cas1             = 'd31;
    n_count_cas1           = 'b0;
    n_count_rd1            = 'b0;
    n_count_pre_rd1        = 'b0;
    n_count_cas_rd1        = 'b0;


    cur_addr               = 'd0;
    read_hit_read          = 'b0;
    read_hit_write         = 'b0;
    write_hit_read         = 'b0;
    write_hit_write        = 'b0;
    read_wrap_det          = 'b0;
    waw_overwrite          = 'b0;
    
    write_index            = 'd0;
    cur_bypass_cntr        = 'd0;
    bypass_cntr            = 'd0;
    bypass_wdb             = 'd0;
    bypass                 = 'd0;
    waw_wdb_addr           = 'd0;
    db_req                 = 'b0;
    gnt                    = 'b0;


    dram_rd_data_en_2na    = 'd0;
    dram_rd_addr_2na       = 'd0;
    bypass_data_en         = 'd0;
    bypass_data_addr       = 'd0;
    bypass_rrob_ptr        = 'd0; 
    bypass_rd_location     = 'd0;
    bypass_wr_location     = 'd0;
    by_count               = 'd0;
    wr_id                  = 'd0;
    wdb_valid_reg          = 32'b0;
    size_count             = 'd0;
    farb_rd_won_slot0      = 'd0;
    farb_rd_won_slot1      = 'd0;
    for(int i = 0;i<TXN_DEPTH;i++)begin//{
      TXNQ[i] = 'b0;TXNQ_T[i] = 'b0;TXNQ_REQ[i] = 'b0;
      txnq_wr_cas[i] = 'b0;
      txnq_rd_cas[i] = 'b0;
      wr_cas_count[i]= 'd0;
      //WR_FIFO_DEALLOC[i] = 'd0;
      RETRY_FIFO_DEALLOC[i] = 'd0;
      RMW_FIFO_DEALLOC[i] = 'd0;
      PHY_FIFO_RDEN[i]    = 'd0;
      safe_wr_act_req[i]  = 'b0;
      safe_wr_act_req1[i] = 'b0;
      safe_rd_act_req[i]  = 'b0;
      safe_rd_act_req1[i] = 'b0;
      safe_wr_cas_req[i]  = 'b0;
      safe_wr_cas_req1[i] = 'b0;
      safe_rd_cas_req[i]  = 'b0;
      safe_rd_cas_req1[i] = 'b0;
    end//}
      safe_wrra_act_req = 'b0;safe_wrra_act_req1 = 'b0;safe_wrra_act_req_temp = 'b0;
      safe_wrra_pre_req = 'b0;safe_wrra_pre_req1 = 'b0;safe_wrra_pre_req_temp = 'b0;
      safe_wrra_cas_req = 'b0;safe_wrra_cas_req1 = 'b0;safe_wrra_cas_req_temp = 'b0;
      safe_raom_act_req = 'b0;safe_raom_act_req1 = 'b0;safe_raom_act_req_temp = 'b0;
      safe_raom_pre_req = 'b0;safe_raom_pre_req1 = 'b0;safe_raom_pre_req_temp = 'b0;
      safe_raom_cas_req = 'b0;safe_raom_cas_req1 = 'b0;safe_raom_cas_req_temp = 'b0;
      wr_count_stat_1   = 'b0;wr_count_stat      = 'b0;
      farb_r_one_cold0 = {NUM_OF_RANKS{1'b1}};farb_r_one_cold1 = {NUM_OF_RANKS{1'b1}};
      farb_r_one_cold0_f = {NUM_OF_RANKS{1'b1}};farb_r_one_cold1_f = {NUM_OF_RANKS{1'b1}};
      safe_pre_all_req = 'b0;safe_pre_req = 'b0;ref_req_r = 'b0;ref_req_lr = 'b0;ref_req_one_hot_r = 'b0;ref_req_one_hot_lr = 'b0;pre_pend = 'b0;
      ref_req_pend = 'b0;ref_req_done = 'b0;ref_req_pend_d = 'b0;
      farb_ref_won     = 'b0 ;farb_ref_slot0   = 'b0 ;farb_ref_slot1   = 'b0 ;farb_addr_slot0  = 'b0 ;
      farb_bank_slot0  = 'b0 ;farb_bg_slot0    = 'b0 ;farb_lrank_slot0 = 'b0 ;farb_rank_slot0  = 'b0 ;
      farb_addr_slot1  = 'b0 ;farb_bank_slot1  = 'b0 ;farb_bg_slot1    = 'b0 ;farb_lrank_slot1 = 'b0 ;farb_rank_slot1  = 'b0 ;
      farb_act_won       = 'b0  ;farb_act_slot0     = 'b0  ;farb_act_slot1     = 'b0  ;farb_pre_won       = 'b0  ;
      farb_pre_slot0     = 'b0  ;farb_pre_slot1     = 'b0  ;farb_pre_all_won   = 'b0  ;farb_pre_all_slot0 = 'b0  ;
      farb_pre_all_slot1 = 'b0  ;pre_req_bg = 'b0;pre_req_ba = 'b0;pre_all_req_bg = 'b0;pre_all_req_ba = 'b0;wr_count = 'b0; free_count = 'd0; //NAREDDY
      trefi_d = 0;
      for(int i = 0;i<NUM_OF_RANKS;i++)begin//{
        for(int j = 0;j<NUM_OF_LRANKS;j++)begin//{
          for(int k = 0;k<NUM_OF_BGS;k++)begin//{
            for(int l = 0;l<NUM_OF_BANKS;l++)begin//{
              TRRD_L[i][j][k]='b0; TRRD_S[i][j][k]='b0;TFAW[i]='b0;TRFC[i][j] ='b0;TREFI[i]='b0; TRRD_DLR[i][j]='b0;
              TRTW[i][j]='b0;TRC[i][j][k][l]='b0;TRP[i][j][k][l]='b0;TRAS[i][j][k][l]='b0; 
              TRTP[i][j][k][l]='b0;TWR[i][j][k][l]='b0;TRCD[i][j][k][l]='b0; 
              TWTR_L[i][j][k]='b0;TWTR_S[i][j][k]='b0; TWTR_SR_DLR[i][j]='b0;TWTR_DR[i]='b0;
	      TCCD_S[i][k]='b0;TCCD_L[i][k]='b0;TRTR[i][j]='b0;TWTW[i][j]='b0; TREFI_PEND[i]='b0;
            end//}
        end//}
      end//}  
    end//} 
    for(int i = 0;i<NUM_OF_RANKS;i++)begin//{
       for(int j = 0;j<5;j++)begin//{
         TACT[i][j] = 'b0; 
       end//} 
    end//} 
      k = 0 ;
      while (k < PT_DEPTH) begin//{
                PAGE_TABLE[k] = {{ROW_WIDTH{1'b0}},1'b0};
                k++;
      end//}

      
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_VAL              = %d &  = %d",0,0),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_PG_STS           = %d &  = %d",2,1),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_READ             = %d &  = %d",3,3),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_WRITE            = %d &  = %d",4,4),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_PARTIAL          = %d &  = %d",5,5),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_PRW              = %d &  = %d",6,6),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_PWR_DONE         = %d &  = %d",7,7),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_RMW_RD_DONE      = %d &  = %d",8,8),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_WRITE_DONE       = %d &  = %d",9,9),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("PT_RANGE             = %d &  = %d",INDX_4-1,10),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("ADDR_RANGE           = %d &  = %d",INDX_6-1,10),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_BANK             = %d &  = %d",INDX_1-1,10),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_GROUP            = %d &  = %d",INDX_2-1,INDX_1),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_LRANK            = %d &  = %d",INDX_3-1,INDX_2),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_RANK             = %d &  = %d",INDX_4-1,INDX_3),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_ROW              = %d &  = %d",INDX_5-1,INDX_4),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_COL              = %d &  = %d",INDX_6-1,INDX_5),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_COL_SAFE         = %d &  = %d",INDX_6-1,INDX_5+BLN_COL),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_QOS              = %d &  = %d",INDX_7-1,INDX_6),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_WDB              = %d &  = %d",INDX_8-1,INDX_7),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_RDB              = %d &  = %d",INDX_9-1,INDX_8),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_BYP              = %d &  = %d",INDX_10-1,INDX_9),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_BYP_ID           = %d &  = %d",INDX_11-1,INDX_10),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("TXN_BYP_CNTR         = %d &  = %d",INDX_12-1,INDX_11),DBG)
end//}
always @(*) begin
 CWL =cwl;
 CL = cl;
  cwl_delay = 1'b1 + (CWL[0]? 2'b00:2'b10);
  cwl_delay_time = (cwl_delay == 1) ? (((cwl_delay)*tCK)/2) : ((((cwl_delay)*tCK)/2)-1);
`ifndef DENALI_MODEL
  crl_delay = (CL[0]? 2'b10:2'b00); 
  `else 
  crl_delay = (CL[0]? 2'b11:2'b01);
  `endif
end//}

logic RAW_hit_count_above_16;  //ES2 Change
always @ (posedge mc_clk) begin
  for(int i =0;i<32;i++) begin
	  if( TXNQ[i][`TXN_BYP_CNTR] > 16) RAW_hit_count_above_16 =1'b1;
    else RAW_hit_count_above_16 =1'b0;
  end
end
logic [4:0] push_cnt_in_shift_reg;
//assign dc2na_full_bew     = (size_count >= (31-DELAY_ADEC)) | dram_rd_data_en_2db_nxt_1 | (dram_rd_data_en_2db&rmw_overwrite) | (RAW_hit_count_above_16 & eco_1000556_hit_count_chicken_en) | na2dc_raww_almost_full ; 
assign dc2na_full_bew     = ( (size_count + push_cnt_in_shift_reg  ) >= 31) | dram_rd_data_en_2db_nxt_1 | (dram_rd_data_en_2db&rmw_overwrite) | (RAW_hit_count_above_16 & eco_1000556_hit_count_chicken_en) | na2dc_raww_almost_full;
/*
always_comb begin
    //push_cnt_in_shift_reg= mc_rst ? '0:  ( ( (!rd_en & na2dc_txn_push) ? 1'b1 :1'b0) +  adec_txn_push[1] +  adec_txn_push[2] +  adec_txn_push[3] + adec_txn_push[4] + adec_txn_push_ff) ;
    //push_cnt_in_shift_reg= mc_rst ? '0:  ( adec_txn_push[0] +  adec_txn_push[1] +  adec_txn_push[2] +  adec_txn_push[3] + adec_txn_push[4] + adec_txn_push_ff) ;
    dc2na_full_bew     = ( (size_count + push_cnt_in_shift_reg  ) >= 31) | dram_rd_data_en_2db_nxt_1 | (dram_rd_data_en_2db&rmw_overwrite) | (RAW_hit_count_above_16 & eco_1000556_hit_count_chicken_en) | na2dc_raww_almost_full;
end
*/
//assign dc2na_full_llr     = (size_count >= (31-DELAY_ADEC)) | dram_rd_data_en_2db_nxt_1;
//assign dc2na_full_isochr  = (size_count >= (31-DELAY_ADEC)) | dram_rd_data_en_2db_nxt_1;
//assign dc2na_full_ber     = (size_count >= (31-DELAY_ADEC)) | dram_rd_data_en_2db_nxt_1;
//assign dc2na_full_isochw  = (size_count >= (31-DELAY_ADEC)) | dram_rd_data_en_2db_nxt_1;
assign dc2na_full_llr     = dc2na_full_bew;
assign dc2na_full_isochr  = dc2na_full_bew;
assign dc2na_full_ber     = dc2na_full_bew;
assign dc2na_full_isochw  = dc2na_full_bew;
assign tmr_update         = {na2dc_llr_tmr_update,na2dc_isr_tmr_update,na2dc_ber_tmr_update,na2dc_isw_tmr_update,na2dc_bew_tmr_update};
assign dm_rmw_flow        = (dram_width != 0) && dm_enable;
assign ndm_rmw_flow       = (dram_width == 0) || ((dram_width != 0) && !dm_enable);


//All the Current Assumptions and behavior on the TXNQ have changed based on DM flow. SN.
always @(*) begin//{
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   if((dram_rd_data_en_2db&rmw_overwrite) | rd_en) begin
      adec_txn_push[0]      = adec_txn_push[0]      ;
      adec_txn_type_read[0] = adec_txn_type_read[0] ;
      adec_wr_data[0]       = adec_wr_data[0]       ;
      adec_byte_en[0]       = adec_byte_en[0]       ;
      adec_row[0]           = adec_row[0]           ;
      adec_col[0]           = adec_col[0]           ;
      adec_bank[0]          = adec_bank[0]          ;
      adec_bg[0]            = adec_bg[0]            ;
      adec_lrank[0]         = adec_lrank[0]         ;
      adec_rank[0]          = adec_rank[0]          ;
      adec_rank_one_hot[0]  = adec_rank_one_hot[0]  ;
      adec_lrank_one_hot[0] = adec_lrank_one_hot[0] ;
      adec_read[0]          = adec_read[0]          ;
      adec_write[0]         = adec_write[0]         ;
      adec_partial[0]       = adec_partial[0]       ;
      adec_txn_align_strb[0] =adec_txn_align_strb[0];
      adec_rmw[0]            =adec_rmw[0]           ;
      adec_rmw_rd_done[0]    =adec_rmw_rd_done[0]   ;
      adec_wr_done[0]        =adec_wr_done[0]       ;
      adec_par_done[0]       =adec_par_done[0]      ;
      adec_qos_type[0]       =adec_qos_type[0]      ;
      adec_db_rd[0]          =adec_db_rd[0]         ;
      adec_timer[0]          =adec_timer[0]         ;
      adec_addr1[0]          =adec_addr1[0]         ;
    end

  else if (na2dc_txn_push[0] & (!(rd_en))) begin //{
       adec_addr[`TXN_ADDR_WIDTH-1:28]  = ((na2dc_txn_address[`TXN_ADDR_WIDTH-1:28]>= reg_adec2_high_mem_base) & reg_adec2[20])? 
                                          (na2dc_txn_address[`TXN_ADDR_WIDTH-1:28] - reg_adec3_high_mem_offset):
                                          (na2dc_txn_address[`TXN_ADDR_WIDTH-1:28] - reg_adec1_low_mem_offset);
       adec_addr[27:0]                  =  na2dc_txn_address[27:0];
      // adec_addr_eff    = (DQ_WIDTH == 64)  ? adec_addr[`TXN_ADDR_WIDTH-1:3] :
      //                    ((DQ_WIDTH == 32) ? adec_addr[`TXN_ADDR_WIDTH-1:2] : 
      //                                       adec_addr[`TXN_ADDR_WIDTH-1:1]);
       adec_addr_eff                    =  adec_addr;
       adec_row[0]                         =  {adec_addr_eff[ROW_18],adec_addr_eff[ROW_17],adec_addr_eff[ROW_16],adec_addr_eff[ROW_15],adec_addr_eff[ROW_14],adec_addr_eff[ROW_13],adec_addr_eff[ROW_12],
                                            adec_addr_eff[ROW_11],adec_addr_eff[ROW_10],adec_addr_eff[ROW_9],adec_addr_eff[ROW_8],adec_addr_eff[ROW_7],adec_addr_eff[ROW_6],
                                            adec_addr_eff[ROW_5],adec_addr_eff[ROW_4],adec_addr_eff[ROW_3],adec_addr_eff[ROW_2],adec_addr_eff[ROW_1],adec_addr_eff[ROW_0]};
       adec_col[0]                         =  {adec_addr_eff[COL_9],adec_addr_eff[COL_8],adec_addr_eff[COL_7],adec_addr_eff[COL_6],adec_addr_eff[COL_5],adec_addr_eff[COL_4],
                                            adec_addr_eff[COL_3],adec_addr_eff[COL_2],adec_addr_eff[COL_1],adec_addr_eff[COL_0]};
       adec_bank[0]                        =  {adec_addr_eff[BANK_1],adec_addr_eff[BANK_0]};
       adec_bg[0]                          =  {adec_addr_eff[GROUP_1],adec_addr_eff[GROUP_0]};
       adec_lrank[0]                       =  {adec_addr_eff[LRANK_2],adec_addr_eff[LRANK_1],adec_addr_eff[LRANK_0]};
       adec_rank[0]                        =  {adec_addr_eff[RANK_1],adec_addr_eff[RANK_0]};
       adec_rank_one_hot[0]                =  4'b0001 << adec_rank[0];
       adec_lrank_one_hot[0]               =  8'b0000_0001 << adec_lrank[0];
       adec_addr1[0]                       =  na2dc_txn_address;
       adec_qos_type[0]                    =  na2dc_txn_qos;
       adec_db_rd[0]                       =  (na2dc_txn_push[0] & na2dc_txn_type_read)  ? na2dc_txn_rrob_add: {`DC_RROB_PTR{1'b0}} ;
       adec_timer[0]                       =  na2dc_txn_timer;
       adec_txn_align_strb[0]              =  na2dc_txn_align_strb;
       adec_rmw_rd_done[0]                 =  'b0;
       adec_wr_done[0]                     =  'b0;
       adec_rmw[0]                         =  'b0;
       adec_partial[0]                     =  na2dc_txn_partial;
       adec_txn_type_read[0]               =  na2dc_txn_type_read;
       adec_wr_data[0]                     =  na2dc_wr_data;
       adec_byte_en[0]                     =  na2dc_byte_en;
       adec_read[0]                        = ((na2dc_txn_push[0] && ~na2dc_txn_type_read && ((ndm_rmw_flow && adec_partial[0]) ||  (dm_rmw_flow &&  adec_partial[0] && ecc_en && ~adec_txn_align_strb[0]))) || 
                                           (na2dc_txn_push[0] &&  na2dc_txn_type_read)) ;
       adec_write[0]                       =  (na2dc_txn_push[0] && ~na2dc_txn_type_read && (~adec_partial[0] || (dm_rmw_flow && adec_partial[0] && (~ecc_en || (ecc_en && adec_txn_align_strb[0])))));
       adec_par_done[0]                    =  (na2dc_txn_push[0] && ~na2dc_txn_type_read && ((ndm_rmw_flow && adec_partial[0]) || (dm_rmw_flow && adec_partial[0] && ecc_en && ~adec_txn_align_strb[0])));  
       adec_rmw[0]                         =  (na2dc_txn_push[0] && ~na2dc_txn_type_read && ((ndm_rmw_flow && adec_partial[0]) || (dm_rmw_flow && adec_partial[0] && ecc_en && ~adec_txn_align_strb[0])));
       if (adec_write[0] & adec_read[0]) begin
         $display("ERROR: DC TXNQ both read and write are being pushed in at the same time at %t",$time);
       end
       
       adec_txn_push[0] = na2dc_txn_push[0];
  end //}
  else if(!(dram_rd_data_en_2db&rmw_overwrite)) begin//{
       adec_txn_push[0]      = 'b0;
       adec_txn_type_read[0] = 'b0;
       adec_wr_data[0]       = 'd0;
       adec_byte_en[0]       = 'd0;
       adec_row[0]           = 'b0;             
       adec_col[0]           = 'b0;             
       adec_bank[0]          = 'b0;            
       adec_bg[0]            = 'b0;              
       adec_lrank[0]         = 'b0;           
       adec_rank[0]          = 'b0;            
       adec_rank_one_hot[0]  = 'b0;    
       adec_lrank_one_hot[0] = 'b0;   
       adec_read[0]          = 'b0;            
       adec_write[0]         = 'b0;           
       adec_partial[0]       = 'b0;         
       adec_txn_align_strb[0] = 'b0;  
       adec_rmw[0]            = 'b0;             
       adec_rmw_rd_done[0]    = 'b0;     
       adec_wr_done[0]        = 'b0;         
       adec_par_done[0]       = 'b0;        
       adec_qos_type[0]       = 'b0;        
       adec_db_rd[0]          = 'b0;           
       adec_timer[0]          = 'b0;    
       adec_addr1[0]          = 'b0;
    end //}
    else if((dram_rd_data_en_2db&rmw_overwrite)) begin
      adec_txn_push[0]      = adec_txn_push[0]      ;
      adec_txn_type_read[0] = adec_txn_type_read[0] ;
      adec_wr_data[0]       = adec_wr_data[0]       ;
      adec_byte_en[0]       = adec_byte_en[0]       ;
      adec_row[0]           = adec_row[0]           ;
      adec_col[0]           = adec_col[0]           ;
      adec_bank[0]          = adec_bank[0]          ;
      adec_bg[0]            = adec_bg[0]            ;
      adec_lrank[0]         = adec_lrank[0]         ;
      adec_rank[0]          = adec_rank[0]          ;
      adec_rank_one_hot[0]  = adec_rank_one_hot[0]  ;
      adec_lrank_one_hot[0] = adec_lrank_one_hot[0] ;
      adec_read[0]          = adec_read[0]          ;
      adec_write[0]         = adec_write[0]         ;
      adec_partial[0]       = adec_partial[0]       ;
      adec_txn_align_strb[0] =adec_txn_align_strb[0];
      adec_rmw[0]            =adec_rmw[0]           ;
      adec_rmw_rd_done[0]    =adec_rmw_rd_done[0]   ;
      adec_wr_done[0]        =adec_wr_done[0]       ;
      adec_par_done[0]       =adec_par_done[0]      ;
      adec_qos_type[0]       =adec_qos_type[0]      ;
      adec_db_rd[0]          =adec_db_rd[0]         ;
      adec_timer[0]          =adec_timer[0]         ;
      adec_addr1[0]          =adec_addr1[0]         ;
    end

end//}

always @(negedge mc_clk)begin
  rd_en = (dram_rd_data_en_2db_nxt&rmw_overwrite_nxt);
end
always @(posedge mc_clk)begin
  //push_cnt_in_shift_reg= mc_rst ? '0:  ( ( (!rd_en & na2dc_txn_push) ? 1'b1 :1'b0) +  adec_txn_push[1] +  adec_txn_push[2] +  adec_txn_push[3] + adec_txn_push[4] + adec_txn_push[5] + adec_txn_push[6] + adec_txn_push_ff) ;
  if (mc_rst) push_cnt_in_shift_reg ='0;
  else begin
    push_cnt_in_shift_reg ='0;
    for (int i=0; i<= DELAY_ADEC ; i++) begin
      push_cnt_in_shift_reg = push_cnt_in_shift_reg + ( (i==0) ? (( (!rd_en & na2dc_txn_push) ? 1'b1 :1'b0)) : adec_txn_push[i] );
    end
    push_cnt_in_shift_reg = push_cnt_in_shift_reg + adec_txn_push_ff;
  end
end
`D_FLOP_RST_SHFT(mc_clk,adec_txn_push         ,adec_txn_push_ff      ,mc_rst,0,!(rd_en),DELAY_ADEC);
//`D_FLOP_RST_SHFT(mc_clk,adec_addr_eff         ,adec_addr_eff_ff      ,mc_rst,0,
`D_FLOP_RST_SHFT(mc_clk,adec_addr1            ,adec_addr1_ff         ,mc_rst,0,!(rd_en),DELAY_ADEC);        
`D_FLOP_RST_SHFT(mc_clk,adec_txn_type_read    ,adec_txn_type_read_ff ,mc_rst,0,!(rd_en),DELAY_ADEC);           
`D_FLOP_RST_SHFT(mc_clk,adec_row              ,adec_row_ff           ,mc_rst,0,!(rd_en),DELAY_ADEC);             
`D_FLOP_RST_SHFT(mc_clk,adec_col              ,adec_col_ff           ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_bank             ,adec_bank_ff          ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_bg               ,adec_bg_ff            ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_lrank            ,adec_lrank_ff         ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_rank             ,adec_rank_ff          ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_rank_one_hot     ,adec_rank_one_hot_ff  ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_lrank_one_hot    ,adec_lrank_one_hot_ff ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_read             ,adec_read_ff          ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_write            ,adec_write_ff         ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_partial          ,adec_partial_ff       ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_txn_align_strb   ,adec_txn_align_strb_ff,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_rmw              ,adec_rmw_ff           ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_rmw_rd_done      ,adec_rmw_rd_done_ff   ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_wr_done          ,adec_wr_done_ff       ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_par_done         ,adec_par_done_ff      ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_qos_type         ,adec_qos_type_ff      ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_db_rd            ,adec_db_rd_ff         ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_timer            ,adec_timer_ff         ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_wr_data          ,adec_wr_data_ff       ,mc_rst,0,!(rd_en),DELAY_ADEC);  
`D_FLOP_RST_SHFT(mc_clk,adec_byte_en          ,adec_byte_en_ff       ,mc_rst,0,!(rd_en),DELAY_ADEC);  

/////////////////////////////////////////////////////
always @(posedge mc_clk) begin
  if(mc_rst) begin
    push_count = 0;
  end  
  else begin
    if(na2dc_txn_push[0]) push_count++;
  end
end
always @(posedge mc_clk) begin
  if(mc_rst) begin
    push_count_ff = 0;
  end  
  else begin
    if(adec_txn_push_ff) push_count_ff++;
  end
end

final begin
  if(push_count != push_count_ff) begin
    $display("Error: the number of pushes didnt match push_count=%d,push_count_ff=%d",push_count,push_count_ff);
  end
end


/////////////////////////////////////////////////////

`ifdef INCA 
always @(*) begin
`else
always @(posedge mc_clk) begin
`endif

if (farb_act_won ) begin//{ 
  if(farb_act_slot0)
   PAGE_TABLE[{farb_rank_slot0,farb_lrank_slot0,farb_bg_slot0,farb_bank_slot0}][ROW_WIDTH:1] = farb_addr_slot0;
  if(farb_act_slot1)
   PAGE_TABLE[{farb_rank_slot1,farb_lrank_slot1,farb_bg_slot1,farb_bank_slot1}][ROW_WIDTH:1] = farb_addr_slot1;
end//}

if (farb_act_won)begin//{
  if(farb_act_slot0)
   PAGE_TABLE[{farb_rank_slot0,farb_lrank_slot0,farb_bg_slot0,farb_bank_slot0}][0] = farb_act_slot0;
  if(farb_act_slot1)
   PAGE_TABLE[{farb_rank_slot1,farb_lrank_slot1,farb_bg_slot1,farb_bank_slot1}][0] = farb_act_slot1;
end//}
if (farb_pre_won)begin//{
  if(farb_pre_slot0)
   PAGE_TABLE[{farb_rank_slot0,farb_lrank_slot0,farb_bg_slot0,farb_bank_slot0}][0] = !farb_pre_slot0;
  if(farb_pre_slot1)
   PAGE_TABLE[{farb_rank_slot1,farb_lrank_slot1,farb_bg_slot1,farb_bank_slot1}][0] = !farb_pre_slot1;
end//}
if (farb_pre_all_won)begin//{
  if(farb_pre_all_slot0)begin//{
      for(int j = 0; j < NUM_OF_BGS; j++)begin//{
        for(int i = 0; i < NUM_OF_BANKS; i++)begin//{
        pre_all_req_bg = j;
        pre_all_req_ba = i;
         PAGE_TABLE[{farb_rank_slot0,farb_lrank_slot0,pre_all_req_bg,pre_all_req_ba}][0] = !farb_pre_all_slot0;
        end//}
      end//}
  end//}
  if(farb_pre_all_slot1)begin//{
      for(int j = 0; j < NUM_OF_BGS; j++)begin//{
        for(int i = 0; i < NUM_OF_BANKS; i++)begin//{
        pre_all_req_bg = j;
        pre_all_req_ba = i;
         PAGE_TABLE[{farb_rank_slot1,farb_lrank_slot1,pre_all_req_bg,pre_all_req_ba}][0] = !farb_pre_all_slot1;
        end//}
      end//}
  end//}
end//}

//Periodic Read request raising, if DC in read idle state for Periodic_rd_interval of time
//PERIOD_RD  = per_rd_en ? ((!initDone | periodic_rd_1 | (farb_rd_won_slot0 && !per_rd_array[farb_id_slot0]) | (farb_rd_won_slot1 && !per_rd_array[farb_id_slot1])  ) ?  dram_clock_count :PERIOD_RD):'d0 ;
//periodic_rd_1 = ( per_rd_en && !adec_txn_push_ff ) ?  ((dram_clock_count - PERIOD_RD) > Periodic_rd_interval): 0;
PERIOD_RD  = per_rd_en ? ((!initDone | periodic_rd_1 | (farb_rd_won_slot0 && !per_rd_array[farb_id_slot0]) | (farb_rd_won_slot1 && !per_rd_array[farb_id_slot1])  ) ? mc_clock_count :PERIOD_RD):'d0 ;
periodic_rd_1 = ( per_rd_en && !adec_txn_push_ff && (size_count <=31) ) ?  ((mc_clock_count - PERIOD_RD) > Periodic_rd_interval): 0;//CR-1088036: Periodic_rd_interval is loaded in mc clocks and wait till !txnq_full. TODO: is it ok to wait till  !adec_txn_push_ff ?

if(farb_ref_won )begin//{
  if(farb_ref_slot0)begin//{
    TREFI[0] = dram_clock_count -1;//$time-tCK;
    trefi_d = TREFI[0] - TREFI_PEND[0];
    TRFC[farb_rank_slot0][farb_lrank_slot0] = dram_clock_count - 1;//$time-tCK;
   end//}
  if(farb_ref_slot1)begin//{
    TREFI[0] = dram_clock_count;//$time;
    trefi_d = TREFI[0] - TREFI_PEND[0];
    TRFC[farb_rank_slot1][farb_lrank_slot1] = dram_clock_count;
   end//}
end//}
if(farb_pre_all_won)begin//{
  if(farb_pre_all_slot0)begin//{
    for(int j = 0;j < NUM_OF_BGS ; j++)begin //{
      for(int i = 0;i< NUM_OF_BANKS ; i++)begin //{
        TRP[farb_rank_slot0][farb_lrank_slot0][j][i] = dram_clock_count - 1;//$time-tCK;
      end //}
    end //}
  end //}
  if(farb_pre_all_slot1)begin//{
    for(int k = 0;k < NUM_OF_LRANKS ; k++)begin //{
      for(int j = 0;j < NUM_OF_BGS ; j++)begin //{
        for(int i = 0;i< NUM_OF_BANKS ; i++)begin //{
          TRP[farb_rank_slot1][farb_lrank_slot1][j][i] = dram_clock_count ;//$time;
        end //}
      end //}
    end //}
  end //}
end //}
 ref_req_pend       = initDone ? ((dram_clock_count - TREFI[0]) >= (trefi - trefi_d)):'b0; 
 ref_req_pend_d     = initDone ? ((dram_clock_count - (TREFI[0]-2)) >= (trefi - trefi_d)):'b0; 
 ref_req_done       = initDone ? ((dram_clock_count - TRFC[ref_req_r][ref_req_lr]) >= trfc_slr):'b0; 
 ref_req_one_hot_lr = (NUM_OF_LRANKS == 1)?'b1:8'b0000_0001 << ref_req_lr; 
 ref_req_one_hot_r  = (NUM_OF_RANKS == 1)?'b1:4'b0001 << ref_req_r;

  if(( ~ref_req_pend &  ref_req_pend_d)) begin
   TREFI_PEND[0] = dram_clock_count;
 end

//if(na2dc_txn_push[0] == 1 )begin//{
if(adec_txn_push_ff == 1)begin//{
  ref_status = ((ref_req_pend | ~ref_req_done) && ({ref_req_one_hot_lr,ref_req_one_hot_r} == {adec_lrank_one_hot_ff,adec_rank_one_hot_ff}));
if(PAGE_TABLE[{adec_rank_ff,adec_lrank_ff,adec_bg_ff,adec_bank_ff}][0])begin//{
  if(adec_row_ff == PAGE_TABLE[{adec_rank_ff,adec_lrank_ff,adec_bg_ff,adec_bank_ff}][ROW_WIDTH:1] )
    page_status = 2'b01;//Page hit
  else 
    page_status = 2'b00;//Page Miss
end//}
else
  page_status = 2'b10;//Page Closed
end//}

end

always @(posedge mc_clk) begin
dc2na_txnq_pop = 0;
// 1 deallocating reads
// 1a should not be partial write hit by a read
if (((farb_cas_slot0 && farb_rd_won_slot0)) && TXNQ[farb_id_slot0][`TXN_READ]       && TXNQ[farb_id_slot0][`TXN_VAL]       && !TXNQ[farb_id_slot0][`TXN_PRW]) begin//{
  TXNQ[farb_id_slot0][`TXN_READ]       = 1'b0;
end//}
if (((farb_cas_slot1 && farb_rd_won_slot1)) && TXNQ[farb_id_slot1][`TXN_READ] && TXNQ[farb_id_slot1][`TXN_VAL] && !TXNQ[farb_id_slot1][`TXN_PRW]) begin//{
  TXNQ[farb_id_slot1][`TXN_READ] = 1'b0;
end//}
// 1b once the read data came from dram deallocate the location completely
// 1c reacieved bypass data 
if (bypass_data_en) begin//{
    by_count                                = TXNQ[bypass_wr_location][`TXN_BYP_CNTR];
    TXNQ[bypass_wr_location][`TXN_BYP_CNTR] = by_count - 1'b1;

// the write associated with the bypass read if the byp_cntr is 0 can be cleared
    if ((TXNQ[bypass_wr_location][`TXN_BYP_CNTR] == 0) &&  TXNQ[bypass_wr_location][`TXN_VAL]   && !TXNQ[bypass_wr_location][`TXN_WRITE] && TXNQ[bypass_wr_location][`TXN_WRITE_DONE] 
                                                       && ((!TXNQ[bypass_wr_location][`TXN_PRW] && !TXNQ[bypass_wr_location][`TXN_PARTIAL]) ||
                                                           (TXNQ[bypass_wr_location][`TXN_PRW]  &&  TXNQ[bypass_wr_location][`TXN_PARTIAL]  && TXNQ[bypass_wr_location][`TXN_PWR_DONE] && TXNQ[bypass_wr_location][`TXN_RMW_RD_DONE]))) begin //{
      TXNQ[bypass_wr_location]             = {`TXNQ_WIDTH{1'b0}};
      dc2na_txnq_pop                       = dc2na_txnq_pop+1;  // Txnq entry invalidated, hence pop asserting
      TXNQ_T[bypass_wr_location]           = 'd0;
      TXNQ_TIMER[bypass_wr_location]       = 'd0;
      wdb_valid_reg[bypass_wr_location]    = 1'b0;
      txnq_wr_cas[bypass_wr_location]      = 'b0;  
    end //}

end//}


// Full write 
  if (farb_cas_slot0 && farb_wr_won_slot0 &&  TXNQ[farb_id_slot0][`TXN_VAL]  &&  TXNQ[farb_id_slot0][`TXN_WRITE] && 
     !TXNQ[farb_id_slot0][`TXN_WRITE_DONE] && !TXNQ[farb_id_slot0][`TXN_PRW]  && !TXNQ[farb_id_slot0][`TXN_PARTIAL]) begin //{
  TXNQ[farb_id_slot0][`TXN_WRITE]          = 1'b0;
  TXNQ[farb_id_slot0][`TXN_WRITE_DONE]     = 1'b0;
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("1 farb_id_slot0 = %h, write @%t slot 0",farb_id_slot0,$time),DBG);
end //}


  if (((farb_cas_slot1 & farb_wr_won_slot1)) && TXNQ[farb_id_slot1][`TXN_VAL] && TXNQ[farb_id_slot1][`TXN_WRITE] && 
        !TXNQ[farb_id_slot1][`TXN_WRITE_DONE] && !TXNQ[farb_id_slot1][`TXN_PRW]&& !TXNQ[farb_id_slot1][`TXN_PARTIAL] ) begin //{
  TXNQ[farb_id_slot1][`TXN_WRITE]      = 1'b0;
  TXNQ[farb_id_slot1][`TXN_WRITE_DONE] = 1'b0;
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("2 farb_id_slot0 = %h, write @%t slot 1",farb_id_slot0,$time),DBG);
end //}


// partial write not a rmw write ie dm is enabled
if (((farb_cas_slot0 & farb_wr_won_slot0)) &&  TXNQ[farb_id_slot0][`TXN_VAL] &&  TXNQ[farb_id_slot0][`TXN_WRITE]      &&  TXNQ[farb_id_slot0][`TXN_PARTIAL]  
                                           && !TXNQ[farb_id_slot0][`TXN_PRW] && !TXNQ[farb_id_slot0][`TXN_WRITE_DONE] && (TXNQ[farb_id_slot0][`TXN_BYP_CNTR] == 0)) begin //{
  TXNQ[farb_id_slot0][`TXN_WRITE]            = 1'b0;
  TXNQ[farb_id_slot0][`TXN_WRITE_DONE]       = 1'b0;
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("4 farb_id_slot0 = %h, write @%t slot 0",farb_id_slot0,$time),DBG);
end //}
if (((farb_cas_slot1 & farb_wr_won_slot1)) &&  TXNQ[farb_id_slot1][`TXN_VAL] &&  TXNQ[farb_id_slot1][`TXN_WRITE]       &&  TXNQ[farb_id_slot1][`TXN_PARTIAL]
                                           && !TXNQ[farb_id_slot1][`TXN_PRW] && !TXNQ[farb_id_slot1][`TXN_WRITE_DONE]  && (TXNQ[farb_id_slot1][`TXN_BYP_CNTR] == 0)) begin //{
  TXNQ[farb_id_slot1][`TXN_WRITE]      = 1'b0;
  TXNQ[farb_id_slot1][`TXN_WRITE_DONE] = 1'b0;
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("5 farb_id_slot0 = %h, write @%t slot 1",farb_id_slot0,$time),DBG);
end //}

//partial write hit by read (rmw write)
if (((farb_cas_slot0 && farb_wr_won_slot0)) &&  TXNQ[farb_id_slot0][`TXN_VAL]        &&  TXNQ[farb_id_slot0][`TXN_PRW] 
                                            &&  TXNQ[farb_id_slot0][`TXN_WRITE]      &&  TXNQ[farb_id_slot0][`TXN_PARTIAL]     && !TXNQ[farb_id_slot0][`TXN_PWR_DONE] 
                                            && !TXNQ[farb_id_slot0][`TXN_WRITE_DONE] && !TXNQ[farb_id_slot0][`TXN_RMW_RD_DONE] && (TXNQ[farb_id_slot0][`TXN_BYP_CNTR] != 0)) begin //{
  TXNQ[farb_id_slot0][`TXN_WRITE]       = 1'b0;
end //}

if (((farb_cas_slot1 && farb_wr_won_slot1)) &&  TXNQ[farb_id_slot1][`TXN_VAL]        &&  TXNQ[farb_id_slot1][`TXN_PRW] 
                                            &&  TXNQ[farb_id_slot1][`TXN_WRITE]      &&  TXNQ[farb_id_slot1][`TXN_PARTIAL]     && !TXNQ[farb_id_slot1][`TXN_PWR_DONE]
                                            && !TXNQ[farb_id_slot1][`TXN_WRITE_DONE] && !TXNQ[farb_id_slot1][`TXN_RMW_RD_DONE] && (TXNQ[farb_id_slot1][`TXN_BYP_CNTR] != 0)) begin //{
  TXNQ[farb_id_slot1][`TXN_WRITE] = 1'b0;
end //}

// In 2 scenarios this can happen
// 1. a partial write got converted to read for ndm flow
// 2. a partial write in dm flow but got hit by a read 
if ((farb_cas_slot0 & farb_rd_won_slot0) && TXNQ[farb_id_slot0][`TXN_VAL]          && TXNQ[farb_id_slot0][`TXN_PRW]      && TXNQ[farb_id_slot0][`TXN_READ]  
                                         && !TXNQ[farb_id_slot0][`TXN_RMW_RD_DONE] && TXNQ[farb_id_slot0][`TXN_PWR_DONE] && TXNQ[farb_id_slot0][`TXN_PARTIAL]) begin //{
  TXNQ[farb_id_slot0][`TXN_READ]       = 1'b0;
end //}

if ((farb_cas_slot1 & farb_rd_won_slot1) && TXNQ[farb_id_slot1][`TXN_VAL]          && TXNQ[farb_id_slot1][`TXN_PRW]      && TXNQ[farb_id_slot1][`TXN_READ]  
                                         && !TXNQ[farb_id_slot1][`TXN_RMW_RD_DONE] && TXNQ[farb_id_slot1][`TXN_PWR_DONE] && TXNQ[farb_id_slot1][`TXN_PARTIAL]) begin //{
  TXNQ[farb_id_slot1][`TXN_READ] = 1'b0;
end //}

if (dram_rd_data_en_2db && TXNQ[dram_rd_txnq_loc_2db][`TXN_VAL]      && TXNQ[dram_rd_txnq_loc_2db][`TXN_PRW]     && !TXNQ[dram_rd_txnq_loc_2db][`TXN_RMW_RD_DONE] 
                        && TXNQ[dram_rd_txnq_loc_2db][`TXN_PWR_DONE] && TXNQ[dram_rd_txnq_loc_2db][`TXN_PARTIAL])  begin
  TXNQ[dram_rd_txnq_loc_2db][`TXN_RMW_RD_DONE] = 1'b1;
//  TXNQ[dram_rd_txnq_loc_2db][`TXN_WRITE]       = 1'b1;
end

if ((farb_cas_slot0 & farb_wr_won_slot0) && TXNQ[farb_id_slot0][`TXN_VAL]         && TXNQ[farb_id_slot0][`TXN_PRW]         && TXNQ[farb_id_slot0][`TXN_WRITE]  
                                         && !TXNQ[farb_id_slot0][`TXN_WRITE_DONE] && TXNQ[farb_id_slot0][`TXN_RMW_RD_DONE] && TXNQ[farb_id_slot0][`TXN_PWR_DONE] && TXNQ[farb_id_slot0][`TXN_PARTIAL]) begin //{
  TXNQ[farb_id_slot0][`TXN_WRITE]      = 1'b0;
  TXNQ[farb_id_slot0][`TXN_WRITE_DONE] = 1'b0;
end //}


if ((farb_cas_slot1 & farb_wr_won_slot1) && TXNQ[farb_id_slot1][`TXN_VAL]         && TXNQ[farb_id_slot1][`TXN_PRW]      && TXNQ[farb_id_slot1][`TXN_WRITE]   
                                         && !TXNQ[farb_id_slot1][`TXN_WRITE_DONE] && TXNQ[farb_id_slot1][`TXN_PWR_DONE] && TXNQ[farb_id_slot1][`TXN_PARTIAL] && TXNQ[farb_id_slot1][`TXN_RMW_RD_DONE]) begin //{
  TXNQ[farb_id_slot1][`TXN_WRITE]      = 1'b0;
  TXNQ[farb_id_slot1][`TXN_WRITE_DONE] = 1'b0;
end //}



for(int i = 0; i<32 ; i++) begin
  if(RMW_FIFO_DEALLOC[i] > 'd0) begin
  if(((mc_clock_count - RMW_FIFO_DEALLOC[i]) > (reg_retry_0_rmw_fifo_dealloc_period)) && TXNQ[i][`TXN_VAL] && TXNQ[i][`TXN_PRW]  && TXNQ[i][`TXN_PWR_DONE] && TXNQ[i][`TXN_PARTIAL]) begin
    //TXNQ[i][`TXN_RMW_RD_DONE] = 1'b1;
    TXNQ[i][`TXN_WRITE]       = 1'b1;
    if(wr_cas_count[i] == 0) begin wr_cas_count[i]     = wr_cas_count[i] + 1; end
    RMW_FIFO_DEALLOC[i]      = 'd0;
  end
  end
end                        

for(int i =0;i<32;i++)begin//{
  if(RETRY_FIFO_DEALLOC[i] > 'd0) begin
  if (((mc_clock_count - RETRY_FIFO_DEALLOC[i]) >= ((reg_retry_1_retry_fifo_dealloc_period)))&& TXNQ[i][`TXN_VAL] && !TXNQ[i][`TXN_PRW]) begin
    TXNQ[i]           = {`TXNQ_WIDTH{1'b0}};
    if ( !per_rd_array[i]) dc2na_txnq_pop    = dc2na_txnq_pop+1;  // Txnq entry invalidated, hence pop asserting for non periodic reads
    else per_rd_array[i] = 1'b0;
    TXNQ_T[i]         = 'd0;
    TXNQ_TIMER[i]     = 'd0;
    RETRY_FIFO_DEALLOC[i] = 'd0;
    txnq_rd_cas[i]    = 'b0; 
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("1r farb_id_slot0 = %h, all zeros @%t",farb_id_slot0,$time),DBG);
    ->read_location_updated;
  end
  else if (TXNQ[i][`TXN_PRW]) begin
    RETRY_FIFO_DEALLOC[i] = 'd0;
  end
  end
end //}

for(int i =0;i<32;i++)begin//{
  if(WR_FIFO_DEALLOC[i].size() > 'd0) begin
    if (wr_cas_count[i]==1) begin//{
      // full write without any bypass reads normal deallocation
      // partial write without any bypass reads normal deallocation
      if (((mc_clock_count - WR_FIFO_DEALLOC[i][0]) >= (reg_retry_1_wr_fifo_dealloc_period)) && TXNQ[i][`TXN_VAL] &&
      ((TXNQ[i][`TXN_PRW] && TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE] && TXNQ[i][`TXN_RMW_RD_DONE] && TXNQ[i][`TXN_PWR_DONE]) || //wont enter the first if
      (!TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE]) || // full write 
      (TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_WRITE_DONE])))  begin // {partial write
      //$display("mc_clock_count=%d,WR_FIFO_DEALLOC[%d]=%d ",mc_clock_count,i,WR_FIFO_DEALLOC[i]);
        if (TXNQ[i][`TXN_BYP_CNTR] == 0) begin //{ //no dependent reads
          TXNQ[i]             = {`TXNQ_WIDTH{1'b0}};
          dc2na_txnq_pop      = dc2na_txnq_pop+1;  // Txnq entry invalidated, hence pop asserting
          TXNQ_T[i]           = 'd0;
          TXNQ_TIMER[i]       = 'd0;
          wdb_valid_reg[i]    = 1'b0;
          WR_FIFO_DEALLOC[i].pop_front();
          txnq_wr_cas[i]      = 'b0;   
          wr_cas_count[i]     = wr_cas_count[i] - 1;
        end //}
        else if (TXNQ[i][`TXN_BYP_CNTR] != 0 && 
          (TXNQ[i][`TXN_PRW] && TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE] && TXNQ[i][`TXN_RMW_RD_DONE] && TXNQ[i][`TXN_PWR_DONE]) || 
          (!TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE])) begin //{ //full write hit by a write
          TXNQ[i][`TXN_WRITE_DONE] = 1'b1; 
          wr_cas_count[i]     = wr_cas_count[i] - 1;
          WR_FIFO_DEALLOC[i].pop_front();//    = 'd0;  //Corresponding write is getting deallocated hence making it to 0
        end //}
      end //}
      //partial write hit by a read after the wr_cas was send (it got converted to rmw) and the rmw read is not done yet 
      if(((mc_clock_count - WR_FIFO_DEALLOC[i][0]) >= (reg_retry_1_wr_fifo_dealloc_period-1)) && TXNQ[i][`TXN_VAL] && TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_WRITE]          && TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_PWR_DONE] && !TXNQ[i][`TXN_RMW_RD_DONE] && !TXNQ[i][`TXN_WRITE_DONE] && (TXNQ[i][`TXN_BYP_CNTR] != 0))begin//{
        TXNQ[i][`TXN_PWR_DONE]     = 1'b1;
        TXNQ[i][`TXN_READ]         = 1'b1;
        WR_FIFO_DEALLOC[i].pop_front();//         = 'd0;
        wr_cas_count[i]     = wr_cas_count[i] - 1;
      end //}
    end//}
    else if (wr_cas_count[i] > 1) begin //{
      if (((mc_clock_count - WR_FIFO_DEALLOC[i][0]) >= (reg_retry_1_wr_fifo_dealloc_period))&& ((adec_txn_push[DELAY_ADEC] && adec_txn_type_read[DELAY_ADEC]) ||~adec_txn_push[DELAY_ADEC]) && 
      TXNQ[i][`TXN_VAL] &&
      ((TXNQ[i][`TXN_PRW] && TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE] && TXNQ[i][`TXN_RMW_RD_DONE] && TXNQ[i][`TXN_PWR_DONE]) || 
      (!TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE]) || 
      (TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_WRITE_DONE])))  begin //{
        if (TXNQ[i][`TXN_BYP_CNTR] == 0) begin //{
          wr_cas_count[i]     = wr_cas_count[i] - 1;
          WR_FIFO_DEALLOC[i].pop_front();//         = 'd0;
        end //}
        else if(TXNQ[i][`TXN_BYP_CNTR] != 0 && 
        (TXNQ[i][`TXN_PRW] && TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE] && TXNQ[i][`TXN_RMW_RD_DONE] && TXNQ[i][`TXN_PWR_DONE]) ||
        (!TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_WRITE_DONE])) begin //{
           wr_cas_count[i]     = wr_cas_count[i] - 1;
           WR_FIFO_DEALLOC[i].pop_front();//         = 'd0;
         end//}
       end//}
       if(((mc_clock_count - WR_FIFO_DEALLOC[i][0]) >= (reg_retry_1_wr_fifo_dealloc_period-1)) && TXNQ[i][`TXN_VAL] && TXNQ[i][`TXN_PRW] && !TXNQ[i][`TXN_WRITE]          && TXNQ[i][`TXN_PARTIAL] && !TXNQ[i][`TXN_PWR_DONE] && !TXNQ[i][`TXN_RMW_RD_DONE] && !TXNQ[i][`TXN_WRITE_DONE] && (TXNQ[i][`TXN_BYP_CNTR]!= 0))begin//{
        WR_FIFO_DEALLOC[i].pop_front();//         = 'd0;
        wr_cas_count[i]     = wr_cas_count[i] - 1;
       end //}
    end //}
  end
end//}


  for(int i =0;i<32;i++)begin//{
   TXNQ[i][`TXN_REF_ZQ_STATUS] = ((ref_req_pend == 1) && (TXNQ[i][`TXN_RANK] == ref_req_r) && (TXNQ[i][`TXN_LRANK] == ref_req_lr))?1'b1:1'b0;
   if(PAGE_TABLE[TXNQ[i][`PT_RANGE]][0])begin//{
     if(TXNQ[i][ROW_WIDTH+RANK_WIDTH+LRANK_WIDTH+BANK_GROUP_WIDTH+BANK_WIDTH+`TXN_CNTL-1:RANK_WIDTH+LRANK_WIDTH+BANK_GROUP_WIDTH+BANK_WIDTH+`TXN_CNTL] == PAGE_TABLE[TXNQ[i][`PT_RANGE]][ROW_WIDTH:1]) begin //{
      TXNQ[i][`TXN_PG_STS] = 2'b01;//Page hit
      `ifdef NA_PERF_MONITOR_PRINTS_EN   // Perf_Monitor_Prints
          if(!TXNQ[i][`TXN_PRW]  && TXNQ[i][`TXN_READ]) begin 
            $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , TXNQ_LOCA : %d , Event : %s_PAGE_HIT ,  %t",TXNQ[i][`TXN_RDB],i,qos_name(TXNQ[i][`TXN_QOS]) , $time );
            end
      `endif
      end//}
     else
      TXNQ[i][`TXN_PG_STS] = 2'b00;//Page Miss
   end //} 
   else
    TXNQ[i][`TXN_PG_STS] = 2'b10;//Page Closed
  end//}

//Address CAM

    valid_req_gen    = 1'b0;
    read_hit_read    = 1'b0;
    read_hit_write   = 1'b0;
    write_hit_read   = 1'b0;
    read_wrap_det    = 1'b0;
    waw_overwrite  = 1'b0;
    write_hit_write  = 1'b0;
    write_index     = 'd0;
    cur_bypass_cntr = 'd0;
    bypass_cntr     = 'd0;
    bypass_wdb      = 'd0;
    bypass          = 'd0;
    waw_wdb_addr    = 'd0;
    waw_txnq_loc    = 'd0;
    cur_addr        = 'd0;
    db_req          = 'b0;
    gnt             = 'b0;
    wdb_req_int.app_req = 'd0; 
    wdb_req_int.app_overwrite = 'd0; 
    wdb_req_int.app_buf_ptr = 'd0; 
    wdb_req_int.app_data = 'd0; 
    adec_db_ff           = 'd0; 
    dc2na_read_wrap_det      = 1'b0;
    dc2na_read_wrap_rrob_ptr = 'd0;
    txnq_loca    = 'd0;
    prev_txnq_loca = 'd0;
    wdb_buf_ptr = {`MC_BUFADDR_WIDTH{1'b0}};


if(adec_txn_push_ff)begin//{
    if (adec_txn_type_read_ff) begin //{
      for(int i =0;i<32;i++)begin//{
        cur_addr = {adec_col_ff[COL_WIDTH-1:BLN_COL],adec_row_ff,adec_rank_ff,adec_lrank_ff,adec_bg_ff,adec_bank_ff};
        txn_addr = {TXNQ[i][`TXN_COL_SAFE],TXNQ[i][`ADDR_RANGE_SAFE]};
        if (TXNQ[i][`TXN_VAL] & (cur_addr == txn_addr)) begin //{
          if (TXNQ[i][`TXN_WRITE] | TXNQ[i][`TXN_PRW]) begin //{ //read to the same addr as of write or a partial write who already got hit by a read
            read_hit_write   = 1'b1;
            write_index      = i;
            cur_bypass_cntr  = TXNQ[write_index][`TXN_BYP_CNTR];
            TXNQ[write_index][`TXN_BYP_CNTR] = cur_bypass_cntr + 'd1;
            
            if (TXNQ[write_index][`TXN_PARTIAL] && !TXNQ[write_index][`TXN_PRW]) begin
              TXNQ[write_index][`TXN_PRW] = 1'b1;
            end

            if (|adec_col_ff[BLN_COL-1:0]) begin 
              read_wrap_det = 1'b1;//read wrap needs to be propagated to NA
            end

            bypass_wdb       = write_index;
            bypass           = 1'b1; //enable bypass
            valid_req_gen    = 1'b1; //needed when pushing into txnq
            page_status      = 2'b01;
            break;
          end //}
          else if (TXNQ[i][`TXN_READ]) begin //{
            read_hit_read = 1'b1;
            valid_req_gen = 1'b1;//needed when pushing into txnq
            continue; 
          end //}
        end //}
      end //}
    end //}
    else begin //{
      for(int i =0;i<32;i++)begin//{
        cur_addr = {adec_col_ff[COL_WIDTH-1:BLN_COL],adec_row_ff,adec_rank_ff,adec_lrank_ff,adec_bg_ff,adec_bank_ff}; 
        txn_addr = {TXNQ[i][`TXN_COL_SAFE],TXNQ[i][`ADDR_RANGE_SAFE]};
        if (TXNQ[i][`TXN_VAL] & (cur_addr == txn_addr)) begin //{
          if(txnq_wr_cas[i]) begin //{
            write_hit_write = 1'b1;
            waw_wdb_addr    = TXNQ[i][`TXN_WDB];
            waw_overwrite   = 1'b1;
            valid_req_gen   = 1'b1;
            waw_txnq_loc    = i;
          end //}
          if (TXNQ[i][`TXN_WRITE] | TXNQ[i][`TXN_WRITE_DONE] | TXNQ[i][`TXN_PRW]) begin //{ //wr to same to aadr as a write,or a read hit partial write
            //partial write ndm flow or hit by a read since read needs to be done inboth the scenarios 
            //write_done means bypass read is present and the partial write's rmw_rd_phase is done
            if (TXNQ[waw_txnq_loc][`TXN_PRW] & TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] & TXNQ[waw_txnq_loc][`TXN_RMW_RD_DONE] & (!block_wr_cas_incr_id[waw_txnq_loc]) & (!((farb_wr_won_slot0 && (waw_txnq_loc == farb_id_slot0))  || (farb_wr_won_slot1 && (waw_txnq_loc == farb_id_slot1))))   ) begin 
              TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] = 1'b0;
              TXNQ[waw_txnq_loc][`TXN_WRITE]      = 1'b1;
              wr_cas_count[i] = wr_cas_count[i] +1;
            end
            //partial write dm flow hit by a read and write_data has gone to DRAM
            else if (!TXNQ[waw_txnq_loc][`TXN_PRW] & TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] & (!block_wr_cas_incr_id[waw_txnq_loc] ) &  (!( (farb_wr_won_slot0 && (waw_txnq_loc==farb_id_slot0))  || (farb_wr_won_slot1 && (waw_txnq_loc==farb_id_slot1))))  ) begin
              TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] = 1'b0;
              TXNQ[waw_txnq_loc][`TXN_WRITE]      = 1'b1;
              wr_cas_count[i] = wr_cas_count[i] +1;
            end
            //in ndm flow for partial write pwr_done will be set to 1
            //in dm flow after sending the wr_cas a read hits it then we wait till the wr_data is sent to the phy
            else if(TXNQ[waw_txnq_loc][`TXN_PRW] & !TXNQ[waw_txnq_loc][`TXN_WRITE] & !TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] & !TXNQ[waw_txnq_loc][`TXN_PWR_DONE]                      & !TXNQ[waw_txnq_loc][`TXN_READ] & !TXNQ[waw_txnq_loc][`TXN_RMW_RD_DONE] & ( !block_wr_cas_incr_id[waw_txnq_loc] ) & (!( (farb_wr_won_slot0 && (waw_txnq_loc==farb_id_slot0))  || (farb_wr_won_slot1 && (waw_txnq_loc==farb_id_slot1))))  )begin
              TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] = 1'b0;
              TXNQ[waw_txnq_loc][`TXN_WRITE]      = 1'b1;
              wr_cas_count[i] = wr_cas_count[i] +1;
            end
            //
            else if (TXNQ[waw_txnq_loc][`TXN_PRW] & !TXNQ[waw_txnq_loc][`TXN_WRITE] & !TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] & TXNQ[waw_txnq_loc][`TXN_PWR_DONE] &                     !TXNQ[waw_txnq_loc][`TXN_READ] & TXNQ[waw_txnq_loc][`TXN_RMW_RD_DONE]  &  ( !block_wr_cas_incr_id[waw_txnq_loc]  ) & (RMW_FIFO_DEALLOC[waw_txnq_loc]==0)   &  (!( (farb_wr_won_slot0 && (waw_txnq_loc==farb_id_slot0))  || (farb_wr_won_slot1 && (waw_txnq_loc==farb_id_slot1)))) )begin
              TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] = 1'b0;
              TXNQ[waw_txnq_loc][`TXN_WRITE]      = 1'b1;
              TXNQ[waw_txnq_loc][`TXN_READ]       = 1'b0; 
              wr_cas_count[i] = wr_cas_count[i] +1;
            end
            else if (TXNQ[waw_txnq_loc][`TXN_PRW] & !TXNQ[waw_txnq_loc][`TXN_WRITE] & !TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] & TXNQ[waw_txnq_loc][`TXN_RMW_RD_DONE]  & ( !block_wr_cas_incr_id[waw_txnq_loc] & (RMW_FIFO_DEALLOC[waw_txnq_loc]==0) )  &  (!( (farb_wr_won_slot0 && (waw_txnq_loc==farb_id_slot0))  || (farb_wr_won_slot1 && (waw_txnq_loc==farb_id_slot1)))))begin
              TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] = 1'b0;
              TXNQ[waw_txnq_loc][`TXN_WRITE]      = 1'b1;
              wr_cas_count[i] = wr_cas_count[i] +1;
            end
            break;
          end //}
          
          else if(txnq_wr_cas[i] && (!TXNQ[i][`TXN_WRITE]) & ( !block_wr_cas_incr_id[waw_txnq_loc] ) &  (!( (farb_wr_won_slot0 && (waw_txnq_loc==farb_id_slot0))  || (farb_wr_won_slot1 && (waw_txnq_loc==farb_id_slot1))))) begin //{
            TXNQ[waw_txnq_loc][`TXN_WRITE_DONE] = 1'b0;
            TXNQ[waw_txnq_loc][`TXN_WRITE]      = 1'b1;
            wr_cas_count[i] = wr_cas_count[i] +1;
            break;
          end //}
          else if (TXNQ[i][`TXN_READ]) begin //{
            write_hit_read = 1'b1;
            valid_req_gen = 1'b1;
            continue; 
          end //}
        end //}
      end //}
    end //}
   
 
    if (!(read_hit_write | read_hit_read | write_hit_write | write_hit_read)) 
      valid_req_gen = 1'b1;
    db_req       = valid_req_gen & (adec_write_ff || (adec_read_ff && adec_rmw_ff));// to access wr data buffer
    

  if (valid_req_gen) begin //{ 
    if (write_hit_write) begin
        wdb_buf_ptr         = waw_wdb_addr;
        dc2na_txnq_pop=dc2na_txnq_pop+1;
    end
    else begin //{for read hit write, write hit read and read hit read
      for (int i = 0; i < 32; i++) begin //{
        if((TXNQ[i][`TXN_VAL] == 0) && (TXNQ[i][`TXN_BYP_CNTR] == 0) && (!wdb_valid_reg[i]) && valid_req_gen)begin//{//shouldnt be a write which has a bypass rd
          if (db_req) begin //{
            wdb_buf_ptr         = i;
            wdb_valid_reg[i]    = 1'b1;
            adec_db_ff          = wdb_buf_ptr;
          end //}
          if (db_req & adec_partial_ff & ndm_rmw_flow) begin //{ incase of partial write and no dm so read has to be done hence it is changed to read and rmw bit is set to 1
            adec_rmw_push       = 1'b1;
            adec_read_push      = 1'b1;
            adec_write_push     = 1'b0;
          end //}
          else begin
            adec_rmw_push       = adec_rmw_ff; 
            adec_read_push      = adec_read_ff; 
            adec_write_push     = adec_write_ff;
          end
          TXNQ[i]               = {ref_status,bypass_cntr,bypass_wdb,bypass,adec_db_rd_ff,adec_db_ff,adec_qos_type_ff,adec_col_ff,adec_row_ff,adec_rank_ff,adec_lrank_ff,adec_bg_ff,adec_bank_ff,adec_wr_done_ff,adec_rmw_rd_done_ff,adec_par_done_ff,adec_rmw_push,adec_partial_ff,adec_write_push,adec_read_push,page_status,1'b1};
          TXNQ_T[i]             = {dram_clock_count};
          TXNQ_TIMER[i]         = adec_timer_ff;
          txnq_loca             = i;
          prev_txnq_loca        = txnq_loca;
          txnq_wr_cas[i]        = ~adec_txn_type_read_ff;
          if(WR_FIFO_DEALLOC[i].size != 0) begin
            $display("%m:@ %t error WR_FIFO_DEALLOC fifo is not empty for txnq loca %d",$time,i);
            end
          wr_cas_count[i]       = !adec_txn_type_read_ff ? 'b1:'b0;
          txnq_rd_cas[i]        = adec_txn_type_read_ff;
          `ifdef NA_PERF_MONITOR_PRINTS_EN   // Perf_Monitor_Prints
              if(!TXNQ[i][`TXN_PRW]  && TXNQ[i][`TXN_READ]) begin 
                  $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , TXNQ_LOCA : %d ,Event : %s_TXNQ_PUSH , page_status: %h,  %t",TXNQ[i][`TXN_RDB],i,qos_name(TXNQ[i][`TXN_QOS]) , page_status,$time );
              end
          `endif
          if (read_wrap_det) begin //{
            dc2na_read_wrap_det      = 1'b1;
            dc2na_read_wrap_rrob_ptr = adec_db_rd_ff;
          end //}
          break;
        end//}
      end//}
    end//}
  end//}


end//}

if(periodic_rd_1)begin//{ For the periodic read, we are using the previously txnq pushed adec addresses
      for (int i = 0; i < 32; i++) begin //{
        if((TXNQ[i][`TXN_VAL] == 0) && (TXNQ[i][`TXN_BYP_CNTR] == 0)&& (!wdb_valid_reg[i]) )begin//{
          if (size_count==0 && push_count_ff==0 && per_rd_cnt==0)  //No previous txns in TXNQ and first periodic read, using default adec addresses
            begin
             TXNQ[i]               = {1'b0,5'b0,{`MC_BUFADDR_WIDTH{1'b0}},1'b0,{`DC_RROB_PTR{1'b0}},{`MC_BUFADDR_WIDTH{1'b0}},adec_qos_type_ff,adec_col_ff,adec_row_ff,adec_rank_ff,adec_lrank_ff,adec_bg_ff,adec_bank_ff,6'b0,periodic_rd_1,2'b10,1'b1}; 
           end
          else begin
            p_rd_adec_rank_one_hot_ff  =  4'b0001 << TXNQ[prev_txnq_loca][`TXN_RANK];
            p_rd_adec_lrank_one_hot_ff =  8'b0000_0001 << TXNQ[prev_txnq_loca][`TXN_LRANK] ;
            p_rd_ref_status = ((ref_req_pend | ~ref_req_done) && ({ref_req_one_hot_lr,ref_req_one_hot_r} == {p_rd_adec_lrank_one_hot_ff, p_rd_adec_rank_one_hot_ff})); 
            if(PAGE_TABLE[{TXNQ[prev_txnq_loca][`TXN_RANK], TXNQ[prev_txnq_loca][`TXN_LRANK] , TXNQ[prev_txnq_loca][`TXN_GROUP] ,TXNQ[prev_txnq_loca][`TXN_BANK]   }][0])begin//{
                if(TXNQ[prev_txnq_loca][`TXN_ROW] == PAGE_TABLE[{TXNQ[prev_txnq_loca][`TXN_RANK], TXNQ[prev_txnq_loca][`TXN_LRANK] , TXNQ[prev_txnq_loca][`TXN_GROUP] ,TXNQ[prev_txnq_loca][`TXN_BANK]}][ROW_WIDTH:1] )
                    p_rd_page_status = 2'b01;//Page hit
                else 
                    p_rd_page_status = 2'b00;//Page Miss
            end//}
            else
              p_rd_page_status = 2'b10;//Page Closed
            TXNQ[i]               = {p_rd_ref_status,5'b0,{`MC_BUFADDR_WIDTH{1'b0}},1'b0,{`DC_RROB_PTR{1'b0}},{`MC_BUFADDR_WIDTH{1'b0}},TXNQ[prev_txnq_loca][`TXN_QOS],TXNQ[prev_txnq_loca][`TXN_COL] ,TXNQ[prev_txnq_loca][`TXN_ROW]    , TXNQ[prev_txnq_loca][`TXN_RANK] , TXNQ[prev_txnq_loca][`TXN_LRANK] , TXNQ[prev_txnq_loca][`TXN_GROUP]  ,TXNQ[prev_txnq_loca][`TXN_BANK] ,6'b0,periodic_rd_1,  p_rd_page_status  ,1'b1};
          end
          TXNQ_T[i]             = {dram_clock_count};
          TXNQ_TIMER[i]         = 12'b0;
          txnq_loca             = i;
          prev_txnq_loca        = txnq_loca;
          per_rd_array[i]       = 1'b1;
          per_rd_cnt            = per_rd_cnt+1;
          $display("TXNQ PUSH: PERIODIC READ request at time = %t: read = %b col = %h row = %h  bank = %h rank=%h  lrank=%h  BG=%h   txnq_loca = %d page_status=%d ref_status=%d",$time,periodic_rd_1,TXNQ[prev_txnq_loca][`TXN_COL], TXNQ[prev_txnq_loca][`TXN_ROW], TXNQ[prev_txnq_loca][`TXN_BANK] , TXNQ[prev_txnq_loca][`TXN_RANK] ,TXNQ[prev_txnq_loca][`TXN_LRANK] , TXNQ[prev_txnq_loca][`TXN_GROUP],txnq_loca, p_rd_page_status,p_rd_ref_status );
          break;
        end//}
      end//}
end//}

for (int i = 0; i < 32 ; i++) begin //{
  if (TXNQ[i][`TXN_VAL] & tmr_update[TXNQ[i][`TXN_QOS]] &(TXNQ_TIMER[i] != 'd0)) begin
    TXNQ_TIMER[i] = TXNQ_TIMER[i] - 1'b1;
  end
  if (TXNQ[i][`TXN_VAL] & (TXNQ_TIMER[i] == 'd0)) begin //{
    if (TXNQ[i][`TXN_READ] & !TXNQ[i][`TXN_PRW] & !TXNQ[i][`TXN_BYP]) begin
      starved_xfer[i] = 1'b1;
    end
    else if (TXNQ[i][`TXN_READ] & !TXNQ[i][`TXN_PRW] & TXNQ[i][`TXN_BYP]) begin //{
      starved_xfer[i] = 1'b1;
      if (TXNQ[TXNQ[i][`TXN_BYP_ID]][`TXN_PRW] && !TXNQ[TXNQ[i][`TXN_BYP_ID]][`TXN_RMW_RD_DONE])  begin //{
        starved_xfer[TXNQ[i][`TXN_BYP_ID]] = 1'b1;
        starved_xfer_byp[TXNQ[i][`TXN_BYP_ID]] = 1'b1;
      end //}
      else begin //{
        starved_xfer[TXNQ[i][`TXN_BYP_ID]] = 1'b0;  
        starved_xfer_byp[TXNQ[i][`TXN_BYP_ID]] = 1'b0;
      end //}
    end //}
    else if (TXNQ[i][`TXN_VAL] && !TXNQ[i][`TXN_WRITE] && ((TXNQ[i][`TXN_PRW] && TXNQ[i][`TXN_PARTIAL]  && TXNQ[i][`TXN_PWR_DONE] && TXNQ[i][`TXN_RMW_RD_DONE]))) begin //{
        starved_xfer[i] = 1'b0;
        starved_xfer_byp[i] = 1'b0;
    end //}
    else if(TXNQ[i][`TXN_VAL] && !TXNQ[i][`TXN_READ] && starved_xfer[i] && !starved_xfer_byp[i]) begin //{
      starved_xfer[i] = 1'b0;
    end //}
  end //}
  else if (TXNQ[i][`TXN_VAL] && !TXNQ[i][`TXN_WRITE] && ((TXNQ[i][`TXN_PRW]  &&  TXNQ[i][`TXN_PARTIAL]  && TXNQ[i][`TXN_PWR_DONE] && TXNQ[i][`TXN_RMW_RD_DONE])) && starved_xfer[i] && starved_xfer_byp[i] ) begin
        starved_xfer[i] = 1'b0;
        starved_xfer_byp[i] = 1'b0;
  end
  else if(TXNQ[i][`TXN_VAL] && starved_xfer_byp[i]) begin //{
    starved_xfer[i] = 1'b1;
  end //}
  else begin //{
    starved_xfer[i] = 1'b0;
    starved_xfer_byp[i] = 1'b0;
  end //}

end //}

starv_mode = |starved_xfer; 

size_count = 0;
for (int i = 0; i < 32; i++) begin
  if (TXNQ[i][`TXN_VAL])
    size_count = size_count + 1;//to check the txnq entries
end

if ((adec_txn_push_ff & !adec_txn_type_read_ff) | (dram_rd_data_en_2db & TXNQ[dram_rd_txnq_loc_2db][`TXN_PWR_DONE] & TXNQ[dram_rd_txnq_loc_2db][`TXN_PRW])) begin //{


  wdb_req_int.app_req       = (adec_txn_push_ff & !adec_txn_type_read_ff) ? db_req : 
                                                                           (dram_rd_data_en_2db ? 1'b1 : 1'b0) ; 

  wdb_req_int.app_data      = (adec_txn_push_ff & !adec_txn_type_read_ff) ? {{{(`NA_WBUF_MASK_WIDTH-WDB_DM_WIDTH){1'b0}},adec_byte_en_ff},{{(`NA_WBUF_DATA_WIDTH-WDB_DATA_WIDTH){1'b0}},adec_wr_data_ff}} : 
                                                                           (dram_rd_data_en_2db ? {{{(`NA_WBUF_MASK_WIDTH-WDB_DM_WIDTH){1'b0}},{WDB_DM_WIDTH{1'b1}}},{{(`NA_WBUF_DATA_WIDTH-WDB_DATA_WIDTH){1'b0}},dram_rd_data_2db}} :
                                                                                                  'd0); 

  wdb_req_int.app_buf_ptr   = (adec_txn_push_ff & !adec_txn_type_read_ff) ? (db_req ? wdb_buf_ptr     : {`MC_BUFADDR_WIDTH{1'b0}}) : 
                                                                           (dram_rd_data_en_2db ? dram_rd_data_db_buf_addr_2db : 'd0);

  wdb_req_int.app_overwrite = (adec_txn_push_ff & !adec_txn_type_read_ff) ? (db_req ? {1'b0,waw_overwrite} : 2'b0) : 
                                                                           (dram_rd_data_en_2db ? {rmw_overwrite,1'b0} : 2'b0);

  if ((!adec_txn_type_read_ff & adec_txn_push_ff) & dram_rd_data_en_2db)
    $error("Error: at time = %t both adec_txn_push = %b and dram_rd_data_en_2db = %b happened",$time,adec_txn_push_ff,dram_rd_data_en_2db);
    wait (wdb_req_int.app_gnt);
end //}

 

//4.Generate ACT,PRE and CAS 
for(int i =0;i<32;i++)begin//{
    if(TXNQ[i][`TXN_VAL] == 1 & (!TXNQ[i][`TXN_BYP]))begin//{
      if(TXNQ[i][`TXN_PG_STS] == 2'b00)//Page Miss
        TXNQ_REQ[i] = {TXNQ[i][`TXN_READ],3'b100};
      else if(TXNQ[i][`TXN_PG_STS] == 2'b10)//Page Closed
             TXNQ_REQ[i] = {TXNQ[i][`TXN_READ],3'b010};
      else if(TXNQ[i][`TXN_PG_STS] == 2'b01)//Page Hit
             TXNQ_REQ[i] = {TXNQ[i][`TXN_READ],3'b001};
    end//} 
    else if(TXNQ[i][`TXN_VAL] == 1 & (TXNQ[i][`TXN_BYP])) begin //{
             TXNQ_REQ[i] = {TXNQ[i][`TXN_READ],3'b001}; //irrespective of the page status we are setting it as page hit
    end//}
    else
      TXNQ_REQ[i] = 'd0;
end//}

RD_any_pg_hit ='0;
WR_any_pg_hit ='0;
for(int i =0;i<32;i++)begin//{
    if(TXNQ_REQ[i][`TXNQ_REQ_HIT])begin//{
      if (TXNQ_REQ[i][`TXNQ_REQ_RD]) RD_any_pg_hit  =1'b1;
      else WR_any_pg_hit = 1'b1;
    end//} 
end//}

wr_count = 5'b0_0000;
for(int i =0;i<32;i++)begin//{
  if(TXNQ[i][`TXN_VAL] == 1)begin//{
    if(TXNQ[i][`TXN_WRITE] == 1'b1) 
      wr_count = wr_count + 5'b0_0001;
    else  
      wr_count = wr_count;
  end//}
end//}

rd_count = 5'b0_0000;
for(int i =0;i<32;i++)begin//{
  if(TXNQ[i][`TXN_VAL] == 1)begin//{
    if(TXNQ[i][`TXN_READ] == 1'b1) 
      rd_count = rd_count + 5'b0_0001;
    else  
      rd_count = rd_count;
  end//}
end//}
free_count = free_count + 1'b1;

if(ref_req_pend == 1)begin  //{
  for(int j = 0; j < NUM_OF_BGS; j++)begin //{
     for(int k = 0; k < NUM_OF_BANKS; k++)begin //{
        pre_req_bg = j;
        pre_req_ba = k;
        if(PAGE_TABLE[{ref_req_r,ref_req_lr,pre_req_bg,pre_req_ba}][0]) //whether the bank is open or not
           pre_pend[j*NUM_OF_BANKS + k] = 1'b1;
        else   
           pre_pend[j*NUM_OF_BANKS + k] = 1'b0;
     end //}
  end //}
end else //}
  pre_pend = 'b0;

//SKIP-FSM reg loading
  wr_seq_cas_thresh = ( rd_count <= 6'd6  ) ? txnq_wr_priority_th_low
                                   : ( rd_count >= 6'd27 ) ? txnq_wr_priority_th_high
                                   :   txnq_wr_priority_th_med;
  wr_seq_cas_thresh = (|wr_seq_cas_thresh ? (wr_seq_cas_thresh+1'b1) : '0 ) ; ;//Bcz of flopping in RTL, threshold+1 would be good in BFM which is combo logic
  rd_seq_cas_thresh = ( wr_count <= 6'd6  ) ? txnq_rd_priority_th_low
                                   : ( wr_count>= 6'd27 ) ? txnq_rd_priority_th_high
                                   :   txnq_rd_priority_th_med;
  rd_seq_cas_thresh =(|rd_seq_cas_thresh ? (rd_seq_cas_thresh+1'b1) : '0);  ;//Bcz of flopping in RTL, threshold+1 would be good in BFM which is combo logic                              
  farb_rd_cas_won= farb_rd_won_slot0 || farb_rd_won_slot1;
	farb_wr_cas_won = farb_wr_won_slot0 || farb_wr_won_slot1;
  wr_pend_count_nz = | wr_count;
  wr_pend_count_z  = ~wr_pend_count_nz;
  rd_pend_count_nz = | rd_count;
  rd_pend_count_z  = ~rd_pend_count_nz;
	// Create simple FSM to detect dribble case
    dribble_wr_seq_cas_count_inc   = wr_dribble_en & rd_pend_count_nz & wr_pend_count_z & ( | wr_seq_cas_count[6:0] ) & ~wr_seq_cas_count[7];
    dribble_wr_seq_cas_count_vec   = wr_dribble_half_speed_en ? { '0, dribble_wr_seq_cas_count_inc, 1'b0 } : { '0, dribble_wr_seq_cas_count_inc, 2'b0 };
	// Count how many write CAS have issued without a read CAS.
  wr_seq_cas_count_nf  = ~( & wr_seq_cas_count );
	wr_seq_cas_count_inc =  wr_seq_cas_count + { '0, ( farb_wr_cas_won & wr_seq_cas_count_nf ) } + dribble_wr_seq_cas_count_vec;
	wr_seq_cas_count = ( ( rd_pend_count_z & ~clr_wr_seq_no_pend_rd_dis ) | farb_rd_cas_won | ~txnq_wr_priority_skip_count_en ) ? '0 : wr_seq_cas_count_inc;
	// Count how many read CAS have issued without a write CAS.
  rd_seq_cas_count_nf  = ~( & rd_seq_cas_count );
  rd_seq_cas_count_inc =  rd_seq_cas_count + { '0, ( farb_rd_cas_won & rd_seq_cas_count_nf ) };
  rd_seq_cas_count = ( ( wr_pend_count_z & ~clr_rd_seq_no_pend_wr_dis ) | farb_wr_cas_won | ~txnq_rd_priority_skip_count_en ) ? '0 : rd_seq_cas_count_inc;
	// Compare number of CAS issued to threshold
  wr_seq_cas_count_over_thresh = wr_seq_cas_count >= wr_seq_cas_thresh;
  rd_seq_cas_count_over_thresh = rd_seq_cas_count >= rd_seq_cas_thresh;

  txnq_fsm.wr_pend_count_nz=  wr_pend_count_nz;
  txnq_fsm.wr_pend_count_z =  wr_pend_count_z;
  txnq_fsm.rd_pend_count_nz=  rd_pend_count_nz;
  txnq_fsm.rd_pend_count_z =  rd_pend_count_z;
  txnq_fsm.wr_seq_cas_count_over_thresh =wr_seq_cas_count_over_thresh;
  txnq_fsm.rd_seq_cas_count_over_thresh =rd_seq_cas_count_over_thresh;
  txnq_fsm.farb_rd_cas_won =farb_rd_cas_won;
  txnq_fsm.farb_wr_cas_won = farb_wr_cas_won;
  txnq_fsm.early_skip_rd_exit_en = early_skip_rd_exit_en;
  txnq_fsm.early_skip_wr_exit_en = early_skip_wr_exit_en;
//SKIP-FSM reg loading

txnq_fsm.txnq_starved_mode = starv_mode;
wr_cas_count_over_high_th = (wr_count >= reg_dram_arb_write_level_hi);
wr_cas_count_over_low_th = (wr_count > reg_dram_arb_write_level_lo);
wr_cas_count_below_low_th = (wr_count <= reg_dram_arb_write_level_lo);
txnq_fsm.wr_cas_count_over_high_th = wr_cas_count_over_high_th;
txnq_fsm.wr_cas_count_over_low_th  = wr_cas_count_over_low_th; 
txnq_fsm.wr_cas_count_below_low_th = wr_cas_count_below_low_th;
txnq_fsm.skip_FSM_determine_state(mc_rst); //SKIP_FSM Change
txnq_fsm.txnq_determine_state(mc_rst);
//txnq_fsm.txnq_get_next_state(mc_rst);
////Debug Signals -start
skip_fsm_read_only=  txnq_fsm.txnq_skip_fsm_read_only_ff;
skip_fsm_write_only =txnq_fsm.txnq_skip_fsm_write_only_ff;
txnq_normal_arb_state    =     txnq_fsm.txnq_arb_fsm_ff;
txnq_skip_arb_state    =    txnq_fsm.txnq_skip_fsm_ff;
////Debug Signals  - end
rd_priority     = (txnq_fsm.rd_priority_ff || txnq_fsm.txnq_skip_fsm_read_only_ff) & (!txnq_fsm.txnq_skip_fsm_write_only_ff) ; //SKIP-FSM Change
wr_priority     = (txnq_fsm.wr_priority_ff|| txnq_fsm.txnq_skip_fsm_write_only_ff) & (!txnq_fsm.txnq_skip_fsm_read_only_ff); //SKIP-FSM Change     
wr_rd_priority  = txnq_fsm.wr_rd_priority_ff;  
wr_top          = txnq_fsm.wr_top_ff;          
starved_priority= txnq_fsm.starved_priority_ff;
farb_rd_priority= txnq_fsm.farb_rd_priority_ff;
farb_wr_priority= txnq_fsm.farb_wr_priority_ff;

 default_read_only = (rd_count !=0 ) & (txnq_rd_priority_only_read);
 //read_arb_only = rd_priority & default_read_only ;
 read_arb_only = (default_read_only & rd_priority) || (skip_fsm_read_only && !skip_fsm_write_only ) ;
 //read_arb_only = rd_priority || default_read_only ;  //SKIP-FSM Change
 write_arb_only = wr_priority || wr_top;

txnq_fsm.txnq_get_next_state(mc_rst); //Flopping the current txnq states

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Safe Timer Logic TXNQ Request Width = 32
//1.Update Timers based on FARB 
   if(farb_act_won)begin//{
     if(farb_act_slot0)begin//{
       TRRD_S[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0] = dram_clock_count - 1 ;//$time-tCK;
       TRRD_L[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0] = dram_clock_count - 1 ;//$time-tCK;
       TRRD_DLR[farb_rank_slot0][farb_lrank_slot0] = dram_clock_count - 1 ;//$time-tCK;
       TFAW[farb_rank_slot0] = dram_clock_count - 1;//$time-tCK;
       TACT[farb_rank_slot0][4] = dram_clock_count - 1;//$time - tCK;
       TRC[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0][farb_bank_slot0]  = dram_clock_count - 1;//$time-tCK;
       TRAS[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0][farb_bank_slot0] = dram_clock_count - 1;//$time-tCK;
       TRCD[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0][farb_bank_slot0] = dram_clock_count - 1;//$time-tCK; 
       TACT[farb_rank_slot0][0] = TACT[farb_rank_slot0][1];
       TACT[farb_rank_slot0][1] = TACT[farb_rank_slot0][2];
       TACT[farb_rank_slot0][2] = TACT[farb_rank_slot0][3];
       TACT[farb_rank_slot0][3] = TACT[farb_rank_slot0][4];
     end//}
     if(farb_act_slot1)begin//{
       TRRD_S[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1] = dram_clock_count ;//$time;
       TRRD_L[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1] = dram_clock_count ;//$time;
       TRRD_DLR[farb_rank_slot1][farb_lrank_slot1] = dram_clock_count ;//$time;
       TFAW[farb_rank_slot1] = dram_clock_count;//$time;
       TACT[farb_rank_slot1][4] = dram_clock_count;//$time;
       TRC[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1][farb_bank_slot1]  = dram_clock_count ;//$time;
       TRAS[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1][farb_bank_slot1] = dram_clock_count ;//$time;
       TRCD[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1][farb_bank_slot1] = dram_clock_count ;//$time; 
       TACT[farb_rank_slot1][0] = TACT[farb_rank_slot1][1];
       TACT[farb_rank_slot1][1] = TACT[farb_rank_slot1][2];
       TACT[farb_rank_slot1][2] = TACT[farb_rank_slot1][3];
       TACT[farb_rank_slot1][3] = TACT[farb_rank_slot1][4];
     end//}
   end //}
   if(farb_pre_won)begin//{
     if(farb_pre_slot0)begin//{
       TRP[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0][farb_bank_slot0] = dram_clock_count - 1;//$time-tCK;
     end//}
     if(farb_pre_slot1)begin//{
       TRP[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1][farb_bank_slot1] = dram_clock_count;//$time;
     end//}
   end//}
     if(farb_wr_won_slot0 & farb_cas_slot0)begin//{
       TWTR_S[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0] = dram_clock_count - 1;//$time-tCK;
       TWTR_L[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0] = dram_clock_count - 1;//$time-tCK;
       TWTR_SR_DLR[farb_rank_slot0][farb_lrank_slot0] = dram_clock_count - 1;//$time-tCK;
       TWTR_DR[farb_rank_slot0]                  = dram_clock_count - 1;//$time-tCK;
       TWTW[farb_rank_slot0][farb_lrank_slot0]   = dram_clock_count - 1;//$time-tCK;           
       TCCD_L[farb_rank_slot0][farb_bg_slot0]    = dram_clock_count - 1 ;//$time-tCK;
       TCCD_S[farb_rank_slot0][farb_bg_slot0]    = dram_clock_count - 1 ;//$time-tCK;
       TWR[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0][farb_bank_slot0] = dram_clock_count - 1;//$time-tCK;
       WR_FIFO_DEALLOC[farb_id_slot0].push_back(mc_clock_count - 1);
     end//}
     if(farb_wr_won_slot1 & farb_cas_slot1)begin//{
       TWTR_S[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1] = dram_clock_count;//$time;
       TWTR_L[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1] = dram_clock_count;//$time;
       TWTR_SR_DLR[farb_rank_slot1][farb_lrank_slot1] = dram_clock_count;//$time;
       TWTR_DR[farb_rank_slot1]                  = dram_clock_count;//$time;
       TWTW[farb_rank_slot1][farb_lrank_slot1]   = dram_clock_count ;//$time;           
       TCCD_L[farb_rank_slot1][farb_bg_slot1]    = dram_clock_count ;//$time;
       TCCD_S[farb_rank_slot1][farb_bg_slot1]    = dram_clock_count ;//$time;
       TWR[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1][farb_bank_slot1] = dram_clock_count;//$time;
       WR_FIFO_DEALLOC[farb_id_slot1].push_back(mc_clock_count - 1) ;
     end//}
     if(farb_cas_slot0 & farb_rd_won_slot0)begin//{
       TRTW[farb_rank_slot0][farb_lrank_slot0] = dram_clock_count - 1;//$time-tCK;           
       TRTR[farb_rank_slot0][farb_lrank_slot0] = dram_clock_count - 1;//$time-tCK;           
       TCCD_L[farb_rank_slot0][farb_bg_slot0]    = dram_clock_count - 1 ;//$time-tCK;
       TCCD_S[farb_rank_slot0][farb_bg_slot0]    = dram_clock_count - 1 ;//$time-tCK;
       TRTP[farb_rank_slot0][farb_lrank_slot0][farb_bg_slot0][farb_bank_slot0] = dram_clock_count - 1;//$time-tCK;
       if(!TXNQ[farb_id_slot0][`TXN_PRW])
       RETRY_FIFO_DEALLOC[farb_id_slot0] = mc_clock_count;
       if(TXNQ[farb_id_slot0][`TXN_PRW])
       RMW_FIFO_DEALLOC[farb_id_slot0] = mc_clock_count;
     end//}
     if(farb_cas_slot1 & farb_rd_won_slot1)begin//{
       TRTW[farb_rank_slot1][farb_lrank_slot1]= dram_clock_count ;//$time;           
       TRTR[farb_rank_slot1][farb_lrank_slot1]= dram_clock_count;           
       TCCD_L[farb_rank_slot1][farb_bg_slot1]    = dram_clock_count ;//$time;
       TCCD_S[farb_rank_slot1][farb_bg_slot1]    = dram_clock_count ;//$time;
       TRTP[farb_rank_slot1][farb_lrank_slot1][farb_bg_slot1][farb_bank_slot1] = dram_clock_count;//$time;
       if(!TXNQ[farb_id_slot1][`TXN_PRW])
       RETRY_FIFO_DEALLOC[farb_id_slot1] = mc_clock_count ;
       if(TXNQ[farb_id_slot1][`TXN_PRW])
       RMW_FIFO_DEALLOC[farb_id_slot1] = mc_clock_count ;
     end//}

if( ~initDone)begin //{
    TREFI[0] = dram_clock_count;//$time;
end //}
//logic to calculate the targeted rand lrank for refresh first issue refresh to all lranks then increment rank
ref_req_r =  ((ref_req_lr == (NUM_OF_LRANKS -1)) && farb_ref_won) ? ((ref_req_r == (NUM_OF_RANKS - 1))?{RANK_WIDTH{1'b0}} :ref_req_r +1) : ref_req_r;
ref_req_lr = (NUM_OF_LRANKS == 1)?1'b0:(farb_ref_won ? ((ref_req_lr == (NUM_OF_LRANKS -1))?{LRANK_WIDTH{1'b0}} :ref_req_lr +1) : ref_req_lr);
pre_all_req_rank = (ref_req_pend == 1)? ((|pre_pend)? 1'b1:1'b0):1'b0;  
 for(int i =0;i<NUM_OF_BGS;i++)begin //{
   for(int j =0;j<NUM_OF_BANKS;j++)begin //{
      safe_pre_req[(i* NUM_OF_BANKS) +j] = ((dram_clock_count -  TRP[ref_req_r][ref_req_lr][i][j]) >= trp); //if refresh is safe
   end //}  
 end //} 
 //whether the rank is safe to be refreshed
ref_req_rank = (ref_req_pend == 1)? ((!pre_all_req_rank  & (&safe_pre_req)) ? 1'b1:1'b0):1'b0; 
//dont send a precharge to the bank if there is a cas pending to the same bank
pending_hit = 0;
wr_hit_pending =0;
rd_hit_pending =0;
bypass_rd_hit_pending = 0;
byp_rd_PG_hit_id = 0;
hit_addr_wr = 0;
pre_addr_wr = 0;

for(int i = 0; i <32;i++) begin //{
   if(TXNQ[i][`TXN_VAL] & ((starv_mode & starved_xfer[i]) | !starv_mode) & TXNQ_REQ[i][`TXNQ_REQ_MISS] ) begin//{
     //pre_addr_wr = {TXNQ[i][`TXN_COL_SAFE],TXNQ[i][`ADDR_RANGE_SAFE]};
     pre_addr_wr = {TXNQ[i][`TXN_BANK],TXNQ[i][`TXN_GROUP],TXNQ[i][`TXN_RANK],TXNQ[i][`TXN_LRANK]  };
     //$display("Venkata:time : %t  pre_addr_wr : %h",$time, pre_addr_wr );
     for(int j = 0; j <32;j++)begin //{
       if (TXNQ_REQ[j][`TXNQ_REQ_HIT] && (i!=j) ) begin //{
         //hit_addr_wr =   {TXNQ[j][`TXN_COL_SAFE],TXNQ[j][`ADDR_RANGE_SAFE]};
         hit_addr_wr =   { TXNQ[j][`TXN_BANK],TXNQ[j][`TXN_GROUP],TXNQ[j][`TXN_RANK],TXNQ[j][`TXN_LRANK]  };
         //$display("Venkata:time : %t  hit_addr_wr: %h",$time,hit_addr_wr);
         if(hit_addr_wr == pre_addr_wr)begin //{
           pending_hit[i] = 1;
           if (TXNQ[j][`TXN_WRITE]) wr_hit_pending [i] =1;
           else if (TXNQ[j][`TXN_READ] && !TXNQ[j][`TXN_BYP] ) rd_hit_pending [i] =1;
           else if (TXNQ[j][`TXN_READ] && TXNQ[j][`TXN_BYP] ) begin bypass_rd_hit_pending [i] =1;  byp_rd_PG_hit_id = j; end
           //$display("Venkata:time : %t  entered to pending hit array set pending_hit %h  wr_hit_pending %h rd_hit_pending %h  txnq_loca:%d",$time, pending_hit,wr_hit_pending,rd_hit_pending , i    );
           break;
         end//}
       end//}
     end//}
  end//}
end//}

// To determine if the txn in the TXNQ is qualified for safe timing check
// 1 WR- act,pre,cas - valid
//                   - if straved_mode is set check if its the straved transfer else dont proceed further else 
//                   - for act check if the page is closed
//                         pre check if the page is miss
//                         cas check if the page is hit
//                   - txn_read shouldnt be set
//                   - txn_write should be set
//                   - (not a partial as in normal full write) or
//                      if partial shouldnt be a partial write hit by a read or
//                      if partial and is a partial write hit by a read then
//                         partial_write_done shouldnt be set or 
//                         partial_write_done is set and even the RMW_RD_Done is done
// 1a WR_ACT-  
for(int i =0;i<32;i++)begin//{
 if(TXNQ[i][`TXN_VAL] & ((starv_mode & wr_top) | (starv_mode & starved_xfer[i]) | !starv_mode) & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_CLOSE] & !TXNQ[i][`TXN_READ] & TXNQ[i][`TXN_WRITE] &  
              ( (!TXNQ[i][`TXN_PARTIAL] & (~read_arb_only | act_pre_es2_mode_en)) |   //ES2 Change                         
                (TXNQ[i][`TXN_PARTIAL] & !TXNQ[i][`TXN_PRW]& (~read_arb_only | act_pre_es2_mode_en)) |                     
                (TXNQ[i][`TXN_PARTIAL] & TXNQ[i][`TXN_PRW] & ((!TXNQ[i][`TXN_PWR_DONE]) | (TXNQ[i][`TXN_PWR_DONE] & TXNQ[i][`TXN_RMW_RD_DONE])))))begin//{ need to know when will both partial write is done and rmw_rd_done
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: enterd safe_wr_act @%t",$time),DBG);
     for(int j = 0;j<NUM_OF_BGS;j++)begin//{
       if(TXNQ[i][`TXN_GROUP] == j) begin
          safe_wr_act_req[i][j]  = (dram_clock_count - TRRD_L[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_l-1);
          safe_wr_act_req1[i][j] = (dram_clock_count - TRRD_L[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_l-(2));
       end
       else begin
          safe_wr_act_req[i][j] = (dram_clock_count - TRRD_S[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_s-1);
          safe_wr_act_req1[i][j] = (dram_clock_count - TRRD_S[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_s-(2));
       end
     end//}
          safe_wr_act_req[i][NUM_OF_BGS] = ((dram_clock_count - TRP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trp-1));   
          safe_wr_act_req1[i][NUM_OF_BGS] = ((dram_clock_count - TRP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trp-(2)));   
     for(int j = 0;j < NUM_OF_LRANKS;j++)begin//{
          if(NUM_OF_LRANKS == 1)begin //{   
            safe_wr_act_req[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-1));   
            safe_wr_act_req1[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-(2)));   
          end //}
          else begin //{
            if(TXNQ[i][`TXN_LRANK] == j) begin
              safe_wr_act_req[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_slr-1));   
              safe_wr_act_req1[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_slr-(2)));   
            end
            else begin
              safe_wr_act_req[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_dlr-1));   
              safe_wr_act_req1[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_dlr-(2)));   
            end
          end //}
     end //}
     for(int j = 0;j < NUM_OF_RANKS;j++)begin//{
        if(NUM_OF_RANKS == 1)begin //{   
            safe_wr_act_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-1));   
            safe_wr_act_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-(2)));   
        end//}
          else begin //{
            if(TXNQ[i][`TXN_RANK] == j) begin
              safe_wr_act_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_slr-1));   
              safe_wr_act_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_slr-(2)));   
            end
            else begin
              safe_wr_act_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_r2r-1));   
              safe_wr_act_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_r2r-(2)));   
            end
          end //}
     end//}
          safe_wr_act_req[i][NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1] = (dram_clock_count - TACT[TXNQ[i][`TXN_RANK]][0]) >= (tfaw-1);
          safe_wr_act_req1[i][NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1] = (dram_clock_count - TACT[TXNQ[i][`TXN_RANK]][0])  >= (tfaw-2);
     for(int j = 0;j < NUM_OF_LRANKS;j++)begin//{
       if(TXNQ[i][`TXN_LRANK] != j)begin //{   
          safe_wr_act_req[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = (dram_clock_count - TRRD_DLR[TXNQ[i][`TXN_RANK]][j]) >= (trrd_dlr-1);
          safe_wr_act_req1[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = (dram_clock_count - TRRD_DLR[TXNQ[i][`TXN_RANK]][j])  >= (trrd_dlr-2);
       end //}
       else begin //{
          safe_wr_act_req[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1; //no need to check for same LR
          safe_wr_act_req1[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1;
       end //}
     end//}
   safe_wrra_act_req[i] = &safe_wr_act_req[i];
   safe_wrra_act_req1[i] = &safe_wr_act_req1[i];
   end //}
   else begin
     safe_wrra_act_req[i]  = 'b0;
     safe_wr_act_req[i]    = 'd0;
     safe_wrra_act_req1[i] = 'b0;
     safe_wr_act_req1[i]   = 'd0;
   end
end //}

//1b. WR_PRE
//pending_hit = 0;
//hit_addr_wr = 0;
//pre_addr_wr = 0;
for(int i =0;i<32;i++)begin//{
 //if(TXNQ[i][`TXN_VAL] & ((starv_mode & starved_xfer[i]) | !starv_mode) & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_MISS] & !TXNQ[i][`TXN_READ] & TXNQ[i][`TXN_WRITE] & 
 if(TXNQ[i][`TXN_VAL] & ((starv_mode & wr_top) | (starv_mode & starved_xfer[i]) | !starv_mode) & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_MISS] & !TXNQ[i][`TXN_READ] & TXNQ[i][`TXN_WRITE] & 
              ( !TXNQ[i][`TXN_PARTIAL] |                                                              
                (TXNQ[i][`TXN_PARTIAL] & !TXNQ[i][`TXN_PRW]) |                                        
                (TXNQ[i][`TXN_PARTIAL] & TXNQ[i][`TXN_PRW] & ((!TXNQ[i][`TXN_PWR_DONE]) | (TXNQ[i][`TXN_PWR_DONE] & TXNQ[i][`TXN_RMW_RD_DONE])))))begin//{
// in wr_rd_pri if an act is present to same bank then pre cannot be given
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: enterd safe_wrra_pre_req @%t",$time),DBG);

   //if((wr_rd_priority & (~(pending_hit[i]))) | !wr_rd_priority) begin//
   //if( ((wr_rd_priority || rd_priority) & ~pending_hit[i]) || ( write_arb_only & !wr_hit_pending[i]) || (starv_mode & starved_xfer[i])   ) begin//{
   if( (wr_rd_priority || rd_priority) & ( ~pending_hit[i] ||  (bypass_rd_hit_pending[i] && (i==TXNQ[byp_rd_PG_hit_id][`TXN_BYP_ID])) ) || ( write_arb_only & !wr_hit_pending[i]) || (starv_mode & starved_xfer[i]) || (act_pre_es2_mode_en & !wr_hit_pending[i]) || (rd_priority && TXNQ[i][`TXN_BYP_CNTR] !='0)  ) begin//{ //SKIP-FSM ES2- Chnage

      safe_wrra_pre_req[i] = (((dram_clock_count - TRAS[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tras-1)) &&
                             ((dram_clock_count -  TRTP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trtp-1)) &&
                             ((dram_clock_count -  TWR[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tcs_w2p-1)));

      safe_wrra_pre_req1[i] = (((dram_clock_count - TRAS[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tras-(2))) &&
                               ((dram_clock_count -  TRTP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trtp-(2))) &&
                               ((dram_clock_count -  TWR[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tcs_w2p-(2))));
    end //}
    else begin //{
      safe_wrra_pre_req[i] = 'b0;
      safe_wrra_pre_req1[i] = 'b0;
    end //}
   end//}
   else begin
     safe_wrra_pre_req[i] = 'b0;
     safe_wrra_pre_req1[i] = 'b0;
   end
end //}

//1c. WR_CAS
for(int i =0;i<32;i++)begin//{
 //if(TXNQ[i][`TXN_VAL] & ((starv_mode & starved_xfer[i]) | !starv_mode) & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_HIT] & !TXNQ[i][`TXN_READ] & TXNQ[i][`TXN_WRITE] &
 if(TXNQ[i][`TXN_VAL] & ((starv_mode & wr_top) | (starv_mode & starved_xfer[i]) | !starv_mode) & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_HIT] & !TXNQ[i][`TXN_READ] & TXNQ[i][`TXN_WRITE] & 
              ( (!TXNQ[i][`TXN_PARTIAL]&(~(read_arb_only & RD_any_pg_hit) || (rd_priority && TXNQ[i][`TXN_BYP_CNTR] !='0))) |                                          
                (TXNQ[i][`TXN_PARTIAL] & !TXNQ[i][`TXN_PRW]&(~(read_arb_only & RD_any_pg_hit ) || (rd_priority && TXNQ[i][`TXN_BYP_CNTR] !='0))) |                      
                (TXNQ[i][`TXN_PARTIAL] & TXNQ[i][`TXN_PRW] & ((!TXNQ[i][`TXN_PWR_DONE]) | (TXNQ[i][`TXN_PWR_DONE] & TXNQ[i][`TXN_RMW_RD_DONE])))))begin//{

      safe_wr_cas_req[i][NUM_OF_BGS] = (((dram_clock_count - TRCD[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trcd-1)) && ((dram_clock_count -  TRTW[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2w_sr-1)));
      safe_wr_cas_req1[i][NUM_OF_BGS] = (((dram_clock_count - TRCD[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trcd-(2))) && ((dram_clock_count -  TRTW[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2w_sr-(2))));

     for(int j = 0;j<NUM_OF_BGS;j++)begin//{ 
       if(TXNQ[i][`TXN_GROUP] == j) begin            
         safe_wr_cas_req[i][j] = ((dram_clock_count - TCCD_L[TXNQ[i][`TXN_RANK]][j]) >= (tccd_l_sr-1)); 
         safe_wr_cas_req1[i][j] = ((dram_clock_count - TCCD_L[TXNQ[i][`TXN_RANK]][j]) >= (tccd_l_sr-(2))); 
       end
       else begin  
         safe_wr_cas_req[i][j] = ((dram_clock_count - TCCD_S[TXNQ[i][`TXN_RANK]][j]) >= (tccd_s_sr-1)); 
         safe_wr_cas_req1[i][j] = ((dram_clock_count - TCCD_S[TXNQ[i][`TXN_RANK]][j]) >= (tccd_s_sr-(2))); 
       end
     end//}
     for(int j = 0;j < NUM_OF_LRANKS;j++)begin//{
          if(NUM_OF_LRANKS == 1)begin //{   
            safe_wr_cas_req[i][NUM_OF_BGS+1+j] = 1'b1;   
            safe_wr_cas_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_wr_cas_req1[i][NUM_OF_BGS+1+j] = 1'b1;   
            safe_wr_cas_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
          end //}
          else begin //{
            if(TXNQ[i][`TXN_LRANK] == j)begin //{
              safe_wr_cas_req[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[TXNQ[i][`TXN_RANK]][j]) >= (tcs_r2w_sr-1));   
              safe_wr_cas_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
              safe_wr_cas_req1[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[TXNQ[i][`TXN_RANK]][j]) >= (tcs_r2w_sr-(2)));   
              safe_wr_cas_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            end //}
            else begin //{
              safe_wr_cas_req[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[TXNQ[i][`TXN_RANK]][j]) >= (tcs_r2w_sr-1));   
              safe_wr_cas_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TWTW[TXNQ[i][`TXN_RANK]][j]) >= (tcs_w2w_sr_dlr-1));   
              safe_wr_cas_req1[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[TXNQ[i][`TXN_RANK]][j]) >= (tcs_r2w_sr-(2)));   
              safe_wr_cas_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TWTW[TXNQ[i][`TXN_RANK]][j]) >= (tcs_w2w_sr_dlr-(2)));   
            end //}
          end //}
     end //}
     for(int j = 0;j< NUM_OF_RANKS;j++)begin//{
        if(NUM_OF_RANKS == 1)begin //{   
            safe_wr_cas_req[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_wr_cas_req[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_wr_cas_req1[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_wr_cas_req1[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
        end//}
          else begin //{
            if(TXNQ[i][`TXN_RANK] == j) begin //{
              safe_wr_cas_req[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2w_sr-1));   
              safe_wr_cas_req[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
              safe_wr_cas_req1[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2w_sr-(2)));   
              safe_wr_cas_req1[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            end //} 
            else begin //{
              safe_wr_cas_req[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2w_dr-1));   
              safe_wr_cas_req[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TWTW[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_w2w_dr-1));   
              safe_wr_cas_req1[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTW[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2w_dr-(2)));   
              safe_wr_cas_req1[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TWTW[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_w2w_dr-(2)));   
            end //}
          end //}
     end//}
    safe_wrra_cas_req[i]  = &safe_wr_cas_req[i]; 
    safe_wrra_cas_req1[i] = &safe_wr_cas_req1[i]; 
   end //}
   else begin
     safe_wrra_cas_req[i]  = 'b0;
     safe_wr_cas_req[i]    = 'd0;
     safe_wrra_cas_req1[i] = 'b0;
     safe_wr_cas_req1[i]   = 'd0;
   end
end //}

//PREA
if(pre_all_req_rank)begin //{
 for(int i =0;i<NUM_OF_BGS;i++)begin //{
   for(int j =0;j<NUM_OF_BANKS;j++)begin //{
      safe_pre_all_req[(i* NUM_OF_BANKS) +j] =  (((dram_clock_count -  TRTP[ref_req_r][ref_req_lr][i][j]) >= (trtp-1)) && ((dram_clock_count -  TWR[ref_req_r][ref_req_lr][i][j]) >= (tcs_w2p-1)) && 
                                              ((dram_clock_count -  TRAS[ref_req_r][ref_req_lr][i][j]) >= (tras-1)));
      safe_pre_all_req1[(i* NUM_OF_BANKS) +j] = (((dram_clock_count -  TRTP[ref_req_r][ref_req_lr][i][j]) >= (trtp-(2))) && ((dram_clock_count -  TWR[ref_req_r][ref_req_lr][i][j]) >= (tcs_w2p-(2))) && 
                                              ((dram_clock_count -  TRAS[ref_req_r][ref_req_lr][i][j]) >= (tras-(2))));
   end //}  
 end //}
end //}
else begin 
  safe_pre_all_req = 'b0;
  safe_pre_all_req1 = 'b0;
end

// To determine if the txn in the TXNQ is qualified for safe timing check
// 1 RD- act,pre,cas - valid
//                   - if straved_mode is set check if its the straved transfer else dont proceed further else 
//                   - for act check if the page is closed
//                         pre check if the page is miss
//                         cas check if the page is hit
//                   - txn_write shouldnt be set
//                   - txn_read should be set
//                   - (not a bypass read as in read_hit_write and not a write hit by read(an original wr txn is modified to rd when ndm_rmw_flow is enabled))or
//                   - 2nd condition has to be checked again
//                   - if bypass then  
//                     - the corresponding wr is a partial wr hit by read then its rmw_rd phase should be done
//                     - the corresponding wr is not a partial wr
// 1a RD_ACT-  
for(int i =0;i<32;i++)begin//{
   if(TXNQ[i][`TXN_VAL] & ((starv_mode & starved_xfer[i]) | !starv_mode)  & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_CLOSE] & TXNQ[i][`TXN_READ] & !TXNQ[i][`TXN_WRITE] & !TXNQ[i][`TXN_BYP] & //no act is required for a bypass read
            ((!TXNQ[i][`TXN_PRW] & !na2dc_rret_almost_full  &(~write_arb_only | act_pre_es2_mode_en))  | //NONS80:Block full reads if na2dc_rret_almost_full/default:for a full read the wr_pri states will block
                         ( TXNQ[i][`TXN_PWR_DONE] & TXNQ[i][`TXN_PRW])//line#1538 // go through irrespective ofthe states
                         ))begin//{
     for(int j = 0;j<NUM_OF_BGS;j++)begin//{
       if(TXNQ[i][`TXN_GROUP] == j) begin
          safe_rd_act_req[i][j]  = (dram_clock_count - TRRD_L[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_l-1);
          safe_rd_act_req1[i][j] = (dram_clock_count - TRRD_L[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_l-(2));
       end
       else begin
          safe_rd_act_req[i][j] = (dram_clock_count - TRRD_S[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_s-1);
          safe_rd_act_req1[i][j] = (dram_clock_count - TRRD_S[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (trrd_s-(2));
       end
     end//}
     safe_rd_act_req[i][NUM_OF_BGS] = ((dram_clock_count - TRP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trp-1));   
     safe_rd_act_req1[i][NUM_OF_BGS] = ((dram_clock_count - TRP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trp-(2)));   
     for(int j = 0;j < NUM_OF_LRANKS;j++)begin//{
          if(NUM_OF_LRANKS == 1)begin //{   
            safe_rd_act_req[i][j+NUM_OF_BGS+1] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-1));   
            safe_rd_act_req1[i][j+NUM_OF_BGS+1] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-(2)));   
          end //}
          else begin //{
            if(TXNQ[i][`TXN_LRANK] == j) begin
              safe_rd_act_req[i][j+NUM_OF_BGS+1] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_slr-1));   
              safe_rd_act_req1[i][j+NUM_OF_BGS+1] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_slr-(2)));   
            end
            else begin
              safe_rd_act_req[i][j+NUM_OF_BGS+1] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_dlr-1));   
              safe_rd_act_req1[i][j+NUM_OF_BGS+1] = ((dram_clock_count - TRFC[TXNQ[i][`TXN_RANK]][j]) >= (trfc_dlr-(2)));   
            end
          end //}
     end //}
     for(int j = 0;j < NUM_OF_RANKS;j++)begin//{
        if(NUM_OF_RANKS == 1)begin //{   
            safe_rd_act_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-1));   
            safe_rd_act_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[0][0]) >= (trfc_slr-(2)));   
        end//}
          else begin //{
            if(TXNQ[i][`TXN_RANK] == j) begin
              safe_rd_act_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_slr-1));   
              safe_rd_act_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_slr-(2)));   
            end
            else begin
              safe_rd_act_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_r2r-1));   
              safe_rd_act_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRFC[j][TXNQ[i][`TXN_LRANK]]) >= (trfc_r2r-(2)));   
            end
          end //}
     end //}
          safe_rd_act_req[i][NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1] = (dram_clock_count - TACT[TXNQ[i][`TXN_RANK]][0]) >= (tfaw-1);
          safe_rd_act_req1[i][NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1] = (dram_clock_count - TACT[TXNQ[i][`TXN_RANK]][0])  >= (tfaw-2);
     for(int j = 0;j < NUM_OF_LRANKS;j++)begin//{
       if(TXNQ[i][`TXN_LRANK] != j)begin //{   
          safe_rd_act_req[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = (dram_clock_count - TRRD_DLR[TXNQ[i][`TXN_RANK]][j]) >= (trrd_dlr-1);
          safe_rd_act_req1[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = (dram_clock_count - TRRD_DLR[TXNQ[i][`TXN_RANK]][j])  >= (trrd_dlr-2);
       end //}
       else begin //{
          safe_rd_act_req[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1; //no need to check for same LR
          safe_rd_act_req1[i][1+NUM_OF_RANKS+NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1;
       end //}
     end//}
   safe_raom_act_req[i] = &safe_rd_act_req[i];
   safe_raom_act_req1[i] = &safe_rd_act_req1[i];
   end //}
 else begin //{ 
   safe_raom_act_req[i] = 'b0;
   safe_rd_act_req[i]   = 'd0; 
   safe_raom_act_req1[i] = 'b0;
   safe_rd_act_req1[i]   = 'd0; 
 end//}
   
end //}

for(int i =0;i<32;i++)begin//{
   if(TXNQ[i][`TXN_VAL] & ((starv_mode & starved_xfer[i]) | !starv_mode)  & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_MISS] & TXNQ[i][`TXN_READ] & !TXNQ[i][`TXN_WRITE] &
                        ((!TXNQ[i][`TXN_BYP] & !TXNQ[i][`TXN_PRW] & !na2dc_rret_almost_full) |  //NONS80:Block full reads if na2dc_rret_almost_full
                         (!TXNQ[i][`TXN_BYP] & TXNQ[i][`TXN_PARTIAL] & TXNQ[i][`TXN_PWR_DONE] & TXNQ[i][`TXN_PRW])  
                         ))begin//{
     //if((wr_rd_priority & (~(pending_hit[i]))) | !wr_rd_priority) begin//
     //if( (rd_priority & !rd_hit_pending[i]) ||  ((wr_rd_priority || write_arb_only) & !pending_hit[i]) || (starv_mode & starved_xfer[i]) ) begin//{
     if( (rd_priority & !rd_hit_pending[i]) ||  ((wr_rd_priority || write_arb_only) & !pending_hit[i]) || (starv_mode & starved_xfer[i])  || (act_pre_es2_mode_en & !rd_hit_pending[i]) ) begin//{
       safe_raom_pre_req[i] = (((dram_clock_count - TRAS[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tras-1)) &&
                             ((dram_clock_count -  TRTP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trtp-1)) &&
                             ((dram_clock_count -  TWR[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tcs_w2p-1)));
       safe_raom_pre_req1[i] = (((dram_clock_count - TRAS[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tras-(2))) &&
                             ((dram_clock_count -  TRTP[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trtp-(2))) &&
                             ((dram_clock_count -  TWR[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (tcs_w2p-(2))));
     end //}
     else begin 
       safe_raom_pre_req[i] = 'b0;
       safe_raom_pre_req1[i] = 'b0;
     end
   end//}
   else begin 
     safe_raom_pre_req[i] = 'b0;
     safe_raom_pre_req1[i] = 'b0;
   end
  
end //}

for(int i =0;i<32;i++)begin//{
if(TXNQ[i][`TXN_VAL] & ((starv_mode & starved_xfer[i]) | !starv_mode)  & !TXNQ[i][`TXN_REF_ZQ_STATUS] & TXNQ_REQ[i][`TXNQ_REQ_HIT] & TXNQ[i][`TXN_READ] & !TXNQ[i][`TXN_WRITE] &
                        ((!TXNQ[i][`TXN_BYP] & !TXNQ[i][`TXN_PRW]& !na2dc_rret_almost_full  &(~(write_arb_only & WR_any_pg_hit))) | 
                         (!TXNQ[i][`TXN_BYP] & TXNQ[i][`TXN_PARTIAL] & TXNQ[i][`TXN_PWR_DONE] & TXNQ[i][`TXN_PRW]& (~(write_arb_only & WR_any_pg_hit))) | 
                         (TXNQ[i][`TXN_BYP] & !na2dc_rret_almost_full & ((TXNQ[TXNQ[i][`TXN_BYP_ID]][`TXN_PRW] & TXNQ[TXNQ[i][`TXN_BYP_ID]][`TXN_RMW_RD_DONE]) | (!TXNQ[TXNQ[i][`TXN_BYP_ID]][`TXN_PARTIAL])))))begin//{
      safe_rd_cas_req[i][NUM_OF_BGS]  = ((dram_clock_count - TRCD[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trcd-1));
      safe_rd_cas_req1[i][NUM_OF_BGS] = ((dram_clock_count - TRCD[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][TXNQ[i][`TXN_GROUP]][TXNQ[i][`TXN_BANK]]) >= (trcd - (2)));
     for(int j = 0;j<NUM_OF_BGS;j++)begin//{ 
       if(TXNQ[i][`TXN_GROUP] == j) begin  
         safe_rd_cas_req[i][j] = (((dram_clock_count - TCCD_L[TXNQ[i][`TXN_RANK]][j]) >= (tccd_l_sr-1)) && 
                                 ((dram_clock_count - TWTR_L[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (tcs_w2r_l_sr-1))) ; 
         safe_rd_cas_req1[i][j] = (((dram_clock_count - TCCD_L[TXNQ[i][`TXN_RANK]][j]) >= (tccd_l_sr-(2))) && 
                                 ((dram_clock_count - TWTR_L[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (tcs_w2r_l_sr-(2)))) ; 
       end
       else begin   
         safe_rd_cas_req[i][j] = (((dram_clock_count - TCCD_S[TXNQ[i][`TXN_RANK]][j]) >= (tccd_s_sr-1)) && 
                                 ((dram_clock_count - TWTR_S[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (tcs_w2r_s_sr-1))) ; 
         safe_rd_cas_req1[i][j] = (((dram_clock_count - TCCD_S[TXNQ[i][`TXN_RANK]][j]) >= (tccd_s_sr-(2))) && 
                                 ((dram_clock_count - TWTR_S[TXNQ[i][`TXN_RANK]][TXNQ[i][`TXN_LRANK]][j]) >= (tcs_w2r_s_sr-(2)))) ; 
       end
     end//}
     for(int j = 0;j < NUM_OF_LRANKS;j++)begin//{
          if(NUM_OF_LRANKS == 1)begin //{   
            safe_rd_cas_req[i][NUM_OF_BGS+1+j] = 1'b1;   
            safe_rd_cas_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_rd_cas_req1[i][NUM_OF_BGS+1+j] = 1'b1;   
            safe_rd_cas_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
          end //}
          else begin //{
            if(TXNQ[i][`TXN_LRANK] == j)begin //{
              safe_rd_cas_req[i][NUM_OF_BGS+1+j] = 1'b1;   
              safe_rd_cas_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
              safe_rd_cas_req1[i][NUM_OF_BGS+1+j] = 1'b1;   
              safe_rd_cas_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            end //} 
            else begin //{
              safe_rd_cas_req[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TWTR_SR_DLR[TXNQ[i][`TXN_RANK]][j]) >= (tcs_w2r_sr_dlr-1));   
              safe_rd_cas_req[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTR[TXNQ[i][`TXN_RANK]][j]) >= (tcs_r2r_sr_dlr-1));   
              safe_rd_cas_req1[i][NUM_OF_BGS+1+j] = ((dram_clock_count - TWTR_SR_DLR[TXNQ[i][`TXN_RANK]][j]) >= (tcs_w2r_sr_dlr-(2)));   
              safe_rd_cas_req1[i][NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTR[TXNQ[i][`TXN_RANK]][j]) >= (tcs_r2r_sr_dlr-(2)));   
            end //}
          end //}
     end //}
     for(int j = 0;j < NUM_OF_RANKS;j++)begin//{
        if(NUM_OF_RANKS == 1)begin //{   
            safe_rd_cas_req[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_rd_cas_req[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_rd_cas_req1[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            safe_rd_cas_req1[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
        end//}
          else begin //{
            if(TXNQ[i][`TXN_RANK] == j)begin//{
              safe_rd_cas_req[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
              safe_rd_cas_req[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
              safe_rd_cas_req1[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
              safe_rd_cas_req1[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = 1'b1;   
            end //}
            else begin //{ 
              safe_rd_cas_req[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TWTR_DR[j]) >= (tcs_w2r_dr-1));   
              safe_rd_cas_req[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTR[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2r_dr-1));   
              safe_rd_cas_req1[i][2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TWTR_DR[j]) >= (tcs_w2r_dr-(2)));   
              safe_rd_cas_req1[i][NUM_OF_RANKS+2*NUM_OF_LRANKS+NUM_OF_BGS+1+j] = ((dram_clock_count - TRTR[j][TXNQ[i][`TXN_LRANK]]) >= (tcs_r2r_dr-(2)));   
            end //}
          end //}
     end//}
    safe_raom_cas_req[i]  = &safe_rd_cas_req[i]; 
    safe_raom_cas_req1[i] = &safe_rd_cas_req1[i]; 
   end //}
   else begin 
     safe_raom_cas_req[i] = 'b0;
     safe_rd_cas_req[i]   = 'd0;
     safe_raom_cas_req1[i] = 'b0;
     safe_rd_cas_req1[i]   = 'd0;
   end
end //}


  safe_wrra_act_req1_true = safe_wrra_act_req1;
  safe_wrra_cas_req1_true = safe_wrra_cas_req1;
  safe_wrra_pre_req1_true = safe_wrra_pre_req1;
  safe_raom_act_req1_true = safe_raom_act_req1;
  safe_raom_cas_req1_true = safe_raom_cas_req1;
  safe_raom_pre_req1_true = safe_raom_pre_req1;

win_act1 = 0;
n_count1 = count1;
wrra_act_won = 0;
wrra_act_won1 = 0;
safe_wrra_act_req_temp = safe_wrra_act_req | safe_wrra_act_req1_true;
for(int r=1; r <= 32; r++)begin//{
  if(safe_wrra_act_req_temp[(count1+r)%32]) begin//{
    n_count1 = (count1+r)%32;
    win_act1[n_count1] = 1;
    break;
  end//}
end//}
if     (safe_wrra_act_req[n_count1])       begin wrra_act_won  = {win_act1[n_count1],n_count1}; n_count = n_count1;end
else if(safe_wrra_act_req1_true[n_count1]) begin wrra_act_won1 = {win_act1[n_count1],n_count1}; end

win_pre1 = 0;
n_count_pre1 = count_pre1;
wrra_pre_won = 0;
wrra_pre_won1 = 0;
safe_wrra_pre_req_temp = safe_wrra_pre_req | safe_wrra_pre_req1_true;
for(int r=1; r <= 32; r++)begin//{
  if(safe_wrra_pre_req_temp[(count_pre1+r)%32]) begin//{
    n_count_pre1 = (count_pre1+r)%32;
    win_pre1[n_count_pre1] = 1;
    break;
  end//}
end//}
if     (safe_wrra_pre_req[n_count_pre1])      begin wrra_pre_won  = {win_pre1[n_count_pre1],n_count_pre1}; n_count_pre = n_count_pre1; end
else if(safe_wrra_pre_req1_true[n_count_pre1]) wrra_pre_won1 = {win_pre1[n_count_pre1],n_count_pre1}; 

win_cas1 = 0;
n_count_cas1 = count_cas1;
wrra_cas_won = 0;
wrra_cas_won1 = 0;
safe_wrra_cas_req_temp = safe_wrra_cas_req | safe_wrra_cas_req1_true;
for(int r=1; r <= 32; r++)begin//{
  if(safe_wrra_cas_req_temp[(count_cas1+r)%32]) begin//{
    n_count_cas1 = (count_cas1+r)%32;
    win_cas1[n_count_cas1] = 1;
    break;
  end//}
end//}
if     (safe_wrra_cas_req[n_count_cas1])     begin  wrra_cas_won  = {win_cas1[n_count_cas1],n_count_cas1}; n_count_cas = n_count_cas1;end
else if(safe_wrra_cas_req1_true[n_count_cas1]) wrra_cas_won1 = {win_cas1[n_count_cas1],n_count_cas1}; 

  rin_act1 = 0;        
  raom_act_won = 0;
  raom_act_won1 = 0;
  safe_raom_act_req_temp = safe_raom_act_req | safe_raom_act_req1_true;
  for(int n=0; n <= 31; n++) begin //{
    if (safe_raom_act_req_temp[n]) begin  //{
      for (int m = 0; m <=31; m++) begin  //{
        if (((TXNQ_T[n] <= TXNQ_T[m]) & safe_raom_act_req_temp[m]) | (!safe_raom_act_req_temp[m]))
          valid_act1[n][m] = 1'b1;
        else 
          valid_act1[n][m] = 1'b0;
      end //}
    end //}
    else 
      valid_act1[n] = 32'b0;
    if (&valid_act1[n]) begin //{
      n_count_rd1 = n;
      rin_act1[n] = &valid_act1[n];
      break;
    end //}
  end //}
  if     (safe_raom_act_req[n_count_rd1])     begin raom_act_won  = {rin_act1[n_count_rd1],n_count_rd1}; n_count_rd = n_count_rd1;end
  else if(safe_raom_act_req1_true[n_count_rd1])raom_act_won1 = {rin_act1[n_count_rd1],n_count_rd1}; 

  rin_pre1 = 0;                                     
  raom_pre_won = 0;
  raom_pre_won1 = 0;
  safe_raom_pre_req_temp = safe_raom_pre_req | safe_raom_pre_req1_true;
  for(int n=0; n <= 31; n++) begin //{
    if (safe_raom_pre_req_temp[n]) begin  //{
      for (int m = 0; m <=31; m++) begin  //{
        if (((TXNQ_T[n] <= TXNQ_T[m]) & safe_raom_pre_req_temp[m]) | (!safe_raom_pre_req_temp[m]))
          valid_pre1[n][m] = 1'b1;
        else 
          valid_pre1[n][m] = 1'b0;
      end //}
    end //}
    else 
      valid_pre1[n] = 32'b0;
    if (&valid_pre1[n]) begin //{
      n_count_pre_rd1 = n;
      rin_pre1[n] = &valid_pre1[n];
      break;
    end //}
  end //}
  if     (safe_raom_pre_req[n_count_pre_rd1])    begin  raom_pre_won  = {rin_pre1[n_count_pre_rd1],n_count_pre_rd1}; n_count_pre_rd = n_count_pre_rd1; end
  else if(safe_raom_pre_req1_true[n_count_pre_rd1])raom_pre_won1 = {rin_pre1[n_count_pre_rd1],n_count_pre_rd1}; 

  rin_cas1 = 0;                                     
  raom_cas_won = 0;
  raom_cas_won1 = 0;
  safe_raom_cas_req_temp = safe_raom_cas_req | safe_raom_cas_req1_true;
  for(int n=0; n <= 31; n++) begin //{
    if (safe_raom_cas_req_temp[n]) begin  //{
      for (int m = 0; m <=31; m++) begin  //{
        if (((TXNQ_T[n] <= TXNQ_T[m]) & safe_raom_cas_req_temp[m]) | (!safe_raom_cas_req_temp[m]))
          valid_cas1[n][m] = 1'b1;
        else 
          valid_cas1[n][m] = 1'b0;
      end //}
    end //}
    else 
      valid_cas1[n] = 32'b0;
    if (&valid_cas1[n]) begin //{
      n_count_cas_rd1 = n;
      rin_cas1[n] = &valid_cas1[n];
      break;
    end //}
  end //}
  if     (safe_raom_cas_req[n_count_cas_rd1])     begin raom_cas_won  = {rin_cas1[n_count_cas_rd1],n_count_cas_rd1}; n_count_cas_rd = n_count_cas_rd1; end
  else if(safe_raom_cas_req1_true[n_count_cas_rd1])raom_cas_won1 = {rin_cas1[n_count_cas_rd1],n_count_cas_rd1}; 

if(wr_count > write_level_hi)
  wr_count_stat = 1'b1;
if(wr_count_stat && ( write_level_lo <= wr_count < write_level_hi))
  wr_count_stat_1 = 1'b1;
  else 
  wr_count_stat_1 = 1'b0;
if(wr_count <  write_level_lo )
  wr_count_stat = 1'b0;

  farb_rd_won = 1'b0;
  farb_act_won = 1'b0;
  farb_pre_won = 1'b0;
  farb_ref_won = 1'b0;
  farb_pre_all_won = 1'b0;
  
  farb_wr_won_slot0 = 1'b0;
  farb_rd_won_slot0 = 1'b0;
  farb_act_slot0 = 1'b0;
  farb_pre_slot0 = 1'b0;
  farb_cas_slot0 = 1'b0;
  farb_pre_all_slot0 = 1'b0;
  farb_ref_slot0 = 1'b0;
  farb_id_slot0  = 'd0;
  access_id      = 'd0;

  farb_wr_won_slot1 = 1'b0;
  farb_rd_won_slot1 = 1'b0;
  farb_act_slot1 = 1'b0;
  farb_pre_slot1 = 1'b0;
  farb_cas_slot1 = 1'b0;
  farb_pre_all_slot1 = 1'b0;
  farb_ref_slot1 = 1'b0;
  farb_id_slot1 = 'd0;
  access_id_slot1     = 'd0;

  block_rd_pre_slot0 = 'b0; 
  block_wr_pre_slot0 = 'b0; 

  block_wr_act_slot1 = 'b0;
  block_rd_act_slot1 = 'b0; 
  block_wr_pre_slot1 = 'b0; 
  block_rd_pre_slot1 = 'b0; 
  block_same_pg_wr_pre_slot1 = 'b0; 
  block_same_pg_rd_pre_slot1 = 'b0; 
  
  block_same_rd_pre_slot1 = 'b0;
  block_same_wr_act_slot1 = 'b0;
  block_same_wr_pre_slot1 = 'b0;
  block_same_rd_act_slot1 = 'b0;
///CR-1073983 : FARB priority is wrongly executed in the simulation. Since the TXNQ FSM logic is changed as a part of recent SKIP FSM changes, wr_count_stat_1 (FARB selection signal) calculated separately out of the FSM logic is wrong. Leveraging the farb_wr_priority signal from TXNQ FSM and using for final arbitration.
  //`ifndef BFM_SIMULATION  
  //   if(wr_count_stat_1)begin//{
  //`else
     if(farb_wr_priority)begin 
  //`endif
       if(wrra_cas_won[5])begin //{
         farb_wr_won_slot0 = 1'b1;
         farb_cas_slot0    = 1'b1;
         farb_id_slot0     = wrra_cas_won[4:0];
       end//}
       else if(raom_cas_won[5])begin //{
         farb_rd_won_slot0  = 1'b1;
         farb_cas_slot0     = 1'b1;
         farb_id_slot0      = raom_cas_won[4:0];
       PHY_FIFO_RDEN[farb_id_slot0] = mc_clock_count -2;
       end //}
       else if(wrra_cas_won1[5])begin //{
         farb_wr_won_slot1        = 1'b1;
         farb_cas_slot1           = 1'b1;
         farb_id_slot1      = wrra_cas_won1[4:0];
       end//}
       else if(raom_cas_won1[5])begin //{
         farb_rd_won_slot1        = 1'b1;
         farb_cas_slot1           = 1'b1;
         farb_id_slot1      = raom_cas_won1[4:0];
       PHY_FIFO_RDEN[farb_id_slot1] = mc_clock_count -2;
       end //}

       
       if (farb_cas_slot0)  begin
         if (({TXNQ[farb_id_slot0][`TXN_GROUP],TXNQ[farb_id_slot0][`TXN_BANK],TXNQ[farb_id_slot0][`TXN_RANK],TXNQ[farb_id_slot0][`TXN_LRANK]} == {TXNQ[n_count_pre_rd1][`TXN_GROUP],TXNQ[n_count_pre_rd1][`TXN_BANK],TXNQ[n_count_pre_rd1][`TXN_RANK],TXNQ[n_count_pre_rd1][`TXN_LRANK]}) & raom_pre_won1[5]) 
           block_rd_pre_slot1 = 1'b1;
         if (({TXNQ[farb_id_slot0][`TXN_GROUP],TXNQ[farb_id_slot0][`TXN_BANK],TXNQ[farb_id_slot0][`TXN_RANK],TXNQ[farb_id_slot0][`TXN_LRANK]} == {TXNQ[n_count_pre1][`TXN_GROUP],TXNQ[n_count_pre1][`TXN_BANK],TXNQ[n_count_pre1][`TXN_RANK],TXNQ[n_count_pre1][`TXN_LRANK]}) & wrra_pre_won1[5]) 
           block_wr_pre_slot1 = 1'b1;
       end
       else if (farb_cas_slot1)  begin
         if (({TXNQ[farb_id_slot1][`TXN_GROUP],TXNQ[farb_id_slot1][`TXN_BANK],TXNQ[farb_id_slot1][`TXN_RANK],TXNQ[farb_id_slot1][`TXN_LRANK]} == {TXNQ[n_count_pre_rd][`TXN_GROUP],TXNQ[n_count_pre_rd][`TXN_BANK],TXNQ[n_count_pre_rd][`TXN_RANK],TXNQ[n_count_pre_rd][`TXN_LRANK]}) & raom_pre_won[5]) 
           block_rd_pre_slot0 = 1'b1;
         if (({TXNQ[farb_id_slot1][`TXN_GROUP],TXNQ[farb_id_slot1][`TXN_BANK],TXNQ[farb_id_slot1][`TXN_RANK],TXNQ[farb_id_slot1][`TXN_LRANK]} == {TXNQ[n_count_pre][`TXN_GROUP],TXNQ[n_count_pre][`TXN_BANK],TXNQ[n_count_pre][`TXN_RANK],TXNQ[n_count_pre][`TXN_LRANK]}) & wrra_pre_won[5]) 
           block_wr_pre_slot0 = 1'b1;
       end

       if (!farb_cas_slot0) begin //{
         if(&safe_pre_all_req)begin //{
           farb_pre_all_won = 1'b1;
           farb_pre_all_slot0 = 1'b1;
           farb_pre_all_slot1 = 1'b0;
         end //}
         else if(|ref_req_rank)begin //{
           farb_ref_won = 1'b1;
           farb_ref_slot0 = 1'b1;
           farb_ref_slot1 = 1'b0;
         end //}
         else if(wrra_act_won[5])begin//{
           farb_act_won = 1'b1;
           farb_act_slot0 = 1'b1;
           access_id = wrra_act_won[4:0];
         end //}
         else if(wrra_pre_won[5] & ~block_wr_pre_slot0)begin//{
           farb_pre_won = 1'b1;
           farb_pre_slot0 = 1'b1;
           access_id = wrra_pre_won[4:0];
         end//}
         else if(raom_act_won[5])begin//{
           farb_act_won = 1'b1;
           farb_act_slot0 = 1'b1;
           access_id = raom_act_won[4:0];
         end//}
         else if(raom_pre_won[5] & ~block_rd_pre_slot0)begin//{
           farb_pre_won = 1'b1;
           farb_pre_slot0 = 1'b1;
           access_id = raom_pre_won[4:0];
         end//}
         if (farb_act_slot0) begin
           if ((TXNQ[access_id][`TXN_RANK] == TXNQ[n_count_rd1][`TXN_RANK]) & raom_act_won1[5]) begin
             block_rd_act_slot1 = 1'b1;
           end
           if ((TXNQ[access_id][`TXN_RANK] == TXNQ[n_count1][`TXN_RANK]) & wrra_act_won1[5]) begin
             block_wr_act_slot1 = 1'b1;
           end
         end
       end //}
       
       if (farb_act_slot0 & wrra_act_won[5] & wrra_act_won1[5] & (n_count1 == n_count)) begin
         block_same_wr_act_slot1 = 1'b1;
       end
       if (farb_act_slot0 & raom_act_won[5] & raom_act_won1[5] & (n_count_rd1 == n_count_rd)) begin
         block_same_rd_act_slot1 = 1'b1;
       end
 
       if (farb_pre_slot0 & wrra_pre_won[5] & wrra_pre_won1[5] & (n_count_pre1 == n_count_pre)) begin
         block_same_wr_pre_slot1 = 1'b1;
       end
       if (farb_pre_slot0 & raom_pre_won[5] & raom_pre_won1[5] & (n_count_pre_rd1 == n_count_pre_rd)) begin
         block_same_rd_pre_slot1 = 1'b1;
       end
       if (farb_pre_slot0 & wrra_pre_won1[5] & (TXNQ[access_id][`TXN_GROUP] == TXNQ[wrra_pre_won1[4:0]][`TXN_GROUP]) & (TXNQ[access_id][`TXN_BANK] == TXNQ[wrra_pre_won1[4:0]][`TXN_BANK])) begin
         block_same_pg_wr_pre_slot1 = 1'b1;
       end
       if (farb_pre_slot0 & raom_pre_won1[5] & (TXNQ[access_id][`TXN_GROUP] == TXNQ[raom_pre_won1[4:0]][`TXN_GROUP]) & (TXNQ[access_id][`TXN_BANK] == TXNQ[raom_pre_won1[4:0]][`TXN_BANK])) begin
         block_same_pg_rd_pre_slot1 = 1'b1;
       end

       if (!farb_cas_slot1) begin //{
         if(&safe_pre_all_req1 & ~farb_pre_all_slot0)begin //{
           farb_pre_all_won = 1'b1;
           farb_pre_all_slot0 = 1'b0;
           farb_pre_all_slot1 = 1'b1;
         end //}
         else if(|ref_req_rank & ~farb_ref_slot0)begin //{
           farb_ref_won = 1'b1;
           farb_ref_slot0 = 1'b0;
           farb_ref_slot1 = 1'b1;
         end //}
         else if(wrra_act_won1[5] & ~block_wr_act_slot1 & ~block_same_wr_act_slot1)begin//{
           farb_act_won     = 1'b1;
           farb_act_slot1   = 1'b1;
           access_id_slot1  = wrra_act_won1[4:0];
         end //}
         else if(wrra_pre_won1[5] & ~block_wr_pre_slot1 & ~block_same_pg_wr_pre_slot1 & ~block_same_wr_pre_slot1)begin//{
           farb_pre_won     = 1'b1;
           farb_pre_slot1   = 1'b1;
           access_id_slot1  = wrra_pre_won1[4:0];
         end//}
         else if(raom_act_won1[5] & ~block_rd_act_slot1 & ~block_same_rd_act_slot1)begin//{
           farb_act_won     = 1'b1;
           farb_act_slot1   = 1'b1;
           access_id_slot1  = raom_act_won1[4:0];
         end//}
         else if(raom_pre_won1[5] & ~block_rd_pre_slot1 & ~block_same_pg_rd_pre_slot1 & ~block_same_rd_pre_slot1)begin//{
           farb_pre_won     = 1'b1;
           farb_pre_slot1   = 1'b1;
           access_id_slot1  = raom_pre_won1[4:0];
         end//}
       end //}

end//}
else begin //{

       if(raom_cas_won[5])begin //{
         farb_rd_won_slot0  = 1'b1;
         farb_cas_slot0     = 1'b1;
         farb_id_slot0      = raom_cas_won[4:0];
       PHY_FIFO_RDEN[farb_id_slot0] = mc_clock_count - 2;
       end //}
       else if(wrra_cas_won[5])begin //{
         farb_wr_won_slot0 = 1'b1;
         farb_cas_slot0    = 1'b1;
         farb_id_slot0     = wrra_cas_won[4:0];
       end//}
       else if(raom_cas_won1[5])begin //{
         farb_rd_won_slot1        = 1'b1;
         farb_cas_slot1           = 1'b1;
         farb_id_slot1      = raom_cas_won1[4:0];
       PHY_FIFO_RDEN[farb_id_slot1] = mc_clock_count-2;
       end //}
       else if(wrra_cas_won1[5])begin //{
         farb_wr_won_slot1        = 1'b1;
         farb_cas_slot1           = 1'b1;
         farb_id_slot1      = wrra_cas_won1[4:0];
       end//}

       
       if (farb_cas_slot0)  begin
         if (({TXNQ[farb_id_slot0][`TXN_GROUP],TXNQ[farb_id_slot0][`TXN_BANK],TXNQ[farb_id_slot0][`TXN_RANK],TXNQ[farb_id_slot0][`TXN_LRANK]} == {TXNQ[n_count_pre_rd1][`TXN_GROUP],TXNQ[n_count_pre_rd1][`TXN_BANK],TXNQ[n_count_pre_rd1][`TXN_RANK],TXNQ[n_count_pre_rd1][`TXN_LRANK]}) & raom_pre_won1[5]) 
           block_rd_pre_slot1 = 1'b1;
         if (({TXNQ[farb_id_slot0][`TXN_GROUP],TXNQ[farb_id_slot0][`TXN_BANK],TXNQ[farb_id_slot0][`TXN_RANK],TXNQ[farb_id_slot0][`TXN_LRANK]} == {TXNQ[n_count_pre1][`TXN_GROUP],TXNQ[n_count_pre1][`TXN_BANK],TXNQ[n_count_pre1][`TXN_RANK],TXNQ[n_count_pre1][`TXN_LRANK]}) & wrra_pre_won1[5]) 
           block_wr_pre_slot1 = 1'b1;
       end
       else if (farb_cas_slot1)  begin
         if (({TXNQ[farb_id_slot1][`TXN_GROUP],TXNQ[farb_id_slot1][`TXN_BANK],TXNQ[farb_id_slot1][`TXN_RANK],TXNQ[farb_id_slot1][`TXN_LRANK]} == {TXNQ[n_count_pre_rd][`TXN_GROUP],TXNQ[n_count_pre_rd][`TXN_BANK],TXNQ[n_count_pre_rd][`TXN_RANK],TXNQ[n_count_pre_rd][`TXN_LRANK]}) & raom_pre_won[5]) 
           block_rd_pre_slot0 = 1'b1;
         if (({TXNQ[farb_id_slot1][`TXN_GROUP],TXNQ[farb_id_slot1][`TXN_BANK],TXNQ[farb_id_slot1][`TXN_RANK],TXNQ[farb_id_slot1][`TXN_LRANK]} == {TXNQ[n_count_pre][`TXN_GROUP],TXNQ[n_count_pre][`TXN_BANK],TXNQ[n_count_pre][`TXN_RANK],TXNQ[n_count_pre][`TXN_LRANK]}) & wrra_pre_won[5]) 
           block_wr_pre_slot0 = 1'b1;
       end

       if (!farb_cas_slot0) begin //{
         if(&safe_pre_all_req)begin //{
           farb_pre_all_won = 1'b1;
           farb_pre_all_slot0 = 1'b1;
           farb_pre_all_slot1 = 1'b0;
         end //}
         else if(|ref_req_rank)begin //{
           farb_ref_won = 1'b1;
           farb_ref_slot0 = 1'b1;
           farb_ref_slot1 = 1'b0;
         end //}
         else if(raom_act_won[5])begin//{
           farb_act_won = 1'b1;
           farb_act_slot0 = 1'b1;
           access_id = raom_act_won[4:0];
         end//}
         else if(raom_pre_won[5] & ~block_rd_pre_slot0)begin//{
           farb_pre_won = 1'b1;
           farb_pre_slot0 = 1'b1;
           access_id = raom_pre_won[4:0];
         end//}
         else if(wrra_act_won[5])begin//{
           farb_act_won = 1'b1;
           farb_act_slot0 = 1'b1;
           access_id = wrra_act_won[4:0];
         end //}
         else if(wrra_pre_won[5] & ~block_wr_pre_slot0)begin//{
           farb_pre_won = 1'b1;
           farb_pre_slot0 = 1'b1;
           access_id = wrra_pre_won[4:0];
         end//}
 
         if (farb_act_slot0) begin
           if ((TXNQ[access_id][`TXN_RANK] == TXNQ[n_count_rd1][`TXN_RANK]) & raom_act_won1[5]) begin
             block_rd_act_slot1 = 1'b1;
           end
           if ((TXNQ[access_id][`TXN_RANK] == TXNQ[n_count1][`TXN_RANK]) & wrra_act_won1[5]) begin
             block_wr_act_slot1 = 1'b1;
           end
         end
       end //}
       
       if (farb_act_slot0 & wrra_act_won[5] & wrra_act_won1[5] & (n_count1 == n_count)) begin
         block_same_wr_act_slot1 = 1'b1;
       end
       if (farb_act_slot0 & raom_act_won[5] & raom_act_won1[5] & (n_count_rd1 == n_count_rd)) begin
         block_same_rd_act_slot1 = 1'b1;
       end
 
       if (farb_pre_slot0 & wrra_pre_won[5] & wrra_pre_won1[5] & (n_count_pre1 == n_count_pre)) begin
         block_same_wr_pre_slot1 = 1'b1;
       end
       if (farb_pre_slot0 & raom_pre_won[5] & raom_pre_won1[5] & (n_count_pre_rd1 == n_count_pre_rd)) begin
         block_same_rd_pre_slot1 = 1'b1;
       end

       if (farb_pre_slot0 & wrra_pre_won1[5] & (TXNQ[access_id][`TXN_GROUP] == TXNQ[wrra_pre_won1[4:0]][`TXN_GROUP]) & (TXNQ[access_id][`TXN_BANK] == TXNQ[wrra_pre_won1[4:0]][`TXN_BANK])) begin
         block_same_pg_wr_pre_slot1 = 1'b1;
       end
       if (farb_pre_slot0 & raom_pre_won1[5] & (TXNQ[access_id][`TXN_GROUP] == TXNQ[raom_pre_won1[4:0]][`TXN_GROUP]) & (TXNQ[access_id][`TXN_BANK] == TXNQ[raom_pre_won1[4:0]][`TXN_BANK])) begin
         block_same_pg_rd_pre_slot1 = 1'b1;
       end

       if (!farb_cas_slot1) begin //{
         if(&safe_pre_all_req1 & ~farb_pre_all_slot0)begin //{
           farb_pre_all_won = 1'b1;
           farb_pre_all_slot0 = 1'b0;
           farb_pre_all_slot1 = 1'b1;
         end //}
         else if(|ref_req_rank & ~farb_ref_slot0)begin //{
           farb_ref_won = 1'b1;
           farb_ref_slot0 = 1'b0;
           farb_ref_slot1 = 1'b1;
         end //}
         else if(raom_act_won1[5] & ~block_rd_act_slot1 & ~block_same_rd_act_slot1)begin//{
           farb_act_won     = 1'b1;
           farb_act_slot1   = 1'b1;
           access_id_slot1  = raom_act_won1[4:0];
         end//}
         else if(raom_pre_won1[5] & ~block_rd_pre_slot1 & ~block_same_pg_rd_pre_slot1 & ~block_same_rd_pre_slot1)begin//{
           farb_pre_won     = 1'b1;
           farb_pre_slot1   = 1'b1;
           access_id_slot1  = raom_pre_won1[4:0];
         end//}
         else if(wrra_act_won1[5] & ~block_wr_act_slot1 & ~block_same_wr_act_slot1)begin//{
           farb_act_won     = 1'b1;
           farb_act_slot1   = 1'b1;
           access_id_slot1  = wrra_act_won1[4:0];
         end //}
         else if(wrra_pre_won1[5] & ~block_wr_pre_slot1 & ~block_same_pg_wr_pre_slot1 & ~block_same_wr_pre_slot1)begin//{
           farb_pre_won     = 1'b1;
           farb_pre_slot1   = 1'b1;
           access_id_slot1  = wrra_pre_won1[4:0];
         end//}
       end //}

 
end //}
farb_rank_slot0     = (farb_act_slot0 | farb_pre_slot0) ? TXNQ[access_id][`TXN_RANK]  :(farb_cas_slot0 ? TXNQ[farb_id_slot0][`TXN_RANK]  :(farb_pre_all_slot0 ? ref_req_r :(farb_ref_slot0 ? ref_req_r : {RANK_WIDTH{1'b1}})));
farb_lrank_slot0    = (farb_act_slot0 | farb_pre_slot0) ? TXNQ[access_id][`TXN_LRANK] :(farb_cas_slot0 ? TXNQ[farb_id_slot0][`TXN_LRANK] :(farb_pre_all_slot0 ? ref_req_lr :(farb_ref_slot0 ? ref_req_lr :{LRANK_WIDTH{1'b1}})));
farb_bg_slot0       = (farb_act_slot0 | farb_pre_slot0) ? TXNQ[access_id][`TXN_GROUP] :(farb_cas_slot0 ? TXNQ[farb_id_slot0][`TXN_GROUP] : {BANK_GROUP_WIDTH{1'b1}});
farb_bank_slot0     = (farb_act_slot0 | farb_pre_slot0) ? TXNQ[access_id][`TXN_BANK]  :(farb_cas_slot0 ? TXNQ[farb_id_slot0][`TXN_BANK]  : {BANK_WIDTH{1'b1}}      );
farb_addr_slot0     = (farb_act_slot0 | farb_pre_slot0) ? TXNQ[access_id][`TXN_ROW]   :(farb_cas_slot0 ? TXNQ[farb_id_slot0][`TXN_COL]   : {ADDR_WIDTH{1'b1}}      );
farb_bypass_slot0   = (farb_act_slot0 | farb_pre_slot0) ? TXNQ[access_id][`TXN_BYP]   :(farb_cas_slot0 ? TXNQ[farb_id_slot0][`TXN_BYP]   : 1'b0                    );

farb_rank_slot1     = (farb_act_slot1 | farb_pre_slot1) ? TXNQ[access_id_slot1][`TXN_RANK]  :(farb_cas_slot1 ? TXNQ[farb_id_slot1][`TXN_RANK]  :(farb_pre_all_slot1 ? ref_req_r :(farb_ref_slot1 ? ref_req_r:{RANK_WIDTH{1'b1}})));
farb_lrank_slot1    = (farb_act_slot1 | farb_pre_slot1) ? TXNQ[access_id_slot1][`TXN_LRANK] :(farb_cas_slot1 ? TXNQ[farb_id_slot1][`TXN_LRANK] :(farb_pre_all_slot1 ? ref_req_lr : (farb_ref_slot1 ? ref_req_lr :{LRANK_WIDTH{1'b1}})));
farb_bg_slot1       = (farb_act_slot1 | farb_pre_slot1) ? TXNQ[access_id_slot1][`TXN_GROUP] :(farb_cas_slot1 ? TXNQ[farb_id_slot1][`TXN_GROUP] : {BANK_GROUP_WIDTH{1'b1}});
farb_bank_slot1     = (farb_act_slot1 | farb_pre_slot1) ? TXNQ[access_id_slot1][`TXN_BANK]  :(farb_cas_slot1 ? TXNQ[farb_id_slot1][`TXN_BANK]  : {BANK_WIDTH{1'b1}}      );
farb_addr_slot1     = (farb_act_slot1 | farb_pre_slot1) ? TXNQ[access_id_slot1][`TXN_ROW]   :(farb_cas_slot1 ? TXNQ[farb_id_slot1][`TXN_COL]   : {ADDR_WIDTH{1'b1}}      );
farb_bypass_slot1   = (farb_act_slot1 | farb_pre_slot1) ? TXNQ[access_id_slot1][`TXN_BYP]   :(farb_cas_slot1 ? TXNQ[farb_id_slot1][`TXN_BYP]   : 1'b0                    );
-> farb_done;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
end//}
`RST_DMC_DFLOP(n_count, count, 0 )
`RST_DMC_DFLOP(n_count_pre, count_pre, 0 )
`RST_DMC_DFLOP(n_count_cas, count_cas, 0 )

`RST_DMC_DFLOP(n_count1, count1, 0 )
`RST_DMC_DFLOP(n_count_pre1, count_pre1, 0 )
`RST_DMC_DFLOP(n_count_cas1, count_cas1, 0 )

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 always@(posedge mc_clk)begin//{
  if(mc_rst)begin//{
    wr_data_1       <=  {WDB_DATA_WIDTH{1'b0}};
    wr_data_2       <=  {WDB_DATA_WIDTH{1'b0}};
    wr_data_en_1    <=  {WDB_DM_WIDTH{1'b0}};
    wr_data_en_2    <=  {WDB_DM_WIDTH{1'b0}};
    wr_data_s1_1    <=  {WDB_DATA_WIDTH{1'b0}};
    wr_data_s1_2    <=  {WDB_DATA_WIDTH{1'b0}};
    wr_data_en_s1_1 <=  {WDB_DM_WIDTH{1'b0}};
    wr_data_en_s1_2 <=  {WDB_DM_WIDTH{1'b0}};
  end //}
  else begin//{
    wr_data_1    <=     wr_data;
    wr_data_2    <=     wr_data_1;
    wr_data_s1_1 <=     wr_data; 
    wr_data_s1_2 <=     wr_data_s1_1; 
    wr_data_en_1 <=     byte_en;
    wr_data_en_2 <=     wr_data_en_1;
    wr_data_en_s1_1 <=  byte_en;
    wr_data_en_s1_2 <=  wr_data_en_s1_1;
  end//}
end//}

assign mcal_DQSOut = 4'b0101; 
assign mcal_DQSOut_c = 4'b1010; 

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
localparam
    S_RECONFIG = 6'h00
   ,S_RD    = 6'h01
   ,S_RESET = 6'h02
   ,S_WAIT  = 6'h03
   ,S_ERROR = 6'h04
   ,S_CKEON = 6'h05
   ,S_MR3   = 6'h06
   ,S_MR6   = 6'h07
   ,S_MR5   = 6'h08
   ,S_MR4   = 6'h09
   ,S_MR2   = 6'h0A
   ,S_MR1   = 6'h0B
   ,S_MR0   = 6'h0C
   ,S_ZQCL  = 6'h0D
   ,S_GOGO  = 6'h0F;

localparam
    MRS   = 3'b000
   ,REF   = 3'b001
   ,PRE   = 3'b010
   ,ACT   = 3'b011
   ,WR    = 3'b100
   ,RD    = 3'b101
   ,ZQC   = 3'b110
   ,NOP   = 3'b111;

reg  [5:0] MRS_STATE;
reg [10:0] cntr;
reg  [5:0] retSt;
reg [3:0] cs_mask, cs_mask_int;
//assign cs_mask = (NUM_OF_RANKS <=4) ? {{(4 - NUM_OF_RANKS){1'b0}},{NUM_OF_RANKS{1'b1}}} : '1;
//assign cs_mask = (NUM_RANKS <= 4) ? {{(4 - NUM_RANKS){1'b0}},{NUM_RANKS{1'b1}}} : '1; //CR-1066180 : dont multiply physical ranks with slots here
assign cs_mask = ((2**NUM_RANKS) <=4) ? {{(4 - (2**NUM_RANKS)){1'b0}},{ (2**NUM_RANKS){1'b1}}} : '1; //CR-1082879 - Always take 2power of (NUM_RANKS).

task DDR_CMD;
   input [2:0] op;
begin
   mcal_ADR[59:56] <=  {2'b11, op[0], op[0]};
   mcal_ADR[63:60] <=  {2'b11, op[1], op[1]};
   mcal_ADR[67:64] <=  {2'b11, op[2], op[2]};
end
endtask

task twiddle;
   input [13:0] del;
   input  [5:0] st;
   input  reset_cs;
begin
   if (reset_cs) cs_mask_int <=1'b1;
   else if (|cs_mask_int) cs_mask_int <= (cs_mask_int<< 1'b1) & cs_mask;
   else cs_mask_int <=1'b1;
   cntr  <=  del;
   retSt <=  st;
   MRS_STATE <=  S_WAIT;
end
endtask

task setMR;
   input [12:0] mr;
   integer i;
   begin
     for (i = 0; i <= 12; i = i + 1) mcal_ADR[i*4+:4] <= {4{mr[i]}};
         mcal_ADR[((ADDR_WIDTH-1)*4)+:4] <= (ADDR_WIDTH == 18)? 4'b0:mcal_ADR[((ADDR_WIDTH-1)*4)+:4];
         mcal_ADR[55:52] <= 4'b0;
         if (BANK_GROUP_WIDTH == 2)
           mcal_BG[7:4]    <= 4'b0;
   end
 endtask

task SET_CS;
   input [3:0] cs_mask;
   integer i;
   begin
      for(i=0; i< CS_WIDTH; i=i+1) begin
	 if (cs_mask[i])
	   mcal_CS_n[4*i +:4] <= 4'b1100;
	 else
	   mcal_CS_n[4*i +:4] <= 4'b1111;
      end
   end
endtask

always @(posedge mc_clk && !initDone) 
if (mc_rst) begin //{
   mcal_ACT_n <=  4'b1111;
   mcal_ADR <=    {ADDR_WIDTH{4'h0}};
   mcal_BA <=     {BANK_WIDTH{4'h0}};
   mcal_BG <=     {BANK_GROUP_WIDTH{4'h0}};
   mcal_CKE <=    {CKE_WIDTH{4'h0}};
   mcal_CS_n <=   {CS_WIDTH{4'hF}};
   mcal_C  <=  {LRANK_WIDTH{4'hF}} ; 
   mcal_ODT <=     {ODT_WIDTH{4'b0}};
   ddr_reset_n <=  4'h0;
   cntr <= 'b0;
   `ifndef BFM_SIMULATION
   initDone <= 1'b0;
   `endif
   retSt <= S_RECONFIG;
   MRS_STATE <= S_RECONFIG;
   cs_mask_int <= 4'h0;
end //} 
else begin //{
   mcal_CS_n <=  {CS_WIDTH{4'hF}};
   DDR_CMD(NOP);
   casez (MRS_STATE)
     S_RECONFIG:  begin 	ddr_reset_n <=  4'h0;twiddle(t200us, S_RESET,1'b1);end 
     S_RESET: begin  ddr_reset_n <=  4'hF;twiddle(t500us, S_CKEON,1'b1);end
     S_CKEON: begin  mcal_CKE <=  {CKE_WIDTH{4'hF}};twiddle(tXPR, S_MR3,1'b1);end
   `ifndef BFM_SIMULATION
     S_MR3:   begin     if (|cs_mask_int) begin
                            mcal_BG[3:0] <=  4'h0;mcal_BA[7:4] <=  4'hF;mcal_BA[3:0] <=  4'hF; 
                            setMR(MR3);DDR_CMD(MRS);
                            SET_CS(cs_mask_int) ; 
                            twiddle(1, S_MR3,1'b0);   
                        end
                        else twiddle(tMRD, S_MR6,1'b1);
              end
     S_MR6:   begin     if (|cs_mask_int) begin 
                            mcal_BG[3:0] <=  4'hF;mcal_BA[7:4] <=  4'hF;mcal_BA[3:0] <=  4'h0;
                            setMR(MR6);DDR_CMD(MRS);
                            SET_CS(cs_mask_int);
                            twiddle(1, S_MR6,1'b0);   
                        end
                        else twiddle(tMRD, S_MR5,1); 
              end
     S_MR5:   begin     if (|cs_mask_int) begin
                            mcal_BG[3:0] <=  4'hF; mcal_BA[7:4] <=  4'h0;mcal_BA[3:0] <=  4'hF;
                            setMR(MR5); DDR_CMD(MRS);SET_CS(cs_mask_int);
                            twiddle(1, S_MR5,1'b0);   
                        end
                        else twiddle(tMRD, S_MR4,1);
              end
     S_MR4:   begin     if (|cs_mask_int) begin
                            mcal_BG[3:0] <=  4'hF;mcal_BA[7:4] <=  4'h0;mcal_BA[3:0] <=  4'h0;
                            setMR(MR4);DDR_CMD(MRS);SET_CS(cs_mask_int);
                            twiddle(1, S_MR4,1'b0);   
                        end
                        else twiddle(tMRD, S_MR2,1); 
              end
     S_MR2:   begin     if (|cs_mask_int) begin
                            mcal_BG[3:0] <=  4'h0;mcal_BA[7:4] <=  4'hF;mcal_BA[3:0] <=  4'h0;
                            setMR(MR2);DDR_CMD(MRS);SET_CS(cs_mask_int);
                            twiddle(1, S_MR2,1'b0);   
                        end
                        else twiddle(tMRD, S_MR1,1);
              end
     S_MR1:   begin     if (|cs_mask_int) begin
                            mcal_BG[3:0] <=  4'h0; mcal_BA[7:4] <=  4'h0;mcal_BA[3:0] <=  4'hF;
	                          setMR(MR1);DDR_CMD(MRS); SET_CS(cs_mask_int);
                            twiddle(1, S_MR1,1'b0);   
                        end
                        else twiddle(tMRD, S_MR0,1);
              end
     S_MR0:   begin     if (|cs_mask_int) begin   
                            mcal_BG[3:0] <=  4'h0;mcal_BA[7:4] <=  4'h0;mcal_BA[3:0] <=  4'h0;
                            setMR(MR0);DDR_CMD(MRS);SET_CS(cs_mask_int);
                            twiddle(1, S_MR0,1'b0);   
                        end
                        else twiddle(tMOD, S_ZQCL,1); 
              end
     S_ZQCL:  begin     if (|cs_mask_int) begin
                            mcal_ADR[43:40] <=  4'hF;
                            DDR_CMD(ZQC);SET_CS(cs_mask_int);
                            twiddle(1,S_ZQCL ,1'b0);   
                        end
                        else twiddle(tZQINIT, S_GOGO,1); 
              end
     S_GOGO: begin  initDone <= 1'b1; end
   `endif
     S_WAIT: begin
         cntr <=  cntr - 1'b1;
         if (cntr == 0) MRS_STATE <=  retSt;
      end
      S_ERROR: ;
   endcase
end//}



//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
logic [16:14] op,op1;
always @(*)begin//{
  if(initDone)begin //{
    mcal_ACT_n = 4'b1111;
    farb_r_one_cold0 = {NUM_OF_RANKS{1'b1}}; 
    farb_r_one_cold1 = {NUM_OF_RANKS{1'b1}}; 
    farb_r_one_cold0_f = {NUM_OF_RANKS{1'b1}}; 
    farb_r_one_cold1_f = {NUM_OF_RANKS{1'b1}}; 
    for(int i = 0;i < CS_WIDTH;i++)         mcal_CS_n[(i*4)+:4]= 4'b1111 ; 
    for(int i = 0;i < LRANK_WIDTH;i++)      mcal_C[(i*4)+:4] = 4'b1111 ; 
    for(int i = 0;i < ADDR_WIDTH;i++)       mcal_ADR[(i*4)+:4] = 4'b1111 ; 
    for(int i = 0;i < BANK_GROUP_WIDTH;i++) mcal_BG[(i*4)+:4]  = 4'b1111 ; 
    for(int i = 0;i < BANK_WIDTH;i++)       mcal_BA[(i*4)+:4]  = 4'b1111 ;
    if(farb_act_won | farb_cas_slot0 | farb_cas_slot1 | farb_pre_won | farb_pre_all_won | farb_ref_won  )begin//{
       farb_r_one_cold0 = ~(4'b0001 << farb_rank_slot0);
       farb_r_one_cold1 = ~(4'b0001 << farb_rank_slot1);
    end//} 

    if(farb_act_won & farb_act_slot0)begin//{
      farb_r_one_cold0_f = farb_act_slot0 ? farb_r_one_cold0 : {NUM_OF_RANKS{1'b1}};
    end//}
 
    if(farb_cas_slot0)begin//{
      farb_r_one_cold0_f = farb_cas_slot0 ? farb_r_one_cold0 : {NUM_OF_RANKS{1'b1}};
    end//}

    if(farb_pre_won & farb_pre_slot0)begin//{
      farb_r_one_cold0_f = farb_pre_slot0 ? farb_r_one_cold0 : {NUM_OF_RANKS{1'b1}} ;
    end//}

    if(farb_pre_all_won & farb_pre_all_slot0)begin//{
      farb_r_one_cold0_f = farb_pre_all_slot0 ? farb_r_one_cold0 : {NUM_OF_RANKS{1'b1}};
    end//}

    if(farb_ref_won & farb_ref_slot0)begin//{
      farb_r_one_cold0_f = farb_ref_slot0 ? farb_r_one_cold0 : {NUM_OF_RANKS{1'b1}};
    end//}

    op  =  ((farb_act_won & farb_act_slot0) ?                    ACT : 
           ((farb_cas_slot0) ?                                   (farb_wr_won_slot0 ? WR: (!farb_bypass_slot0 ? RD : 3'b111)) : 
           ((farb_pre_won & farb_pre_slot0) ?                    PRE : 
           ((farb_pre_all_won & farb_pre_all_slot0) ?            PRE : 
           ((farb_ref_won & farb_ref_slot0) ?                    REF : 3'b111)))));
 
    if(farb_act_won & farb_act_slot1)begin//{
      farb_r_one_cold1_f = farb_act_slot1 ? farb_r_one_cold1 : {NUM_OF_RANKS{1'b1}};
    end//}

    if(farb_cas_slot1)begin//{
      farb_r_one_cold1_f = farb_cas_slot1 ? farb_r_one_cold1 : {NUM_OF_RANKS{1'b1}};
    end//}

    if(farb_pre_won & farb_pre_slot1)begin//{
      farb_r_one_cold1_f = farb_pre_slot1 ? farb_r_one_cold1 : {NUM_OF_RANKS{1'b1}};
    end//}


    if(farb_pre_all_won & farb_pre_all_slot1)begin//{
      farb_r_one_cold1_f = farb_pre_all_slot1 ? farb_r_one_cold1 : {NUM_OF_RANKS{1'b1}};
    end//}

    if(farb_ref_won & farb_ref_slot1)begin//{
      farb_r_one_cold1_f = farb_ref_slot1 ? farb_r_one_cold1 : {NUM_OF_RANKS{1'b1}};
    end//}

    op1 =  ((farb_act_won & farb_act_slot1) ?                    ACT : 
           ((farb_cas_slot1) ?                                   (farb_wr_won_slot1 ? WR: (!farb_bypass_slot1 ? RD : 3'b111)) : 
           ((farb_pre_won & farb_pre_slot1) ?                    PRE : 
           ((farb_pre_all_won & farb_pre_all_slot1) ?            PRE : 
           ((farb_ref_won & farb_ref_slot1) ?                    REF : 3'b111)))));

       
    mcal_ACT_n  = ((farb_act_won & farb_act_slot0 & farb_act_slot1) ? {{2{op1[16]}},{2{op[16]}}} : 
                  ((farb_act_won & farb_act_slot1) ? {{2{op1[16]}},2'b11} :
                  ((farb_act_won & farb_act_slot0) ? {2'b11,{2{op[16]}}} : 4'b1111)));

    if(farb_act_won | farb_cas_slot0 | farb_cas_slot1)begin//{
      for(int i = 0;i < ADDR_WIDTH;i++)     mcal_ADR[(i*4)+:4]    = {{2{farb_addr_slot1[i]}},{2{farb_addr_slot0[i]}}} ;
    end//}

 
    mcal_addr_41_40    = farb_cas_slot0 ? 2'b00 : ((farb_pre_won & farb_pre_slot0) ? 2'b00 : ((farb_pre_all_slot0 & farb_pre_all_won) ? 2'b11 : ((farb_act_won & farb_act_slot0) ? {2{farb_addr_slot0[10]}} : 2'b11)));
    mcal_addr_43_42    = farb_cas_slot1 ? 2'b00 : ((farb_pre_won & farb_pre_slot1) ? 2'b00 : ((farb_pre_all_slot1 & farb_pre_all_won) ? 2'b11 : ((farb_act_won & farb_act_slot1) ? {2{farb_addr_slot1[10]}} : 2'b11))); //TODO
 
    mcal_ADR[43:40]    = {mcal_addr_43_42,mcal_addr_41_40};

    mcal_addr_57_56    = (farb_cas_slot0 | (farb_pre_all_won & farb_pre_all_slot0) | (farb_pre_won & farb_pre_slot0) | (farb_ref_won & farb_ref_slot0)) ? {2{op[14]}} : 
                         ((farb_act_won & farb_act_slot0) ? {2{farb_addr_slot0[14]}} : 2'b11);
    mcal_addr_59_58    = (farb_cas_slot1 | (farb_pre_all_won & farb_pre_all_slot1) | (farb_pre_won & farb_pre_slot1) | (farb_ref_won & farb_ref_slot1)) ? {2{op1[14]}} : 
                         ((farb_act_won & farb_act_slot1) ? {2{farb_addr_slot1[14]}} : 2'b11);

    mcal_addr_61_60    = (farb_cas_slot0 | (farb_pre_all_won & farb_pre_all_slot0) | (farb_pre_won & farb_pre_slot0) | (farb_ref_won & farb_ref_slot0)) ? {2{op[15]}} : 
                         ((farb_act_won & farb_act_slot0) ? {2{farb_addr_slot0[15]}} : 2'b11);
    mcal_addr_63_62    = (farb_cas_slot1 | (farb_pre_all_won & farb_pre_all_slot1) | (farb_pre_won & farb_pre_slot1) | (farb_ref_won & farb_ref_slot1)) ? {2{op1[15]}} : 
                         ((farb_act_won & farb_act_slot1) ? {2{farb_addr_slot1[15]}} : 2'b11);

    mcal_addr_65_64    = (farb_cas_slot0 | (farb_pre_all_won & farb_pre_all_slot0) | (farb_pre_won & farb_pre_slot0) | (farb_ref_won & farb_ref_slot0)) ? {2{op[16]}} : 
                         ((farb_act_won & farb_act_slot0) ? {2{farb_addr_slot0[16]}} : 2'b11);
    mcal_addr_67_66    = (farb_cas_slot1 | (farb_pre_all_won & farb_pre_all_slot1) | (farb_pre_won & farb_pre_slot1) | (farb_ref_won & farb_ref_slot1)) ? {2{op1[16]}} : 
                         ((farb_act_won & farb_act_slot1) ? {2{farb_addr_slot1[16]}} : 2'b11);

    mcal_ADR[67:64]    = {mcal_addr_67_66,mcal_addr_65_64};
    mcal_ADR[63:60]    = {mcal_addr_63_62,mcal_addr_61_60};
    mcal_ADR[59:56]    = {mcal_addr_59_58,mcal_addr_57_56};

    if (farb_act_won | farb_cas_slot0 | farb_cas_slot1 | farb_pre_won | farb_pre_all_won | farb_ref_won) begin
      for(int i = 0;i < CS_WIDTH;i++)         mcal_CS_n[(i*4)+:4]   = {{2{farb_r_one_cold1_f[i]}},{2{farb_r_one_cold0_f[i]}}}  ; 
      for(int i = 0;i < LRANK_WIDTH;i++)      mcal_C[(i*4)+:4]      = {{2{farb_lrank_slot1[i]}},{2{farb_lrank_slot0[i]}}}  ; 
    end
 
    if(farb_act_won | farb_cas_slot0 | farb_cas_slot1 | farb_pre_won)begin//{
      for(int i = 0;i < BANK_GROUP_WIDTH;i++) mcal_BG[(i*4)+:4]     = {{2{farb_bg_slot1[i]}},{2{farb_bg_slot0[i]}}}  ; 
      for(int i = 0;i < BANK_WIDTH;i++)       mcal_BA[(i*4)+:4]     = {{2{farb_bank_slot1[i]}},{2{farb_bank_slot0[i]}}}  ; 
    end//}
 

  end//}
end//}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
integer i;
parameter MDM = DM_WIDTH;
parameter MDW = DQ_WIDTH;
time temp; 
time wr_delay; 
logic wr_cas_int;
logic wr_cas_out;  
logic wr_cas_out_r1;
logic wr_cas_out_r2;
logic wr_data_diff;
logic wr_cas_out_s1;
logic wr_cas_out_s1_r1;
logic wr_cas_out_s1_r2;
logic wr_off;
logic [5:0] wr_size;
logic [`MC_BUFADDR_WIDTH-1:0] wr_addr; 
logic [4*MDW-1:0] wdata;
logic [2*MDW-1:0] fw1,fw2,sw1,sw2,fw1_s1,fw2_s1,sw1_s1,sw2_s1;
logic [2*MDM-1:0] fw1_dm,fw2_dm,sw1_dm,sw2_dm,fw1_dm_s1,fw2_dm_s1,sw1_dm_s1,sw2_dm_s1;
logic [4*MDM-1:0] wdata_en;
reg [`MC_BUFADDR_WIDTH:0] wr_req_data[$];
reg [`MC_BUFADDR_WIDTH-1:0] wr_req_data_addr_q[$];
reg [WDB_DATA_WIDTH+WDB_DM_WIDTH-1:0] wr_data_q[$];

time wr_req_time[$]; 

initial begin
  forever begin
  @(farb_done);
  if (((farb_cas_slot0 & farb_wr_won_slot0)|(farb_cas_slot1 & farb_wr_won_slot1))) begin
    wr_req_time.push_back(pll_clock_count);
    if (farb_cas_slot0 & farb_wr_won_slot0) begin
      `PRINT_MODEL(VERBOSITY_EN,$sformatf("pushing for slot 0 wr_req_data addr = %h @%t",{(~farb_wr_won_slot0), TXNQ[farb_id_slot0][`TXN_WDB]},$time),DBG);
      wr_req_data.push_back({(~farb_wr_won_slot0), TXNQ[farb_id_slot0][`TXN_WDB]});
      end
    else if (farb_cas_slot1 & farb_wr_won_slot1) begin
      `PRINT_MODEL(VERBOSITY_EN,$sformatf("pushing for slot 1 wr_req_data addr = %h @%t",{(farb_wr_won_slot1), TXNQ[farb_id_slot1][`TXN_WDB]},$time),DBG);
      wr_req_data.push_back({(farb_wr_won_slot1), TXNQ[farb_id_slot1][`TXN_WDB]});
      end
  end
  end
end//}

//Perf changes - begin 
// BFM is not having a txnq->farb delay.(Static flop delay is added before ADEC block, so latencies are matching).So to match with RTL, Ater the FARB WR has won- till 2clocks ,dont increment the write CAS count and we shouldn't fetch the data from wdb. This will increase the WAW hit rate. 
`ifdef INCA
always @(negedge mc_clk) begin
`else
`ifdef XILINX_SIMULATOR
always @(negedge mc_clk) begin
`else
always @(posedge mc_clk) begin
`endif
`endif
//always @(negedge mc_clk) begin
  if(mc_rst)begin
     {delay_wr_cas_farb_d,delay_wr_cas_farb_2d,delay_wr_cas_farb_3d} <= 3'b0;
     {farb_wr_won_slot0_3d,farb_wr_won_slot0_2d,farb_wr_won_slot0_d} <= 3'b0;
     {farb_wr_won_slot1_3d,farb_wr_won_slot1_2d,farb_wr_won_slot1_d} <= 3'b0;
     {farb_id_slot0_3d,farb_id_slot0_2d,farb_id_slot0_d}             <= 'd0;
     {farb_id_slot1_3d,farb_id_slot1_2d,farb_id_slot1_d}             <= 'd0;
     block_wr_cas_incr_id                                            <= 'd0;
  end
  
  //flopping win and id signals
  {farb_wr_won_slot0_3d,farb_wr_won_slot0_2d,farb_wr_won_slot0_d} <= {farb_wr_won_slot0_2d,farb_wr_won_slot0_d,farb_wr_won_slot0};
  {farb_wr_won_slot1_3d,farb_wr_won_slot1_2d,farb_wr_won_slot1_d} <= {farb_wr_won_slot1_2d,farb_wr_won_slot1_d,farb_wr_won_slot1};
  
  {farb_id_slot0_3d,farb_id_slot0_2d,farb_id_slot0_d}             <= {farb_id_slot0_2d,farb_id_slot0_d,farb_id_slot0 };
  {farb_id_slot1_3d,farb_id_slot1_2d,farb_id_slot1_d}             <= {farb_id_slot1_2d,farb_id_slot1_d,farb_id_slot1};
  
  farb_wr_won =  farb_wr_won_slot0 || farb_wr_won_slot1 ;
  if(farb_wr_won_slot0) begin
    block_wr_cas_incr_id[farb_id_slot0] <= 1'b1 ; 
  end
  else if(farb_wr_won_slot1) begin
    block_wr_cas_incr_id [farb_id_slot1] <=1'b1 ; 
  end

  if(farb_wr_won_slot0_d ) begin 
    block_wr_cas_incr_id[farb_id_slot0_d] <= 1'b0 ; 
  end
  else if(farb_wr_won_slot1_d) begin 
    block_wr_cas_incr_id[farb_id_slot1_d] <= 1'b0 ; 
  end
 
end
`ifdef INCA 
always @(*) begin
  if(farb_wr_won_slot0_d) begin
    wr_data_addr_nxt = farb_id_slot0_d;
    wr_data_en_nxt = 1'b1;
  end
  else if(farb_wr_won_slot1_d)begin
    wr_data_addr_nxt = farb_id_slot1_d;
    wr_data_en_nxt = 1'b1;
  end
  else begin
    wr_data_en_nxt = 'b0;
    wr_data_addr_nxt = 'b0;
  end
end
`D_FLOP_RST(mc_clk,wr_data_addr_nxt,wr_data_addr_nxt_ff,mc_rst,0);
`D_FLOP_RST(mc_clk,wr_data_addr_nxt_ff,wr_data_addr,mc_rst,0);

`D_FLOP_RST(mc_clk,wr_data_en_nxt,wr_data_en_nxt_ff,mc_rst,0);
`D_FLOP_RST(mc_clk,wr_data_en_nxt_ff,wr_data_en,mc_rst,0);

`elsif XILINX_SIMULATOR
always @(*) begin
  if(farb_wr_won_slot0_d) begin
    wr_data_addr = farb_id_slot0_d;// wr_req_data[0][`MC_BUFADDR_WIDTH-1:0];
    wr_data_en = 1'b1;
  end
  else if(farb_wr_won_slot1_d)begin
    wr_data_addr = farb_id_slot1_d;// wr_req_data[0][`MC_BUFADDR_WIDTH-1:0];
    wr_data_en = 1'b1;
  end
  else begin
    wr_data_en = 'b0;
    wr_data_addr = 'b0;
  end
end
`else
always @(posedge mc_clk) begin
  if(farb_wr_won_slot0_d) begin
    wr_data_addr = farb_id_slot0_d;
    wr_data_en = 1'b1;
  end
  else if(farb_wr_won_slot1_d)begin
    wr_data_addr = farb_id_slot1_d;
    wr_data_en = 1'b1;
  end
  else begin
    wr_data_en = 'b0;
    wr_data_addr = 'b0;
  end
end
`endif

always @(negedge wr_data_en) begin
  if(wr_data_en == 0 && initDone) begin
    wr_data_q.push_back({byte_en_temp,wr_data_temp});
  end
end
always @(posedge mc_clk) begin//{
  if (wr_cas_out | wr_cas_out_s1) begin
    temp <= wr_req_time.pop_front();
    {wr_off, wr_addr} <=  wr_req_data.pop_front();
    wr_data_q.pop_front();
  end
end//}

always @(posedge pll_clk) begin//{
  if(wr_req_time.size() > 0) 
    wr_delay  = ((pll_clock_count) - wr_req_time[0])/2;  
  else
    wr_delay  = 'd0;
end//}

assign wr_cas_int = (wr_delay > (CWL[0]?((CWL - 8'h02)) :((CWL - 8'h03))));

always @(posedge mc_clk)begin//{
  if(mc_rst)begin
    wr_cas_out    <= 1'b0;
    wr_cas_out_s1 <= 1'b0;
    wr_data_diff  <= 1'b0;
    {byte_en,wr_data} <= 'd0;
  end else if (wr_cas_out)begin
    wr_cas_out    <= 1'b0;
    {byte_en,wr_data} <= 'd0;
  end else if (wr_cas_out_s1)begin
    wr_data_diff  <= 1'b0;
    wr_cas_out_s1 <= 1'b0;
    {byte_en,wr_data} <= 'd0;
  end else if  ((wr_cas_int) & (wr_req_time.size() > 0) & !wr_req_data[0][`MC_BUFADDR_WIDTH] )begin
    wr_cas_out    <= 1'b1;
    wr_cas_out_s1 <= 1'b0;
    if (wr_data_q.size()!=0) begin
      {byte_en,wr_data} <=  wr_data_q[0];
      end
    else begin
      {byte_en,wr_data} <=  {byte_en_temp,wr_data_temp};
      end
  end else if  ((wr_cas_int) & (wr_req_time.size() > 0) &  wr_req_data[0][`MC_BUFADDR_WIDTH] )begin
    wr_cas_out    <= 1'b0;
    wr_data_diff  <= 1'b1;
    wr_cas_out_s1 <= 1'b1;
    if (wr_data_q.size()!=0) begin
      {byte_en,wr_data} <=  wr_data_q[0];
      end
    else begin
      {byte_en,wr_data} <=  {byte_en_temp,wr_data_temp};
      end

  end
end//}


always @(posedge mc_clk)begin//{
  if(mc_rst) begin//{
    wr_cas_out_r1    <= 1'b0;
    wr_cas_out_r2    <= 1'b0;
    wr_cas_out_s1_r1 <= 1'b0;
    wr_cas_out_s1_r2 <= 1'b0;
  end//}
  else begin//{ 
    wr_cas_out_r1    <= wr_cas_out;
    wr_cas_out_r2    <= wr_cas_out_r1;
    wr_cas_out_s1_r1 <= wr_cas_out_s1;
    wr_cas_out_s1_r2 <= wr_cas_out_s1_r1;
  end//}
end//}


assign wr_data_s1_c0 =  wr_data;
assign wr_data_en_s1 =  byte_en;

always @* begin//{
  for (i = 0; i < MDW; i ++) begin//{
    fw1[i*2+:2] = wr_cas_out ?    {wr_data[i+MDW],wr_data[i]}                 : 2'b0;
    fw2[i*2+:2] = wr_cas_out ?    {wr_data[i+MDW*3],wr_data[i+MDW*2]}         : (wr_cas_out_r1 ? {wr_data_1[i+MDW*3],wr_data_1[i+MDW*2]} : 2'b0);  
    sw1[i*2+:2] = wr_cas_out_r1 ? {wr_data_1[i+MDW*5],wr_data_1[i+MDW*4]}     : 2'b0;
    sw2[i*2+:2] = wr_cas_out_r1 ? {wr_data_1[i+MDW*7],wr_data_1[i+MDW*6]}     : (wr_cas_out_r2 ? {wr_data_2[i+MDW*7],wr_data_2[i+MDW*6]} : 2'b0);
   
    fw1_s1[i*2+:2] = wr_cas_out_s1 ?    {wr_data_s1_c0[i+MDW],wr_data_s1_c0[i]}         : (wr_cas_out_s1_r1 ? {wr_data_s1_1[i+MDW],wr_data_s1_1[i]} : 2'b0);
    fw2_s1[i*2+:2] = wr_cas_out_s1_r1 ? {wr_data_s1_1[i+MDW*3],wr_data_s1_1[i+MDW*2]}   : 2'b0;  
    sw1_s1[i*2+:2] = wr_cas_out_s1_r1 ? {wr_data_s1_1[i+MDW*5],wr_data_s1_1[i+MDW*4]}   : (wr_cas_out_s1_r2 ? {wr_data_s1_2[i+MDW*5],wr_data_s1_2[i+MDW*4]} : 2'b0);
    sw2_s1[i*2+:2] = wr_cas_out_s1_r2 ? {wr_data_s1_2[i+MDW*7],wr_data_s1_2[i+MDW*6]}   : 2'b0;
 
   wdata[i*4+:4] = ((wr_cas_out & wr_cas_out_r2)      ? {fw2[2*i],fw1[2*i+1],fw1[2*i],sw2[2*i+1]} : 
                   (wr_cas_out                        ? {fw2[2*i],fw1[2*i+1],fw1[2*i],1'b0} :  
                   ((wr_cas_out_s1 & wr_cas_out_r2)   ? {fw1_s1[2*i],1'b0,1'b0,sw2[2*i+1]} :
                   (wr_cas_out_r2                     ? {3'b0,sw2[2*i+1]} : 
                   (wr_cas_out_r1                     ? {sw2[2*i],sw1[2*i+1],sw1[2*i],fw2[2*i+1]} : 
                   ((wr_cas_out_s1 & wr_cas_out_s1_r2)? {fw1_s1[2*i],sw2_s1[2*i+1],sw2_s1[2*i],sw1_s1[2*i+1]} :
                   (wr_cas_out_s1                     ? {fw1_s1[2*i],3'b0}: 
                   (wr_cas_out_s1_r2                  ? {1'b0,sw2_s1[2*i+1],sw2_s1[2*i],sw1_s1[2*i+1]} : 
                   (wr_cas_out_s1_r1                  ? {sw1_s1[2*i],fw2_s1[2*i+1],fw2_s1[2*i],fw1_s1[2*i+1]} : 4'b0)))))))));


  end//}
 if (!DM_DIS&&PART_WIDTH!=0) begin //{
  for (i = 0; i < MDM; i ++) begin//{
    fw1_dm[i*2+:2] = wr_cas_out ?    {byte_en[i+MDM],byte_en[i]}                      : 2'b11;
    fw2_dm[i*2+:2] = wr_cas_out ?    {byte_en[i+MDM*3],byte_en[i+MDM*2]}              : (wr_cas_out_r1 ? {wr_data_en_1[i+MDM*3],wr_data_en_1[i+MDM*2]} : 2'b11);
    sw1_dm[i*2+:2] = wr_cas_out_r1 ? {wr_data_en_1[i+MDM*5],wr_data_en_1[i+MDM*4]}    : 2'b11;
    sw2_dm[i*2+:2] = wr_cas_out_r1 ? {wr_data_en_1[i+MDM*7],wr_data_en_1[i+MDM*6]}    : (wr_cas_out_r2 ? {wr_data_en_2[i+MDM*7],wr_data_en_2[i+MDM*6]} : 2'b11);


    fw1_dm_s1[i*2+:2] = wr_cas_out_s1 ?    {wr_data_en_s1[i+MDM],wr_data_en_s1[i]}               : (wr_cas_out_s1_r1 ? {wr_data_en_s1_1[i+MDM],wr_data_en_s1_1[i]} : 2'b11);
    fw2_dm_s1[i*2+:2] = wr_cas_out_s1_r1 ? {wr_data_en_s1_1[i+MDM*3],wr_data_en_s1_1[i+MDM*2]}   : 2'b11;  
    sw1_dm_s1[i*2+:2] = wr_cas_out_s1_r1 ? {wr_data_en_s1_1[i+MDM*5],wr_data_en_s1_1[i+MDM*4]}   : (wr_cas_out_s1_r2 ? {wr_data_en_s1_2[i+MDM*5],wr_data_en_s1_2[i+MDM*4]} : 2'b11);
    sw2_dm_s1[i*2+:2] = wr_cas_out_s1_r2 ? {wr_data_en_s1_2[i+MDM*7],wr_data_en_s1_2[i+MDM*6]}   : 2'b11;

    wdata_en[i*4+:4]  = ((wr_cas_out & wr_cas_out_r2)      ? {fw2_dm[i*2],fw1_dm[i*2+1],fw1_dm[i*2],sw2_dm[i*2+1]} : 
                        (wr_cas_out                        ? {fw2_dm[i*2],fw1_dm[i*2+1],fw1_dm[i*2],1'b1} : 
                        ((wr_cas_out_s1 & wr_cas_out_r2)   ? {fw1_dm_s1[2*i],1'b1,1'b1,sw2_dm[2*i+1]} :
                        (wr_cas_out_r2                     ? {3'b111,sw2_dm[i*2+1]} :
                        (wr_cas_out_r1                     ? {sw2_dm[i*2],sw1_dm[i*2+1],sw1_dm[i*2],fw2_dm[i*2+1]} :     
                        ((wr_cas_out_s1 & wr_cas_out_s1_r2)? {fw1_dm_s1[2*i],sw2_dm_s1[2*i+1],sw2_dm_s1[2*i],sw1_dm_s1[2*i+1]} :
                        (wr_cas_out_s1                     ? {fw1_dm_s1[2*i],3'b111}: 
                        (wr_cas_out_s1_r2                  ? {1'b1,sw2_dm_s1[2*i+1],sw2_dm_s1[2*i],sw1_dm_s1[2*i+1]} : 
                        (wr_cas_out_s1_r1                  ? {sw1_dm_s1[2*i],fw2_dm_s1[2*i+1],fw2_dm_s1[2*i],fw1_dm_s1[2*i+1]} : 4'b1111)))))))));
  end//}
end //}
else begin //{
  for (i = 0; i < MDM; i ++) begin//{
    wdata_en[i*4+:4]  = 4'b1111; 
  end//}
end //}
end//}

always @* begin//{
  mcal_DMOut_n   <=  #(cwl_delay_time)   wdata_en; 
  mcal_DQOut     <=  #(cwl_delay_time)   wdata;

  dmc2phy_t_b    <=  #(cwl_delay_time) ((wr_cas_out & wr_cas_out_r2)       ? 4'b1111 :   
                                            (wr_cas_out                         ? 4'b1111 : 
                                            ((wr_cas_out_s1 & wr_cas_out_r2)    ? 4'b1111 : 
                                            (wr_cas_out_r2                      ? 4'b0011 : 
                                            (wr_cas_out_r1                      ? 4'b1111 : 
                                            ((wr_cas_out_s1 & wr_cas_out_s1_r2) ? 4'b1111 : 
                                            (wr_cas_out_s1                      ? 4'b1100 :
                                            (wr_cas_out_s1_r2                   ? 4'b1111 : 
                                            (wr_cas_out_s1_r1                   ? 4'b1111 : 4'b0000))))))))); 

  end//}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
time                                          temp1; 
time                                          rd_delay; 
time                                          rd_req_time[$]; 
wire                                          rd_cas_int;
reg                                           rd_off;
reg                                           rd_cas_out;  
reg                                           rd_cas_out_s1;  
logic                                         toggle;
reg   [3:0]                                   rd_addr; 
wire  [5:0]                                   rd_size;
reg   [4:0]                                   rd_cas_out_t;  
reg   [4:0]                                   rd_cas_out_s1_t;  
logic [`DC_RROB_PTR-1:0]                      dc2na_rd_addr_1;
reg   [1:0]                                   rd_req_data[$];
reg   [`TXNQ_WIDTH+5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1:0]  rd_req_data_1[$];

initial begin
  forever begin
     @(farb_done);
     if (((farb_rd_won_slot0 & farb_cas_slot0)|(farb_cas_slot1 & farb_rd_won_slot1)) ) begin//{
       rd_req_time.push_back(pll_clock_count);
       if (farb_rd_won_slot0 & farb_cas_slot0) begin
         rd_req_data.push_back({~farb_rd_won_slot0,TXNQ[farb_id_slot0][`TXN_BYP]});
         rd_req_data_1.push_back({TXNQ[farb_id_slot0],farb_id_slot0,TXNQ[farb_id_slot0][`TXN_BYP_ID], TXNQ[farb_id_slot0][`TXN_RDB]});
       end
       else if (farb_rd_won_slot1 & farb_cas_slot1) begin
         rd_req_data.push_back({farb_rd_won_slot1,TXNQ[farb_id_slot1][`TXN_BYP]});
         rd_req_data_1.push_back({TXNQ[farb_id_slot1],farb_id_slot1,TXNQ[farb_id_slot1][`TXN_BYP_ID], TXNQ[farb_id_slot1][`TXN_RDB]});
       end
     end//}
  end
end//}

always @(posedge pll_clk) begin//{
  if(rd_req_time.size() > 0) 
    rd_delay  = (pll_clock_count - rd_req_time[0])/2;  
  else 
    rd_delay  = 'd0;
end//}

assign rd_cas_int = (rd_delay > (CL[0]?((CL - 8'h02)) :((CL - 8'h01))) );

always @(posedge mc_clk)begin//{
  if (mc_rst)begin//{
     rd_cas_out           <= 1'b0;
     rd_cas_out_t         <= 5'b0;
     rd_cas_out_s1_t      <= 5'b0;
     rd_cas_out_s1        <= 1'b0;
     rd_bypass_out        <= 1'b0;
     rd_bypass_out_t      <= 5'b0;
     rd_bypass_out_s1     <= 1'b0;
     rd_bypass_out_s1_t   <= 5'b0;
  end//} 
  else if (rd_cas_out | rd_cas_out_s1) begin //{
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("RD CAS OUT: 1 occured at %t",$time),DBG)
     rd_cas_out           <= 1'b0; 
     rd_cas_out_s1        <= #(tCK-1) 1'b0;
     temp1                <= rd_req_time.pop_front();
     {rd_off,rd_bypass}   <= rd_req_data.pop_front();
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("RD CAS OUT: 2 occured at %t",$time),DBG)
  end//} 
  else if  ((rd_cas_int) & (rd_req_time.size() > 0) & !rd_req_data[0][1])begin//{
     rd_cas_out           <= 1'b1;
     rd_bypass_out        <= rd_req_data[0][0];
     rd_cas_out_s1        <= #(tCK-1) 1'b0;
     rd_bypass_out_s1     <= #(tCK-1) 1'b0;
  end//}
  else if  ((rd_cas_int) & (rd_req_time.size() > 0) & rd_req_data[0][1])begin//{
     rd_cas_out           <= 1'b0;
     rd_bypass_out        <= 1'b0;
     rd_cas_out_s1        <= #(tCK-1) 1'b1;
     rd_bypass_out_s1     <= #(tCK-1) rd_req_data[0][0];
  end//}
  begin //{ 
      rd_cas_out_t        <= {rd_cas_out_t[4:0],rd_cas_out};
      rd_bypass_out_t     <= {rd_bypass_out_t[4:0],rd_bypass_out};
      rd_cas_out_s1_t     <= #(tCK-1) {rd_cas_out_s1_t[4:0],rd_cas_out_s1};
      rd_bypass_out_s1_t  <= #(tCK-1) {rd_bypass_out_s1_t[4:0],rd_bypass_out_s1};
end//}
end//}



always@*begin
 dmc2phy_fifo_rden <= #((((crl_delay )*(tCK-1))/2))
                       ((rd_cas_out_s1_t[3] & !rd_bypass_out_s1_t[3])| (rd_cas_out_s1_t[4] & !rd_bypass_out_s1_t[4] )) | ((rd_cas_out_t[3] & !rd_bypass_out_t[3]) | (rd_cas_out_t[4] & !rd_bypass_out_t[4]))   ;


 dmc2phy_rden      <= #((((crl_delay )*(tCK-1))/2))
                       ({2{rd_cas_out_s1 & !rd_bypass_out_s1}} | {2{rd_cas_out_s1_t[0] & !rd_bypass_out_s1_t[0]}}) | ({2{rd_cas_out & !rd_bypass_out}} | {2{rd_cas_out_t[0] & !rd_bypass_out_t[0]}});
end

always @(posedge mc_clk) begin 
  if (mc_rst)
    toggle <= 1'b0;  
  else if (dmc2phy_fifo_rden)
    toggle <= ~toggle;
  ->>dmc2phy_fifo_rden_done;
end

initial begin
  forever begin
 @(dmc2phy_fifo_rden_done) 
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2NA: came into the block at = %t mcal_DQIn = %h ",$time,mcal_DQIn),DBG)
  dram_rd_txnq_loc_2na             = (dmc2phy_fifo_rden & toggle & rd_req_data_1.size() > 0) ?rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1:`MC_BUFADDR_WIDTH+`DC_RROB_PTR] : 'd0;
  dram_rd_addr_2na                 = (dmc2phy_fifo_rden & toggle & !(rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6]) & rd_req_data_1.size() > 0) ? rd_req_data_1[0][`DC_RROB_PTR-1:0] : 'd0;
  dram_rd_data_en_2na              = (dmc2phy_fifo_rden & toggle & !(rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6])); //5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6 -> TXN_PRW
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2NA: dram_rd_data_avail 1a happened at %t",$time),DBG)
  ->dram_rd_data_avail; 
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2NA: dram_rd_data_avail 1b happened at %t",$time),DBG)
  if (dram_rd_data_en_2na) begin 
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2NA: TXNQ read_location_updated.triggered 1 happened at %t",$time),DBG)
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2NA: TXNQ read_location_updated.triggered 2 happened at %t",$time),DBG)
  end
  end
end  //}

  assign dram_rd_data_2na = (dmc2phy_fifo_rden & toggle)? {mcal_DQIn,mcal_DQIn_1}:512'b0;

always @(rd_cas_out_t,rd_bypass_out_t,rd_cas_out_s1_t,rd_bypass_out_s1_t,bypass_data_en) begin //{
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("BYPASS_DATA_EN: came into the block at = %t ",$time),DBG)
  bypass_data_en                   = (rd_cas_out_t[4] & rd_bypass_out_t[4]) || (rd_cas_out_s1_t[4] & rd_bypass_out_s1_t[4]);
  bypass_data_addr                 =  bypass_data_en ? rd_req_data_1[0][`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1:`DC_RROB_PTR] : 'd0; 
  bypass_rrob_ptr                  =  bypass_data_en ? rd_req_data_1[0][`DC_RROB_PTR-1:0] : 'd0;
  bypass_wr_location               =  bypass_data_en ? rd_req_data_1[0][`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1:`DC_RROB_PTR] : 'd0;  
  bypass_rd_location               =  bypass_data_en ? rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1:`MC_BUFADDR_WIDTH+`DC_RROB_PTR] : 'd0;
  if (bypass_data_en) begin
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("BYPASS_DATA_EN: TXNQ bypass_data_avail triggered 1 happened at %t",$time),DBG)
     `PRINT_MODEL(VERBOSITY_EN,$sformatf("BYPASS_DATA_EN: TXNQ bypass_data_avail triggered 2 happened at %t",$time),DBG)
  end
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("BYPASS_DATA_EN: BYPASS_DATA_EN = %b, bypass_data_addr = %h and data = %h at time %t ",bypass_data_en,bypass_data_addr,bypass_data,$time),DBG)

end //}

always @(bypass_data_en,dram_rd_data_en_2na,dram_rd_addr_2na,bypass_data_avail,dram_rd_data_2na,bypass_data) begin //{

  dc2na_rd_data_en_nxt[0]   = (dram_rd_data_en_2na & |dram_rd_addr_2na ) ? 1'b1 : (bypass_data_en ? 1'b1 : 1'b0); 
  dc2na_rd_data_addr_nxt[0] = (dram_rd_data_en_2na) ? dram_rd_addr_2na : (bypass_data_en ? bypass_rrob_ptr : 'd0);
  dc2na_rd_data_nxt[0]      = dram_rd_data_en_2na ? dram_rd_data_2na : bypass_data_en ? bypass_data : 'd0;

   `PRINT_MODEL(VERBOSITY_EN,$sformatf("READ DATA time = %t: dc2na_rd_data_en = %b, dc2na_rd_data_addr = %h, dc2na_rd_data = %h, dram_rd_data_en_2na = %b, dram_rd_addr_2na = %h, dram_rd_data_en_2na = %h, bypass_data_en = %b, bypass_rrob_ptr = %h, bypass_data = %h",$time,dc2na_rd_data_en,dc2na_rd_data_addr,dc2na_rd_data,dram_rd_data_en_2na,dram_rd_addr_2na,dram_rd_data_2na,bypass_data_en,bypass_rrob_ptr,bypass_data),DBG)

end//}

`D_FLOP_RST_SHFT(mc_clk,dc2na_rd_data_en_nxt,dc2na_rd_data_en,mc_rst,0,1,DELAY_RD);
`D_FLOP_RST_SHFT(mc_clk,dc2na_rd_data_addr_nxt,dc2na_rd_data_addr,mc_rst,0,1,DELAY_RD);
`D_FLOP_RST_SHFT(mc_clk,dc2na_rd_data_nxt,dc2na_rd_data,mc_rst,0,1,DELAY_RD);
always @(dmc2phy_fifo_rden,toggle) begin //{
   `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2DB: waiting here always 3 at time = %t",$time),DBG)
  dram_rd_txnq_loc_2db_nxt             = (dmc2phy_fifo_rden & toggle & rd_req_data_1.size() > 0) ?rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1:`MC_BUFADDR_WIDTH+`DC_RROB_PTR] : 'd0;
  dram_rd_data_en_2db_nxt              = (dmc2phy_fifo_rden & toggle & rd_req_data_1.size() > 0) ?rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6]:'b0;
  dram_rd_data_db_buf_addr_2db_nxt     = (dmc2phy_fifo_rden & toggle & (rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6])) ? TXNQ[dram_rd_txnq_loc_2db_nxt][`TXN_WDB] : 5'b0;
  rmw_overwrite_nxt                    = (dram_rd_data_en_2db_nxt) ? 1'b1 : 1'b0;
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2DB:Waiting here 2 at time = %t",$time),DBG)

  if (dram_rd_data_en_2db_nxt & wdb_req_int.app_req & wdb_req_int.app_overwrite[1]) begin
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("DRAM_RD_2DB:TXNQ wdb_req_app_gnt triggered 1 happened at %t",$time),DBG)
  end
end //}
   //always_comb dram_rd_data_2db_nxt                 = (dmc2phy_fifo_rden & toggle & (rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6])) ? {mcal_DQIn,mcal_DQIn_1} : 512'b0;
   `ifdef MODEL_TECH  //Workaround for CR-1045208, Questa is not able to detect always_comb with dynamic variables
      always @ (*) dram_rd_data_2db_nxt                 = (dmc2phy_fifo_rden & toggle & (rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6])) ? {mcal_DQIn,mcal_DQIn_1} : 512'b0;
    `else
      always_comb dram_rd_data_2db_nxt                 = (dmc2phy_fifo_rden & toggle & (rd_req_data_1[0][5+`MC_BUFADDR_WIDTH+`DC_RROB_PTR-1+6])) ? {mcal_DQIn,mcal_DQIn_1} : 512'b0;
    `endif


`D_FLOP_RST(mc_clk,dram_rd_txnq_loc_2db_nxt,dram_rd_txnq_loc_2db,mc_rst,0);
`D_FLOP_RST(mc_clk,dram_rd_data_en_2db_nxt,dram_rd_data_en_2db,mc_rst,0);
`D_FLOP_RST(mc_clk,dram_rd_data_2db_nxt,dram_rd_data_2db,mc_rst,0);
`D_FLOP_RST(mc_clk,dram_rd_data_db_buf_addr_2db_nxt,dram_rd_data_db_buf_addr_2db,mc_rst,0);
`D_FLOP_RST(mc_clk,rmw_overwrite_nxt,rmw_overwrite,mc_rst,0);


always @(mc_rst,dmc2phy_fifo_rden,toggle) begin //No use of generating these signals, but need to conform after functional testing
  if(mc_rst) begin
  dram_rd_txnq_loc_2db_nxt_1 = 0;
  dram_rd_data_en_2db_nxt_1 = 0;
    end
end




always @(posedge mc_clk) begin//{
   if (~toggle & dmc2phy_fifo_rden) begin//{
      mcal_DQIn_1 <=  mcal_DQIn;
  end//}
end//}


always @(posedge mc_clk) begin//{
     if (toggle | bypass_data_en) begin
        {rd_addr_1,db_addr_1,dram_rd_addr_1} <=  rd_req_data_1.pop_front();
    end
end//}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
initial begin//{ 
repeat(10) @(posedge mc_clk);
xphy_rst <= 1'b0;
repeat(10) @(posedge mc_clk);
xphy_rst <= 1'b1;
repeat(10) @(posedge mc_clk);
xphy_rst <= 1'b0;
end//}
*/
assign xphy_rst = mc_rst;

localparam TX_OUTPUT_PHASE_90 = {{DQ_WIDTH{1'b1}},{(DMC2PHY_TOTAL_DATA_WIDTH-DQ_WIDTH-DM_WIDTH){1'b0}},{DM_WIDTH{1'b1}}};
noc_mc_ddr4_v1_0_phy_xiphy_behav #(
	             .TX_OUTPUT_PHASE_90  (TX_OUTPUT_PHASE_90)
              ,.DMC2PHYDATA_WIDTH   (DMC2PHY_TOTAL_WIDTH)
              ,.DMC2PHY_TOTAL_DATA_WIDTH(DMC2PHY_TOTAL_DATA_WIDTH) 
              ,.DMC2PHY_CMD_ADDR_WIDTH(DMC2PHY_CMD_ADDR_WIDTH)
              ,.DM_WIDTH                 (DM_WIDTH                )
              ,.DQS_WIDTH                (DQS_WIDTH               )
              ,.PHY2DMC_DATA_WIDTH(PHY2DMC_DATA_WIDTH)
           ) u_ddr_xiphy_1 (
               .mc_clk                 (mc_clk             )
              ,.mc_rst                 (xphy_rst           )
              ,.pll_clk                (pll_clk            )
              ,.pll_rst                (xphy_rst           )
		          ,.tCK		                 (tCK)
              ,.dmc2phy_data           ({mcal_DQOut,{(DQS_WIDTH-1){4'b0000}},{(DQS_WIDTH-1){4'b0000}},mcal_DQSOut_c,mcal_DQSOut,mcal_DMOut_n})
              ,.dmc2phy_addr_cmd       ({mcal_ODT,mcal_C,mcal_CS_n,4'b0101,4'b1010,mcal_ACT_n,mcal_CKE,mcal_BG,mcal_BA,mcal_ADR})
              ,.phy2dmc_data           (mcal_DQIn          )
              ,.dmc2phy_t_b            (dmc2phy_t_b        )
              ,.dmc2phy_rden           (dmc2phy_rden       )
              ,.dmc2phy_fifo_rden      (dmc2phy_fifo_rden  )
              ,.xpi_write_dm_dbi_config         (xpi_write_dm_dbi_config) 
              ,.xpi_read_dbi_en               (xpi_read_dbi_en) 
              ,.iob_pin                ({ddr_dq[DQ_WIDTH-1:0],ddr_dqs_c[DQS_WIDTH-1:0],ddr_dqs_t[DQS_WIDTH-1:0],ddr_dm_dbi_n[DM_WIDTH-1:0],ddr_odt[0],ddr_c[LRANK_WIDTH-1:0],ddr_cs_n[CS_WIDTH-1:0],ddr_ck_c[0],ddr_ck_t[0],ddr_act_n,ddr_cke[0],ddr_bg[BANK_GROUP_WIDTH-1:0],ddr_ba[BANK_WIDTH-1:0],ddr_adr[ADDR_WIDTH-1:0]})
           );

final begin//{ 
    for(int m=0;m<32;m++)begin//{
         if((TXNQ[m][0] == 1 ) & (TXNQ[m][`TXN_READ] != 0) & (per_rd_array[m]==0) ) //Check only if non periodic read
            $display("ERROR:: OUT_STANDING REQUEST FOR READ = %h,TXN_TYPE = %h,ROW = %h ,BG = %h,BA = %h,COL = %h,RANK = %h,LRANK = %h", TXNQ[m][`TXN_BYP],TXNQ[m][3],TXNQ[m][`TXN_ROW], TXNQ[m][`TXN_GROUP],TXNQ[m][`TXN_BANK],TXNQ[m][`TXN_COL],TXNQ[m][`TXN_RANK],TXNQ[m][`TXN_LRANK],$time);
    end//}
end//}

always @(posedge mc_clk) begin
  for (int i = 0 ; i < 32; i++)
    if (TXNQ[i][`TXN_VAL] && TXNQ[i][`TXN_WRITE] && TXNQ[i][`TXN_BYP])
      $error("DC ERROR: Bypass bit should never be set for a write transaction. Index = %d at %t",i,$time);
end



 
//***************** Perf_Monitor_Prints  ****************
`ifdef NA_PERF_MONITOR_PRINTS_EN
logic [31:0] RAOM_CAS_FIRST_REQ;
logic [4:0] rd_loc;


real mc_period;
 initial begin    
   @(posedge mc_clk);
   t1= $time;                                                                            
   repeat(10) @(posedge mc_clk);                                                         
   t2= $time;                                                                            
   mc_period= (t2-t1)/10;                                                                
   $fdisplay(f_ptr_dc," mc_clk_period : %f", mc_period);                                     
 end

//FARB winning Entry prints
always @(posedge mc_clk) begin //{
  if (mc_rst)
   begin RAOM_CAS_FIRST_REQ='d0;rd_loc='d0; end
  else begin //{
    //farb req
    if (raom_cas_won[5]) begin//{
      rd_loc=raom_cas_won[4:0];
      if (RAOM_CAS_FIRST_REQ[rd_loc]==0 &&  !TXNQ[rd_loc][`TXN_PRW] && TXNQ[rd_loc][`TXN_READ]  && raom_cas_won[5]) begin//{
        RAOM_CAS_FIRST_REQ[rd_loc]=1;
        $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , TXNQ_LOCA : %d , Event : %s_FARB_REQ ,  %t",TXNQ[rd_loc][`TXN_RDB],rd_loc,qos_name(TXNQ[rd_loc][`TXN_QOS]) , $time );
      end//}
    end//}
    if (raom_cas_won1[5]) begin//{
      rd_loc=raom_cas_won1[4:0];
      if (RAOM_CAS_FIRST_REQ[rd_loc]==0 &&  !TXNQ[rd_loc][`TXN_PRW] && TXNQ[rd_loc][`TXN_READ]  && raom_cas_won1[5]) begin//{
        RAOM_CAS_FIRST_REQ[rd_loc]=1;
        $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , TXNQ_LOCA : %d , Event : %s_FARB_REQ ,  %t",TXNQ[rd_loc][`TXN_RDB],rd_loc,qos_name(TXNQ[rd_loc][`TXN_QOS]) , $time );
      end//}
    end//}
    
    //farb win
    if ( ( farb_rd_won_slot0 && !TXNQ[farb_id_slot0][`TXN_PRW] ) || ( farb_rd_won_slot1 && !TXNQ[farb_id_slot1][`TXN_PRW])     )begin //{
      if(farb_rd_won_slot0) begin 
        RAOM_CAS_FIRST_REQ[farb_id_slot0]=0;
        $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , TXNQ_LOCA : %d , Event : %s_FARB_WIN_S0 ,  %t",TXNQ[farb_id_slot0][`TXN_RDB], farb_id_slot0 ,qos_name(TXNQ[farb_id_slot0][`TXN_QOS]) , $time );
      end
      else if(farb_rd_won_slot1) begin 
        RAOM_CAS_FIRST_REQ[farb_id_slot1]=0;
        $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , TXNQ_LOCA : %d , Event : %s_FARB_WIN_S1 ,  %t",TXNQ[farb_id_slot1][`TXN_RDB], farb_id_slot1 ,qos_name(TXNQ[farb_id_slot1][`TXN_QOS]) , $time );    
        end 
     end//}
    
    //RD Deallocate
    if(dc2na_rd_data_en)begin
        $fdisplay(f_ptr_dc," DC , RROB_PTR : %h , Event : DC2NA_RD_DATA ,  %t",dc2na_rd_data_addr,$time );    
      end
  end//}

end//}

`endif
//***************** Perf_Monitor_Prints****************

/*Assertions and Debug prints */

//pavanas:
//adding only for w/f viewing
  int TXNQ_VAL[32];
  int TXNQ_PG_STS[32];
  int TXNQ_READ[32];
  int TXNQ_WRITE[32];
  int TXNQ_PARTIAL[32];
  int TXNQ_PRW[32];
  int TXNQ_PWR_DONE[32];
  int TXNQ_RMW_RD_DONE[32];
  int TXNQ_WRITE_DONE[32];
  int TXNQ_BANK[32];
  int TXNQ_GROUP[32];
  int TXNQ_LRANK[32];
  int TXNQ_RANK[32];
  int TXNQ_ROW[32];
  int TXNQ_COL[32];
  int TXNQ_COL_SAFE[32];
  int TXNQ_QOS[32];
  int TXNQ_WDB[32];
  int TXNQ_RDB[32];
  int TXNQ_BYP[32];
  int TXNQ_BYP_ID[32];
  int TXNQ_BYP_CNTR[32];
  int TXNQ_REF_ZQ_STATUS[32];
always @(posedge mc_clk) begin
#2; //to sample stable data
for(int i=0;i<32;i++) begin
   TXNQ_VAL[i]              =     TXNQ[i][`TXN_VAL];
   if(TXNQ_VAL[i] == 1) begin
     TXNQ_PG_STS[i]           =     TXNQ[i][`TXN_PG_STS];
     TXNQ_READ[i]             =     TXNQ[i][`TXN_READ];
     TXNQ_WRITE[i]            =     TXNQ[i][`TXN_WRITE];
     TXNQ_PARTIAL[i]          =     TXNQ[i][`TXN_PARTIAL];
     TXNQ_PRW[i]              =     TXNQ[i][`TXN_PRW];
     TXNQ_PWR_DONE[i]         =     TXNQ[i][`TXN_PWR_DONE];
     TXNQ_RMW_RD_DONE[i]      =     TXNQ[i][`TXN_RMW_RD_DONE];
     TXNQ_WRITE_DONE[i]       =     TXNQ[i][`TXN_WRITE_DONE];
     TXNQ_BANK[i]             =     TXNQ[i][`TXN_BANK];
     TXNQ_GROUP[i]            =     TXNQ[i][`TXN_GROUP];
     TXNQ_LRANK[i]            =     TXNQ[i][`TXN_LRANK];
     TXNQ_RANK[i]             =     TXNQ[i][`TXN_RANK];
     TXNQ_ROW[i]              =     TXNQ[i][`TXN_ROW];
     TXNQ_COL[i]              =     TXNQ[i][`TXN_COL];
     TXNQ_COL_SAFE[i]         =     TXNQ[i][`TXN_COL_SAFE];
     TXNQ_QOS[i]              =     TXNQ[i][`TXN_QOS];
     TXNQ_WDB[i]              =     TXNQ[i][`TXN_WDB];
     TXNQ_RDB[i]              =     TXNQ[i][`TXN_RDB];
     TXNQ_BYP[i]              =     TXNQ[i][`TXN_BYP];
     TXNQ_BYP_ID[i]           =     TXNQ[i][`TXN_BYP_ID];
     TXNQ_BYP_CNTR[i]         =     TXNQ[i][`TXN_BYP_CNTR];
     TXNQ_REF_ZQ_STATUS[i]    =     TXNQ[i][`TXN_REF_ZQ_STATUS];
   end
   else begin
     TXNQ_PG_STS[i]           =     -1;
     TXNQ_READ[i]             =     -1;
     TXNQ_WRITE[i]            =     -1;
     TXNQ_PARTIAL[i]          =     -1;
     TXNQ_PRW[i]              =     -1;
     TXNQ_PWR_DONE[i]         =     -1;
     TXNQ_RMW_RD_DONE[i]      =     -1;
     TXNQ_WRITE_DONE[i]       =     -1;
     TXNQ_BANK[i]             =     -1;
     TXNQ_GROUP[i]            =     -1;
     TXNQ_LRANK[i]            =     -1;
     TXNQ_RANK[i]             =     -1;
     TXNQ_ROW[i]              =     -1;
     TXNQ_COL[i]              =     -1;
     TXNQ_COL_SAFE[i]         =     -1;
     TXNQ_QOS[i]              =     -1;
     TXNQ_WDB[i]              =     -1;
     TXNQ_RDB[i]              =     -1;
     TXNQ_BYP[i]              =     -1;
     TXNQ_BYP_ID[i]           =     -1;
     TXNQ_BYP_CNTR[i]         =     -1;
     TXNQ_REF_ZQ_STATUS[i]    =     -1;
   end  
 end
end
endmodule
`endif

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

