//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_a7b3.bd
//Design : bd_a7b3
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_a7b3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_a7b3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=52,numReposBlks=52,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "CPM_bd_axis_ila_0_0.hwdef" *) 
module bd_a7b3
   (SLOT_0_AXI_araddr,
    SLOT_0_AXI_arburst,
    SLOT_0_AXI_arcache,
    SLOT_0_AXI_arid,
    SLOT_0_AXI_arlen,
    SLOT_0_AXI_arlock,
    SLOT_0_AXI_arprot,
    SLOT_0_AXI_arqos,
    SLOT_0_AXI_arready,
    SLOT_0_AXI_arregion,
    SLOT_0_AXI_arsize,
    SLOT_0_AXI_aruser,
    SLOT_0_AXI_arvalid,
    SLOT_0_AXI_awaddr,
    SLOT_0_AXI_awburst,
    SLOT_0_AXI_awcache,
    SLOT_0_AXI_awid,
    SLOT_0_AXI_awlen,
    SLOT_0_AXI_awlock,
    SLOT_0_AXI_awprot,
    SLOT_0_AXI_awqos,
    SLOT_0_AXI_awready,
    SLOT_0_AXI_awregion,
    SLOT_0_AXI_awsize,
    SLOT_0_AXI_awuser,
    SLOT_0_AXI_awvalid,
    SLOT_0_AXI_bid,
    SLOT_0_AXI_bready,
    SLOT_0_AXI_bresp,
    SLOT_0_AXI_bvalid,
    SLOT_0_AXI_rdata,
    SLOT_0_AXI_rid,
    SLOT_0_AXI_rlast,
    SLOT_0_AXI_rready,
    SLOT_0_AXI_rresp,
    SLOT_0_AXI_rvalid,
    SLOT_0_AXI_wdata,
    SLOT_0_AXI_wlast,
    SLOT_0_AXI_wready,
    SLOT_0_AXI_wstrb,
    SLOT_0_AXI_wvalid,
    clk,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXI, ADDR_WIDTH 64, APERTURES {0x201_0000_0000 1G}, ARUSER_WIDTH 18, AWUSER_WIDTH 18, BUSER_WIDTH 0, CATEGORY pl, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, DATA_WIDTH 32, FREQ_HZ 250000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 2, INSERT_VIP 0, MAX_BURST_LENGTH 256, MY_CATEGORY noc, NOC_ID -1, NUM_READ_OUTSTANDING 32, NUM_READ_THREADS 4, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 4, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WRITE_BUFFER_SIZE 80, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [63:0]SLOT_0_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARBURST" *) input [1:0]SLOT_0_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARCACHE" *) input [3:0]SLOT_0_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARID" *) input [1:0]SLOT_0_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARLEN" *) input [7:0]SLOT_0_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARLOCK" *) input [0:0]SLOT_0_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARPROT" *) input [2:0]SLOT_0_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARQOS" *) input [3:0]SLOT_0_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARREADY" *) input [0:0]SLOT_0_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARREGION" *) input [3:0]SLOT_0_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARSIZE" *) input [2:0]SLOT_0_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARUSER" *) input [17:0]SLOT_0_AXI_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARVALID" *) input [0:0]SLOT_0_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWADDR" *) input [63:0]SLOT_0_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWBURST" *) input [1:0]SLOT_0_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWCACHE" *) input [3:0]SLOT_0_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWID" *) input [1:0]SLOT_0_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWLEN" *) input [7:0]SLOT_0_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWLOCK" *) input [0:0]SLOT_0_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWPROT" *) input [2:0]SLOT_0_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWQOS" *) input [3:0]SLOT_0_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWREADY" *) input [0:0]SLOT_0_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWREGION" *) input [3:0]SLOT_0_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWSIZE" *) input [2:0]SLOT_0_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWUSER" *) input [17:0]SLOT_0_AXI_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWVALID" *) input [0:0]SLOT_0_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BID" *) input [1:0]SLOT_0_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BREADY" *) input [0:0]SLOT_0_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BRESP" *) input [1:0]SLOT_0_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BVALID" *) input [0:0]SLOT_0_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RDATA" *) input [31:0]SLOT_0_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RID" *) input [1:0]SLOT_0_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RLAST" *) input [0:0]SLOT_0_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RREADY" *) input [0:0]SLOT_0_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RRESP" *) input [1:0]SLOT_0_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RVALID" *) input [0:0]SLOT_0_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WDATA" *) input [31:0]SLOT_0_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WLAST" *) input [0:0]SLOT_0_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WREADY" *) input [0:0]SLOT_0_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WSTRB" *) input [3:0]SLOT_0_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WVALID" *) input [0:0]SLOT_0_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXI, ASSOCIATED_RESET resetn, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;

  wire [63:0]SLOT_0_AXI_araddr_1;
  wire [1:0]SLOT_0_AXI_arburst_1;
  wire [3:0]SLOT_0_AXI_arcache_1;
  wire [1:0]SLOT_0_AXI_arid_1;
  wire [7:0]SLOT_0_AXI_arlen_1;
  wire [0:0]SLOT_0_AXI_arlock_1;
  wire [2:0]SLOT_0_AXI_arprot_1;
  wire [3:0]SLOT_0_AXI_arqos_1;
  wire [0:0]SLOT_0_AXI_arready_1;
  wire [3:0]SLOT_0_AXI_arregion_1;
  wire [2:0]SLOT_0_AXI_arsize_1;
  wire [17:0]SLOT_0_AXI_aruser_1;
  wire [0:0]SLOT_0_AXI_arvalid_1;
  wire [63:0]SLOT_0_AXI_awaddr_1;
  wire [1:0]SLOT_0_AXI_awburst_1;
  wire [3:0]SLOT_0_AXI_awcache_1;
  wire [1:0]SLOT_0_AXI_awid_1;
  wire [7:0]SLOT_0_AXI_awlen_1;
  wire [0:0]SLOT_0_AXI_awlock_1;
  wire [2:0]SLOT_0_AXI_awprot_1;
  wire [3:0]SLOT_0_AXI_awqos_1;
  wire [0:0]SLOT_0_AXI_awready_1;
  wire [3:0]SLOT_0_AXI_awregion_1;
  wire [2:0]SLOT_0_AXI_awsize_1;
  wire [17:0]SLOT_0_AXI_awuser_1;
  wire [0:0]SLOT_0_AXI_awvalid_1;
  wire [1:0]SLOT_0_AXI_bid_1;
  wire [0:0]SLOT_0_AXI_bready_1;
  wire [1:0]SLOT_0_AXI_bresp_1;
  wire [0:0]SLOT_0_AXI_bvalid_1;
  wire [31:0]SLOT_0_AXI_rdata_1;
  wire [1:0]SLOT_0_AXI_rid_1;
  wire [0:0]SLOT_0_AXI_rlast_1;
  wire [0:0]SLOT_0_AXI_rready_1;
  wire [1:0]SLOT_0_AXI_rresp_1;
  wire [0:0]SLOT_0_AXI_rvalid_1;
  wire [31:0]SLOT_0_AXI_wdata_1;
  wire [0:0]SLOT_0_AXI_wlast_1;
  wire [0:0]SLOT_0_AXI_wready_1;
  wire [3:0]SLOT_0_AXI_wstrb_1;
  wire [0:0]SLOT_0_AXI_wvalid_1;
  wire [9:0]axis_cap_ctrl_addr;
  wire axis_cap_ctrl_full;
  wire axis_cap_ctrl_full_iclk;
  wire [9:0]axis_cap_ctrl_hwcnt;
  wire [9:0]axis_cap_ctrl_lwcnt;
  wire [9:0]axis_cap_ctrl_scnt;
  wire [2:0]axis_cap_ctrl_trig_state;
  wire [2:0]axis_cap_ctrl_trig_state_iclk;
  wire axis_cap_ctrl_trigger_o;
  wire axis_cap_ctrl_write_en;
  wire axis_dbg_stub_aclk_int;
  wire axis_dbg_stub_aresetn_int;
  wire [31:0]axis_dbg_stub_s_axis_int_TDATA;
  wire axis_dbg_stub_s_axis_int_TLAST;
  wire axis_dbg_stub_s_axis_int_TREADY;
  wire axis_dbg_stub_s_axis_int_TVALID;
  wire axis_dbg_sync_2_dest_out;
  wire [9:0]axis_dbg_sync_3_dest_out_bus;
  wire [9:0]axis_dbg_sync_4_dest_out_bus;
  wire [2:0]axis_dbg_sync_5_dest_out_bus;
  wire axis_dbg_sync_6_dest_arst;
  wire [31:0]axis_ila_intf_M_AXIS_TDATA;
  wire axis_ila_intf_M_AXIS_TLAST;
  wire axis_ila_intf_M_AXIS_TREADY;
  wire axis_ila_intf_M_AXIS_TVALID;
  wire axis_ila_intf_adv_trig_config_o;
  wire [9:0]axis_ila_intf_app_spec_o;
  wire axis_ila_intf_aresetn_out;
  wire axis_ila_intf_arm_o;
  wire [9:0]axis_ila_intf_bit_sel_o;
  wire [1:0]axis_ila_intf_capture_mode_o;
  wire axis_ila_intf_cfg_data_o;
  wire axis_ila_intf_cfg_en_o;
  wire [2:0]axis_ila_intf_ct_state_sel_o;
  wire axis_ila_intf_halt_o;
  wire [9:0]axis_ila_intf_max_bit_o;
  wire axis_ila_intf_read_addr_reset_o;
  wire axis_ila_intf_read_data_en_o;
  wire axis_ila_intf_scnt_max_eq_1_o;
  wire [9:0]axis_ila_intf_trace_rd_addr_o;
  wire axis_ila_intf_trig_pos_eq_0_o;
  wire axis_ila_intf_trig_pos_eq_scnt_max_o;
  wire axis_ila_intf_wr_cc_config_o;
  wire axis_ila_intf_wr_mu_config_o;
  wire axis_ila_intf_wr_tc_config_o;
  wire [63:0]axis_ila_pp_probe0_out;
  wire [3:0]axis_ila_pp_probe10_out;
  wire [1:0]axis_ila_pp_probe11_out;
  wire [63:0]axis_ila_pp_probe12_out;
  wire [7:0]axis_ila_pp_probe13_out;
  wire [2:0]axis_ila_pp_probe14_out;
  wire [1:0]axis_ila_pp_probe15_out;
  wire [0:0]axis_ila_pp_probe16_out;
  wire [3:0]axis_ila_pp_probe17_out;
  wire [2:0]axis_ila_pp_probe18_out;
  wire [3:0]axis_ila_pp_probe19_out;
  wire [7:0]axis_ila_pp_probe1_out;
  wire [3:0]axis_ila_pp_probe20_out;
  wire [31:0]axis_ila_pp_probe21_out;
  wire [1:0]axis_ila_pp_probe22_out;
  wire [1:0]axis_ila_pp_probe23_out;
  wire [17:0]axis_ila_pp_probe24_out;
  wire [1:0]axis_ila_pp_probe25_out;
  wire [17:0]axis_ila_pp_probe26_out;
  wire [1:0]axis_ila_pp_probe27_out;
  wire [1:0]axis_ila_pp_probe28_out;
  wire [1:0]axis_ila_pp_probe29_out;
  wire [2:0]axis_ila_pp_probe2_out;
  wire [2:0]axis_ila_pp_probe30_out;
  wire [1:0]axis_ila_pp_probe31_out;
  wire [1:0]axis_ila_pp_probe32_out;
  wire [2:0]axis_ila_pp_probe33_out;
  wire [1:0]axis_ila_pp_probe3_out;
  wire [0:0]axis_ila_pp_probe4_out;
  wire [3:0]axis_ila_pp_probe5_out;
  wire [2:0]axis_ila_pp_probe6_out;
  wire [3:0]axis_ila_pp_probe7_out;
  wire [3:0]axis_ila_pp_probe8_out;
  wire [31:0]axis_ila_pp_probe9_out;
  wire axis_itct_cc_cfg_din0;
  wire axis_itct_cc_cfg_din1;
  wire axis_itct_cc_cfg_din2;
  wire axis_itct_cc_cfg_din3;
  wire axis_itct_cc_cfg_en0;
  wire axis_itct_cc_cfg_en1;
  wire axis_itct_cc_cfg_en2;
  wire axis_itct_cc_cfg_en3;
  wire axis_itct_cfg_din0;
  wire axis_itct_cfg_din1;
  wire axis_itct_cfg_din10;
  wire axis_itct_cfg_din11;
  wire axis_itct_cfg_din12;
  wire axis_itct_cfg_din13;
  wire axis_itct_cfg_din14;
  wire axis_itct_cfg_din15;
  wire axis_itct_cfg_din16;
  wire axis_itct_cfg_din17;
  wire axis_itct_cfg_din18;
  wire axis_itct_cfg_din19;
  wire axis_itct_cfg_din2;
  wire axis_itct_cfg_din20;
  wire axis_itct_cfg_din21;
  wire axis_itct_cfg_din22;
  wire axis_itct_cfg_din23;
  wire axis_itct_cfg_din24;
  wire axis_itct_cfg_din25;
  wire axis_itct_cfg_din26;
  wire axis_itct_cfg_din27;
  wire axis_itct_cfg_din28;
  wire axis_itct_cfg_din29;
  wire axis_itct_cfg_din3;
  wire axis_itct_cfg_din4;
  wire axis_itct_cfg_din5;
  wire axis_itct_cfg_din6;
  wire axis_itct_cfg_din7;
  wire axis_itct_cfg_din8;
  wire axis_itct_cfg_din9;
  wire axis_itct_cfg_en0;
  wire axis_itct_cfg_en1;
  wire axis_itct_cfg_en10;
  wire axis_itct_cfg_en11;
  wire axis_itct_cfg_en12;
  wire axis_itct_cfg_en13;
  wire axis_itct_cfg_en14;
  wire axis_itct_cfg_en15;
  wire axis_itct_cfg_en16;
  wire axis_itct_cfg_en17;
  wire axis_itct_cfg_en18;
  wire axis_itct_cfg_en19;
  wire axis_itct_cfg_en2;
  wire axis_itct_cfg_en20;
  wire axis_itct_cfg_en21;
  wire axis_itct_cfg_en22;
  wire axis_itct_cfg_en23;
  wire axis_itct_cfg_en24;
  wire axis_itct_cfg_en25;
  wire axis_itct_cfg_en26;
  wire axis_itct_cfg_en27;
  wire axis_itct_cfg_en28;
  wire axis_itct_cfg_en29;
  wire axis_itct_cfg_en3;
  wire axis_itct_cfg_en4;
  wire axis_itct_cfg_en5;
  wire axis_itct_cfg_en6;
  wire axis_itct_cfg_en7;
  wire axis_itct_cfg_en8;
  wire axis_itct_cfg_en9;
  wire axis_itct_tc0_cfg_din;
  wire axis_itct_tc0_cfg_en;
  wire [29:0]axis_itct_trigger_din;
  wire axis_mem_data_out_en_o;
  wire [31:0]axis_mem_data_word_out_o;
  wire axis_mem_reset_out_ack_o;
  wire [9:0]axis_mem_trace_rd_addr_o;
  wire [13:0]axis_mem_trace_rd_wrd_cnt_o;
  wire axis_mu0_0_cfg_dout;
  wire axis_mu0_0_match_out;
  wire axis_mu11_0_cfg_dout;
  wire axis_mu11_0_match_out;
  wire axis_mu12_0_cfg_dout;
  wire axis_mu12_0_match_out;
  wire axis_mu13_0_cfg_dout;
  wire axis_mu13_0_match_out;
  wire axis_mu14_0_cfg_dout;
  wire axis_mu14_0_match_out;
  wire axis_mu15_0_cfg_dout;
  wire axis_mu15_0_match_out;
  wire axis_mu16_0_cfg_dout;
  wire axis_mu16_0_match_out;
  wire axis_mu17_0_cfg_dout;
  wire axis_mu17_0_match_out;
  wire axis_mu18_0_cfg_dout;
  wire axis_mu18_0_match_out;
  wire axis_mu19_0_cfg_dout;
  wire axis_mu19_0_match_out;
  wire axis_mu1_0_cfg_dout;
  wire axis_mu1_0_match_out;
  wire axis_mu20_0_cfg_dout;
  wire axis_mu20_0_match_out;
  wire axis_mu23_0_cfg_dout;
  wire axis_mu23_0_match_out;
  wire axis_mu24_0_cfg_dout;
  wire axis_mu24_0_match_out;
  wire axis_mu25_0_cfg_dout;
  wire axis_mu25_0_match_out;
  wire axis_mu26_0_cfg_dout;
  wire axis_mu26_0_match_out;
  wire axis_mu27_0_cfg_dout;
  wire axis_mu27_0_match_out;
  wire axis_mu28_0_cfg_dout;
  wire axis_mu28_0_match_out;
  wire axis_mu29_0_cfg_dout;
  wire axis_mu29_0_match_out;
  wire axis_mu2_0_cfg_dout;
  wire axis_mu2_0_match_out;
  wire axis_mu30_0_cfg_dout;
  wire axis_mu30_0_match_out;
  wire axis_mu31_0_cfg_dout;
  wire axis_mu31_0_match_out;
  wire axis_mu32_0_cfg_dout;
  wire axis_mu32_0_match_out;
  wire axis_mu33_0_cfg_dout;
  wire axis_mu33_0_match_out;
  wire axis_mu3_0_cfg_dout;
  wire axis_mu3_0_match_out;
  wire axis_mu4_0_cfg_dout;
  wire axis_mu4_0_match_out;
  wire axis_mu5_0_cfg_dout;
  wire axis_mu5_0_match_out;
  wire axis_mu6_0_cfg_dout;
  wire axis_mu6_0_match_out;
  wire axis_mu7_0_cfg_dout;
  wire axis_mu7_0_match_out;
  wire axis_mu8_0_cfg_dout;
  wire axis_mu8_0_match_out;
  wire cc_axis_mu0_cfg_dout;
  wire cc_axis_mu0_match_out;
  wire cc_axis_mu1_cfg_dout;
  wire cc_axis_mu1_match_out;
  wire cc_axis_mu2_cfg_dout;
  wire cc_axis_mu2_match_out;
  wire cc_axis_mu3_cfg_dout;
  wire cc_axis_mu3_match_out;
  wire clk_1;
  wire [1:0]slot_0_ar_dout;
  wire [1:0]slot_0_aw_dout;
  wire [1:0]slot_0_b_dout;
  wire [2:0]slot_0_r_dout;
  wire [2:0]slot_0_w_dout;
  wire tc_axis_mu0_cfg_dout;
  wire tc_axis_mu0_match_out;
  wire [0:0]xlconstant_dout;

  assign SLOT_0_AXI_araddr_1 = SLOT_0_AXI_araddr[63:0];
  assign SLOT_0_AXI_arburst_1 = SLOT_0_AXI_arburst[1:0];
  assign SLOT_0_AXI_arcache_1 = SLOT_0_AXI_arcache[3:0];
  assign SLOT_0_AXI_arid_1 = SLOT_0_AXI_arid[1:0];
  assign SLOT_0_AXI_arlen_1 = SLOT_0_AXI_arlen[7:0];
  assign SLOT_0_AXI_arlock_1 = SLOT_0_AXI_arlock[0];
  assign SLOT_0_AXI_arprot_1 = SLOT_0_AXI_arprot[2:0];
  assign SLOT_0_AXI_arqos_1 = SLOT_0_AXI_arqos[3:0];
  assign SLOT_0_AXI_arready_1 = SLOT_0_AXI_arready[0];
  assign SLOT_0_AXI_arregion_1 = SLOT_0_AXI_arregion[3:0];
  assign SLOT_0_AXI_arsize_1 = SLOT_0_AXI_arsize[2:0];
  assign SLOT_0_AXI_aruser_1 = SLOT_0_AXI_aruser[17:0];
  assign SLOT_0_AXI_arvalid_1 = SLOT_0_AXI_arvalid[0];
  assign SLOT_0_AXI_awaddr_1 = SLOT_0_AXI_awaddr[63:0];
  assign SLOT_0_AXI_awburst_1 = SLOT_0_AXI_awburst[1:0];
  assign SLOT_0_AXI_awcache_1 = SLOT_0_AXI_awcache[3:0];
  assign SLOT_0_AXI_awid_1 = SLOT_0_AXI_awid[1:0];
  assign SLOT_0_AXI_awlen_1 = SLOT_0_AXI_awlen[7:0];
  assign SLOT_0_AXI_awlock_1 = SLOT_0_AXI_awlock[0];
  assign SLOT_0_AXI_awprot_1 = SLOT_0_AXI_awprot[2:0];
  assign SLOT_0_AXI_awqos_1 = SLOT_0_AXI_awqos[3:0];
  assign SLOT_0_AXI_awready_1 = SLOT_0_AXI_awready[0];
  assign SLOT_0_AXI_awregion_1 = SLOT_0_AXI_awregion[3:0];
  assign SLOT_0_AXI_awsize_1 = SLOT_0_AXI_awsize[2:0];
  assign SLOT_0_AXI_awuser_1 = SLOT_0_AXI_awuser[17:0];
  assign SLOT_0_AXI_awvalid_1 = SLOT_0_AXI_awvalid[0];
  assign SLOT_0_AXI_bid_1 = SLOT_0_AXI_bid[1:0];
  assign SLOT_0_AXI_bready_1 = SLOT_0_AXI_bready[0];
  assign SLOT_0_AXI_bresp_1 = SLOT_0_AXI_bresp[1:0];
  assign SLOT_0_AXI_bvalid_1 = SLOT_0_AXI_bvalid[0];
  assign SLOT_0_AXI_rdata_1 = SLOT_0_AXI_rdata[31:0];
  assign SLOT_0_AXI_rid_1 = SLOT_0_AXI_rid[1:0];
  assign SLOT_0_AXI_rlast_1 = SLOT_0_AXI_rlast[0];
  assign SLOT_0_AXI_rready_1 = SLOT_0_AXI_rready[0];
  assign SLOT_0_AXI_rresp_1 = SLOT_0_AXI_rresp[1:0];
  assign SLOT_0_AXI_rvalid_1 = SLOT_0_AXI_rvalid[0];
  assign SLOT_0_AXI_wdata_1 = SLOT_0_AXI_wdata[31:0];
  assign SLOT_0_AXI_wlast_1 = SLOT_0_AXI_wlast[0];
  assign SLOT_0_AXI_wready_1 = SLOT_0_AXI_wready[0];
  assign SLOT_0_AXI_wstrb_1 = SLOT_0_AXI_wstrb[3:0];
  assign SLOT_0_AXI_wvalid_1 = SLOT_0_AXI_wvalid[0];
  assign clk_1 = clk;
  bd_a7b3_axis_cap_ctrl_0 axis_cap_ctrl
       (.addr(axis_cap_ctrl_addr),
        .addr_sel(axis_ila_intf_bit_sel_o),
        .aresetn(axis_ila_intf_aresetn_out),
        .armed(axis_ila_intf_arm_o),
        .capture_fsm_i(xlconstant_dout),
        .capture_mode_i(axis_ila_intf_capture_mode_o),
        .capture_sqc_in(xlconstant_dout),
        .en_adv_trigger_i(axis_ila_intf_adv_trig_config_o),
        .full(axis_cap_ctrl_full),
        .full_iclk(axis_cap_ctrl_full_iclk),
        .halt(axis_ila_intf_halt_o),
        .hwcnt(axis_cap_ctrl_hwcnt),
        .hwcnt_eq_wcnt_max(cc_axis_mu2_match_out),
        .ila_clk(clk_1),
        .lwcnt(axis_cap_ctrl_lwcnt),
        .lwcnt_eq_scnt_max(cc_axis_mu3_match_out),
        .max_bit(axis_ila_intf_max_bit_o),
        .scnt(axis_cap_ctrl_scnt),
        .scnt_eq_scnt_max(cc_axis_mu1_match_out),
        .scnt_eq_trig_pos(cc_axis_mu0_match_out),
        .scnt_max_eq_1(axis_ila_intf_scnt_max_eq_1_o),
        .shifted_trig_in(1'b0),
        .trig_out_fsm_i(xlconstant_dout),
        .trig_pos_eq_0(axis_ila_intf_trig_pos_eq_0_o),
        .trig_pos_eq_scnt_max(axis_ila_intf_trig_pos_eq_scnt_max_o),
        .trig_state(axis_cap_ctrl_trig_state),
        .trig_state_iclk(axis_cap_ctrl_trig_state_iclk),
        .trigger(tc_axis_mu0_match_out),
        .trigger_o(axis_cap_ctrl_trigger_o),
        .use_case_i(axis_ila_intf_ct_state_sel_o),
        .write_en(axis_cap_ctrl_write_en));
  bd_a7b3_axis_dbg_stub_0 axis_dbg_stub
       (.aclk(xlconstant_dout),
        .aclk_int(axis_dbg_stub_aclk_int),
        .aresetn(xlconstant_dout),
        .aresetn_int(axis_dbg_stub_aresetn_int),
        .m_axis_tdata_int(axis_ila_intf_M_AXIS_TDATA),
        .m_axis_tlast_int(axis_ila_intf_M_AXIS_TLAST),
        .m_axis_tready(1'b1),
        .m_axis_tready_int(axis_ila_intf_M_AXIS_TREADY),
        .m_axis_tvalid_int(axis_ila_intf_M_AXIS_TVALID),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdata_int(axis_dbg_stub_s_axis_int_TDATA),
        .s_axis_tlast(1'b0),
        .s_axis_tlast_int(axis_dbg_stub_s_axis_int_TLAST),
        .s_axis_tready_int(axis_dbg_stub_s_axis_int_TREADY),
        .s_axis_tvalid(1'b0),
        .s_axis_tvalid_int(axis_dbg_stub_s_axis_int_TVALID));
  bd_a7b3_axis_dbg_sync_2_0 axis_dbg_sync_2
       (.dest_clk_in(axis_dbg_stub_aclk_int),
        .dest_out(axis_dbg_sync_2_dest_out),
        .src_clk_in(clk_1),
        .src_in(axis_cap_ctrl_full));
  bd_a7b3_axis_dbg_sync_3_0 axis_dbg_sync_3
       (.dest_clk_in(axis_dbg_stub_aclk_int),
        .dest_out_bus(axis_dbg_sync_3_dest_out_bus),
        .src_clk_in(clk_1),
        .src_in_bus(axis_cap_ctrl_hwcnt));
  bd_a7b3_axis_dbg_sync_4_0 axis_dbg_sync_4
       (.dest_clk_in(axis_dbg_stub_aclk_int),
        .dest_out_bus(axis_dbg_sync_4_dest_out_bus),
        .src_clk_in(clk_1),
        .src_in_bus(axis_cap_ctrl_lwcnt));
  bd_a7b3_axis_dbg_sync_5_0 axis_dbg_sync_5
       (.dest_clk_in(axis_dbg_stub_aclk_int),
        .dest_out_bus(axis_dbg_sync_5_dest_out_bus),
        .src_clk_in(clk_1),
        .src_in_bus(axis_cap_ctrl_trig_state));
  bd_a7b3_axis_dbg_sync_6_0 axis_dbg_sync_6
       (.dest_arst(axis_dbg_sync_6_dest_arst),
        .dest_clk_in(clk_1),
        .src_rst_in(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_ila_intf_0 axis_ila_intf
       (.M_AXIS_ACLK(axis_dbg_stub_aclk_int),
        .M_AXIS_ARESETN(axis_dbg_stub_aresetn_int),
        .M_AXIS_TDATA(axis_ila_intf_M_AXIS_TDATA),
        .M_AXIS_TLAST(axis_ila_intf_M_AXIS_TLAST),
        .M_AXIS_TREADY(axis_ila_intf_M_AXIS_TREADY),
        .M_AXIS_TVALID(axis_ila_intf_M_AXIS_TVALID),
        .S_AXIS_ACLK(axis_dbg_stub_aclk_int),
        .S_AXIS_ARESETN(axis_dbg_stub_aresetn_int),
        .S_AXIS_TDATA(axis_dbg_stub_s_axis_int_TDATA),
        .S_AXIS_TLAST(axis_dbg_stub_s_axis_int_TLAST),
        .S_AXIS_TREADY(axis_dbg_stub_s_axis_int_TREADY),
        .S_AXIS_TVALID(axis_dbg_stub_s_axis_int_TVALID),
        .adv_trig_config_o(axis_ila_intf_adv_trig_config_o),
        .app_spec_o(axis_ila_intf_app_spec_o),
        .aresetn(axis_dbg_sync_6_dest_arst),
        .aresetn_out(axis_ila_intf_aresetn_out),
        .arm_o(axis_ila_intf_arm_o),
        .bit_sel_o(axis_ila_intf_bit_sel_o),
        .cap_done_i(axis_dbg_sync_2_dest_out),
        .cap_done_iclk(axis_cap_ctrl_full_iclk),
        .cap_state_i(axis_dbg_sync_5_dest_out_bus),
        .cap_state_iclk(axis_cap_ctrl_trig_state_iclk),
        .capture_mode_o(axis_ila_intf_capture_mode_o),
        .cfg_data_o(axis_ila_intf_cfg_data_o),
        .cfg_en_o(axis_ila_intf_cfg_en_o),
        .ct_state_sel_o(axis_ila_intf_ct_state_sel_o),
        .data_out_en_i(axis_mem_data_out_en_o),
        .data_word_out_i(axis_mem_data_word_out_o),
        .halt_o(axis_ila_intf_halt_o),
        .halt_status_i(1'b0),
        .hwcnt_i(axis_dbg_sync_3_dest_out_bus),
        .ila_clk(clk_1),
        .lwcnt_i(axis_dbg_sync_4_dest_out_bus),
        .max_bit_o(axis_ila_intf_max_bit_o),
        .read_addr_reset_o(axis_ila_intf_read_addr_reset_o),
        .read_data_en_o(axis_ila_intf_read_data_en_o),
        .reset_out_ack_i(axis_mem_reset_out_ack_o),
        .scnt_max_eq_1_o(axis_ila_intf_scnt_max_eq_1_o),
        .tas_status_i(1'b0),
        .trace_rd_addr_i(axis_mem_trace_rd_addr_o),
        .trace_rd_addr_o(axis_ila_intf_trace_rd_addr_o),
        .trace_rd_wrd_cnt_i(axis_mem_trace_rd_wrd_cnt_o),
        .trig_pos_eq_0_o(axis_ila_intf_trig_pos_eq_0_o),
        .trig_pos_eq_scnt_max_o(axis_ila_intf_trig_pos_eq_scnt_max_o),
        .wr_cc_config_o(axis_ila_intf_wr_cc_config_o),
        .wr_mu_config_o(axis_ila_intf_wr_mu_config_o),
        .wr_tc_config_o(axis_ila_intf_wr_tc_config_o));
  bd_a7b3_axis_ila_pp_0 axis_ila_pp
       (.clk(clk_1),
        .probe0(SLOT_0_AXI_awaddr_1),
        .probe0_out(axis_ila_pp_probe0_out),
        .probe1(SLOT_0_AXI_awlen_1),
        .probe10(SLOT_0_AXI_wstrb_1),
        .probe10_out(axis_ila_pp_probe10_out),
        .probe11(SLOT_0_AXI_bresp_1),
        .probe11_out(axis_ila_pp_probe11_out),
        .probe12(SLOT_0_AXI_araddr_1),
        .probe12_out(axis_ila_pp_probe12_out),
        .probe13(SLOT_0_AXI_arlen_1),
        .probe13_out(axis_ila_pp_probe13_out),
        .probe14(SLOT_0_AXI_arsize_1),
        .probe14_out(axis_ila_pp_probe14_out),
        .probe15(SLOT_0_AXI_arburst_1),
        .probe15_out(axis_ila_pp_probe15_out),
        .probe16(SLOT_0_AXI_arlock_1),
        .probe16_out(axis_ila_pp_probe16_out),
        .probe17(SLOT_0_AXI_arcache_1),
        .probe17_out(axis_ila_pp_probe17_out),
        .probe18(SLOT_0_AXI_arprot_1),
        .probe18_out(axis_ila_pp_probe18_out),
        .probe19(SLOT_0_AXI_arregion_1),
        .probe19_out(axis_ila_pp_probe19_out),
        .probe1_out(axis_ila_pp_probe1_out),
        .probe2(SLOT_0_AXI_awsize_1),
        .probe20(SLOT_0_AXI_arqos_1),
        .probe20_out(axis_ila_pp_probe20_out),
        .probe21(SLOT_0_AXI_rdata_1),
        .probe21_out(axis_ila_pp_probe21_out),
        .probe22(SLOT_0_AXI_rresp_1),
        .probe22_out(axis_ila_pp_probe22_out),
        .probe23(SLOT_0_AXI_arid_1),
        .probe23_out(axis_ila_pp_probe23_out),
        .probe24(SLOT_0_AXI_aruser_1),
        .probe24_out(axis_ila_pp_probe24_out),
        .probe25(SLOT_0_AXI_awid_1),
        .probe25_out(axis_ila_pp_probe25_out),
        .probe26(SLOT_0_AXI_awuser_1),
        .probe26_out(axis_ila_pp_probe26_out),
        .probe27(SLOT_0_AXI_bid_1),
        .probe27_out(axis_ila_pp_probe27_out),
        .probe28(SLOT_0_AXI_rid_1),
        .probe28_out(axis_ila_pp_probe28_out),
        .probe29(slot_0_aw_dout),
        .probe29_out(axis_ila_pp_probe29_out),
        .probe2_out(axis_ila_pp_probe2_out),
        .probe3(SLOT_0_AXI_awburst_1),
        .probe30(slot_0_w_dout),
        .probe30_out(axis_ila_pp_probe30_out),
        .probe31(slot_0_b_dout),
        .probe31_out(axis_ila_pp_probe31_out),
        .probe32(slot_0_ar_dout),
        .probe32_out(axis_ila_pp_probe32_out),
        .probe33(slot_0_r_dout),
        .probe33_out(axis_ila_pp_probe33_out),
        .probe3_out(axis_ila_pp_probe3_out),
        .probe4(SLOT_0_AXI_awlock_1),
        .probe4_out(axis_ila_pp_probe4_out),
        .probe5(SLOT_0_AXI_awcache_1),
        .probe5_out(axis_ila_pp_probe5_out),
        .probe6(SLOT_0_AXI_awprot_1),
        .probe6_out(axis_ila_pp_probe6_out),
        .probe7(SLOT_0_AXI_awregion_1),
        .probe7_out(axis_ila_pp_probe7_out),
        .probe8(SLOT_0_AXI_awqos_1),
        .probe8_out(axis_ila_pp_probe8_out),
        .probe9(SLOT_0_AXI_wdata_1),
        .probe9_out(axis_ila_pp_probe9_out));
  bd_a7b3_axis_itct_0 axis_itct
       (.app_spec_i(axis_ila_intf_app_spec_o),
        .cc_cfg_din0(axis_itct_cc_cfg_din0),
        .cc_cfg_din1(axis_itct_cc_cfg_din1),
        .cc_cfg_din2(axis_itct_cc_cfg_din2),
        .cc_cfg_din3(axis_itct_cc_cfg_din3),
        .cc_cfg_dout0(cc_axis_mu0_cfg_dout),
        .cc_cfg_dout1(cc_axis_mu1_cfg_dout),
        .cc_cfg_dout2(cc_axis_mu2_cfg_dout),
        .cc_cfg_dout3(cc_axis_mu3_cfg_dout),
        .cc_cfg_en0(axis_itct_cc_cfg_en0),
        .cc_cfg_en1(axis_itct_cc_cfg_en1),
        .cc_cfg_en2(axis_itct_cc_cfg_en2),
        .cc_cfg_en3(axis_itct_cc_cfg_en3),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_data_i(axis_ila_intf_cfg_data_o),
        .cfg_din0(axis_itct_cfg_din0),
        .cfg_din1(axis_itct_cfg_din1),
        .cfg_din10(axis_itct_cfg_din10),
        .cfg_din11(axis_itct_cfg_din11),
        .cfg_din12(axis_itct_cfg_din12),
        .cfg_din13(axis_itct_cfg_din13),
        .cfg_din14(axis_itct_cfg_din14),
        .cfg_din15(axis_itct_cfg_din15),
        .cfg_din16(axis_itct_cfg_din16),
        .cfg_din17(axis_itct_cfg_din17),
        .cfg_din18(axis_itct_cfg_din18),
        .cfg_din19(axis_itct_cfg_din19),
        .cfg_din2(axis_itct_cfg_din2),
        .cfg_din20(axis_itct_cfg_din20),
        .cfg_din21(axis_itct_cfg_din21),
        .cfg_din22(axis_itct_cfg_din22),
        .cfg_din23(axis_itct_cfg_din23),
        .cfg_din24(axis_itct_cfg_din24),
        .cfg_din25(axis_itct_cfg_din25),
        .cfg_din26(axis_itct_cfg_din26),
        .cfg_din27(axis_itct_cfg_din27),
        .cfg_din28(axis_itct_cfg_din28),
        .cfg_din29(axis_itct_cfg_din29),
        .cfg_din3(axis_itct_cfg_din3),
        .cfg_din4(axis_itct_cfg_din4),
        .cfg_din5(axis_itct_cfg_din5),
        .cfg_din6(axis_itct_cfg_din6),
        .cfg_din7(axis_itct_cfg_din7),
        .cfg_din8(axis_itct_cfg_din8),
        .cfg_din9(axis_itct_cfg_din9),
        .cfg_dout0(axis_mu0_0_cfg_dout),
        .cfg_dout1(axis_mu1_0_cfg_dout),
        .cfg_dout10(axis_mu12_0_cfg_dout),
        .cfg_dout11(axis_mu13_0_cfg_dout),
        .cfg_dout12(axis_mu14_0_cfg_dout),
        .cfg_dout13(axis_mu15_0_cfg_dout),
        .cfg_dout14(axis_mu16_0_cfg_dout),
        .cfg_dout15(axis_mu17_0_cfg_dout),
        .cfg_dout16(axis_mu18_0_cfg_dout),
        .cfg_dout17(axis_mu19_0_cfg_dout),
        .cfg_dout18(axis_mu20_0_cfg_dout),
        .cfg_dout19(axis_mu23_0_cfg_dout),
        .cfg_dout2(axis_mu2_0_cfg_dout),
        .cfg_dout20(axis_mu24_0_cfg_dout),
        .cfg_dout21(axis_mu25_0_cfg_dout),
        .cfg_dout22(axis_mu26_0_cfg_dout),
        .cfg_dout23(axis_mu27_0_cfg_dout),
        .cfg_dout24(axis_mu28_0_cfg_dout),
        .cfg_dout25(axis_mu29_0_cfg_dout),
        .cfg_dout26(axis_mu30_0_cfg_dout),
        .cfg_dout27(axis_mu31_0_cfg_dout),
        .cfg_dout28(axis_mu32_0_cfg_dout),
        .cfg_dout29(axis_mu33_0_cfg_dout),
        .cfg_dout3(axis_mu3_0_cfg_dout),
        .cfg_dout4(axis_mu4_0_cfg_dout),
        .cfg_dout5(axis_mu5_0_cfg_dout),
        .cfg_dout6(axis_mu6_0_cfg_dout),
        .cfg_dout7(axis_mu7_0_cfg_dout),
        .cfg_dout8(axis_mu8_0_cfg_dout),
        .cfg_dout9(axis_mu11_0_cfg_dout),
        .cfg_en0(axis_itct_cfg_en0),
        .cfg_en1(axis_itct_cfg_en1),
        .cfg_en10(axis_itct_cfg_en10),
        .cfg_en11(axis_itct_cfg_en11),
        .cfg_en12(axis_itct_cfg_en12),
        .cfg_en13(axis_itct_cfg_en13),
        .cfg_en14(axis_itct_cfg_en14),
        .cfg_en15(axis_itct_cfg_en15),
        .cfg_en16(axis_itct_cfg_en16),
        .cfg_en17(axis_itct_cfg_en17),
        .cfg_en18(axis_itct_cfg_en18),
        .cfg_en19(axis_itct_cfg_en19),
        .cfg_en2(axis_itct_cfg_en2),
        .cfg_en20(axis_itct_cfg_en20),
        .cfg_en21(axis_itct_cfg_en21),
        .cfg_en22(axis_itct_cfg_en22),
        .cfg_en23(axis_itct_cfg_en23),
        .cfg_en24(axis_itct_cfg_en24),
        .cfg_en25(axis_itct_cfg_en25),
        .cfg_en26(axis_itct_cfg_en26),
        .cfg_en27(axis_itct_cfg_en27),
        .cfg_en28(axis_itct_cfg_en28),
        .cfg_en29(axis_itct_cfg_en29),
        .cfg_en3(axis_itct_cfg_en3),
        .cfg_en4(axis_itct_cfg_en4),
        .cfg_en5(axis_itct_cfg_en5),
        .cfg_en6(axis_itct_cfg_en6),
        .cfg_en7(axis_itct_cfg_en7),
        .cfg_en8(axis_itct_cfg_en8),
        .cfg_en9(axis_itct_cfg_en9),
        .cfg_en_i(axis_ila_intf_cfg_en_o),
        .match_out0(axis_mu0_0_match_out),
        .match_out1(axis_mu1_0_match_out),
        .match_out10(axis_mu12_0_match_out),
        .match_out11(axis_mu13_0_match_out),
        .match_out12(axis_mu14_0_match_out),
        .match_out13(axis_mu15_0_match_out),
        .match_out14(axis_mu16_0_match_out),
        .match_out15(axis_mu17_0_match_out),
        .match_out16(axis_mu18_0_match_out),
        .match_out17(axis_mu19_0_match_out),
        .match_out18(axis_mu20_0_match_out),
        .match_out19(axis_mu23_0_match_out),
        .match_out2(axis_mu2_0_match_out),
        .match_out20(axis_mu24_0_match_out),
        .match_out21(axis_mu25_0_match_out),
        .match_out22(axis_mu26_0_match_out),
        .match_out23(axis_mu27_0_match_out),
        .match_out24(axis_mu28_0_match_out),
        .match_out25(axis_mu29_0_match_out),
        .match_out26(axis_mu30_0_match_out),
        .match_out27(axis_mu31_0_match_out),
        .match_out28(axis_mu32_0_match_out),
        .match_out29(axis_mu33_0_match_out),
        .match_out3(axis_mu3_0_match_out),
        .match_out4(axis_mu4_0_match_out),
        .match_out5(axis_mu5_0_match_out),
        .match_out6(axis_mu6_0_match_out),
        .match_out7(axis_mu7_0_match_out),
        .match_out8(axis_mu8_0_match_out),
        .match_out9(axis_mu11_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int),
        .tc0_cfg_din(axis_itct_tc0_cfg_din),
        .tc0_cfg_dout(tc_axis_mu0_cfg_dout),
        .tc0_cfg_en(axis_itct_tc0_cfg_en),
        .tc_cfg_dout(1'b0),
        .trigger_din(axis_itct_trigger_din),
        .wr_cc_config_i(axis_ila_intf_wr_cc_config_o),
        .wr_mu_config_i(axis_ila_intf_wr_mu_config_o),
        .wr_tc_config_i(axis_ila_intf_wr_tc_config_o));
  bd_a7b3_axis_mem_0 axis_mem
       (.ADDR_WRITE_I(axis_cap_ctrl_addr),
        .M_AXIS_ACLK(axis_dbg_stub_aclk_int),
        .TRIGGER_I(axis_cap_ctrl_trigger_o),
        .WE_WRITE_I(axis_cap_ctrl_write_en),
        .arm(axis_ila_intf_arm_o),
        .capture_mode_i(axis_ila_intf_capture_mode_o),
        .clk(clk_1),
        .data_out_en_o(axis_mem_data_out_en_o),
        .data_word_out_o(axis_mem_data_word_out_o),
        .en_adv_trigger_i(axis_ila_intf_adv_trig_config_o),
        .probe0(axis_ila_pp_probe0_out),
        .probe1(axis_ila_pp_probe1_out),
        .probe10(axis_ila_pp_probe10_out),
        .probe11(axis_ila_pp_probe11_out),
        .probe12(axis_ila_pp_probe12_out),
        .probe13(axis_ila_pp_probe13_out),
        .probe14(axis_ila_pp_probe14_out),
        .probe15(axis_ila_pp_probe15_out),
        .probe16(axis_ila_pp_probe16_out),
        .probe17(axis_ila_pp_probe17_out),
        .probe18(axis_ila_pp_probe18_out),
        .probe19(axis_ila_pp_probe19_out),
        .probe2(axis_ila_pp_probe2_out),
        .probe20(axis_ila_pp_probe20_out),
        .probe21(axis_ila_pp_probe21_out),
        .probe22(axis_ila_pp_probe22_out),
        .probe23(axis_ila_pp_probe23_out),
        .probe24(axis_ila_pp_probe24_out),
        .probe25(axis_ila_pp_probe25_out),
        .probe26(axis_ila_pp_probe26_out),
        .probe27(axis_ila_pp_probe27_out),
        .probe28(axis_ila_pp_probe28_out),
        .probe29(axis_ila_pp_probe29_out),
        .probe3(axis_ila_pp_probe3_out),
        .probe30(axis_ila_pp_probe30_out),
        .probe31(axis_ila_pp_probe31_out),
        .probe32(axis_ila_pp_probe32_out),
        .probe33(axis_ila_pp_probe33_out),
        .probe4(axis_ila_pp_probe4_out),
        .probe5(axis_ila_pp_probe5_out),
        .probe6(axis_ila_pp_probe6_out),
        .probe7(axis_ila_pp_probe7_out),
        .probe8(axis_ila_pp_probe8_out),
        .probe9(axis_ila_pp_probe9_out),
        .read_addr_reset_i(axis_ila_intf_read_addr_reset_o),
        .read_data_en_i(axis_ila_intf_read_data_en_o),
        .read_reset_addr_i(axis_ila_intf_trace_rd_addr_o),
        .reset_out_ack_o(axis_mem_reset_out_ack_o),
        .trace_rd_addr_o(axis_mem_trace_rd_addr_o),
        .trace_rd_wrd_cnt_o(axis_mem_trace_rd_wrd_cnt_o));
  bd_a7b3_axis_mu0_0_0 axis_mu0_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din0),
        .cfg_dout(axis_mu0_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en0),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe0_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu0_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu11_0_0 axis_mu11_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din9),
        .cfg_dout(axis_mu11_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en9),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe11_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu11_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu12_0_0 axis_mu12_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din10),
        .cfg_dout(axis_mu12_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en10),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe12_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu12_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu13_0_0 axis_mu13_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din11),
        .cfg_dout(axis_mu13_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en11),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe13_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu13_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu14_0_0 axis_mu14_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din12),
        .cfg_dout(axis_mu14_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en12),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe14_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu14_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu15_0_0 axis_mu15_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din13),
        .cfg_dout(axis_mu15_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en13),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe15_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu15_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu16_0_0 axis_mu16_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din14),
        .cfg_dout(axis_mu16_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en14),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe16_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu16_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu17_0_0 axis_mu17_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din15),
        .cfg_dout(axis_mu17_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en15),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe17_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu17_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu18_0_0 axis_mu18_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din16),
        .cfg_dout(axis_mu18_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en16),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe18_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu18_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu19_0_0 axis_mu19_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din17),
        .cfg_dout(axis_mu19_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en17),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe19_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu19_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu1_0_0 axis_mu1_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din1),
        .cfg_dout(axis_mu1_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en1),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe1_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu1_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu20_0_0 axis_mu20_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din18),
        .cfg_dout(axis_mu20_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en18),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe20_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu20_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu23_0_0 axis_mu23_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din19),
        .cfg_dout(axis_mu23_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en19),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe23_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu23_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu24_0_0 axis_mu24_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din20),
        .cfg_dout(axis_mu24_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en20),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe24_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu24_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu25_0_0 axis_mu25_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din21),
        .cfg_dout(axis_mu25_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en21),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe25_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu25_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu26_0_0 axis_mu26_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din22),
        .cfg_dout(axis_mu26_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en22),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe26_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu26_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu27_0_0 axis_mu27_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din23),
        .cfg_dout(axis_mu27_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en23),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe27_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu27_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu28_0_0 axis_mu28_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din24),
        .cfg_dout(axis_mu28_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en24),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe28_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu28_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu29_0_0 axis_mu29_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din25),
        .cfg_dout(axis_mu29_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en25),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe29_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu29_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu2_0_0 axis_mu2_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din2),
        .cfg_dout(axis_mu2_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en2),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe2_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu2_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu30_0_0 axis_mu30_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din26),
        .cfg_dout(axis_mu30_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en26),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe30_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu30_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu31_0_0 axis_mu31_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din27),
        .cfg_dout(axis_mu31_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en27),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe31_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu31_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu32_0_0 axis_mu32_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din28),
        .cfg_dout(axis_mu32_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en28),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe32_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu32_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu33_0_0 axis_mu33_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din29),
        .cfg_dout(axis_mu33_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en29),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe33_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu33_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu3_0_0 axis_mu3_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din3),
        .cfg_dout(axis_mu3_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en3),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe3_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu3_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu4_0_0 axis_mu4_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din4),
        .cfg_dout(axis_mu4_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en4),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe4_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu4_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu5_0_0 axis_mu5_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din5),
        .cfg_dout(axis_mu5_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en5),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe5_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu5_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu6_0_0 axis_mu6_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din6),
        .cfg_dout(axis_mu6_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en6),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe6_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu6_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu7_0_0 axis_mu7_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din7),
        .cfg_dout(axis_mu7_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en7),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe7_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu7_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_axis_mu8_0_0 axis_mu8_0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cfg_din8),
        .cfg_dout(axis_mu8_0_cfg_dout),
        .cfg_en(axis_itct_cfg_en8),
        .clk(clk_1),
        .data_in(axis_ila_pp_probe8_out),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(axis_mu8_0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_cc_axis_mu0_0 cc_axis_mu0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cc_cfg_din0),
        .cfg_dout(cc_axis_mu0_cfg_dout),
        .cfg_en(axis_itct_cc_cfg_en0),
        .clk(clk_1),
        .data_in(axis_cap_ctrl_lwcnt),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(cc_axis_mu0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_cc_axis_mu1_0 cc_axis_mu1
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cc_cfg_din1),
        .cfg_dout(cc_axis_mu1_cfg_dout),
        .cfg_en(axis_itct_cc_cfg_en1),
        .clk(clk_1),
        .data_in(axis_cap_ctrl_scnt),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(cc_axis_mu1_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_cc_axis_mu2_0 cc_axis_mu2
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cc_cfg_din2),
        .cfg_dout(cc_axis_mu2_cfg_dout),
        .cfg_en(axis_itct_cc_cfg_en2),
        .clk(clk_1),
        .data_in(axis_cap_ctrl_hwcnt),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(cc_axis_mu2_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_cc_axis_mu3_0 cc_axis_mu3
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_cc_cfg_din3),
        .cfg_dout(cc_axis_mu3_cfg_dout),
        .cfg_en(axis_itct_cc_cfg_en3),
        .clk(clk_1),
        .data_in(axis_cap_ctrl_lwcnt),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(cc_axis_mu3_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_slot_0_ar_0 slot_0_ar
       (.In0(SLOT_0_AXI_arvalid_1),
        .In1(SLOT_0_AXI_arready_1),
        .dout(slot_0_ar_dout));
  bd_a7b3_slot_0_aw_0 slot_0_aw
       (.In0(SLOT_0_AXI_awvalid_1),
        .In1(SLOT_0_AXI_awready_1),
        .dout(slot_0_aw_dout));
  bd_a7b3_slot_0_b_0 slot_0_b
       (.In0(SLOT_0_AXI_bvalid_1),
        .In1(SLOT_0_AXI_bready_1),
        .dout(slot_0_b_dout));
  bd_a7b3_slot_0_r_0 slot_0_r
       (.In0(SLOT_0_AXI_rlast_1),
        .In1(SLOT_0_AXI_rvalid_1),
        .In2(SLOT_0_AXI_rready_1),
        .dout(slot_0_r_dout));
  bd_a7b3_slot_0_w_0 slot_0_w
       (.In0(SLOT_0_AXI_wlast_1),
        .In1(SLOT_0_AXI_wvalid_1),
        .In2(SLOT_0_AXI_wready_1),
        .dout(slot_0_w_dout));
  bd_a7b3_tc_axis_mu0_0 tc_axis_mu0
       (.arm(axis_ila_intf_arm_o),
        .cfg_clk(axis_dbg_stub_aclk_int),
        .cfg_din(axis_itct_tc0_cfg_din),
        .cfg_dout(tc_axis_mu0_cfg_dout),
        .cfg_en(axis_itct_tc0_cfg_en),
        .clk(clk_1),
        .data_in(axis_itct_trigger_din),
        .ila_resetn(axis_ila_intf_aresetn_out),
        .match_out(tc_axis_mu0_match_out),
        .resetn(axis_dbg_stub_aresetn_int));
  bd_a7b3_xlconstant_0 xlconstant
       (.dout(xlconstant_dout));
endmodule
