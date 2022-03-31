# file: vio_0v.xdc
#////////////////////////////////////////////////////////////////////////////
#/$Date: 2012/02/06 10:34:16 $
#/$RCSfile:  $
#/$Revision: 1.2 $
#//////////////////////////////////////////////////////////////////////////////
#/   ____  ____ 
#/  /   /\/   /
#/ /___/  \  /    Vendor: Xilinx
#/ \   \   \/     Version : 2.00
#/  \   \         Application : VIO V2.00a
#/  /   /         Filename : vio_0v.xdc
#/ /___/   /\     
#/ \   \  /  \ 
#/  \___\/\___\
#/
#/ (c) Copyright 2010 Xilinx, Inc. All rights reserved.
#/ 
#/ This file contains confidential and proprietary information
#/ of Xilinx, Inc. and is protected under U.S. and
#/ international copyright and other intellectual property
#/ laws.
#/ 
#/ DISCLAIMER
#/ This disclaimer is not a license and does not grant any
#/ rights to the materials distributed herewith. Except as
#/ otherwise provided in a valid license issued to you by
#/ Xilinx, and to the maximum extent permitted by applicable
#/ law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#/ WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#/ AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#/ BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#/ INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#/ (2) Xilinx shall not be liable (whether in contract or tort,
#/ including negligence, or under any other theory of
#/ liability) for any loss or damage of any kind or nature
#/ related to, arising under or in connection with these
#/ materials, including for any direct, or any indirect,
#/ special, incidental, or consequential loss or damage
#/ (including loss of data, profits, goodwill, or any type of
#/ loss or damage suffered as a result of any action brought
#/ by a third party) even if such damage or loss was
#/ reasonably foreseeable or Xilinx had been advised of the
#/ possibility of the same.
#/ 
#/ CRITICAL APPLICATIONS
#/ Xilinx products are not designed or intended to be fail-
#/ safe, or for use in any application requiring fail-safe
#/ performance, such as life-support or safety devices or
#/ systems, Class III medical devices, nuclear facilities,
#/ applications related to the deployment of airbags, or any
#/ other applications that could lead to death, personal
#/ injury, or severe property or environmental damage
#/ (individually and collectively, "Critical
#/ Applications"). Customer assumes the sole risk and
#/ liability of any use of Xilinx products in Critical
#/ Applications, subject only to applicable laws and
#/ regulations governing limitations on product liability.
#/ 
#/ THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#/ PART OF THIS FILE AT ALL TIMES.
#Created by Constraints Editor
 

    set src1 [get_cells -hierarchical -filter { NAME =~ "*probe_in_reg_reg*" && ( PRIMITIVE_TYPE =~ FLOP_LATCH.flop.*   || PRIMITIVE_TYPE == RTL_REGISTER.flop.RTL_REG || PRIMITIVE_TYPE =~ REGISTER.SDR.*  ) }]
    set dest1 [get_cells -hierarchical -filter { NAME =~ "*data_int_sync1_reg*" && ( PRIMITIVE_TYPE =~ FLOP_LATCH.flop.*   || PRIMITIVE_TYPE == RTL_REGISTER.flop.RTL_REG || PRIMITIVE_TYPE =~ REGISTER.SDR.*  ) }]
    set_false_path -from $src1 -to $dest1

create_waiver -type CDC -id CDC-4 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*probe_in_reg_reg*"}]]  -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*data_int_sync1_reg*"}]]  -user "axis_vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal

    set src2 [get_cells -hierarchical -filter { NAME =~ "*u_core_ctrl_reg/I_EN_CTL_EQ1.full_data_o_reg[2]*" && ( PRIMITIVE_TYPE =~ FLOP_LATCH.flop.*   || PRIMITIVE_TYPE == RTL_REGISTER.flop.RTL_REG || PRIMITIVE_TYPE =~ REGISTER.SDR.*  ) }]
    set dest2 [get_cells -hierarchical -filter { NAME =~ "*probe_in_reg_reg*" && ( PRIMITIVE_TYPE =~ FLOP_LATCH.flop.*   || PRIMITIVE_TYPE == RTL_REGISTER.flop.RTL_REG || PRIMITIVE_TYPE =~ REGISTER.SDR.*  ) }]
    set_false_path -from $src2 -to $dest2
    
    create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*u_core_ctrl_reg/I_EN_CTL_EQ1.full_data_o_reg[2]"}]]  -to [get_pins -filter {REF_PIN_NAME=~CE} -of_objects [get_cells -hierarchical -filter {NAME =~ "*probe_in_reg_reg*"}]]  -user "axis_vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal

create_waiver -type CDC -id CDC-10 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*/I_EN_CTL_EQ1.full_data_o_reg[0]"}]]  -to [get_pins -filter {REF_PIN_NAME=~CLR} -of_objects [get_cells -hierarchical -filter {NAME =~ "*/genblk1.xpm_cdc_async_rst_inst/arststages_ff_reg[0]"}]]  -user "axis_vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
