//-----------------------------------------------------------------------------
//
// (c) Copyright 2019-2023 Xilinx, Inc. All rights reserved.
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
//-----------------------------------------------------------------------------
//
// Project : Xilinx Versal ACAP CPM 4
// File    : xdma0_wrapper.sv
// Version : 1.0
//-----------------------------------------------------------------------------

`include "cpm4_axi4mm_axi_bridge.vh"
`include "cpm4_interface.svh"

`timescale 1ps/1ps

module cpm4_v1_0_4_xdma0_wrapper 
import cpm4_v1_0_4_pkg::*;
#(
  parameter TCQ = 100,
  parameter [6:0] C_USE_MODE = 7'h4,
  parameter C_AXISTEN_IF_WIDTH = 512,
  parameter IS_MM_ONLY = 0,  
  parameter NUM_USR_IRQ = 1
)
(
  input  user_clk,
  output reg user_reset,
  output reg user_lnk_up,

  input phy_rdy,

  input           unified_axis_cq_vld,
  input           unified_axis_rc_vld,
  output          unified_axis_cq_crdt,
  output          unified_axis_rc_crdt,
  input  [511:0]  unified_axis_cq_tdata,
  input  [15:0]   unified_axis_cq_tkeep,
  input  [228:0]  unified_axis_cq_tuser,
  input           unified_axis_cq_tlast,
  input           unified_axis_rc_tlast,

  output [511:0]  s_axis_dma_rq_tdata,
  output [15:0]   s_axis_dma_rq_tkeep,
  output [136:0]  s_axis_dma_rq_tuser,
  output          s_axis_dma_rq_tlast,
  output          s_axis_dma_rq_tvalid,
  input   [3:0]   s_axis_dma_rq_tready,

  output [511:0]  s_axis_dma_cc_tdata,
  output [15:0]   s_axis_dma_cc_tkeep,
  output [80:0]   s_axis_dma_cc_tuser,
  output          s_axis_dma_cc_tlast,
  output          s_axis_dma_cc_tvalid,
  input   [3:0]   s_axis_dma_cc_tready,

  input  [11:0] cfg_fc_pd,
  input  [7:0]  cfg_fc_ph,
  input  [11:0] cfg_fc_npd,
  input  [7:0]  cfg_fc_nph,
  input  [11:0] cfg_fc_cpld,
  input  [7:0]  cfg_fc_cplh,
  input  [1:0]  cfg_fc_pd_scale,
  input  [1:0]  cfg_fc_ph_scale,
  input  [1:0]  cfg_fc_npd_scale,
  input  [1:0]  cfg_fc_nph_scale,
  input  [1:0]  cfg_fc_cpld_scale,
  input  [1:0]  cfg_fc_cplh_scale,

  input         cfg_err_cor_out,
  input         cfg_err_fatal_out,
  input         cfg_err_nonfatal_out,
  input  [4:0]  cfg_local_error_out,
  input         cfg_local_error_valid,

  input  [3:0]  cfg_atomic_requester_enable,
  output [3:0]  cfg_ats_control_enable,
  input  [1:0]  cfg_current_speed,
  input         cfg_ext_tag_enable,
  input  [3:0]  cfg_flr_in_process,
  input  [11:0] cfg_function_power_state,
  input  [15:0] cfg_function_status,
  input         cfg_hot_reset_out,
  input         cfg_interrupt_sent,
  input  [1:0]  cfg_link_power_state,
  input  [5:0]  cfg_ltssm_state,
  output [19:0] cfg_max_pasid_width_control,
  input  [1:0]  cfg_max_payload,
  input  [2:0]  cfg_max_read_req,
  input  [2:0]  cfg_negotiated_width,
  output [11:0] cfg_pasid_control,
  input         cfg_phy_link_down,
  input  [1:0]  cfg_phy_link_status,
  input         cfg_pl_status_change,
  input         cfg_power_state_change_interrupt,
  output [7:0]  cfg_pri_control,
  input  [3:0]  cfg_rcb_status,
  input  [1:0]  cfg_rx_pm_state,
  input  [3:0]  cfg_tph_requester_enable,
  input  [11:0] cfg_tph_st_mode,
  input  [1:0]  cfg_tx_pm_state,
  input         cfg_vc1_enable,
  input         cfg_vc1_negotiation_pending,

  input  [31:0] cfg_msi_data,
  input  [3:0]  cfg_msi_enable,
  input         cfg_msi_mask_update,
  input  [11:0] cfg_msi_mmenable,

  input  [3:0]  cfg_msix_enable,
  input  [3:0]  cfg_msix_mask,

  // XDMA Streaming interface channel 0
  input  [C_AXISTEN_IF_WIDTH-1:0]  s_axis_c2h_0_tdata,
  input           s_axis_c2h_0_tlast,
  input           s_axis_c2h_0_tvalid,
  output          s_axis_c2h_0_tready,
  input  [63:0]   s_axis_c2h_0_tkeep,
  input  [63:0]   s_axis_c2h_0_tuser,

  output [C_AXISTEN_IF_WIDTH-1:0]  m_axis_h2c_0_tdata,
  output          m_axis_h2c_0_tlast,
  output          m_axis_h2c_0_tvalid,
  input           m_axis_h2c_0_tready,
  output [63:0]   m_axis_h2c_0_tkeep,
  output [63:0]   m_axis_h2c_0_tuser,

  // XDMA Streaming interface channel 1
  input  [C_AXISTEN_IF_WIDTH-1:0]  s_axis_c2h_1_tdata,
  input           s_axis_c2h_1_tlast,
  input           s_axis_c2h_1_tvalid,
  output          s_axis_c2h_1_tready,
  input  [63:0]   s_axis_c2h_1_tkeep,
  input  [63:0]   s_axis_c2h_1_tuser,

  output [C_AXISTEN_IF_WIDTH-1:0]  m_axis_h2c_1_tdata,
  output          m_axis_h2c_1_tlast,
  output          m_axis_h2c_1_tvalid,
  input           m_axis_h2c_1_tready,
  output [63:0]   m_axis_h2c_1_tkeep,
  output [63:0]   m_axis_h2c_1_tuser,

  // XDMA Streaming interface channel 2
  input  [C_AXISTEN_IF_WIDTH-1:0]  s_axis_c2h_2_tdata,
  input           s_axis_c2h_2_tlast,
  input           s_axis_c2h_2_tvalid,
  output          s_axis_c2h_2_tready,
  input  [63:0]   s_axis_c2h_2_tkeep,
  input  [63:0]   s_axis_c2h_2_tuser,

  output [C_AXISTEN_IF_WIDTH-1:0]  m_axis_h2c_2_tdata,
  output          m_axis_h2c_2_tlast,
  output          m_axis_h2c_2_tvalid,
  input           m_axis_h2c_2_tready,
  output [63:0]   m_axis_h2c_2_tkeep,
  output [63:0]   m_axis_h2c_2_tuser,

  // XDMA Streaming interface channel 3
  input  [C_AXISTEN_IF_WIDTH-1:0]  s_axis_c2h_3_tdata,
  input           s_axis_c2h_3_tlast,
  input           s_axis_c2h_3_tvalid,
  output          s_axis_c2h_3_tready,
  input  [63:0]   s_axis_c2h_3_tkeep,
  input  [63:0]   s_axis_c2h_3_tuser,

  output [C_AXISTEN_IF_WIDTH-1:0]  m_axis_h2c_3_tdata,
  output          m_axis_h2c_3_tlast,
  output          m_axis_h2c_3_tvalid,
  input           m_axis_h2c_3_tready,
  output [63:0]   m_axis_h2c_3_tkeep,
  output [63:0]   m_axis_h2c_3_tuser,



  // XDMA C2H descriptor bypass interface channel 0
  output        c2h_dsc_byp_0_ready,
  input [63:0]  c2h_dsc_byp_0_src_addr,
  input [63:0]  c2h_dsc_byp_0_dst_addr,
  input [27:0]  c2h_dsc_byp_0_len,
  input [15:0]  c2h_dsc_byp_0_ctl,
  input         c2h_dsc_byp_0_load,

  // XDMA H2C descriptor bypass interface channel 0
  output        h2c_dsc_byp_0_ready,
  input [63:0]  h2c_dsc_byp_0_src_addr,
  input [63:0]  h2c_dsc_byp_0_dst_addr,
  input [27:0]  h2c_dsc_byp_0_len,
  input [15:0]  h2c_dsc_byp_0_ctl,
  input         h2c_dsc_byp_0_load,

  // XDMA C2H descriptor bypass interface channel 1
  output        c2h_dsc_byp_1_ready,
  input [63:0]  c2h_dsc_byp_1_src_addr,
  input [63:0]  c2h_dsc_byp_1_dst_addr,
  input [27:0]  c2h_dsc_byp_1_len,
  input [15:0]  c2h_dsc_byp_1_ctl,
  input         c2h_dsc_byp_1_load,

  // XDMA H2C descriptor bypass interface channel 1
  output        h2c_dsc_byp_1_ready,
  input [63:0]  h2c_dsc_byp_1_src_addr,
  input [63:0]  h2c_dsc_byp_1_dst_addr,
  input [27:0]  h2c_dsc_byp_1_len,
  input [15:0]  h2c_dsc_byp_1_ctl,
  input         h2c_dsc_byp_1_load,

  // XDMA C2H descriptor bypass interface channel 2
  output        c2h_dsc_byp_2_ready,
  input [63:0]  c2h_dsc_byp_2_src_addr,
  input [63:0]  c2h_dsc_byp_2_dst_addr,
  input [27:0]  c2h_dsc_byp_2_len,
  input [15:0]  c2h_dsc_byp_2_ctl,
  input         c2h_dsc_byp_2_load,

  // XDMA H2C descriptor bypass interface channel 2
  output        h2c_dsc_byp_2_ready,
  input [63:0]  h2c_dsc_byp_2_src_addr,
  input [63:0]  h2c_dsc_byp_2_dst_addr,
  input [27:0]  h2c_dsc_byp_2_len,
  input [15:0]  h2c_dsc_byp_2_ctl,
  input         h2c_dsc_byp_2_load,

  // XDMA C2H descriptor bypass interface channel 3
  output        c2h_dsc_byp_3_ready,
  input [63:0]  c2h_dsc_byp_3_src_addr,
  input [63:0]  c2h_dsc_byp_3_dst_addr,
  input [27:0]  c2h_dsc_byp_3_len,
  input [15:0]  c2h_dsc_byp_3_ctl,
  input         c2h_dsc_byp_3_load,

  // XDMA H2C descriptor bypass interface channel 3
  output        h2c_dsc_byp_3_ready,
  input [63:0]  h2c_dsc_byp_3_src_addr,
  input [63:0]  h2c_dsc_byp_3_dst_addr,
  input [27:0]  h2c_dsc_byp_3_len,
  input [15:0]  h2c_dsc_byp_3_ctl,
  input         h2c_dsc_byp_3_load,



  output xdma_resetn,
  input  dma_resetn,

  input  [NUM_USR_IRQ-1:0] usr_irq_req,
  output [NUM_USR_IRQ-1:0] usr_irq_ack,
  input  [7:0] usr_irq_fnc,

  // XDMA Status
output [7:0]  c2h_sts_0,
output [7:0]  h2c_sts_0,
output [7:0]  c2h_sts_1,
output [7:0]  h2c_sts_1,
output [7:0]  c2h_sts_2,
output [7:0]  h2c_sts_2,
output [7:0]  c2h_sts_3,
output [7:0]  h2c_sts_3,


  input  [7:0]  usr_flr_done_fnc,
  input         usr_flr_done_vld,
  output [7:0]  usr_flr_fnc,
  output        usr_flr_set,
  output        usr_flr_clr,

  output dma_irq_out,

  input         mgmt_req_vld,
  input [31:0]  mgmt_req_dat,
  input [31:0]  mgmt_req_adr,
  input [7:0]   mgmt_req_fnc,
  input [5:0]   mgmt_req_msc,
  input [1:0]   mgmt_req_cmd,
  output        mgmt_req_rdy,

  output        mgmt_cpl_vld,
  output [1:0]  mgmt_cpl_sts,
  output [31:0] mgmt_cpl_dat,
  input         mgmt_cpl_rdy,

  // VDM
  input         st_rx_msg_rdy,
  output [31:0] st_rx_msg_data,
  output        st_rx_msg_valid,
  output        st_rx_msg_last,

  output  pl_eq_mismatch_o,
  output  pl_redo_eq_pending_o,
  input   pl_gen34_eq_mismatch_i,
  input   pl_gen34_redo_eq_speed_i,
  output  pl_gen34_redo_eq_speed_o,
  input   pl_gen34_redo_equalization_i,
  output  pl_gen34_redo_equalization_o
);

  localparam NUM_USR_IRQ_BITS = $clog2(NUM_USR_IRQ);

  pciea_port_axis_rq_if dma_axi_rq_if(.*);
  pciea_port_axis_cc_if dma_axi_cc_if(.*);

  wire [511:0]  m_axis_pcie_cq_tdata;
  wire [15:0]   m_axis_pcie_cq_tkeep;
  wire [228:0]  m_axis_pcie_cq_tuser;
  wire          m_axis_pcie_cq_tlast;
  wire          m_axis_pcie_cq_tvalid;
  wire          m_axis_pcie_cq_credit=0;
  wire          m_axis_pcie_rc_credit=0;

  wire [6:0]  attr_design_use_mode;

  assign attr_design_use_mode = C_USE_MODE;

  wire sys_or_hot_rst;
  wire user_reset_int;
  wire user_lnk_up_int;
  reg user_reset_cdc_o;
  reg user_lnk_up_cdc_o;

  assign user_lnk_up_int = (cfg_phy_link_status == 2'b11) ? 1'b1 : 1'b0;
  assign sys_or_hot_rst = !phy_rdy || cfg_hot_reset_out;

  // CDC for the user_lnk_up output
  // this will deassert asynchronously with phy_ready and assert synchronously
  xpm_cdc_async_rst #(
    .DEST_SYNC_FF   (2),
    .RST_ACTIVE_HIGH(0)
  ) user_lnk_up_cdc (
    .src_arst (user_lnk_up_int),
    .dest_arst(user_lnk_up_cdc_o),
    .dest_clk (user_clk)
  );

  // Additional reset register that can be replicated by the tools to facilitate timing closure
  always @(posedge user_clk or negedge user_lnk_up_int) begin
    if(!user_lnk_up_int) begin
      user_lnk_up <= 1'b0;
    end else begin
      user_lnk_up <= user_lnk_up_cdc_o;
    end
  end

  // CDC for the user_reset output
  // this will assert asynchronously with phy_ready and deassert synchronously
  assign user_reset_int = sys_or_hot_rst || cfg_phy_link_down || !cfg_phy_link_status[1];

  xpm_cdc_async_rst #(
    .DEST_SYNC_FF   (2),
    .RST_ACTIVE_HIGH(1)
  ) user_reset_cdc (
    .src_arst (user_reset_int),
    .dest_arst(user_reset_cdc_o),
    .dest_clk (user_clk)
  );
  // Additional reset register that can be replicated by the tools to facilitate timing closure
  always @(posedge user_clk or posedge user_reset_int) begin
    if(user_reset_int) begin
      user_reset <= 1'b1;
    end else begin
      user_reset <= user_reset_cdc_o;
    end
  end

  cpm4_v1_0_4_pciea_axis_demux # (
    .TCQ(TCQ)
  ) pciea_axim_demux_i0 (

    .user_clk(user_clk),
    .reset_n (phy_rdy),
    .attr_design_use_mode(attr_design_use_mode),
    
    .axis_cq_tdata  (m_axis_pcie_cq_tdata ),
    .axis_cq_tlast  (m_axis_pcie_cq_tlast ),
    .axis_cq_tuser  (m_axis_pcie_cq_tuser ),
    .axis_cq_tkeep  (m_axis_pcie_cq_tkeep ),
    .axis_cq_tvalid (m_axis_pcie_cq_tvalid),
    .axis_cq_crdt   (m_axis_pcie_cq_credit),

    .axis_rc_tdata  (),
    .axis_rc_tlast  (),
    .axis_rc_tuser  (),
    .axis_rc_tkeep  (),
    .axis_rc_tvalid (),    
    .axis_rc_crdt   (m_axis_pcie_rc_credit),

    .unified_cq_tdata (unified_axis_cq_tdata),
    .unified_cq_tkeep (unified_axis_cq_tkeep),
    .unified_cq_tuser (unified_axis_cq_tuser),
    .unified_cq_tlast (unified_axis_cq_tlast),
    .unified_rc_tlast (unified_axis_rc_tlast),
    .unified_cq_tvalid(unified_axis_cq_vld),
    .unified_rc_tvalid(unified_axis_rc_vld),
    .unified_cq_crdt  (unified_axis_cq_crdt),
    .unified_rc_crdt  (unified_axis_rc_crdt)
  );


  // PL EQ0 Interface Module

  cpm4_v1_0_4_pcie_4_0_pl_eq_attr # (
    .TCQ(TCQ)
  ) pcie_4_0_pl_eq_inst (

    .clk_i(user_clk),
    .reset_i (!phy_rdy),

    .link_down_reset_i(cfg_phy_link_down),
    .cfg_ltssm_state_i(cfg_ltssm_state),

    .pl_redo_eq_i(pl_gen34_redo_equalization_i),
    .pl_redo_eq_speed_i(pl_gen34_redo_eq_speed_i),
    .pl_gen34_eq_mismatch_i(pl_gen34_eq_mismatch_i),

    .pl_eq_mismatch_o(pl_eq_mismatch_o),
    .pl_redo_eq_pending_o(pl_redo_eq_pending_o),
    .pl_gen34_redo_eq_speed_o(pl_gen34_redo_eq_speed_o),
    .pl_gen34_redo_equalization_o(pl_gen34_redo_equalization_o)
  );

  generate
  if (!IS_MM_ONLY)
  begin : AXIST
    //######################################################################################
    //                           XDMA soft logic
    //######################################################################################

    dma_pcie_c2h_axis_if xdma_axis_c2h[3:0]();

    // AXI Stream Master Ports
    dma_pcie_h2c_axis_if xdma_axis_h2c[3:0]();
    dma_pcie_byp_out_if  xdma_byp_out_h2c[3:0]();
    dma_pcie_byp_out_if  xdma_byp_out_c2h[3:0]();
    dma_pcie_byp_in_if   xdma_byp_in_h2c[3:0]();
    dma_pcie_byp_in_if   xdma_byp_in_c2h[3:0]();
    dma_err_out_t        dma_err_out;

    xdma_usr_irq_if_in_t  xdma_irq_in;
    xdma_usr_irq_if_out_t xdma_irq_out;
    dma_err_out_t         xdma_dma_err_out;

    usr_flr_if_in_t  xdma_flr_in;
    usr_flr_if_out_t xdma_flr_out;
    dma_mgmt_req_t   xdma_mgmt_req;
    dma_mgmt_cpl_t   xdma_mgmt_cpl;

    logic[3:0][7:0] xdma_h2c_sts;
    logic[3:0][7:0] xdma_c2h_sts;

    logic xdma_mgmt_req_vld;
    logic xdma_mgmt_req_rdy;

    logic xdma_mgmt_cpl_vld;
    logic xdma_mgmt_cpl_rdy;

    logic [ 399:0] dma_fabric_c_out; //Output relative to hard block
    logic [ 758:0] dma_fabric_a_out; //Output relative to hard block
    logic [1352:0] dma_fabric_a_in; //Input relative to hard block
    logic [1352:0] mdma_fabric_a_in;
    logic [1352:0] xdma_fabric_a_in;

    assign dma_fabric_a_out = {
        m_axis_pcie_cq_tvalid,
        m_axis_pcie_cq_tlast,
        m_axis_pcie_cq_tdata,
        m_axis_pcie_cq_tkeep,
        m_axis_pcie_cq_tuser
      };

    assign {dma_axi_rq_if.axis_rq_tdata,
        dma_axi_rq_if.axis_rq_tuser[136:0],  // Only 137 bits used in pcie4_core_top
        dma_axi_cc_if.axis_cc_tdata,
        dma_axi_cc_if.axis_cc_tuser
      } = dma_fabric_a_in;

    assign dma_fabric_a_in =  xdma_fabric_a_in;

    assign dma_err_out.valid     = xdma_dma_err_out.valid;
    assign dma_err_out.source    = xdma_dma_err_out.source;

    // Fabric Cfg Output Pin Sharing
    // fabric_c_out[222:0] active
    always_comb // Port0
    begin
      dma_fabric_c_out[399:118] = '0 | {
      //cfg_shared_if.cfg_bus_number,  , // KEEPOUT this output goes to CPM flop, not fabric
        cfg_fc_ph, 
        cfg_fc_ph_scale, 
        cfg_fc_pd, 
        cfg_fc_pd_scale, 
        cfg_fc_nph, 
        cfg_fc_nph_scale, 
        cfg_fc_npd, 
        cfg_fc_npd_scale,
        cfg_fc_cplh, 
        cfg_fc_cplh_scale,
        cfg_fc_cpld, 
        cfg_fc_cpld_scale, 

        cfg_err_cor_out,
        cfg_err_nonfatal_out,
        cfg_err_fatal_out,
        cfg_local_error_valid,
        cfg_local_error_out,
        cfg_interrupt_sent,
        cfg_msi_mask_update,
        cfg_negotiated_width,
        cfg_current_speed,
        cfg_link_power_state,
        cfg_ltssm_state,
        cfg_rx_pm_state,
        cfg_tx_pm_state,
        cfg_pl_status_change,
        cfg_hot_reset_out,
        cfg_power_state_change_interrupt,
        cfg_vc1_enable,
        cfg_vc1_negotiation_pending
      };
    end

    always_comb // Port0 Virtual (vrt) Cfg Outputs (CPM Pin Outputs)
    begin
      dma_fabric_c_out[117:0] = {
        cfg_max_payload,
        cfg_max_read_req,
        cfg_function_status,
        cfg_function_power_state,
        cfg_rcb_status,
        cfg_flr_in_process,
        cfg_tph_requester_enable,
        cfg_tph_st_mode,
        cfg_ext_tag_enable,
        cfg_atomic_requester_enable,
        cfg_msi_enable,
        cfg_msi_mmenable,
        cfg_msi_data,
        cfg_msix_enable,
        cfg_msix_mask
    } | 118'b0;
    end

    // XDMA Mux/Demux.
    cpm4_v1_0_4_xdma_fab_demux #(
      .TCQ    (TCQ)
    ) u_xdma_fab_demux (
      .clk  (user_clk),
      .rst_n(phy_rdy),

      .axi_resetn  (xdma_resetn),
      .dma_resetn  (dma_resetn),

      .dma_sel     (attr_design_use_mode[2]),

      .s_axis_c2h  (xdma_axis_c2h),
      .m_axis_h2c  (xdma_axis_h2c),

      .h2c_byp_out (xdma_byp_out_h2c),
      .c2h_byp_out (xdma_byp_out_c2h),
      .h2c_byp_in  (xdma_byp_in_h2c) ,
      .c2h_byp_in  (xdma_byp_in_c2h) ,

      .irq_in      (xdma_irq_in ),
      .irq_out     (xdma_irq_out),

      .flr_in      (xdma_flr_in ),
      .flr_out     (xdma_flr_out),

      .dma_err_out (xdma_dma_err_out),
      .dma_irq_out (dma_irq_out),

      .dma_mgmt_req_vld  (xdma_mgmt_req_vld ),
      .dma_mgmt_req      (xdma_mgmt_req),
      .dma_mgmt_req_rdy  (xdma_mgmt_req_rdy),

      .dma_mgmt_cpl_vld  (xdma_mgmt_cpl_vld),
      .dma_mgmt_cpl      (xdma_mgmt_cpl),
      .dma_mgmt_cpl_rdy  (xdma_mgmt_cpl_rdy),

      .st_rx_msg_valid (st_rx_msg_valid),
      .st_rx_msg_rdy   (st_rx_msg_rdy),
      .st_rx_msg_data  (st_rx_msg_data),
      .st_rx_msg_last  (st_rx_msg_last),

      .h2c_sts (xdma_h2c_sts),
      .c2h_sts (xdma_c2h_sts),

      .fab_in  (xdma_fabric_a_in),
      .fab_out ({dma_fabric_c_out[222:0], dma_fabric_a_out})
    );

    // C2H AXI-ST Channel 0
    assign xdma_axis_c2h[0].tkeep   = s_axis_c2h_0_tkeep; 
    assign xdma_axis_c2h[0].tlast   = s_axis_c2h_0_tlast; 
    assign xdma_axis_c2h[0].tusr    = s_axis_c2h_0_tuser; 
    assign xdma_axis_c2h[0].tparity = s_axis_c2h_0_tuser; 
    assign xdma_axis_c2h[0].tdata   = s_axis_c2h_0_tdata; 
    assign xdma_axis_c2h[0].tvalid  = s_axis_c2h_0_tvalid; 
    assign s_axis_c2h_0_tready  = xdma_axis_c2h[0].tready; 

    // H2C AXI-ST Channel 0
    assign m_axis_h2c_0_tkeep   = xdma_axis_h2c[0].tkeep; 
    assign m_axis_h2c_0_tlast   = xdma_axis_h2c[0].tlast; 
    assign m_axis_h2c_0_tuser   = xdma_axis_h2c[0].tusr; 
  //assign m_axis_h2c_0_tparity = xdma_axis_h2c[0].tparity; 
    assign m_axis_h2c_0_tdata   = xdma_axis_h2c[0].tdata; 
    assign m_axis_h2c_0_tvalid  = xdma_axis_h2c[0].tvalid; 
    assign xdma_axis_h2c[0].tready = m_axis_h2c_0_tready; 

    // C2H AXI-ST Channel 1
    assign xdma_axis_c2h[1].tkeep   = s_axis_c2h_1_tkeep; 
    assign xdma_axis_c2h[1].tlast   = s_axis_c2h_1_tlast; 
    assign xdma_axis_c2h[1].tusr    = s_axis_c2h_1_tuser; 
    assign xdma_axis_c2h[1].tparity = s_axis_c2h_1_tuser; 
    assign xdma_axis_c2h[1].tdata   = s_axis_c2h_1_tdata; 
    assign xdma_axis_c2h[1].tvalid  = s_axis_c2h_1_tvalid; 
    assign s_axis_c2h_1_tready  = xdma_axis_c2h[1].tready; 

    // H2C AXI-ST Channel 1
    assign m_axis_h2c_1_tkeep   = xdma_axis_h2c[1].tkeep; 
    assign m_axis_h2c_1_tlast   = xdma_axis_h2c[1].tlast; 
    assign m_axis_h2c_1_tuser   = xdma_axis_h2c[1].tusr; 
  //assign m_axis_h2c_1_tparity = xdma_axis_h2c[1].tparity; 
    assign m_axis_h2c_1_tdata   = xdma_axis_h2c[1].tdata; 
    assign m_axis_h2c_1_tvalid  = xdma_axis_h2c[1].tvalid; 
    assign xdma_axis_h2c[1].tready = m_axis_h2c_1_tready; 

    // C2H AXI-ST Channel 2
    assign xdma_axis_c2h[2].tkeep   = s_axis_c2h_2_tkeep; 
    assign xdma_axis_c2h[2].tlast   = s_axis_c2h_2_tlast; 
    assign xdma_axis_c2h[2].tusr    = s_axis_c2h_2_tuser; 
    assign xdma_axis_c2h[2].tparity = s_axis_c2h_2_tuser; 
    assign xdma_axis_c2h[2].tdata   = s_axis_c2h_2_tdata; 
    assign xdma_axis_c2h[2].tvalid  = s_axis_c2h_2_tvalid; 
    assign s_axis_c2h_2_tready  = xdma_axis_c2h[2].tready; 

    // H2C AXI-ST Channel 2
    assign m_axis_h2c_2_tkeep   = xdma_axis_h2c[2].tkeep; 
    assign m_axis_h2c_2_tlast   = xdma_axis_h2c[2].tlast; 
    assign m_axis_h2c_2_tuser   = xdma_axis_h2c[2].tusr; 
  //assign m_axis_h2c_2_tparity = xdma_axis_h2c[2].tparity; 
    assign m_axis_h2c_2_tdata   = xdma_axis_h2c[2].tdata; 
    assign m_axis_h2c_2_tvalid  = xdma_axis_h2c[2].tvalid; 
    assign xdma_axis_h2c[2].tready = m_axis_h2c_2_tready; 

    // C2H AXI-ST Channel 3
    assign xdma_axis_c2h[3].tkeep   = s_axis_c2h_3_tkeep; 
    assign xdma_axis_c2h[3].tlast   = s_axis_c2h_3_tlast; 
    assign xdma_axis_c2h[3].tusr    = s_axis_c2h_3_tuser; 
    assign xdma_axis_c2h[3].tparity = s_axis_c2h_3_tuser; 
    assign xdma_axis_c2h[3].tdata   = s_axis_c2h_3_tdata; 
    assign xdma_axis_c2h[3].tvalid  = s_axis_c2h_3_tvalid; 
    assign s_axis_c2h_3_tready  = xdma_axis_c2h[3].tready; 

    // H2C AXI-ST Channel 3
    assign m_axis_h2c_3_tkeep   = xdma_axis_h2c[3].tkeep; 
    assign m_axis_h2c_3_tlast   = xdma_axis_h2c[3].tlast; 
    assign m_axis_h2c_3_tuser   = xdma_axis_h2c[3].tusr; 
  //assign m_axis_h2c_3_tparity = xdma_axis_h2c[3].tparity; 
    assign m_axis_h2c_3_tdata   = xdma_axis_h2c[3].tdata; 
    assign m_axis_h2c_3_tvalid  = xdma_axis_h2c[3].tvalid; 
    assign xdma_axis_h2c[3].tready = m_axis_h2c_3_tready; 



    //Descriptor bypass format
    // logic [63:0] rsv3;
    // logic [63:0] wadr;
    // logic [31:0] rsv2;
    // logic        rsv1;
    // logic        eop;
    // logic        cpl;
    // logic        stp;
    // logic [27:0] len;
    // logic [63:0] radr;

    // C2H Descriptor bypass interface channel 0
    assign xdma_byp_in_c2h[0].dsc[92] = c2h_dsc_byp_0_ctl[0]; //Stop bit
    assign xdma_byp_in_c2h[0].dsc[93] = c2h_dsc_byp_0_ctl[1]; //CPL bit
    assign xdma_byp_in_c2h[0].dsc[94] = c2h_dsc_byp_0_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_c2h[0].dsc[91:64] = c2h_dsc_byp_0_len[27:0]; //Length bit
    assign xdma_byp_in_c2h[0].dsc[191:128] = c2h_dsc_byp_0_dst_addr[63:0]; //WADR
    assign xdma_byp_in_c2h[0].dsc[63:0] = c2h_dsc_byp_0_src_addr[63:0]; //RADR
    assign xdma_byp_in_c2h[0].vld = c2h_dsc_byp_0_load; //Valid
    assign c2h_dsc_byp_0_ready = xdma_byp_in_c2h[0].rdy; 

    // H2C Descriptor bypass interface channel 0
    assign xdma_byp_in_h2c[0].dsc[92] = h2c_dsc_byp_0_ctl[0]; //Stop bit
    assign xdma_byp_in_h2c[0].dsc[93] = h2c_dsc_byp_0_ctl[1]; //CPL bit
    assign xdma_byp_in_h2c[0].dsc[94] = h2c_dsc_byp_0_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_h2c[0].dsc[91:64] = h2c_dsc_byp_0_len[27:0]; //Length bit
    assign xdma_byp_in_h2c[0].dsc[191:128] = h2c_dsc_byp_0_dst_addr[63:0]; //WADR
    assign xdma_byp_in_h2c[0].dsc[63:0] = h2c_dsc_byp_0_src_addr[63:0]; //RADR
    assign xdma_byp_in_h2c[0].vld = h2c_dsc_byp_0_load; //Valid
    assign h2c_dsc_byp_0_ready = xdma_byp_in_h2c[0].rdy; 

    // C2H Descriptor bypass interface channel 1
    assign xdma_byp_in_c2h[1].dsc[92] = c2h_dsc_byp_1_ctl[0]; //Stop bit
    assign xdma_byp_in_c2h[1].dsc[93] = c2h_dsc_byp_1_ctl[1]; //CPL bit
    assign xdma_byp_in_c2h[1].dsc[94] = c2h_dsc_byp_1_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_c2h[1].dsc[91:64] = c2h_dsc_byp_1_len[27:0]; //Length bit
    assign xdma_byp_in_c2h[1].dsc[191:128] = c2h_dsc_byp_1_dst_addr[63:0]; //WADR
    assign xdma_byp_in_c2h[1].dsc[63:0] = c2h_dsc_byp_1_src_addr[63:0]; //RADR
    assign xdma_byp_in_c2h[1].vld = c2h_dsc_byp_1_load; //Valid
    assign c2h_dsc_byp_1_ready = xdma_byp_in_c2h[1].rdy; 

    // H2C Descriptor bypass interface channel 1
    assign xdma_byp_in_h2c[1].dsc[92] = h2c_dsc_byp_1_ctl[0]; //Stop bit
    assign xdma_byp_in_h2c[1].dsc[93] = h2c_dsc_byp_1_ctl[1]; //CPL bit
    assign xdma_byp_in_h2c[1].dsc[94] = h2c_dsc_byp_1_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_h2c[1].dsc[91:64] = h2c_dsc_byp_1_len[27:0]; //Length bit
    assign xdma_byp_in_h2c[1].dsc[191:128] = h2c_dsc_byp_1_dst_addr[63:0]; //WADR
    assign xdma_byp_in_h2c[1].dsc[63:0] = h2c_dsc_byp_1_src_addr[63:0]; //RADR
    assign xdma_byp_in_h2c[1].vld = h2c_dsc_byp_1_load; //Valid
    assign h2c_dsc_byp_1_ready = xdma_byp_in_h2c[1].rdy; 

    // C2H Descriptor bypass interface channel 2
    assign xdma_byp_in_c2h[2].dsc[92] = c2h_dsc_byp_2_ctl[0]; //Stop bit
    assign xdma_byp_in_c2h[2].dsc[93] = c2h_dsc_byp_2_ctl[1]; //CPL bit
    assign xdma_byp_in_c2h[2].dsc[94] = c2h_dsc_byp_2_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_c2h[2].dsc[91:64] = c2h_dsc_byp_2_len[27:0]; //Length bit
    assign xdma_byp_in_c2h[2].dsc[191:128] = c2h_dsc_byp_2_dst_addr[63:0]; //WADR
    assign xdma_byp_in_c2h[2].dsc[63:0] = c2h_dsc_byp_2_src_addr[63:0]; //RADR
    assign xdma_byp_in_c2h[2].vld = c2h_dsc_byp_2_load; //Valid
    assign c2h_dsc_byp_2_ready = xdma_byp_in_c2h[2].rdy; 

    // H2C Descriptor bypass interface channel 2
    assign xdma_byp_in_h2c[2].dsc[92] = h2c_dsc_byp_2_ctl[0]; //Stop bit
    assign xdma_byp_in_h2c[2].dsc[93] = h2c_dsc_byp_2_ctl[1]; //CPL bit
    assign xdma_byp_in_h2c[2].dsc[94] = h2c_dsc_byp_2_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_h2c[2].dsc[91:64] = h2c_dsc_byp_2_len[27:0]; //Length bit
    assign xdma_byp_in_h2c[2].dsc[191:128] = h2c_dsc_byp_2_dst_addr[63:0]; //WADR
    assign xdma_byp_in_h2c[2].dsc[63:0] = h2c_dsc_byp_2_src_addr[63:0]; //RADR
    assign xdma_byp_in_h2c[2].vld = h2c_dsc_byp_2_load; //Valid
    assign h2c_dsc_byp_2_ready = xdma_byp_in_h2c[2].rdy; 

    // C2H Descriptor bypass interface channel 3
    assign xdma_byp_in_c2h[3].dsc[92] = c2h_dsc_byp_3_ctl[0]; //Stop bit
    assign xdma_byp_in_c2h[3].dsc[93] = c2h_dsc_byp_3_ctl[1]; //CPL bit
    assign xdma_byp_in_c2h[3].dsc[94] = c2h_dsc_byp_3_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_c2h[3].dsc[91:64] = c2h_dsc_byp_3_len[27:0]; //Length bit
    assign xdma_byp_in_c2h[3].dsc[191:128] = c2h_dsc_byp_3_dst_addr[63:0]; //WADR
    assign xdma_byp_in_c2h[3].dsc[63:0] = c2h_dsc_byp_3_src_addr[63:0]; //RADR
    assign xdma_byp_in_c2h[3].vld = c2h_dsc_byp_3_load; //Valid
    assign c2h_dsc_byp_3_ready = xdma_byp_in_c2h[3].rdy; 

    // H2C Descriptor bypass interface channel 3
    assign xdma_byp_in_h2c[3].dsc[92] = h2c_dsc_byp_3_ctl[0]; //Stop bit
    assign xdma_byp_in_h2c[3].dsc[93] = h2c_dsc_byp_3_ctl[1]; //CPL bit
    assign xdma_byp_in_h2c[3].dsc[94] = h2c_dsc_byp_3_ctl[4]; //EOP bit (BIT [3:2] = rsvd)
    assign xdma_byp_in_h2c[3].dsc[91:64] = h2c_dsc_byp_3_len[27:0]; //Length bit
    assign xdma_byp_in_h2c[3].dsc[191:128] = h2c_dsc_byp_3_dst_addr[63:0]; //WADR
    assign xdma_byp_in_h2c[3].dsc[63:0] = h2c_dsc_byp_3_src_addr[63:0]; //RADR
    assign xdma_byp_in_h2c[3].vld = h2c_dsc_byp_3_load; //Valid
    assign h2c_dsc_byp_3_ready = xdma_byp_in_h2c[3].rdy; 




    //###############################################
    //               XDMA Sidebands
    //###############################################
    assign xdma_irq_in.vld = 1'b0;
    assign xdma_irq_in.vec = 16'h0 | usr_irq_req[NUM_USR_IRQ-1:0];
    assign xdma_irq_in.fnc = usr_irq_fnc;

    assign usr_irq_ack = xdma_irq_out.ack;


    assign xdma_flr_in.fnc = usr_flr_done_fnc;
    assign xdma_flr_in.vld = usr_flr_done_vld;  //done to dma from user
    assign usr_flr_fnc = xdma_flr_out.fnc;  //dma to user
    assign usr_flr_set = xdma_flr_out.set;  //process
    assign usr_flr_clr = xdma_flr_out.clr;  //done

    assign xdma_mgmt_req_vld = mgmt_req_vld;
    assign xdma_mgmt_req.dat = mgmt_req_dat;
    assign xdma_mgmt_req.adr = mgmt_req_adr;
    assign xdma_mgmt_req.fnc = mgmt_req_fnc;
    assign xdma_mgmt_req.msc = mgmt_req_msc;
    assign xdma_mgmt_req.cmd = mgmt_req_cmd;
    assign mgmt_req_rdy = xdma_mgmt_req_rdy;

    assign mgmt_cpl_vld = xdma_mgmt_cpl_vld;
    assign mgmt_cpl_sts = xdma_mgmt_cpl.sts;
    assign mgmt_cpl_dat = xdma_mgmt_cpl.dat;
    assign xdma_mgmt_cpl_rdy = mgmt_cpl_rdy;
  
    // XDMA  status
    assign c2h_sts_0  = xdma_c2h_sts[0]; 
    assign h2c_sts_0  = xdma_h2c_sts[0]; 
    assign c2h_sts_1  = xdma_c2h_sts[1]; 
    assign h2c_sts_1  = xdma_h2c_sts[1]; 
    assign c2h_sts_2  = xdma_c2h_sts[2]; 
    assign h2c_sts_2  = xdma_h2c_sts[2]; 
    assign c2h_sts_3  = xdma_c2h_sts[3]; 
    assign h2c_sts_3  = xdma_h2c_sts[3]; 


  //###############################################################
  //                          XDMA- AXI RQ/CC
  //###############################################################  
    assign s_axis_dma_rq_tdata = dma_axi_rq_if.axis_rq_tdata; 
    assign s_axis_dma_rq_tlast = dma_axi_rq_if.axis_rq_tlast; 
    assign s_axis_dma_rq_tkeep = dma_axi_rq_if.axis_rq_tkeep; 
    assign s_axis_dma_rq_tvalid= dma_axi_rq_if.axis_rq_tvalid; 
    assign s_axis_dma_rq_tuser = dma_axi_rq_if.axis_rq_tuser; 
    assign dma_axi_rq_if.axis_rq_tready = s_axis_dma_rq_tready; 

    assign s_axis_dma_cc_tdata = dma_axi_cc_if.axis_cc_tdata; 
    assign s_axis_dma_cc_tlast = dma_axi_cc_if.axis_cc_tlast; 
    assign s_axis_dma_cc_tkeep = dma_axi_cc_if.axis_cc_tkeep; 
    assign s_axis_dma_cc_tvalid= dma_axi_cc_if.axis_cc_tvalid; 
    assign s_axis_dma_cc_tuser = dma_axi_cc_if.axis_cc_tuser; 
    assign dma_axi_cc_if.axis_cc_tready = s_axis_dma_cc_tready; 


  end
  endgenerate
endmodule
