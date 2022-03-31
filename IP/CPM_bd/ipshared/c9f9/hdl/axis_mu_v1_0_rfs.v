`timescale  1ns/1ps

module axis_mu_v1_0_0_allx_carry_logic #(
   parameter C_WIDTH   = 32
  ) (
   input                clk,
   input                aresetn,
   input  [C_WIDTH-1:0] sel_for_carry,
   input  [C_WIDTH-1:0] di_for_carry,
   input                ci,
   output               co
  );

  `include "axis_mu_v1_0_0_mu_pkg.vh"

  localparam integer LC_LAST = last_carry4(C_WIDTH);
  localparam integer LC_CRY4_CNT = cry4_cnt(C_WIDTH);
  localparam integer LC_REM_BIT = (LC_LAST == 0) ? 0 : (C_WIDTH - ((LC_CRY4_CNT-1) * 4));

  wire [LC_CRY4_CNT:0] all_carry;
  wire [2:0]         d_lo;
  wire [(LC_CRY4_CNT*3)-1:0]         d_low;
  reg                co_temp;
  wire [3:0] sel_for_carry_int;
  wire [3:0] di_for_carry_int;

  CARRY4 carry_start 
  (
    .O(),
    .CO({all_carry[0],d_lo}),
    .CI(),
    .CYINIT(1'b1),
    .DI(4'h0),
    .S({3'h7,ci})
  ); 

  genvar i;
  generate
    if (LC_LAST == 0)
    begin
      for (i = 0; i < LC_CRY4_CNT; i = i + 1)
      begin: L1
        CARRY4 u_carry4_inst 
        (
          .O(),
          .CO({all_carry[i+1],d_low[i*3 +: 3]}),
          .CYINIT(1'b0),
          .CI(all_carry[i]),
          .DI(di_for_carry[i*4 +: 4]),
          .S(sel_for_carry[i*4 +: 4]) 
        );
      end
    end
    else
    begin
      for (i = 0; i < LC_CRY4_CNT-1; i = i + 1)
      begin: L1
        CARRY4 u_carry4_inst 
        (
          .O(),
          .CO({all_carry[i+1],d_low[i*3 +: 3]}),
          .CYINIT(1'b0),
          .CI(all_carry[i]),
          .DI(di_for_carry[i*4 +: 4]),
          .S(sel_for_carry[i*4 +: 4]) 
        );
      end
    end
  endgenerate

  generate
    if (LC_LAST == 1)
    begin: last
      if (LC_REM_BIT == 1)
      begin
        assign di_for_carry_int[3:0] = {1'b1,1'b1,1'b1,di_for_carry[C_WIDTH-1]};
        assign sel_for_carry_int[3:0] = {1'b1,1'b1,1'b1,sel_for_carry[C_WIDTH-1]};
      end
      else if (LC_REM_BIT == 2)
      begin
        assign di_for_carry_int[3:0] = {1'b1,1'b1,di_for_carry[C_WIDTH-1:C_WIDTH-2]};
        assign sel_for_carry_int[3:0] = {1'b1,1'b1,sel_for_carry[C_WIDTH-1:C_WIDTH-2]};
      end
      else if (LC_REM_BIT == 3)
      begin
        assign di_for_carry_int[3:0] = {1'b1,di_for_carry[C_WIDTH-1:C_WIDTH-3]};
        assign sel_for_carry_int[3:0] = {1'b1,sel_for_carry[C_WIDTH-1:C_WIDTH-3]};
      end
        CARRY4 u_carry4_inst 
        (
          .O(),
          .CO({all_carry[LC_CRY4_CNT],d_low[(LC_CRY4_CNT*3)-1:(LC_CRY4_CNT*3)-3]}),
          .CYINIT(1'b0),
          .CI(all_carry[LC_CRY4_CNT-1]),
          .DI(di_for_carry_int[3:0]),
          .S(sel_for_carry_int[3:0]) 
        );
    end
  endgenerate

  always @ (posedge clk)
  begin
    if (!aresetn)
    begin
      co_temp <= 1'b0;
    end
    else
    begin
      co_temp <= all_carry[LC_CRY4_CNT];
    end
  end
  
  assign co = co_temp; 
  
endmodule


`timescale  1ns/1ps

//`include "func_inc.vh"

//import definitions::*;

module axis_mu_v1_0_0_allx #(
   parameter C_WIDTH   = 32,
   parameter C_EN_WIDTH = 16,
   parameter C_EN_PIPE = 0
  ) (
   input  cfg_din,
   input  [C_EN_WIDTH-1:0] cfg_en,
   input  cfg_clk,
   input  clk,
   input  [C_WIDTH-1:0] data_in,
   output [C_EN_WIDTH-1:0] sel_for_carry,
   output [C_EN_WIDTH-1:0] di_for_carry,
   output [C_EN_WIDTH-1:0] cfg_dout
  );

  `include "axis_mu_v1_0_0_mu_pkg.vh"

  localparam integer LC_LAST = last_allx_cfglut(C_WIDTH);

  wire [C_EN_WIDTH-1:0] o6_o;
  wire [C_EN_WIDTH-1:0] o5_o;
  reg [C_WIDTH-1:0] data_in_dly1;

  always @ (posedge clk)
  begin
    data_in_dly1 <= data_in;
  end

  genvar i;
  generate
    if (LC_LAST == 0)
    begin
      for (i = 0; i < C_EN_WIDTH; i = i + 1)
      begin: L1
        CFGLUT5 l1_cfglut 
          (
            .CDI   (cfg_din),
            .CE    (cfg_en[i]),
            .CLK   (cfg_clk),
            .O6    (o6_o[i]),              //(sel[3]),
            .O5    (o5_o[i]),              //(mux_di[3]),
            .CDO   (),
            .I4    (1'b1),
            .I3    (data_in_dly1[(i*2)+1]),
            .I2    (data_in[(i*2)+1]),  
            .I1    (data_in_dly1[i*2]),  
            .I0    (data_in[i*2])
          );
      end
    end
    else
    begin
      for (i = 0; i < C_EN_WIDTH-1; i = i + 1)
      begin: L1
        CFGLUT5 l1_cfglut 
          (
            .CDI   (cfg_din),
            .CE    (cfg_en[i]),
            .CLK   (cfg_clk),
            .O6    (o6_o[i]),              //(sel[3]),
            .O5    (o5_o[i]),              //(mux_di[3]),
            .CDO   (),
            .I4    (1'b1),
            .I3    (data_in_dly1[(i*2)+1]),
            .I2    (data_in[(i*2)+1]),  
            .I1    (data_in_dly1[i*2]),  
            .I0    (data_in[i*2])
          );
      end
    end
  endgenerate

  generate
    if (LC_LAST == 1)
    begin: last
      CFGLUT5 l1_last_cfglut 
        (
          .CDI   (cfg_din),
          .CE    (cfg_en[C_EN_WIDTH-1]),
          .CLK   (cfg_clk),
          .O6    (o6_o[C_EN_WIDTH-1]),              //(sel[3]),
          .O5    (o5_o[C_EN_WIDTH-1]),              //(mux_di[3]),
          .CDO   (),
          .I4    (1'b1),
          .I3    (1'b1),
          .I2    (1'b1),  
          .I1    (data_in_dly1[C_WIDTH-1]),  
          .I0    (data_in[C_WIDTH-1])
        );
    end
  endgenerate

  assign sel_for_carry[C_EN_WIDTH-1:0] = o6_o[C_EN_WIDTH-1:0];
  assign di_for_carry[C_EN_WIDTH-1:0] = o5_o[C_EN_WIDTH-1:0];

  assign cfg_dout = 'h0;
endmodule



`timescale  1ns/1ps

//`include "func_inc.vh"

//import definitions::*;

module axis_mu_v1_0_0_mu_eq #(
   parameter C_WIDTH   = 32,
   parameter C_EN_WIDTH = 7,
   parameter C_MATCH_OUT_ASYNC = 0,
   parameter C_EN_PIPE = 0
  ) (
   input  cfg_din,
   input  [C_EN_WIDTH-1:0] cfg_en,
   input  cfg_clk,
   input  clk,
   input  [C_WIDTH-1:0] data_in,
   input  g_and_or,
   output        match_out,
   output [C_EN_WIDTH-1:0] cfg_dout
  );

  `include "axis_mu_v1_0_0_mu_pkg.vh"

  localparam integer LC_LAST = last_eq_cfglut(C_WIDTH);
  localparam integer LC_REM_BIT = (LC_LAST == 0) ? 0 : (C_WIDTH - ((C_EN_WIDTH-1) * 5));

  wire [C_EN_WIDTH-1:0] o6_o;
  wire [C_EN_WIDTH-1:0] o5_o;
  wire [4:0] data_int;
  reg match_dout;

  genvar i;
  generate
    if (LC_LAST == 0)
    begin
      for (i = 0; i < C_EN_WIDTH; i = i + 1)
      begin: L1
        CFGLUT5 l1_cfglut 
          (
            .CDI   (cfg_din),
            .CE    (cfg_en[i]),
            .CLK   (cfg_clk),
            .O6    (o6_o[i]),
            .O5    (o5_o[i]),
            .CDO   (),
            .I4    (data_in[(i*5)+4]),
            .I3    (data_in[(i*5)+3]),
            .I2    (data_in[(i*5)+2]),  
            .I1    (data_in[(i*5)+1]),  
            .I0    (data_in[i*5])
          );
      end
    end
    else
    begin
      for (i = 0; i < C_EN_WIDTH-1; i = i + 1)
      begin: L1
        CFGLUT5 l1_cfglut 
          (
            .CDI   (cfg_din),
            .CE    (cfg_en[i]),
            .CLK   (cfg_clk),
            .O6    (o6_o[i]),
            .O5    (o5_o[i]),
            .CDO   (),
            .I4    (data_in[(i*5)+4]),
            .I3    (data_in[(i*5)+3]),
            .I2    (data_in[(i*5)+2]),  
            .I1    (data_in[(i*5)+1]),  
            .I0    (data_in[i*5])
          );
      end
    end
  endgenerate

  generate
    if (LC_LAST == 1)
    begin: last
      if (LC_REM_BIT == 1)
      begin
        assign data_int[4:0] = {1'b1,1'b1,1'b1,1'b1,data_in[C_WIDTH-1]};
      end
      else if (LC_REM_BIT == 2)
      begin
        assign data_int[4:0] = {1'b1,1'b1,1'b1,data_in[C_WIDTH-1:C_WIDTH-2]};
      end
      else if (LC_REM_BIT == 3)
      begin
        assign data_int[4:0] = {1'b1,1'b1,data_in[C_WIDTH-1:C_WIDTH-3]};
      end
      else if (LC_REM_BIT == 4)
      begin
        assign data_int[4:0] = {1'b1,data_in[C_WIDTH-1:C_WIDTH-4]};
      end
      CFGLUT5 l1_last_cfglut 
        (
          .CDI   (cfg_din),
          .CE    (cfg_en[C_EN_WIDTH-1]),
          .CLK   (cfg_clk),
          .O6    (o6_o[C_EN_WIDTH-1]),
          .O5    (o5_o[C_EN_WIDTH-1]),
          .CDO   (),
          .I4    (data_int[4]),
          .I3    (data_int[3]),
          .I2    (data_int[2]),  
          .I1    (data_int[1]),  
          .I0    (data_int[0])
        );
    end
  endgenerate

  always @ (posedge clk)
  begin
    if (g_and_or == 1'b1)
    begin
      if (o6_o == {C_EN_WIDTH{1'b1}})
      begin
        match_dout <= 1'b1;
      end
      else
      begin
        match_dout <= 1'b0;
      end
    end
    else
    begin
      if (o6_o != {C_EN_WIDTH{1'b0}})
      begin
        match_dout <= 1'b1;
      end
      else
      begin
        match_dout <= 1'b0;
      end
    end
  end
  generate
    if (C_MATCH_OUT_ASYNC == 1)
    begin: mu_async
      assign match_out = ((g_and_or == 1'b1) && (o6_o == {C_EN_WIDTH{1'b1}})) ? 1'b1 : 1'b0;
    end
    else
    begin: mu_sync
      assign match_out = match_dout;
    end
  endgenerate

  assign cfg_dout = 'h0;
endmodule



`timescale  1ns/1ps

//`include "func_inc.vh"

//import definitions::*;

module axis_mu_v1_0_0_mu_eq_edge #(
   parameter C_WIDTH   = 32,
   parameter C_EN_WIDTH = 16,
   parameter C_EN_PIPE = 0
  ) (
   input  cfg_din,
   input  [C_EN_WIDTH-1:0] cfg_en,
   input  cfg_clk,
   input  clk,
   input  g_and_or,
   input  [C_WIDTH-1:0] data_in,
   output        match_out,
   output [C_EN_WIDTH-1:0] cfg_dout
  );

  `include "axis_mu_v1_0_0_mu_pkg.vh"

  localparam integer LC_LAST = last_eq_edge_cfglut(C_WIDTH);

  wire [C_EN_WIDTH-1:0] o6_o;
  wire [C_EN_WIDTH-1:0] o5_o;
  reg [C_WIDTH-1:0] data_in_dly1;
  reg match_dout;

  always @ (posedge clk)
  begin
    data_in_dly1 <= data_in;
  end

  genvar i;
  generate
    if (LC_LAST == 0)
    begin
      for (i = 0; i < C_EN_WIDTH; i = i + 1)
      begin: L1
        CFGLUT5 l1_cfglut 
          (
            .CDI   (cfg_din),
            .CE    (cfg_en[i]),
            .CLK   (cfg_clk),
            .O6    (o6_o[i]),
            .O5    (o5_o[i]),
            .CDO   (),
            .I4    (1'b1),
            .I3    (data_in_dly1[(i*2)+1]),
            .I2    (data_in[(i*2)+1]),  
            .I1    (data_in_dly1[i*2]),  
            .I0    (data_in[i*2])
          );
      end
    end
    else
    begin
      for (i = 0; i < C_EN_WIDTH-1; i = i + 1)
      begin: L1
        CFGLUT5 l1_cfglut 
          (
            .CDI   (cfg_din),
            .CE    (cfg_en[i]),
            .CLK   (cfg_clk),
            .O6    (o6_o[i]),
            .O5    (o5_o[i]),
            .CDO   (),
            .I4    (1'b1),
            .I3    (data_in_dly1[(i*2)+1]),
            .I2    (data_in[(i*2)+1]),  
            .I1    (data_in_dly1[i*2]),  
            .I0    (data_in[i*2])
          );
      end
    end
  endgenerate

  generate
    if (LC_LAST == 1)
    begin: last
      CFGLUT5 l1_last_cfglut 
        (
          .CDI   (cfg_din),
          .CE    (cfg_en[C_EN_WIDTH-1]),
          .CLK   (cfg_clk),
          .O6    (o6_o[C_EN_WIDTH-1]),
          .O5    (o5_o[C_EN_WIDTH-1]),
          .CDO   (),
          .I4    (1'b1),
          .I3    (1'b1),
          .I2    (1'b1),  
          .I1    (data_in_dly1[C_WIDTH-1]),  
          .I0    (data_in[C_WIDTH-1])
        );
    end
  endgenerate

  always @ (posedge clk)
  begin
    if (g_and_or == 1'b1)
    begin
      if (o6_o == {C_EN_WIDTH{1'b1}})
      begin
        match_dout <= 1'b1;
      end
      else
      begin
        match_dout <= 1'b0;
      end
    end
    else
    begin
      if (o6_o != {C_EN_WIDTH{1'b0}})
      begin
        match_dout <= 1'b1;
      end
      else
      begin
        match_dout <= 1'b0;
      end
    end
  end
  
  assign match_out = match_dout;
  assign cfg_dout = 'h0;
endmodule



`timescale 1ns/1ps

//////////////////////////////////////////////////////////////
// File Name		: match_unit.v
// Module Name		: matcn_unit
// Description		: This module is a top module for 
// 			  choosing which type of comparator
// 			  needs to be used 
//////////////////////////////////////////////////////////////

module axis_mu_v1_0_0_axis_mu #(
  parameter           C_WIDTH     = 32,
  parameter           C_EN_PIPE   = 0,
  parameter           C_MATCH_OUT_ASYNC = 0,
  parameter           C_MU_TYPE   = 2
 ) (
  input               cfg_clk,
  input               cfg_din,
  input               cfg_en,
  input               clk,
  input               arm,
  input [C_WIDTH-1:0] data_in,
  input               resetn,
  input               ila_resetn,
  //input               g_and_or,
  output              match_out,
  output              cfg_dout
 );

  `include "axis_mu_v1_0_0_mu_pkg.vh"

  localparam  integer LC_CFGLUT_CNT = cfglut_cnt(C_WIDTH, C_MU_TYPE);
  localparam  integer LC_FULL_32BIT_BLOCK = full_32bit_block(C_WIDTH);
  localparam  integer LC_NFULL_32BIT_BLOCK = nfull_32bit_block(C_WIDTH);
  localparam  integer LC_32BIT_BLOCK = LC_FULL_32BIT_BLOCK + LC_NFULL_32BIT_BLOCK;
  localparam  integer LC_FULL_80BIT_BLOCK = full_80bit_block(C_WIDTH);
  localparam  integer LC_NFULL_80BIT_BLOCK = nfull_80bit_block(C_WIDTH);
  localparam  integer LC_80BIT_BLOCK = LC_FULL_80BIT_BLOCK + LC_NFULL_80BIT_BLOCK;
  localparam  integer LC_CFGLUT_CNT1 = LC_CFGLUT_CNT + 1;

  reg  [LC_CFGLUT_CNT:0]  en;
  reg  [LC_CFGLUT_CNT:0]  cfg_en_temp;
  wire [LC_CFGLUT_CNT:0]  mu_en;
  wire [LC_CFGLUT_CNT:0]  dout;
  wire [((C_MU_TYPE == 1) ? (LC_80BIT_BLOCK-1) : (LC_32BIT_BLOCK-1)):0] match;
  wire [LC_CFGLUT_CNT-1:0]  sel_for_carry;
  wire [LC_CFGLUT_CNT-1:0]  di_for_carry;
  wire                      match_out_temp;
  wire                      drive_o6;
  wire                      drive_o5;
  reg                       match_int = 1'b0;
  reg  [1:0]                next_state;
  reg                       cfg_data;

  assign mu_en = cfg_en_temp & en;

  always @ (posedge cfg_clk)
  begin
    if (!resetn)
    begin
      next_state <= 'h0;
      en <= 'h0;
      cfg_data <= 1'b0;
      cfg_en_temp <= 'h0;
    end
    else
    begin
      cfg_en_temp <= {LC_CFGLUT_CNT1{cfg_en}};
      case (next_state)
        2'b00: begin
                 if (cfg_en == 1'b1)
                 begin
                   en <= 'h1;
                   next_state <= 2'b01;
                   cfg_data <= cfg_din;
                 end
                 else
                 begin
                   en <= 'h0;
                   next_state <= 2'b00;
                 end
               end
        2'b01: begin
                 if (cfg_en == 1'b0 && en[LC_CFGLUT_CNT] == 1'b1)
                 begin
                   next_state <= 2'b00;
                   en <= 'h0;
                 end
                 else if(cfg_en == 1'b0)
                 begin
                   next_state <= 2'b10;
                 end
                 else
                 begin
                   next_state <= 2'b01;
                   cfg_data <= cfg_din;
                 end
               end
        2'b10: begin
                 if (cfg_en == 1'b1)
                 begin
                   next_state <= 2'b01;
                   en <= en << 1;
                   cfg_data <= cfg_din;
                 end
               end
        default: begin
                   next_state <= next_state;
                 end
      endcase
    end
  end

  genvar i;
  generate
    if (C_MU_TYPE == 2)
    begin: MU_EQ_EDGE
      if (LC_FULL_32BIT_BLOCK >= 1)
      begin
        for (i = 0; i < LC_FULL_32BIT_BLOCK; i = i + 1)
        begin: L2_FULL
          axis_mu_v1_0_0_mu_eq_edge #(
            .C_WIDTH    (32),
            .C_EN_WIDTH (16)
           ) u_eq_edge (
            .cfg_din    (cfg_data),
            .cfg_en     (mu_en[i*16 +: 16]),
            .cfg_dout   (dout[i*16 +: 16]),
            .cfg_clk    (cfg_clk),
            .g_and_or   (drive_o5),
            .clk        (clk),
            .data_in    (data_in[i*32 +: 32]),
            .match_out  (match[i])
           );
        end
      end

      if (LC_NFULL_32BIT_BLOCK != 0)
      begin: L2_NFULL
        axis_mu_v1_0_0_mu_eq_edge #(
          .C_WIDTH    (C_WIDTH - (LC_FULL_32BIT_BLOCK*32)),
          .C_EN_WIDTH (LC_CFGLUT_CNT - (LC_FULL_32BIT_BLOCK*16))
         ) u_eq_edge (
          .cfg_din    (cfg_data),
          .cfg_en     (mu_en[LC_CFGLUT_CNT-1:(LC_FULL_32BIT_BLOCK*16)]),
          .cfg_dout   (dout[LC_CFGLUT_CNT-1:(LC_FULL_32BIT_BLOCK*16)]),
          .cfg_clk    (cfg_clk),
          .g_and_or   (drive_o5),
          .clk        (clk),
          .data_in    (data_in[C_WIDTH-1:(LC_FULL_32BIT_BLOCK*32)]),
          .match_out  (match[LC_32BIT_BLOCK-1])
         );
      end

      CFGLUT5 drive_srl 
        (
          .CDI   (cfg_data),
          .CE    (mu_en[LC_CFGLUT_CNT]),
          .CLK   (cfg_clk),
          .O6    (drive_o6),
          .O5    (drive_o5),
          .CDO   (),
          .I4    (1'b1),
          .I3    (1'b1),
          .I2    (1'b1),  
          .I1    (1'b1),  
          .I0    (1'b1)
        );

      if (C_EN_PIPE == 0)
      begin: NO_REG
        //assign match_out_temp = (arm == 1'b1) ? ((drive_o5 == 1'b1) ? ((match == {LC_32BIT_BLOCK{1'b1}}) ? 1'b1 : 1'b0) : ((match != {LC_32BIT_BLOCK{1'b0}}) ? 1'b1 : 1'b0)): 1'b0;
        assign match_out_temp = (drive_o5 == 1'b1) ? ((match == {LC_32BIT_BLOCK{1'b1}}) ? 1'b1 : 1'b0) : ((match != {LC_32BIT_BLOCK{1'b0}}) ? 1'b1 : 1'b0);
        assign match_out = (drive_o6 == 1'b0) ? match_out_temp : ~match_out_temp;
      end
      else
      begin: YES_REG
        always @ (posedge clk)
        begin
          if (!ila_resetn)
          begin
            match_int <= 1'b0;
          end
          else
          begin
            if (drive_o5 == 1'b1)
            begin
              if (match == {LC_32BIT_BLOCK{1'b1}})
              begin
                match_int <= 1'b1;
              end
              else
              begin
                match_int <= 1'b0;
              end
            end
            else
            begin
              if (match != {LC_32BIT_BLOCK{1'b0}})
              begin
                match_int <= 1'b1;
              end
              else
              begin
                match_int <= 1'b0;
              end
            end
          end
        end
        //assign match_out_temp = (arm == 1'b1) ? match_int : 1'b0;
        assign match_out_temp = match_int;
        assign match_out = (drive_o6 == 1'b0) ? match_out_temp : ~match_out_temp;
      end
      assign cfg_dout = dout[mu_en];
    end
  endgenerate

  generate
    if (C_MU_TYPE == 1)
    begin: MU_EQ
      if (LC_FULL_80BIT_BLOCK >= 1)
      begin
        for (i = 0; i < LC_FULL_80BIT_BLOCK; i = i + 1)
        begin: L2_FULL
          axis_mu_v1_0_0_mu_eq #(
            .C_WIDTH    (80),
            .C_EN_WIDTH (16),
            .C_MATCH_OUT_ASYNC(C_MATCH_OUT_ASYNC)
           ) u_eq (
            .cfg_din    (cfg_data),
            .cfg_en     (mu_en[i*16 +: 16]),
            .cfg_dout   (dout[i*16 +: 16]),
            .cfg_clk    (cfg_clk),
            .g_and_or   (drive_o5),
            .clk        (clk),
            .data_in    (data_in[i*80 +: 80]),
            .match_out  (match[i])
           );
        end
      end

      if (LC_NFULL_80BIT_BLOCK != 0)
      begin: L2_NFULL
        axis_mu_v1_0_0_mu_eq #(
          .C_WIDTH    (C_WIDTH - (LC_FULL_80BIT_BLOCK*80)),
          .C_EN_WIDTH (LC_CFGLUT_CNT - (LC_FULL_80BIT_BLOCK*16)),
          .C_MATCH_OUT_ASYNC(C_MATCH_OUT_ASYNC)
         ) u_eq (
          .cfg_din    (cfg_data),
          .cfg_en     (mu_en[LC_CFGLUT_CNT-1:(LC_FULL_80BIT_BLOCK*16)]),
          .cfg_dout   (dout[LC_CFGLUT_CNT-1:(LC_FULL_80BIT_BLOCK*16)]),
          .cfg_clk    (cfg_clk),
          .g_and_or   (drive_o5),
          .clk        (clk),
          .data_in    (data_in[C_WIDTH-1:(LC_FULL_80BIT_BLOCK*80)]),
          .match_out  (match[LC_80BIT_BLOCK-1])
         );
      end

      CFGLUT5 drive_srl 
        (
          .CDI   (cfg_data),
          .CE    (mu_en[LC_CFGLUT_CNT]),
          .CLK   (cfg_clk),
          .O6    (drive_o6),
          .O5    (drive_o5),
          .CDO   (),
          .I4    (1'b1),
          .I3    (1'b1),
          .I2    (1'b1),  
          .I1    (1'b1),  
          .I0    (1'b1)
        );
      reg  drive_o6_reg = 1'b0;
      if (C_EN_PIPE == 0)
      begin: NO_REG
        always @ (posedge clk)
        begin
          if (!ila_resetn)
          begin
            drive_o6_reg <= 1'b0;
          end
          else
          begin
            drive_o6_reg <= drive_o6;
          end
        end
        //assign match_out_temp = (arm == 1'b1) ? ((drive_o5 == 1'b1) ? ((match == {LC_80BIT_BLOCK{1'b1}}) ? 1'b1 : 1'b0) : ((match != {LC_80BIT_BLOCK{1'b0}}) ? 1'b1 : 1'b0)): 1'b0;
        assign match_out_temp = (drive_o5 == 1'b1) ? ((match == {LC_80BIT_BLOCK{1'b1}}) ? 1'b1 : 1'b0) : ((match != {LC_80BIT_BLOCK{1'b0}}) ? 1'b1 : 1'b0);
        assign match_out = (drive_o6_reg == 1'b0) ? match_out_temp : ~match_out_temp;
      end
      else
      begin: YES_REG
        always @ (posedge clk)
        begin
          if (!ila_resetn)
          begin
            match_int <= 1'b0;
            drive_o6_reg <= 1'b0;
          end
          else
          begin
            drive_o6_reg <= drive_o6;
            if (drive_o5 == 1'b1)
            begin
              if (match == {LC_80BIT_BLOCK{1'b1}})
              begin
                match_int <= 1'b1;
              end
              else
              begin
                match_int <= 1'b0;
              end
            end
            else
            begin
              if (match != {LC_80BIT_BLOCK{1'b0}})
              begin
                match_int <= 1'b1;
              end
              else
              begin
                match_int <= 1'b0;
              end
            end
          end
        end
        //assign match_out_temp = (arm == 1'b1) ? match_int : 1'b0;
        assign match_out_temp = match_int;
        assign match_out = (drive_o6_reg == 1'b0) ? match_out_temp : ~match_out_temp;
      end
      assign cfg_dout = dout[mu_en];
    end
  endgenerate

  generate
    if (C_MU_TYPE == 3)
    begin: ALLX
      if (LC_FULL_32BIT_BLOCK >= 1)
      begin
        for (i = 0; i < LC_FULL_32BIT_BLOCK; i = i + 1)
        begin: L2_FULL
          axis_mu_v1_0_0_allx #(
            .C_WIDTH    (32),
            .C_EN_WIDTH (16)
           ) u_allx (
            .cfg_din    (cfg_data),
            .cfg_en     (mu_en[i*16 +: 16]),
            .cfg_dout   (dout[i*16 +: 16]),
            .cfg_clk    (cfg_clk),
            .clk        (clk),
            .data_in    (data_in[i*32 +: 32]),
            .sel_for_carry  (sel_for_carry[i*16 +: 16]),
            .di_for_carry  (di_for_carry[i*16 +: 16])
           );
        end
      end

      if (LC_NFULL_32BIT_BLOCK != 0)
      begin: L2_NFULL
        axis_mu_v1_0_0_allx #(
          .C_WIDTH    (C_WIDTH - (LC_FULL_32BIT_BLOCK*32)),
          .C_EN_WIDTH (LC_CFGLUT_CNT - (LC_FULL_32BIT_BLOCK*16))
         ) u_allx (
          .cfg_din    (cfg_data),
          .cfg_en     (mu_en[LC_CFGLUT_CNT-1:(LC_FULL_32BIT_BLOCK*16)]),
          .cfg_dout   (dout[LC_CFGLUT_CNT-1:(LC_FULL_32BIT_BLOCK*16)]),
          .cfg_clk    (cfg_clk),
          .clk        (clk),
          .data_in    (data_in[C_WIDTH-1:(LC_FULL_32BIT_BLOCK*32)]),
          .sel_for_carry  (sel_for_carry[LC_CFGLUT_CNT-1:(LC_FULL_32BIT_BLOCK*16)]),
          .di_for_carry  (di_for_carry[LC_CFGLUT_CNT-1:(LC_FULL_32BIT_BLOCK*16)])
         );
      end

      CFGLUT5 drive_srl 
        (
          .CDI   (cfg_data),
          .CE    (mu_en[LC_CFGLUT_CNT]),
          .CLK   (cfg_clk),
          .O6    (drive_o6),
          .O5    (),
          .CDO   (),
          .I4    (1'b1),
          .I3    (1'b1),
          .I2    (1'b1),  
          .I1    (1'b1),  
          .I0    (1'b1)
        );

      axis_mu_v1_0_0_allx_carry_logic #(
        .C_WIDTH    (LC_CFGLUT_CNT)
       ) u_allx_carry (
        .clk          (clk),
        .aresetn      (ila_resetn),
        .sel_for_carry        (sel_for_carry),
        .di_for_carry         (di_for_carry),
        .ci         (drive_o6),
        .co         (match_allx)
       );

      if (C_EN_PIPE == 0)
      begin: NO_REG
        //assign match_out = (arm == 1'b1) ? match_allx : 1'b0;
        assign match_out = match_allx;
      end
      else
      begin: YES_REG
        always @ (posedge clk)
        begin
          if (!ila_resetn)
          begin
            match_int <= 1'b0;
          end
          else
          begin
            if (match_allx == 1'b1)
            begin
              match_int <= 1'b1;
            end
            else
            begin
              match_int <= 1'b0;
            end
          end
        end
        //assign match_out = (arm == 1'b1) ? match_int : 1'b0;
        assign match_out = match_int;
      end
      assign cfg_dout = dout[mu_en];
    end
  endgenerate

  /*generate
    if (C_MU_TYPE == 4)
    begin: MU_ALLX
    end
  endgenerate*/

endmodule


