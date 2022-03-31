//`define SIM

module  dsp # (
    parameter NUM_DSP_BLOCK = 5
    //parameter TOGGLE_RATE = 100

    )
    (
	input clk,
	input rst,
	input wire [6:0] TOGGLE_RATE,
	//input dsp_ce,
	output dsp_o

    );


reg	 [6:0]				mask_count;


reg                             disable_logic=0;
//wire dsp_o;
wire            dsp_ce;
reg  	signed[17:0]	ain;
reg  	signed[17:0]	bin;
reg  	signed[17:0]	din;
(* DONT_TOUCH = "TRUE" *)reg    signed[47:0]    dsp_out;

reg  	signed[(NUM_DSP_BLOCK+1)*48-1:0]	cin;
wire  	signed[(NUM_DSP_BLOCK+1)*48-1:0]	dout;
wire  	signed[(NUM_DSP_BLOCK+1)*18-1:0]	acout;
wire  	signed[(NUM_DSP_BLOCK+1)*18-1:0]	bcout;
wire  	[17:0]	ain_init;
wire  	[17:0]	bin_init;
wire  	[17:0]	din_init;
wire  	[47:0]	cin_init;

assign ain_init = 18'ha5a5a;
assign bin_init =18'h5a5a5;
assign din_init = 18'hccccc;
assign cin_init = 48'hfbfb_fbfb_fbfb;


always@(posedge clk)
if(rst)
mask_count <= 0;
else begin
 if(mask_count == 99)
 mask_count <=1;
 else
 mask_count <= mask_count + 1;
 end
 
 
// Data generation

	always @ (posedge clk)
    	begin
    	if (rst || disable_logic)
    		begin
    		ain		<= ain_init;
            bin		<= bin_init;
            din		<= din_init;
            cin     <= cin_init;
    		end
    	else
    		begin
    	     if(mask_count <= TOGGLE_RATE)begin
    		    ain		<= ~ain;
                bin		<= ~bin;
                din		<= ~din;
                cin     <= ~cin;
              end
              else begin
                  ain	<= ain_init;
                          bin    <= bin_init;
                          din    <= din_init;
                          cin     <= cin_init; 
              end
       	end
    		
   
    	end

    

// Basic_Block
always@(posedge clk)
if(rst)
dsp_out <= 48'h0000_0000_0000;
else
dsp_out <= dout[(NUM_DSP_BLOCK+1)*48-1:NUM_DSP_BLOCK*48];

assign dsp_o = dsp_out[0];

	basic_block_dsp ubasic_block_dsp (
		.clk(clk),
		.rst(rst),
		.ce(dsp_ce),
		.ain(ain),
		.bin(bin),
		.din(din),
		.acout(acout[17:0]),
		.bcout(bcout[17:0]),
		.dout(dout[47:0]),
		.cin(cin[47:0])
	);

	

   genvar cnt;
   generate
      for (cnt=1; cnt < NUM_DSP_BLOCK+1; cnt=cnt+1) 
      begin: logic_gen
	basic_block_dsp ubasic_block_dsp (
		.clk(clk),
		.rst(rst),
		.ce(dsp_ce),
		.ain(acout[cnt*18-1:(cnt-1)*18]),
		.bin(bcout[cnt*18-1:(cnt-1)*18]),
		.din(din),
		.acout(acout[(cnt+1)*18-1:cnt*18]),
		.bcout(bcout[(cnt+1)*18-1:cnt*18]),
		.cin(~dout[cnt*48-1:(cnt-1)*48]),
		.dout(dout[(cnt+1)*48-1:cnt*48])
	);
      end
   endgenerate




assign dsp_ce = 1;



endmodule


module basic_block_dsp (
input 	wire		    clk,
input   wire            ce, 
input 	wire		    rst,
input	wire  signed	[17:0]	ain,
input 	wire  signed	[17:0]	bin,
input	wire  signed	[17:0]	din,
output	wire  signed	[47:0]	dout,
input	wire  signed	[47:0]	cin,
output	wire  signed	[17:0]	acout,
output	wire  signed	[17:0]	bcout
	);


reg	signed[17:0]	din_r;
reg	signed[17:0]	ain_r;
reg	signed[17:0]	bin_r;
reg	signed[18:0]	preadd_r;
reg	signed[36:0]	mult_r;
reg	signed[47:0]	sum_r;

assign dout = sum_r;
assign acout = ain_r;
assign bcout = bin_r;

assign ain_init = 18'ha5a5a;
assign bin_init =18'h5a5a5;
assign din_init = 18'hccccc;
assign cin_init = 48'hfcfc_fcfc_fcfc;
always @ (posedge clk)
	begin
      if (rst)
        begin
        din_r    <= din_init;
        ain_r    <= ain_init;
        bin_r    <= bin_init;        
        preadd_r <= 0;
        mult_r   <= 0;
        sum_r    <= 0;
        end
      else if (ce)
        begin
        ain_r    <= ain;
        bin_r    <= bin; 
        din_r    <= din;            // registered din
        preadd_r <= ain_r + din_r;    // registered preadder
        mult_r <= preadd_r * bin_r;   // registered multiply
        sum_r  <= mult_r + cin;     // registered sum
        end
    end

endmodule

