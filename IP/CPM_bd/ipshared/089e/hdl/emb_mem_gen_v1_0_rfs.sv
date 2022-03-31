//------------------------------------------------------------------------------
//  (c) Copyright 2015 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------

// ***************************
// * DO NOT MODIFY THIS FILE *
// ***************************

`timescale 1ps/1ps
`default_nettype none

module emb_mem_gen_v1_0_4 # (

  // IP core-only parameters
  parameter integer                   C_XPM_SELECT           = 0,

  // Common module parameters
  parameter integer                   C_MEMORY_TYPE          = 0,
  parameter integer                   C_MEMORY_SIZE          = 2048,
  parameter integer                   C_MEMORY_PRIMITIVE     = 0,
  parameter integer                   C_CLOCKING_MODE        = 0,
  parameter integer                   C_ECC_MODE             = 0,
  parameter                           C_ECC_TYPE             = "NONE",
  parameter                           C_MEMORY_INIT_FILE     = "none",
  parameter                           C_MEMORY_INIT_PARAM    = "",
  parameter integer                   C_WAKEUP_TIME          = 0,
  parameter integer                   C_AUTO_SLEEP_TIME      = 0,
  parameter integer                   C_MESSAGE_CONTROL      = 0,
  parameter integer                   C_VERSION              = 0,
  parameter integer                   C_ENABLE_32BIT_ADDRESS = 1,
  parameter integer                   C_MEMORY_OPTIMIZATION   = 1,
  parameter integer                   C_USE_EMBEDDED_CONSTRAINT = 0,
  parameter                           C_CASCADE_HEIGHT          = 1,
  parameter integer                   C_SIM_ASSERT_CHK          = 0,
  parameter integer                   C_WRITE_PROTECT           = 1,

  // Port A module parameters
  parameter integer                   C_WRITE_DATA_WIDTH_A   = 32,
  parameter integer                   C_READ_DATA_WIDTH_A    = C_WRITE_DATA_WIDTH_A,
  parameter integer                   C_BYTE_WRITE_WIDTH_A   = C_WRITE_DATA_WIDTH_A,
  parameter integer                   C_ADDR_WIDTH_A         = $clog2(C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_A),
  parameter                           C_READ_RESET_VALUE_A   = "0",
  parameter integer                   C_READ_LATENCY_A       = 2,
  parameter integer                   C_WRITE_MODE_A         = 2,
  parameter                           C_RST_MODE_A           = "SYNC",

  // Port B module parameters
  parameter integer                   C_WRITE_DATA_WIDTH_B   = C_WRITE_DATA_WIDTH_A,
  parameter integer                   C_READ_DATA_WIDTH_B    = C_WRITE_DATA_WIDTH_B,
  parameter integer                   C_BYTE_WRITE_WIDTH_B   = C_WRITE_DATA_WIDTH_B,
  parameter integer                   C_ADDR_WIDTH_B         = $clog2(C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_B),
  parameter                           C_READ_RESET_VALUE_B   = "0",
  parameter integer                   C_READ_LATENCY_B       = C_READ_LATENCY_A,
  parameter integer                   C_WRITE_MODE_B         = C_WRITE_MODE_A,
  parameter                           C_RST_MODE_B           = "SYNC"
) (


  // Common module ports
  input  wire                                                   sleep,

  // Port A module ports
  input  wire                                                   clka,
  input  wire                                                   rsta,
  input  wire                                                   ena,
  input  wire                                                   regcea,
  input  wire [(C_WRITE_DATA_WIDTH_A/C_BYTE_WRITE_WIDTH_A)-1:0] wea,
  input  wire [C_ADDR_WIDTH_A-1:0]                              addra,
  input  wire [C_WRITE_DATA_WIDTH_A-1:0]                        dina,
  input  wire                                                   injectsbiterra,
  input  wire                                                   injectdbiterra,
  output wire [C_READ_DATA_WIDTH_A-1:0]                         douta,
  output wire                                                   sbiterra,
  output wire                                                   dbiterra,

  // Port B module ports
  input  wire                                                   clkb,
  input  wire                                                   rstb,
  input  wire                                                   enb,
  input  wire                                                   regceb,
  input  wire [(C_WRITE_DATA_WIDTH_B/C_BYTE_WRITE_WIDTH_B)-1:0] web,
  input  wire [C_ADDR_WIDTH_B-1:0]                              addrb,
  input  wire [C_WRITE_DATA_WIDTH_B-1:0]                        dinb,
  input  wire                                                   injectsbiterrb,
  input  wire                                                   injectdbiterrb,
  output wire [C_READ_DATA_WIDTH_B-1:0]                         doutb,
  output wire                                                   sbiterrb,
  output wire                                                   dbiterrb
);


/*
// -----------------------------------------------------------------------------
//  -- FUNCTION : divroundup
//  -- Returns the ceiling value of the division
//  -- Data_value - the quantity to be divided, dividend
//  -- Divisor - the value to divide the data_value by
//  -----------------------------------------------------------------------------
  function divroundup ( input int data_value, input int divisor)
    reg div;
  begin
    div   = data_value/divisor;
    if ((data_value % divisor) != 0)
      div = div+1;
    end
    return div;
  endfunction 

//  -----------------------------------------------------------------------------
//  -- FUNCTION : log2int
//  -----------------------------------------------------------------------------
  function log2int ( input int data_value )
    parameter integer width  =   0;
    parameter integer cnt    =   data_value;
  begin
      while (cnt >1) 
      begin
        width = width + 1;
        cnt   = cnt/2;
      end
    return width;
  endfunction 

//  -----------------------------------------------------------------------------
//  -----------------------------------------------------------------------------
//  -- FUNCTION : log2roundup
//  -----------------------------------------------------------------------------
  function log2roundup ( input int data_value)

    reg  width = 0;
    reg  cnt   = 1;
    parameter integer lower_limit = 1;
    parameter integer upper_limit = 8;

  begin
    if (data_value <= 1) 
      width   = 0;
    else
    begin
      while (cnt < data_value)
      begin
        width = width + 1;
        cnt   = cnt *2;
      end
    end
    return width;
  endfunction 

*/

    localparam  integer  NO_MEMORY_INIT           = (C_MEMORY_INIT_FILE == "none" || C_MEMORY_INIT_FILE == "NONE" || C_MEMORY_INIT_FILE == "None");
    localparam           MEMORY_INIT_FILE_ECC     = "emb_mem_init_ecc.mem";
    localparam           P_MEMORY_INIT_FILE       = ((C_ECC_TYPE != "NONE") && (NO_MEMORY_INIT == 0)) ? MEMORY_INIT_FILE_ECC : C_MEMORY_INIT_FILE;
    localparam           P_ECC_MODE               = (C_ECC_TYPE == "NONE") ? C_ECC_MODE : 0;
    localparam           P_MEMORY_OPTIMIZATION    = (C_MEMORY_OPTIMIZATION == 0 ? "false" : "true");

    localparam C_ADDRA_WIDTH_ACTUAL = (C_ENABLE_32BIT_ADDRESS == 1) ? $clog2(C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_A) : C_ADDR_WIDTH_A;
    localparam C_ADDRB_WIDTH_ACTUAL = (C_ENABLE_32BIT_ADDRESS == 1) ? $clog2(C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_B) : C_ADDR_WIDTH_B;
  
    wire [C_ADDRA_WIDTH_ACTUAL-1:0] addra_int; 
    wire [C_ADDRB_WIDTH_ACTUAL-1:0] addrb_int; 


generate begin
  if (C_ENABLE_32BIT_ADDRESS == 1) begin : gen_addr_32
    localparam MEM_MAP_LOWER_BOUND_VAL_A = (C_ECC_TYPE == "NONE") ? $clog2(C_WRITE_DATA_WIDTH_A/8) : $clog2(C_WRITE_DATA_WIDTH_A/8)-1;
    localparam MEM_MAP_LOWER_BOUND_VAL_B = (C_ECC_TYPE == "NONE") ? $clog2(C_WRITE_DATA_WIDTH_B/8) : $clog2(C_WRITE_DATA_WIDTH_B/8)-1;

    localparam C_ADDRA_WIDTH_MSB    = C_ADDRA_WIDTH_ACTUAL+MEM_MAP_LOWER_BOUND_VAL_A;
    localparam C_ADDRB_WIDTH_MSB    = C_ADDRB_WIDTH_ACTUAL+MEM_MAP_LOWER_BOUND_VAL_B;
  
    localparam C_MEM_MAP_ADDRA_WIDTH_MSB     = C_ADDRA_WIDTH_MSB;
    localparam C_MEM_MAP_ADDRB_WIDTH_MSB     = C_ADDRB_WIDTH_MSB;
  
    localparam C_MEM_MAP_ADDRA_WIDTH_LSB = MEM_MAP_LOWER_BOUND_VAL_A;
    localparam C_MEM_MAP_ADDRB_WIDTH_LSB = MEM_MAP_LOWER_BOUND_VAL_B;
  
    assign addra_int = addra[C_MEM_MAP_ADDRA_WIDTH_MSB-1:C_MEM_MAP_ADDRA_WIDTH_LSB];
    assign addrb_int = addrb[C_MEM_MAP_ADDRB_WIDTH_MSB-1:C_MEM_MAP_ADDRB_WIDTH_LSB];
  end : gen_addr_32
  else begin : gen_no_addr_32
    assign addra_int = addra;
    assign addrb_int = addrb;
  end : gen_no_addr_32
end
endgenerate
  // -------------------------------------------------------------------------------------------------------------------
  // Generate the instantiation of the appropriate XPM module
  // -------------------------------------------------------------------------------------------------------------------

  generate begin : gen_xpm

    // Base-level module, xpm_memory_base.sv
    if (C_XPM_SELECT == 0) begin : gen_base
      xpm_memory_base # (
        .MEMORY_TYPE        (C_MEMORY_TYPE       ),
        .MEMORY_SIZE        (C_MEMORY_SIZE       ),
        .MEMORY_PRIMITIVE   (C_MEMORY_PRIMITIVE  ),
        .CLOCKING_MODE      (C_CLOCKING_MODE     ),
        .ECC_MODE           (P_ECC_MODE          ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK    ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE  ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM ),
        .WAKEUP_TIME        (C_WAKEUP_TIME       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL   ),
        .WRITE_PROTECT      (C_WRITE_PROTECT     ),
        .AUTO_SLEEP_TIME    (C_AUTO_SLEEP_TIME   ),
	     .MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION   ),
	     .USE_EMBEDDED_CONSTRAINT (C_USE_EMBEDDED_CONSTRAINT),
        .VERSION            (C_VERSION           ),
        .CASCADE_HEIGHT     (C_CASCADE_HEIGHT    ),
        .WRITE_DATA_WIDTH_A (C_WRITE_DATA_WIDTH_A),
        .READ_DATA_WIDTH_A  (C_READ_DATA_WIDTH_A ),
        .BYTE_WRITE_WIDTH_A (C_BYTE_WRITE_WIDTH_A),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL),
        .READ_RESET_VALUE_A (C_READ_RESET_VALUE_A),
        .READ_LATENCY_A     (C_READ_LATENCY_A    ),
        .WRITE_MODE_A       (C_WRITE_MODE_A      ),
        .RST_MODE_A         (C_RST_MODE_A        ),
        .WRITE_DATA_WIDTH_B (C_WRITE_DATA_WIDTH_B),
        .READ_DATA_WIDTH_B  (C_READ_DATA_WIDTH_B ),
        .BYTE_WRITE_WIDTH_B (C_BYTE_WRITE_WIDTH_B),
        .ADDR_WIDTH_B       (C_ADDRB_WIDTH_ACTUAL),
        .READ_RESET_VALUE_B (C_READ_RESET_VALUE_B),
        .READ_LATENCY_B     (C_READ_LATENCY_B    ),
        .WRITE_MODE_B       (C_WRITE_MODE_B      ),
        .RST_MODE_B         (C_RST_MODE_B        )
      ) xpm_memory_base_inst (
        .sleep          (sleep         ),
        .clka           (clka          ),
        .rsta           (rsta          ),
        .ena            (ena           ),
        .regcea         (regcea        ),
        .wea            (wea           ),
        .addra          (addra_int),
        .dina           (dina          ),
        .injectsbiterra (injectsbiterra),
        .injectdbiterra (injectdbiterra),
        .douta          (douta         ),
        .sbiterra       (sbiterra      ),
        .dbiterra       (dbiterra      ),
        .clkb           (clkb          ),
        .rstb           (rstb          ),
        .enb            (enb           ),
        .regceb         (regceb        ),
        .web            (web           ),
        .addrb          (addrb_int),
        .dinb           (dinb          ),
        .injectsbiterrb (injectsbiterrb),
        .injectdbiterrb (injectdbiterrb),
        .doutb          (doutb         ),
        .sbiterrb       (sbiterrb      ),
        .dbiterrb       (dbiterrb      )
      );
    end : gen_base

/***********************************************************************************/
// Model Parameter conversions from Integers to Strings
// for making compatible with the templates
/***********************************************************************************/
  
  // Define local parameters for mapping with base file
  localparam P_MEMORY_PRIMITIVE_TOP      = ( (C_MEMORY_PRIMITIVE == 1)    ? "lutram"   :
                                           ( (C_MEMORY_PRIMITIVE == 2)    ? "blockram" :
                                           ( (C_MEMORY_PRIMITIVE == 3)    ? "ultraram" : 
                                           ( (C_MEMORY_PRIMITIVE == 4)    ? "mixed" : "auto"))));
  
  localparam P_CLOCKING_MODE_TOP         = (C_CLOCKING_MODE == 0 ? "common_clock" : "independent_clock");



  localparam P_ECC_MODE_TOP              = ( (P_ECC_MODE  == 1 )  ? "encode_only" :
                                           ( (P_ECC_MODE  == 2 )  ? "decode_only" :
                                           ( (P_ECC_MODE  == 3 )  ? "both_encode_and_decode" : "no_ecc")));

  localparam P_WAKEUP_TIME_TOP           = ( (C_WAKEUP_TIME == 2 )  ? "use_sleep_pin" : "disable_sleep");

  localparam P_WRITE_MODE_A_TOP          = ( (C_WRITE_MODE_A == 0 ) ? "write_first" :
                                           ( (C_WRITE_MODE_A == 1 ) ? "read_first" :
                                           ( (C_WRITE_MODE_A == 2 ) ? "no_change" : "no_change")));

  localparam P_WRITE_MODE_B_TOP          = ( (C_WRITE_MODE_B == 0 ) ? "write_first" :
                                           ( (C_WRITE_MODE_B == 1 ) ? "read_first" :
                                           ( (C_WRITE_MODE_B == 2 ) ? "no_change" : "no_change")));


    // Single port RAM, xpm_memory_spram.sv
    if (C_XPM_SELECT == 1) begin : gen_spram
      xpm_memory_spram # (
	.MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION   ),
        .MEMORY_SIZE        (C_MEMORY_SIZE           ),
        .MEMORY_PRIMITIVE   (P_MEMORY_PRIMITIVE_TOP  ),
        .ECC_MODE           (P_ECC_MODE_TOP          ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK        ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE      ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM     ),
        .WAKEUP_TIME        (P_WAKEUP_TIME_TOP       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL       ),
        .WRITE_PROTECT      (C_WRITE_PROTECT         ),
        .AUTO_SLEEP_TIME    (C_AUTO_SLEEP_TIME       ),
        .CASCADE_HEIGHT     (C_CASCADE_HEIGHT        ),
        .WRITE_DATA_WIDTH_A (C_WRITE_DATA_WIDTH_A    ),
        .READ_DATA_WIDTH_A  (C_READ_DATA_WIDTH_A     ),
        .BYTE_WRITE_WIDTH_A (C_BYTE_WRITE_WIDTH_A    ),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_A (C_READ_RESET_VALUE_A    ),
        .READ_LATENCY_A     (C_READ_LATENCY_A        ),
        .WRITE_MODE_A       (P_WRITE_MODE_A_TOP      ),
        .RST_MODE_A         (C_RST_MODE_A            )
      ) xpm_memory_spram_inst (
        .sleep          (sleep         ),
        .clka           (clka          ),
        .rsta           (rsta          ),
        .ena            (ena           ),
        .regcea         (regcea        ),
        .wea            (wea           ),
        .addra          (addra_int),
        .dina           (dina          ),
        .injectsbiterra (injectsbiterra),
        .injectdbiterra (injectdbiterra),
        .douta          (douta         ),
        .sbiterra       (sbiterra      ),
        .dbiterra       (dbiterra      )
      );
    end : gen_spram

    // Simple dual port RAM, xpm_memory_sdpram.sv
    else if (C_XPM_SELECT == 2) begin : gen_sdpram
      xpm_memory_sdpram # (
	.MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION   ),
	.USE_EMBEDDED_CONSTRAINT (C_USE_EMBEDDED_CONSTRAINT),
        .MEMORY_SIZE        (C_MEMORY_SIZE           ),
        .MEMORY_PRIMITIVE   (P_MEMORY_PRIMITIVE_TOP  ),
        .CLOCKING_MODE      (P_CLOCKING_MODE_TOP     ),
        .ECC_MODE           (P_ECC_MODE_TOP          ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK        ),
        .WRITE_PROTECT      (C_WRITE_PROTECT         ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE      ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM     ),
        .WAKEUP_TIME        (P_WAKEUP_TIME_TOP       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL       ),
        .AUTO_SLEEP_TIME    (C_AUTO_SLEEP_TIME       ),
        .CASCADE_HEIGHT     (C_CASCADE_HEIGHT        ),
        .WRITE_DATA_WIDTH_A (C_WRITE_DATA_WIDTH_A    ),
        .BYTE_WRITE_WIDTH_A (C_BYTE_WRITE_WIDTH_A    ),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL    ),
        .RST_MODE_A         (C_RST_MODE_A            ),
        .READ_DATA_WIDTH_B  (C_READ_DATA_WIDTH_B     ),
        .ADDR_WIDTH_B       (C_ADDRB_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_B (C_READ_RESET_VALUE_B    ),
        .READ_LATENCY_B     (C_READ_LATENCY_B        ),
        .WRITE_MODE_B       (P_WRITE_MODE_B_TOP      ),
        .RST_MODE_B         (C_RST_MODE_B            )
      ) xpm_memory_sdpram_inst (
        .sleep          (sleep         ),
        .clka           (clka          ),
        .ena            (ena           ),
        .wea            (wea           ),
        .addra          (addra_int),
        .dina           (dina          ),
        .injectsbiterra (injectsbiterra),
        .injectdbiterra (injectdbiterra),
        .clkb           (clkb          ),
        .rstb           (rstb          ),
        .enb            (enb           ),
        .regceb         (regceb        ),
        .addrb          (addrb_int),
        .doutb          (doutb         ),
        .sbiterrb       (sbiterrb      ),
        .dbiterrb       (dbiterrb      )
      );
    end : gen_sdpram

    // True dual port RAM, xpm_memory_tdpram.sv
    else if (C_XPM_SELECT == 3) begin : gen_tdpram
      xpm_memory_tdpram # (
	.MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION   ),
	.USE_EMBEDDED_CONSTRAINT (C_USE_EMBEDDED_CONSTRAINT),
        .MEMORY_SIZE        (C_MEMORY_SIZE           ),
        .MEMORY_PRIMITIVE   (P_MEMORY_PRIMITIVE_TOP  ),
        .CLOCKING_MODE      (P_CLOCKING_MODE_TOP     ),
        .ECC_MODE           (P_ECC_MODE_TOP          ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK        ),
        .WRITE_PROTECT      (C_WRITE_PROTECT         ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE      ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM     ),
        .WAKEUP_TIME        (P_WAKEUP_TIME_TOP       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL       ),
        .AUTO_SLEEP_TIME    (C_AUTO_SLEEP_TIME       ),
        .CASCADE_HEIGHT     (C_CASCADE_HEIGHT        ),
        .WRITE_DATA_WIDTH_A (C_WRITE_DATA_WIDTH_A    ),
        .READ_DATA_WIDTH_A  (C_READ_DATA_WIDTH_A     ),
        .BYTE_WRITE_WIDTH_A (C_BYTE_WRITE_WIDTH_A    ),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_A (C_READ_RESET_VALUE_A    ),
        .READ_LATENCY_A     (C_READ_LATENCY_A        ),
        .WRITE_MODE_A       (P_WRITE_MODE_A_TOP      ),
        .RST_MODE_A         (C_RST_MODE_A            ),
        .WRITE_DATA_WIDTH_B (C_WRITE_DATA_WIDTH_B    ),
        .READ_DATA_WIDTH_B  (C_READ_DATA_WIDTH_B     ),
        .BYTE_WRITE_WIDTH_B (C_BYTE_WRITE_WIDTH_B    ),
        .ADDR_WIDTH_B       (C_ADDRB_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_B (C_READ_RESET_VALUE_B    ),
        .READ_LATENCY_B     (C_READ_LATENCY_B        ),
        .WRITE_MODE_B       (P_WRITE_MODE_B_TOP      ),
        .RST_MODE_B         (C_RST_MODE_B            )
      ) xpm_memory_tdpram_inst (
        .sleep          (sleep         ),
        .clka           (clka          ),
        .rsta           (rsta          ),
        .ena            (ena           ),
        .regcea         (regcea        ),
        .wea            (wea           ),
        .addra          (addra_int),
        .dina           (dina          ),
        .injectsbiterra (injectsbiterra),
        .injectdbiterra (injectdbiterra),
        .douta          (douta         ),
        .sbiterra       (sbiterra      ),
        .dbiterra       (dbiterra      ),
        .clkb           (clkb          ),
        .rstb           (rstb          ),
        .enb            (enb           ),
        .regceb         (regceb        ),
        .web            (web           ),
        .addrb          (addrb_int),
        .dinb           (dinb          ),
        .injectsbiterrb (injectsbiterrb),
        .injectdbiterrb (injectdbiterrb),
        .doutb          (doutb         ),
        .sbiterrb       (sbiterrb      ),
        .dbiterrb       (dbiterrb      )
      );
    end : gen_tdpram

    // Single port ROM, xpm_memory_sprom.sv
    else if (C_XPM_SELECT == 4) begin : gen_sprom
      xpm_memory_sprom # (
	.MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION   ),
        .MEMORY_SIZE        (C_MEMORY_SIZE           ),
        .MEMORY_PRIMITIVE   (P_MEMORY_PRIMITIVE_TOP  ),
        .ECC_MODE           (P_ECC_MODE_TOP          ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK        ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE      ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM     ),
        .WAKEUP_TIME        (P_WAKEUP_TIME_TOP       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL       ),
        .AUTO_SLEEP_TIME    (C_AUTO_SLEEP_TIME       ),
        .CASCADE_HEIGHT     (C_CASCADE_HEIGHT        ),
        .READ_DATA_WIDTH_A  (C_READ_DATA_WIDTH_A     ),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_A (C_READ_RESET_VALUE_A    ),
        .READ_LATENCY_A     (C_READ_LATENCY_A        ),
        .RST_MODE_A         (C_RST_MODE_A            )
      ) xpm_memory_sprom_inst (
        .sleep          (sleep         ),
        .clka           (clka          ),
        .rsta           (rsta          ),
        .ena            (ena           ),
        .regcea         (regcea        ),
        .addra          (addra_int),
        .injectsbiterra (injectsbiterra),
        .injectdbiterra (injectdbiterra),
        .douta          (douta         ),
        .sbiterra       (sbiterra      ),
        .dbiterra       (dbiterra      )
      );
    end : gen_sprom

    // Dual port ROM, xpm_memory_dprom.sv
    else if (C_XPM_SELECT == 5) begin : gen_dprom
      xpm_memory_dprom # (
	.MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION   ),
        .MEMORY_SIZE        (C_MEMORY_SIZE           ),
        .MEMORY_PRIMITIVE   (P_MEMORY_PRIMITIVE_TOP  ),
        .CLOCKING_MODE      (P_CLOCKING_MODE_TOP     ),
        .ECC_MODE           (P_ECC_MODE_TOP          ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK        ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE      ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM     ),
        .WAKEUP_TIME        (P_WAKEUP_TIME_TOP       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL       ),
        .AUTO_SLEEP_TIME    (C_AUTO_SLEEP_TIME       ),
        .CASCADE_HEIGHT     (C_CASCADE_HEIGHT        ),
        .READ_DATA_WIDTH_A  (C_READ_DATA_WIDTH_A     ),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_A (C_READ_RESET_VALUE_A    ),
        .READ_LATENCY_A     (C_READ_LATENCY_A        ),
        .RST_MODE_A         (C_RST_MODE_A            ),
        .READ_DATA_WIDTH_B  (C_READ_DATA_WIDTH_B     ),
        .ADDR_WIDTH_B       (C_ADDRB_WIDTH_ACTUAL    ),
        .READ_RESET_VALUE_B (C_READ_RESET_VALUE_B    ),
        .READ_LATENCY_B     (C_READ_LATENCY_B        ),
        .RST_MODE_B         (C_RST_MODE_B            )
      ) xpm_memory_dprom_inst (
        .sleep          (sleep         ),
        .clka           (clka          ),
        .rsta           (rsta          ),
        .ena            (ena           ),
        .regcea         (regcea        ),
        .addra          (addra_int),
        .injectsbiterra (injectsbiterra),
        .injectdbiterra (injectdbiterra),
        .douta          (douta         ),
        .sbiterra       (sbiterra      ),
        .dbiterra       (dbiterra      ),
        .clkb           (clkb          ),
        .rstb           (rstb          ),
        .enb            (enb           ),
        .regceb         (regceb        ),
        .addrb          (addrb_int),
        .injectsbiterrb (injectsbiterrb),
        .injectdbiterrb (injectdbiterrb),
        .doutb          (doutb         ),
        .sbiterrb       (sbiterrb      ),
        .dbiterrb       (dbiterrb      )
      );
    end : gen_dprom

    // Dual port distributed RAM, xpm_memory_dpdistram.sv
    else if (C_XPM_SELECT == 6) begin : gen_dpdistram
      xpm_memory_dpdistram # (
	.MEMORY_OPTIMIZATION     (P_MEMORY_OPTIMIZATION     ),
	.USE_EMBEDDED_CONSTRAINT (C_USE_EMBEDDED_CONSTRAINT ),
        .MEMORY_SIZE        (C_MEMORY_SIZE             ),
        .SIM_ASSERT_CHK     (C_SIM_ASSERT_CHK          ),
        .MEMORY_INIT_FILE   (P_MEMORY_INIT_FILE        ),
        .MEMORY_INIT_PARAM  (C_MEMORY_INIT_PARAM       ),
        .MESSAGE_CONTROL    (C_MESSAGE_CONTROL         ),
        .WRITE_DATA_WIDTH_A (C_WRITE_DATA_WIDTH_A      ),
        .READ_DATA_WIDTH_A  (C_READ_DATA_WIDTH_A       ),
        .BYTE_WRITE_WIDTH_A (C_BYTE_WRITE_WIDTH_A      ),
        .ADDR_WIDTH_A       (C_ADDRA_WIDTH_ACTUAL      ),
        .READ_RESET_VALUE_A (C_READ_RESET_VALUE_A      ),
        .READ_LATENCY_A     (C_READ_LATENCY_A          ),
        .RST_MODE_A         (C_RST_MODE_A              ),
        .READ_DATA_WIDTH_B  (C_READ_DATA_WIDTH_B       ),
        .ADDR_WIDTH_B       (C_ADDRB_WIDTH_ACTUAL      ),
        .READ_RESET_VALUE_B (C_READ_RESET_VALUE_B      ),
        .READ_LATENCY_B     (C_READ_LATENCY_B          ),
        .RST_MODE_B         (C_RST_MODE_B              )
      ) xpm_memory_dpdistram_inst (
        .clka           (clka          ),
        .rsta           (rsta          ),
        .ena            (ena           ),
        .regcea         (regcea        ),
        .wea            (wea           ),
        .addra          (addra_int),
        .dina           (dina          ),
        .douta          (douta         ),
        .rstb           (rstb          ),
        .enb            (enb           ),
        .regceb         (regceb        ),
        .addrb          (addrb_int),
        .doutb          (doutb         )
      );
    end : gen_dpdistram

  end : gen_xpm
  endgenerate

   // synthesis translate_off
 
  generate begin : gen_ecc_init
    if ((C_ECC_TYPE == "ECCH64-8") && (NO_MEMORY_INIT == 0)) begin : HAMMING_64
      function [7:0] fn_ecc_enc_dec (
         input [63:0] d_i
         );
         reg ecc_7;
      begin
         fn_ecc_enc_dec[0] = d_i[0]   ^  d_i[1]   ^  d_i[3]   ^  d_i[4]   ^  d_i[6]   ^
                     d_i[8]   ^  d_i[10]  ^  d_i[11]  ^  d_i[13]  ^  d_i[15]  ^
                     d_i[17]  ^  d_i[19]  ^  d_i[21]  ^  d_i[23]  ^  d_i[25]  ^
                     d_i[26]  ^  d_i[28]  ^  d_i[30]  ^  d_i[32]  ^  d_i[34]  ^
                     d_i[36]  ^  d_i[38]  ^  d_i[40]  ^  d_i[42]  ^  d_i[44]  ^
                     d_i[46]  ^  d_i[48]  ^  d_i[50]  ^  d_i[52]  ^  d_i[54]  ^
                     d_i[56]  ^  d_i[57]  ^  d_i[59]  ^  d_i[61]  ^  d_i[63];
      
         fn_ecc_enc_dec[1] = d_i[0]   ^  d_i[2]   ^  d_i[3]   ^  d_i[5]   ^  d_i[6]   ^
                     d_i[9]   ^  d_i[10]  ^  d_i[12]  ^  d_i[13]  ^  d_i[16]  ^
                     d_i[17]  ^  d_i[20]  ^  d_i[21]  ^  d_i[24]  ^  d_i[25]  ^
                     d_i[27]  ^  d_i[28]  ^  d_i[31]  ^  d_i[32]  ^  d_i[35]  ^
                     d_i[36]  ^  d_i[39]  ^  d_i[40]  ^  d_i[43]  ^  d_i[44]  ^
                     d_i[47]  ^  d_i[48]  ^  d_i[51]  ^  d_i[52]  ^  d_i[55]  ^
                     d_i[56]  ^  d_i[58]  ^  d_i[59]  ^  d_i[62]  ^  d_i[63];
      
         fn_ecc_enc_dec[2] = d_i[1]   ^  d_i[2]   ^  d_i[3]   ^  d_i[7]   ^  d_i[8]   ^
                     d_i[9]   ^  d_i[10]  ^  d_i[14]  ^  d_i[15]  ^  d_i[16]  ^
                     d_i[17]  ^  d_i[22]  ^  d_i[23]  ^  d_i[24]  ^  d_i[25]  ^
                     d_i[29]  ^  d_i[30]  ^  d_i[31]  ^  d_i[32]  ^  d_i[37]  ^
                     d_i[38]  ^  d_i[39]  ^  d_i[40]  ^  d_i[45]  ^  d_i[46]  ^
                     d_i[47]  ^  d_i[48]  ^  d_i[53]  ^  d_i[54]  ^  d_i[55]  ^
                     d_i[56]  ^  d_i[60]  ^  d_i[61]  ^  d_i[62]  ^  d_i[63];
      
         fn_ecc_enc_dec[3] = d_i[4]   ^  d_i[5]   ^  d_i[6]   ^  d_i[7]   ^  d_i[8]   ^
                     d_i[9]   ^  d_i[10]  ^  d_i[18]  ^  d_i[19]  ^  d_i[20]  ^
                     d_i[21]  ^  d_i[22]  ^  d_i[23]  ^  d_i[24]  ^  d_i[25]  ^
                     d_i[33]  ^  d_i[34]  ^  d_i[35]  ^  d_i[36]  ^  d_i[37]  ^
                     d_i[38]  ^  d_i[39]  ^  d_i[40]  ^  d_i[49]  ^  d_i[50]  ^
                     d_i[51]  ^  d_i[52]  ^  d_i[53]  ^  d_i[54]  ^  d_i[55]  ^
                     d_i[56];
      
         fn_ecc_enc_dec[4] = d_i[11]  ^  d_i[12]  ^  d_i[13]  ^  d_i[14]  ^  d_i[15]  ^
                     d_i[16]  ^  d_i[17]  ^  d_i[18]  ^  d_i[19]  ^  d_i[20]  ^
                     d_i[21]  ^  d_i[22]  ^  d_i[23]  ^  d_i[24]  ^  d_i[25]  ^
                     d_i[41]  ^  d_i[42]  ^  d_i[43]  ^  d_i[44]  ^  d_i[45]  ^
                     d_i[46]  ^  d_i[47]  ^  d_i[48]  ^  d_i[49]  ^  d_i[50]  ^
                     d_i[51]  ^  d_i[52]  ^  d_i[53]  ^  d_i[54]  ^  d_i[55]  ^
                     d_i[56];
      
         fn_ecc_enc_dec[5] = d_i[26]  ^  d_i[27]  ^  d_i[28]  ^  d_i[29]  ^  d_i[30]  ^
                     d_i[31]  ^  d_i[32]  ^  d_i[33]  ^  d_i[34]  ^  d_i[35]  ^
                     d_i[36]  ^  d_i[37]  ^  d_i[38]  ^  d_i[39]  ^  d_i[40]  ^
                     d_i[41]  ^  d_i[42]  ^  d_i[43]  ^  d_i[44]  ^  d_i[45]  ^
                     d_i[46]  ^  d_i[47]  ^  d_i[48]  ^  d_i[49]  ^  d_i[50]  ^
                     d_i[51]  ^  d_i[52]  ^  d_i[53]  ^  d_i[54]  ^  d_i[55]  ^
                     d_i[56];
      
         fn_ecc_enc_dec[6] = d_i[57]  ^  d_i[58]  ^  d_i[59]  ^  d_i[60]  ^  d_i[61]  ^
                     d_i[62]  ^  d_i[63];
      
         ecc_7 = d_i[0]   ^  d_i[1]   ^  d_i[2]   ^  d_i[3]   ^ d_i[4]   ^
                 d_i[5]   ^  d_i[6]   ^  d_i[7]   ^  d_i[8]   ^ d_i[9]   ^
                 d_i[10]  ^  d_i[11]  ^  d_i[12]  ^  d_i[13]  ^ d_i[14]  ^
                 d_i[15]  ^  d_i[16]  ^  d_i[17]  ^  d_i[18]  ^ d_i[19]  ^
                 d_i[20]  ^  d_i[21]  ^  d_i[22]  ^  d_i[23]  ^ d_i[24]  ^
                 d_i[25]  ^  d_i[26]  ^  d_i[27]  ^  d_i[28]  ^ d_i[29]  ^
                 d_i[30]  ^  d_i[31]  ^  d_i[32]  ^  d_i[33]  ^ d_i[34]  ^
                 d_i[35]  ^  d_i[36]  ^  d_i[37]  ^  d_i[38]  ^ d_i[39]  ^
                 d_i[40]  ^  d_i[41]  ^  d_i[42]  ^  d_i[43]  ^ d_i[44]  ^
                 d_i[45]  ^  d_i[46]  ^  d_i[47]  ^  d_i[48]  ^ d_i[49]  ^
                 d_i[50]  ^  d_i[51]  ^  d_i[52]  ^  d_i[53]  ^ d_i[54]  ^
                 d_i[55]  ^  d_i[56]  ^  d_i[57]  ^  d_i[58]  ^ d_i[59]  ^
                 d_i[60]  ^  d_i[61]  ^  d_i[62]  ^  d_i[63];
      
        fn_ecc_enc_dec[7] = ecc_7 ^
                        fn_ecc_enc_dec[0] ^ fn_ecc_enc_dec[1] ^ fn_ecc_enc_dec[2] ^ fn_ecc_enc_dec[3] ^
                        fn_ecc_enc_dec[4] ^ fn_ecc_enc_dec[5] ^ fn_ecc_enc_dec[6];
      end
      endfunction // fn_ecc_enc_dec

      function  [C_WRITE_DATA_WIDTH_A-1:0] ecc_init_mem_loc;
        input [63 : 0] data_in;
        integer data_slice;
        for (data_slice=1; data_slice <= C_WRITE_DATA_WIDTH_A/64; data_slice=data_slice+1) begin 
            ecc_init_mem_loc[(72*data_slice)-9 -: 64] = data_in[(64*data_slice)-1 -: 64];
            ecc_init_mem_loc[(72*data_slice)-1 -: 8] = fn_ecc_enc_dec(data_in[(64*data_slice)-1 -: 64]);
        end
      endfunction


        localparam integer MEM_DEPTH = C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_A;
  
        reg [C_WRITE_DATA_WIDTH_A-1:0] mem_temp [MEM_DEPTH-1:0];

        initial begin
            $readmemh(C_MEMORY_INIT_FILE, mem_temp, 0, MEM_DEPTH-1);
            for(int i=0; i<MEM_DEPTH; i=i+1) begin
                mem_temp[i] = ecc_init_mem_loc(mem_temp[i]);
            end
            $writememh(MEMORY_INIT_FILE_ECC, mem_temp, 0, MEM_DEPTH-1);

        end

    end : HAMMING_64
    if ((C_ECC_TYPE == "ECCH32-7") && (NO_MEMORY_INIT == 0)) begin : HAMMING_32
      function [7:0] fn_ecc_enc_dec (
         input [31:0] d_i
         );
         reg ecc_7;
      begin
         fn_ecc_enc_dec[0] = d_i[0]   ^  d_i[1]   ^  d_i[3]   ^  d_i[4]   ^  d_i[6]   ^
                     d_i[8]   ^  d_i[10]  ^  d_i[11]  ^  d_i[13]  ^  d_i[15]  ^
                     d_i[17]  ^  d_i[19]  ^  d_i[21]  ^  d_i[23]  ^  d_i[25]  ^
                     d_i[26]  ^  d_i[28]  ^  d_i[30] ; 
      
         fn_ecc_enc_dec[1] = d_i[0]   ^  d_i[2]   ^  d_i[3]   ^  d_i[5]   ^  d_i[6]   ^
                     d_i[9]   ^  d_i[10]  ^  d_i[12]  ^  d_i[13]  ^  d_i[16]  ^
                     d_i[17]  ^  d_i[20]  ^  d_i[21]  ^  d_i[24]  ^  d_i[25]  ^
                     d_i[27]  ^  d_i[28]  ^  d_i[31] ; 
      
         fn_ecc_enc_dec[2] = d_i[1]   ^  d_i[2]   ^  d_i[3]   ^  d_i[7]   ^  d_i[8]   ^
                     d_i[9]   ^  d_i[10]  ^  d_i[14]  ^  d_i[15]  ^  d_i[16]  ^
                     d_i[17]  ^  d_i[22]  ^  d_i[23]  ^  d_i[24]  ^  d_i[25]  ^
                     d_i[29]  ^  d_i[30]  ^  d_i[31]  ;
      
         fn_ecc_enc_dec[3] = d_i[4]   ^  d_i[5]   ^  d_i[6]   ^  d_i[7]   ^  d_i[8]   ^
                     d_i[9]   ^  d_i[10]  ^  d_i[18]  ^  d_i[19]  ^  d_i[20]  ^
                     d_i[21]  ^  d_i[22]  ^  d_i[23]  ^  d_i[24]  ^  d_i[25]  ;
      
         fn_ecc_enc_dec[4] = d_i[11]  ^  d_i[12]  ^  d_i[13]  ^  d_i[14]  ^  d_i[15]  ^
                     d_i[16]  ^  d_i[17]  ^  d_i[18]  ^  d_i[19]  ^  d_i[20]  ^
                     d_i[21]  ^  d_i[22]  ^  d_i[23]  ^  d_i[24]  ^  d_i[25]  ;
      
         fn_ecc_enc_dec[5] = d_i[26]  ^  d_i[27]  ^  d_i[28]  ^  d_i[29]  ^  d_i[30]  ^
                     d_i[31]  ;
      
         fn_ecc_enc_dec[6] = d_i[0]  ^  d_i[1]  ^  d_i[2]  ^  d_i[4]  ^  d_i[5]  ^
                     d_i[7]  ^  d_i[10]  ^  d_i[11]  ^  d_i[12]  ^  d_i[14]  ^
                     d_i[17]  ^  d_i[18]  ^  d_i[21]  ^  d_i[23]  ^  d_i[24]  ^
                     d_i[26]  ^  d_i[27]  ^  d_i[29]  ;
      
         fn_ecc_enc_dec[7] = 1'b0;
      
      end
      endfunction // fn_ecc_enc_dec

      function  [C_WRITE_DATA_WIDTH_A-1:0] ecc_init_mem_loc;
        input [31 : 0] data_in;
        integer data_slice;
        for (data_slice=1; data_slice <= C_WRITE_DATA_WIDTH_A/32; data_slice=data_slice+1) begin 
            ecc_init_mem_loc[(40*data_slice)-9 -: 32] = data_in[(32*data_slice)-1 -: 32];
            ecc_init_mem_loc[(40*data_slice)-1 -: 8] = fn_ecc_enc_dec(data_in[(32*data_slice)-1 -: 32]);
        end
      endfunction


        localparam integer MEM_DEPTH = C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_A;
  
        reg [C_WRITE_DATA_WIDTH_A-1:0] mem_temp [MEM_DEPTH-1:0];

        initial begin
            $readmemh(C_MEMORY_INIT_FILE, mem_temp, 0, MEM_DEPTH-1);
            for(int i=0; i<MEM_DEPTH; i=i+1) begin
                mem_temp[i] = ecc_init_mem_loc(mem_temp[i]);
            end
            $writememh(MEMORY_INIT_FILE_ECC, mem_temp, 0, MEM_DEPTH-1);

        end

    end : HAMMING_32
     
    if ((C_ECC_TYPE == "ECCHSIAO32-7" || C_ECC_TYPE == "ECCHSIAO64-8" || C_ECC_TYPE == "ECCHSIAO128-9") && (NO_MEMORY_INIT == 0)) begin : ECC_HSIAO
        localparam  integer       ECC_WIDTH  = (C_WRITE_DATA_WIDTH_A == 40) ? 7 : ((C_WRITE_DATA_WIDTH_A == 72) ? 8 : 9);
        localparam  integer       DATA_WIDTH = (C_WRITE_DATA_WIDTH_A == 40) ? 32 : ((C_WRITE_DATA_WIDTH_A == 72) ? 64 : 128);
        localparam  integer       CODE_WIDTH = DATA_WIDTH+ECC_WIDTH;
        localparam integer MEM_DEPTH = C_MEMORY_SIZE/C_WRITE_DATA_WIDTH_A;
        reg [C_WRITE_DATA_WIDTH_A-1:0] mem_temp [MEM_DEPTH-1:0];
        
        
         function integer factorial;
           input integer val;
           if (val == 1)
               factorial = 1;
           else begin
               factorial = 1;
               for(integer i=2; i<=val;i=i+1) begin
                   factorial = factorial * i;
               end
           end
         endfunction
        
         function integer combos;
             input integer n, k;
             combos = factorial(n)/(factorial(k)*factorial(n-k));
         endfunction
        
         function logic [ECC_WIDTH-1 : 0] next_combo;
             input [ECC_WIDTH-1:0]  comb;
             reg                    seen0;
             reg                    trig1;
             reg   [ECC_WIDTH-1:0]  ones;
             reg   [ECC_WIDTH-1:0]  tmp;
             integer                tmp_index;
              seen0 = 1'b0;
              trig1 = 1'b0;
              ones = 'h0;
              for (integer i=ECC_WIDTH-1; i>=0;i=i-1) begin
                  tmp_index = ECC_WIDTH-1-i;
                  if (trig1 == 1'b1) 
                    next_combo[tmp_index] = comb[tmp_index];
                  else begin
                    next_combo[tmp_index] = 1'b0;
                    ones = ones + comb[tmp_index];
                    if (comb[tmp_index] && seen0) begin
                      trig1 = 1'b1;
                      for (integer j=tmp_index-1; j>=0;j=j-1) begin
                        if (j >= (tmp_index-ones))
                            next_combo[j] = 1'b1;  
                      end
                    end              
                    seen0 = ~comb[tmp_index];
                  end
              end
         endfunction
        
        //localparam  integer    COMBOS_3  = combos(ECC_WIDTH,3);
        //localparam  integer    COMBOS_5  = combos(ECC_WIDTH,5);
        reg [7:0]    COMBOS_3 ;
        reg [7:0]    COMBOS_5 ;
        assign   COMBOS_3  = combos(ECC_WIDTH,3);
        assign   COMBOS_5  = combos(ECC_WIDTH,5);
        

  function [CODE_WIDTH*ECC_WIDTH-1 : 0] h_rows;
   reg [ECC_WIDTH-1:0] ht_matrix [CODE_WIDTH-1:0];

   for(integer n=CODE_WIDTH-1; n>=0; n=n-1) begin:columns
   
       if (n == 0) begin:column0
          ht_matrix[n] = {3'b111, {(ECC_WIDTH-3){1'b0}}};
       end:column0
       
       if ((n == COMBOS_3) && (n < DATA_WIDTH)) begin:column_combos3
          ht_matrix[n] = {5'b11111, {(ECC_WIDTH-5){1'b0}}};
       end :column_combos3
       
       if ((n == (COMBOS_3 + COMBOS_5)) && (n<DATA_WIDTH)) begin: column_combos5
          ht_matrix[n] = {7'b1111111, {(ECC_WIDTH-7){1'b0}}};
       end: column_combos5
       
       if (n == DATA_WIDTH) begin:column_datawidth
          ht_matrix[n] = {1'b1, {(ECC_WIDTH-1){1'b0}}};
       end: column_datawidth
       
       if ((n != 0) && ((n != COMBOS_3) || (n>DATA_WIDTH)) && ((n != (COMBOS_3+COMBOS_5)) || (n>DATA_WIDTH)) && (n != DATA_WIDTH)) begin:column_gen
         ht_matrix[n] = next_combo(ht_matrix[n-1]);
       end:column_gen
       
       for(integer s=CODE_WIDTH-1; s>=0; s=s-1) begin:out_assign
         h_rows[s*CODE_WIDTH+n] = ht_matrix[n][s];
       end:out_assign
   end:columns
   endfunction

  function [ECC_WIDTH-1:0] ecc_data_hsiao;
   input   [DATA_WIDTH-1:0]            data_in_t;
   reg [CODE_WIDTH-1 : DATA_WIDTH] ecc_wrdata;
   reg [CODE_WIDTH*ECC_WIDTH-1 : 0] h_rows_temp;
    for(integer k=0; k<=ECC_WIDTH-1;k=k+1) begin
        h_rows_temp = h_rows();        
        ecc_wrdata[CODE_WIDTH-k-1] = ^(data_in_t[DATA_WIDTH-1:0] && h_rows_temp[(k*CODE_WIDTH+DATA_WIDTH-1)-:DATA_WIDTH]);
    end
    ecc_data_hsiao[ECC_WIDTH-1:0] = ecc_wrdata[CODE_WIDTH-1:DATA_WIDTH];
  endfunction


     initial begin
         $readmemh(C_MEMORY_INIT_FILE, mem_temp, 0, MEM_DEPTH-1);
         for(int i=0; i<MEM_DEPTH; i=i+1) begin
             mem_temp[i] = {ecc_data_hsiao(mem_temp[i][DATA_WIDTH-1:0]), mem_temp[i][DATA_WIDTH-1:0]};
         end
         $writememh(MEMORY_INIT_FILE_ECC, mem_temp, 0, MEM_DEPTH-1);

     end

    end : ECC_HSIAO

  end : gen_ecc_init
  endgenerate

// synthesis translate_on



endmodule : emb_mem_gen_v1_0_4
`default_nettype wire


