`timescale 1 ps / 1 ps
module vck190_tester_top (
  output [3:0] USER_LED,
  input [7:0]PCIE_grx_n,
  input [7:0]PCIE_grx_p,
  output [7:0]PCIE_gtx_n,
  output [7:0]PCIE_gtx_p,
  input gt_refclk_clk_n,
  input gt_refclk_clk_p,
  output ddr4_dimm1_act_n,
  output [16:0]ddr4_dimm1_adr,
  output [1:0]ddr4_dimm1_ba,
  output [1:0]ddr4_dimm1_bg,
  output ddr4_dimm1_ck_c,
  output ddr4_dimm1_ck_t,
  output ddr4_dimm1_cke,
  output ddr4_dimm1_cs_n,
  inout [7:0]ddr4_dimm1_dm_n,
  inout [63:0]ddr4_dimm1_dq,
  inout [7:0]ddr4_dimm1_dqs_c,
  inout [7:0]ddr4_dimm1_dqs_t,
  output ddr4_dimm1_odt,
  output ddr4_dimm1_reset_n,
  input ddr4_dimm1_sma_clk_clk_n,
  input ddr4_dimm1_sma_clk_clk_p
);


wire PCIE_user_Clk;
wire [3:0] pl_LED;
wire [3:0] gpio_led_out;


  CPM_bd CPM_bd_i
       (.PCIE_grx_n(PCIE_grx_n),
        .PCIE_grx_p(PCIE_grx_p),
        .PCIE_gtx_n(PCIE_gtx_n),
        .PCIE_gtx_p(PCIE_gtx_p),
        .PCIE_user_Clk(PCIE_user_Clk),
        .ddr4_dimm1_act_n(ddr4_dimm1_act_n),
        .ddr4_dimm1_adr(ddr4_dimm1_adr),
        .ddr4_dimm1_ba(ddr4_dimm1_ba),
        .ddr4_dimm1_bg(ddr4_dimm1_bg),
        .ddr4_dimm1_ck_c(ddr4_dimm1_ck_c),
        .ddr4_dimm1_ck_t(ddr4_dimm1_ck_t),
        .ddr4_dimm1_cke(ddr4_dimm1_cke),
        .ddr4_dimm1_cs_n(ddr4_dimm1_cs_n),
        .ddr4_dimm1_dm_n(ddr4_dimm1_dm_n),
        .ddr4_dimm1_dq(ddr4_dimm1_dq),
        .ddr4_dimm1_dqs_c(ddr4_dimm1_dqs_c),
        .ddr4_dimm1_dqs_t(ddr4_dimm1_dqs_t),
        .ddr4_dimm1_odt(ddr4_dimm1_odt),
        .ddr4_dimm1_reset_n(ddr4_dimm1_reset_n),
        .ddr4_dimm1_sma_clk_clk_n(ddr4_dimm1_sma_clk_clk_n),
        .ddr4_dimm1_sma_clk_clk_p(ddr4_dimm1_sma_clk_clk_p),
        .gt_refclk_clk_n(gt_refclk_clk_n),
        .gt_refclk_clk_p(gt_refclk_clk_p));

assign USER_LED = {pl_LED[1:0], gpio_led_out[1:0]};

top_log u_power_consumer_top (
	.clk_in(PCIE_user_Clk),
	.USER_LED(pl_LED)
);

endmodule
