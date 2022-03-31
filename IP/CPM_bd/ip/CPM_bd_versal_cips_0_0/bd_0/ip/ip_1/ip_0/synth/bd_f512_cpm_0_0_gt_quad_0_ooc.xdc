
 #################################################################################
 ##
 ## bd_f512_cpm_0_0_gt_quad_0_ooc.xdc 
 ## This xdc is used in Out of Context mode, and currently is just a placeholder
 ##
 #################################################################################



 
create_clock -period 10.0 [get_ports GT_REFCLK0]

## Place holder frequny values on clk###

 
create_clock -period 5.0 [get_ports apb3clk]



 
create_clock -period 2.0 [get_ports ch0_txusrclk]

 
create_clock -period 2.0 [get_ports ch1_txusrclk]

 
create_clock -period 2.0 [get_ports ch2_txusrclk]

 
create_clock -period 2.0 [get_ports ch3_txusrclk]


 
create_clock -period 2.0 [get_ports ch0_rxusrclk]

 
create_clock -period 2.0 [get_ports ch1_rxusrclk]

 
create_clock -period 2.0 [get_ports ch2_rxusrclk]

 
create_clock -period 2.0 [get_ports ch3_rxusrclk]



