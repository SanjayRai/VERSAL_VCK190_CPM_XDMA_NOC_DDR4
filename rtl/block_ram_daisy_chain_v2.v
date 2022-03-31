//`define SIM

module block_ram_daisy_chain # (
    parameter NUM_RAMB_36 = 100,
    //parameter TOGGLE_RATE = 100,
     parameter DATAWIDTH = 36
   
    )
    (
	input clk,
	input irst,
	//input ram_en,
	input wire [6:0] TOGGLE_RATE,
	output ram_o

    );


reg 	[35:0]			rd_data;
wire 	[((NUM_RAMB_36+1)*36)-1:0]	wr_data;
reg 	[35:0]			rd_data_init=36'hbcbc_bcbc_b;


reg 	[9:0] 			wr_addr, rd_addr;



reg				rst;

reg 				ram_en;
reg 				ram_wr_en;
reg 				ram_rd_en;
reg                en_b;
wire    [((NUM_RAMB_36+1)*10)-1:0]   rd_addr_dc;
wire	[NUM_RAMB_36:0]	ram_en_dc;
wire	[NUM_RAMB_36:0]	ram_rd_en_dc;
wire	[NUM_RAMB_36:0]	ram_wr_en_dc;
reg	[6:0]				mask_count;


always @ (posedge clk)
	rst <= irst;

// Address pointers

always @ (posedge clk)
	begin
	if (rst)begin
		rd_addr <= 0;
		ram_en <= 0;
		ram_wr_en <= 0;
		ram_rd_en <= 0;
		en_b <= 1;
	end
	else
		begin
		if ( mask_count <= TOGGLE_RATE)begin
		   if(ram_rd_en && ram_en && ram_en) 
			rd_addr <= rd_addr + 1;
		   else
		    rd_addr <= rd_addr;
		    
			ram_en <= 1;
            ram_wr_en <= 1;
            ram_rd_en <= 1;
            en_b <= 0;
		end
		else begin
			rd_addr <= rd_addr;
			ram_en <= 0;
            ram_wr_en <= 0;
            ram_rd_en <= 0;
            en_b <= 1;	
		end
		end
	end


// Data generation

	always @ (posedge clk)
    	begin
    	if (rst || en_b || !ram_en || !ram_rd_en)
    		begin
    		rd_data 	<= rd_data_init;
    		mask_count 	<= 0;
    		end
    	else
    		begin
    		if(mask_count == 99)
    	    mask_count <= 1;
    	    else
    		mask_count	<= mask_count + 1;
    		
  	        if(mask_count <= TOGGLE_RATE)
        	   rd_data 	<= ~rd_data;
        	else
        	   rd_data <= rd_data_init;
    				
    		end
    	end

        

  
assign ram_o = ^(wr_data[(NUM_RAMB_36+1)*DATAWIDTH-1:(NUM_RAMB_36)*DATAWIDTH]);

	ramb36_sp_daisy_chain uramb36_sp_daisy_chain (
		.clk(clk),
		.rst(rst),
		.ram_en(ram_en),
		.ram_rd_en(ram_rd_en),
		.ram_wr_en(ram_wr_en),
		.rd_addr(rd_addr),
		.wr_addr(rd_addr),
		.rd_data(rd_data),
		.wr_data(wr_data[35:0]),
		.rd_addr_dc(rd_addr_dc[9:0]),
		.ram_en_dc(ram_en_dc[0]),
        .ram_rd_en_dc(ram_rd_en_dc[0]),
        .ram_wr_en_dc(ram_wr_en_dc[0])
	);

// Block Ram 36k
   genvar cnt;
   generate
      for (cnt=1; cnt < NUM_RAMB_36+1; cnt=cnt+1) 
      begin: ram_gen
	ramb36_sp_daisy_chain uramb36_sp_daisy_chain (
		.clk(clk),
		.rst(rst),
		.ram_en(ram_en_dc[cnt-1]),
		.ram_rd_en(ram_rd_en_dc[cnt-1]),
		.ram_wr_en(ram_wr_en_dc[cnt-1]),
		.rd_addr(rd_addr_dc[cnt*10-1:(cnt-1)*10]),
		.wr_addr(rd_addr_dc[cnt*10-1:(cnt-1)*10]),
		.rd_data(wr_data[cnt*36-1:(cnt-1)*36]),
		.wr_data(wr_data[(cnt+1)*36-1:cnt*36]),
		.rd_addr_dc(rd_addr_dc[((cnt+1)*10)-1:cnt*10]),
		.ram_en_dc(ram_en_dc[cnt]),
        .ram_rd_en_dc(ram_rd_en_dc[cnt]),
        .ram_wr_en_dc(ram_wr_en_dc[cnt])
	);
      end
   endgenerate







	
endmodule


module ramb36_sp_daisy_chain (
	input 	wire		clk,
	input 	wire		rst,
	input 	wire		ram_en,
	input 	wire		ram_rd_en,
	input 	wire		ram_wr_en,
	input	wire	[9:0]	rd_addr,
	input	wire	[9:0]	wr_addr,
	input 	wire	[35:0]	rd_data,
	output 	reg	    [35:0]	wr_data,
	output reg     [9:0]   rd_addr_dc,
    output 	reg		ram_en_dc,
    output 	reg		ram_rd_en_dc,
    output 	reg		ram_wr_en_dc

	);

reg	[35:0]	wr_data_int=36'hacac_acac_a;;
reg 	[35:0]	memory [1023:0];

always @ (posedge clk)
    begin
    rd_addr_dc  <= rd_addr;
    ram_en_dc <=   ram_en;
    ram_rd_en_dc    <= ram_rd_en;
    ram_wr_en_dc    <= ram_wr_en;
    end
always @ (posedge clk)
	begin
	if (ram_en)
		begin
		if (ram_rd_en)
			memory[wr_addr] <= rd_data;
		if (ram_wr_en)
			wr_data_int <= memory[rd_addr];
		end
	end

always @ (posedge clk)
if(rst)
    wr_data <= wr_data_int;
else 
    wr_data <= ~ wr_data;

endmodule
