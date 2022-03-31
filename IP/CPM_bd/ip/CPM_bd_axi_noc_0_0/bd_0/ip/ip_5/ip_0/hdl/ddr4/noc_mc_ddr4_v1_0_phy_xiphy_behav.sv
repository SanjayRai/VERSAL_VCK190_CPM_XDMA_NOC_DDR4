`ifndef _DDR4_PHY_XIPHY_BEHAV_1_ 
`define _DDR4_PHY_XIPHY_BEHAV_1_ 
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
//  /   /         Filename           : ddr4_phy_xiphy_behav.sv
// /___/   /\     Date Last Modified : $Date: 2016/03/07 $
// \   \  /  \    Date Created       : March 7 2016
//  \___\/\___\
//
// Device           : Versal
// Design Name      : MC (Memory Controller)
// Purpose          : XPHY_BEHAV MODEL
// 
// Reference        :
// Revision History :
//*****************************************************************************
 
`timescale 1ps/1ps

module noc_mc_ddr4_v1_0_phy_xiphy_behav #(
    parameter           DMC2PHYDATA_WIDTH                      = 7
   ,parameter           DMC2PHY_CMD_ADDR_WIDTH                 = 7
   ,parameter           DMC2PHY_TOTAL_DATA_WIDTH               = 7
   ,parameter           PHY2DMC_DATA_WIDTH                     = 7
   ,parameter           DM_WIDTH                               = 7
   ,parameter           DQS_WIDTH                               = 7
   ,parameter  [DMC2PHYDATA_WIDTH-1:0] TX_OUTPUT_PHASE_90      = '0
   //,parameter           DM_ENABLE         = "NO_DM_DBI"
   //,parameter           RD_DBI_EN         = 0
)(
    input                                    pll_clk 
   ,input                                    pll_rst 
   ,input                                    mc_clk 
   ,input                                    mc_rst
   ,input   [31:0]                           tCK
   //Write Path DMC to PHY
   ,input   [3:0]                            dmc2phy_t_b
   ,input   [DMC2PHY_TOTAL_DATA_WIDTH*4-1:0] dmc2phy_data
   ,input   [DMC2PHY_CMD_ADDR_WIDTH*4-1:0]   dmc2phy_addr_cmd
   ,input   [2:0]                            xpi_write_dm_dbi_config
  //Read Path   PHY to DMC
   ,input   [1:0]                            dmc2phy_rden
   ,input                                    dmc2phy_fifo_rden
   ,output  [PHY2DMC_DATA_WIDTH*4 - 1:0]     phy2dmc_data
   ,inout [DMC2PHYDATA_WIDTH-1:0]            iob_pin
   ,input                                    xpi_read_dbi_en
);


wire  [DMC2PHY_TOTAL_DATA_WIDTH-1:0]  phy2iob_q_out_byte;
wire  [DMC2PHY_CMD_ADDR_WIDTH-1:0]    phy2iob_ac_out_byte;
wire  [DMC2PHYDATA_WIDTH-1:0]         phy2iob_odt_out_byte; 
wire                                  phy2iob_t; 
reg  [DMC2PHYDATA_WIDTH-1:0]         iob2phy_d_in_byte;
wire  dmc2phy_data_array_0[DMC2PHY_TOTAL_DATA_WIDTH];
wire  dmc2phy_data_array_1[DMC2PHY_TOTAL_DATA_WIDTH];
wire  dmc2phy_data_array_2[DMC2PHY_TOTAL_DATA_WIDTH];
wire  dmc2phy_data_array_3[DMC2PHY_TOTAL_DATA_WIDTH];
wire  dmc2phy_ac_array_0[DMC2PHY_CMD_ADDR_WIDTH];
wire  dmc2phy_ac_array_1[DMC2PHY_CMD_ADDR_WIDTH];
wire  dmc2phy_ac_array_2[DMC2PHY_CMD_ADDR_WIDTH];
wire  dmc2phy_ac_array_3[DMC2PHY_CMD_ADDR_WIDTH];
reg   o_out[DMC2PHY_TOTAL_DATA_WIDTH]= '{DMC2PHY_TOTAL_DATA_WIDTH{0}};
reg   o_out_90[DMC2PHY_TOTAL_DATA_WIDTH]= '{DMC2PHY_TOTAL_DATA_WIDTH{0}};
reg   o_out_ac[DMC2PHY_CMD_ADDR_WIDTH];
reg   tri_out = 1'b1; //To Avoid X on dq bus
reg [1:0] cnt;
reg [1:0] cnt_rd,cnt_t_b;
wire  o_clk_d;
reg [DMC2PHY_TOTAL_DATA_WIDTH-1:0]         phy2iob_q_out_byte_1 ,phy2iob_q_out_byte_DBI   ;
reg rd_en,rd_en_1,rd_en_2,rd_en_3;
reg [PHY2DMC_DATA_WIDTH-1:0] rd_data_iob_0;
reg [PHY2DMC_DATA_WIDTH-1:0] rd_data_iob_1;
reg [PHY2DMC_DATA_WIDTH-1:0] rd_data_iob_2;
reg [PHY2DMC_DATA_WIDTH-1:0] rd_data_iob_3;


always@(posedge pll_clk )begin
  if(pll_rst)begin
    cnt <=  2'b00 ;
  end else begin
    cnt <=  cnt + 1 ;
  end 
end

//always@(posedge o_clk_d )begin
//always@(posedge pll_clk )begin  //CR-1053778: Change to overcome race condn between cnt_t_b generation and tri_out generation (by using cnt_t_b)
//CR-1090969 - #25 delay to avoid race condition between cnt_t_b and tri_out . cnt_t_b should execute first later tri_state
wire o_clk_d1;
assign #25ps o_clk_d1 = pll_clk ; 
always@(posedge o_clk_d1 )begin
  if(pll_rst)
    cnt_t_b <=  2'b00 ;
  else if(|dmc2phy_t_b)begin
  //else begin
    cnt_t_b <=  cnt_t_b + 1 ;
  end 
  else 
    cnt_t_b <=  2'b00 ;
end 
//#50 delay to avoid race condition between cnt and pll_clk. beacause of PLL jitter in VIVADo regressions
assign #50ps o_clk_d = pll_clk ; 
//MEMORY CONTROLLER TO IOB WRITE LOGIC 

generate
  for (genvar i = 0; i < DMC2PHY_TOTAL_DATA_WIDTH; i = i + 1) begin 
     assign dmc2phy_data_array_0[i]    = dmc2phy_data[i*4+0];
     assign dmc2phy_data_array_1[i]    = dmc2phy_data[i*4+1];
     assign dmc2phy_data_array_2[i]    = dmc2phy_data[i*4+2];
     assign dmc2phy_data_array_3[i]    = dmc2phy_data[i*4+3];
  end
endgenerate

//Serializing Data from MC 
always@(posedge o_clk_d)begin
    case(cnt_t_b)
     // 'd0 :begin o_out <= dmc2phy_data_array_0 ;o_out_90 <= #(tCK/4) dmc2phy_data_array_0 ; tri_out <=  (dmc2phy_t_b[0]) ? 1'b0 : 1'b1 ; end
     // 'd1 :begin o_out <= dmc2phy_data_array_1 ;o_out_90 <= #(tCK/4) dmc2phy_data_array_1 ; tri_out <=  (dmc2phy_t_b[0]) ? 1'b0 : 1'b1 ; end
     // 'd2 :begin o_out <= dmc2phy_data_array_2 ;o_out_90 <= #(tCK/4) dmc2phy_data_array_2 ; tri_out <=  (dmc2phy_t_b[1]) ? 1'b0 : 1'b1 ; end
     // 'd3 :begin o_out <= dmc2phy_data_array_3 ;o_out_90 <= #(tCK/4) dmc2phy_data_array_3 ; tri_out <=  (dmc2phy_t_b[1]) ? 1'b0 : 1'b1 ; end
      'd1 :begin o_out <= dmc2phy_data_array_0 ; tri_out <=  (dmc2phy_t_b[0]) ? 1'b0 : 1'b1 ; end
      'd2 :begin o_out <= dmc2phy_data_array_1 ; tri_out <=  (dmc2phy_t_b[1]) ? 1'b0 : 1'b1 ; end
      'd3 :begin o_out <= dmc2phy_data_array_2 ; tri_out <=  (dmc2phy_t_b[2]) ? 1'b0 : 1'b1 ; end
      'd0 :begin o_out <= dmc2phy_data_array_3 ; tri_out <=  (dmc2phy_t_b[3]) ? 1'b0 : 1'b1 ; end
    endcase 
end

//Serializing Data from MC 
always@(negedge o_clk_d)begin
    case(cnt_t_b)
      'd1 :begin o_out_90 <=  dmc2phy_data_array_0 ;  end
      'd2 :begin o_out_90 <=  dmc2phy_data_array_1 ;  end
      'd3 :begin o_out_90 <=  dmc2phy_data_array_2 ;  end
      'd0 :begin o_out_90 <=  dmc2phy_data_array_3 ;  end
    endcase 
end
//90 degree version of o_out is required if TX_OUTPUT_PHASE_90 is 1 
assign phy2iob_t = tri_out;
generate for(genvar i = 0 ; i < DMC2PHY_TOTAL_DATA_WIDTH;i++)begin
assign phy2iob_q_out_byte_1[i] = (TX_OUTPUT_PHASE_90[i] == 1'b1) ? o_out_90[i] : o_out[i];
end
endgenerate

//venkataa: WR_DBI change
function int count_zeros(input logic[7:0] byte_in);
   automatic int _cnt=0;
   if ($isunknown(byte_in)) begin 
     return 0;
   end
   for (int i=0; i<8; i++) begin 
     if (!byte_in[i]) begin
       _cnt= _cnt+1;  
     end
   end
   count_zeros = _cnt;
endfunction
logic [PHY2DMC_DATA_WIDTH-1:0] ddr_dq_noDBI;
always_comb begin
    phy2iob_q_out_byte_DBI =phy2iob_q_out_byte_1; //If no DBI
    ddr_dq_noDBI =phy2iob_q_out_byte_1[DMC2PHY_TOTAL_DATA_WIDTH-1:DMC2PHY_TOTAL_DATA_WIDTH-PHY2DMC_DATA_WIDTH];
    //if (DM_ENABLE!="DM_NO_DBI") begin  //For DC_DBI , AC_DBI is not supported
    //if  ( (DM_ENABLE=="NO_DM_DBI") || (DM_ENABLE=="NO_DM_DC_DBI") ||  (DM_ENABLE=="NO_DM_AC_DBI") )  begin  
    if  (  (xpi_write_dm_dbi_config==2'b10) || (xpi_write_dm_dbi_config==2'b11) )  begin  //Write DC_DBI or read DBI
      for(int i = 0 ; i < DM_WIDTH;i++) begin 
          if (count_zeros( ddr_dq_noDBI[i*8+:8]) > 4  ) begin //Checking no.of zeros in each byte of DQ
            //phy2iob_q_out_byte_DBI[i*8+:8] = ~ddr_dq_noDBI[i*8+:8]; 
            ddr_dq_noDBI[i*8+:8] = ~ddr_dq_noDBI[i*8+:8]; 
            phy2iob_q_out_byte_DBI[i] = 1'b0;
          end
          else begin
            //phy2iob_q_out_byte_DBI[i*8+:8] = ddr_dq_noDBI[i*8+:8] ; 
            ddr_dq_noDBI[i*8+:8] = ddr_dq_noDBI[i*8+:8]; 
            phy2iob_q_out_byte_DBI[i] = 1'b1;
          end
          phy2iob_q_out_byte_DBI[DMC2PHY_TOTAL_DATA_WIDTH-1:DMC2PHY_TOTAL_DATA_WIDTH-PHY2DMC_DATA_WIDTH] =  ddr_dq_noDBI ;
       end
    end
end
//WR_DBI change: done



//Serializing command data from MC 
generate
  for (genvar i = 0; i < DMC2PHY_CMD_ADDR_WIDTH; i = i + 1) begin 
     assign dmc2phy_ac_array_0[i]    = dmc2phy_addr_cmd[i*4+0];
     assign dmc2phy_ac_array_1[i]    = dmc2phy_addr_cmd[i*4+1];
     assign dmc2phy_ac_array_2[i]    = dmc2phy_addr_cmd[i*4+2];
     assign dmc2phy_ac_array_3[i]    = dmc2phy_addr_cmd[i*4+3];
  end
endgenerate
//Serializing input data after it is delayed.
always@(posedge o_clk_d)begin
    case(cnt)
      'd0 : o_out_ac <= dmc2phy_ac_array_0 ;  
      'd1 : o_out_ac <= dmc2phy_ac_array_1 ;   
      'd2 : o_out_ac <= dmc2phy_ac_array_2 ;   
      'd3 : o_out_ac <= dmc2phy_ac_array_3 ;   
    endcase 
end

generate for(genvar i = 0 ; i < DMC2PHY_CMD_ADDR_WIDTH;i++)begin
assign phy2iob_ac_out_byte[i] = o_out_ac[i];
end
endgenerate

assign phy2iob_odt_out_byte = {DMC2PHYDATA_WIDTH{1'b0}};
assign iob_pin[(DMC2PHY_CMD_ADDR_WIDTH -1) : 0] = phy2iob_ac_out_byte ;
//assign iob_pin[DMC2PHYDATA_WIDTH-1:DMC2PHY_CMD_ADDR_WIDTH] = !phy2iob_t ? {phy2iob_q_out_byte_1[DMC2PHY_TOTAL_DATA_WIDTH-1:DMC2PHY_TOTAL_DATA_WIDTH-PHY2DMC_DATA_WIDTH],{DQS_WIDTH{phy2iob_q_out_byte_1[DM_WIDTH+1]}},{DQS_WIDTH{phy2iob_q_out_byte_1[DM_WIDTH]}},phy2iob_q_out_byte_1[DM_WIDTH-1:0]} :'z;
assign iob_pin[DMC2PHYDATA_WIDTH-1:DMC2PHY_CMD_ADDR_WIDTH] = !phy2iob_t ? {phy2iob_q_out_byte_DBI[DMC2PHY_TOTAL_DATA_WIDTH-1:DMC2PHY_TOTAL_DATA_WIDTH-PHY2DMC_DATA_WIDTH],{DQS_WIDTH{phy2iob_q_out_byte_DBI[DM_WIDTH+1]}},{DQS_WIDTH{phy2iob_q_out_byte_DBI[DM_WIDTH]}},phy2iob_q_out_byte_DBI[DM_WIDTH-1:0]} :'z;

//READ LOGIC
//assign iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHY_CMD_ADDR_WIDTH] =  phy2iob_t? iob_pin[DMC2PHYDATA_WIDTH-1:DMC2PHY_CMD_ADDR_WIDTH] :'z;
//Read DBI change
reg [DM_WIDTH-1:0] rd_dm_dbi;
reg [PHY2DMC_DATA_WIDTH-1:0] rd_DQ_data;
always_comb begin
    iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHY_CMD_ADDR_WIDTH] =  phy2iob_t? iob_pin[DMC2PHYDATA_WIDTH-1:DMC2PHY_CMD_ADDR_WIDTH] :'z;
    rd_DQ_data = iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHYDATA_WIDTH-PHY2DMC_DATA_WIDTH] ;
    rd_dm_dbi =  iob2phy_d_in_byte[ DM_WIDTH+DMC2PHY_CMD_ADDR_WIDTH-1 : DMC2PHY_CMD_ADDR_WIDTH ]; //read dbi from responder
    //if (RD_DBI_EN==1) begin  //For rd_DBI
    if (xpi_read_dbi_en) begin  //For rd_DBI
      for(int i = 0 ; i < DM_WIDTH;i++) begin
         rd_DQ_data[i*8+:8] = !rd_dm_dbi[i]? ~rd_DQ_data[i*8+:8]:rd_DQ_data[i*8+:8];
      end
      iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHYDATA_WIDTH-PHY2DMC_DATA_WIDTH]  = rd_DQ_data;
    end 
end

always@(posedge pll_clk)begin
  if(pll_rst) begin
    rd_en_1 <= 1'b0;
    rd_en_2 <= 1'b0;
    rd_en_3 <= 1'b0;
  end else begin
    rd_en_1 <= rd_en;
    rd_en_2 <= rd_en_1;
    rd_en_3 <= rd_en_2;
   end
end
always@(posedge o_clk_d)begin
  if(pll_rst)
    rd_en <= 1'b0;
  else begin
    case(cnt)
      'd0 :rd_en <= dmc2phy_rden[0] ;
      'd1 :rd_en <= dmc2phy_rden[0] ;
      'd2 :rd_en <= dmc2phy_rden[1] ;
      'd3 :rd_en <= dmc2phy_rden[1] ;
    endcase 
  end
end

always@(posedge pll_clk )begin
  if(pll_rst)
    cnt_rd <=  2'b00 ;
  else if(rd_en_1)begin
    cnt_rd <=  cnt_rd + 1 ;
  end 
end 
`ifdef DENALI_MODEL
always@(posedge o_clk_d)begin
`else
always@(negedge o_clk_d)begin
`endif
  if(pll_rst)begin
    rd_data_iob_0 <= {PHY2DMC_DATA_WIDTH{1'b0}};
    rd_data_iob_1 <= {PHY2DMC_DATA_WIDTH{1'b0}};
    rd_data_iob_2 <= {PHY2DMC_DATA_WIDTH{1'b0}};
    rd_data_iob_3 <= {PHY2DMC_DATA_WIDTH{1'b0}};
  end else begin
     if(rd_en_1)begin  
       case(cnt_rd)
         'd0 : rd_data_iob_0 <= iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHYDATA_WIDTH-PHY2DMC_DATA_WIDTH] ;
         'd1 : rd_data_iob_1 <= iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHYDATA_WIDTH-PHY2DMC_DATA_WIDTH] ;
         'd2 : rd_data_iob_2 <= iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHYDATA_WIDTH-PHY2DMC_DATA_WIDTH] ;
         'd3 : rd_data_iob_3 <= iob2phy_d_in_byte[DMC2PHYDATA_WIDTH-1:DMC2PHYDATA_WIDTH-PHY2DMC_DATA_WIDTH] ;
       endcase 
     end 
  end
end

reg [4*PHY2DMC_DATA_WIDTH-1:0] fifo_mem [$];
reg [4*PHY2DMC_DATA_WIDTH-1:0] rd_data_out,rd_data_int;
wire wr_en;
assign wr_en = &cnt_rd;
event e_vcs;
logic full, empty_n;

always @(e_vcs) begin
  full = (fifo_mem.size() == 8); //check for fifo full
  empty_n = !(fifo_mem.size() == 0);//check for fifo empty active high
end


always @ (posedge pll_clk)
begin : WRITE_INTO_QUEUE
  if (pll_rst) begin
     fifo_mem = {}; //clear the queue
     ->>e_vcs;
  end else if (wr_en & !full ) begin
    fifo_mem.push_back({rd_data_iob_3,rd_data_iob_2,rd_data_iob_1,rd_data_iob_0}) ;
     ->>e_vcs;
  end
end

always @ (posedge mc_clk)
begin : READ_FROM_QUEUE
  if (mc_rst) begin
    rd_data_out <= 'b0;
     ->>e_vcs;
  end else if (dmc2phy_fifo_rden & empty_n) begin
    rd_data_int <= fifo_mem.pop_front();
     ->>e_vcs;
  end
  if(fifo_mem.size() > 0)begin
    rd_data_out <= fifo_mem[0];
    end
end

assign phy2dmc_data = rd_data_out;
endmodule
`endif 

