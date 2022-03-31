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


// IP VLNV: xilinx.com:ip:axis_cap_ctrl:1.0
// IP Revision: 0

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_a7b3_axis_cap_ctrl_0 (
  ila_clk,
  aresetn,
  armed,
  shifted_trig_in,
  halt,
  trigger,
  capture_sqc_in,
  trig_out_fsm_i,
  capture_fsm_i,
  en_adv_trigger_i,
  capture_mode_i,
  trig_pos_eq_scnt_max,
  trig_pos_eq_0,
  scnt_max_eq_1,
  scnt_eq_trig_pos,
  hwcnt_eq_wcnt_max,
  lwcnt_eq_scnt_max,
  scnt_eq_scnt_max,
  addr_sel,
  max_bit,
  full,
  full_iclk,
  done_async,
  write_en,
  lwcnt_rst_o,
  trigger_o,
  use_case_i,
  addr,
  scnt,
  hwcnt,
  lwcnt,
  trig_state,
  trig_state_iclk,
  ct_state_async
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire ila_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ARESETN RST" *)
input wire aresetn;
input wire armed;
input wire shifted_trig_in;
input wire halt;
input wire trigger;
input wire capture_sqc_in;
input wire trig_out_fsm_i;
input wire capture_fsm_i;
input wire en_adv_trigger_i;
input wire [1 : 0] capture_mode_i;
input wire trig_pos_eq_scnt_max;
input wire trig_pos_eq_0;
input wire scnt_max_eq_1;
input wire scnt_eq_trig_pos;
input wire hwcnt_eq_wcnt_max;
input wire lwcnt_eq_scnt_max;
input wire scnt_eq_scnt_max;
input wire [9 : 0] addr_sel;
input wire [9 : 0] max_bit;
output wire full;
output wire full_iclk;
output wire done_async;
output wire write_en;
output wire lwcnt_rst_o;
output wire trigger_o;
input wire [2 : 0] use_case_i;
output wire [9 : 0] addr;
output wire [9 : 0] scnt;
output wire [9 : 0] hwcnt;
output wire [9 : 0] lwcnt;
output wire [2 : 0] trig_state;
output wire [2 : 0] trig_state_iclk;
output wire [2 : 0] ct_state_async;

  axis_cap_ctrl_v1_0_0_axis_cap_ctrl #(
    .C_CNT_WIDTH(10)
  ) inst (
    .ila_clk(ila_clk),
    .aresetn(aresetn),
    .armed(armed),
    .shifted_trig_in(shifted_trig_in),
    .halt(halt),
    .trigger(trigger),
    .capture_sqc_in(capture_sqc_in),
    .trig_out_fsm_i(trig_out_fsm_i),
    .capture_fsm_i(capture_fsm_i),
    .en_adv_trigger_i(en_adv_trigger_i),
    .capture_mode_i(capture_mode_i),
    .trig_pos_eq_scnt_max(trig_pos_eq_scnt_max),
    .trig_pos_eq_0(trig_pos_eq_0),
    .scnt_max_eq_1(scnt_max_eq_1),
    .scnt_eq_trig_pos(scnt_eq_trig_pos),
    .hwcnt_eq_wcnt_max(hwcnt_eq_wcnt_max),
    .lwcnt_eq_scnt_max(lwcnt_eq_scnt_max),
    .scnt_eq_scnt_max(scnt_eq_scnt_max),
    .addr_sel(addr_sel),
    .max_bit(max_bit),
    .full(full),
    .full_iclk(full_iclk),
    .done_async(done_async),
    .write_en(write_en),
    .lwcnt_rst_o(lwcnt_rst_o),
    .trigger_o(trigger_o),
    .use_case_i(use_case_i),
    .addr(addr),
    .scnt(scnt),
    .hwcnt(hwcnt),
    .lwcnt(lwcnt),
    .trig_state(trig_state),
    .trig_state_iclk(trig_state_iclk),
    .ct_state_async(ct_state_async)
  );
endmodule
