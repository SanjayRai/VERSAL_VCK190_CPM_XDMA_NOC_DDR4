
`timescale 1 ns / 1 ps
(* DONT_TOUCH = "TRUE" *)
    module axis_ila_intf_v1_0_0_axis_ila_intf
    #(
      parameter C_SLOT_0_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_1_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_2_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_3_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_4_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_5_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_6_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_7_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_8_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_9_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_10_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_11_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_12_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_13_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_14_INTF_INFO           = "awdata_probe0",
      parameter C_SLOT_15_INTF_INFO           = "awdata_probe0",
      parameter integer C_DATA_WIDTH           = 32,
      parameter integer C_RD_WRD_CNT_WIDTH     = 10,
      parameter [0:0]   C_HAS_CIN              = 1'b0,
      parameter [15:0]  C_CORE_TYPE            = 16'h0001,
      parameter [15:0]  C_SLAVE_TYPE           = 16'h0012,
      parameter [15:0]  C_NEXT_SLAVE           = 16'h0000,
      parameter [15:0]  C_CSE_DRV_VER          = 16'h0001,
      parameter [7:0]   C_CORE_MAJOR_VER       = 8'h01,
      parameter [7:0]   C_CORE_MINOR_VER       = 8'h00,
      parameter [15:0]  C_CORE_MINOR_ALPHA_VER = 16'h0000,
      parameter [7:0]   C_MAJOR_VERSION        = 8'h13,
      parameter [7:0]   C_MINOR_VERSION        = 8'h03,
      parameter integer C_AXIS_DATA_WIDTH      = 32,
      parameter integer C_DEPTH_ADDR_WIDTH     = 10,
      parameter integer C_MU_CNT               = 1,
      parameter integer C_MU_CNT0              = 1,
      parameter integer C_MU_CNT1              = 1,
      parameter integer C_MU_CNT2              = 1,
      parameter integer C_MU_CNT3              = 1,
      parameter integer C_MU_CNT4              = 1,
      parameter integer C_MU_CNT5              = 1,
      parameter integer C_MU_CNT6              = 1,
      parameter integer C_MU_CNT7              = 1,
      parameter integer C_MU_CNT8              = 1,
      parameter integer C_MU_CNT9              = 1,
      parameter integer C_MU_CNT10             = 1,
      parameter integer C_MU_CNT11             = 1,
      parameter integer C_MU_CNT12             = 1,
      parameter integer C_MU_CNT13             = 1,
      parameter integer C_MU_CNT14             = 1,
      parameter integer C_MU_CNT15             = 1,
      parameter integer C_PROBE_CNT            = 1,
      parameter  [2:0]  C_NUM_COUNTER          = 1,
      parameter  [0:0]  C_HAS_STRG_QUAL        = 1'b0,
      parameter  [0:0]  C_HAS_ADV_TRIG         = 1'b0,
      parameter  [0:0]  C_HAS_TRIG_IN          = 1'b0,
      parameter  [0:0]  C_HAS_TRIG_OUT         = 1'b0,
      parameter  [0:0]  C_HAS_DEEP_STORAGE     = 1'b0,
      parameter  [0:0]  C_CC_TYPE              = 1'b0,
      parameter  [4:0]  C_COUNTER_WIDTH        = 5'h00,
      parameter [(C_MU_CNT0*16)-1:0] C_MU_PROBE_NUM0 = 16'h0,
      parameter [(C_MU_CNT1*16)-1:0] C_MU_PROBE_NUM1 = 16'h0,
      parameter [(C_MU_CNT2*16)-1:0] C_MU_PROBE_NUM2 = 16'h0,
      parameter [(C_MU_CNT3*16)-1:0] C_MU_PROBE_NUM3 = 16'h0,
      parameter [(C_MU_CNT4*16)-1:0] C_MU_PROBE_NUM4 = 16'h0,
      parameter [(C_MU_CNT5*16)-1:0] C_MU_PROBE_NUM5 = 16'h0,
      parameter [(C_MU_CNT6*16)-1:0] C_MU_PROBE_NUM6 = 16'h0,
      parameter [(C_MU_CNT7*16)-1:0] C_MU_PROBE_NUM7 = 16'h0,
      parameter [(C_MU_CNT8*16)-1:0] C_MU_PROBE_NUM8 = 16'h0,
      parameter [(C_MU_CNT9*16)-1:0] C_MU_PROBE_NUM9 = 16'h0,
      parameter [(C_MU_CNT10*16)-1:0] C_MU_PROBE_NUM10 = 16'h0,
      parameter [(C_MU_CNT11*16)-1:0] C_MU_PROBE_NUM11 = 16'h0,
      parameter [(C_MU_CNT12*16)-1:0] C_MU_PROBE_NUM12 = 16'h0,
      parameter [(C_MU_CNT13*16)-1:0] C_MU_PROBE_NUM13 = 16'h0,
      parameter [(C_MU_CNT14*16)-1:0] C_MU_PROBE_NUM14 = 16'h0,
      parameter [(C_MU_CNT15*16)-1:0] C_MU_PROBE_NUM15 = 16'h0,
      parameter [(C_PROBE_CNT*16)-1:0] C_PROBE_WIDTH = 16'h0,
      parameter [(C_PROBE_CNT*2)-1:0] C_MU_TYPE   = 2'b0,
      parameter [(C_PROBE_CNT*2)-1:0] C_DATA_TRIGGER = 2'b0
     )
     (
      input                                   M_AXIS_ACLK,
      input                                   M_AXIS_ARESETN,
      input                                   M_AXIS_TREADY,
      input                                   S_AXIS_ACLK,
      input                                   S_AXIS_ARESETN,
      input                                   S_AXIS_TLAST,
      input                                   S_AXIS_TVALID,
      input  [C_AXIS_DATA_WIDTH-1 : 0]        S_AXIS_TDATA,
      output                                  M_AXIS_TVALID,
      output                                  M_AXIS_TLAST,
      output                                  S_AXIS_TREADY,
      output [C_AXIS_DATA_WIDTH-1 : 0]        M_AXIS_TDATA,
      input  				      ila_clk,
      input  [C_DEPTH_ADDR_WIDTH-1:0]         lwcnt_i,
      input  [C_DEPTH_ADDR_WIDTH-1:0]         hwcnt_i,
      input  [2:0]                            cap_state_i,
      input                                   tsm_flag0_i,
      input                                   tsm_flag1_i,
      input                                   tsm_flag2_i,
      input                                   tsm_flag3_i,
      input  [3:0]                            tsm_state_i,
      input  [C_AXIS_DATA_WIDTH-1 : 0]        config_fsm_data_rd_i,
      output wire [C_AXIS_DATA_WIDTH-1 : 0]   config_fsm_data_o,
      output wire [16:0]                      config_fsm_addr_o,
      output wire 		              config_fsm_en_rb_o,
      output wire 		              config_fsm_en_o,
      output wire 		              config_fsm_we_o,

      input                                   tas_status_i,
      input                                   halt_status_i,
      input  [(C_NUM_COUNTER*16)-1:0]         tsm_counter_status_i,
      input                                   cap_done_i,
      input  [2:0]                            cap_state_iclk,
      input                                   cap_done_iclk,
      input                                   data_out_en_i,

      input                                   reset_out_ack_i,

      input  [C_AXIS_DATA_WIDTH-1:0]          data_word_out_i,
      input  [C_DEPTH_ADDR_WIDTH-1:0]         trace_rd_addr_i,
      input  [C_RD_WRD_CNT_WIDTH-1:0]         trace_rd_wrd_cnt_i,
      input wire [C_DATA_WIDTH-1:0]           trace_rd_data_i,
      output [C_DEPTH_ADDR_WIDTH-1:0]         trace_rd_addr_o,
      output reg                              read_data_en_o,
      output                                  read_addr_reset_o,
      output                                  cfg_en_o,
      output                                  cfg_data_o,
      output                                  arm_o,
      //output                                  g_and_or_o,
      output wire                             adv_trig_config_o, 
      output wire                             trig_in_config_o , 
      output wire [1:0]                       trig_out_config_o, 
      output wire [1:0]                       capture_mode_o, 
      output reg                              halt_o,

      input  wire [(C_NUM_COUNTER*16)-1:0]    cnt_config_din,
      output wire [(C_NUM_COUNTER*16)-1:0]    cnt_config_dout,
      output wire [C_NUM_COUNTER-1:0]         cnt_config_en_o,

      output [C_DEPTH_ADDR_WIDTH-1:0]         max_bit_o,
      output                                  trig_pos_eq_0_o,
      output                                  scnt_max_eq_1_o,
      output                                  trig_pos_eq_scnt_max_o,
      output [C_DEPTH_ADDR_WIDTH-1:0]         bit_sel_o,
      output                                  wr_mu_config_o,
      output                                  wr_tc_config_o,
      output                                  wr_sqc_config_o,
      output                                  wr_cc_config_o,
      output [9:0]                            app_spec_o,
      output wire [2:0]                       ct_state_sel_o,
      output                                  en_deep_storage_o,

      input 				      aresetn,
      output				      aresetn_out
     );

    function integer clogb2 (input integer bit_depth);
    begin
      for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
        bit_depth = bit_depth >> 1;
    end
    endfunction

   localparam [3:0]  IDLE         = 4'b0000,        // This is the initial/idle state
                      PACK_DECODE  = 4'b0001,
                      SOFT_RST     = 4'b0010,
                      READ         = 4'b0011,
                      READ_ADDR    = 4'b0100,
                      READ_LEN     = 4'b0101,
                      WRITE        = 4'b0110,
                      WRITE_ADDR   = 4'b0111,
                      WRITE_LEN    = 4'b1000;
    localparam integer LC_NUM_BYTES_IN_LAST_BEAT_WIDTH = 14,
                       LC_OPCODE_WIDTH                 = 6,
                       LC_APPLICATION_WIDTH            = 10,
                       LC_RD_WR_WIDTH                  = 2,
		       LC_CLK_STAT_WIDTH	       = 8;
    localparam [LC_RD_WR_WIDTH-1:0] LC_SELECT_WRITE    = 2'b00,
                                    LC_COMPLETE_WRITE  = 2'b01,  
                                    LC_SELECT_READ     = 2'b10,
                                    LC_COMPLETE_READ   = 2'b11;

    localparam [LC_OPCODE_WIDTH-1:0] CORE_INFO      = 6'h00,
                                     STATIC_INFO    = 6'h01,
                                     PROBE_INFO     = 6'h02,
                                     DYNAMIC_STATUS = 6'h03,
                                     //MU_CONFIG      = 6'h04,
                                     CC_CONFIG      = 6'h05,
                                     CORE_CONFIG    = 6'h06,
                                     TC_CONFIG      = 6'h07,
                                     TRACE_DATA     = 6'h08,
                                     SQC_CONFIG     = 6'h09,
                                     TSM_CONFIG     = 6'h0A,
                                     MU_CONFIG_1K   = 6'h30;
                                    

    localparam [3:0] LC_CORE_DECT_NUM_PACK        = 4'h6,
                     LC_STATIC_INFO_NUM_PACK      = 4'h4,
                     LC_DYNAMIC_STATUS_NUM_PACK   = 4'hD,
                     LC_CORE_CONFIG_NUM_PACK      = 4'hA,
                     LC_CORE_CONFIG_NUM_PACK_ICLK = 4'h4;

    localparam [31:0] LC_SAMPLE_COUNT = 32'h0000_0064;
    localparam integer LC_TSM_BRAM_DEPTH = 127;
    localparam integer LC_TSM_BRAM_ADDR_BITS = clogb2(LC_TSM_BRAM_DEPTH);

    localparam LC_MU_WIDTH = ((C_DATA_WIDTH + C_HAS_CIN)*3);
    localparam integer LC_NUM_32_BIT_REG = (LC_MU_WIDTH+(C_DATA_WIDTH-1))/C_DATA_WIDTH; // added (C_DATA_WIDTH-1) to consider higher bits out of 32 bits boundary
    localparam [(C_MU_CNT*16)-1:0] LC_MU_PROBE_NUM = {C_MU_PROBE_NUM15,C_MU_PROBE_NUM14,C_MU_PROBE_NUM13,C_MU_PROBE_NUM12,C_MU_PROBE_NUM11,C_MU_PROBE_NUM10,C_MU_PROBE_NUM9,C_MU_PROBE_NUM8,C_MU_PROBE_NUM7,C_MU_PROBE_NUM6,C_MU_PROBE_NUM5,C_MU_PROBE_NUM4,C_MU_PROBE_NUM3,C_MU_PROBE_NUM2,C_MU_PROBE_NUM1,C_MU_PROBE_NUM0};

    reg [((C_DATA_WIDTH + C_HAS_CIN)*3)-1:0] mu_reg_data_o;
    reg [C_DATA_WIDTH-1:0] mu_rd_data_o = {C_DATA_WIDTH{1'b0}};
    reg mu_done_o;
    reg [C_DATA_WIDTH-1:0] reg_addr_int = {C_DATA_WIDTH{1'b0}};

    wire                                        capture_data;
    wire                                        rd_done;
    wire                                        wr_done;
    reg                                         arm = 'b0;
    reg 					arm_iclk = 'b0;
    reg                                         send_core_info;
    wire                                        wr_mu_config;
    reg                                         wr_tc_config;
    reg                                         wr_sqc_config;
    reg                                         wr_cc_config;
    reg                                         wr_core_config;
    reg                                         axis_tready            = 1'b1;
    reg                                         rd_en                  = 1'b0;
    reg                                         en_trace_int           = 1'b0;
    reg                                         invalid_opcode         = 1'b0;
    reg                                         soft_rst               = 1'b0;
    reg                                         wr_en                  = 1'b0;
    wire                                        en_trace_rd;
    reg [3:0]                                   pack_exec_state        = IDLE;
    (* DONT_TOUCH = "TRUE" *)reg [LC_RD_WR_WIDTH-1:0]                    rd_wr                  = {LC_RD_WR_WIDTH{1'b0}};
    reg [C_DEPTH_ADDR_WIDTH-1:0]                td_start_addr          = {C_DEPTH_ADDR_WIDTH{1'b0}};
    reg [LC_OPCODE_WIDTH-1:0]                   opcode                 = {LC_OPCODE_WIDTH{1'b0}};
    reg [LC_APPLICATION_WIDTH-1:0]              app_spec               = {LC_APPLICATION_WIDTH{1'b0}};
    wire [C_RD_WRD_CNT_WIDTH-1:0]                  td_burst_len          ;// = {C_DEPTH_ADDR_WIDTH{1'b0}};
    wire [C_RD_WRD_CNT_WIDTH-1:0]                  td_burst_len_temp     ;// = {C_DEPTH_ADDR_WIDTH{1'b0}};
    reg [C_DATA_WIDTH-1:0] rdwr_addr_sig, rdwr_burst_len, rd_burst_len, wr_burst_len = {C_DATA_WIDTH{1'b0}};
    reg                                         mu_shift_done;
    reg read_addr_reset_int;
    wire [LC_CLK_STAT_WIDTH -1 : 0]			clk_status;

  localparam [1:0] SEND_OPCODE = 2'b00,
                   SEND_DATA   = 2'b01,
                   WAIT_TREADY = 2'b10,
                   SEND_1DATA  = 2'b11;
  reg [1:0] state_m_axis_tdata = SEND_OPCODE;
  reg [1:0] state_m_axis_tdata_dly = SEND_OPCODE;
  reg [C_DATA_WIDTH-1:0] rd_tdata, axis_tdata_reg_dly = {C_DATA_WIDTH{1'b0}};
  reg test_axis_tvalid_dly, test_axis_tlast_dly, test_axis_tvalid_dly2, test_axis_tlast_dly2, send_opcode_sig = 1'b0;
  reg tvalid_opcode = 1'b0;

  reg [31:0] config_fsm_data_reg;
  reg [LC_TSM_BRAM_ADDR_BITS-1:0] config_fsm_addr_reg;
  reg        config_fsm_en_rb_reg;
  reg        config_fsm_en_reg;
  reg        config_fsm_we_reg;
  reg  [C_DATA_WIDTH-1 : 0] counter01_config, counter23_config;
  reg  [1:0] cnt_config_en01_reg, cnt_config_en23_reg;
  wire [63:0] tsm_counter_status;
  wire [63:0] window_depth_config;
  wire [63:0] window_count_readback;
  wire [63:0] trigger_pos_readback;
  wire s_axis_aresetn_int;
  wire m_axis_aresetn_int;

  assign tsm_counter_status = (C_HAS_ADV_TRIG == 1) ? tsm_counter_status_i : 64'h0000_0000_0000_0000;

  generate 
    if (C_HAS_ADV_TRIG) begin: CNT_CONFIG_1
       assign cnt_config_dout[15:0]  = counter01_config[15:0] ;   
       assign cnt_config_dout[31:16] = counter01_config[31:16];   
       assign cnt_config_dout[47:32] = counter23_config[15:0] ;   
       assign cnt_config_dout[63:48] = counter23_config[31:16];   
       assign cnt_config_en_o[0]     = cnt_config_en01_reg[0];
       assign cnt_config_en_o[1]     = cnt_config_en01_reg[1];
       assign cnt_config_en_o[2]     = cnt_config_en23_reg[0];
       assign cnt_config_en_o[3]     = cnt_config_en23_reg[1];
     end
    else begin: CNT_CONFIG_0
       assign cnt_config_dout        = 'b0 ;   
       assign cnt_config_en_o        = 'b0 ;
     end
  endgenerate

    assign S_AXIS_TREADY    = axis_tready && mu_shift_done;
//    assign read_data_en_o   = (opcode == TRACE_DATA) ? rd_en : 1'b0;
    assign trace_rd_addr_o = rdwr_addr_sig;

	always @(posedge S_AXIS_ACLK) 
	begin  
	  if (!S_AXIS_ARESETN) 
	  // Synchronous reset (active low)
	    begin
	      pack_exec_state <= IDLE;
	    end  
	  else
	    case (pack_exec_state)
	      IDLE: 
	       begin
	        // The sink starts accepting tdata when 
	        // there tvalid is asserted to mark the
	        // presence of valid streaming data 
	          if (capture_data)
	            begin
	              pack_exec_state <= PACK_DECODE;
	              axis_tready     <= 1'b0;//Slave ready
	            end
	          else
	            begin
	              pack_exec_state <= IDLE;
	              axis_tready     <= 1'b1;//Slave ready
	            end
	          soft_rst    <= 1'b0;
	          rd_en       <= 1'b0;               
              wr_en       <= 1'b0;
              invalid_opcode <= 1'b0;
              en_trace_int <= 1'b0;
	        end
	      PACK_DECODE: 
	       begin
	        // When the sink has accepted all the streaming input data,
	        // the interface swiches functionality to a streaming master	
	        if(opcode <= MU_CONFIG_1K)
	          begin
	            if (opcode == 6'b111111)
	             begin
	               pack_exec_state <= SOFT_RST;
	               wr_en <= 1'b0;
                   rd_en <= 1'b0;
                   axis_tready   <= 1'b0;
                   rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
	             end
	            else if (rd_wr == LC_COMPLETE_READ) //2'b11)
	             begin
	               pack_exec_state <= READ;
	               rd_en <= 1'b1;
	               wr_en <= 1'b0;
	               rdwr_addr_sig <= {C_DATA_WIDTH{1'b0}};
	               if(opcode == TRACE_DATA)
	                begin
	                  rdwr_burst_len <= 2**C_DATA_WIDTH-1; //sample_cnt_i[C_RD_WRD_CNT_WIDTH-1:0];  //Load sample count for trace read
	                end
	               else
	                begin
	                  rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};  // Read from initial addr
	                end
	               axis_tready <= 1'b0;	               
	             end
	            else if (rd_wr == LC_SELECT_READ) // 2'b10)
	             begin
                   pack_exec_state <= READ_ADDR;
                   rd_en <= 1'b0;
                   wr_en <= 1'b0;
                   rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
                   axis_tready <= 1'b1;
	             end
	            else if (rd_wr == LC_COMPLETE_WRITE)
	             begin
	               pack_exec_state <= WRITE;
	               wr_en           <= 1'b1;
	               rd_en           <= 1'b0;
	               rdwr_addr_sig   <= {C_DATA_WIDTH{1'b0}};
	               rdwr_burst_len  <= {C_DATA_WIDTH{1'b0}};
	               axis_tready     <= 1'b1;
	             end 
	            else if (rd_wr == LC_SELECT_WRITE)
	             begin
	               pack_exec_state <= WRITE_ADDR;
	               wr_en           <= 1'b0;
	               rd_en           <= 1'b0;
	               rdwr_addr_sig   <= {C_DATA_WIDTH{1'b0}};
	               rdwr_burst_len  <= {C_DATA_WIDTH{1'b0}};
	               axis_tready     <= 1'b1;
	             end
	            invalid_opcode <= 1'b0;
	           end
	         else
	           begin
	             pack_exec_state <= IDLE;
	             wr_en <= 1'b0;
                 rd_en <= 1'b0;
                 rdwr_addr_sig  <= {C_DATA_WIDTH{1'b0}};
                 rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
                 invalid_opcode <= 1'b1;
	           end	        
	        soft_rst <= 1'b0;
	        en_trace_int <= 1'b0;
	        end
	      SOFT_RST:
	        begin
	          pack_exec_state <= IDLE;
	          soft_rst    <= 1'b1; // Check for how many clocks it should be active
	          axis_tready <= 1'b0;
	          rd_en       <= 1'b0;
	          wr_en       <= 1'b0;
	          invalid_opcode <= 1'b0;
	          en_trace_int <= 1'b0;
	          rdwr_addr_sig  <= {C_DATA_WIDTH{1'b0}};
              rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
	        end
	      READ_ADDR:
	        begin
	          if(S_AXIS_TVALID && axis_tready)
               begin
                 pack_exec_state <= READ_LEN;
                 rdwr_addr_sig   <= S_AXIS_TDATA;
               end 
              else
               begin
                 pack_exec_state <= READ_ADDR;
                 rdwr_addr_sig   <= {C_DATA_WIDTH{1'b0}};
               end
              rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
              axis_tready <= 1'b1;
              rd_en <= 1'b0;
              wr_en <= 1'b0;
              en_trace_int <= 1'b0;
	        end
	      READ_LEN:
            begin
              if(S_AXIS_TVALID && S_AXIS_TREADY) //axis_tready)
                begin
                  pack_exec_state <= READ;
                  rdwr_burst_len <= S_AXIS_TDATA;
                  rd_en <= 1'b1;
                end
              else
                begin
                  pack_exec_state <= READ_LEN;
                  rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
                  rd_en <= 1'b0;
                end                
                wr_en <= 1'b0;
                axis_tready <= 1'b1;
                en_trace_int <= 1'b0;
            end
	      READ:
	        begin
	          if(M_AXIS_TREADY == 1'b1 && M_AXIS_TLAST == 1'b1 && M_AXIS_TVALID == 1'b1)
	           begin
	             pack_exec_state <= IDLE;
	             rd_en <= 1'b0;	             
	             axis_tready <= 1'b1;
	           end
	          else
	           begin
	             pack_exec_state <= READ;
	             rd_en <= 1'b1;
	             axis_tready <= 1'b0;
	           end
	          wr_en <= 1'b0;
	          invalid_opcode <= 1'b0;
	          en_trace_int <= 1'b0;
	        end  
	      WRITE_ADDR:
                begin
                  if(S_AXIS_TVALID && S_AXIS_TREADY) //axis_tready)
                   begin
                     pack_exec_state <= WRITE_LEN;
                     rdwr_addr_sig   <= S_AXIS_TDATA;
                   end 
                  else
                   begin
                     pack_exec_state <= WRITE_ADDR;
                     rdwr_addr_sig   <= {C_DATA_WIDTH{1'b0}};
                   end
                  axis_tready <= 1'b1;
                  rd_en <= 1'b0;
                  wr_en <= 1'b0;
                  en_trace_int  <= 1'b0;
                  rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
                end
	      WRITE_LEN:
                begin
                  if(S_AXIS_TVALID && S_AXIS_TREADY) //axis_tready)
                    begin
                      pack_exec_state <= WRITE;
                      rdwr_burst_len <= S_AXIS_TDATA;
                      wr_en <= 1'b1;
                    end
                  else
                    begin
                      pack_exec_state <= WRITE_LEN;
                      rdwr_burst_len <= {C_DATA_WIDTH{1'b0}};
                      wr_en <= 1'b0;
                    end                
                    rd_en         <= 1'b0;
                    axis_tready   <= 1'b1;
                    en_trace_int  <= 1'b0;
                end
	      WRITE:
	        begin
	         if(wr_done == 1'b1 || (S_AXIS_TLAST == 1'b1 && S_AXIS_TREADY == 1'b1 && S_AXIS_TVALID == 1'b1))
              begin
                pack_exec_state <= IDLE;
                wr_en <= 1'b0;
                axis_tready <= 1'b0;
              end
             else
              begin
                pack_exec_state <= WRITE;
                wr_en <= 1'b1;	       
	            axis_tready <= 1'b1;
	          end
	          invalid_opcode <= 1'b0;
	          en_trace_int   <= 1'b0;
	        end
	      default:
	        begin
	          pack_exec_state <= IDLE;
	          rd_en           <= 1'b0;
              axis_tready     <= 1'b0;
              wr_en           <= 1'b0;
              invalid_opcode  <= 1'b0;
              en_trace_int <= 1'b0;
	        end
	    endcase
	end


    assign capture_data = S_AXIS_TVALID && S_AXIS_TREADY; //axis_tready;

    always @( posedge S_AXIS_ACLK )
    begin
      if (capture_data == 1'b1 && pack_exec_state == IDLE)
      begin
        opcode   <= S_AXIS_TDATA[(LC_OPCODE_WIDTH + LC_NUM_BYTES_IN_LAST_BEAT_WIDTH)-1 : LC_NUM_BYTES_IN_LAST_BEAT_WIDTH];
        app_spec <= S_AXIS_TDATA[(LC_APPLICATION_WIDTH + LC_OPCODE_WIDTH + LC_NUM_BYTES_IN_LAST_BEAT_WIDTH)-1 : (LC_OPCODE_WIDTH + LC_NUM_BYTES_IN_LAST_BEAT_WIDTH)];
        rd_wr    <= S_AXIS_TDATA[(LC_RD_WR_WIDTH + LC_APPLICATION_WIDTH + LC_OPCODE_WIDTH + LC_NUM_BYTES_IN_LAST_BEAT_WIDTH)-1 : (LC_APPLICATION_WIDTH + LC_OPCODE_WIDTH + LC_NUM_BYTES_IN_LAST_BEAT_WIDTH)];
      end
    end

    assign app_spec_o = app_spec;
   reg  reg_rd_en_int, reg_rd_en_int_dly = 1'b0;
   wire reg_rd_en_async;
   wire reg_wr_en;
   reg reg_rd_en = 1'b0;
    localparam [1:0] S0 = 2'b00,
                     S1 = 2'b01,
                     S2 = 2'b10;
    reg [1:0] rd_state = S0;
   assign reg_rd_en_async = reg_rd_en & M_AXIS_TREADY;
//   assign reg_rd_en_int = rd_en & M_AXIS_TREADY;
   assign reg_wr_en = S_AXIS_TVALID && wr_en;
    
      always @(posedge S_AXIS_ACLK)
       begin
         reg_rd_en_int <= reg_rd_en_async;
         reg_rd_en_int_dly <= reg_rd_en_int;
         case (rd_state)
           S0:
            begin
              if (rd_en == 1'b1)
               begin
                 reg_rd_en <= 1'b1;
                 rd_state <= S1;
               end
              else 
               begin
                 rd_state <= S0;
                 reg_rd_en <= 1'b0;
               end
            end
           S1:
            begin
              if (rd_en == 1'b1 && rd_done == 1'b1)
               begin
                 rd_state <= S2;
                 reg_rd_en <= 1'b0;
               end
              else
               begin
                 rd_state <= S1;
                 reg_rd_en <= rd_en;
               end
              
            end
           S2:
            begin
              if (rd_en == 1'b0)
               begin
                 rd_state <= S0;
               end
              else
               begin
                 rd_state <= S2;
               end
            end
          endcase
       end

//------ Core config reg inst ----------------------------------------
  wire core_rd_en, core_wr_en;
  wire [(LC_CORE_CONFIG_NUM_PACK)-1:0] core_burst_len;
  wire [C_DATA_WIDTH-1:0] core_rd_data_o;
  reg  [C_DATA_WIDTH-1 : 0] window_mask_reg, delay_reg, hold_reg; //= {C_DATA_WIDTH*LC_CORE_CONFIG_NUM_PACK{1'b0}};
  wire [C_DATA_WIDTH-1 : 0] core_reg, trig_reg, max_bit_reg;
  wire [(2*C_DATA_WIDTH)-1 : 0] bit_sel_reg;
  wire core_done_reg;
  wire core_done_iclk_reg;
  wire core_done_serial_op, core_start_serial_op_reg, core_serial_data_reg;
  wire rd_en_temp;
  wire arm_from_vivado;
  wire arm_from_vivado_iclk;
  wire arm_in;
  wire halt_in;
  wire tasen_in;
  wire halt_o_iclk;
  wire tas_enable;
  reg halt_status_s;
  reg [C_DEPTH_ADDR_WIDTH-1:0] lwcnt_s;
  reg [C_DEPTH_ADDR_WIDTH-1:0] hwcnt_s;

  reg  [2:0] ct_state_sel_reg;
  wire [2:0] ct_state_sel;
  //assign lwcnt_s = (halt_o == 1'b1 || halt_status_s == 1'b1) ? lwcnt_s : lwcnt_i;
  //assign hwcnt_s = (halt_o == 1'b1 || halt_status_s == 1'b1) ? hwcnt_s : hwcnt_i;

  assign rd_en_temp = rd_en & send_opcode_sig & M_AXIS_TREADY & ~M_AXIS_TLAST;
//  wire [C_DATA_WIDTH-1:0] reg_core_config_reg [0:(LC_CORE_CONFIG_NUM_PACK-1)];
  
  assign core_rd_en = (opcode == CORE_CONFIG) ? rd_en_temp : 1'b0 ; //(reg_rd_en_int & reg_rd_en_async) : 1'b0; //reg_rd_en_async
//  assign core_rd_en = (opcode == CORE_CONFIG) ? reg_rd_en_async : 1'b0;
  assign core_wr_en = (opcode == CORE_CONFIG) ? reg_wr_en : 1'b0;
  
  assign core_burst_len = ((rd_wr == LC_COMPLETE_READ || rd_wr == LC_COMPLETE_WRITE) && (opcode == CORE_CONFIG)) ? LC_CORE_CONFIG_NUM_PACK : rdwr_burst_len[(LC_CORE_CONFIG_NUM_PACK)-1:0];
 
  assign max_bit_o = max_bit_reg[C_DEPTH_ADDR_WIDTH-1:0]; 
  assign bit_sel_o = bit_sel_reg[C_DEPTH_ADDR_WIDTH-1:0]; 

  assign trig_pos_eq_0_o        = trig_reg[0];
  assign trig_pos_eq_scnt_max_o = trig_reg[1];
  assign scnt_max_eq_1_o        = trig_reg[2];
  assign adv_trig_config_o      = trig_reg[4];         
  assign capture_mode_o[1:0]    = trig_reg[6:5];         
  assign trig_in_config_o       = trig_reg[7];         
  assign trig_out_config_o      = trig_reg[9:8];
  assign arm_from_vivado        = (core_done_reg == 1'b1) ? arm_in : 1'b0;
  assign arm_from_vivado_iclk   = (core_done_iclk_reg == 1'b1) ? trig_reg[3] : 1'b0;
  assign halt_o_iclk		= trig_reg [10];
  assign tas_enable		= trig_reg [11];

  assign ct_state_sel		= trig_reg [14:12];
  assign en_deep_storage_o      = trig_reg [16];

  assign ct_state_sel_o = ct_state_sel;
  //always @(posedge ila_clk)
  // begin
  //   ct_state_sel_reg <= ct_state_sel;
  //   ct_state_sel_o   <= ct_state_sel_reg;
  // end

  assign aresetn_out	    = ~(halt_o_iclk || ~aresetn);
  //--Commented below line because of CDC-11 CW from axis_dbg_sync_6 CR#1099907. Enable below line for TAS and fix CDC-11 issue
  //assign aresetn_out        = (tas_enable == 1'b1) ? 1'b1 : ~(halt_o_iclk || ~aresetn);
  assign s_axis_aresetn_int = (tas_enable == 1'b1) ? 1'b1 : S_AXIS_ARESETN ;
  assign m_axis_aresetn_int = (tas_enable == 1'b1) ? 1'b1 : M_AXIS_ARESETN ;

  always @(posedge S_AXIS_ACLK)
   begin
     if (S_AXIS_ARESETN == 1'b0) begin
        halt_o <= 1'b0;
     end else begin
        if (cap_state_i == 3'b000 && arm == 1'b0) begin
	  halt_o <= 1'b0;
	end else begin
	  halt_o <= halt_in;
	end
     end
   end

  always @(posedge S_AXIS_ACLK)
   begin
     if (S_AXIS_ARESETN == 1'b0) begin
        halt_status_s <= 1'b0;
     end else begin
        if (halt_o == 1'b1) begin
  	  halt_status_s <= 1'b1;
	end else if (arm == 1'b1) begin
          halt_status_s <= 1'b0;
	end
     end
   end 

  always @(posedge S_AXIS_ACLK)
   begin
     if (S_AXIS_ARESETN == 1'b0)
      begin
        arm <= 1'b0;
      end
     else
      begin
        if (arm_from_vivado == 1'b1)
         begin
           arm <= 1'b1;
         end
        else if (cap_done_i == 1'b1 && cap_state_i == 3'b000 || halt_o == 1'b1)
         begin
           arm <= 1'b0;
         end
      end
   end

  always @(posedge ila_clk)
   begin
        if (arm_from_vivado_iclk == 1'b1)
         begin
           arm_iclk <= 1'b1;
         end
        else if (cap_done_iclk == 1'b1 && cap_state_iclk == 3'b000 || halt_o_iclk == 1'b1)
         begin
           arm_iclk <= 1'b0;
         end
   end

   assign arm_o = arm_iclk;      
/*if ((wr_core_config == 1'b1) && (wr_pointer_core_config <= C_CORE_CONFIG_NUM_PACK-1))
        begin
          case (wr_pointer_core_config)
            3'b000: begin
                      max_bit_reg <= S_AXIS_TDATA[C_DEPTH_ADDR_WIDTH-1:0];
                    end
            3'b001: begin
                      bit_sel_reg <= S_AXIS_TDATA;
                    end
            3'b010: begin
                      trig_pos_eq_0_reg <= S_AXIS_TDATA[0];
                      trig_pos_eq_scnt_max_reg <= S_AXIS_TDATA[1];
                      scnt_max_eq_1_reg <= S_AXIS_TDATA[2];
                    end
            3'b011: begin
                      arm_reg <= S_AXIS_TDATA[0];
                      halt_reg <= S_AXIS_TDATA[1];
                      trig_out_ack_reg <= S_AXIS_TDATA[2];
                    end
          endcase
        end
*/

    axis_ila_intf_v1_0_0_clk_status  #(
       .C_NUM_CLOCKS(1))
       u_clk_status
    (
      .axis_clk(S_AXIS_ACLK),
      .aresetn(S_AXIS_ARESETN),
      .des_clk0(ila_clk),
      .des_clk1(0),
      .des_clk2(0),
      .des_clk3(0),
      .des_clk4(0),
      .des_clk5(0),
      .des_clk6(0),
      .des_clk7(0),
      .clk_status(clk_status)
    );


      axis_ila_intf_v1_0_0_reg_array #(
         .C_EN_STAT(1'b0),
         .C_EN_CTL(1'b1), 
         .C_NUM_REGS      (LC_CORE_CONFIG_NUM_PACK),
         .C_NUM_REGS_ICLK (LC_CORE_CONFIG_NUM_PACK_ICLK),
         .C_DATA_WIDTH  (C_DATA_WIDTH  ),
         .C_EN_SERIAL_OP(1'b0),
         .C_EN_PARALLEL_OP(1'b1)
        ) u_core_reg
        (
         .ila_clk_i (ila_clk),
         .clk_i     (S_AXIS_ACLK),
         .rst_i     (S_AXIS_ARESETN),
         .rd_en_i(core_rd_en),
         .wr_en_i(core_wr_en),
         .rd_en_serial_i(1'b0),
         .data_i    (S_AXIS_TDATA),
         .full_data_i({C_DATA_WIDTH*LC_CORE_CONFIG_NUM_PACK{1'b0}}),
         .addr_i    (rdwr_addr_sig[(LC_CORE_CONFIG_NUM_PACK)-1:0]),
         .burst_len (core_burst_len),
         .data_o    (core_rd_data_o),
         .full_data_iclk_o({trig_reg, bit_sel_reg, max_bit_reg}),
         .full_data_clk_o({trigger_pos_readback, window_count_readback, window_depth_config}),
         .arm_in    (arm_in),
	 .halt_in   (halt_in),
	 .tasen_in  (tasen_in),
         .done_o    (core_done_reg),
	 .done_iclk_o (core_done_iclk_reg),
         .done_serial_op   (core_done_serial_op),   
         .start_serial_op_o(core_start_serial_op_reg),
         .serial_data_o    (core_serial_data_reg)     
        );
//--------------------------------------------------------------------
//--------Core detection ---------------------------------------------
  localparam integer LC_MU_PROBE_NUM_WRD_CNT = (wrd_cnt(C_MU_CNT*16) == 0) ? 1 : wrd_cnt(C_MU_CNT*16);
  localparam integer LC_PROBE_WIDTH_WRD_CNT  = wrd_cnt(C_PROBE_CNT*16);
  localparam integer LC_MU_TYPE_WRD_CNT      = wrd_cnt(C_PROBE_CNT*2);
  localparam integer LC_DATA_TRIGGER_WRD_CNT = wrd_cnt(C_PROBE_CNT*2);
  localparam integer MU_WRD_CNT_BITS = clogb2(LC_MU_PROBE_NUM_WRD_CNT);
  localparam integer LC_GRT_PARAM = (LC_MU_PROBE_NUM_WRD_CNT > LC_PROBE_WIDTH_WRD_CNT) ? clogb2(LC_MU_PROBE_NUM_WRD_CNT) : clogb2(LC_PROBE_WIDTH_WRD_CNT);
  localparam integer LC_PROBE_INFO_NUM_PACK = (LC_MU_PROBE_NUM_WRD_CNT + LC_PROBE_WIDTH_WRD_CNT + LC_MU_TYPE_WRD_CNT + LC_DATA_TRIGGER_WRD_CNT);
  localparam integer LC_BIT_NUM_PROBE_INFO_PACK = clogb2(LC_PROBE_INFO_NUM_PACK);
  localparam [2:0] LOAD_ADDR = 3'b000,
                   INC_ADDR  = 3'b001,
                   STATUS_WAIT_STATE = 3'b010;

  wire [C_DATA_WIDTH-1:0] core_detect_rd_data_o;
  wire core_detect_rd_en, core_detect_done_reg;
  wire [LC_CORE_DECT_NUM_PACK-1:0] core_detect_burst_len;
  wire [(LC_CORE_DECT_NUM_PACK*C_DATA_WIDTH)-1:0] core_detect_full_data_reg;
  wire [C_DATA_WIDTH-1:0] reg_core_detect_reg [0:(LC_CORE_DECT_NUM_PACK-1)];
  wire [LC_DYNAMIC_STATUS_NUM_PACK-1:0] dynamic_status_burst_len;
  wire [LC_STATIC_INFO_NUM_PACK-1:0] static_status_burst_len;
  wire [15:0] status_burst_len;
  wire [LC_BIT_NUM_PROBE_INFO_PACK-1 : 0] probe_info_burst_len; 

                   
  reg [2:0] state_rd_status = LOAD_ADDR;
  reg [LC_CORE_DECT_NUM_PACK-1:0] mem_addr;
  reg [15:0] status_cnt_burst_len;
  reg done_rd_status;
  reg rd_core_status;
  (* UUID *)(* DONT_TOUCH = "TRUE" *) reg [127:0] uuid_stamp = 128'h0000000_00000000_00000000_00000000;

  always @(posedge M_AXIS_ACLK)
  begin
    uuid_stamp <= uuid_stamp;
  end 
     
  assign core_detect_burst_len = (rd_wr == LC_COMPLETE_READ)  ? LC_CORE_DECT_NUM_PACK : rdwr_burst_len[LC_CORE_DECT_NUM_PACK-1:0];
  assign status_burst_len = (opcode == CORE_INFO) ? core_detect_burst_len : (opcode == STATIC_INFO) ? static_status_burst_len : (opcode == CORE_CONFIG) ? core_burst_len : (opcode == PROBE_INFO) ? probe_info_burst_len : dynamic_status_burst_len; 
  assign reg_core_detect_reg[0] = {C_CSE_DRV_VER, C_CORE_TYPE};
  assign reg_core_detect_reg[1] = {C_MAJOR_VERSION, C_MINOR_VERSION, C_CORE_MAJOR_VER, C_CORE_MINOR_VER};
  assign reg_core_detect_reg[2] = uuid_stamp[31:0];
  assign reg_core_detect_reg[3] = uuid_stamp[63:32];
  assign reg_core_detect_reg[4] = uuid_stamp[95:64];
  assign reg_core_detect_reg[5] = uuid_stamp[127:96];

  always @(posedge S_AXIS_ACLK)
    begin
//      if (opcode == CORE_INFO || opcode == DYNAMIC_STATUS)
      if (reg_rd_en_int && reg_rd_en_async)
       begin
         rd_core_status <= 1'b1; //reg_rd_en_int && reg_rd_en_async;
       end
      else
       begin
         rd_core_status <= 1'b0;
       end
    end
  
  //always @(posedge S_AXIS_ACLK)
  // begin
  //   if (S_AXIS_ARESETN == 1'b0)
  //    begin
  //      state_rd_status <= LOAD_ADDR;
  //    end
  //   else
  //    begin
  //         case (state_rd_status)
  //           LOAD_ADDR:
  //            begin 
  //              //if (rd_core_status == 1'b1 && (opcode != TRACE_DATA))// || reg_wr_en == 1'b1)
  //              if (rd_en_temp == 1'b1  && (opcode != TRACE_DATA))// || reg_wr_en == 1'b1)
  //               begin
  //                 //mem_addr             <= rdwr_addr_sig[LC_CORE_DECT_NUM_PACK-1:0] + 1;
  //                 mem_addr             <= rdwr_addr_sig[LC_CORE_DECT_NUM_PACK-1:0];
  //                 state_rd_status      <= INC_ADDR;
  //                 //status_cnt_burst_len <= status_cnt_burst_len + 1;
  //               end                 
  //              else
  //               begin  
  //                 mem_addr      <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //                 state_rd_status   <= LOAD_ADDR;
  //                 //status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};                     
  //               end
  //               status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};                     
  //               done_rd_status      <= 1'b0;                                                                 
  //            end
  //           INC_ADDR:
  //            begin
  //              if (M_AXIS_TLAST && M_AXIS_TREADY && M_AXIS_TVALID)// || reg_wr_en == 1'b1)
  //               begin
  //                 state_rd_status      <= LOAD_ADDR;
  //                 done_rd_status       <= 1'b0;
  //                 mem_addr             <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //                 status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //               end
  //              //else if (rd_core_status == 1'b1)// || reg_wr_en == 1'b1)
  //              else if (rd_en_temp == 1'b1)// || reg_wr_en == 1'b1)
  //               begin
  //                 if ((status_cnt_burst_len < status_burst_len) && tvalid_opcode == 1'b0)
  //                  begin
  //                    state_rd_status <= INC_ADDR;    
  //                    done_rd_status  <= 1'b0;        
  //                    mem_addr        <= mem_addr + 1;
  //                    status_cnt_burst_len <= status_cnt_burst_len + 1;
  //                  end
  //                 else
  //                  begin
  //                    state_rd_status <= STATUS_WAIT_STATE;
  //                    done_rd_status  <= 1'b1;
  //                  end
  //                 //status_cnt_burst_len <= status_cnt_burst_len + 1;
  //               end
  //            end
  //           STATUS_WAIT_STATE:
  //            begin
  //              //if (rd_en_temp == 1'b0)// || reg_wr_en == 1'b1)
  //              if (M_AXIS_TLAST && M_AXIS_TREADY && M_AXIS_TVALID)// || reg_wr_en == 1'b1)
  //               begin
  //                 state_rd_status      <= LOAD_ADDR;
  //                 done_rd_status       <= 1'b0;
  //                 mem_addr             <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //                 status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //               end
  //            end
  //           default:
  //            begin
  //              state_rd_status      <= LOAD_ADDR;
  //              done_rd_status       <= 1'b0;
  //              status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //              mem_addr             <= {LC_CORE_DECT_NUM_PACK{1'b0}};
  //            end
  //         endcase
  //    end
  // end
   assign core_detect_rd_data_o = reg_core_detect_reg[mem_addr];
//   assign core_detect_done_reg  = done_rd_status;
//--------Dynamic status -------------------------------------------------
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_0 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_1 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_2 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_3 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_4 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_5 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_6 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_7 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_8 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_9 = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_A = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_B = {C_DATA_WIDTH{1'b0}};
  reg [C_DATA_WIDTH-1:0] reg_dynamic_status_arry_C = {C_DATA_WIDTH{1'b0}};
  wire [C_DATA_WIDTH-1:0] dynamic_status_rd_data_o;
  wire dynamic_status_rd_en, dynamic_status_done_reg;
  
//  assign dynamic_status_rd_en = (opcode == DYNAMIC_STATUS) ? (reg_rd_en_int & reg_rd_en_async) : 1'b0; //reg_rd_en_async
  assign dynamic_status_rd_en = (opcode == DYNAMIC_STATUS) ? rd_en_temp : 1'b0; //reg_rd_en_async
//  assign dynamic_status_rd_en = (opcode == DYNAMIC_STATUS) ? reg_rd_en_async : 1'b0;   
  assign dynamic_status_burst_len = (rd_wr == LC_COMPLETE_READ) ? LC_DYNAMIC_STATUS_NUM_PACK : rdwr_burst_len[LC_DYNAMIC_STATUS_NUM_PACK-1:0];

 //####################################################
 //	Logic to set cap_done 
 //####################################################
  /*reg cap_done;
   always @ (posedge M_AXIS_ACLK)
  begin
    if (!M_AXIS_ARESETN)
    begin
      cap_done <= 1'b0;
    end
    else
    begin
      if (arm == 1'b1 && cap_done_i == 1'b1)
      begin
        cap_done <= 1'b1;
      end
      else if (arm == 1'b1 && cap_done_i == 1'b0)
      begin
        cap_done <= 1'b0;
      end
    end
  end*/
 //----------------------------------------------------------------------

  assign dynamic_status_done_reg  = done_rd_status;

  //
  //--- Dynamic status packet-------------------------------------------
  //
  wire [3:0] tsm_flag_i;
  assign tsm_flag_i = {tsm_flag3_i, tsm_flag2_i, tsm_flag1_i, tsm_flag0_i};

//---lwcnt_s and hwcnt_shwcnt_s
    always @ (posedge M_AXIS_ACLK)
     begin 
       if (!M_AXIS_ARESETN)
        begin
         lwcnt_s <= 'b0;
         hwcnt_s <= 'b0;
        end
       else
        begin
          if (halt_o == 1'b1 || halt_status_s == 1'b1)
          begin
            lwcnt_s <= lwcnt_s;
            hwcnt_s <= hwcnt_s;
          end
          else
          begin
            lwcnt_s <= lwcnt_i;
            hwcnt_s <= hwcnt_i;
          end
        end
     end
//----------------------------------------------------------------
//---reg_dynamic_status_arry 0, 5 & 6------------------------------
    always @ (posedge M_AXIS_ACLK)
     begin 
       if (!M_AXIS_ARESETN)
        begin
         reg_dynamic_status_arry_0 <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_5 <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_6 <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_7 <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_8 <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_9 <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_A <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_B <= {C_DATA_WIDTH{1'b0}};
         reg_dynamic_status_arry_C <= {C_DATA_WIDTH{1'b0}};
        end
       else
        begin
          if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1)
           begin
             reg_dynamic_status_arry_0 <= {18'h0, tsm_flag_i[3:0], tsm_state_i[3:0], tasen_in, halt_status_s, cap_state_i[1:0],cap_done_i,arm};
             reg_dynamic_status_arry_5 <= {tsm_counter_status[31:16],tsm_counter_status[15:0]};
             reg_dynamic_status_arry_6 <= {tsm_counter_status[63:48],tsm_counter_status[47:32]};
             
             reg_dynamic_status_arry_7 <= window_depth_config[31:0];
             reg_dynamic_status_arry_8 <= window_depth_config[63:32];
 
             reg_dynamic_status_arry_9 <= window_count_readback[31:0];
             reg_dynamic_status_arry_A <= window_count_readback[63:32];

             reg_dynamic_status_arry_B <= trigger_pos_readback[31:0];
             reg_dynamic_status_arry_C <= trigger_pos_readback[63:32];
          end
        end
     end
//----------------------------------------------------------------
 generate 
   if (C_DEPTH_ADDR_WIDTH > 32) begin: CNT_STATUS_64
     always @ (posedge M_AXIS_ACLK)
      begin 
        if (!M_AXIS_ARESETN)
         begin
          reg_dynamic_status_arry_1 <= {C_DATA_WIDTH{1'b0}};
          reg_dynamic_status_arry_2 <= {C_DATA_WIDTH{1'b0}};
          reg_dynamic_status_arry_3 <= {C_DATA_WIDTH{1'b0}};
          reg_dynamic_status_arry_4 <= {C_DATA_WIDTH{1'b0}};
         end
        else
         begin
           if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1)
           begin
              if (halt_o == 1'b1 || halt_status_s == 1'b1)
              begin
                reg_dynamic_status_arry_1 <= lwcnt_s[31:0];
                reg_dynamic_status_arry_2 <= {{(C_AXIS_DATA_WIDTH-(C_DEPTH_ADDR_WIDTH-32)){1'b0}},lwcnt_s[C_DEPTH_ADDR_WIDTH-1:32]};

                reg_dynamic_status_arry_3 <= hwcnt_s[31:0];
                reg_dynamic_status_arry_4 <= {{(C_AXIS_DATA_WIDTH-(C_DEPTH_ADDR_WIDTH-32)){1'b0}},hwcnt_s[C_DEPTH_ADDR_WIDTH-1:32]};
              end
              else
              begin
                reg_dynamic_status_arry_1 <= lwcnt_i[31:0];
                reg_dynamic_status_arry_2 <= {{(C_AXIS_DATA_WIDTH-(C_DEPTH_ADDR_WIDTH-32)){1'b0}},lwcnt_i[C_DEPTH_ADDR_WIDTH-1:32]};

                reg_dynamic_status_arry_3 <= hwcnt_i[31:0];
                reg_dynamic_status_arry_4 <= {{(C_AXIS_DATA_WIDTH-(C_DEPTH_ADDR_WIDTH-32)){1'b0}},hwcnt_i[C_DEPTH_ADDR_WIDTH-1:32]};
              end
           end
         end
      end
    end
    else begin: CNT_STATUS_32
     always @ (posedge M_AXIS_ACLK)
      begin 
        if (!M_AXIS_ARESETN)
         begin
          reg_dynamic_status_arry_1 <= {C_DATA_WIDTH{1'b0}};
          reg_dynamic_status_arry_2 <= {C_DATA_WIDTH{1'b0}};
          reg_dynamic_status_arry_3 <= {C_DATA_WIDTH{1'b0}};
          reg_dynamic_status_arry_4 <= {C_DATA_WIDTH{1'b0}};
         end
        else
         begin
           if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1)
           begin
              if (halt_o == 1'b1 || halt_status_s == 1'b1)
              begin
                reg_dynamic_status_arry_1 <= {{(C_AXIS_DATA_WIDTH-C_DEPTH_ADDR_WIDTH){1'b0}},lwcnt_s[C_DEPTH_ADDR_WIDTH-1:0]};
                reg_dynamic_status_arry_2 <= 'h0;

                reg_dynamic_status_arry_3 <= {{(C_AXIS_DATA_WIDTH-C_DEPTH_ADDR_WIDTH){1'b0}},hwcnt_s[C_DEPTH_ADDR_WIDTH-1:0]};
                reg_dynamic_status_arry_4 <= 'h0;

              end
              else
              begin
                reg_dynamic_status_arry_1 <= {{(C_AXIS_DATA_WIDTH-C_DEPTH_ADDR_WIDTH){1'b0}},lwcnt_i[C_DEPTH_ADDR_WIDTH-1:0]};
                reg_dynamic_status_arry_2 <= 'h0;

                reg_dynamic_status_arry_3 <= {{(C_AXIS_DATA_WIDTH-C_DEPTH_ADDR_WIDTH){1'b0}},hwcnt_i[C_DEPTH_ADDR_WIDTH-1:0]};
                reg_dynamic_status_arry_4 <= 'h0;
              end
           end
         end
      end
    end
    endgenerate
//-------------------------------------------------------------------------------------------------
     assign dynamic_status_rd_data_o = (mem_addr == 6'h01) ? reg_dynamic_status_arry_1 : 
                                       (mem_addr == 6'h02) ? reg_dynamic_status_arry_2 : 
                                       (mem_addr == 6'h03) ? reg_dynamic_status_arry_3 : 
                                       (mem_addr == 6'h04) ? reg_dynamic_status_arry_4 : 
                                       (mem_addr == 6'h05) ? reg_dynamic_status_arry_5 : 
                                       (mem_addr == 6'h06) ? reg_dynamic_status_arry_6 : 
                                       (mem_addr == 6'h07) ? reg_dynamic_status_arry_7 : 
                                       (mem_addr == 6'h08) ? reg_dynamic_status_arry_8 : 
                                       (mem_addr == 6'h09) ? reg_dynamic_status_arry_9 : 
                                       (mem_addr == 6'h0A) ? reg_dynamic_status_arry_A : 
                                       (mem_addr == 6'h0B) ? reg_dynamic_status_arry_B : 
                                       (mem_addr == 6'h0C) ? reg_dynamic_status_arry_C : 
                                       reg_dynamic_status_arry_0;

  //--------------------------------------------------------------------
//------------------------------------------------------------------------------
//------ STATIC_INFO_PACKET---------------------------------------------------------
  wire [C_DATA_WIDTH-1:0] reg_static_info_arry [0:(LC_STATIC_INFO_NUM_PACK-1)];
  wire [C_DATA_WIDTH-1:0] core_static_info_rd_data_o;
  wire core_static_info_rd_en;
  localparam integer LC_MU_CNT = C_MU_CNT;
  localparam [15:0] LC_PROBE_CNT = C_PROBE_CNT;  
  localparam [4:0] LC_COUNTER0_WIDTH = (C_NUM_COUNTER >= 3'b001) ? C_COUNTER_WIDTH : 5'b00000;
  localparam [4:0] LC_COUNTER1_WIDTH = (C_NUM_COUNTER >= 3'b010) ? C_COUNTER_WIDTH : 5'b00000;
  localparam [4:0] LC_COUNTER2_WIDTH = (C_NUM_COUNTER >= 3'b011) ? C_COUNTER_WIDTH : 5'b00000;
  localparam [4:0] LC_COUNTER3_WIDTH = (C_NUM_COUNTER >= 3'b100) ? C_COUNTER_WIDTH : 5'b00000;
  assign core_static_info_rd_en  = (opcode == STATIC_INFO)     ? rd_en_temp : 1'b0 ; //(reg_rd_en_int & reg_rd_en_async) : 1'b0; 
  assign static_status_burst_len = (rd_wr == LC_COMPLETE_READ) ? LC_STATIC_INFO_NUM_PACK : rdwr_burst_len[LC_STATIC_INFO_NUM_PACK-1:0];

   assign reg_static_info_arry[0] = {LC_MU_CNT, LC_PROBE_CNT};
   assign reg_static_info_arry[1] = {{(C_DATA_WIDTH-9){1'b0}}, C_HAS_DEEP_STORAGE, C_CC_TYPE, C_NUM_COUNTER[2:0], C_HAS_TRIG_OUT, C_HAS_TRIG_IN, C_HAS_STRG_QUAL, C_HAS_ADV_TRIG};
   assign reg_static_info_arry[2] = {{(C_AXIS_DATA_WIDTH-C_DEPTH_ADDR_WIDTH){1'b0}}, C_DEPTH_ADDR_WIDTH};
   assign reg_static_info_arry[3] = {{(C_DATA_WIDTH-20){1'b0}}, LC_COUNTER3_WIDTH, LC_COUNTER2_WIDTH, LC_COUNTER1_WIDTH, LC_COUNTER0_WIDTH};

  assign core_static_info_rd_data_o = reg_static_info_arry[mem_addr];
//---------------------------------------------------------------------------------
//-----Probe_Info_Packet-----------------------------------------------------------
    function integer wrd_cnt (input integer total_bit);
    begin
      if (total_bit%32 == 0)
      begin
        wrd_cnt = total_bit/32;
      end
      else
      begin
        wrd_cnt = (total_bit/32) + 1;
      end
    end
    endfunction

 /* localparam integer LC_MU_PROBE_NUM_WRD_CNT = wrd_cnt(C_MU_CNT*16);
  localparam integer LC_PROBE_WIDTH_WRD_CNT  = wrd_cnt(C_PROBE_CNT*16);
  localparam integer LC_MU_TYPE_WRD_CNT      = wrd_cnt(C_PROBE_CNT*2);
  localparam integer LC_DATA_TRIGGER_WRD_CNT = wrd_cnt(C_PROBE_CNT*2);
  localparam integer MU_WRD_CNT_BITS = clogb2(LC_MU_PROBE_NUM_WRD_CNT);
  localparam integer LC_PROBE_INFO_NUM_PACK = (LC_MU_PROBE_NUM_WRD_CNT + LC_PROBE_WIDTH_WRD_CNT + LC_MU_TYPE_WRD_CNT + LC_DATA_TRIGGER_WRD_CNT);
  localparam integer LC_BIT_NUM_PROBE_INFO_PACK = clogb2(LC_PROBE_INFO_NUM_PACK);
  wire [LC_BIT_NUM_PROBE_INFO_PACK-1 : 0] probe_info_burst_len;*/ 
  reg [C_DATA_WIDTH-1:0] probe_info_rd_data_o;
  wire probe_info_rd_en;
  reg [2:0] read_pointer_probe_info  = 3'b0;
  //reg [MU_WRD_CNT_BITS-1:0] cnt = {MU_WRD_CNT_BITS{1'b0}};
  reg [LC_GRT_PARAM-1:0] cnt = {LC_GRT_PARAM{1'b0}};
  //LC_PROBE_INFO_NUM_PACK

  
  assign probe_info_rd_en     = (opcode == PROBE_INFO) ? rd_en : 1'b0 ; //(reg_rd_en_int & reg_rd_en_async) : 1'b0; 
  assign probe_info_burst_len = (rd_wr == LC_COMPLETE_READ) ? LC_PROBE_INFO_NUM_PACK : rdwr_burst_len[LC_BIT_NUM_PROBE_INFO_PACK-1 : 0];

  always @(posedge M_AXIS_ACLK)
   begin 
     if (!M_AXIS_ARESETN)
      begin
        read_pointer_probe_info <= 'h0;
        cnt <= {LC_GRT_PARAM{1'b0}};
        probe_info_rd_data_o <= 'h0;
      end
     else
      begin
        if (probe_info_rd_en == 1'b1)
         begin
           if (M_AXIS_TLAST == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TREADY == 1'b1)
           begin
             read_pointer_probe_info <= 'h0;
             cnt <= {LC_GRT_PARAM{1'b0}};
           end
        // end
           else if ((read_pointer_probe_info == 'd0) && M_AXIS_TVALID == 1'b1 && M_AXIS_TREADY == 1'b1)
            begin
              //axis_tvalid <= 1'b1;
              if (LC_MU_PROBE_NUM_WRD_CNT <= 1)
               begin
                 probe_info_rd_data_o <= LC_MU_PROBE_NUM;
                 cnt <= 'd0;
                 read_pointer_probe_info <= read_pointer_probe_info + 'h1;
               end
              else
               begin
                 if (cnt < LC_MU_PROBE_NUM_WRD_CNT-1)
                  begin
                    cnt <= cnt + 'd1;
                    probe_info_rd_data_o <= LC_MU_PROBE_NUM[32*cnt +: 32];
                  end
                else
                 begin
                   cnt <= 'd0;
                   probe_info_rd_data_o <= LC_MU_PROBE_NUM[32*cnt +: 32];
                   read_pointer_probe_info <= read_pointer_probe_info + 'h1;
                 end
               end
            end
           else if ((read_pointer_probe_info == 'd1) && M_AXIS_TVALID == 1'b1 && M_AXIS_TREADY == 1'b1)
            begin
              //axis_tvalid <= 1'b1;
              if (LC_PROBE_WIDTH_WRD_CNT == 1)
               begin
                 probe_info_rd_data_o <= C_PROBE_WIDTH;
                 cnt <= 'd0;
                 read_pointer_probe_info <= read_pointer_probe_info + 'h1;
               end
              else
               begin
                 if (cnt < LC_PROBE_WIDTH_WRD_CNT-1)
                  begin
                    cnt <= cnt + 'd1;
                    probe_info_rd_data_o <= C_PROBE_WIDTH[32*cnt +: 32];
                  end
                 else
                  begin
                    cnt <= 'd0;
                    probe_info_rd_data_o <= C_PROBE_WIDTH[32*cnt +: 32];
                    read_pointer_probe_info <= read_pointer_probe_info + 'h1;
                  end
               end
            end
           else if ((read_pointer_probe_info == 'd2) && M_AXIS_TVALID == 1'b1 && M_AXIS_TREADY == 1'b1)
            begin
              //axis_tvalid <= 1'b1;
              if (LC_MU_TYPE_WRD_CNT == 1)
               begin
                 probe_info_rd_data_o <= C_MU_TYPE;
                 cnt <= 'd0;
                 read_pointer_probe_info <= read_pointer_probe_info + 'h1;
               end
              else
               begin
                 if (cnt < LC_MU_TYPE_WRD_CNT-1)
                  begin
                    cnt <= cnt + 'd1;
                    probe_info_rd_data_o <= C_MU_TYPE[32*cnt +: 32];
                  end
                 else
                  begin
                    cnt <= 'd0;
                    probe_info_rd_data_o <= C_MU_TYPE[32*cnt +: 32];
                    read_pointer_probe_info <= read_pointer_probe_info + 'h1;
                  end
               end
            end
           else if ((read_pointer_probe_info == 'd3) && M_AXIS_TVALID == 1'b1 && M_AXIS_TREADY == 1'b1)
            begin
              //axis_tvalid <= 1'b1;
              if (LC_DATA_TRIGGER_WRD_CNT == 1)
               begin
                 probe_info_rd_data_o <= C_DATA_TRIGGER;
                 cnt <= 'd0;
                 //axis_tlast <= 1'b1;
                 read_pointer_probe_info <= read_pointer_probe_info + 'h1;
               end
              else
               begin
                 if (cnt < LC_DATA_TRIGGER_WRD_CNT-1)
                  begin
                    cnt <= cnt + 'd1;
                    probe_info_rd_data_o <= C_DATA_TRIGGER[32*cnt +: 32];
                  end
                 else
                  begin
                    cnt <= 'd0;
                    probe_info_rd_data_o <= C_DATA_TRIGGER[32*cnt +: 32];
                    //axis_tlast <= 1'b1;
                    read_pointer_probe_info <= read_pointer_probe_info + 'h1;
                  end
               end 
            end
          end
          else
          begin
             read_pointer_probe_info <= 'h0;
             cnt <= {MU_WRD_CNT_BITS{1'b0}};
          end
      end
   end
//---------------------------------------------------------------------------------
//------ MU reg inst ----------------------------------------------
  wire mu_done_serial_op, mu_start_serial_op_o, mu_serial_data_o; 
  wire mu_rd_en, mu_wr_en;
  wire [$clog2(LC_NUM_32_BIT_REG)-1:0] mu_burst_len;
  
  assign mu_rd_en = (opcode == MU_CONFIG_1K || opcode == CC_CONFIG || opcode == TC_CONFIG || opcode == SQC_CONFIG) ? rd_en_temp : 1'b0 ; //(reg_rd_en_int & reg_rd_en_async) : 1'b0;
  assign mu_wr_en = (opcode == MU_CONFIG_1K || opcode == CC_CONFIG || opcode == TC_CONFIG || opcode == SQC_CONFIG) ? reg_wr_en : 1'b0;

  assign mu_burst_len = ((rd_wr == LC_COMPLETE_READ || rd_wr == LC_COMPLETE_WRITE) && (opcode == MU_CONFIG_1K || opcode == CC_CONFIG || opcode == TC_CONFIG || opcode == SQC_CONFIG)) ? LC_NUM_32_BIT_REG : rdwr_burst_len[$clog2(LC_NUM_32_BIT_REG)-1:0];

  reg [C_AXIS_DATA_WIDTH-1:0]                 data_int                = 'h0;
  reg                                         start_shift             = 1'b0;
  reg [1:0]                                   next_state;
  reg                                         cfg_en_int;
//  reg                                         mu_shift_done;
  reg [31:0]                                  cfg_data;
  reg [6:0]                                   count;
  always @ (posedge S_AXIS_ACLK)
  begin
    if (S_AXIS_ARESETN==1'b0)
      data_int <= 'h0;
    else
    begin
      if (mu_wr_en == 1'b1 && S_AXIS_TREADY && S_AXIS_TVALID)
      begin
        start_shift <= 1'b1;
        data_int <= S_AXIS_TDATA;
      end
      else
      begin
        start_shift <= 1'b0;
      end
    end
  end

  always @ (posedge S_AXIS_ACLK)
  begin
    if (!S_AXIS_ARESETN)
    begin
      next_state <= 3'b000;
      cfg_en_int <= 1'b0;
      mu_shift_done <= 1'b1;
      cfg_data <= 'h0;
      count <= 'h0;
    end
    else
    begin
      case (next_state)
        2'b00: begin
                 if (mu_wr_en == 1'b1)
                 begin
                   mu_shift_done <= 1'b0;
                 end
                 if (start_shift == 1'b1)
                 begin
                   next_state <= 3'b001;
                 end
                 else
                 begin
                   next_state <= 3'b000;
                 end
               end
        2'b01: begin
                 cfg_data <= data_int;
                 next_state <= 3'b010;
                 cfg_en_int <= 1'b1;
                 count <= 'h0;
               end
        2'b10: begin
                 if (count < 'd31)
                 begin
                   count <= count + 'h1;
                   cfg_data <= {1'b0,cfg_data[31:1]};
                   next_state <= 3'b010;
                 end
                 else
                 begin
                   mu_shift_done <= 1'b1;
                   cfg_en_int <= 1'b0;
                   next_state <= 3'b000;
                 end
               end
        default: begin
                   next_state <= next_state;
                 end
      endcase
    end
  end

  assign cfg_en_o = cfg_en_int;
  assign cfg_data_o = cfg_data[0];
  assign wr_mu_config_o = 1'b1 ? (opcode == MU_CONFIG_1K) : 1'b0;
  assign wr_cc_config_o = 1'b1 ? (opcode == CC_CONFIG) : 1'b0;
  assign wr_tc_config_o = 1'b1 ? (opcode == TC_CONFIG) : 1'b0;
  assign wr_sqc_config_o = 1'b1 ? (opcode == SQC_CONFIG) : 1'b0;
//********MU data************************
//-----------generation of last and valid-----------------------------
 localparam integer LC_M_AXIS_BURST_LEN_WIDTH = 16;
 wire en_m_axis_tdata; 
 wire test_axis_tvalid;
 wire test_axis_tlast;
 wire [LC_M_AXIS_BURST_LEN_WIDTH-1:0] m_axis_burst_len;
 assign en_m_axis_tdata  = (opcode == TRACE_DATA) ? 1'b0 : rd_en_temp | (M_AXIS_TLAST & M_AXIS_TREADY & M_AXIS_TVALID);//(reg_rd_en_int & reg_rd_en_async);
 assign m_axis_burst_len = (opcode == CORE_INFO) ? core_detect_burst_len : (opcode == DYNAMIC_STATUS) ? dynamic_status_burst_len : (opcode == PROBE_INFO) ? probe_info_burst_len : (opcode == STATIC_INFO) ? static_status_burst_len : (opcode == CORE_CONFIG) ? core_burst_len : (opcode == MU_CONFIG_1K) ? mu_burst_len : {LC_M_AXIS_BURST_LEN_WIDTH{1'b0}}; //: (opcode == TRACE_DATA) ? (td_burst_len) 

 
axis_ila_intf_v1_0_0_axis_valid_last_gen #(
   .C_BURST_LEN_WIDTH(LC_M_AXIS_BURST_LEN_WIDTH)
 ) u_axis_valid_last_gen
 (
   .clk(M_AXIS_ACLK),
   .rst_n(M_AXIS_ARESETN),
   .axis_ready(M_AXIS_TREADY),
   .burst_len(m_axis_burst_len),
   .en_transfer(en_m_axis_tdata),
   .axis_tvalid(test_axis_tvalid),
   .axis_tlast(test_axis_tlast)
 );

  //reg [C_DATA_WIDTH-1:0] axis_tdata_reg;
  wire [C_DATA_WIDTH-1:0] axis_tdata_reg;
  wire [C_DATA_WIDTH-1:0] axis_tdata_td_sig;
  reg axis_valid_td = 1'b0;
  reg axis_last_td = 1'b0;

  assign axis_tdata_reg = (opcode == CORE_INFO) ? core_detect_rd_data_o : (opcode == STATIC_INFO) ? core_static_info_rd_data_o : (opcode == PROBE_INFO) ? probe_info_rd_data_o : (opcode == DYNAMIC_STATUS) ? dynamic_status_rd_data_o : (opcode == CORE_CONFIG) ? core_rd_data_o : (opcode == MU_CONFIG_1K) ? mu_rd_data_o : (opcode == TRACE_DATA) ? data_word_out_i : {C_DATA_WIDTH{1'b0}};
   
/*   always @*
    begin
      if (!S_AXIS_ARESETN)
       begin
          axis_tdata_reg <= {C_DATA_WIDTH{1'b0}};
       end
      else
       begin
         case(opcode)
           CORE_INFO      : axis_tdata_reg = core_detect_rd_data_o;
           STATIC_INFO    : axis_tdata_reg = core_static_info_rd_data_o;
           PROBE_INFO     : axis_tdata_reg = probe_info_rd_data_o;
           DYNAMIC_STATUS : axis_tdata_reg = dynamic_status_rd_data_o;
           CORE_CONFIG    : axis_tdata_reg = core_rd_data_o;
           MU_CONFIG_1K      : axis_tdata_reg = mu_rd_data_o;
           TRACE_DATA     : axis_tdata_reg = data_word_out_i; //trace_rd_data_i;
           default        : axis_tdata_reg = {C_DATA_WIDTH{1'b0}};
         endcase
       end
    end*/
 
// assign en_trace_rd = (opcode == TRACE_DATA) ? reg_rd_en_int : 1'b0;
 assign en_trace_rd = (opcode == TRACE_DATA) ? ((rd_en & M_AXIS_TREADY) & !test_axis_tlast) : 1'b0;
 
/*    trace_data_addr_gen_tx_data #(
       .C_M_AXIS_TDATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
       .C_DATA_WIDTH        (C_DATA_WIDTH        ),
       .C_OPCODE_WIDTH      (LC_OPCODE_WIDTH),
       .C_TD_OPCODE         (TRACE_DATA),
       .C_RD_WRD_CNT_WIDTH     (C_RD_WRD_CNT_WIDTH     )
    ) u_trace_data_addr_gen
    ( 
       .td_start_addr(rdwr_addr_sig[C_RD_WRD_CNT_WIDTH-1:0]),
       .td_burst_len(rdwr_burst_len[C_RD_WRD_CNT_WIDTH-1:0]), ////rdwr_addr_sig rdwr_burst_len
       .td_data_i(trace_rd_data_i),
       .en_trace_rd(en_trace_rd),
       .tx_done(trace_rd_done),
       .trace_rd_addr_o(trace_rd_addr_o),
       .axis_tdata_td(axis_tdata_td_sig),
       .axis_valid_td(axis_valid_td),
       .axis_last_td(axis_last_td),
       .m_axis_aclk(M_AXIS_ACLK),
       .m_axis_aresetn(M_AXIS_ARESETN),
       .m_axis_tready(M_AXIS_TREADY),
       .axis_tvalid(test_axis_tvalid)
        );*/
  reg axis_tvalid_temp  = 1'b0;
  reg m_axis_tready_dly = 1'b0;
  reg m_axis_tvalid_dly = 1'b0;
  reg axis_tlast_temp   = 1'b0;

  always @(posedge M_AXIS_ACLK)
   begin
     if (M_AXIS_ARESETN == 1'b0)
      begin
        rd_tdata               <= {C_DATA_WIDTH{1'b0}};
        axis_tdata_reg_dly     <= {C_DATA_WIDTH{1'b0}};
        state_m_axis_tdata     <= SEND_OPCODE;
        state_m_axis_tdata_dly <= SEND_OPCODE;
        axis_tvalid_temp       <= 1'b0;
        m_axis_tready_dly      <= 1'b0;
        m_axis_tvalid_dly      <= 1'b0;
        mem_addr               <= rdwr_addr_sig[LC_CORE_DECT_NUM_PACK-1:0];
        status_cnt_burst_len   <= {LC_CORE_DECT_NUM_PACK{1'b0}};                     
        axis_tlast_temp        <= 1'b0;
      end
     else
      begin  
        state_m_axis_tdata_dly <= state_m_axis_tdata;
        m_axis_tready_dly      <= M_AXIS_TREADY;
        m_axis_tvalid_dly      <= M_AXIS_TVALID;
        case(state_m_axis_tdata)
          SEND_OPCODE:
           begin
             //if(en_m_axis_tdata == 1'b1)
             status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};                     
             axis_tlast_temp <= 1'b0;
             if(rd_en == 1'b1)
              begin
                 rd_tdata <= {{4'b0}, clk_status, {14'b0}, opcode};
                 //tvalid_opcode   <= 1'b1;                
                 axis_tvalid_temp <= 1'b1;
                 mem_addr        <= rdwr_addr_sig[LC_CORE_DECT_NUM_PACK-1:0];
                 if (M_AXIS_TREADY == 1'b1)
                  begin
                    state_m_axis_tdata <= SEND_1DATA;
                    send_opcode_sig <= 1'b1;
                    //mem_addr        <= rdwr_addr_sig[LC_CORE_DECT_NUM_PACK-1:0];
                    if (axis_tvalid_temp == 1'b1)
                     begin
                       axis_tvalid_temp   <= 1'b0;
                     end
                    else
                     begin
                       axis_tvalid_temp   <= 1'b1;
                     end

                    if (tvalid_opcode == 1'b1)
                     begin
                       tvalid_opcode   <= 1'b0;
                     end
                    else
                     begin
                       tvalid_opcode   <= 1'b1;
                     end
                  end
                 else
                  begin
                    tvalid_opcode    <= 1'b1;
                    //axis_tvalid_temp <= 1'b1;
                  end
              end
             else
              begin
                state_m_axis_tdata <= SEND_OPCODE;
                send_opcode_sig <= 1'b0;
                tvalid_opcode   <= 1'b0;
                axis_tvalid_temp <= 1'b0;
                status_cnt_burst_len <= {LC_CORE_DECT_NUM_PACK{1'b0}};                     
              end
           end
          SEND_1DATA:
           begin
             tvalid_opcode   <= 1'b0;
             if(pack_exec_state == READ)
              begin
                rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
                //------Logic for mem_addr------------------------------------
		if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TLAST == 1'b1) // && M_AXIS_TVALID == 1'b1)
                 begin
                   mem_addr <= {LC_CORE_DECT_NUM_PACK{1'b0}};
                 end
		else if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1) // && M_AXIS_TVALID == 1'b1)
                 begin
                   if ((status_cnt_burst_len < status_burst_len) && tvalid_opcode == 1'b0)
                    begin
                      mem_addr <= mem_addr + 1;
                      status_cnt_burst_len <= status_cnt_burst_len + 1;
                    end
                 end
                //-------------------------------------------------------------
                //-----Logic for axis_tlast-----------------------------------
                if (status_cnt_burst_len >= (status_burst_len-1))
                 begin
		   if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TLAST == 1'b1)
                    begin
                     axis_tlast_temp <= 1'b0;
                    end
                   else
                    begin
                     axis_tlast_temp <= 1'b1;
                    end 
                 end
                else
                 begin
                   axis_tlast_temp <= 1'b0;
                 end
                //-------------------------------------------------------------
                //-----Logic for axis_tvalid-----------------------------------
		if (M_AXIS_TREADY == 1'b1 && m_axis_tready_dly == 1'b0) // && M_AXIS_TVALID == 1'b1)
                 begin
                   axis_tvalid_temp <= 1'b0;
                 end
                else
                 begin
                   if(M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TLAST == 1'b1) 
                    begin
                      axis_tvalid_temp <= 1'b0;
                    end
                   else
                    begin
                      if (M_AXIS_TREADY == 1'b1 & m_axis_tvalid_dly == 1'b0 && M_AXIS_TVALID == 1'b1)
                       begin 
                         axis_tvalid_temp <= 1'b0;
                       end
                      else
                       begin
                         axis_tvalid_temp <= 1'b1;
                       end
                    end
                 end
                //-------------------------------------------------------------
                //-----Logic to state change ---------------------------------
                if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TLAST == 1'b1)
                 begin
                   state_m_axis_tdata <= SEND_OPCODE;                
                 end
                else
                 begin
                   state_m_axis_tdata <= SEND_1DATA;                
                 end
                //-------------------------------------------------------------
		//if (M_AXIS_TREADY == 1'b1) // && M_AXIS_TVALID == 1'b1)
                // begin
                //   state_m_axis_tdata <= SEND_DATA;                
                //   //rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
                //    if (axis_tvalid_temp == 1'b1)
                //     begin
                //       axis_tvalid_temp   <= 1'b0;
                //     end
                //    else
                //     begin
                //       axis_tvalid_temp   <= 1'b1;
                //     end
                // end
                //else
                // begin
                //   state_m_axis_tdata <= SEND_1DATA;                
                //   axis_tvalid_temp   <= 1'b1;
                // end
              end
             else
              begin
                state_m_axis_tdata <= SEND_OPCODE;
                axis_tlast_temp <= 1'b0;
              end
           end
          SEND_DATA:
           begin
             axis_tvalid_temp <= 1'b1;
             rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
             if(pack_exec_state == READ)
              begin
		if (M_AXIS_TREADY == 1'b1) // && M_AXIS_TVALID == 1'b1)
                 begin
                   state_m_axis_tdata <= SEND_DATA;                
                   //rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
                   end
                else
                 begin
                   state_m_axis_tdata <= WAIT_TREADY;                
                 end
              end
             else
              begin
                state_m_axis_tdata <= SEND_OPCODE;
              end              
             if(state_m_axis_tdata_dly == SEND_OPCODE)
              begin
                //rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
              end
              send_opcode_sig <= 1'b1;
              tvalid_opcode   <= 1'b0;
           end
          WAIT_TREADY:
           begin
             if(pack_exec_state == READ)
              begin
                rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
                if (M_AXIS_TREADY == 1'b1)
                 begin
                   state_m_axis_tdata <= SEND_1DATA;
                   send_opcode_sig <= 1'b1;
                  // if (axis_tvalid_temp == 1'b1)
                  //  begin
                      axis_tvalid_temp   <= 1'b0;
                  //  end
                  // else
                  //  begin
                  //    axis_tvalid_temp   <= 1'b1;
                  //  end
                 end
                else
                 begin
                   axis_tvalid_temp   <= 1'b1;
                 end
                //------Logic for mem_addr------------------------------------
		if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TLAST == 1'b1) // && M_AXIS_TVALID == 1'b1)
                 begin
                   mem_addr <= {LC_CORE_DECT_NUM_PACK{1'b0}};
                 end
		else if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1) // && M_AXIS_TVALID == 1'b1)
                 begin
                   if ((status_cnt_burst_len < status_burst_len) && tvalid_opcode == 1'b0)
                    begin
                      mem_addr <= mem_addr + 1;
                      status_cnt_burst_len <= status_cnt_burst_len + 1;
                    end
                 end
                //-------------------------------------------------------------
                //-----Logic for axis_tlast-----------------------------------
                if (status_cnt_burst_len >= (status_burst_len-1))
                 begin
		   if (M_AXIS_TREADY == 1'b1 && M_AXIS_TVALID == 1'b1 && M_AXIS_TLAST == 1'b1)
                    begin
                     axis_tlast_temp <= 1'b0;
                    end
                   else
                    begin
                     axis_tlast_temp <= 1'b1;
                    end 
                 end
                else
                 begin
                   axis_tlast_temp <= 1'b0;
                 end
                //-------------------------------------------------------------
              end
             else
              begin
                axis_tlast_temp  <= 1'b0;
                axis_tvalid_temp <= 1'b0;
              end
             //-----------Older code
             //if(pack_exec_state == READ)
             // begin
	     //   if (M_AXIS_TREADY == 1'b1)// && M_AXIS_TVALID == 1'b1)
             //    begin
             //      state_m_axis_tdata <= SEND_DATA;                
             //      rd_tdata <= axis_tdata_reg;//axis_tdata_reg_dly;
             //      axis_tvalid_temp <= 1'b0;
             //    end
             //   else
             //    begin
             //      state_m_axis_tdata <= WAIT_TREADY;                
             //      axis_tvalid_temp <= 1'b1;
             //    end
             // end
             //else
             // begin
             //   state_m_axis_tdata <= SEND_OPCODE;
             //   axis_tvalid_temp <= 1'b0;
             // end
             // send_opcode_sig <= 1'b1;
             // tvalid_opcode   <= 1'b0;
             //--older code end------------------------------------
           end
          default:
           begin
             state_m_axis_tdata <= SEND_OPCODE;
             send_opcode_sig    <= 1'b0;
             tvalid_opcode      <= 1'b0;
             axis_tvalid_temp <= 1'b0;
           end
         endcase
      end
   end

  assign td_burst_len = (opcode == TRACE_DATA) ? rdwr_burst_len : 'h0;
  assign td_burst_len_temp = td_burst_len - 1;

  reg [2:0] mst_exec_state = 3'b000;
  reg [C_AXIS_DATA_WIDTH-1:0] stream_data_out = {C_AXIS_DATA_WIDTH{1'b0}};
  always @(posedge M_AXIS_ACLK)
   begin
     if (M_AXIS_ARESETN == 1'b0)
      begin
        axis_last_td    <= 1'b0;
	mst_exec_state  <= 3'b000;
        stream_data_out <= {C_AXIS_DATA_WIDTH{1'b0}};
        read_addr_reset_int <= 1'b0;
        read_data_en_o <= 1'b0;
      end
     else
      begin
        case (mst_exec_state)
        3'b000: begin
		   if (opcode == TRACE_DATA && rd_en == 1'b1)
	            begin
                      stream_data_out <= {{4'b0}, clk_status, {14'b0}, opcode};
                      axis_valid_td   <= 1'b1;
                      if (td_burst_len == 'h0)
                       begin
                         axis_last_td    <= 1'b1;
                         mst_exec_state <= 3'b100;
                       end
                      else
                       begin
                         axis_last_td    <= 1'b0;
                         mst_exec_state <= 3'b001;	            
                       end
                    end
                   else
                    begin
                      mst_exec_state <= 3'b000;	            
                      axis_valid_td   <= 1'b0;
                    end
                    read_data_en_o <= 1'b0;
                 end
        3'b001: begin
                  if (axis_valid_td == 1'b1 && M_AXIS_TREADY == 1'b1)
                   begin
                     axis_valid_td <= 1'b0;
                     mst_exec_state <= 3'b110;
                     read_addr_reset_int <= 1'b1;
                   end
                end
        3'b010: begin
                  read_addr_reset_int <= 1'b0;
                  read_data_en_o <= 1'b1;
                  if (td_burst_len == 'h1)
                   begin
                     axis_last_td <= 1'b1;
                   end
                  else
                   begin
                     axis_last_td <= 1'b0;
                   end
                   mst_exec_state <= 3'b011;
                 end
         3'b011: begin
                   read_data_en_o <= 1'b0;
                   if (data_out_en_i == 1'b1)
                   begin
                     if (trace_rd_wrd_cnt_i == td_burst_len_temp)
                      begin
                        axis_last_td <= 1'b1;
                      end
                     else
                      begin
                        axis_last_td <= 1'b0;
                      end
                     stream_data_out <= data_word_out_i;
                     axis_valid_td <= 1'b1;
                     mst_exec_state <= 3'b100;
                   end
                 end
        3'b100: begin
                  if (opcode == TRACE_DATA && rd_en == 1'b1 && axis_last_td == 1'b1) 
	           begin
		     if (M_AXIS_TVALID & M_AXIS_TLAST & M_AXIS_TREADY)
                      begin
                        mst_exec_state <= 3'b101;
                        axis_last_td <= 1'b0;
                        axis_valid_td <= 1'b0;
                      end
                     else 
                      begin
                        mst_exec_state <= 3'b100;                        
                        axis_last_td <= 1'b1;
                      end
                   end
                  else
                   begin
                     if (M_AXIS_TVALID & M_AXIS_TREADY)
                     begin
                       axis_valid_td <= 1'b0;
                       mst_exec_state <= 3'b010;
                     end
                   end
                  read_data_en_o <= 1'b0;
                end
        3'b101: begin
                  if (rd_en == 1'b0)
                   begin
                     mst_exec_state <= 3'b000;
                   end
                  else
                   begin
                     mst_exec_state <= 3'b101;
                   end
                  axis_valid_td <= 1'b0;
                  axis_last_td <= 1'b0;
                  read_data_en_o <= 1'b0;
                 end
	    3'b110: begin
		          if (reset_out_ack_i == 1'b1)
				  begin
					mst_exec_state <= 3'b010;
				  end
				  axis_valid_td <= 1'b0;
				  read_addr_reset_int <= 1'b0;
                 end
        default: begin
                   mst_exec_state <= 3'b000;
                   axis_valid_td  <= 1'b0;
                   axis_last_td   <= 1'b0;                   
                   read_data_en_o <= 1'b0;
                 end
        endcase
/*
        //-- TLAST for TRACE_DATA-------------------
        if (M_AXIS_TVALID & M_AXIS_TLAST & M_AXIS_TREADY)
         begin
           axis_last_td <= 1'b0;
         end
        else 
         begin
	   if(data_out_en_i == 1'b1)
            begin
              if (trace_rd_addr_i == td_burst_len - 1)
               begin
                 axis_last_td <= 1'b1;
               end
              else
               begin
                 axis_last_td <= 1'b0;
               end
            end
         end
         //----------------------------------------------------
         //-- TVALID for TRACE_DATA----------------------------
         if (data_out_en_i == 1'b1)
          begin
	    axis_valid_td <= 1'b1;
          end
         else if (M_AXIS_TVALID == 1'b1 && M_AXIS_TREADY == 1'b1)
          begin
	    axis_valid_td <= 1'b0;
          end
         //----------------------------------------------------
      */
      end
   end

   wire tsm_config_bram_addr_bitwise;
   reg tsm_config_bram_addr_bitwise_reg;
   reg [1:0] sig_cnt_switch = 2'b00;
   assign tsm_config_bram_addr_bitwise = &config_fsm_addr_reg;

   always @(posedge S_AXIS_ACLK)
    begin
      if (!S_AXIS_ARESETN)
       begin
         tsm_config_bram_addr_bitwise_reg <= 1'b0;
       end
      else
       begin
         if (S_AXIS_TVALID && S_AXIS_TREADY)
         begin
           tsm_config_bram_addr_bitwise_reg <= tsm_config_bram_addr_bitwise;
         end
       end
    end

   always @(posedge S_AXIS_ACLK)
    begin
      if (!S_AXIS_ARESETN)
       begin
         config_fsm_data_reg  <= 'b0;
         config_fsm_addr_reg  <= 'b0;
         config_fsm_en_rb_reg <= 'b0;
         config_fsm_en_reg    <= 'b0;
         config_fsm_we_reg    <= 'b0;
         sig_cnt_switch       <= 'b0;
         counter01_config     <= 'b0;
         counter23_config     <= 'b0;
         cnt_config_en23_reg  <= 2'b00;
         cnt_config_en01_reg  <= 2'b00;
       end
      else
       begin
         if (opcode == TSM_CONFIG)
          begin
            if (tsm_config_bram_addr_bitwise_reg == 1'b0 )
             begin
               if (S_AXIS_TVALID && S_AXIS_TREADY && wr_en)
                begin
                  if (tsm_config_bram_addr_bitwise == 1'b0)
                   begin
                     config_fsm_addr_reg <= config_fsm_addr_reg + 1;
                   end
                  config_fsm_data_reg <= S_AXIS_TDATA;
                  config_fsm_we_reg    <= 1'b1;
                  config_fsm_en_reg    <= 1'b1;
                  config_fsm_en_rb_reg <= 1'b0;
                end
               else
                begin
                  config_fsm_we_reg    <= 1'b0;
                  config_fsm_en_reg    <= 1'b0;
                  config_fsm_en_rb_reg <= 1'b0;
                end                
                sig_cnt_switch       <= 2'b00;
                counter01_config     <= 'b0;
                counter23_config     <= 'b0;
                cnt_config_en23_reg  <= 2'b00;
                cnt_config_en01_reg  <= 2'b00;
             end
            else
             begin
               if (S_AXIS_TVALID && S_AXIS_TREADY && wr_en)
                begin
                  config_fsm_we_reg    <= 1'b0;
                  config_fsm_en_reg    <= 1'b0;
                  config_fsm_en_rb_reg <= 1'b0;
                  if (sig_cnt_switch == 2'b00)
                   begin
                     counter01_config <= S_AXIS_TDATA;
                     sig_cnt_switch   <= 2'b01;
                     cnt_config_en01_reg <= 2'b11;
                   end
                  else if (sig_cnt_switch == 2'b01)
                   begin
                     counter23_config <= S_AXIS_TDATA;
                     sig_cnt_switch   <= 2'b11;
                     cnt_config_en23_reg <= 2'b11;
                   end
                end
               else if (M_AXIS_TVALID && M_AXIS_TREADY && rd_en)
                begin                  
                  config_fsm_we_reg    <= 1'b0;
                  config_fsm_en_reg    <= 1'b1;
                  config_fsm_en_rb_reg <= 1'b1;
                end
               else 
                begin
                  config_fsm_we_reg    <= 1'b0;
                  config_fsm_en_reg    <= 1'b0;
                  config_fsm_en_rb_reg <= 1'b0;
                end
             end
          end
         else
          begin
            config_fsm_data_reg  <= 'b0;
            config_fsm_addr_reg  <= 'b0;
            config_fsm_en_rb_reg <= 'b0;
            config_fsm_en_reg    <= 'b0;
            config_fsm_we_reg    <= 'b0;
            cnt_config_en23_reg  <= 2'b00;
            cnt_config_en01_reg  <= 2'b00;
          end
       end
    end

    assign config_fsm_data_o  = config_fsm_data_reg;
    assign config_fsm_addr_o  = {{(17-LC_TSM_BRAM_ADDR_BITS){1'b0}},config_fsm_addr_reg};
    assign config_fsm_en_rb_o = config_fsm_en_rb_reg;
    assign config_fsm_en_o    = config_fsm_en_reg;
    assign config_fsm_we_o    = config_fsm_we_reg;

//   assign M_AXIS_TVALID = (opcode == TRACE_DATA) ? data_out_en_i : test_axis_tvalid;
   assign M_AXIS_TVALID = (opcode == TRACE_DATA) ? axis_valid_td : axis_tvalid_temp ; //((test_axis_tvalid && axis_tvalid_temp) || tvalid_opcode);
   assign M_AXIS_TLAST  = (opcode == TRACE_DATA) ? axis_last_td  : axis_tlast_temp; //test_axis_tlast;
   //assign M_AXIS_TDATA  = (opcode == TRACE_DATA) ? stream_data_out : (tvalid_opcode == 1'b1) ? rd_tdata : axis_tdata_reg; //axis_tdata_reg;        
   assign M_AXIS_TDATA  = (opcode == TRACE_DATA) ? stream_data_out : rd_tdata ; //axis_tdata_reg;        
   assign read_addr_reset_o = read_addr_reset_int;
endmodule


module axis_ila_intf_v1_0_0_axis_valid_last_gen #(
   parameter integer C_BURST_LEN_WIDTH = 16 
 )
 (
   input wire clk,
   input wire rst_n,
   input wire axis_ready,
   input wire [C_BURST_LEN_WIDTH-1:0] burst_len,
   input wire en_transfer,
   output wire axis_tvalid,
   output wire axis_tlast
 );
    
//  localparam [1:0] LOAD_CNT_INIT_VALUE = 2'b00,
//                   CHECK_BURST_LEN     = 2'b01;
                   
//  reg [1:0] state_axis_valid_last = LOAD_CNT_INIT_VALUE;
  
  reg [C_BURST_LEN_WIDTH:0] cnt_valid = {C_BURST_LEN_WIDTH{1'b0}},
                            cnt_last  = {C_BURST_LEN_WIDTH{1'b0}};

  wire [C_BURST_LEN_WIDTH:0] cnt_burst_len,
                             ones_comp_burst_len; //9'h100;
             
  wire en_transfer_edge;
  reg en_transfer_inv_dly = 1'b0;
   
  assign cnt_burst_len = {1'b0, burst_len[C_BURST_LEN_WIDTH-1:0]};
  assign ones_comp_burst_len = ~cnt_burst_len;

   always @(posedge clk)
    begin
      en_transfer_inv_dly <= en_transfer;
    end
    
    assign en_transfer_edge = en_transfer & ~en_transfer_inv_dly;
    
//  always @(posedge clk)
//   begin
//     if (rst_n == 1'b0)
//      begin
//        state_axis_valid_last <= LOAD_CNT_INIT_VALUE;
//      end
//     else
//      begin
//        case(state_axis_valid_last)
//      end
//   end

//axis_tvalid
localparam [1:0] LOAD_CNT = 2'b01,
                 INC_CNT  = 2'b10,
                 WAIT_CNT = 2'b11;
                 
 reg [1:0] state_valid, state_last = LOAD_CNT;
  
  always @(posedge clk)
   begin
     if (rst_n == 1'b0)
      begin
        cnt_valid <= {C_BURST_LEN_WIDTH{1'b0}};
        state_valid <= LOAD_CNT;
      end
     else
      begin
        case(state_valid)
          LOAD_CNT:
           begin
             if (en_transfer == 1'b1)
              begin
                cnt_valid <= {1'b1, ~burst_len} + 1;
                state_valid <= INC_CNT;
              end
             else
              begin
                state_valid <= LOAD_CNT;
                cnt_valid <= {C_BURST_LEN_WIDTH{1'b0}};
              end
           end
          INC_CNT:
           begin
             if (en_transfer == 1'b1)
              begin
                if (cnt_valid[C_BURST_LEN_WIDTH] == 1'b1)
                 begin
//                   state_valid <= INC_CNT;
                   cnt_valid <= cnt_valid + 1;
                 end
//                else
//                 begin
//                   state_valid <= LOAD_CNT;
//                 end
               end
               if (cnt_valid[C_BURST_LEN_WIDTH] == 1'b1)
                 begin
                   state_valid <= INC_CNT;
                 end
                else
                 begin
                   state_valid <= LOAD_CNT;
                 end
           end
           default: 
             begin
               state_valid <= LOAD_CNT;
             end
         endcase
        
//        if (en_transfer_edge == 1'b1)
//                         begin
//                           cnt_valid <= {1'b1, ~burst_len} + 1;
//                         end
//                        else
//        else if (cnt_valid[C_BURST_LEN_WIDTH] == 1'b1 && axis_ready == 1'b1)
//         begin
//           cnt_valid <= cnt_valid + 1;
//         end
      end
   end
   assign axis_tvalid = cnt_valid[C_BURST_LEN_WIDTH];
   
//axis_tlast
  always @(posedge clk)
   begin
     if (rst_n == 1'b0)
      begin
        cnt_last <= {1'b1, {C_BURST_LEN_WIDTH-1{1'b0}}};
        state_last <= LOAD_CNT;
      end
     else
      begin
        case(state_last)
          LOAD_CNT:
           begin
             if (en_transfer == 1'b1)
              begin
                    cnt_last <= {1'b0, burst_len} - 2;
                    state_last <= INC_CNT;
              end
             else
              begin
                state_last <= LOAD_CNT;
                cnt_last <= {C_BURST_LEN_WIDTH{1'b0}};
              end
           end
          INC_CNT:
           begin
             if (en_transfer == 1'b1)
              begin
                if(cnt_last[C_BURST_LEN_WIDTH] == 1'b0)
                 begin
                   state_last <= INC_CNT;
                   cnt_last <= cnt_last - 1;
                 end
                else
                 begin
                   state_last <= WAIT_CNT;
                 end
               end
           end
          WAIT_CNT:
           begin
             if(en_transfer == 1'b0)
              begin
                   state_last <= LOAD_CNT;
                cnt_last   <= {C_BURST_LEN_WIDTH{1'b0}};
                 end
             else
              begin
                state_last <= WAIT_CNT;
               end
           end
          default: 
           begin
             state_last <= LOAD_CNT;
           end
        endcase
//        if (en_transfer_edge == 1'b1)
//         begin
//           cnt_last <= {1'b0, burst_len} - 2;
//         end
//        else if (cnt_last[C_BURST_LEN_WIDTH] == 1'b0  && axis_ready == 1'b1)
////        else if (axis_ready == 1'b1)
//         begin
//           cnt_last <= cnt_last - 1;
//         end
//         if((cnt_last-1) == {C_BURST_LEN_WIDTH{1'b0}})
//           axis_tlast <= 1'b1;
//         else
//           axis_tlast <= 1'b0;          
      end
   end   
   assign axis_tlast = cnt_last[C_BURST_LEN_WIDTH];
endmodule


module axis_ila_intf_v1_0_0_reg_array #(
   parameter [0:0]   C_EN_STAT        = 1'b0,
   parameter [0:0]   C_EN_CTL         = 1'b1,
   parameter integer C_NUM_REGS       = 3,
   parameter integer C_NUM_REGS_ICLK  = 3,
   parameter integer C_DATA_WIDTH     = 32,
   parameter [0:0]   C_EN_SERIAL_OP   = 1'b0,
   parameter [0:0]   C_EN_PARALLEL_OP = 1'b1
  ) 
  (
   input wire ila_clk_i,
   input wire clk_i,
   input wire rst_i,
   input wire [C_DATA_WIDTH-1:0] data_i,
   input wire [(C_DATA_WIDTH*C_NUM_REGS)-1:0] full_data_i,
   input wire [C_NUM_REGS-1:0] addr_i,
   input wire [C_NUM_REGS-1:0] burst_len,
   input wire rd_en_i,
   input wire wr_en_i,
   input wire rd_en_serial_i,
   output reg [C_DATA_WIDTH-1:0] data_o = {C_DATA_WIDTH{1'b0}},
   output wire [(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0] full_data_iclk_o,
   output wire [(C_DATA_WIDTH*(C_NUM_REGS-C_NUM_REGS_ICLK))-1:0] full_data_clk_o,
   output wire arm_in,
   output wire halt_in,
   output wire tasen_in,
   output reg done_o,
   output wire done_iclk_o,
   output reg done_serial_op,
   output wire start_serial_op_o,
   output wire serial_data_o
  );
    
    reg [C_DATA_WIDTH-1:0] data_dly = {C_DATA_WIDTH{1'b0}};
    //reg [C_DATA_WIDTH-1:0] int_mem [C_NUM_REGS-1:0];
    reg [C_NUM_REGS-1:0] mem_addr = {C_NUM_REGS{1'b0}};
    reg [C_NUM_REGS-1:0] cnt_burst_len = {C_NUM_REGS{1'b0}};
    
    localparam [1:0] LOAD_ADDR   = 00,
                     INC_ADDR    = 01,
                     DELAY_STATE = 10;
                     
    reg [1:0] state_rd_wr = LOAD_ADDR;
    reg rd_en_dly, wr_en_dly;
    
    localparam LC_REG_DATA_WIDTH = (C_DATA_WIDTH*C_NUM_REGS);

    reg [(C_DATA_WIDTH*C_NUM_REGS)-1:0] full_data_o = {(C_DATA_WIDTH*C_NUM_REGS){1'b0}};
    wire [(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0] data_iclk ;
    reg [(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0] data_iclk_reg1 = 'b0;
    reg [(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0] data_iclk_reg2 = 'b0;

    wire dest_req;
    wire src_rcv;
    reg dest_ack;
    reg src_send; 
    wire [(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0] full_data_iclk_wire;
    reg [(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0] full_data_iclk_reg;

    assign arm_in = full_data_o[99];
    assign halt_in = full_data_o [106];
    assign tasen_in = full_data_o [107];
    assign done_iclk_o = dest_ack;
    assign data_iclk = full_data_o[(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0];
    //assign full_data_iclk_o = full_data_o[(C_DATA_WIDTH*C_NUM_REGS_ICLK)-1:0];
    assign full_data_iclk_o = full_data_iclk_reg;
    assign full_data_clk_o  = full_data_o[(C_DATA_WIDTH*C_NUM_REGS)-1:(C_DATA_WIDTH*C_NUM_REGS_ICLK)];

    /*always @(posedge ila_clk_i)
    begin
      data_iclk_reg1 <= data_iclk;
      data_iclk_reg2 <= data_iclk_reg1;
    end
    assign full_data_iclk_o = data_iclk_reg2;*/
    always @(posedge ila_clk_i)
    begin
      full_data_iclk_reg <= full_data_iclk_wire;
    end

    axis_ila_intf_v1_0_0_axis_dbg_sync # (
      .MODE ("Bus_sync_with_handshake"),
      .DEST_EXT_HSK (1),
      .WIDTH (C_DATA_WIDTH*C_NUM_REGS_ICLK)
    ) u_done_sync
    (
      .src_clk_in (clk_i),
      .src_in_bus (data_iclk),
      .dest_clk_in (ila_clk_i),
      .dest_out_bus (full_data_iclk_wire),
      .dest_req (dest_req),
      .src_rcv (src_rcv),
      .dest_ack (dest_ack),
      .src_send (src_send) 
    );

    always @(posedge clk_i) begin
	if (rst_i == 1'b0) begin
	    src_send <= 1'b0;
        end else begin
	    if (done_o == 1'b1 && src_rcv == 1'b0) begin
  		src_send <= 1'b1;
	    end else if (src_rcv == 1'b1) begin
		src_send <= 1'b0;
	    end
	end
    end   

    always @(posedge ila_clk_i) begin
	    if (dest_req == 1'b1) begin
		dest_ack <= 1'b1;
	    end else begin
		dest_ack <= 1'b0;
	    end
    end 

    always @(posedge clk_i)
     begin
       if (rst_i == 1'b0)
        begin          
          rd_en_dly <= 1'b0;
          wr_en_dly <= 1'b0;
        end
       else
        begin             
          rd_en_dly <= rd_en_i;
          wr_en_dly <= wr_en_i;
        end 
     end
     
    always @(posedge clk_i)
     begin
       if (rst_i == 1'b0)
        begin
          done_o      <= 1'b0;
          state_rd_wr <= LOAD_ADDR;
        end
       else
        begin
             case (state_rd_wr)
               LOAD_ADDR:
                begin 
                  if (rd_en_i == 1'b1 || wr_en_i == 1'b1)
                   begin
			   if(burst_len > 1)
			   begin
                             mem_addr      <= addr_i + 1;
                             state_rd_wr   <= INC_ADDR;
                             cnt_burst_len <= cnt_burst_len + 1;
                             done_o      <= 1'b0;                                                                 

         		   end
			   else
			   begin
                            mem_addr      <= {C_NUM_REGS{1'b0}};
                            state_rd_wr   <= LOAD_ADDR;
                            cnt_burst_len <= {C_NUM_REGS{1'b0}};                     
                            done_o      <= 1'b1;                                                                 
	          	   end
                   end                 
                  else
                   begin  
                     mem_addr      <= {C_NUM_REGS{1'b0}};
                     state_rd_wr   <= LOAD_ADDR;
                     cnt_burst_len <= {C_NUM_REGS{1'b0}};                     
                     done_o      <= 1'b0;                                                                 
                   end
               end
               INC_ADDR:
                begin
//                  if (rd_en_dly == 1'b1 || wr_en_dly == 1'b1)
                  if (rd_en_i == 1'b1 || wr_en_i == 1'b1)
                   begin
                     if (cnt_burst_len == (burst_len-1))
                      begin
                        state_rd_wr <= DELAY_STATE;
                        done_o      <= 1'b1;
                      end
                     else
                      begin
                        state_rd_wr <= INC_ADDR;
                        done_o      <= 1'b0;
                        mem_addr      <= mem_addr + 1;
                      end
                   
//                  if (rd_en_dly == 1'b1 || wr_en_dly == 1'b1)
//                   begin
//                     mem_addr      <= mem_addr + 1;
                     cnt_burst_len <= cnt_burst_len + 1;
//                   end
                   end
                end
               DELAY_STATE:
                begin
                  state_rd_wr   <= LOAD_ADDR;
                  done_o        <= 1'b0;
                  mem_addr      <= {C_NUM_REGS{1'b0}};
                  cnt_burst_len <= {C_NUM_REGS{1'b0}};
                end
               default:
                begin
                  state_rd_wr <= LOAD_ADDR;
                  done_o <= 1'b0;
                end
             endcase
        end
     end

//----Write input data in local reg-------------------     
  generate
    if (C_EN_STAT == 1) begin : I_EN_STAT_EQ1
       always @(posedge clk_i)
        begin
//          if(rd_en_i == 1'b1)// use rd_en_i to load the status and use rd_en_dly to send out the data.
//           begin
              full_data_o <= full_data_i;              
//           end
        end
     end
  endgenerate

  generate
    if (C_EN_CTL == 1) begin : I_EN_CTL_EQ1
     always @(posedge clk_i)
      begin
        data_dly <= data_i;
        //if(wr_en_dly == 1'b1)// write
	if(rst_i == 1'b0)
	begin
	  full_data_o <= full_data_i ;
	end	
        if (wr_en_i == 1'b1 && state_rd_wr == LOAD_ADDR)
         begin           
//            full_data_o[mem_addr*C_DATA_WIDTH +: C_DATA_WIDTH] <= data_dly;
            full_data_o[addr_i*C_DATA_WIDTH +: C_DATA_WIDTH] <= data_i;            
         end
        else if (wr_en_i == 1'b1 && state_rd_wr == INC_ADDR)
         begin
           full_data_o[mem_addr*C_DATA_WIDTH +: C_DATA_WIDTH] <= data_i;
         end
      end
    end
   endgenerate
//------------------------------------------------------

//----Read data with C_DATA_WIDTH if       
generate if (C_EN_PARALLEL_OP == 1'b1)
begin: en_complete_data
     always @(posedge clk_i)
      begin
//        if (rd_en_dly == 1'b1)
        if (rd_en_i == 1'b1 && state_rd_wr == LOAD_ADDR)
         begin
//           data_o <= full_data_o[mem_addr*C_DATA_WIDTH +: C_DATA_WIDTH];
           data_o <= full_data_o[addr_i*C_DATA_WIDTH +: C_DATA_WIDTH];
         end
        else if (rd_en_i == 1'b1 && state_rd_wr == INC_ADDR)
         begin
           data_o <= full_data_o[mem_addr*C_DATA_WIDTH +: C_DATA_WIDTH];
         end
      end
end      
endgenerate

generate if (C_EN_SERIAL_OP == 1'b1)
begin: en_serial_data
  localparam LC_BIT_NUM_DATA_WIDTH = $clog2(C_DATA_WIDTH);
  
  reg [1:0] state_serial_op = 2'b00;
  reg [C_NUM_REGS-1:0] mem_addr_serial = {C_NUM_REGS{1'b0}};
  reg shift_done = 1'b0;
  reg [C_DATA_WIDTH-1:0] serial_data_reg;
  reg [LC_BIT_NUM_DATA_WIDTH-1:0] count_shift  = {LC_BIT_NUM_DATA_WIDTH{1'b0}};
  reg start_serial_op, start_serial_op_dly = 1'b0;  
  
always @ (posedge clk_i)
  begin
    if (rst_i == 1'b0)
    begin
      state_serial_op <= 2'b00;
      serial_data_reg <= {C_DATA_WIDTH{1'b0}};
//      cfg_data <= 'h0;
      count_shift  <= {LC_BIT_NUM_DATA_WIDTH{1'b0}};
      mem_addr_serial <= {C_NUM_REGS{1'b0}};
      start_serial_op_dly <= 1'b0;
    end
    else
    begin
      case (state_serial_op)
        2'b00: begin
                 if (rd_en_serial_i == 1'b1)
                 begin
                   mem_addr_serial <= addr_i;                   
                   state_serial_op <= 2'b01;
                   start_serial_op <= 1'b1;
                 end
                 else
                 begin
                   state_serial_op <= 2'b00;
                   start_serial_op <= 1'b0;
                 end           
               end
        2'b01: begin
                 serial_data_reg <= full_data_o[mem_addr_serial*C_DATA_WIDTH +: C_DATA_WIDTH];
                 mem_addr_serial <= mem_addr_serial + 1;
//                 cfg_data <= data_int;
                 if (mem_addr_serial < burst_len)
                  begin
                    state_serial_op <= 2'b10;          
                  end
                 else
                  begin
                    state_serial_op <= 2'b00;          
                  end                 
                 count_shift  <= {LC_BIT_NUM_DATA_WIDTH{1'b0}};
                 start_serial_op <= 1'b0;
//                 start_serial_op_dly <= start_serial_op;
               end
        2'b10: begin
                 if (count_shift < (C_DATA_WIDTH-1))
                 begin
                   count_shift <= count_shift + 1;
                   serial_data_reg <= {1'b0,serial_data_reg[(C_DATA_WIDTH-1):1]};
                   state_serial_op <= 2'b10;
                 end
                 else
                 begin
//                   cfg_en_int <= 1'b0;
                   state_serial_op <= 2'b01;
                 end
                 start_serial_op <= 1'b0;
//                 start_serial_op_dly <= start_serial_op;
              end
        default: begin
                   state_serial_op <= 2'b00;
                   start_serial_op <= 1'b0;
//                   start_serial_op_dly <= start_serial_op;
                 end
      endcase
      start_serial_op_dly <= start_serial_op;
      if ((mem_addr_serial >= burst_len-1) && (count_shift == C_DATA_WIDTH-2))
       begin
         done_serial_op <= 1'b1;
       end
      else
       begin
         done_serial_op <= 1'b0;
       end
    end
  end

  assign start_serial_op_o = start_serial_op_dly;
  assign serial_data_o = serial_data_reg[0];


end      
endgenerate

endmodule



`timescale 1ns / 1ps

module axis_ila_intf_v1_0_0_axis_dbg_sync #( 
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


`timescale 1 ns / 1 ps

module axis_ila_intf_v1_0_0_clk_status #(

  parameter C_NUM_CLOCKS = 1
  ) (
  input wire axis_clk,
  input wire aresetn,
  input wire des_clk0,
  input wire des_clk1,
  input wire des_clk2,
  input wire des_clk3,
  input wire des_clk4,
  input wire des_clk5,
  input wire des_clk6,
  input wire des_clk7,
//  input wire des_clk8,
//  input wire des_clk9,
//  input wire des_clk10,
//  input wire des_clk11,
//  input wire des_clk12,
//  input wire des_clk13,
//  input wire des_clk14,
//  input wire des_clk15,
  output reg [7:0] clk_status
  );
 
reg axis_clk_flag_0;
  reg des_clk0_flag = 1'b1;
  reg next_state_dbg_0;
  reg next_state_core_0 = 1'b0;
  reg [15:0] clk_lost_cnt_0;
  wire des_clk0_flag_sync2;
  wire axis_clk_flag_0_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_0_sync_inst
  (
       .src_clk_in(des_clk0),
       .src_in(des_clk0_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk0_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_0_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_0),
       .dest_clk_in(des_clk0),
       .dest_out(axis_clk_flag_0_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_0 <= 1'b0;
      next_state_dbg_0 <= 1'b0;
      clk_lost_cnt_0 <= 'h0;
      clk_status[8-C_NUM_CLOCKS:0] <= 'b0;
    end
    else
    begin
      case(next_state_dbg_0)
        1'h0 : begin
                 if (des_clk0_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_0 <= 1'b1;
                   next_state_dbg_0 <= 1'b1;
                   clk_lost_cnt_0 <= 'h0;
                   clk_status[0] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_0 < 'd256)
                   begin
                     clk_lost_cnt_0 <= clk_lost_cnt_0 + 'h1;
                     clk_status[0] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[0] <= 1'b1;
                   end
                   next_state_dbg_0 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk0_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_0 <= 1'b0;
                   next_state_dbg_0 <= 1'b0;
                   clk_lost_cnt_0 <= 'h0;
                   clk_status[0] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_0 < 'd256)
                   begin
                     clk_lost_cnt_0 <= clk_lost_cnt_0 + 'h1;
                     clk_status[0] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[0] <= 1'b1;
                   end
                   next_state_dbg_0 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk0)
  begin
    case(next_state_core_0)
      1'h0 : begin
               if (axis_clk_flag_0_sync2 == 1'b1)
               begin
                 des_clk0_flag <= 1'b0;
                 next_state_core_0 <= 1'b1;
               end
               else
               begin
                 next_state_core_0 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_0_sync2 == 1'b0)
               begin
                 des_clk0_flag <= 1'b1;
                 next_state_core_0 <= 1'b0;
               end
               else
               begin
                 next_state_core_0 <= 1'b1;
               end
             end
    endcase
  end

generate
if (C_NUM_CLOCKS > 1)
begin: design_clks_2

reg axis_clk_flag_1;
  reg des_clk1_flag = 1'b1;
  reg next_state_dbg_1;
  reg next_state_core_1 = 1'b0;
  reg [15:0] clk_lost_cnt_1;
  wire des_clk1_flag_sync2;
 wire axis_clk_flag_1_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_1_sync_inst
  (
       .src_clk_in(des_clk1),
       .src_in(des_clk1_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk1_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_1_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_1),
       .dest_clk_in(des_clk1),
       .dest_out(axis_clk_flag_1_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_1 <= 1'b0;
      next_state_dbg_1 <= 1'b0;
      clk_lost_cnt_1 <= 'h0;
      clk_status[1] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_1)
        1'h0 : begin
                 if (des_clk1_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_1 <= 1'b1;
                   next_state_dbg_1 <= 1'b1;
                   clk_lost_cnt_1 <= 'h0;
                   clk_status[1] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_1 < 'd256)
                   begin
                     clk_lost_cnt_1 <= clk_lost_cnt_1 + 'h1;
                     clk_status[1] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[1] <= 1'b1;
                   end
                   next_state_dbg_1 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk1_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_1 <= 1'b0;
                   next_state_dbg_1 <= 1'b0;
                   clk_lost_cnt_1 <= 'h0;
                   clk_status[1] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_1 < 'd256)
                   begin
                     clk_lost_cnt_1 <= clk_lost_cnt_1 + 'h1;
                     clk_status[1] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[1] <= 1'b1;
                   end
                   next_state_dbg_1 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk1)
  begin
    case(next_state_core_1)
      1'h0 : begin
               if (axis_clk_flag_1_sync2 == 1'b1)
               begin
                 des_clk1_flag <= 1'b0;
                 next_state_core_1 <= 1'b1;
               end
               else
               begin
                 next_state_core_1 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_1_sync2 == 1'b0)
               begin
                 des_clk1_flag <= 1'b1;
                 next_state_core_1 <= 1'b0;
               end
               else
               begin
                 next_state_core_1 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate
generate
if (C_NUM_CLOCKS > 2)
begin: design_clks_3

reg axis_clk_flag_2;
  reg des_clk2_flag = 1'b1;
  reg next_state_dbg_2;
  reg next_state_core_2 = 1'b0;
  reg [15:0] clk_lost_cnt_2;
  wire  des_clk2_flag_sync2;
  wire  axis_clk_flag_2_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_2_sync_inst
  (
       .src_clk_in(des_clk2),
       .src_in(des_clk2_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk2_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_2_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_2),
       .dest_clk_in(des_clk2),
       .dest_out(axis_clk_flag_2_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_2 <= 1'b0;
      next_state_dbg_2 <= 1'b0;
      clk_lost_cnt_2 <= 'h0;
      clk_status[2] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_2)
        1'h0 : begin
                 if (des_clk2_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_2 <= 1'b1;
                   next_state_dbg_2 <= 1'b1;
                   clk_lost_cnt_2 <= 'h0;
                   clk_status[2] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_2 < 'd256)
                   begin
                     clk_lost_cnt_2 <= clk_lost_cnt_2 + 'h1;
                     clk_status[2] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[2] <= 1'b1;
                   end
                   next_state_dbg_2 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk2_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_2 <= 1'b0;
                   next_state_dbg_2 <= 1'b0;
                   clk_lost_cnt_2 <= 'h0;
                   clk_status[2] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_2 < 'd256)
                   begin
                     clk_lost_cnt_2 <= clk_lost_cnt_2 + 'h1;
                     clk_status[2] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[2] <= 1'b1;
                   end
                   next_state_dbg_2 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk2)
  begin
    case(next_state_core_2)
      1'h0 : begin
               if (axis_clk_flag_2_sync2 == 1'b1)
               begin
                 des_clk2_flag <= 1'b0;
                 next_state_core_2 <= 1'b1;
               end
               else
               begin
                 next_state_core_2 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_2_sync2 == 1'b0)
               begin
                 des_clk2_flag <= 1'b1;
                 next_state_core_2 <= 1'b0;
               end
               else
               begin
                 next_state_core_2 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate
generate
if (C_NUM_CLOCKS > 3)
begin: design_clks_4

reg axis_clk_flag_3;
  reg des_clk3_flag = 1'b1;
  reg next_state_dbg_3;
  reg next_state_core_3 = 1'b0;
  reg [15:0] clk_lost_cnt_3;
  wire  des_clk3_flag_sync2;
  wire  axis_clk_flag_3_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_3_sync_inst
  (
       .src_clk_in(des_clk3),
       .src_in(des_clk3_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk3_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_3_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_3),
       .dest_clk_in(des_clk3),
       .dest_out(axis_clk_flag_3_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_3 <= 1'b0;
      next_state_dbg_3 <= 1'b0;
      clk_lost_cnt_3 <= 'h0;
      clk_status[3] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_3)
        1'h0 : begin
                 if (des_clk3_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_3 <= 1'b1;
                   next_state_dbg_3 <= 1'b1;
                   clk_lost_cnt_3 <= 'h0;
                   clk_status[3] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_3 < 'd256)
                   begin
                     clk_lost_cnt_3 <= clk_lost_cnt_3 + 'h1;
                     clk_status[3] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[3] <= 1'b1;
                   end
                   next_state_dbg_3 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk3_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_3 <= 1'b0;
                   next_state_dbg_3 <= 1'b0;
                   clk_lost_cnt_3 <= 'h0;
                   clk_status[3] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_3 < 'd256)
                   begin
                     clk_lost_cnt_3 <= clk_lost_cnt_3 + 'h1;
                     clk_status[3] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[3] <= 1'b1;
                   end
                   next_state_dbg_3 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk3)
  begin
    case(next_state_core_3)
      1'h0 : begin
               if (axis_clk_flag_3_sync2 == 1'b1)
               begin
                 des_clk3_flag <= 1'b0;
                 next_state_core_3 <= 1'b1;
               end
               else
               begin
                 next_state_core_3 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_3_sync2 == 1'b0)
               begin
                 des_clk3_flag <= 1'b1;
                 next_state_core_3 <= 1'b0;
               end
               else
               begin
                 next_state_core_3 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate
generate
if (C_NUM_CLOCKS > 4)
begin: design_clks_5

reg axis_clk_flag_4;
  reg des_clk4_flag = 1'b1;
  reg next_state_dbg_4;
  reg next_state_core_4 = 1'b0;
  reg [15:0] clk_lost_cnt_4;
  wire  des_clk4_flag_sync2;
  wire  axis_clk_flag_4_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_4_sync_inst
  (
       .src_clk_in(des_clk4),
       .src_in(des_clk4_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk4_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_4_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_4),
       .dest_clk_in(des_clk4),
       .dest_out(axis_clk_flag_4_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_4 <= 1'b0;
      next_state_dbg_4 <= 1'b0;
      clk_lost_cnt_4 <= 'h0;
      clk_status[4] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_4)
        1'h0 : begin
                 if (des_clk4_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_4 <= 1'b1;
                   next_state_dbg_4 <= 1'b1;
                   clk_lost_cnt_4 <= 'h0;
                   clk_status[4] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_4 < 'd256)
                   begin
                     clk_lost_cnt_4 <= clk_lost_cnt_4 + 'h1;
                     clk_status[4] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[4] <= 1'b1;
                   end
                   next_state_dbg_4 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk4_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_4 <= 1'b0;
                   next_state_dbg_4 <= 1'b0;
                   clk_lost_cnt_4 <= 'h0;
                   clk_status[4] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_4 < 'd256)
                   begin
                     clk_lost_cnt_4 <= clk_lost_cnt_4 + 'h1;
                     clk_status[4] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[4] <= 1'b1;
                   end
                   next_state_dbg_4 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk4)
  begin
    case(next_state_core_4)
      1'h0 : begin
               if (axis_clk_flag_4_sync2 == 1'b1)
               begin
                 des_clk4_flag <= 1'b0;
                 next_state_core_4 <= 1'b1;
               end
               else
               begin
                 next_state_core_4 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_4_sync2 == 1'b0)
               begin
                 des_clk4_flag <= 1'b1;
                 next_state_core_4 <= 1'b0;
               end
               else
               begin
                 next_state_core_4 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate
generate
if (C_NUM_CLOCKS > 5)
begin: design_clks_6

reg axis_clk_flag_5;
  reg des_clk5_flag = 1'b1;
  reg next_state_dbg_5;
  reg next_state_core_5 = 1'b0;
  reg [15:0] clk_lost_cnt_5;
  wire  des_clk5_flag_sync2;
  wire  axis_clk_flag_5_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_5_sync_inst
  (
       .src_clk_in(des_clk5),
       .src_in(des_clk5_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk5_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_5_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_5),
       .dest_clk_in(des_clk5),
       .dest_out(axis_clk_flag_5_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_5 <= 1'b0;
      next_state_dbg_5 <= 1'b0;
      clk_lost_cnt_5 <= 'h0;
      clk_status[5] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_5)
        1'h0 : begin
                 if (des_clk5_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_5 <= 1'b1;
                   next_state_dbg_5 <= 1'b1;
                   clk_lost_cnt_5 <= 'h0;
                   clk_status[5] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_5 < 'd256)
                   begin
                     clk_lost_cnt_5 <= clk_lost_cnt_5 + 'h1;
                     clk_status[5] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[5] <= 1'b1;
                   end
                   next_state_dbg_5 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk5_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_5 <= 1'b0;
                   next_state_dbg_5 <= 1'b0;
                   clk_lost_cnt_5 <= 'h0;
                   clk_status[5] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_5 < 'd256)
                   begin
                     clk_lost_cnt_5 <= clk_lost_cnt_5 + 'h1;
                     clk_status[5] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[5] <= 1'b1;
                   end
                   next_state_dbg_5 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk5)
  begin
    case(next_state_core_5)
      1'h0 : begin
               if (axis_clk_flag_5_sync2 == 1'b1)
               begin
                 des_clk5_flag <= 1'b0;
                 next_state_core_5 <= 1'b1;
               end
               else
               begin
                 next_state_core_5 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_5_sync2 == 1'b0)
               begin
                 des_clk5_flag <= 1'b1;
                 next_state_core_5 <= 1'b0;
               end
               else
               begin
                 next_state_core_5 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate
generate
if (C_NUM_CLOCKS > 6)
begin: design_clks_7

reg axis_clk_flag_6;
  reg des_clk6_flag = 1'b1;
  reg next_state_dbg_6;
  reg next_state_core_6 = 1'b0;
  reg [15:0] clk_lost_cnt_6;
  wire  des_clk6_flag_sync2;
  wire  axis_clk_flag_6_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_6_sync_inst
  (
       .src_clk_in(des_clk6),
       .src_in(des_clk6_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk6_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_6_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_6),
       .dest_clk_in(des_clk6),
       .dest_out(axis_clk_flag_6_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_6 <= 1'b0;
      next_state_dbg_6 <= 1'b0;
      clk_lost_cnt_6 <= 'h0;
      clk_status[6] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_6)
        1'h0 : begin
                 if (des_clk6_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_6 <= 1'b1;
                   next_state_dbg_6 <= 1'b1;
                   clk_lost_cnt_6 <= 'h0;
                   clk_status[6] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_6 < 'd256)
                   begin
                     clk_lost_cnt_6 <= clk_lost_cnt_6 + 'h1;
                     clk_status[6] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[6] <= 1'b1;
                   end
                   next_state_dbg_6 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk6_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_6 <= 1'b0;
                   next_state_dbg_6 <= 1'b0;
                   clk_lost_cnt_6 <= 'h0;
                   clk_status[6] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_6 < 'd256)
                   begin
                     clk_lost_cnt_6 <= clk_lost_cnt_6 + 'h1;
                     clk_status[6] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[6] <= 1'b1;
                   end
                   next_state_dbg_6 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk6)
  begin
    case(next_state_core_6)
      1'h0 : begin
               if (axis_clk_flag_6_sync2 == 1'b1)
               begin
                 des_clk6_flag <= 1'b0;
                 next_state_core_6 <= 1'b1;
               end
               else
               begin
                 next_state_core_6 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_6_sync2 == 1'b0)
               begin
                 des_clk6_flag <= 1'b1;
                 next_state_core_6 <= 1'b0;
               end
               else
               begin
                 next_state_core_6 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate
generate
if (C_NUM_CLOCKS > 7)
begin: design_clks_8

reg axis_clk_flag_7;
  reg des_clk7_flag = 1'b1;
  reg next_state_dbg_7;
  reg next_state_core_7 = 1'b0;
  reg [15:0] clk_lost_cnt_7;
  wire  des_clk7_flag_sync2;
  wire  axis_clk_flag_7_sync2;

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) des_flag_7_sync_inst
  (
       .src_clk_in(des_clk7),
       .src_in(des_clk7_flag),
       .dest_clk_in(axis_clk),
       .dest_out(des_clk7_flag_sync2)
  );

  axis_dbg_sync_v1_0_0_axis_dbg_sync #( 
      .MODE("Single_bit_sync"), //"Bus_sync_with_handshake", "Pulse_txr", "Single bit_arr_sync", "Single_bit_sync"
      .DEST_SYNC_FF(2), //Range 2- 10
      .INIT_SYNC_FF(1), //0 - disable sim init value, 1 enable
      .SRC_INPUT_REG(1) //0 - Do not register input, 1- register input
    ) axis_flag_7_sync_inst
  (
       .src_clk_in(axis_clk),
       .src_in(axis_clk_flag_7),
       .dest_clk_in(des_clk7),
       .dest_out(axis_clk_flag_7_sync2)
  );

  always @ (posedge axis_clk)
  begin
    if (aresetn == 1'b0)
    begin
      axis_clk_flag_7 <= 1'b0;
      next_state_dbg_7 <= 1'b0;
      clk_lost_cnt_7 <= 'h0;
      clk_status[7] <= 1'b0;
    end
    else
    begin
      case(next_state_dbg_7)
        1'h0 : begin
                 if (des_clk7_flag_sync2 == 1'b1)
                 begin
                   axis_clk_flag_7 <= 1'b1;
                   next_state_dbg_7 <= 1'b1;
                   clk_lost_cnt_7 <= 'h0;
                   clk_status[7] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_7 < 'd256)
                   begin
                     clk_lost_cnt_7 <= clk_lost_cnt_7 + 'h1;
                     clk_status[7] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[7] <= 1'b1;
                   end
                   next_state_dbg_7 <= 1'b0;
                 end
               end
        1'h1 : begin
                 if (des_clk7_flag_sync2 == 1'b0)
                 begin
                   axis_clk_flag_7 <= 1'b0;
                   next_state_dbg_7 <= 1'b0;
                   clk_lost_cnt_7 <= 'h0;
                   clk_status[7] <= 1'b0;
                 end
                 else
                 begin
                   if (clk_lost_cnt_7 < 'd256)
                   begin
                     clk_lost_cnt_7 <= clk_lost_cnt_7 + 'h1;
                     clk_status[7] <= 1'b0;
                   end
                   else
                   begin
                     clk_status[7] <= 1'b1;
                   end
                   next_state_dbg_7 <= 1'b1;
                 end
               end
      endcase
    end
  end

  always @ (posedge des_clk7)
  begin
    case(next_state_core_7)
      1'h0 : begin
               if (axis_clk_flag_7_sync2 == 1'b1)
               begin
                 des_clk7_flag <= 1'b0;
                 next_state_core_7 <= 1'b1;
               end
               else
               begin
                 next_state_core_7 <= 1'b0;
               end
             end
      1'h1 : begin
               if (axis_clk_flag_7_sync2 == 1'b0)
               begin
                 des_clk7_flag <= 1'b1;
                 next_state_core_7 <= 1'b0;
               end
               else
               begin
                 next_state_core_7 <= 1'b1;
               end
             end
    endcase
  end
end
endgenerate

//generate
//if (C_NUM_CLOCKS > 8)
//begin: design_clks_9
//
//reg axis_clk_flag_8;
//  reg des_clk8_flag = 1'b1;
//  reg next_state_dbg_8;
//  reg next_state_core_8 = 1'b0;
//  reg [15:0] clk_lost_cnt_8;
//  wire des_clk8_flag_sync1, des_clk8_flag_sync2;
//  wire axis_clk_flag_8_sync1, axis_clk_flag_8_sync2;
//
//  always @ (posedge axis_clk)
//  begin
//    des_clk8_flag_sync1 <= des_clk8_flag;
//    des_clk8_flag_sync2 <= des_clk8_flag_sync1;
//  end
//
//  always @ (posedge des_clk0)
//  begin
//    axis_clk_flag_8_sync1 <= axis_clk_flag_8;
//    axis_clk_flag_8_sync2 <= axis_clk_flag_8_sync1;
//  end
//
//  always @ (posedge axis_clk)
//  begin
//    if (aresetn == 1'b0)
//    begin
//      axis_clk_flag_8 <= 1'b0;
//      next_state_dbg_8 <= 1'b0;
//      clk_lost_cnt_8 <= 'h0;
//      clk_status[8] <= 1'b0;
//    end
//    else
//    begin
//      case(next_state_dbg_8)
//        1'h0 : begin
//                 if (des_clk8_flag_sync2 == 1'b1)
//                 begin
//                   axis_clk_flag_8 <= 1'b1;
//                   next_state_dbg_8 <= 1'b1;
//                   clk_lost_cnt_8 <= 'h0;
//                   clk_status[8] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_8 < 'd256)
//                   begin
//                     clk_lost_cnt_8 <= clk_lost_cnt_8 + 'h1;
//                     clk_status[8] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[8] <= 1'b1;
//                   end
//                   next_state_dbg_8 <= 1'b0;
//                 end
//               end
//        1'h1 : begin
//                 if (des_clk8_flag_sync2 == 1'b0)
//                 begin
//                   axis_clk_flag_8 <= 1'b0;
//                   next_state_dbg_8 <= 1'b0;
//                   clk_lost_cnt_8 <= 'h0;
//                   clk_status[8] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_8 < 'd256)
//                   begin
//                     clk_lost_cnt_8 <= clk_lost_cnt_8 + 'h1;
//                     clk_status[8] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[8] <= 1'b1;
//                   end
//                   next_state_dbg_8 <= 1'b1;
//                 end
//               end
//      endcase
//    end
//  end
//
//  always @ (posedge des_clk8)
//  begin
//    case(next_state_core_8)
//      1'h0 : begin
//               if (axis_clk_flag_8_sync2 == 1'b1)
//               begin
//                 des_clk8_flag <= 1'b0;
//                 next_state_core_8 <= 1'b1;
//               end
//               else
//               begin
//                 next_state_core_8 <= 1'b0;
//               end
//             end
//      1'h1 : begin
//               if (axis_clk_flag_8_sync2 == 1'b0)
//               begin
//                 des_clk8_flag <= 1'b1;
//                 next_state_core_8 <= 1'b0;
//               end
//               else
//               begin
//                 next_state_core_8 <= 1'b1;
//               end
//             end
//    endcase
//  end
//end
//endgenerate
//generate
//if (C_NUM_CLOCKS > 9)
//begin: design_clks_10
//
//reg axis_clk_flag_9;
//  reg des_clk9_flag = 1'b1;
//  reg next_state_dbg_9;
//  reg next_state_core_9 = 1'b0;
//  reg [15:0] clk_lost_cnt_9;
//  wire des_clk9_flag_sync1, des_clk9_flag_sync2;
//  wire axis_clk_flag_9_sync1, axis_clk_flag_9_sync2;
//
//  always @ (posedge axis_clk)
//  begin
//    des_clk9_flag_sync1 <= des_clk9_flag;
//    des_clk9_flag_sync2 <= des_clk9_flag_sync1;
//  end
//
//  always @ (posedge des_clk0)
//  begin
//    axis_clk_flag_9_sync1 <= axis_clk_flag_9;
//    axis_clk_flag_9_sync2 <= axis_clk_flag_9_sync1;
//  end
//
//  always @ (posedge axis_clk)
//  begin
//    if (aresetn == 1'b0)
//    begin
//      axis_clk_flag_9 <= 1'b0;
//      next_state_dbg_9 <= 1'b0;
//      clk_lost_cnt_9 <= 'h0;
//      clk_status[9] <= 1'b0;
//    end
//    else
//    begin
//      case(next_state_dbg_9)
//        1'h0 : begin
//                 if (des_clk9_flag_sync2 == 1'b1)
//                 begin
//                   axis_clk_flag_9 <= 1'b1;
//                   next_state_dbg_9 <= 1'b1;
//                   clk_lost_cnt_9 <= 'h0;
//                   clk_status[9] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_9 < 'd256)
//                   begin
//                     clk_lost_cnt_9 <= clk_lost_cnt_9 + 'h1;
//                     clk_status[9] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[9] <= 1'b1;
//                   end
//                   next_state_dbg_9 <= 1'b0;
//                 end
//               end
//        1'h1 : begin
//                 if (des_clk9_flag_sync2 == 1'b0)
//                 begin
//                   axis_clk_flag_9 <= 1'b0;
//                   next_state_dbg_9 <= 1'b0;
//                   clk_lost_cnt_9 <= 'h0;
//                   clk_status[9] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_9 < 'd256)
//                   begin
//                     clk_lost_cnt_9 <= clk_lost_cnt_9 + 'h1;
//                     clk_status[9] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[9] <= 1'b1;
//                   end
//                   next_state_dbg_9 <= 1'b1;
//                 end
//               end
//      endcase
//    end
//  end
//
//  always @ (posedge des_clk9)
//  begin
//    case(next_state_core_9)
//      1'h0 : begin
//               if (axis_clk_flag_9_sync2 == 1'b1)
//               begin
//                 des_clk9_flag <= 1'b0;
//                 next_state_core_9 <= 1'b1;
//               end
//               else
//               begin
//                 next_state_core_9 <= 1'b0;
//               end
//             end
//      1'h1 : begin
//               if (axis_clk_flag_9_sync2 == 1'b0)
//               begin
//                 des_clk9_flag <= 1'b1;
//                 next_state_core_9 <= 1'b0;
//               end
//               else
//               begin
//                 next_state_core_9 <= 1'b1;
//               end
//             end
//    endcase
//  end
//end
//endgenerate
//generate
//if (C_NUM_CLOCKS > 10)
//begin: design_clks_11
//
//reg axis_clk_flag_10;
//  reg des_clk10_flag = 1'b1;
//  reg next_state_dbg_10;
//  reg next_state_core_10 = 1'b0;
//  reg [15:0] clk_lost_cnt_10;
//  wire des_clk10_flag_sync1, des_clk10_flag_sync2;
//  wire axis_clk_flag_10_sync1, axis_clk_flag_10_sync2;
//
//  always @ (posedge axis_clk)
//  begin
//    des_clk10_flag_sync1 <= des_clk10_flag;
//    des_clk10_flag_sync2 <= des_clk10_flag_sync1;
//  end
//
//  always @ (posedge des_clk0)
//  begin
//    axis_clk_flag_10_sync1 <= axis_clk_flag_10;
//    axis_clk_flag_10_sync2 <= axis_clk_flag_10_sync1;
//  end
//
//  always @ (posedge axis_clk)
//  begin
//    if (aresetn == 1'b0)
//    begin
//      axis_clk_flag_10 <= 1'b0;
//      next_state_dbg_10 <= 1'b0;
//      clk_lost_cnt_10 <= 'h0;
//      clk_status[10] <= 1'b0;
//    end
//    else
//    begin
//      case(next_state_dbg_10)
//        1'h0 : begin
//                 if (des_clk10_flag_sync2 == 1'b1)
//                 begin
//                   axis_clk_flag_10 <= 1'b1;
//                   next_state_dbg_10 <= 1'b1;
//                   clk_lost_cnt_10 <= 'h0;
//                   clk_status[10] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_10 < 'd256)
//                   begin
//                     clk_lost_cnt_10 <= clk_lost_cnt_10 + 'h1;
//                     clk_status[10] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[10] <= 1'b1;
//                   end
//                   next_state_dbg_10 <= 1'b0;
//                 end
//               end
//        1'h1 : begin
//                 if (des_clk10_flag_sync2 == 1'b0)
//                 begin
//                   axis_clk_flag_10 <= 1'b0;
//                   next_state_dbg_10 <= 1'b0;
//                   clk_lost_cnt_10 <= 'h0;
//                   clk_status[10] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_10 < 'd256)
//                   begin
//                     clk_lost_cnt_10 <= clk_lost_cnt_10 + 'h1;
//                     clk_status[10] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[10] <= 1'b1;
//                   end
//                   next_state_dbg_10 <= 1'b1;
//                 end
//               end
//      endcase
//    end
//  end
//
//  always @ (posedge des_clk10)
//  begin
//    case(next_state_core_10)
//      1'h0 : begin
//               if (axis_clk_flag_10_sync2 == 1'b1)
//               begin
//                 des_clk10_flag <= 1'b0;
//                 next_state_core_10 <= 1'b1;
//               end
//               else
//               begin
//                 next_state_core_10 <= 1'b0;
//               end
//             end
//      1'h1 : begin
//               if (axis_clk_flag_10_sync2 == 1'b0)
//               begin
//                 des_clk10_flag <= 1'b1;
//                 next_state_core_10 <= 1'b0;
//               end
//               else
//               begin
//                 next_state_core_10 <= 1'b1;
//               end
//             end
//    endcase
//  end
//end
//endgenerate
//generate
//if (C_NUM_CLOCKS > 11)
//begin: design_clks_12
//
//reg axis_clk_flag_11;
//  reg des_clk11_flag = 1'b1;
//  reg next_state_dbg_11;
//  reg next_state_core_11 = 1'b0;
//  reg [15:0] clk_lost_cnt_11;
//  wire des_clk11_flag_sync1, des_clk11_flag_sync2;
//  wire axis_clk_flag_11_sync1, axis_clk_flag_11_sync2;
//
//  always @ (posedge axis_clk)
//  begin
//    des_clk11_flag_sync1 <= des_clk11_flag;
//    des_clk11_flag_sync2 <= des_clk11_flag_sync1;
//  end
//
//  always @ (posedge des_clk0)
//  begin
//    axis_clk_flag_11_sync1 <= axis_clk_flag_11;
//    axis_clk_flag_11_sync2 <= axis_clk_flag_11_sync1;
//  end
//
//  always @ (posedge axis_clk)
//  begin
//    if (aresetn == 1'b0)
//    begin
//      axis_clk_flag_11 <= 1'b0;
//      next_state_dbg_11 <= 1'b0;
//      clk_lost_cnt_11 <= 'h0;
//      clk_status[11] <= 1'b0;
//    end
//    else
//    begin
//      case(next_state_dbg_11)
//        1'h0 : begin
//                 if (des_clk11_flag_sync2 == 1'b1)
//                 begin
//                   axis_clk_flag_11 <= 1'b1;
//                   next_state_dbg_11 <= 1'b1;
//                   clk_lost_cnt_11 <= 'h0;
//                   clk_status[11] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_11 < 'd256)
//                   begin
//                     clk_lost_cnt_11 <= clk_lost_cnt_11 + 'h1;
//                     clk_status[11] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[11] <= 1'b1;
//                   end
//                   next_state_dbg_11 <= 1'b0;
//                 end
//               end
//        1'h1 : begin
//                 if (des_clk11_flag_sync2 == 1'b0)
//                 begin
//                   axis_clk_flag_11 <= 1'b0;
//                   next_state_dbg_11 <= 1'b0;
//                   clk_lost_cnt_11 <= 'h0;
//                   clk_status[11] <= 1'b0;
//                 end
//                 else
//                 begin
//                   if (clk_lost_cnt_11 < 'd256)
//                   begin
//                     clk_lost_cnt_11 <= clk_lost_cnt_11 + 'h1;
//                     clk_status[11] <= 1'b0;
//                   end
//                   else
//                   begin
//                     clk_status[11] <= 1'b1;
//                   end
//                   next_state_dbg_11 <= 1'b1;
//                 end
//               end
//      endcase
//    end
//  end
//
//  always @ (posedge des_clk11)
//  begin
//    case(next_state_core_11)
//      1'h0 : begin
//               if (axis_clk_flag_11_sync2 == 1'b1)
//               begin
//                 des_clk11_flag <= 1'b0;
//                 next_state_core_11 <= 1'b1;
//               end
//               else
//               begin
//                 next_state_core_11 <= 1'b0;
//               end
//             end
//      1'h1 : begin
//               if (axis_clk_flag_11_sync2 == 1'b0)
//               begin
//                 des_clk11_flag <= 1'b1;
//                 next_state_core_11 <= 1'b0;
//               end
//               else
//               begin
//                 next_state_core_11 <= 1'b1;
//               end
//             end
//    endcase
//  end
//end
//endgenerate

// generate
// if (C_NUM_CLOCKS > 12)
// begin: design_clks_13
// 
// reg axis_clk_flag_12;
//   reg des_clk12_flag = 1'b1;
//   reg next_state_dbg_12;
//   reg next_state_core_12 = 1'b0;
//   reg [15:0] clk_lost_cnt_12;
//   wire des_clk12_flag_sync1, des_clk12_flag_sync2;
//   wire axis_clk_flag_12_sync1, axis_clk_flag_12_sync2;
// 
//   always @ (posedge axis_clk)
//   begin
//     des_clk12_flag_sync1 <= des_clk12_flag;
//     des_clk12_flag_sync2 <= des_clk12_flag_sync1;
//   end
// 
//   always @ (posedge des_clk0)
//   begin
//     axis_clk_flag_12_sync1 <= axis_clk_flag_12;
//     axis_clk_flag_12_sync2 <= axis_clk_flag_12_sync1;
//   end
// 
//   always @ (posedge axis_clk)
//   begin
//     if (aresetn == 1'b0)
//     begin
//       axis_clk_flag_12 <= 1'b0;
//       next_state_dbg_12 <= 1'b0;
//       clk_lost_cnt_12 <= 'h0;
//       clk_status[12] <= 1'b0;
//     end
//     else
//     begin
//       case(next_state_dbg_12)
//         1'h0 : begin
//                  if (des_clk12_flag_sync2 == 1'b1)
//                  begin
//                    axis_clk_flag_12 <= 1'b1;
//                    next_state_dbg_12 <= 1'b1;
//                    clk_lost_cnt_12 <= 'h0;
//                    clk_status[12] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_12 < 'd256)
//                    begin
//                      clk_lost_cnt_12 <= clk_lost_cnt_12 + 'h1;
//                      clk_status[12] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[12] <= 1'b1;
//                    end
//                    next_state_dbg_12 <= 1'b0;
//                  end
//                end
//         1'h1 : begin
//                  if (des_clk12_flag_sync2 == 1'b0)
//                  begin
//                    axis_clk_flag_12 <= 1'b0;
//                    next_state_dbg_12 <= 1'b0;
//                    clk_lost_cnt_12 <= 'h0;
//                    clk_status[12] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_12 < 'd256)
//                    begin
//                      clk_lost_cnt_12 <= clk_lost_cnt_12 + 'h1;
//                      clk_status[12] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[12] <= 1'b1;
//                    end
//                    next_state_dbg_12 <= 1'b1;
//                  end
//                end
//       endcase
//     end
//   end
// 
//   always @ (posedge des_clk12)
//   begin
//     case(next_state_core_12)
//       1'h0 : begin
//                if (axis_clk_flag_12_sync2 == 1'b1)
//                begin
//                  des_clk12_flag <= 1'b0;
//                  next_state_core_12 <= 1'b1;
//                end
//                else
//                begin
//                  next_state_core_12 <= 1'b0;
//                end
//              end
//       1'h1 : begin
//                if (axis_clk_flag_12_sync2 == 1'b0)
//                begin
//                  des_clk12_flag <= 1'b1;
//                  next_state_core_12 <= 1'b0;
//                end
//                else
//                begin
//                  next_state_core_12 <= 1'b1;
//                end
//              end
//     endcase
//   end
// end
// endgenerate
// generate
// if (C_NUM_CLOCKS > 13)
// begin: design_clks_14
// 
// reg axis_clk_flag_13;
//   reg des_clk13_flag = 1'b1;
//   reg next_state_dbg_13;
//   reg next_state_core_13 = 1'b0;
//   reg [15:0] clk_lost_cnt_13;
//   wire des_clk13_flag_sync1, des_clk13_flag_sync2;
//   wire axis_clk_flag_13_sync1, axis_clk_flag_13_sync2;
// 
//   always @ (posedge axis_clk)
//   begin
//     des_clk13_flag_sync1 <= des_clk13_flag;
//     des_clk13_flag_sync2 <= des_clk13_flag_sync1;
//   end
// 
//   always @ (posedge des_clk0)
//   begin
//     axis_clk_flag_13_sync1 <= axis_clk_flag_13;
//     axis_clk_flag_13_sync2 <= axis_clk_flag_13_sync1;
//   end
// 
//   always @ (posedge axis_clk)
//   begin
//     if (aresetn == 1'b0)
//     begin
//       axis_clk_flag_13 <= 1'b0;
//       next_state_dbg_13 <= 1'b0;
//       clk_lost_cnt_13 <= 'h0;
//       clk_status[13] <= 1'b0;
//     end
//     else
//     begin
//       case(next_state_dbg_13)
//         1'h0 : begin
//                  if (des_clk13_flag_sync2 == 1'b1)
//                  begin
//                    axis_clk_flag_13 <= 1'b1;
//                    next_state_dbg_13 <= 1'b1;
//                    clk_lost_cnt_13 <= 'h0;
//                    clk_status[13] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_13 < 'd256)
//                    begin
//                      clk_lost_cnt_13 <= clk_lost_cnt_13 + 'h1;
//                      clk_status[13] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[13] <= 1'b1;
//                    end
//                    next_state_dbg_13 <= 1'b0;
//                  end
//                end
//         1'h1 : begin
//                  if (des_clk13_flag_sync2 == 1'b0)
//                  begin
//                    axis_clk_flag_13 <= 1'b0;
//                    next_state_dbg_13 <= 1'b0;
//                    clk_lost_cnt_13 <= 'h0;
//                    clk_status[13] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_13 < 'd256)
//                    begin
//                      clk_lost_cnt_13 <= clk_lost_cnt_13 + 'h1;
//                      clk_status[13] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[13] <= 1'b1;
//                    end
//                    next_state_dbg_13 <= 1'b1;
//                  end
//                end
//       endcase
//     end
//   end
// 
//   always @ (posedge des_clk13)
//   begin
//     case(next_state_core_13)
//       1'h0 : begin
//                if (axis_clk_flag_13_sync2 == 1'b1)
//                begin
//                  des_clk13_flag <= 1'b0;
//                  next_state_core_13 <= 1'b1;
//                end
//                else
//                begin
//                  next_state_core_13 <= 1'b0;
//                end
//              end
//       1'h1 : begin
//                if (axis_clk_flag_13_sync2 == 1'b0)
//                begin
//                  des_clk13_flag <= 1'b1;
//                  next_state_core_13 <= 1'b0;
//                end
//                else
//                begin
//                  next_state_core_13 <= 1'b1;
//                end
//              end
//     endcase
//   end
// end
// endgenerate
// generate
// if (C_NUM_CLOCKS > 14)
// begin: design_clks_15
// 
// reg axis_clk_flag_14;
//   reg des_clk14_flag = 1'b1;
//   reg next_state_dbg_14;
//   reg next_state_core_14 = 1'b0;
//   reg [15:0] clk_lost_cnt_14;
//   wire des_clk14_flag_sync1, des_clk14_flag_sync2;
//   wire axis_clk_flag_14_sync1, axis_clk_flag_14_sync2;
// 
//   always @ (posedge axis_clk)
//   begin
//     des_clk14_flag_sync1 <= des_clk14_flag;
//     des_clk14_flag_sync2 <= des_clk14_flag_sync1;
//   end
// 
//   always @ (posedge des_clk0)
//   begin
//     axis_clk_flag_14_sync1 <= axis_clk_flag_14;
//     axis_clk_flag_14_sync2 <= axis_clk_flag_14_sync1;
//   end
// 
//   always @ (posedge axis_clk)
//   begin
//     if (aresetn == 1'b0)
//     begin
//       axis_clk_flag_14 <= 1'b0;
//       next_state_dbg_14 <= 1'b0;
//       clk_lost_cnt_14 <= 'h0;
//       clk_status[14] <= 1'b0;
//     end
//     else
//     begin
//       case(next_state_dbg_14)
//         1'h0 : begin
//                  if (des_clk14_flag_sync2 == 1'b1)
//                  begin
//                    axis_clk_flag_14 <= 1'b1;
//                    next_state_dbg_14 <= 1'b1;
//                    clk_lost_cnt_14 <= 'h0;
//                    clk_status[14] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_14 < 'd256)
//                    begin
//                      clk_lost_cnt_14 <= clk_lost_cnt_14 + 'h1;
//                      clk_status[14] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[14] <= 1'b1;
//                    end
//                    next_state_dbg_14 <= 1'b0;
//                  end
//                end
//         1'h1 : begin
//                  if (des_clk14_flag_sync2 == 1'b0)
//                  begin
//                    axis_clk_flag_14 <= 1'b0;
//                    next_state_dbg_14 <= 1'b0;
//                    clk_lost_cnt_14 <= 'h0;
//                    clk_status[14] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_14 < 'd256)
//                    begin
//                      clk_lost_cnt_14 <= clk_lost_cnt_14 + 'h1;
//                      clk_status[14] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[14] <= 1'b1;
//                    end
//                    next_state_dbg_14 <= 1'b1;
//                  end
//                end
//       endcase
//     end
//   end
// 
//   always @ (posedge des_clk14)
//   begin
//     case(next_state_core_14)
//       1'h0 : begin
//                if (axis_clk_flag_14_sync2 == 1'b1)
//                begin
//                  des_clk14_flag <= 1'b0;
//                  next_state_core_14 <= 1'b1;
//                end
//                else
//                begin
//                  next_state_core_14 <= 1'b0;
//                end
//              end
//       1'h1 : begin
//                if (axis_clk_flag_14_sync2 == 1'b0)
//                begin
//                  des_clk14_flag <= 1'b1;
//                  next_state_core_14 <= 1'b0;
//                end
//                else
//                begin
//                  next_state_core_14 <= 1'b1;
//                end
//              end
//     endcase
//   end
// end
// endgenerate
// generate
// if (C_NUM_CLOCKS > 15)
// begin: design_clks_16
// 
// reg axis_clk_flag_15;
//   reg des_clk15_flag = 1'b1;
//   reg next_state_dbg_15;
//   reg next_state_core_15 = 1'b0;
//   reg [15:0] clk_lost_cnt_15;
//   wire des_clk15_flag_sync1, des_clk15_flag_sync2;
//   wire axis_clk_flag_15_sync1, axis_clk_flag_15_sync2;
// 
//   always @ (posedge axis_clk)
//   begin
//     des_clk15_flag_sync1 <= des_clk15_flag;
//     des_clk15_flag_sync2 <= des_clk15_flag_sync1;
//   end
// 
//   always @ (posedge des_clk0)
//   begin
//     axis_clk_flag_15_sync1 <= axis_clk_flag_15;
//     axis_clk_flag_15_sync2 <= axis_clk_flag_15_sync1;
//   end
// 
//   always @ (posedge axis_clk)
//   begin
//     if (aresetn == 1'b0)
//     begin
//       axis_clk_flag_15 <= 1'b0;
//       next_state_dbg_15 <= 1'b0;
//       clk_lost_cnt_15 <= 'h0;
//       clk_status[15] <= 1'b0;
//     end
//     else
//     begin
//       case(next_state_dbg_15)
//         1'h0 : begin
//                  if (des_clk15_flag_sync2 == 1'b1)
//                  begin
//                    axis_clk_flag_15 <= 1'b1;
//                    next_state_dbg_15 <= 1'b1;
//                    clk_lost_cnt_15 <= 'h0;
//                    clk_status[15] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_15 < 'd256)
//                    begin
//                      clk_lost_cnt_15 <= clk_lost_cnt_15 + 'h1;
//                      clk_status[15] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[15] <= 1'b1;
//                    end
//                    next_state_dbg_15 <= 1'b0;
//                  end
//                end
//         1'h1 : begin
//                  if (des_clk15_flag_sync2 == 1'b0)
//                  begin
//                    axis_clk_flag_15 <= 1'b0;
//                    next_state_dbg_15 <= 1'b0;
//                    clk_lost_cnt_15 <= 'h0;
//                    clk_status[15] <= 1'b0;
//                  end
//                  else
//                  begin
//                    if (clk_lost_cnt_15 < 'd256)
//                    begin
//                      clk_lost_cnt_15 <= clk_lost_cnt_15 + 'h1;
//                      clk_status[15] <= 1'b0;
//                    end
//                    else
//                    begin
//                      clk_status[15] <= 1'b1;
//                    end
//                    next_state_dbg_15 <= 1'b1;
//                  end
//                end
//       endcase
//     end
//   end
// 
//   always @ (posedge des_clk15)
//   begin
//     case(next_state_core_15)
//       1'h0 : begin
//                if (axis_clk_flag_15_sync2 == 1'b1)
//                begin
//                  des_clk15_flag <= 1'b0;
//                  next_state_core_15 <= 1'b1;
//                end
//                else
//                begin
//                  next_state_core_15 <= 1'b0;
//                end
//              end
//       1'h1 : begin
//                if (axis_clk_flag_15_sync2 == 1'b0)
//                begin
//                  des_clk15_flag <= 1'b1;
//                  next_state_core_15 <= 1'b0;
//                end
//                else
//                begin
//                  next_state_core_15 <= 1'b1;
//                end
//              end
//     endcase
//   end
// end 
// endgenerate

endmodule



