
################################################################
# This is a generated script based on design: CPM_bd
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2021.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source CPM_bd_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvc1902-vsva2197-2MP-e-S
   set_property BOARD_PART xilinx.com:vck190:part0:2.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name CPM_bd

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir .

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set PCIE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 PCIE ]

  set ddr4_dimm1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_dimm1 ]

  set ddr4_dimm1_sma_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr4_dimm1_sma_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $ddr4_dimm1_sma_clk

  set gt_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gt_refclk ]


  # Create ports
  set PCIE_user_Clk [ create_bd_port -dir O -type clk PCIE_user_Clk ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]

  # Create instance: axi_bram_ctrl_0_bram, and set properties
  set axi_bram_ctrl_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:emb_mem_gen:1.0 axi_bram_ctrl_0_bram ]
  set_property -dict [ list \
   CONFIG.MEMORY_TYPE {True_Dual_Port_RAM} \
 ] $axi_bram_ctrl_0_bram

  # Create instance: axi_noc_0, and set properties
  set axi_noc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_0 ]
  set_property -dict [ list \
   CONFIG.CH0_DDR4_0_BOARD_INTERFACE {ddr4_dimm1} \
   CONFIG.LOGO_FILE {data/noc_mc.png} \
   CONFIG.MC0_CONFIG_NUM {config17} \
   CONFIG.MC1_CONFIG_NUM {config17} \
   CONFIG.MC2_CONFIG_NUM {config17} \
   CONFIG.MC3_CONFIG_NUM {config17} \
   CONFIG.MC_BOARD_INTRF_EN {true} \
   CONFIG.MC_CASLATENCY {22} \
   CONFIG.MC_CONFIG_NUM {config17} \
   CONFIG.MC_DDR4_2T {Disable} \
   CONFIG.MC_F1_LPDDR4_MR1 {0x0000} \
   CONFIG.MC_F1_LPDDR4_MR2 {0x0000} \
   CONFIG.MC_F1_LPDDR4_MR3 {0x0000} \
   CONFIG.MC_F1_LPDDR4_MR11 {0x0000} \
   CONFIG.MC_F1_LPDDR4_MR13 {0x0000} \
   CONFIG.MC_F1_LPDDR4_MR22 {0x0000} \
   CONFIG.MC_F1_TRCD {13750} \
   CONFIG.MC_F1_TRCDMIN {13750} \
   CONFIG.MC_INPUTCLK0_PERIOD {5000} \
   CONFIG.MC_INPUT_FREQUENCY0 {200.000} \
   CONFIG.MC_MEMORY_DEVICETYPE {UDIMMs} \
   CONFIG.MC_MEMORY_SPEEDGRADE {DDR4-3200AA(22-22-22)} \
   CONFIG.MC_TRC {45750} \
   CONFIG.MC_TRCD {13750} \
   CONFIG.MC_TRP {13750} \
   CONFIG.MC_TRPMIN {13750} \
   CONFIG.NUM_CLKS {4} \
   CONFIG.NUM_MC {1} \
   CONFIG.NUM_MCP {1} \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {2} \
   CONFIG.sys_clk0_BOARD_INTERFACE {ddr4_dimm1_sma_clk} \
 ] $axi_noc_0

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.APERTURES {{0x201_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M00_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.REGION {0} \
   CONFIG.CATEGORY {ps_pcie} \
 ] [get_bd_intf_pins /axi_noc_0/M01_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} } \
   CONFIG.DEST_IDS {M01_AXI:0x40:M00_AXI:0x0} \
   CONFIG.CATEGORY {ps_pcie} \
 ] [get_bd_intf_pins /axi_noc_0/S00_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {5} write_bw {5}} } \
   CONFIG.DEST_IDS {M01_AXI:0x40:M00_AXI:0x0} \
   CONFIG.CATEGORY {ps_pcie} \
 ] [get_bd_intf_pins /axi_noc_0/S01_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk0]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S01_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk1]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M00_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk2]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M01_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk3]

  # Create instance: axis_ila_BRAM, and set properties
  set axis_ila_BRAM [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_ila:1.1 axis_ila_BRAM ]
  set_property -dict [ list \
   CONFIG.C_BRAM_CNT {0} \
   CONFIG.C_MON_TYPE {Interface_Monitor} \
   CONFIG.C_SLOT_0_AXI_R_SEL_TRIG {0} \
   CONFIG.C_SLOT_0_AXI_W_SEL_TRIG {0} \
 ] $axis_ila_BRAM

  # Create instance: versal_cips_0, and set properties
  set versal_cips_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:versal_cips:3.0 versal_cips_0 ]
  set_property -dict [ list \
   CONFIG.CPM_CONFIG {CPM_AXI_SLV_BRIDGE_BASE_ADDRR_H 0x00000006 CPM_PCIE0_BRIDGE_AXI_SLAVE_IF 0\
CPM_PCIE0_MAX_LINK_SPEED 16.0_GT/s CPM_PCIE0_MODES DMA CPM_PCIE0_MODE_SELECTION\
Advanced CPM_PCIE0_MSI_X_OPTIONS MSI-X_Internal CPM_PCIE0_PF0_BAR0_XDMA_TYPE\
DMA CPM_PCIE0_PF0_BAR1_XDMA_ENABLED 1 CPM_PCIE0_PF0_BAR1_XDMA_SCALE Megabytes\
CPM_PCIE0_PF0_BAR1_XDMA_SIZE 4 CPM_PCIE0_PF0_BAR2_XDMA_ENABLED 0\
CPM_PCIE0_PF0_BAR2_XDMA_SCALE Bytes CPM_PCIE0_PF0_BAR2_XDMA_SIZE 128\
CPM_PCIE0_PF0_PCIEBAR2AXIBAR_XDMA_1 0x0000020100000000\
CPM_PCIE0_PF0_PCIEBAR2AXIBAR_XDMA_2 0x0000000000000000\
CPM_PCIE0_PL_LINK_CAP_MAX_LINK_WIDTH X8}\
   CONFIG.PS_PMC_CONFIG {DESIGN_MODE 1 PCIE_APERTURES_DUAL_ENABLE 0 PCIE_APERTURES_SINGLE_ENABLE 1\
PS_BOARD_INTERFACE Custom PS_PCIE1_PERIPHERAL_ENABLE 1\
PS_PCIE2_PERIPHERAL_ENABLE 0 PS_PCIE_EP_RESET1_IO {PMC_MIO 38} PS_PCIE_RESET\
{{ENABLE 1} {IO {PS_MIO 18 .. 19}}} SMON_ALARMS Set_Alarms_On\
SMON_ENABLE_TEMP_AVERAGING 0 SMON_TEMP_AVERAGING_SAMPLES 8}\
   CONFIG.PS_PMC_CONFIG_APPLIED {1} \
 ] $versal_cips_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTB [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net axi_noc_0_CH0_DDR4_0 [get_bd_intf_ports ddr4_dimm1] [get_bd_intf_pins axi_noc_0/CH0_DDR4_0]
  connect_bd_intf_net -intf_net axi_noc_0_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_noc_0/M00_AXI]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_noc_0_M00_AXI] [get_bd_intf_pins axi_noc_0/M00_AXI] [get_bd_intf_pins axis_ila_BRAM/SLOT_0_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M01_AXI [get_bd_intf_pins axi_noc_0/M01_AXI] [get_bd_intf_pins versal_cips_0/NOC_CPM_PCIE_0]
  connect_bd_intf_net -intf_net ddr4_dimm1_sma_clk_1 [get_bd_intf_ports ddr4_dimm1_sma_clk] [get_bd_intf_pins axi_noc_0/sys_clk0]
  connect_bd_intf_net -intf_net gt_refclk0_0_1 [get_bd_intf_ports gt_refclk] [get_bd_intf_pins versal_cips_0/gt_refclk0]
  connect_bd_intf_net -intf_net versal_cips_0_CPM_PCIE_NOC_0 [get_bd_intf_pins axi_noc_0/S00_AXI] [get_bd_intf_pins versal_cips_0/CPM_PCIE_NOC_0]
  connect_bd_intf_net -intf_net versal_cips_0_CPM_PCIE_NOC_1 [get_bd_intf_pins axi_noc_0/S01_AXI] [get_bd_intf_pins versal_cips_0/CPM_PCIE_NOC_1]
  connect_bd_intf_net -intf_net versal_cips_0_PCIE0_GT [get_bd_intf_ports PCIE] [get_bd_intf_pins versal_cips_0/PCIE0_GT]

  # Create port connections
  connect_bd_net -net versal_cips_0_cpm_pcie_noc_axi0_clk [get_bd_pins axi_noc_0/aclk0] [get_bd_pins versal_cips_0/cpm_pcie_noc_axi0_clk]
  connect_bd_net -net versal_cips_0_cpm_pcie_noc_axi1_clk [get_bd_pins axi_noc_0/aclk1] [get_bd_pins versal_cips_0/cpm_pcie_noc_axi1_clk]
  connect_bd_net -net versal_cips_0_dma0_axi_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axis_ila_BRAM/resetn] [get_bd_pins versal_cips_0/dma0_axi_aresetn]
  connect_bd_net -net versal_cips_0_noc_cpm_pcie_axi0_clk [get_bd_pins axi_noc_0/aclk3] [get_bd_pins versal_cips_0/noc_cpm_pcie_axi0_clk]
  connect_bd_net -net versal_cips_0_pcie0_user_clk [get_bd_ports PCIE_user_Clk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_noc_0/aclk2] [get_bd_pins axis_ila_BRAM/clk] [get_bd_pins versal_cips_0/pcie0_user_clk]

  # Create address segments
  assign_bd_address -offset 0x020100000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_0] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x020100000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_1] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_0] [get_bd_addr_segs axi_noc_0/S00_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_1] [get_bd_addr_segs axi_noc_0/S01_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_0] [get_bd_addr_segs versal_cips_0/NOC_CPM_PCIE_0/pspmc_0_psv_noc_pcie_0] -force
  assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_1] [get_bd_addr_segs versal_cips_0/NOC_CPM_PCIE_0/pspmc_0_psv_noc_pcie_0] -force
  assign_bd_address -offset 0x000600000000 -range 0x000200000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_0] [get_bd_addr_segs versal_cips_0/NOC_CPM_PCIE_0/pspmc_0_psv_noc_pcie_1] -force
  assign_bd_address -offset 0x000600000000 -range 0x000200000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_1] [get_bd_addr_segs versal_cips_0/NOC_CPM_PCIE_0/pspmc_0_psv_noc_pcie_1] -force
  assign_bd_address -offset 0x008000000000 -range 0x004000000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_0] [get_bd_addr_segs versal_cips_0/NOC_CPM_PCIE_0/pspmc_0_psv_noc_pcie_2] -force
  assign_bd_address -offset 0x008000000000 -range 0x004000000000 -target_address_space [get_bd_addr_spaces versal_cips_0/CPM_PCIE_NOC_1] [get_bd_addr_segs versal_cips_0/NOC_CPM_PCIE_0/pspmc_0_psv_noc_pcie_2] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


