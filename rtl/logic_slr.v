//`define SIM
module  logic_slr #(
    parameter NUM_LOGIC_BLOCK 	= 2,
   // parameter TOGGLE_RATE = 100,
    parameter data_width = 16
    )
    (
	input clk,
	input rst,
    input wire [6:0] TOGGLE_RATE,
	output logic_o
    );
;
//reg
reg 	 cascade_i = 0;
wire	[NUM_LOGIC_BLOCK:0]	           cascade;
wire	[NUM_LOGIC_BLOCK:0]	           mask_o;   
wire	[NUM_LOGIC_BLOCK:0]	           so;   
//wire si;

wire [(NUM_LOGIC_BLOCK+1)*data_width-1:0] data_out;



reg[6:0] mask_counter=7'h00;
reg mask_i=0;
//toggle rate and mask counter;
wire si = mask_counter[0];
always@(posedge clk)
if(rst)
begin
mask_counter <= 8'h00;
mask_i <= 0;
end

else begin
	if(mask_counter==8'd99)
  		mask_counter<= 8'd1; 
	else 
		mask_counter<=mask_counter + 1;
	
	if(mask_counter < TOGGLE_RATE)
		mask_i <= 0;
	else
		mask_i <= 1;
end
	
assign logic_o = ^so; 
// Basic_Block
//
	basic_block ubasic_block (
		.clk(clk),
		.rst(rst),
		.mask_i(mask_i),
		.mask_o(mask_o[0]),
	
		.cascade_i(cascade_i),
		.cascade_o(cascade[0]),
		   //slr
                .SI(si),
                .SO(so[0])
	);

   genvar cnt;
   generate
      for (cnt=1; cnt < NUM_LOGIC_BLOCK+1; cnt=cnt+1) 
      begin: logic_gen
	basic_block ubasic_block (
		.clk(clk),
		.rst(rst),
            .mask_i(mask_o[cnt-1]),
	        .mask_o(mask_o[cnt]),	
		.cascade_i(cascade[cnt-1]),
		.cascade_o(cascade[cnt]),
	 //slr
                .SI(si),
                .SO(so[cnt])
	);
      end
   endgenerate
endmodule



module basic_block(
    input clk,
    input rst,
    input mask_i,
    output reg mask_o,
    input cascade_i,
    output reg cascade_o,
    //slr
    input SI,
    output SO 
);
//parameter slr 
parameter WIDTH = 32;

(* DONT_TOUCH="TRUE" *)reg[5:0] data=6'b000000;
//(* DONT_TOUCH="TRUE" *)reg cascade_o;

(* DONT_TOUCH="TRUE" *)wire toggle_wire;


wire[5:0] mask_wire;

assign mask_wire = {6{mask_i}}; 
always@(posedge clk)
if(rst)
data<=6'b000000;
else
 data <= (mask_wire | ~data);

assign toggle_wire = ~&(data);

always@(posedge clk)
if(rst)begin
cascade_o <= 0;
mask_o <= 1;
end
else begin
	cascade_o <= toggle_wire;
    mask_o <= mask_i;
end


//for slr
//   parameter shift = 5;//shift_length;
//
//   reg [shift-1:0] shift_reg = {shift{1'b0}};
//
//   always @(posedge clk)
//      shift_reg  <= {data_in, shift_reg[shift-1:1]};
//
//   assign data_out = shift_reg[0];




   // 8-bit Shift Register
// Rising edge clock
// Active high clock enable
// Concatenation-based template
// File: shift_registers_0.v
//module shift_registers_0 (clk, clken, SI, SO);


reg[WIDTH-1:0] shreg;
integer i;
always @(posedge clk)
begin
if (mask_i)
begin
for (i = 0; i < WIDTH-1; i = i+1)
shreg[i+1] <= shreg[i];
shreg[0] <= SI;
end
end
assign SO = shreg[WIDTH-1];

endmodule



