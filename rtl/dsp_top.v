`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2018 07:04:08 PM
// Design Name: 
// Module Name: dsp_cascade
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dsp_top # (
parameter NUM_DSP_COLUMN = 5,
parameter NUM_DSP_BLOCK = 110
 )
(
	input clk,
   input rst,
   input wire [6:0] TOGGLE_RATE,
   //input dsp_ce,
   output dsp_top_o
    );
    
  (* DONT_TOUCH = "TRUE" *)wire [(NUM_DSP_COLUMN):0] dsp_o;
   
    
      genvar col_cnt;
      generate
          for (col_cnt=1; col_cnt <NUM_DSP_COLUMN+1; col_cnt = col_cnt + 1)
          begin: dsp_col    
          dsp #(.NUM_DSP_BLOCK(NUM_DSP_BLOCK)) udsp
              (
              .clk(clk), 
              .rst(rst),
              .TOGGLE_RATE(TOGGLE_RATE),
              .dsp_o(dsp_o[col_cnt-1])
              
              );
              end

      endgenerate
          
 // __SRAI (OLD/ORIG)assign dsp_top_o = dsp_o[col_cnt-1];
 //assign dsp_top_o = dsp_o[NUM_DSP_COLUMN-1];
 assign dsp_top_o = ^dsp_o;
  
endmodule
