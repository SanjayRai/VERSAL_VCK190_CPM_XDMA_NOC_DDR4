/*----------------------------------------------------------------------------
 * Copyright (c) 2008 Xilinx, Inc.
 * This design is confidential and proprietary of Xilinx, All Rights Reserved.
 *-----------------------------------------------------------------------------
 *   ____  ____
 *  /   /\/   /
 * /___/  \  /   Vendor: Xilinx
 * \   \   \/    Date Created: 2008/08/18
 *  \   \        
 *  /   /        
 * /___/   /\    
 * \   \  /  \ 
 *  \___\/\___\
 * 
 *Device: All
 *Purpose:
 *  A generic mux with any number of select lines, and one large input that could
 *  be a collection of buses.
 *
 *----------------------------------------------------------------------------*/
`timescale 1 ns / 1 ps
module axis_mem_v1_0_0_generic_mux
  #(
    parameter  C_WIDTH           = 16,
    parameter  C_NUM_BUSES       = 1
  ) 
  (
    input   [(C_NUM_BUSES*C_WIDTH)-1:0]    DIN_I,
    input   [clogb2(C_NUM_BUSES-1)-1:0]    SEL_I,   
    output wire [C_WIDTH-1:0]                 DOUT_O
  );
  
  `include "axis_mem_v1_0_0_lib_fn.vh"
  
  wire    [C_WIDTH-1:0] input_array [0:C_NUM_BUSES-1];
  
  assign  DOUT_O = input_array[SEL_I];
  
  generate
    genvar ig;
      for(ig=0; ig<C_NUM_BUSES; ig=ig+1) 
      begin: array_assignments
          assign  input_array[ig] = DIN_I[((ig+1)*C_WIDTH)-1:(ig*C_WIDTH)];
      end
  endgenerate
  
endmodule                   


/*----------------------------------------------------------------------------
 * Copyright (c) 2008 Xilinx, Inc.
 * This design is confidential and proprietary of Xilinx, All Rights Reserved.
 *-----------------------------------------------------------------------------
 *   ____  ____
 *  /   /\/   /
 * /___/  \  /   Vendor: Xilinx
 * \   \   \/    Date Created: 2011/08/09
 *  \   \        
 *  /   /        
 * /___/   /\    
 * \   \  /  \ 
 *  \___\/\___\
 * 
 *Device: All
 *Purpose:
 *  A generic memory read interface that breaks down a x-bit wide input read data into 
 *  y-bit output data chunks.  ACK_I pulsed when DIN_I is correct, EN_O, is asserted 
 *  when correct DOUT_O data and NEXT_READ_ADDR_O is outputted.  EN_I is asserted when 
 *  next data should be outputted.
 *
 *----------------------------------------------------------------------------*/
`timescale 1 ns / 1 ps

 module axis_mem_v1_0_0_generic_memrd
#(
  parameter C_INPUT_WIDTH     = 16,
  parameter C_OUTPUT_WIDTH    = 16,
  parameter C_DATA_DEPTH      = 65536,
  parameter C_RD_WRD_CNT_WIDTH = 10,
  parameter C_OUTPUT_ENABLE_LATENCY  = 0,
  parameter C_READ_ENABLE_LATENCY = 0,
  parameter C_LOG2_DATA_DEPTH  = clogb2(C_DATA_DEPTH-1)
) 
(
  input [C_INPUT_WIDTH-1:0]           DIN_I,
  input                               ACK_I,
  input                               EN_I,
  input                               READ_ADDR_RESET_I,
  input [C_LOG2_DATA_DEPTH-1:0]       READ_RESET_ADDR_I,
  input                               CLK_I,
  output wire                         RESET_ACK_O,
  output wire                         READ_ADDR_EN_O,
  output wire [C_LOG2_DATA_DEPTH-1:0] CURR_READ_ADDR_O,
  output wire [C_RD_WRD_CNT_WIDTH-1:0] CURR_READ_WRD_CNT_O,
  output wire                         EN_O,
  output wire [C_OUTPUT_WIDTH-1:0]    DOUT_O
);
  
  `include "axis_mem_v1_0_0_lib_fn.vh"
  
  localparam LC_READ_PER_ADDR = (C_INPUT_WIDTH-1)/C_OUTPUT_WIDTH + 1;
  localparam RESET_ADDR = 7'b0000001, REQUEST_READ = 7'b0000010, WAIT_READ_ACK = 7'b0000100, OUTPUT_DATA = 7'b0001000, IDLE = 7'b0010000, INCREMENT_BLOCK = 7'b0100000, INCREMENT_ADDRESS = 7'b1000000; 
  reg [6:0] current_state;
  reg [6:0] next_state;
  (* DONT_TOUCH = "TRUE" *) reg [clogb2(LC_READ_PER_ADDR-1)-1:0] curr_read_block;
 
  reg [(LC_READ_PER_ADDR)*C_OUTPUT_WIDTH-1:0] input_data;
  reg [C_OUTPUT_ENABLE_LATENCY:0] enable_out = 'b0;
  reg data_out_en;
  reg [C_READ_ENABLE_LATENCY:0] read_enable_out;
  reg read_en;
  reg reset_ack;
  reg [C_LOG2_DATA_DEPTH-1:0]  read_addr;
  reg [C_RD_WRD_CNT_WIDTH-1:0]  read_data_wrd_cnt;
  
  always @(posedge CLK_I)
  begin
    if (READ_ADDR_RESET_I == 1'b1)
	begin
      current_state <= RESET_ADDR;
	reset_ack <= 1'b1;
	end
    else
	begin
      current_state <= next_state;
	reset_ack <= 1'b0;
	end
  end

 assign RESET_ACK_O = reset_ack;
  
  always @ (current_state, ACK_I, EN_I, curr_read_block)
  begin
    case(current_state)

      RESET_ADDR:
      begin
        if (EN_I == 1'b1)
          next_state <= REQUEST_READ;
        else
          next_state <= RESET_ADDR;
      end
    
      REQUEST_READ:
      begin
        next_state <= WAIT_READ_ACK;
      end
    
      WAIT_READ_ACK:
      begin
        if (ACK_I == 1'b1)
          next_state <= OUTPUT_DATA;
        else
          next_state <= WAIT_READ_ACK;
      end
    
      OUTPUT_DATA:
      begin
        next_state <= IDLE;
      end
      
      IDLE:
      begin 
        if (EN_I == 1'b1)
        begin
          if (curr_read_block < LC_READ_PER_ADDR-1)
            next_state <= INCREMENT_BLOCK;
          else
            next_state <= INCREMENT_ADDRESS;
        end  
        else
          next_state <= IDLE;
      end

      INCREMENT_BLOCK:
      begin
        next_state <= OUTPUT_DATA;
      end
      
      INCREMENT_ADDRESS:
      begin
        next_state <= REQUEST_READ;
      end
      
      default:
      begin
        next_state <= RESET_ADDR;
      end
    
    endcase
  end
  
  //set outputs - case on next_state with always @ posedge of CLK_I rather than always @ current_state and case on current_state to workaround XST issue
  always @ (posedge CLK_I)
  begin
    //case (next_state)
    case (current_state)

      RESET_ADDR:
      begin
        read_addr <= READ_RESET_ADDR_I;
        read_data_wrd_cnt <= 'h0;
        curr_read_block <= 1'b0;
        read_en <= 1'b0;
        data_out_en <= 1'b0;
      end
      
      REQUEST_READ:
      begin
        read_addr <= read_addr;
        read_data_wrd_cnt <= read_data_wrd_cnt;
        curr_read_block <= curr_read_block;
        read_en <= 1'b1;
        data_out_en <= 1'b0;
      end
      
      WAIT_READ_ACK:
      begin
        read_addr <= read_addr;
        read_data_wrd_cnt <= read_data_wrd_cnt;
        curr_read_block <= curr_read_block;
        read_en <= 1'b0;
        data_out_en <= 1'b0;
      end

      OUTPUT_DATA:
      begin
        read_addr <= read_addr;
        read_data_wrd_cnt <= read_data_wrd_cnt;
        curr_read_block <= curr_read_block;
        read_en <= 1'b0;
        data_out_en <= 1'b1;
      end
      
      IDLE:
      begin
        read_addr <= read_addr;
        read_data_wrd_cnt <= read_data_wrd_cnt;
        curr_read_block <= curr_read_block;
        read_en <= 1'b0;
        data_out_en <= 1'b0;
      end
      
      INCREMENT_BLOCK:
      begin
        read_addr <= read_addr;
        read_data_wrd_cnt <= read_data_wrd_cnt + 1;
        curr_read_block <= curr_read_block+1;
        read_en <= 1'b0;
        data_out_en <= 1'b0;
      end

      INCREMENT_ADDRESS:
      begin
        read_addr <= read_addr+1;
        read_data_wrd_cnt <= read_data_wrd_cnt + 1;
        curr_read_block <= 0;
        read_en <= 1'b0;
        data_out_en <= 1'b0;
      end      
    endcase
  end

  generate 
    if (C_OUTPUT_ENABLE_LATENCY == 0)
    begin: no_enable_latency
      always @ (data_out_en)
      begin
        enable_out <= data_out_en;
      end
    end
    else if (C_OUTPUT_ENABLE_LATENCY == 1)
    begin: single_enable_latency
      always @ (posedge CLK_I)
      begin
        enable_out <= {data_out_en, 1'b0};
      end
    end
    else
    begin: multiple_enable_latency
      always @(posedge CLK_I)
      begin
        enable_out <= {enable_out[C_OUTPUT_ENABLE_LATENCY-1:1], data_out_en, 1'b0};
      end
    end
  endgenerate
  
  assign EN_O = enable_out[C_OUTPUT_ENABLE_LATENCY];
  
  //
  // Mahesh for DOA/DOB
  //
  reg read_en_temp;
  generate 
    if (C_READ_ENABLE_LATENCY == 0)
    begin: no_read_latency
      always @ (read_en)
      begin
        read_enable_out <= read_en;
      end
    end
    else if (C_OUTPUT_ENABLE_LATENCY == 1)
    begin: single_read_latency
      always @ (posedge CLK_I)
      begin
        read_enable_out <= {read_en, 1'b0};
      end
    end
    else
    begin: multiple_read_latency
      always @(posedge CLK_I)
      begin
        read_enable_out <= {read_enable_out[C_OUTPUT_ENABLE_LATENCY-1:1], read_en, 1'b0};
      end

      always @(posedge CLK_I)
      begin
        read_en_temp <= read_enable_out[C_OUTPUT_ENABLE_LATENCY];
      end
    end
  endgenerate
  
  assign READ_ADDR_EN_O = (read_enable_out[C_OUTPUT_ENABLE_LATENCY] | read_en_temp);
  
  //0 pad data for correct muxing
  initial 
  begin
    input_data <= {LC_READ_PER_ADDR*C_OUTPUT_WIDTH{1'b0}};
    current_state <= RESET_ADDR;
    next_state <= RESET_ADDR;
  end

  always @(posedge CLK_I)
  begin
    //if (ACK_I == 1'b1)
      input_data[C_INPUT_WIDTH-1:0] <= DIN_I;
  end
  
  axis_mem_v1_0_0_generic_mux
  #(
    .C_WIDTH(C_OUTPUT_WIDTH),
    .C_NUM_BUSES(LC_READ_PER_ADDR)
  ) u_data_mux (
    .DIN_I(input_data),
    .SEL_I(curr_read_block),
    .DOUT_O(DOUT_O)
  );  
  
  assign CURR_READ_ADDR_O = read_addr;
  assign CURR_READ_WRD_CNT_O = read_data_wrd_cnt;
  
endmodule
 



`timescale 1ns / 1ps

module axis_mem_v1_0_0_mem
#(
  parameter                        C_MEMORY_TYPE      = 0,
  parameter                        C_RAM_WIDTH        = 16,
  parameter                        C_RAM_DEPTH        = 65536,
  parameter                        C_DEPTH_ADDR_WIDTH = 8
)
(
  input                            WRITE_CLK_I,
  input  [C_RAM_WIDTH-1:0]         WRITE_DATA_I,
  input                            EN_WRITE_I,
  input                            WE_WRITE_I,
  input  [C_DEPTH_ADDR_WIDTH-1:0]  ADDR_WRITE_I,
  input                            READ_CLK_I,
  input                            EN_READ_I,
  input  [C_DEPTH_ADDR_WIDTH-1:0]  ADDR_READ_I,
  output [C_RAM_WIDTH-1:0]         READ_DATA_O
);

  function integer blk_mem_gen_cnt;
  input integer width;
  input integer blk_max_width;
  integer temp_rm;
  integer temp;
  begin 
    temp_rm = width % blk_max_width;
    if (temp_rm == 0)
    begin
      temp = width / blk_max_width;
    end
    else
    begin
      temp = (width / blk_max_width) + 1;
    end
    blk_mem_gen_cnt = temp;
  end 
  endfunction
 
  reg [C_RAM_WIDTH-1:0] write_data_i;
  (*retiming_forward = 1 *) reg [C_DEPTH_ADDR_WIDTH-1:0] addr_write_i;
  (*retiming_forward = 1 *) reg we_write_i; 
  localparam LC_BLK_MAX_WIDTH = (C_RAM_DEPTH <= 32768) ? 512 : ((C_RAM_DEPTH == 65536) ? 256 : 128);
  localparam LC_BLK_MEM_CNT = blk_mem_gen_cnt(C_RAM_WIDTH, LC_BLK_MAX_WIDTH);

  always @(posedge WRITE_CLK_I)
  begin
    write_data_i <= WRITE_DATA_I;
    we_write_i   <= WE_WRITE_I;
    addr_write_i <= ADDR_WRITE_I;
  end

  genvar i;
  generate
   if (C_MEMORY_TYPE == 0)
   begin: BRAM
    if (LC_BLK_MEM_CNT > 1)
    begin: XPM
      for (i=0; i < LC_BLK_MEM_CNT-1; i=i+1) begin : BLKMEM
        xpm_memory_sdpram 
        #(
          .MEMORY_SIZE             (C_RAM_DEPTH*LC_BLK_MAX_WIDTH                        ),
          .MEMORY_PRIMITIVE        ("block"                                             ),
          .CLOCKING_MODE           ("independent_clock"                                      ),
          .MEMORY_INIT_FILE        ("none"                                              ),
          .MEMORY_INIT_PARAM       (""                                                  ),
          .USE_MEM_INIT            (1                                                   ),
          .WAKEUP_TIME             ("disable_sleep"                                     ),
          .MESSAGE_CONTROL         (0                                                   ),
          .ECC_MODE                ("no_ecc"                                            ),
          .AUTO_SLEEP_TIME         (0                                                   ),
          .USE_EMBEDDED_CONSTRAINT (0                                                   ),
          .MEMORY_OPTIMIZATION     ("true"                                              ),
          // Port A module parameters
          .WRITE_DATA_WIDTH_A      (LC_BLK_MAX_WIDTH                                    ),
          .BYTE_WRITE_WIDTH_A      (LC_BLK_MAX_WIDTH                                    ),
          .ADDR_WIDTH_A            (C_DEPTH_ADDR_WIDTH                                  ),
          // Port B module parameters
          .READ_DATA_WIDTH_B       (LC_BLK_MAX_WIDTH                                    ),
          .ADDR_WIDTH_B            (C_DEPTH_ADDR_WIDTH                                  ),
          .READ_RESET_VALUE_B      ("0"                                                 ),
          .READ_LATENCY_B          (2                                                   ),
          .WRITE_MODE_B            ("no_change"                                         )
        ) sdpram 
        (
          .sleep                   (1'b0                                                ),
          .clka                    (WRITE_CLK_I                                         ),
          .ena                     (EN_WRITE_I                                          ),
          //.wea                     (WE_WRITE_I                                          ),
          .wea                     (we_write_i                                          ),
          //.addra                   (ADDR_WRITE_I                                        ),
          .addra                   (addr_write_i                                        ),
          //.dina                    (WRITE_DATA_I[LC_BLK_MAX_WIDTH*i +: LC_BLK_MAX_WIDTH]),
          .dina                    (write_data_i[LC_BLK_MAX_WIDTH*i +: LC_BLK_MAX_WIDTH]),
          .injectsbiterra          (1'b0                                                ),
          .injectdbiterra          (1'b0                                                ),
          // Port B module ports
          .clkb                    (READ_CLK_I                                          ),
          .rstb                    (1'b0                                                ),
          .enb                     (EN_READ_I                                           ),
          .regceb                  (1'b1                                                ),
          .addrb                   (ADDR_READ_I                                         ),
          .doutb                   (READ_DATA_O[LC_BLK_MAX_WIDTH*i +: LC_BLK_MAX_WIDTH] ),
          .sbiterrb                (                                                    ),
          .dbiterrb                (                                                    )
        );
      end
      xpm_memory_sdpram 
      #(
        .MEMORY_SIZE             (C_RAM_DEPTH*(C_RAM_WIDTH - (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1)))),
        .MEMORY_PRIMITIVE        ("block"                                             ),
        .CLOCKING_MODE           ("independent_clock"                                      ),
        .MEMORY_INIT_FILE        ("none"                                              ),
        .MEMORY_INIT_PARAM       (""                                                  ),
        .USE_MEM_INIT            (1                                                   ),
        .WAKEUP_TIME             ("disable_sleep"                                     ),
        .MESSAGE_CONTROL         (0                                                   ),
        .ECC_MODE                ("no_ecc"                                            ),
        .AUTO_SLEEP_TIME         (0                                                   ),
        .USE_EMBEDDED_CONSTRAINT (0                                                   ),
        .MEMORY_OPTIMIZATION     ("true"                                              ),
        // Port A module parameters
        .WRITE_DATA_WIDTH_A      (C_RAM_WIDTH - (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1))),
        .BYTE_WRITE_WIDTH_A      (C_RAM_WIDTH - (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1))),
        .ADDR_WIDTH_A            (C_DEPTH_ADDR_WIDTH                                  ),
        // Port B module parameters
        .READ_DATA_WIDTH_B       (C_RAM_WIDTH - (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1))),
        .ADDR_WIDTH_B            (C_DEPTH_ADDR_WIDTH                                  ),
        .READ_RESET_VALUE_B      ("0"                                                 ),
        .READ_LATENCY_B          (2                                                   ),
        .WRITE_MODE_B            ("no_change"                                         )
      ) sdpram 
      (
        .sleep                   (1'b0                                                ),
        .clka                    (WRITE_CLK_I                                         ),
        .ena                     (EN_WRITE_I                                          ),
        //.wea                     (WE_WRITE_I                                          ),
        .wea                     (we_write_i                                          ),
        //.addra                   (ADDR_WRITE_I                                        ),
        .addra                   (addr_write_i                                        ),
        //.dina                    (WRITE_DATA_I[C_RAM_WIDTH - 1 : (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1))]),
        .dina                    (write_data_i[C_RAM_WIDTH - 1 : (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1))]),
        .injectsbiterra          (1'b0                                                ),
        .injectdbiterra          (1'b0                                                ),
        // Port B module ports
        .clkb                    (READ_CLK_I                                          ),
        .rstb                    (1'b0                                                ),
        .enb                     (EN_READ_I                                           ),
        .regceb                  (1'b1                                                ),
        .addrb                   (ADDR_READ_I                                         ),
        .doutb                   (READ_DATA_O[C_RAM_WIDTH - 1 : (LC_BLK_MAX_WIDTH * (LC_BLK_MEM_CNT - 1))] ),
        .sbiterrb                (                                                    ),
        .dbiterrb                (                                                    )
      );
    end
    else if (LC_BLK_MEM_CNT == 1)
    begin : XPM_1
      
      xpm_memory_sdpram 
      #(
        .MEMORY_SIZE             (C_RAM_DEPTH*C_RAM_WIDTH                             ),
        .MEMORY_PRIMITIVE        ("block"                                             ),
        .CLOCKING_MODE           ("independent_clock"                                 ),
        .MEMORY_INIT_FILE        ("none"                                              ),
        .MEMORY_INIT_PARAM       (""                                                  ),
        .USE_MEM_INIT            (1                                                   ),
        .WAKEUP_TIME             ("disable_sleep"                                     ),
        .MESSAGE_CONTROL         (0                                                   ),
        .ECC_MODE                ("no_ecc"                                            ),
        .AUTO_SLEEP_TIME         (0                                                   ),
        .USE_EMBEDDED_CONSTRAINT (0                                                   ),
        .MEMORY_OPTIMIZATION     ("true"                                              ),
        // Port A module parameters
        .WRITE_DATA_WIDTH_A      (C_RAM_WIDTH                                         ),
        .BYTE_WRITE_WIDTH_A      (C_RAM_WIDTH                                         ),
        .ADDR_WIDTH_A            (C_DEPTH_ADDR_WIDTH                                  ),
        // Port B module parameters
        .READ_DATA_WIDTH_B       (C_RAM_WIDTH                                         ),
        .ADDR_WIDTH_B            (C_DEPTH_ADDR_WIDTH                                  ),
        .READ_RESET_VALUE_B      ("0"                                                 ),
        .READ_LATENCY_B          (2                                                   ),
        .WRITE_MODE_B            ("no_change"                                         )
      ) sdpram 
      (
        .sleep                   (1'b0                                                ),
        .clka                    (WRITE_CLK_I                                         ),
        .ena                     (EN_WRITE_I                                          ),
        //.wea                     (WE_WRITE_I                                          ),
        .wea                     (we_write_i                                          ),
        //.addra                   (ADDR_WRITE_I                                        ),
        .addra                   (addr_write_i                                        ),
        //.dina                    (WRITE_DATA_I                                        ),
        .dina                    (write_data_i                                        ),
        .injectsbiterra          (1'b0                                                ),
        .injectdbiterra          (1'b0                                                ),
        // Port B module ports
        .clkb                    (READ_CLK_I                                          ),
        .rstb                    (1'b0                                                ),
        .enb                     (EN_READ_I                                           ),
        .regceb                  (1'b1                                                ),
        .addrb                   (ADDR_READ_I                                         ),
        .doutb                   (READ_DATA_O                                         ),
        .sbiterrb                (                                                    ),
        .dbiterrb                (                                                    )
      );
    end
   end
  else if (C_MEMORY_TYPE == 1)
    begin : URAM
      
      xpm_memory_sdpram 
      #(
        .MEMORY_SIZE             (C_RAM_DEPTH*C_RAM_WIDTH                             ),
        .MEMORY_PRIMITIVE        ("ultra"                                             ),
        .CLOCKING_MODE           ("common_clock"                                      ),
        .MEMORY_INIT_FILE        ("none"                                              ),
        .MEMORY_INIT_PARAM       (""                                                  ),
        .USE_MEM_INIT            (1                                                   ),
        .WAKEUP_TIME             ("disable_sleep"                                     ),
        .MESSAGE_CONTROL         (0                                                   ),
        .ECC_MODE                ("no_ecc"                                            ),
        .AUTO_SLEEP_TIME         (0                                                   ),
        .USE_EMBEDDED_CONSTRAINT (0                                                   ),
        .MEMORY_OPTIMIZATION     ("true"                                              ),
        // Port A module parameters
        .WRITE_DATA_WIDTH_A      (C_RAM_WIDTH                                         ),
        .BYTE_WRITE_WIDTH_A      (C_RAM_WIDTH                                         ),
        .ADDR_WIDTH_A            (C_DEPTH_ADDR_WIDTH                                  ),
        // Port B module parameters
        .READ_DATA_WIDTH_B       (C_RAM_WIDTH                                         ),
        .ADDR_WIDTH_B            (C_DEPTH_ADDR_WIDTH                                  ),
        .READ_RESET_VALUE_B      ("0"                                                 ),
        .READ_LATENCY_B          (3                                                   ),
        .WRITE_MODE_B            ("write_first"                                         )
      ) sdpram 
      (
        .sleep                   (1'b0                                                ),
        .clka                    (WRITE_CLK_I                                         ),
        .ena                     (EN_WRITE_I                                          ),
        //.wea                     (WE_WRITE_I                                          ),
        .wea                     (we_write_i                                          ),
        //.addra                   (ADDR_WRITE_I                                        ),
        .addra                   (addr_write_i                                        ),
        //.dina                    (WRITE_DATA_I                                        ),
        .dina                    (write_data_i                                        ),
        .injectsbiterra          (1'b0                                                ),
        .injectdbiterra          (1'b0                                                ),
        // Port B module ports
        .clkb                    (READ_CLK_I                                          ),
        .rstb                    (1'b0                                                ),
        .enb                     (EN_READ_I                                           ),
        .regceb                  (1'b1                                                ),
        .addrb                   (ADDR_READ_I                                         ),
        .doutb                   (READ_DATA_O                                         ),
        .sbiterrb                (                                                    ),
        .dbiterrb                (                                                    )
      );
    end

  endgenerate
endmodule




`timescale 1 ns / 1 ps
(* DONT_TOUCH = "TRUE" *)
    module axis_mem_v1_0_0_axis_mem
    #(
      parameter integer C_MEMORY_TYPE          = 0,
      parameter integer C_RAM_WIDTH            = 32,
      // Include file for probe widths
      `include "axis_mem_v1_0_0_probe_width.vh"
      parameter integer C_RAM_DEPTH            = 1024,
      parameter integer C_EN_STRG_QUAL         = 0,
      parameter integer C_EN_ADV_TRIG          = 1,
      parameter integer C_DEPTH_ADDR_WIDTH     = 10,
      parameter integer C_RD_WRD_CNT_WIDTH     = 10,
      parameter integer C_NUM_PROBES           = 1,
      parameter integer C_AXIS_DATA_WIDTH      = 32,
      parameter [(C_NUM_PROBES*2)-1:0] C_DATA_TRIGGER = 2'b0
     )
     (
      input                                   M_AXIS_ACLK,
      // Include file for probe ports
      `include "axis_mem_v1_0_0_probe_ports.vh"
      input                                   read_data_en_i,
      input                                   TRIGGER_I,
      input [1:0]                             capture_mode_i,
      input                                   en_adv_trigger_i,
      input                                   clk,
      input                                   arm,
      input                                   WE_WRITE_I,
      input  [C_DEPTH_ADDR_WIDTH-1:0]         ADDR_WRITE_I,
      input  [C_DEPTH_ADDR_WIDTH-1:0]         read_reset_addr_i,
      input                                   read_addr_reset_i,
      output                                  reset_out_ack_o,
      output                                  data_out_en_o,
      output [C_AXIS_DATA_WIDTH-1:0]          data_word_out_o,
      output [C_DEPTH_ADDR_WIDTH-1:0]         trace_rd_addr_o,
      output [C_RD_WRD_CNT_WIDTH-1:0]         trace_rd_wrd_cnt_o
     );

    wire [C_RAM_WIDTH-1:0]                    mem_data_i;
    reg  [C_RAM_WIDTH-1:0]                    mem_data_shift0;
    reg  [C_RAM_WIDTH-1:0]                    mem_data_shift1;
    reg  trig_delay0 = 1'b0;
    wire [C_RAM_WIDTH:0]                      trace_rd_data_i;
    wire                                      trace_read_en;
    wire [C_DEPTH_ADDR_WIDTH-1:0]             trace_rd_addr;
    wire [C_RD_WRD_CNT_WIDTH-1:0]             trace_rd_wrd_cnt;

    wire                                      READ_CLK;
    wire                                      read_data_en;
    wire                                      read_addr_reset;
    wire                                      data_out_en;

    wire                                      reset_out_ack;


    reg [1:0]                                   trace_data_ack;

    `include "axis_mem_v1_0_0_mu_inst.vh"
generate 
  if (C_EN_STRG_QUAL == 1 || C_EN_ADV_TRIG == 1) begin :SQC_EN
     always @(posedge clk)
     begin
       mem_data_shift0 <= mem_data_i;
       trig_delay0 <= TRIGGER_I;
     end
  end

  if (C_EN_STRG_QUAL == 1 && C_EN_ADV_TRIG == 1) begin :SQC_ADV_TRIG
     always @(posedge clk)
     begin
       mem_data_shift1 <= mem_data_shift0;
     end
  end

endgenerate

generate
      case (C_MEMORY_TYPE)
         0: begin: BRAM
                  assign READ_CLK = M_AXIS_ACLK;
                  assign read_data_en    = read_data_en_i;
                  assign read_addr_reset = read_addr_reset_i;
                  assign data_out_en_o   = data_out_en;
  		  assign reset_out_ack_o = reset_out_ack;
                  end
         1: begin: URAM
                  assign READ_CLK = clk;

                   xpm_cdc_pulse #(
                      .DEST_SYNC_FF(4), 
                      .INIT_SYNC_FF(1), 
                      .REG_OUTPUT(0),   
                      .RST_USED(1),     
                      .SIM_ASSERT_CHK(1)
                   )
                   xpm_cdc_pulse_inst0 (
                      .dest_pulse(read_data_en),                 
                      .dest_clk(clk),            
                      .dest_rst(1'b0),       
                      .src_clk(M_AXIS_ACLK),     
                      .src_pulse(read_data_en_i),             
                      .src_rst(1'b0)          
                   );

                   xpm_cdc_pulse #(
                      .DEST_SYNC_FF(4),   
                      .INIT_SYNC_FF(1), 
                      .REG_OUTPUT(0),   
                      .RST_USED(1),     
                      .SIM_ASSERT_CHK(1)
                   )
                   xpm_cdc_pulse_inst1 (
                      .dest_pulse(read_addr_reset),                                                             
                      .dest_clk(clk),     
                      .dest_rst(1'b0),     
                      .src_clk(M_AXIS_ACLK),       
                      .src_pulse(read_addr_reset_i),                                                            
                      .src_rst(1'b0)        
                   );
				   
                   xpm_cdc_pulse #(
                      .DEST_SYNC_FF(4),   
                      .INIT_SYNC_FF(1), 
                      .REG_OUTPUT(0),   
                      .RST_USED(1),     
                      .SIM_ASSERT_CHK(1)
                   )
                   xpm_cdc_pulse_inst2 (
                      .dest_pulse(reset_out_ack_o),                                                             
                      .dest_clk(M_AXIS_ACLK),     
                      .dest_rst(1'b0),     
                      .src_clk(clk),       
                      .src_pulse(reset_out_ack),                                                            
                      .src_rst(1'b0)        
                   );

                   xpm_cdc_pulse #(
                      .DEST_SYNC_FF(4),   
                      .INIT_SYNC_FF(1),   
                      .REG_OUTPUT(0),     
                      .RST_USED(1),       
                      .SIM_ASSERT_CHK(1)  
                   )
                   xpm_cdc_pulse_inst3 (
                      .dest_pulse(data_out_en_o),                 
                      .dest_clk(M_AXIS_ACLK),     
                      .dest_rst(1'b0),      
                      .src_clk(clk),       
                      .src_pulse(data_out_en),    
                      .src_rst(1'b0)         
                   );
                  end
         default: begin 
                  assign READ_CLK = M_AXIS_ACLK;
                  assign read_data_en    = read_data_en_i;
                  assign read_addr_reset = read_addr_reset_i;
                  assign data_out_en_o   = data_out_en;
		  assign reset_out_ack_o = reset_out_ack;
                  end
      endcase
endgenerate

    axis_mem_v1_0_0_mem
    #(
      .C_MEMORY_TYPE          (C_MEMORY_TYPE             ),
      .C_RAM_WIDTH            (C_RAM_WIDTH+1             ),
      .C_RAM_DEPTH            (C_RAM_DEPTH               ),
      .C_DEPTH_ADDR_WIDTH     (C_DEPTH_ADDR_WIDTH        )
    ) u_trace_mem
    (
      .WRITE_CLK_I            (clk                       ),
      .WRITE_DATA_I           ((en_adv_trigger_i == 1'b1) ? {TRIGGER_I,mem_data_shift0} : {TRIGGER_I,mem_data_i}),
      //.WRITE_DATA_I           ((en_adv_trigger_i == 1'b1 && capture_mode_i == 2'b01 && trig_delay0 == 1'b1) ? {trig_delay0,mem_data_shift1} : (capture_mode_i == 2'b01 && TRIGGER_I == 1'b0) ? {trig_delay0,mem_data_shift0} : (en_adv_trigger_i == 1'b1) ? {TRIGGER_I,mem_data_shift0} : {TRIGGER_I,mem_data_i}),
      .EN_WRITE_I             (arm                       ),
      .WE_WRITE_I             (WE_WRITE_I                ),
      .ADDR_WRITE_I           (ADDR_WRITE_I              ),
      .READ_CLK_I             (READ_CLK                  ),
      .EN_READ_I              (trace_read_en             ),
      .ADDR_READ_I            (trace_rd_addr             ),  // The address will now come from generic read instead of master
      .READ_DATA_O            (trace_rd_data_i           )
    );

    always @(posedge READ_CLK)
    begin
      trace_data_ack[0] <= trace_read_en;
      trace_data_ack[1] <= trace_data_ack[0];
    end

    axis_mem_v1_0_0_generic_memrd
    #(
      .C_INPUT_WIDTH          (C_RAM_WIDTH+1             ),
      .C_OUTPUT_WIDTH         (C_AXIS_DATA_WIDTH         ),
      .C_DATA_DEPTH           (C_RAM_DEPTH               ),
      .C_RD_WRD_CNT_WIDTH     (C_RD_WRD_CNT_WIDTH        ),
      .C_OUTPUT_ENABLE_LATENCY(3                         ),
      .C_READ_ENABLE_LATENCY  (3                         )
    ) u_generic_memrd
    ( 
      .DIN_I                  (trace_rd_data_i           ),
      .ACK_I                  (trace_data_ack[1]         ),
      .EN_I                   (read_data_en            ), // Tie this to tvalid generation logic from master state machine
      .READ_ADDR_RESET_I      (read_addr_reset         ), // Need to generate this reset
      .READ_RESET_ADDR_I      (read_reset_addr_i         ), // Need to generate this reset
      .CLK_I                  (READ_CLK                  ), 
      .RESET_ACK_O            (reset_out_ack             ),
      .READ_ADDR_EN_O         (trace_read_en             ),
      .CURR_READ_ADDR_O       (trace_rd_addr             ),
      .CURR_READ_WRD_CNT_O    (trace_rd_wrd_cnt          ),
      .EN_O                   (data_out_en             ),
      .DOUT_O                 (data_word_out_o           )
    );

    assign trace_rd_addr_o = trace_rd_addr;
    assign trace_rd_wrd_cnt_o = trace_rd_wrd_cnt;
endmodule




