set_property PACKAGE_PIN L35 [get_ports USER_LED[0]]
set_property PACKAGE_PIN K36 [get_ports USER_LED[1]]
set_property PACKAGE_PIN J33 [get_ports USER_LED[2]]
set_property PACKAGE_PIN H34 [get_ports USER_LED[3]]
set_property IOSTANDARD LVCMOS18 [get_ports USER_LED[*]]
#
#set_clock_groups -asynchronous -group [get_clocks clk_out1_clk_wiz_0] \
#    -group [get_clocks clk_out2_clk_wiz_0] \
#    -group [get_clocks clk_out3_clk_wiz_0] \
#    -group [get_clocks clk_out4_clk_wiz_0]
#
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk]
