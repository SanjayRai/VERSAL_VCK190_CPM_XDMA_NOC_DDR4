`ifndef _DDRMC_WDB_ 
`define _DDRMC_WDB_ 
`include "noc_na_v1_0_0_nsu_packet.sv"
`timescale 1ps/1ps

module noc_mc_ddr4_v1_0_ddrmc_wdb #(
     parameter WDB_DATA_WIDTH = 1
    ,parameter WDB_DM_WIDTH = 1

)(
  input clk,
  input rst_n,

  wdb_req_dc                                            wdb_req_1,
  input                                                 rd_data_en,
  input [5:0]                                           rd_data_addr,
  output logic [WDB_DATA_WIDTH+WDB_DM_WIDTH-1:0]        rd_data,


  input                                                 bypass_data_en,
  input [5:0]                                           bypass_data_addr,
  output logic [WDB_DATA_WIDTH-1:0]                     bypass_data,
  output logic                                          bypass_data_avail

  );
  
  parameter DW = WDB_DATA_WIDTH+WDB_DM_WIDTH;
  parameter BUF_DEP = 48;
  parameter BUF_PTR = 6;

//output reg declarations
  
//internal declaration 
  logic                         app_req ;
  logic                         app_gnt ;
  logic [1:0]                   app_overwrite;
  logic [BUF_PTR-1:0]	        app_buf_ptr ;
  logic [DW-1:0]	    	app_data_int ;
  logic [DW-1:0]   	        data_reg [BUF_DEP-1:0];
  event write_done; 
  logic [WDB_DATA_WIDTH+WDB_DM_WIDTH-1:0]              rd_data_int;


  assign app_req       = wdb_req_1.app_req;
  assign wdb_req_1.app_gnt       = app_gnt;
  assign app_buf_ptr   = wdb_req_1.app_buf_ptr;
  assign app_overwrite = wdb_req_1.app_overwrite;
  assign app_data_int  = {wdb_req_1.app_data[WDB_DM_WIDTH+`NA_WBUF_DATA_WIDTH-1:`NA_WBUF_DATA_WIDTH],wdb_req_1.app_data[WDB_DATA_WIDTH-1:0]};

   
    initial begin
      for (int j = 0 ; j < BUF_DEP; j = j + 1) 
        data_reg[j] <= {(DW){1'b0}};
    end

    always @(posedge (clk & app_req)) begin
      if (app_req & !(|app_overwrite)) begin 
        data_reg[app_buf_ptr] <=  app_data_int;
        ->>write_done;
      end
      else if (app_req & app_overwrite[0]) begin //WAW hazard //{
        data_reg[app_buf_ptr][DW-1:WDB_DATA_WIDTH] <= app_data_int[DW-1:WDB_DATA_WIDTH] | data_reg[app_buf_ptr][DW-1:WDB_DATA_WIDTH];
        for (int i = 0; i < WDB_DM_WIDTH; i++) 
          data_reg[app_buf_ptr][i*8+:8]   <=  app_data_int[i+WDB_DATA_WIDTH] ? app_data_int[i*8+:8] : data_reg[app_buf_ptr][i*8+:8];
        ->>write_done;
      end //}
      else if (app_req & app_overwrite[1]) begin //{ 
        //Merge the Read data at the places where strobe is non zero. If because of any reason, all the write strobes are set, then the read data from the RMW phase will be dropped.
        for (int i = 0; i < WDB_DM_WIDTH; i++) begin
          if (data_reg[app_buf_ptr][i+WDB_DATA_WIDTH] == 1'b0)
            data_reg[app_buf_ptr][i*8+:8] <= app_data_int[i*8+:8];
        end        
        data_reg[app_buf_ptr][DW-1:WDB_DATA_WIDTH] <= app_data_int[DW-1:WDB_DATA_WIDTH] | data_reg[app_buf_ptr][DW-1:WDB_DATA_WIDTH];
        ->>write_done;
      end //}
    end

always @* begin
  if (rd_data_en & app_req & (rd_data_addr == app_buf_ptr) & app_overwrite[0]) begin 
    rd_data_int[DW-1:WDB_DATA_WIDTH] = app_data_int[DW-1:WDB_DATA_WIDTH] | data_reg[rd_data_addr][DW-1:WDB_DATA_WIDTH];
    for (int i = 0; i < WDB_DM_WIDTH; i++) 
      rd_data_int[i*8+:8]   =  app_data_int[i+WDB_DATA_WIDTH] ? app_data_int[i*8+:8] : data_reg[rd_data_addr][i*8+:8];
  end
 
  rd_data     =  (rd_data_en & app_req & (rd_data_addr == app_buf_ptr) & app_overwrite[0]) ? rd_data_int  : (rd_data_en ? data_reg[rd_data_addr] : {{DW}{1'b0}});
end

always @* begin  
 bypass_data       = bypass_data_en  ? data_reg[bypass_data_addr][WDB_DATA_WIDTH-1:0] : 'd0;
 bypass_data_avail = bypass_data_en  ? 1'b1 : 1'b0;
end

always @* begin
  if (app_req) begin
   //wait (write_done.triggered);
    app_gnt = 1'b1;
  end
  else 
    app_gnt = 1'b0;
end

endmodule

`endif
