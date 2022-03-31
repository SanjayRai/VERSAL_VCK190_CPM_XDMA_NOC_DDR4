`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_axis_cap_ctrl
 #(
   parameter C_CNT_WIDTH = 8
  )
  (
   input                             ila_clk,
   input                             armed,
   input                             halt,
   input                             trigger,
   input                             aresetn,
   input                             trig_pos_eq_scnt_max,
   input                             trig_pos_eq_0,
   input                             scnt_max_eq_1,
   input                             scnt_eq_trig_pos,
   input                             hwcnt_eq_wcnt_max,
   input                             lwcnt_eq_scnt_max,
   input                             scnt_eq_scnt_max,
   input                             shifted_trig_in,
   input                             capture_sqc_in,
   input                             trig_out_fsm_i,
   input                             capture_fsm_i,
   input                             en_adv_trigger_i,
   input  [1:0]                      capture_mode_i,
   input  [2:0]                      use_case_i,
   input  [C_CNT_WIDTH-1:0]          addr_sel,
   input  [C_CNT_WIDTH-1:0]          max_bit,
   output wire [C_CNT_WIDTH-1:0]      addr,
   output [C_CNT_WIDTH-1:0]          scnt,
   output [C_CNT_WIDTH-1:0]          hwcnt,
   output [C_CNT_WIDTH-1:0]          lwcnt,
   output [2:0]                      trig_state,
   output                            full,
   output reg                        done_async,
   output reg [2:0]                  ct_state_async,
   output 			     full_iclk,
   output [2:0]			     trig_state_iclk,
   output                            write_en,
   output                            lwcnt_rst_o,
   output reg                        trigger_o/*,
   output reg                        snct_cmp_ce_o,
   output reg                        wnct_lcmp_ce_o,
   output reg                        wnct_hcmp_ce_o
*/


  );

  localparam [2:0] CASE_1 = 3'b000,
                   CASE_2 = 3'b001,
                   CASE_3 = 3'b010,
                   CASE_4 = 3'b011,
                   CASE_5 = 3'b100,
                   CASE_6 = 3'b101,
                   CASE_7 = 3'b110,
                   CASE_8 = 3'b111;
  reg  [2:0]                         ct_state;
  reg  [C_CNT_WIDTH-1:0]             scnt_temp;
  reg  [C_CNT_WIDTH-1:0]             lwcnt_temp;
  reg  [C_CNT_WIDTH-1:0]             hwcnt_temp;
  reg  [C_CNT_WIDTH-1:0]             scnt_i_temp;
  reg  [C_CNT_WIDTH-1:0]             hwcnt_i_temp;
  reg  [C_CNT_WIDTH-1:0]             lwcnt_i_temp;
  reg                                done;
  reg                                wren;
  reg                                trigger_temp  = 1'b0;
  reg                                capture_i     = 1'b0;
  reg                                sqc_wr_scnt_0 = 1'b0;
  reg                                update_temp   = 1'b0;
  reg                                incr_lwcnt    = 1'b0;

  reg armed_dly1      = 1'b0,
      wcnt_hcmp_q     = 1'b0,
      wcnt_lcmp_q     = 1'b0,
      scnt_cmp_q      = 1'b0,
      scnt_max_cmp_q  = 1'b0,
      cmp_reset       = 1'b0;
  wire armed_edge, wcnt_hcmp_ce;
  wire [C_CNT_WIDTH-1:0] addr_temp;

  reg snct_cmp_ce, snct_ce, hwcnt_ce, wnct_lcmp_ce, wnct_hcmp_ce, lwnct_rst, scnt_rst, scnt_rst_dly;

  //CASE_1
  wire [C_CNT_WIDTH-1:0] addr_c1;
  wire [1:0] ct_state_c1;
  wire done_c1, wren_c1, trigger_c1, snct_cmp_ce_c1, wnct_lcmp_ce_c1, wnct_hcmp_ce_c1;

  //CASE_2
  wire [C_CNT_WIDTH-1:0] addr_c2;
  wire [1:0] ct_state_c2;
  wire done_c2, wren_c2, trigger_c2, snct_cmp_ce_c2, wnct_lcmp_ce_c2, wnct_hcmp_ce_c2, lwnct_rst_c2;
  
   //CASE_3
  wire [C_CNT_WIDTH-1:0] addr_c3;
  wire [1:0] ct_state_c3;
  wire done_c3, wren_c3, trigger_c3, snct_cmp_ce_c3, wnct_lcmp_ce_c3, wnct_hcmp_ce_c3, lwnct_rst_c3;

   //CASE_4
  wire [C_CNT_WIDTH-1:0] addr_c4;
  wire [1:0] ct_state_c4;
  wire done_c4, wren_c4, trigger_c4, snct_cmp_ce_c4, wnct_lcmp_ce_c4, wnct_hcmp_ce_c4, cmp_reset_c4, lwnct_rst_c4, snct_ce_c4;
  wire [C_CNT_WIDTH-1:0] scnt_c4;
  wire [C_CNT_WIDTH-1:0] hwcnt_c4;
  
   //CASE_5
  wire [C_CNT_WIDTH-1:0] addr_c5;
  wire [1:0] ct_state_c5;
  wire done_c5, wren_c5, trigger_c5, snct_cmp_ce_c5, snct_ce_c5, wnct_lcmp_ce_c5, wnct_hcmp_ce_c5, cmp_reset_c5, lwnct_rst_c5 ,scnt_rst_c5;
  wire [C_CNT_WIDTH-1:0] scnt_c5;
  wire [C_CNT_WIDTH-1:0] hwcnt_c5;
  wire [C_CNT_WIDTH-1:0] lwcnt_c5;
  
   //CASE_6
  wire [C_CNT_WIDTH-1:0] addr_c6;
  wire [1:0] ct_state_c6;
  wire done_c6, wren_c6, trigger_c6, snct_cmp_ce_c6, snct_ce_c6, wnct_lcmp_ce_c6, wnct_hcmp_ce_c6, cmp_reset_c6, lwnct_rst_c6;
  wire [C_CNT_WIDTH-1:0] scnt_c6;
  wire [C_CNT_WIDTH-1:0] hwcnt_c6;
  wire [C_CNT_WIDTH-1:0] lwcnt_c6;

   //CASE_7
  wire [C_CNT_WIDTH-1:0] addr_c7;
  wire [1:0] ct_state_c7;
  wire done_c7, wren_c7, trigger_c7, snct_cmp_ce_c7, snct_ce_c7, wnct_lcmp_ce_c7, wnct_hcmp_ce_c7, cmp_reset_c7, lwnct_rst_c7;
  wire [C_CNT_WIDTH-1:0] scnt_c7;
  wire [C_CNT_WIDTH-1:0] hwcnt_c7;
  wire [C_CNT_WIDTH-1:0] lwcnt_c7;

   //CASE_8
  wire [1:0] ct_state_c8;
  wire done_c8, wren_c8, trigger_c8, snct_cmp_ce_c8, snct_ce_c8, wnct_lcmp_ce_c8, wnct_hcmp_ce_c8, cmp_reset_c8, lwnct_rst_c8;
  wire [C_CNT_WIDTH-1:0] scnt_c8;
  wire [C_CNT_WIDTH-1:0] hwcnt_c8;
  wire [C_CNT_WIDTH-1:0] lwcnt_c8;

  //assign trigger_temp = trigger | shifted_trig_in;
  //----------------------------------------------------------------
  //
  //  trigger Mux
  //
  //----------------------------------------------------------------
  always @*
  begin
    case (en_adv_trigger_i)
      1'b0 : begin
	       trigger_temp = trigger || shifted_trig_in;
	     end
      1'b1 : begin
	       trigger_temp = trig_out_fsm_i || shifted_trig_in;
	     end
    endcase
  end
  //----------------------------------------------------------------
  //
  //  Capture Mux
  //
  //----------------------------------------------------------------

  always @*
  begin
    case (capture_mode_i)
      2'b00 : begin
	        capture_i = 1'b1;
	      end
      2'b01 : begin
	        capture_i = capture_sqc_in;
	      end
      2'b10 : begin
	        capture_i = capture_fsm_i;
              end
      2'b11 : begin
	        capture_i = 1'b1;
	      end
    endcase
  end


  always @(posedge ila_clk)
  begin
    armed_dly1 <= armed;
  end
  assign armed_edge = armed && !armed_dly1;

  //scnt 
  always @(posedge ila_clk)
  begin
    scnt_rst_dly <= scnt_rst;
  end
  always @(posedge ila_clk)
  begin
    if (!aresetn)
    begin
      scnt_temp <= 'h0;
    end
    else
    begin
      if (armed_edge == 1'b1)
      begin
        scnt_temp  <= 'h0;
      end
      else if (snct_ce == 1'b1)
      begin
        if ((scnt_max_cmp_q == 1'b1 & scnt_rst_dly == 1'b0) || scnt_rst == 1'b1)
        begin
          scnt_temp  <= 'h0;
        end
        else
        begin
          scnt_temp <= scnt_temp + 1;
        end
      end
    end
  end

  //lwcnt 
  always @(posedge ila_clk)
  begin
    if (!aresetn || lwnct_rst)
    begin
      lwcnt_temp <= 'b0;
    end
    else
    begin
      if (armed_edge == 1'b1)
      begin
        lwcnt_temp  <= 'h0;
      end
      else if (wnct_lcmp_ce == 1'b1)
      begin
        lwcnt_temp <= lwcnt_temp + 1;
      end
    end
  end

  //hwcnt 
  always @(posedge ila_clk)
  begin
    if (!aresetn)
    begin
      hwcnt_temp <= 'b0;
    end
    else
    begin
      if (armed_edge == 1'b1)
      begin
        hwcnt_temp  <= 'h0;
      end
      else if (hwcnt_ce == 1'b1)
      begin
        hwcnt_temp <= hwcnt_temp + 1;
      end
    end
  end

  //scnt_cmp_q or scnt_eq_trig_pos
  always @(posedge ila_clk)
  begin
    if (!aresetn || cmp_reset == 1'b1 || armed_edge == 1'b1)
    begin
      scnt_cmp_q <= 1'b0;
    end
    else
    begin
      if (snct_cmp_ce == 1'b1)
      begin
        scnt_cmp_q <= scnt_eq_trig_pos;
      end
    end
  end

  //scnt_max_cmp_q
  always @(posedge ila_clk)
  begin
    if (!aresetn || cmp_reset == 1'b1 || armed_edge == 1'b1)
    begin
      scnt_max_cmp_q <= 1'b0;
    end
    else
    begin
      if (snct_cmp_ce == 1'b1)
      begin
        scnt_max_cmp_q <= scnt_eq_scnt_max;
      end
    end
  end

  //wcnt_lcmp_q or lwcnt_eq_scnt_max
  always @(posedge ila_clk)
  begin
    if (!aresetn || cmp_reset == 1'b1 || armed_edge == 1'b1)
    begin
      wcnt_lcmp_q <= 1'b0;
    end
    else
    begin
      if (wnct_lcmp_ce == 1'b1)
      begin
        wcnt_lcmp_q <= lwcnt_eq_scnt_max;
      end
    end
  end

  //wcnt_hcmp_q or hwcnt_eq_wcnt_max
  always @(posedge ila_clk)
  begin
    if (!aresetn || cmp_reset == 1'b1 || armed_edge == 1'b1)
    begin
      wcnt_hcmp_q <= 1'b0;
    end
    else
    begin
      if (wnct_hcmp_ce == 1'b1)
      begin
        wcnt_hcmp_q <= hwcnt_eq_wcnt_max;
      end
    end
  end

 genvar i;
 generate
   for (i=0; i < C_CNT_WIDTH; i=i+1)
   begin: ADDR_TEMP_SEL
     assign addr_temp[i] = addr_sel[i] == 1'b1 ? scnt_temp[i] : hwcnt_temp[i-max_bit];
   end
 endgenerate

  axis_cap_ctrl_v1_0_0_case1
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_1
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .ct_state_o(ct_state_c1),
      .cap_done_o(done_c1),
      .wren_o(wren_c1),
      .trig_o(trigger_c1),
      .snct_cmp_ce_o (snct_cmp_ce_c1),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c1),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c1)
   );

  axis_cap_ctrl_v1_0_0_case2
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_2
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .addr_o(addr_c2),
      .ct_state_o(ct_state_c2),
      .cap_done_o(done_c2),
      .wren_o(wren_c2),
      .trig_o(trigger_c2),
      .lwnct_rst_o(lwnct_rst_c2),
      .snct_cmp_ce_o (snct_cmp_ce_c2),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c2),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c2)
   );
   
    axis_cap_ctrl_v1_0_0_case3
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_3
   (

      .ila_clk_i(ila_clk),

      .arm_i(armed_edge),

      .halt_i(halt),

      .trig_i(trigger_temp),

      .aresetn_i(aresetn),

      .capture_i(capture_i),

      .ct_state_o(ct_state_c3),

      .cap_done_o(done_c3),

      .wren_o(wren_c3),

      .trig_o(trigger_c3),

      .lwnct_rst_o(lwnct_rst_c3),
      .snct_cmp_ce_o (snct_cmp_ce_c3),
      .wcnt_hcmp_q_i(wcnt_hcmp_q),

      .wnct_lcmp_ce_o(wnct_lcmp_ce_c3),

      .wnct_hcmp_ce_o(wnct_hcmp_ce_c3)

   );


  axis_cap_ctrl_v1_0_0_case4
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_4
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .scnt_cmp_q_i(scnt_cmp_q),
      .wcnt_lcmp_q_i(wcnt_lcmp_q),
      .wcnt_hcmp_q_i(wcnt_hcmp_q),
      .ct_state_o(ct_state_c4),
      .cap_done_o(done_c4),
      .wren_o(wren_c4),
      .trig_o(trigger_c4),
      .lwnct_rst_o(lwnct_rst_c4),
      .snct_ce_o(snct_ce_c4),
      .cmp_reset_o(cmp_reset_c4),
      .snct_cmp_ce_o (snct_cmp_ce_c4),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c4),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c4)
   );

   axis_cap_ctrl_v1_0_0_case5
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_5
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .scnt_cmp_q_i(scnt_cmp_q),
      .scnt_max_cmp_q_i(scnt_max_cmp_q),
      .wcnt_lcmp_q_i(wcnt_lcmp_q),
      .wcnt_hcmp_q_i(wcnt_hcmp_q),
      .ct_state_o(ct_state_c5),
      .cap_done_o(done_c5),
      .trig_o(trigger_c5),
      .wren_o(wren_c5),
      .lwnct_rst_o(lwnct_rst_c5),
      .scnt_rst_o(scnt_rst_c5),
      .cmp_reset_o(cmp_reset_c5),
      .snct_cmp_ce_o (snct_cmp_ce_c5),
      .snct_ce_o (snct_ce_c5),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c5),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c5)
   );
   
  axis_cap_ctrl_v1_0_0_case7
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_7
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .scnt_cmp_q_i(scnt_cmp_q),
      .scnt_max_cmp_q_i(scnt_max_cmp_q),
      .wcnt_lcmp_q_i(wcnt_lcmp_q),
      .wcnt_hcmp_q_i(wcnt_hcmp_q),
      .ct_state_o(ct_state_c7),
      .cap_done_o(done_c7),
      .trig_o(trigger_c7),
      .wren_o(wren_c7),
      .cmp_reset_o(cmp_reset_c7),
      .snct_cmp_ce_o (snct_cmp_ce_c7),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c7),
      .lwnct_rst_o(lwnct_rst_c7),
      .snct_ce_o(snct_ce_c7),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c7)
   );

  axis_cap_ctrl_v1_0_0_case6
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_6
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .scnt_cmp_q_i(scnt_cmp_q),
      .scnt_max_cmp_q_i(scnt_max_cmp_q),
      .wcnt_lcmp_q_i(wcnt_lcmp_q),
      .wcnt_hcmp_q_i(wcnt_hcmp_q),
      .ct_state_o(ct_state_c6),
      .cap_done_o(done_c6),
      .trig_o(trigger_c6),
      .wren_o(wren_c6),
      .lwnct_rst_o(lwnct_rst_c6),
      .cmp_reset_o(cmp_reset_c6),
      .snct_cmp_ce_o (snct_cmp_ce_c6),
      .snct_ce_o (snct_ce_c6),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c6),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c6)
   );

  axis_cap_ctrl_v1_0_0_case8
   #(
      .C_CNT_WIDTH(C_CNT_WIDTH)
    ) U_CASE_8
   (
      .ila_clk_i(ila_clk),
      .arm_i(armed_edge),
      .halt_i(halt),
      .trig_i(trigger_temp),
      .aresetn_i(aresetn),
      .capture_i(capture_i),
      .scnt_cmp_q_i(scnt_cmp_q),
      .scnt_max_cmp_q_i(scnt_max_cmp_q),
      .wcnt_lcmp_q_i(wcnt_lcmp_q),
      .wcnt_hcmp_q_i(wcnt_hcmp_q),
      .ct_state_o(ct_state_c8),
      .cap_done_o(done_c8),
      .trig_o(trigger_c8),
      .wren_o(wren_c8),
      .cmp_reset_o(cmp_reset_c8),
      .snct_cmp_ce_o (snct_cmp_ce_c8),
      .wnct_lcmp_ce_o(wnct_lcmp_ce_c8),
      .lwnct_rst_o(lwnct_rst_c8),
      .snct_ce_o(snct_ce_c8),
      .wnct_hcmp_ce_o(wnct_hcmp_ce_c8)
   );

 always @(posedge ila_clk)
 begin
  case (use_case_i)
    CASE_1: begin
      done           <= done_c1;
      ct_state       <= {1'b0,ct_state_c1};
    end
    CASE_2: begin
      done           <= done_c2;
      ct_state       <= {1'b0,ct_state_c2};
    end
    CASE_3: begin
      done           <= done_c3;
      ct_state       <= {1'b0,ct_state_c3};
    end
    CASE_4: begin
      done           <= done_c4;
      ct_state       <= {1'b0,ct_state_c4};
    end
    CASE_5: begin
      done           <= done_c5;
      ct_state       <= {1'b0,ct_state_c5};
    end
    CASE_6: begin
      done           <= done_c6;
      ct_state       <= {1'b0,ct_state_c6};
    end
    CASE_7: begin
      done           <= done_c7;
      ct_state       <= {1'b0,ct_state_c7};
    end
    CASE_8: begin
      done           <= done_c8;
      ct_state       <= {1'b0,ct_state_c8};
    end
    default: begin
      done           <= 'b0;
      ct_state       <= 'b0;
    end
 endcase
 end

 always @*
 begin
  case (use_case_i)
    CASE_1: begin
      ct_state_async <= {1'b0,ct_state_c1};
      done_async     <= done_c1;
      wren           <= wren_c1;
      trigger_o      <= trigger_c1;
      snct_cmp_ce    <= snct_cmp_ce_c1;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c1;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c1;
      cmp_reset      <= 1'b0;
      snct_ce        <= 1'b0;
      lwnct_rst      <= 1'b0;
      hwcnt_ce       <= 1'b0;
      scnt_rst       <= 1'b0;
    end  
    CASE_2: begin
      ct_state_async <= {1'b0,ct_state_c2};
      done_async     <= done_c2;
      wren           <= wren_c2;
      trigger_o      <= trigger_c2;
      snct_ce        <= 1'b0;
      hwcnt_ce       <= lwnct_rst_c2;
      lwnct_rst      <= lwnct_rst_c2;
      snct_cmp_ce    <= snct_cmp_ce_c2;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c2;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c2;
      cmp_reset      <= 1'b0;
      scnt_rst       <= 1'b0;
    end
    CASE_3: begin
      ct_state_async <= {1'b0,ct_state_c3};
      done_async     <= done_c3;
      wren           <= wren_c3;
      trigger_o      <= trigger_c3;
      snct_ce        <= 1'b0;
      hwcnt_ce       <= lwnct_rst_c3;
      lwnct_rst      <= lwnct_rst_c3;
      snct_cmp_ce    <= snct_cmp_ce_c3;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c3;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c3;
      cmp_reset      <= 1'b0;
      scnt_rst       <= 1'b0;
    end
    CASE_4: begin
      ct_state_async <= {1'b0,ct_state_c4};
      done_async     <= done_c4;
      wren           <= wren_c4;
      trigger_o      <= trigger_c4;
      snct_ce        <= snct_ce_c4;
      hwcnt_ce       <= lwnct_rst_c4;
      lwnct_rst      <= lwnct_rst_c4;
      snct_cmp_ce    <= snct_cmp_ce_c4;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c4;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c4;
      cmp_reset      <= cmp_reset_c4;
      scnt_rst       <= lwnct_rst_c4;
    end
    CASE_5: begin
      ct_state_async <= {1'b0,ct_state_c5};
      done_async     <= done_c5;
      wren           <= wren_c5;
      trigger_o      <= trigger_c5;
      snct_cmp_ce    <= snct_cmp_ce_c5;
      snct_ce        <= snct_ce_c5;
      hwcnt_ce       <= lwnct_rst_c5;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c5;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c5;
      cmp_reset      <= cmp_reset_c5;
      lwnct_rst      <= lwnct_rst_c5;
      scnt_rst       <= scnt_rst_c5;
    end
    CASE_6: begin
      ct_state_async <= {1'b0,ct_state_c6};
      done_async     <= done_c6;
      wren           <= wren_c6;
      trigger_o      <= trigger_c6;
      snct_cmp_ce    <= snct_cmp_ce_c6;
      snct_ce        <= snct_ce_c6;
      hwcnt_ce       <= lwnct_rst_c6;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c6;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c6;
      cmp_reset      <= cmp_reset_c6;
      lwnct_rst      <= lwnct_rst_c6;
      scnt_rst       <= lwnct_rst_c6;
    end
    CASE_7: begin
      ct_state_async <= {1'b0,ct_state_c7};
      done_async     <= done_c7;
      wren           <= wren_c7;
      trigger_o      <= trigger_c7;
      snct_ce        <= snct_ce_c7;
      hwcnt_ce       <= lwnct_rst_c7;
      lwnct_rst      <= lwnct_rst_c7;
      snct_cmp_ce    <= snct_cmp_ce_c7;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c7;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c7;
      cmp_reset      <= cmp_reset_c7;
      scnt_rst       <= lwnct_rst_c7;
    end
    CASE_8: begin
      ct_state_async <= {1'b0,ct_state_c8};
      done_async     <= done_c8;
      wren           <= wren_c8;
      trigger_o      <= trigger_c8;
      snct_ce        <= snct_ce_c8;
      hwcnt_ce       <= lwnct_rst_c8;
      lwnct_rst      <= lwnct_rst_c8;
      snct_cmp_ce    <= snct_cmp_ce_c8;
      wnct_lcmp_ce   <= wnct_lcmp_ce_c8;
      wnct_hcmp_ce   <= wnct_hcmp_ce_c8;
      cmp_reset      <= cmp_reset_c8;
      scnt_rst       <= lwnct_rst_c8;
    end
    default: begin
      ct_state_async <= 'b0; 
      done_async     <= 'b0; 
      wren           <= 'b0; 
      trigger_o      <= 'b0; 
      snct_cmp_ce    <= 'b0; 
      wnct_lcmp_ce   <= 'b0; 
      wnct_hcmp_ce   <= 'b0; 
      cmp_reset      <= 'b0; 
      lwnct_rst      <= 'b0; 
      hwcnt_ce       <= 'b0; 
      snct_ce        <= 'b0; 
      scnt_rst       <= 1'b0;
    end
 endcase
 end
  assign full            = done;
  assign full_iclk       = done;
  assign trig_state      = ct_state;
  assign trig_state_iclk = ct_state;
  assign write_en        = wren;
  assign lwcnt_rst_o     = lwnct_rst;
  
  //genvar i;
  //generate
  //  for (i=0; i < C_CNT_WIDTH; i=i+1)
  //  begin: ADDR_SEL
  //    assign addr[i] = addr_sel[i] == 1'b1 ? scnt_i[i] : hwcnt_i[i-max_bit];
  //  end
  //endgenerate

  assign scnt  = scnt_temp;
  assign hwcnt = hwcnt_temp;
  assign lwcnt = lwcnt_temp;
  assign addr = addr_temp;
  //assign trigger_o = (ct_state == 3'b010) ? trigger_temp : 1'b0;
endmodule






`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case1
 #(
   parameter C_CNT_WIDTH = 8
  )
 (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,

   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      wren_o,
   output wire                      trig_o,
   output wire                      snct_cmp_ce_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o
 );

  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   POST_TRIG = 2'b11;
  reg [1:0] state = IDLE;
  reg done = 1'b0;

 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state <= IDLE;
     done  <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
        if (arm_i == 1'b1) 
        begin
          state <= TRIG;
          done  <= 1'b0;
        end
        else // arm_i = 0
        begin
          state <= IDLE;
        end
       end
       TRIG: begin
          if (trig_i == 1'b1)
          begin
            state <= IDLE;
            done  <= 1'b1;
          end
          else // trig_i = 0
          begin
            state <= TRIG;
            done  <= 1'b0;
          end
       end
       default: begin
          state <= IDLE;
          done  <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = state;
 assign trig_o         = (state == TRIG) ? trig_i : 1'b0;
 assign cap_done_o     = done;
 assign wren_o         = (state == TRIG && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = (state == TRIG && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign snct_cmp_ce_o  = 1'b0;
 assign wnct_hcmp_ce_o = 1'b0;

endmodule


`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case2
 #(
   parameter C_CNT_WIDTH = 8
  )
 (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,

   output reg  [C_CNT_WIDTH-1:0]    addr_o,
   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      wren_o,
   output wire                      trig_o,
   output wire                      snct_cmp_ce_o,
   output wire                      lwnct_rst_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o
 );

  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   TRIG2     = 2'b11;
 
 reg [1:0] state = IDLE;
 reg done = 1'b0;

 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state  <= IDLE;
     addr_o <= 'b0;
     done  <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
        if (arm_i == 1'b1) 
        begin
          done  <= 1'b0;
          state <= TRIG;
        end
        else // arm_i = 0
        begin
          state <= IDLE;
        end
        addr_o <= 'b0;
       end
       TRIG: begin
          if (trig_i == 1'b1)
          begin
            state <= TRIG2;
          end
          else // trig_i = 0
          begin
            state <= TRIG;
          end
          addr_o <= 'b0;
          done   <= 1'b0;
       end
       TRIG2: begin
          if (trig_i == 1'b1)
          begin
            state <= IDLE;
            done  <= 1'b1;
          end
          else // trig_i = 0
          begin
            state <= TRIG2;
            done  <= 1'b0;
          end
          addr_o <= 'b0;
       end
       default: begin
          state  <= IDLE;
          addr_o <= 'b0;
          done   <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = (state  == TRIG || state == TRIG2) ?  TRIG   : IDLE;
 assign trig_o         = (state  == TRIG || state == TRIG2) ?  trig_i : 1'b0;
 assign cap_done_o     = done;
 assign wren_o         = ((state == TRIG || state == TRIG2) && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = ((state == TRIG || state == TRIG2) && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = ((state == TRIG) && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign snct_cmp_ce_o  = 1'b0;
 assign wnct_hcmp_ce_o = 1'b0;

endmodule


`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case3
 #(
   parameter C_CNT_WIDTH = 8
  )
 (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,
   input                            wcnt_hcmp_q_i,

   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      wren_o,
   output wire                      trig_o,
   output wire                      snct_cmp_ce_o,
   output wire                      lwnct_rst_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o
 );

  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   TRIG2     = 2'b11;
 
 reg [1:0] state = IDLE;
 reg done = 1'b0;

 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state  <= IDLE;
     done  <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
        if (arm_i == 1'b1) 
        begin
          done  <= 1'b0;
          state <= TRIG;
        end
        else // arm_i = 0
        begin
          state <= IDLE;
        end
       end
       TRIG: begin
         if (wcnt_hcmp_q_i == 1'b1)
         begin
           state <= TRIG2;
         end
         else // trig_i = 0
         begin
           state <= TRIG;
         end
         done  <= 1'b0;
       end
       TRIG2: begin
          if (trig_i == 1'b1)
          begin
            state <= IDLE;
            done  <= 1'b1;
          end
          else // trig_i = 0
          begin
            state <= TRIG2;
            done  <= 1'b0;
          end
       end
       default: begin
          state  <= IDLE;
          done  <= 1'b0;
          end
     endcase
   end
 end

 assign ct_state_o     = (state  == TRIG || state == TRIG2) ?  TRIG   : IDLE;
 assign trig_o         = (state  == TRIG || state == TRIG2) ?  trig_i : 1'b0;
 assign cap_done_o     = done;
 assign wren_o         = ((state == TRIG || state == TRIG2) && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = ((state == TRIG || state == TRIG2) && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = ((state == TRIG) && trig_i == 1'b1) ? 1'b1 : 1'b0;
 assign snct_cmp_ce_o  = 1'b0;
 assign wnct_hcmp_ce_o = ((state == TRIG) && trig_i == 1'b1) ? 1'b1 : 1'b0;

endmodule


`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case4
 #(
   parameter C_CNT_WIDTH = 8
  )
 (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,
   input                            scnt_cmp_q_i,
   input                            wcnt_hcmp_q_i,
   input                            wcnt_lcmp_q_i,

   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      wren_o,
   output wire                      trig_o,
   output wire                      snct_ce_o,
   output wire                      lwnct_rst_o,
   output wire                      cmp_reset_o,
   output wire                      snct_cmp_ce_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o
 );

  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   POST_TRIG = 2'b11;
 reg [1:0] state = IDLE;
 reg done = 1'b0;
 
 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state <= IDLE;
     done  <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
        if (arm_i == 1'b1) 
        begin
          state  <= TRIG;
          done  <= 1'b0;
        end
        else // arm_i = 0
        begin
          state <= IDLE;
        end
       end
       TRIG: begin
          if (trig_i == 1'b1)
          begin
            state  <= POST_TRIG;
          end
          else // trig_i = 0
          begin
            state <= TRIG;
          end
          done  <= 1'b0;
       end
       POST_TRIG: begin
          if (capture_i == 1'b1)
          begin
            if (wcnt_hcmp_q_i == 1'b1 & wcnt_lcmp_q_i == 1'b1 )//Max window cnt and scnt reached
            begin
              state  <= IDLE;
              done   <= 1'b1;
            end
            else if (wcnt_lcmp_q_i == 1'b1)//Max scnt reached --> incr window cnt
            begin
              state   <= TRIG;
              done    <= 1'b0;
            end
            else//continue to capture till scnt max
            begin
              state  <= POST_TRIG;
              done   <= 1'b0;
           end
          end
          else // capture_i = 0
          begin
            state  <= POST_TRIG;
            done   <= 1'b0;
          end
       end
       default: begin
          state  <= IDLE;
          done   <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = state;
 assign trig_o         = (state  == TRIG) ?  trig_i : 1'b0;
 assign cap_done_o     = done;
 assign cmp_reset_o    = 1'b0;
 assign snct_cmp_ce_o  = ((state == TRIG & trig_i == 1'b1) || (state == POST_TRIG & capture_i == 1'b1)) ? 1'b1 : 1'b0;
 assign wren_o         = ((state == TRIG & trig_i == 1'b1) || (state == POST_TRIG & capture_i == 1'b1)) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = ((state == TRIG & trig_i == 1'b1) || (state == POST_TRIG & capture_i == 1'b1)) ? 1'b1 : 1'b0;
 assign wnct_hcmp_ce_o = ((state == TRIG & trig_i == 1'b1) || (state == POST_TRIG & capture_i == 1'b1)) ? 1'b1 : 1'b0;
 assign snct_ce_o      = ((state == TRIG & trig_i == 1'b1) || (state == POST_TRIG & capture_i == 1'b1)) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = (capture_i == 1'b1 & state == POST_TRIG & wcnt_hcmp_q_i == 1'b0 & wcnt_lcmp_q_i == 1'b1) ? 1'b1 : 1'b0;

endmodule


`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case5
 #(
   parameter C_CNT_WIDTH = 8
  )
  (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,
   input                            scnt_cmp_q_i,
   input                            scnt_max_cmp_q_i,
   input                            wcnt_hcmp_q_i,
   input                            wcnt_lcmp_q_i,

   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      trig_o,
   output wire                      wren_o,
   output wire                      lwnct_rst_o,
   output wire                      scnt_rst_o,
   output wire                      cmp_reset_o,
   output wire                      snct_cmp_ce_o,
   output wire                      snct_ce_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o
 );
  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   POST_TRIG = 2'b11;
 reg [1:0] state = IDLE;
 reg done = 1'b0;
 

 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state   <= IDLE;
     done    <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
          if (arm_i == 1'b1) 
          begin
            state   <= PRE_TRIG;
            done    <= 1'b0;
          end
          else // arm_i = 0
          begin
            state <= IDLE;
          end
       end
       PRE_TRIG: begin
          if (capture_i == 1'b1) 
          begin
            state   <= TRIG;
          end
          else
          begin
            state   <= PRE_TRIG;
          end
          done    <= 1'b0;
        end
       TRIG: begin
          if (trig_i == 1'b1)
          begin
            if (wcnt_hcmp_q_i == 1'b1)//Max window cnt reached
            begin
              state   <= IDLE;
              done    <= 1'b1;
            end
            else
            begin
              state   <= PRE_TRIG;
              done    <= 1'b0;
            end
          end
          else // trig_i = 0
          begin
            state <= TRIG;
            done  <= 1'b0;
          end
       end
       default: begin
          state   <= IDLE;
          done    <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = state;
 assign trig_o         = (state  == TRIG) ?  trig_i : 1'b0;
 assign cap_done_o     = done;
 assign cmp_reset_o    = 1'b0;
 assign snct_cmp_ce_o  = ((capture_i == 1'b1 & (state == PRE_TRIG || state == TRIG)) || (state == TRIG & trig_i == 1'b1)) ? 1'b1 : 1'b0;
 assign snct_ce_o      = ((capture_i == 1'b1 & (state == PRE_TRIG || state == TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wren_o         = ((capture_i == 1'b1 & (state == PRE_TRIG || state == TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = (state == TRIG & trig_i == 1'b1 & wcnt_hcmp_q_i == 1'b0) ? 1'b1 : 1'b0;
 assign scnt_rst_o     = (state == TRIG & trig_i == 1'b1);
 assign wnct_lcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wnct_hcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;

endmodule



`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case6
 #(
   parameter C_CNT_WIDTH = 8
  )
  (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,
   input                            scnt_cmp_q_i,
   input                            scnt_max_cmp_q_i,
   input                            wcnt_hcmp_q_i,
   input                            wcnt_lcmp_q_i,

   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      trig_o,
   output wire                      wren_o,
   output wire                      lwnct_rst_o,
   output wire                      cmp_reset_o,
   output wire                      snct_cmp_ce_o,
   output wire                      snct_ce_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o
 );
  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   POST_TRIG = 2'b11;
 reg [1:0] state = IDLE;
 reg done = 1'b0;
 

 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state  <= IDLE;
     done   <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
          if (arm_i == 1'b1) 
          begin
            state  <= PRE_TRIG;
            done   <= 1'b0;
          end
          else // arm_i = 0
          begin
            state <= IDLE;
          end
       end
       PRE_TRIG: begin
          if (capture_i == 1'b1) 
          begin
            if (scnt_cmp_q_i == 1'b1)
            begin
              state   <= TRIG;
            end
            else
            begin
              state   <= PRE_TRIG;
            end
          end
          done   <= 1'b0;
       end

       TRIG: begin
          if (trig_i == 1'b1)
          begin
            if (wcnt_hcmp_q_i == 1'b1)//Max window cnt reached
            begin
              state  <= IDLE;
              done   <= 1'b1;
            end
            else
            begin
              state  <= PRE_TRIG;
              done   <= 1'b0;
            end
          end
          else // trig_i = 0
          begin
            state <= TRIG;
            done  <= 1'b0;
          end
       end
       default: begin
          state <= IDLE;
          done  <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = state;
 assign trig_o         = (state  == TRIG) ?  trig_i : 1'b0;
 assign cap_done_o     = done;
 assign cmp_reset_o    = 1'b0;
 assign snct_cmp_ce_o  = ((capture_i == 1'b1 & (state == PRE_TRIG || state == TRIG)) || (state == TRIG & trig_i == 1'b1)) ? 1'b1 : 1'b0;
 assign snct_ce_o      = ((capture_i == 1'b1 & (state == PRE_TRIG || state == TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wren_o      = ((capture_i == 1'b1 & (state == PRE_TRIG || state == TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = (state == TRIG & trig_i == 1'b1 & wcnt_hcmp_q_i == 1'b0) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wnct_hcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;

endmodule


`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case7
 #(
   parameter C_CNT_WIDTH = 8
  )
 (
   input                            ila_clk_i,
   input                            arm_i,
   input                            halt_i,
   input                            trig_i,
   input                            aresetn_i,
   input                            capture_i,
   input                            scnt_cmp_q_i,
   input                            scnt_max_cmp_q_i,
   input                            wcnt_hcmp_q_i,
   input                            wcnt_lcmp_q_i,

   output wire [1:0]                ct_state_o,
   output wire                      cap_done_o,
   output wire                      trig_o,
   output wire                      wren_o,
   output wire                      cmp_reset_o,
   output wire                      snct_cmp_ce_o,
   output wire                      wnct_lcmp_ce_o,
   output wire                      wnct_hcmp_ce_o,
   output wire                      lwnct_rst_o,
   output wire                      snct_ce_o
 );
  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   POST_TRIG = 2'b11;
 reg [1:0] state = IDLE;
 reg done = 1'b0;
 
 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state   <= IDLE;
     done    <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
          if (arm_i == 1'b1) 
          begin
            state   <= PRE_TRIG;
            done    <= 1'b0;
          end
          else // arm_i = 0
          begin
            state <= IDLE;
          end
       end
       PRE_TRIG: begin
          if (capture_i == 1'b1) 
          begin
            state   <= TRIG;
          end
          else // capture_i = 0
          begin
            state   <= PRE_TRIG;
          end
          done    <= 1'b0;
       end
       TRIG: begin
          if (trig_i == 1'b1)
          begin
            state   <= POST_TRIG;
          end
          else // trig_i = 0
          begin
            if (capture_i == 1'b1) 
            begin
            end
            state <= TRIG;
          end
          done    <= 1'b0;
       end
       POST_TRIG: begin
          if (capture_i == 1'b1)//--Akshay: check with SQC if max_hwcnt is reached when capture=0
          begin
            if (wcnt_hcmp_q_i == 1'b1 & wcnt_lcmp_q_i == 1'b1 )//Max window cnt and scnt reached
            begin
              state   <= IDLE;
              done    <= 1'b1;
            end
            else if (wcnt_lcmp_q_i == 1'b1)//Max scnt reached --> incr window cnt
            begin
              state   <= PRE_TRIG;
              done    <= 1'b0;
            end
            else//continue to capture till scnt max
            begin
              state   <= POST_TRIG;
              done    <= 1'b0;
           end
          end
          else // capture_i = 0
          begin
            state  <= POST_TRIG;
            done   <= 1'b0;
          end
       end
       default: begin
          state   <= IDLE;
          done    <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = state;
 assign trig_o         = (state  == TRIG) ?  trig_i : 1'b0;
 assign cap_done_o     = done;
 assign cmp_reset_o    = 1'b0;
 assign snct_cmp_ce_o  = (capture_i == 1'b1 || (state == TRIG & trig_i == 1'b1)) ? 1'b1 : 1'b0;
 assign snct_ce_o      = ((capture_i == 1'b1 & (state != IDLE)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = ( capture_i == 1'b1 & state == POST_TRIG & wcnt_hcmp_q_i == 1'b0 & wcnt_lcmp_q_i == 1'b1) ? 1'b1 : 1'b0;
 assign wren_o         = ((capture_i == 1'b1 & (state != IDLE)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG || state == POST_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wnct_hcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG || state == POST_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;

endmodule


`timescale 1 ns / 1 ps
module axis_cap_ctrl_v1_0_0_case8
 #(
   parameter C_CNT_WIDTH = 8
  )
 (
   input             ila_clk_i,
   input             arm_i,
   input             halt_i,
   input             trig_i,
   input             aresetn_i,
   input             capture_i,
   input             scnt_cmp_q_i,
   input             scnt_max_cmp_q_i,
   input             wcnt_hcmp_q_i,
   input             wcnt_lcmp_q_i,

   output wire [1:0] ct_state_o,
   output wire       cap_done_o,
   output wire       trig_o,
   output wire       wren_o,
   output wire       cmp_reset_o,
   output wire       snct_cmp_ce_o,
   output wire       wnct_lcmp_ce_o,
   output wire       wnct_hcmp_ce_o,
   output wire       lwnct_rst_o,
   output wire       snct_ce_o
 );

  localparam [1:0] IDLE      = 2'b00,
                   PRE_TRIG  = 2'b01,
                   TRIG      = 2'b10,
                   POST_TRIG = 2'b11;
 reg [1:0] state = IDLE;
 reg done = 1'b0;
 
 always @(posedge ila_clk_i)
 begin
   if (!aresetn_i)
   begin
     state <= IDLE;
     done  <= 1'b0;
   end
   else
   begin
     case (state)
       IDLE: begin
          if (arm_i == 1'b1) 
          begin
            state   <= PRE_TRIG;
            done  <= 1'b0;
          end
          else // arm_i = 0
          begin
            state <= IDLE;
          end
       end
       PRE_TRIG: begin
          if (capture_i == 1'b1) 
          begin
            if (scnt_cmp_q_i == 1'b1)
            begin
              state <= TRIG;
            end
            else
            begin
              state <= PRE_TRIG;
            end
          end
          done  <= 1'b0;
       end
       TRIG: begin
          if (trig_i == 1'b1)
          begin
            state   <= POST_TRIG;
          end
          else // waiting for trigger
          begin
            state <= TRIG;
          end
          done  <= 1'b0;
       end
       POST_TRIG: begin
          if (capture_i == 1'b1)//--Akshay: check with SQC if max_hwcnt is reached when capture=0
          begin
            if (wcnt_hcmp_q_i == 1'b1 & wcnt_lcmp_q_i == 1'b1 )//Max window cnt and scnt reached
            begin
              state <= IDLE;
              done  <= 1'b1;
            end
            else if (wcnt_lcmp_q_i == 1'b1)//Max scnt reached --> incr window cnt
            begin
              state <= PRE_TRIG;
              done  <= 1'b0;
            end
            else//continue to capture till scnt max
            begin
              state <= POST_TRIG;
              done  <= 1'b0;
           end
          end
          else // capture_i = 0
          begin
            state <= POST_TRIG;
            done  <= 1'b0;
          end
       end
       default: begin
          state <= IDLE;
          done  <= 1'b0;
       end
     endcase
   end
 end

 assign ct_state_o     = state;
 assign trig_o         = (state  == TRIG) ?  trig_i : 1'b0;
 //assign cap_done_o    = (capture_i == 1'b1 & state == POST_TRIG & wcnt_hcmp_q_i == 1'b1 & wcnt_lcmp_q_i == 1'b1) ? 1'b1 : 1'b0;
 assign cap_done_o     = done;
 assign cmp_reset_o    = 1'b0;
 assign snct_cmp_ce_o  = ( capture_i == 1'b1 || (state == TRIG & trig_i == 1'b1)) ? 1'b1 : 1'b0;
 assign snct_ce_o      = ((capture_i == 1'b1 & (state != IDLE)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign lwnct_rst_o    = (capture_i  == 1'b1 & state == POST_TRIG & wcnt_hcmp_q_i == 1'b0 & wcnt_lcmp_q_i == 1'b1) ? 1'b1 : 1'b0;
 assign wren_o         = ((capture_i == 1'b1 & (state != IDLE)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wnct_lcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG || state == POST_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;
 assign wnct_hcmp_ce_o = ((capture_i == 1'b1 & (state == PRE_TRIG || state == POST_TRIG)) || (state == TRIG & trig_i == 1'b1 )) ? 1'b1 : 1'b0;

endmodule


