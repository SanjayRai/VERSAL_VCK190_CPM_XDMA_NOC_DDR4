module clk_gen (
	input clk,
	input rst,
	output rst_out,
	output clk_out_1,
	output clk_out_2,
	output clk_out_3,
	output clk_out_4
	//input  dclk
    //inout	[35:0] CONTROL,
    //inout	[35:0] CONTROL1
);



reg [15:0]  bit_mask, n_bit_mask;
wire            drp_request;




wire LOCKED;



assign rst_out = !LOCKED;
assign clk_out_1 = CLK_OUT1;
assign clk_out_2 = CLK_OUT2;
assign clk_out_3 = CLK_OUT3;
assign clk_out_4 = CLK_OUT4;


  clk_wiz_0v uMMCM
   (// Clock in ports
    .clk_in1(clk),      // input CLK_IN1
    //.CLKFB_IN(CLKFB_OUT),     // input CLKFB_IN
    // Clock out ports
    .clk_out1(CLK_OUT1),     // output CLK_OUT1
    .clk_out2(CLK_OUT2),     // output CLK_OUT2
    .clk_out3(CLK_OUT3),     // output CLK_OUT3
    .clk_out4(CLK_OUT4),     // output CLK_OUT4
  
    //.CLKFB_OUT(CLKFB_OUT),    // output CLKFB_OUT
    // Dynamic reconfiguration ports
    //.daddr(daddr),// input [6:0] DADDR
    //.dclk(dclk), // input DCLK
    //.DEN(den),// input DEN
    //.DIN(din), // input [15:0] DIN
    //.DOUT(dout), // output [15:0] DOUT
    //.DRDY(drdy), // input DRDY
    //.DWE(dwe),// output DWE
    // Status and control signals
    .reset(rst),// input RESET
    .locked(LOCKED)); 
  //----------------------------------------------------------------------------





         
    
endmodule
