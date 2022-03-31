
`timescale 1ns / 1ps

module axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
    parameter MODE="Async_rst_sync", //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
    parameter DEST_SYNC_FF = 2, //Range 2- 10
    parameter INIT_SYNC_FF = 0, //0 - disable sim init value, 1 enable
    parameter RST_ACTIVE_HIGH = 0, //0 - Active low reset, 1 - Acitve high reset
    parameter DEST_EXT_HSK = 0, // 0 - Internal Handshake, 1 - External handshake
    parameter SRC_SYNC_FF = 2, // Range 2-10
    parameter WIDTH = 1, //Data bus width
    parameter REG_OUTPUT = 1, //0- disable registered output, 1- enable
    parameter RST_USED = 0, //0- No reset, 1- Implement reset
    parameter SRC_INPUT_REG = 0 //0 - Do not register input, 1- register input
    )
  (
    input                 src_clk_in,
    input  [WIDTH-1:0]    src_in_bus,
    input                 src_in,
    input                 dest_clk_in,
    input                 dest_ack,
    input                 src_send,
    input                 dest_rst_in,
    input                 src_rst_in,
    output                dest_arst,
    output [WIDTH-1:0]    dest_out_bus,
    output                dest_out,
    output                src_rcv,
    output                dest_req
  );

generate
  case (MODE)
    "Async_rst_sync": begin   
      xpm_cdc_async_rst #(
        .DEST_SYNC_FF(DEST_SYNC_FF),    // DECIMAL; range: 2-10
        .INIT_SYNC_FF(INIT_SYNC_FF),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
        .RST_ACTIVE_HIGH(RST_ACTIVE_HIGH)  // DECIMAL; 0=active low reset, 1=active high reset
      )
      xpm_cdc_async_rst_inst (
        .dest_arst(dest_arst), // 1-bit output: src_rst_in asynchronous reset signal synchronized to destination
                             // clock domain. This output is registered. NOTE: Signal asserts asynchronously
                             // but deasserts synchronously to dest_clk. Width of the reset signal is at least
                             // (DEST_SYNC_FF*dest_clk) period.

        .dest_clk(dest_clk_in),   // 1-bit input: Destination clock.
        .src_arst(src_rst_in)    // 1-bit input: Source asynchronous reset signal.
      );    
   end
  
   "Bus_sync_with_handshake": begin  
      xpm_cdc_handshake #(
          .DEST_EXT_HSK(DEST_EXT_HSK),   // DECIMAL; 0=internal handshake, 1=external handshake
          .DEST_SYNC_FF(DEST_SYNC_FF),   // DECIMAL; range: 2-10
          .INIT_SYNC_FF(INIT_SYNC_FF),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
          .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
          .SRC_SYNC_FF(SRC_SYNC_FF),    // DECIMAL; range: 2-10
          .WIDTH(WIDTH)           // DECIMAL; range: 1-1024
       )
       xpm_cdc_handshake_inst (
          .dest_out(dest_out_bus), // WIDTH-bit output: Input bus (src_in) synchronized to destination clock domain.
                               // This output is registered.
    
          .dest_req(dest_req), // 1-bit output: Assertion of this signal indicates that new dest_out data has been
                               // received and is ready to be used or captured by the destination logic. When
                               // DEST_EXT_HSK = 1, this signal will deassert once the source handshake
                               // acknowledges that the destination clock domain has received the transferred data.
                               // When DEST_EXT_HSK = 0, this signal asserts for one clock period when dest_out bus
                               // is valid. This output is registered.
    
          .src_rcv(src_rcv),   // 1-bit output: Acknowledgement from destination logic that src_in has been
                               // received. This signal will be deasserted once destination handshake has fully
                               // completed, thus completing a full data transfer. This output is registered.
    
          .dest_ack(dest_ack), // 1-bit input: optional; required when DEST_EXT_HSK = 1
          .dest_clk(dest_clk_in), // 1-bit input: Destination clock.
          .src_clk(src_clk_in),   // 1-bit input: Source clock.
          .src_in(src_in_bus),     // WIDTH-bit input: Input bus that will be synchronized to the destination clock
                               // domain.
    
          .src_send(src_send)  // 1-bit input: Assertion of this signal allows the src_in bus to be synchronized to
                               // the destination clock domain. This signal should only be asserted when src_rcv is
                               // deasserted, indicating that the previous data transfer is complete. This signal
                               // should only be deasserted once src_rcv is asserted, acknowledging that the src_in
                               // has been received by the destination logic.
    
       );
    end    
       
    "Pulse_txr": begin
       xpm_cdc_pulse #(
          .DEST_SYNC_FF(DEST_SYNC_FF),   // DECIMAL; range: 2-10
          .INIT_SYNC_FF(INIT_SYNC_FF),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
          .REG_OUTPUT(REG_OUTPUT),     // DECIMAL; 0=disable registered output, 1=enable registered output
          .RST_USED(RST_USED),       // DECIMAL; 0=no reset, 1=implement reset
          .SIM_ASSERT_CHK(0)  // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
       )
       xpm_cdc_pulse_inst (
          .dest_pulse(dest_out), // 1-bit output: Outputs a pulse the size of one dest_clk period when a pulse
                                   // transfer is correctly initiated on src_pulse input. This output is
                                   // combinatorial unless REG_OUTPUT is set to 1.
    
          .dest_clk(dest_clk_in),     // 1-bit input: Destination clock.
          .dest_rst(dest_rst_in),     // 1-bit input: optional; required when RST_USED = 1
          .src_clk(src_clk_in),       // 1-bit input: Source clock.
          .src_pulse(src_in),   // 1-bit input: Rising edge of this signal initiates a pulse transfer to the
                                   // destination clock domain. The minimum gap between each pulse transfer must be
                                   // at the minimum 2*(larger(src_clk period, dest_clk period)). This is measured
                                   // between the falling edge of a src_pulse to the rising edge of the next
                                   // src_pulse. This minimum gap will guarantee that each rising edge of src_pulse
                                   // will generate a pulse the size of one dest_clk period in the destination
                                   // clock domain. When RST_USED = 1, pulse transfers will not be guaranteed while
                                   // src_rst and/or dest_rst are asserted.
    
          .src_rst(src_rst_in)        // 1-bit input: optional; required when RST_USED = 1
       );
    end

    "Single_bit_arr_sync": begin
       xpm_cdc_array_single #(
          .DEST_SYNC_FF(DEST_SYNC_FF),   // DECIMAL; range: 2-10
          .INIT_SYNC_FF(INIT_SYNC_FF),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
          .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
          .SRC_INPUT_REG(SRC_INPUT_REG),  // DECIMAL; 0=do not register input, 1=register input
          .WIDTH(WIDTH)           // DECIMAL; range: 1-1024
       )
       xpm_cdc_array_single_inst (
          .dest_out(dest_out_bus), // WIDTH-bit output: src_in synchronized to the destination clock domain. This
                               // output is registered.
    
          .dest_clk(dest_clk_in), // 1-bit input: Clock signal for the destination clock domain.
          .src_clk(src_clk_in),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
          .src_in(src_in_bus)      // WIDTH-bit input: Input single-bit array to be synchronized to destination clock
                               // domain. It is assumed that each bit of the array is unrelated to the others. This
                               // is reflected in the constraints applied to this macro. To transfer a binary value
                               // losslessly across the two clock domains, use the XPM_CDC_GRAY macro instead.
    
       );
    end
       
    "Single_bit_sync": begin
       xpm_cdc_single #(
          .DEST_SYNC_FF(DEST_SYNC_FF),   // DECIMAL; range: 2-10
          .INIT_SYNC_FF(INIT_SYNC_FF),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
          .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
          .SRC_INPUT_REG(SRC_INPUT_REG)   // DECIMAL; 0=do not register input, 1=register input
       )
       xpm_cdc_single_inst (
          .dest_out(dest_out), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                               // registered.
    
          .dest_clk(dest_clk_in), // 1-bit input: Clock signal for the destination clock domain.
          .src_clk(src_clk_in),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
          .src_in(src_in)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
       );
    end     
    
    default: begin
      xpm_cdc_async_rst #(
        .DEST_SYNC_FF(DEST_SYNC_FF),    // DECIMAL; range: 2-10
        .INIT_SYNC_FF(INIT_SYNC_FF),    // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
        .RST_ACTIVE_HIGH(RST_ACTIVE_HIGH)  // DECIMAL; 0=active low reset, 1=active high reset
      )
      xpm_cdc_async_rst_inst (
        .dest_arst(dest_arst), // 1-bit output: src_rst_in asynchronous reset signal synchronized to destination
                             // clock domain. This output is registered. NOTE: Signal asserts asynchronously
                             // but deasserts synchronously to dest_clk. Width of the reset signal is at least
                             // (DEST_SYNC_FF*dest_clk) period.

        .dest_clk(dest_clk_in),   // 1-bit input: Destination clock.
        .src_arst(src_rst_in)    // 1-bit input: Source asynchronous reset signal.
      );    
      end    
              
  endcase
endgenerate  
    
endmodule


