module top_log (
// for differential clock
	input		clk_in,
	output [3:0]    USER_LED 
// for single port

  

);

//parameter TOGGLE_RATE           = 100;
//parameter NUM_LOGIC_BLOCK 	= 15000;
//parameter NUM_LOGIC_BLOCK 	= 20000;
parameter NUM_LOGIC_BLOCK_A 	= 2500;
//parameter NUM_LOGIC_BLOCK_A 	= 25000;
parameter NUM_LOGIC_BLOCK_B 	= 2400;
//parameter NUM_LOGIC_BLOCK_B 	= 24000;
//parameter NUM_LOGIC_BLOCK_C 	= 23000;
parameter NUM_LOGIC_BLOCK_C 	= 500;
//parameter NUM_LOGIC_BLOCK 	= 30000;
parameter NUM_RAMB_36_DC 	=50;
//parameter NUM_RAMB_36_DC 	=950;
parameter DATAWIDTH_36K     = 36;

parameter NUM_DSP_BLOCK     =10;
//parameter NUM_DSP_BLOCK     =100;
parameter NUM_DSP_COLUMN    = 5;//45;//max = 57(VU9P)
//parameter NUM_DSP_COLUMN    = 10;//45;//max = 57(VU9P)

//internal register or wire
reg [31:0] counter=32'h0000_0000;
(* mark_debug = "true" *) wire GPIO_LED_0;
(* mark_debug = "true" *) wire data_o;
(* mark_debug = "true" *) wire rst_out;
(* mark_debug = "true" *) wire [6:0] toggle_rate;

wire link_down_latched_out = 1;


reg [1:0] count;
wire dclk_out;
wire ram_o;
wire ram_en;
wire logic_o_A;
wire logic_o_B;
(* mark_debug = "true" *)wire [2:0] clk_sel;
wire clk_out_1,clk_out_2,clk_out_3,clk_out_4,clk_out_5,clk_out_6,clk_out_7;
reg clk_dcm;
//wire dsp_o;
wire clk_mux_o;



assign data_o = ram_o ^ (^dsp_o) ^ logic_o_A ^ logic_o_B ^ logic_o_C;

assign USER_LED[3] = counter[29];
assign USER_LED[2] = counter[28];
assign USER_LED[1] = counter[27];
assign USER_LED[0] = counter[26];


initial count = 0;

    always @ (posedge clk_mux_o)
        count <= count + 1;

assign GPIO_LED_0 = counter[31];
always@(posedge clk_mux_o)
	counter <= #1 counter + 1;



//BUFG uBUFG_DRP (.I(count[1]), .O(dclk));

	logic_slr  #(.NUM_LOGIC_BLOCK(NUM_LOGIC_BLOCK_A), .data_width(32)) ulogic_A
		(
		.clk(clk_mux_o),
		.rst(rst_out),
		.TOGGLE_RATE(toggle_rate),
		.logic_o(logic_o_A)
	
		);

	logic_slr  #(.NUM_LOGIC_BLOCK(NUM_LOGIC_BLOCK_B), .data_width(32)) ulogic_B
		(
		.clk(clk_mux_o),
		.rst(rst_out),
		.TOGGLE_RATE(toggle_rate),
		.logic_o(logic_o_B)
	
		);
	logic_slr  #(.NUM_LOGIC_BLOCK(NUM_LOGIC_BLOCK_C), .data_width(32)) ulogic_C
		(
		.clk(clk_mux_o),
		.rst(rst_out),
		.TOGGLE_RATE(toggle_rate),
		.logic_o(logic_o_C)
	
		);


       
	block_ram_daisy_chain  #(.NUM_RAMB_36(NUM_RAMB_36_DC),.DATAWIDTH(36)) block_ram_daisy_chain_36k
		(
		.clk(clk_mux_o),
		.irst(rst_out),
		.TOGGLE_RATE(toggle_rate),
		//.ram_en(ram_en),
		.ram_o(ram_o)
		
		);
	
	
 
                dsp_top #(.NUM_DSP_COLUMN(NUM_DSP_COLUMN),.NUM_DSP_BLOCK(NUM_DSP_BLOCK)) dsp_top_inst
                    (
                    .clk(clk_mux_o), 
                    .rst(rst_out),
                    .TOGGLE_RATE(toggle_rate),
                    .dsp_top_o(dsp_o)
                    
                    );
   

assign clk_mux_o = clk_in;
//     clk_gen uclk_gen (
//         	 .clk(clk_in),
//         	 .rst(1'b0),
//         	 .rst_out(),
//         	 .clk_out_1(clk_out_1),
//         	 .clk_out_2(clk_out_2),
//         	 .clk_out_3(clk_out_3),
//         	 .clk_out_4(clk_out_4)
// 
//         );
//         
// //  <-----Cut code below this line---->
//         
//            // BUFGMUX: General Clock Mux Buffer
//            //          Virtex UltraScale+
//            // Xilinx HDL Language Template, version 2017.3
//         
//            BUFGMUX #(
//               .CLK_SEL_TYPE("SYNC")  // ASYNC, SYNC
//            )
//            BUFGMUX_inst0 (
//               .O(clk_mux_o1),   // 1-bit output: Clock output
//               .I0(clk_out_1), // 1-bit input: Clock input (S=0)
//               .I1(clk_out_2), // 1-bit input: Clock input (S=1)
//               .S(clk_sel[0])    // 1-bit input: Clock select
//            );
//         
//            // End of BUFGMUX_inst instantiation
//   //  <-----Cut code below this line---->
//            
//               // BUFGMUX: General Clock Mux Buffer
//               //          Virtex UltraScale+
//               // Xilinx HDL Language Template, version 2017.3
//            
//               BUFGMUX #(
//                  .CLK_SEL_TYPE("SYNC")  // ASYNC, SYNC
//               )
//               BUFGMUX_inst1 (
//                  .O(clk_mux_o2),   // 1-bit output: Clock output
//                  .I0(clk_out_3), // 1-bit input: Clock input (S=0)
//                  .I1(clk_out_4), // 1-bit input: Clock input (S=1)
//                  .S(clk_sel[1])    // 1-bit input: Clock select
//               );
//            
//               // End of BUFGMUX_inst instantiation    
//               
//               //  <-----Cut code below this line---->
//               
// //                  BUFGMUX: General Clock Mux Buffer
// //                           Virtex UltraScale+
// //                  Xilinx HDL Language Template, version 2017.3
//               
//                  BUFGMUX #(
//                     .CLK_SEL_TYPE("SYNC")  // ASYNC, SYNC
//                  )
//                  BUFGMUX_inst2 (
//                     .O(clk_mux_o),   // 1-bit output: Clock output
//                     .I0(clk_mux_o1), // 1-bit input: Clock input (S=0)
//                     .I1(clk_mux_o2), // 1-bit input: Clock input (S=1)
//                     .S(clk_sel[2])    // 1-bit input: Clock select
//                  );
//               
//                  // End of BUFGMUX_inst instantiation
	
vio_0v vio_0_ins(
.clk(clk_mux_o),
.probe_in0({GPIO_LED_0,data_o}),
.probe_out0({rst_out,clk_sel}),
.probe_out1({toggle_rate})
);

endmodule

