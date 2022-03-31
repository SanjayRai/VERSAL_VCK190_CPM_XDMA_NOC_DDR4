
################################################################
# This is a generated script based on design: bd_f29c
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
# source bd_f29c_script.tcl

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
set design_name bd_f29c

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design -bdsource SBD $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: hier_nsw
proc create_hier_cell_hier_nsw { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_hier_nsw() - Empty argument(s)!"}
     return
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

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I NMU
  create_bd_pin -dir I NMU1
  create_bd_pin -dir O NSU
  create_bd_pin -dir O NSU1
  create_bd_pin -dir O NSU2

  # Create instance: M00_AXI_nsw, and set properties
  set M00_AXI_nsw [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsw:1.0 M00_AXI_nsw ]
  set_property -dict [ list \
   CONFIG.NSW_MODE {SW_Slave} \
   CONFIG.NSW_NUM_PATHS {2} \
   CONFIG.NSW_PATH_TYPE {RDWR:RDWR} \
   CONFIG.NSW_PROTOCOL {MemoryMapped} \
 ] $M00_AXI_nsw
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells /hier_nsw/M00_AXI_nsw]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_cells /hier_nsw/M00_AXI_nsw]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_CELL {true} [get_bd_cells /hier_nsw/M00_AXI_nsw]

  # Create instance: M01_AXI_nsw, and set properties
  set M01_AXI_nsw [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsw:1.0 M01_AXI_nsw ]
  set_property -dict [ list \
   CONFIG.NSW_MODE {SW_Slave} \
   CONFIG.NSW_NUM_PATHS {2} \
   CONFIG.NSW_PATH_TYPE {RDWR:RDWR} \
   CONFIG.NSW_PROTOCOL {MemoryMapped} \
 ] $M01_AXI_nsw
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells /hier_nsw/M01_AXI_nsw]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_cells /hier_nsw/M01_AXI_nsw]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_CELL {true} [get_bd_cells /hier_nsw/M01_AXI_nsw]

  # Create instance: MC0_nsw, and set properties
  set MC0_nsw [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsw:1.0 MC0_nsw ]
  set_property -dict [ list \
   CONFIG.NSW_MODE {SW_Slave} \
   CONFIG.NSW_NUM_PATHS {2} \
   CONFIG.NSW_PATH_TYPE {RDWR:RDWR} \
   CONFIG.NSW_PROTOCOL {MemoryMapped} \
 ] $MC0_nsw
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells /hier_nsw/MC0_nsw]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_cells /hier_nsw/MC0_nsw]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_CELL {true} [get_bd_cells /hier_nsw/MC0_nsw]

  # Create instance: S00_AXI_nsw, and set properties
  set S00_AXI_nsw [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsw:1.0 S00_AXI_nsw ]
  set_property -dict [ list \
   CONFIG.NSW_MODE {SW_Master} \
   CONFIG.NSW_NUM_PATHS {3} \
   CONFIG.NSW_PATH_TYPE {RDWR:RDWR:RDWR} \
   CONFIG.NSW_PROTOCOL {MemoryMapped} \
 ] $S00_AXI_nsw
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells /hier_nsw/S00_AXI_nsw]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_cells /hier_nsw/S00_AXI_nsw]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_CELL {true} [get_bd_cells /hier_nsw/S00_AXI_nsw]

  # Create instance: S01_AXI_nsw, and set properties
  set S01_AXI_nsw [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsw:1.0 S01_AXI_nsw ]
  set_property -dict [ list \
   CONFIG.NSW_MODE {SW_Master} \
   CONFIG.NSW_NUM_PATHS {3} \
   CONFIG.NSW_PATH_TYPE {RDWR:RDWR:RDWR} \
   CONFIG.NSW_PROTOCOL {MemoryMapped} \
 ] $S01_AXI_nsw
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells /hier_nsw/S01_AXI_nsw]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_cells /hier_nsw/S01_AXI_nsw]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_CELL {true} [get_bd_cells /hier_nsw/S01_AXI_nsw]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_nsw_M00_INCMM [get_bd_intf_pins MC0_nsw/S01_INCMM] [get_bd_intf_pins S00_AXI_nsw/M00_INCMM]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_intf_nets S00_AXI_nsw_M00_INCMM]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_intf_nets S00_AXI_nsw_M00_INCMM]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_intf_nets S00_AXI_nsw_M00_INCMM]
  connect_bd_intf_net -intf_net S00_AXI_nsw_M01_INCMM [get_bd_intf_pins M01_AXI_nsw/S01_INCMM] [get_bd_intf_pins S00_AXI_nsw/M01_INCMM]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_intf_nets S00_AXI_nsw_M01_INCMM]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_intf_nets S00_AXI_nsw_M01_INCMM]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_intf_nets S00_AXI_nsw_M01_INCMM]
  connect_bd_intf_net -intf_net S00_AXI_nsw_M02_INCMM [get_bd_intf_pins M00_AXI_nsw/S01_INCMM] [get_bd_intf_pins S00_AXI_nsw/M02_INCMM]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_intf_nets S00_AXI_nsw_M02_INCMM]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_intf_nets S00_AXI_nsw_M02_INCMM]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_intf_nets S00_AXI_nsw_M02_INCMM]
  connect_bd_intf_net -intf_net S01_AXI_nsw_M00_INCMM [get_bd_intf_pins MC0_nsw/S00_INCMM] [get_bd_intf_pins S01_AXI_nsw/M00_INCMM]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_intf_nets S01_AXI_nsw_M00_INCMM]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_intf_nets S01_AXI_nsw_M00_INCMM]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_intf_nets S01_AXI_nsw_M00_INCMM]
  connect_bd_intf_net -intf_net S01_AXI_nsw_M01_INCMM [get_bd_intf_pins M01_AXI_nsw/S00_INCMM] [get_bd_intf_pins S01_AXI_nsw/M01_INCMM]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_intf_nets S01_AXI_nsw_M01_INCMM]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_intf_nets S01_AXI_nsw_M01_INCMM]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_intf_nets S01_AXI_nsw_M01_INCMM]
  connect_bd_intf_net -intf_net S01_AXI_nsw_M02_INCMM [get_bd_intf_pins M00_AXI_nsw/S00_INCMM] [get_bd_intf_pins S01_AXI_nsw/M02_INCMM]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_intf_nets S01_AXI_nsw_M02_INCMM]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_intf_nets S01_AXI_nsw_M02_INCMM]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_intf_nets S01_AXI_nsw_M02_INCMM]

  # Create port connections
  connect_bd_net -net M00_AXI_nsw_NSU [get_bd_pins NSU2] [get_bd_pins M00_AXI_nsw/NSU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets M00_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets M00_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets M00_AXI_nsw_NSU]
  connect_bd_net -net M01_AXI_nsw_NSU [get_bd_pins NSU1] [get_bd_pins M01_AXI_nsw/NSU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets M01_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets M01_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets M01_AXI_nsw_NSU]
  connect_bd_net -net MC0_nsw_NSU [get_bd_pins NSU] [get_bd_pins MC0_nsw/NSU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets MC0_nsw_NSU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets MC0_nsw_NSU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets MC0_nsw_NSU]
  connect_bd_net -net S00_AXI_nmu_NMU [get_bd_pins NMU1] [get_bd_pins S00_AXI_nsw/NMU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets S00_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets S00_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets S00_AXI_nmu_NMU]
  connect_bd_net -net S01_AXI_nmu_NMU [get_bd_pins NMU] [get_bd_pins S01_AXI_nsw/NMU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets S01_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets S01_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets S01_AXI_nmu_NMU]

  # Restore current instance
  current_bd_instance $oldCurInst
}


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
  set CH0_DDR4_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 CH0_DDR4_0 ]

  set M00_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI ]
  set_property -dict [ list \
   CONFIG.APERTURES {{0x201_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
   CONFIG.DATA_WIDTH {32} \
   ] $M00_AXI

  set M01_AXI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI ]
  set_property -dict [ list \
   CONFIG.CATEGORY {ps_pcie} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.REGION {0} \
   ] $M01_AXI

  set S00_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI ]
  set_property -dict [ list \
   CONFIG.CATEGORY {ps_pcie} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} } \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.DEST_IDS {M01_AXI:0x40:M00_AXI:0x0} \
   CONFIG.REGION {0} \
   ] $S00_AXI

  set S01_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXI ]
  set_property -dict [ list \
   CONFIG.CATEGORY {ps_pcie} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {5} write_bw {5}} } \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.DEST_IDS {M01_AXI:0x40:M00_AXI:0x0} \
   CONFIG.REGION {0} \
   ] $S01_AXI

  set sys_clk0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_clk0 ]


  # Create ports
  set aclk0 [ create_bd_port -dir I -type clk aclk0 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] $aclk0
  set aclk1 [ create_bd_port -dir I -type clk aclk1 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S01_AXI} \
 ] $aclk1
  set aclk2 [ create_bd_port -dir I -type clk aclk2 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M00_AXI} \
 ] $aclk2
  set aclk3 [ create_bd_port -dir I -type clk aclk3 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M01_AXI} \
 ] $aclk3

  # Create instance: M00_AXI_nsu, and set properties
  set M00_AXI_nsu [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsu:1.0 M00_AXI_nsu ]
  set_property -dict [ list \
   CONFIG.ATTR_FILE {nocattrs.dat} \
   CONFIG.NOC_FREQ {1000} \
   CONFIG.USER_NOC_CATEGORY {PL} \
   CONFIG.USER_NOC_NSU_WIDTH {512} \
   CONFIG.USER_PHYS_NAME {NOC_NSU512_X0Y0} \
   CONFIG.USER_REG_AXI_LOOPBACK {0x0} \
   CONFIG.USER_REG_COMP_ID_INDEX0 {0x00} \
   CONFIG.USER_REG_COMP_ID_INDEX1 {0x01} \
   CONFIG.USER_REG_COMP_ID_MODE {0x0} \
   CONFIG.USER_REG_DISABLE_EX_MON {0x1} \
   CONFIG.USER_REG_DWIDTH {0x2} \
   CONFIG.USER_REG_ECC_CHK_EN {0x1} \
   CONFIG.USER_REG_FIXED_COMP_ID {0x0} \
   CONFIG.USER_REG_MODE_SELECT {0x0} \
   CONFIG.USER_REG_ODISABLE_AXI_RESP {0x0} \
   CONFIG.USER_REG_OUTSTANDING_RD_TXN {0x20} \
   CONFIG.USER_REG_OUTSTANDING_WR_TXN {0x20} \
   CONFIG.USER_REG_PAR_CHK {0x0} \
   CONFIG.USER_REG_RDTRK_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_RDTRK_VCA_TOKEN1 {0x10} \
   CONFIG.USER_REG_RD_REQ_VC_MAP0 {0x4} \
   CONFIG.USER_REG_RD_REQ_VC_MAP1 {0x0} \
   CONFIG.USER_REG_RD_RESP_VC_MAP0 {0x6} \
   CONFIG.USER_REG_RD_RESP_VC_MAP1 {0x2} \
   CONFIG.USER_REG_RD_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_RD_VCA_TOKEN1 {0x10} \
   CONFIG.USER_REG_SRC {0x000} \
   CONFIG.USER_REG_TBASE_AXI_TIMEOUT {0x2} \
   CONFIG.USER_REG_TBASE_TRK_TIMEOUT {0x2} \
   CONFIG.USER_REG_VMAP_OUT_RD_TOKEN0 {0x10} \
   CONFIG.USER_REG_VMAP_OUT_RD_TOKEN1 {0x10} \
   CONFIG.USER_REG_VMAP_OUT_WR_TOKEN0 {0x10} \
   CONFIG.USER_REG_VMAP_OUT_WR_TOKEN1 {0x10} \
   CONFIG.USER_REG_WRTRK_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_WRTRK_VCA_TOKEN1 {0x10} \
   CONFIG.USER_REG_WR_REQ_VC_MAP0 {0x5} \
   CONFIG.USER_REG_WR_REQ_VC_MAP1 {0x1} \
   CONFIG.USER_REG_WR_RESP_VC_MAP0 {0x7} \
   CONFIG.USER_REG_WR_RESP_VC_MAP1 {0x3} \
   CONFIG.USER_REG_WR_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_WR_VCA_TOKEN1 {0x10} \
 ] $M00_AXI_nsu
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells M00_AXI_nsu]

  # Create instance: M01_AXI_nsu, and set properties
  set M01_AXI_nsu [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nsu:1.0 M01_AXI_nsu ]
  set_property -dict [ list \
   CONFIG.ATTR_FILE {nocattrs.dat} \
   CONFIG.NOC_FREQ {1000} \
   CONFIG.USER_NOC_CATEGORY {PS} \
   CONFIG.USER_NOC_NSU_WIDTH {128} \
   CONFIG.USER_PHYS_NAME {NOC_NSU128_X0Y0} \
   CONFIG.USER_REG_AXI_LOOPBACK {0x0} \
   CONFIG.USER_REG_COMP_ID_INDEX0 {0x00} \
   CONFIG.USER_REG_COMP_ID_INDEX1 {0x01} \
   CONFIG.USER_REG_COMP_ID_MODE {0x0} \
   CONFIG.USER_REG_DISABLE_EX_MON {0x1} \
   CONFIG.USER_REG_DWIDTH {0x4} \
   CONFIG.USER_REG_ECC_CHK_EN {0x1} \
   CONFIG.USER_REG_FIXED_COMP_ID {0x0} \
   CONFIG.USER_REG_MODE_SELECT {0x0} \
   CONFIG.USER_REG_ODISABLE_AXI_RESP {0x0} \
   CONFIG.USER_REG_OUTSTANDING_RD_TXN {0x20} \
   CONFIG.USER_REG_OUTSTANDING_WR_TXN {0x20} \
   CONFIG.USER_REG_PAR_CHK {0x0} \
   CONFIG.USER_REG_RDTRK_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_RDTRK_VCA_TOKEN1 {0x10} \
   CONFIG.USER_REG_RD_REQ_VC_MAP0 {0x4} \
   CONFIG.USER_REG_RD_REQ_VC_MAP1 {0x0} \
   CONFIG.USER_REG_RD_RESP_VC_MAP0 {0x6} \
   CONFIG.USER_REG_RD_RESP_VC_MAP1 {0x2} \
   CONFIG.USER_REG_RD_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_RD_VCA_TOKEN1 {0x10} \
   CONFIG.USER_REG_SRC {0x040} \
   CONFIG.USER_REG_TBASE_AXI_TIMEOUT {0x2} \
   CONFIG.USER_REG_TBASE_TRK_TIMEOUT {0x2} \
   CONFIG.USER_REG_VMAP_OUT_RD_TOKEN0 {0x10} \
   CONFIG.USER_REG_VMAP_OUT_RD_TOKEN1 {0x10} \
   CONFIG.USER_REG_VMAP_OUT_WR_TOKEN0 {0x10} \
   CONFIG.USER_REG_VMAP_OUT_WR_TOKEN1 {0x10} \
   CONFIG.USER_REG_WRTRK_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_WRTRK_VCA_TOKEN1 {0x10} \
   CONFIG.USER_REG_WR_REQ_VC_MAP0 {0x5} \
   CONFIG.USER_REG_WR_REQ_VC_MAP1 {0x1} \
   CONFIG.USER_REG_WR_RESP_VC_MAP0 {0x7} \
   CONFIG.USER_REG_WR_RESP_VC_MAP1 {0x3} \
   CONFIG.USER_REG_WR_VCA_TOKEN0 {0x10} \
   CONFIG.USER_REG_WR_VCA_TOKEN1 {0x10} \
 ] $M01_AXI_nsu
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells M01_AXI_nsu]

  # Create instance: MC0_ddrc, and set properties
  set MC0_ddrc [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_mc_ddr4:1.0 MC0_ddrc ]
  set_property -dict [ list \
   CONFIG.CONTROLLERTYPE {DDR4_SDRAM} \
   CONFIG.MC_ATTR_FILE {nocattrs.dat} \
   CONFIG.MC_CASLATENCY {22} \
   CONFIG.MC_CHAN_REGION0 {DDR_LOW0} \
   CONFIG.MC_CHAN_REGION1 {NONE} \
   CONFIG.MC_CONFIG_NUM {config17} \
   CONFIG.MC_DC_CMD_CREDITS {0x000002a8} \
   CONFIG.MC_DDR4_2T {Disable} \
   CONFIG.MC_EN_INTR_RESP {FALSE} \
   CONFIG.MC_EXMON_CLR_EXE {0x00000100} \
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
   CONFIG.MC_INTERLEAVE_SIZE {128} \
   CONFIG.MC_MEMORY_DEVICETYPE {UDIMMs} \
   CONFIG.MC_MEMORY_SPEEDGRADE {DDR4-3200AA(22-22-22)} \
   CONFIG.MC_MEM_INIT_FILE {no_file_loaded} \
   CONFIG.MC_NO_CHANNELS {Single} \
   CONFIG.MC_PHYS_NAME {DDRMC_X0Y0} \
   CONFIG.MC_REG_ADEC0 {0x00000000} \
   CONFIG.MC_REG_ADEC1 {0x00000000} \
   CONFIG.MC_REG_ADEC2 {0x00000000} \
   CONFIG.MC_REG_ADEC3 {0x00000000} \
   CONFIG.MC_REG_ADEC4 {0x30c30c30} \
   CONFIG.MC_REG_ADEC5 {0x15513491} \
   CONFIG.MC_REG_ADEC6 {0x1a6585d6} \
   CONFIG.MC_REG_ADEC7 {0x1f79d71b} \
   CONFIG.MC_REG_ADEC8 {0x03c30c20} \
   CONFIG.MC_REG_ADEC9 {0x09207144} \
   CONFIG.MC_REG_ADEC10 {0x0f34c2ca} \
   CONFIG.MC_REG_ADEC11 {0x00c0e190} \
   CONFIG.MC_REG_CMDQ_BER_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_CMDQ_BEW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_CMDQ_CTRL0 {0x01ffffff} \
   CONFIG.MC_REG_CMDQ_CTRL1 {0x01084210} \
   CONFIG.MC_REG_CMDQ_ISR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_CMDQ_ISW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_CMDQ_LLR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_NSU0_PORT {0x00000100} \
   CONFIG.MC_REG_NSU1_PORT {0x00000000} \
   CONFIG.MC_REG_NSU2_PORT {0x00000000} \
   CONFIG.MC_REG_NSU3_PORT {0x00000000} \
   CONFIG.MC_REG_P0_BER_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P0_BEW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P0_ISR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P0_ISW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P0_LLR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P1_BER_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P1_BEW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P1_ISR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P1_ISW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P1_LLR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P2_BER_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P2_BEW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P2_ISR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P2_ISW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P2_LLR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P3_BER_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P3_BEW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P3_ISR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P3_ISW_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_P3_LLR_RATE_CTRL {0x003ffc0f} \
   CONFIG.MC_REG_QOS0 {0x001e01e0} \
   CONFIG.MC_REG_QOS1 {0x0ff00804} \
   CONFIG.MC_REG_QOS2 {0x0003fc02} \
   CONFIG.MC_REG_QOS_RATE_CTRL_SCALE {0x00000000} \
   CONFIG.MC_REG_QOS_TIMEOUT0 {0x00421084} \
   CONFIG.MC_REG_QOS_TIMEOUT1 {0xbbbbbbbb} \
   CONFIG.MC_REG_QOS_TIMEOUT2 {0x000000bb} \
   CONFIG.MC_REG_RATE_CTRL_SCALE {0x00000000} \
   CONFIG.MC_REG_RD_DRR_TKN_P0 {0x00ff0404} \
   CONFIG.MC_REG_RD_DRR_TKN_P1 {0x00000000} \
   CONFIG.MC_REG_RD_DRR_TKN_P2 {0x00000000} \
   CONFIG.MC_REG_RD_DRR_TKN_P3 {0x00000000} \
   CONFIG.MC_REG_WR_DRR_TKN_P0 {0x0000ff04} \
   CONFIG.MC_REG_WR_DRR_TKN_P1 {0x00000000} \
   CONFIG.MC_REG_WR_DRR_TKN_P2 {0x00000000} \
   CONFIG.MC_REG_WR_DRR_TKN_P3 {0x00000000} \
   CONFIG.MC_TRC {45750} \
   CONFIG.MC_TRCD {13750} \
   CONFIG.MC_TRCDMIN {13750} \
   CONFIG.MC_TRCMIN {45750} \
   CONFIG.MC_TRP {13750} \
   CONFIG.MC_TRPMIN {13750} \
   CONFIG.MC_UB_CLK_MUX {0x00000000} \
   CONFIG.MC_XMPU_CONFIG0 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG1 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG2 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG3 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG4 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG5 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG6 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG7 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG8 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG9 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG10 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG11 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG12 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG13 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG14 {0x00000008} \
   CONFIG.MC_XMPU_CONFIG15 {0x00000008} \
   CONFIG.MC_XMPU_CTRL {0x0000000b} \
   CONFIG.MC_XMPU_END_HI0 {0x00000000} \
   CONFIG.MC_XMPU_END_HI1 {0x00000000} \
   CONFIG.MC_XMPU_END_HI2 {0x00000000} \
   CONFIG.MC_XMPU_END_HI3 {0x00000000} \
   CONFIG.MC_XMPU_END_HI4 {0x00000000} \
   CONFIG.MC_XMPU_END_HI5 {0x00000000} \
   CONFIG.MC_XMPU_END_HI6 {0x00000000} \
   CONFIG.MC_XMPU_END_HI7 {0x00000000} \
   CONFIG.MC_XMPU_END_HI8 {0x00000000} \
   CONFIG.MC_XMPU_END_HI9 {0x00000000} \
   CONFIG.MC_XMPU_END_HI10 {0x00000000} \
   CONFIG.MC_XMPU_END_HI11 {0x00000000} \
   CONFIG.MC_XMPU_END_HI12 {0x00000000} \
   CONFIG.MC_XMPU_END_HI13 {0x00000000} \
   CONFIG.MC_XMPU_END_HI14 {0x00000000} \
   CONFIG.MC_XMPU_END_HI15 {0x00000000} \
   CONFIG.MC_XMPU_END_LO0 {0x00000000} \
   CONFIG.MC_XMPU_END_LO1 {0x00000000} \
   CONFIG.MC_XMPU_END_LO2 {0x00000000} \
   CONFIG.MC_XMPU_END_LO3 {0x00000000} \
   CONFIG.MC_XMPU_END_LO4 {0x00000000} \
   CONFIG.MC_XMPU_END_LO5 {0x00000000} \
   CONFIG.MC_XMPU_END_LO6 {0x00000000} \
   CONFIG.MC_XMPU_END_LO7 {0x00000000} \
   CONFIG.MC_XMPU_END_LO8 {0x00000000} \
   CONFIG.MC_XMPU_END_LO9 {0x00000000} \
   CONFIG.MC_XMPU_END_LO10 {0x00000000} \
   CONFIG.MC_XMPU_END_LO11 {0x00000000} \
   CONFIG.MC_XMPU_END_LO12 {0x00000000} \
   CONFIG.MC_XMPU_END_LO13 {0x00000000} \
   CONFIG.MC_XMPU_END_LO14 {0x00000000} \
   CONFIG.MC_XMPU_END_LO15 {0x00000000} \
   CONFIG.MC_XMPU_MASTER0 {0x00000000} \
   CONFIG.MC_XMPU_MASTER1 {0x00000000} \
   CONFIG.MC_XMPU_MASTER2 {0x00000000} \
   CONFIG.MC_XMPU_MASTER3 {0x00000000} \
   CONFIG.MC_XMPU_MASTER4 {0x00000000} \
   CONFIG.MC_XMPU_MASTER5 {0x00000000} \
   CONFIG.MC_XMPU_MASTER6 {0x00000000} \
   CONFIG.MC_XMPU_MASTER7 {0x00000000} \
   CONFIG.MC_XMPU_MASTER8 {0x00000000} \
   CONFIG.MC_XMPU_MASTER9 {0x00000000} \
   CONFIG.MC_XMPU_MASTER10 {0x00000000} \
   CONFIG.MC_XMPU_MASTER11 {0x00000000} \
   CONFIG.MC_XMPU_MASTER12 {0x00000000} \
   CONFIG.MC_XMPU_MASTER13 {0x00000000} \
   CONFIG.MC_XMPU_MASTER14 {0x00000000} \
   CONFIG.MC_XMPU_MASTER15 {0x00000000} \
   CONFIG.MC_XMPU_START_HI0 {0x00000000} \
   CONFIG.MC_XMPU_START_HI1 {0x00000000} \
   CONFIG.MC_XMPU_START_HI2 {0x00000000} \
   CONFIG.MC_XMPU_START_HI3 {0x00000000} \
   CONFIG.MC_XMPU_START_HI4 {0x00000000} \
   CONFIG.MC_XMPU_START_HI5 {0x00000000} \
   CONFIG.MC_XMPU_START_HI6 {0x00000000} \
   CONFIG.MC_XMPU_START_HI7 {0x00000000} \
   CONFIG.MC_XMPU_START_HI8 {0x00000000} \
   CONFIG.MC_XMPU_START_HI9 {0x00000000} \
   CONFIG.MC_XMPU_START_HI10 {0x00000000} \
   CONFIG.MC_XMPU_START_HI11 {0x00000000} \
   CONFIG.MC_XMPU_START_HI12 {0x00000000} \
   CONFIG.MC_XMPU_START_HI13 {0x00000000} \
   CONFIG.MC_XMPU_START_HI14 {0x00000000} \
   CONFIG.MC_XMPU_START_HI15 {0x00000000} \
   CONFIG.MC_XMPU_START_LO0 {0x00000000} \
   CONFIG.MC_XMPU_START_LO1 {0x00000000} \
   CONFIG.MC_XMPU_START_LO2 {0x00000000} \
   CONFIG.MC_XMPU_START_LO3 {0x00000000} \
   CONFIG.MC_XMPU_START_LO4 {0x00000000} \
   CONFIG.MC_XMPU_START_LO5 {0x00000000} \
   CONFIG.MC_XMPU_START_LO6 {0x00000000} \
   CONFIG.MC_XMPU_START_LO7 {0x00000000} \
   CONFIG.MC_XMPU_START_LO8 {0x00000000} \
   CONFIG.MC_XMPU_START_LO9 {0x00000000} \
   CONFIG.MC_XMPU_START_LO10 {0x00000000} \
   CONFIG.MC_XMPU_START_LO11 {0x00000000} \
   CONFIG.MC_XMPU_START_LO12 {0x00000000} \
   CONFIG.MC_XMPU_START_LO13 {0x00000000} \
   CONFIG.MC_XMPU_START_LO14 {0x00000000} \
   CONFIG.MC_XMPU_START_LO15 {0x00000000} \
   CONFIG.NOC_FREQ {1000} \
   CONFIG.NUM_MC {1} \
   CONFIG.USER_NPI_REG_MC_NSU_0_EGR {0x00473610} \
   CONFIG.USER_NPI_REG_MC_NSU_0_ING {0x04534101} \
   CONFIG.USER_NPI_REG_MC_NSU_1_EGR {0x00043210} \
   CONFIG.USER_NPI_REG_MC_NSU_1_ING {0x00432101} \
   CONFIG.USER_NPI_REG_MC_NSU_2_EGR {0x00043210} \
   CONFIG.USER_NPI_REG_MC_NSU_2_ING {0x00432101} \
   CONFIG.USER_NPI_REG_MC_NSU_3_EGR {0x00043210} \
   CONFIG.USER_NPI_REG_MC_NSU_3_ING {0x00432101} \
 ] $MC0_ddrc
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells MC0_ddrc]

  # Create instance: S00_AXI_nmu, and set properties
  set S00_AXI_nmu [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nmu:1.0 S00_AXI_nmu ]
  set_property -dict [ list \
   CONFIG.ATTR_FILE {nocattrs.dat} \
   CONFIG.NOC_FREQ {1000} \
   CONFIG.USER_NOC_CATEGORY {PS} \
   CONFIG.USER_NOC_DATA512_WIDTH {128} \
   CONFIG.USER_NOC_NMU_WIDTH {128} \
   CONFIG.USER_PHYS_NAME {NOC_NMU128_X0Y0} \
   CONFIG.USER_REG_ADDR_DST0 {0x0000} \
   CONFIG.USER_REG_ADDR_DST1 {0x0000} \
   CONFIG.USER_REG_ADDR_DST2 {0x0000} \
   CONFIG.USER_REG_ADDR_DST3 {0x0000} \
   CONFIG.USER_REG_ADDR_DST4 {0x0000} \
   CONFIG.USER_REG_ADDR_DST5 {0x0000} \
   CONFIG.USER_REG_ADDR_DST6 {0x0000} \
   CONFIG.USER_REG_ADDR_DST7 {0x0000} \
   CONFIG.USER_REG_ADDR_DST8 {0x0000} \
   CONFIG.USER_REG_ADDR_DST9 {0x0000} \
   CONFIG.USER_REG_ADDR_DST10 {0x0000} \
   CONFIG.USER_REG_ADDR_DST11 {0x0000} \
   CONFIG.USER_REG_ADDR_DST12 {0x0000} \
   CONFIG.USER_REG_ADDR_DST13 {0x0000} \
   CONFIG.USER_REG_ADDR_DST14 {0x0000} \
   CONFIG.USER_REG_ADDR_DST15 {0x0000} \
   CONFIG.USER_REG_ADDR_ENABLE {0x0001} \
   CONFIG.USER_REG_ADDR_MADDR0 {0x02010000} \
   CONFIG.USER_REG_ADDR_MADDR1 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR2 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR3 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR4 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR5 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR6 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR7 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR8 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR9 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR10 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR11 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR12 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR13 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR14 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR15 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK0 {0xffffffff} \
   CONFIG.USER_REG_ADDR_MASK1 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK2 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK3 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK4 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK5 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK6 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK7 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK8 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK9 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK10 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK11 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK12 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK13 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK14 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK15 {0x00000000} \
   CONFIG.USER_REG_ADDR_REMAP {0x0001} \
   CONFIG.USER_REG_ADDR_RPADDR0 {0x02010000} \
   CONFIG.USER_REG_ADDR_RPADDR1 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR2 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR3 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR4 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR5 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR6 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR7 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR8 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR9 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR10 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR11 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR12 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR13 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR14 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR15 {0x00000000} \
   CONFIG.USER_REG_ADR_MAP_CPM {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_FPD_AFI_0 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_FPD_AFI_1 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_LPD_AFI_FS {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_0 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_1 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_2 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_3 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PCIE {0x040} \
   CONFIG.USER_REG_ADR_MAP_PMC {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_0 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_1 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_2 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_3 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_QSPI {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_STM_GIC {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_XPDS {0xFC0} \
   CONFIG.USER_REG_AXI_LOOPBACK {0x00} \
   CONFIG.USER_REG_AXI_NON_MOD_DISABLE {0x0} \
   CONFIG.USER_REG_AXI_PAR_CHK {0x0} \
   CONFIG.USER_REG_CHOPSIZE {0xA} \
   CONFIG.USER_REG_DDR_ADR_MAP0 {0x6000} \
   CONFIG.USER_REG_DDR_ADR_MAP1 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP2 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP3 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP4 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP5 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP6 {0x1FFF} \
   CONFIG.USER_REG_DDR_DST_MAP0 {0x100} \
   CONFIG.USER_REG_DDR_DST_MAP1 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP2 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP3 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP4 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP5 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP6 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP7 {0xFC0} \
   CONFIG.USER_REG_DWIDTH {0x4} \
   CONFIG.USER_REG_ECC_CHK_EN {0x1} \
   CONFIG.USER_REG_HBM_MAP_T0_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH15 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH15 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH15 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH15 {0xFC0} \
   CONFIG.USER_REG_MODE_SELECT {0x0000} \
   CONFIG.USER_REG_OUTSTANDING_RD_TXN {0x40} \
   CONFIG.USER_REG_OUTSTANDING_WR_TXN {0x40} \
   CONFIG.USER_REG_PRIORITY {0x0} \
   CONFIG.USER_REG_RD_AXPROT_SEL {0x00} \
   CONFIG.USER_REG_RD_RATE_CREDIT_DROP {0x004} \
   CONFIG.USER_REG_RD_RATE_CREDIT_LIMIT {0x0100} \
   CONFIG.USER_REG_RD_VCA_TOKEN0 {0x33} \
   CONFIG.USER_REG_RPOISON_TO_SLVERR {0x0} \
   CONFIG.USER_REG_RROB_RAM_SETTING {0x012} \
   CONFIG.USER_REG_SMID_SEL {0x00000} \
   CONFIG.USER_REG_SRC {0x080} \
   CONFIG.USER_REG_TBASE_AXI_TIMEOUT {0x1} \
   CONFIG.USER_REG_TBASE_MODE_RLIMIT_RD {0x2} \
   CONFIG.USER_REG_TBASE_MODE_RLIMIT_WR {0x2} \
   CONFIG.USER_REG_TBASE_TRK_TIMEOUT {0x1} \
   CONFIG.USER_REG_VC_MAP {0xFAC} \
   CONFIG.USER_REG_WBUF_LAUNCH_SIZE {0x10} \
   CONFIG.USER_REG_WBUF_RAM_SETTING {0x012} \
   CONFIG.USER_REG_WR_AXPROT_SEL {0x00} \
   CONFIG.USER_REG_WR_RATE_CREDIT_DROP {0x004} \
   CONFIG.USER_REG_WR_RATE_CREDIT_LIMIT {0x0100} \
   CONFIG.USER_REG_WR_VCA_TOKEN0 {0xFF} \
 ] $S00_AXI_nmu
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells S00_AXI_nmu]

  # Create instance: S01_AXI_nmu, and set properties
  set S01_AXI_nmu [ create_bd_cell -type ip -vlnv xilinx.com:ip:noc_nmu:1.0 S01_AXI_nmu ]
  set_property -dict [ list \
   CONFIG.ATTR_FILE {nocattrs.dat} \
   CONFIG.NOC_FREQ {1000} \
   CONFIG.USER_NOC_CATEGORY {PS} \
   CONFIG.USER_NOC_DATA512_WIDTH {128} \
   CONFIG.USER_NOC_NMU_WIDTH {128} \
   CONFIG.USER_PHYS_NAME {NOC_NMU128_X0Y1} \
   CONFIG.USER_REG_ADDR_DST0 {0x0000} \
   CONFIG.USER_REG_ADDR_DST1 {0x0000} \
   CONFIG.USER_REG_ADDR_DST2 {0x0000} \
   CONFIG.USER_REG_ADDR_DST3 {0x0000} \
   CONFIG.USER_REG_ADDR_DST4 {0x0000} \
   CONFIG.USER_REG_ADDR_DST5 {0x0000} \
   CONFIG.USER_REG_ADDR_DST6 {0x0000} \
   CONFIG.USER_REG_ADDR_DST7 {0x0000} \
   CONFIG.USER_REG_ADDR_DST8 {0x0000} \
   CONFIG.USER_REG_ADDR_DST9 {0x0000} \
   CONFIG.USER_REG_ADDR_DST10 {0x0000} \
   CONFIG.USER_REG_ADDR_DST11 {0x0000} \
   CONFIG.USER_REG_ADDR_DST12 {0x0000} \
   CONFIG.USER_REG_ADDR_DST13 {0x0000} \
   CONFIG.USER_REG_ADDR_DST14 {0x0000} \
   CONFIG.USER_REG_ADDR_DST15 {0x0000} \
   CONFIG.USER_REG_ADDR_ENABLE {0x0001} \
   CONFIG.USER_REG_ADDR_MADDR0 {0x02010000} \
   CONFIG.USER_REG_ADDR_MADDR1 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR2 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR3 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR4 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR5 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR6 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR7 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR8 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR9 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR10 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR11 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR12 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR13 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR14 {0x00000000} \
   CONFIG.USER_REG_ADDR_MADDR15 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK0 {0xffffffff} \
   CONFIG.USER_REG_ADDR_MASK1 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK2 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK3 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK4 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK5 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK6 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK7 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK8 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK9 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK10 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK11 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK12 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK13 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK14 {0x00000000} \
   CONFIG.USER_REG_ADDR_MASK15 {0x00000000} \
   CONFIG.USER_REG_ADDR_REMAP {0x0001} \
   CONFIG.USER_REG_ADDR_RPADDR0 {0x02010000} \
   CONFIG.USER_REG_ADDR_RPADDR1 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR2 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR3 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR4 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR5 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR6 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR7 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR8 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR9 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR10 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR11 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR12 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR13 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR14 {0x00000000} \
   CONFIG.USER_REG_ADDR_RPADDR15 {0x00000000} \
   CONFIG.USER_REG_ADR_MAP_CPM {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_FPD_AFI_0 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_FPD_AFI_1 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_LPD_AFI_FS {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_0 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_1 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_2 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_ME_ARRAY_3 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PCIE {0x040} \
   CONFIG.USER_REG_ADR_MAP_PMC {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_0 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_1 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_2 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_PMC_ALIAS_3 {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_QSPI {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_STM_GIC {0xFC0} \
   CONFIG.USER_REG_ADR_MAP_XPDS {0xFC0} \
   CONFIG.USER_REG_AXI_LOOPBACK {0x00} \
   CONFIG.USER_REG_AXI_NON_MOD_DISABLE {0x0} \
   CONFIG.USER_REG_AXI_PAR_CHK {0x0} \
   CONFIG.USER_REG_CHOPSIZE {0xA} \
   CONFIG.USER_REG_DDR_ADR_MAP0 {0x6000} \
   CONFIG.USER_REG_DDR_ADR_MAP1 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP2 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP3 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP4 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP5 {0x1FFF} \
   CONFIG.USER_REG_DDR_ADR_MAP6 {0x1FFF} \
   CONFIG.USER_REG_DDR_DST_MAP0 {0x100} \
   CONFIG.USER_REG_DDR_DST_MAP1 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP2 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP3 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP4 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP5 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP6 {0xFC0} \
   CONFIG.USER_REG_DDR_DST_MAP7 {0xFC0} \
   CONFIG.USER_REG_DWIDTH {0x4} \
   CONFIG.USER_REG_ECC_CHK_EN {0x1} \
   CONFIG.USER_REG_HBM_MAP_T0_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T0_CH15 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T1_CH15 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T2_CH15 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH0 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH1 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH2 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH3 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH4 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH5 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH6 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH7 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH8 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH9 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH10 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH11 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH12 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH13 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH14 {0xFC0} \
   CONFIG.USER_REG_HBM_MAP_T3_CH15 {0xFC0} \
   CONFIG.USER_REG_MODE_SELECT {0x0000} \
   CONFIG.USER_REG_OUTSTANDING_RD_TXN {0x40} \
   CONFIG.USER_REG_OUTSTANDING_WR_TXN {0x40} \
   CONFIG.USER_REG_PRIORITY {0x0} \
   CONFIG.USER_REG_RD_AXPROT_SEL {0x00} \
   CONFIG.USER_REG_RD_RATE_CREDIT_DROP {0x004} \
   CONFIG.USER_REG_RD_RATE_CREDIT_LIMIT {0x0100} \
   CONFIG.USER_REG_RD_VCA_TOKEN0 {0x33} \
   CONFIG.USER_REG_RPOISON_TO_SLVERR {0x0} \
   CONFIG.USER_REG_RROB_RAM_SETTING {0x012} \
   CONFIG.USER_REG_SMID_SEL {0x00000} \
   CONFIG.USER_REG_SRC {0x0C0} \
   CONFIG.USER_REG_TBASE_AXI_TIMEOUT {0x1} \
   CONFIG.USER_REG_TBASE_MODE_RLIMIT_RD {0x2} \
   CONFIG.USER_REG_TBASE_MODE_RLIMIT_WR {0x2} \
   CONFIG.USER_REG_TBASE_TRK_TIMEOUT {0x1} \
   CONFIG.USER_REG_VC_MAP {0xFAC} \
   CONFIG.USER_REG_WBUF_LAUNCH_SIZE {0x10} \
   CONFIG.USER_REG_WBUF_RAM_SETTING {0x012} \
   CONFIG.USER_REG_WR_AXPROT_SEL {0x00} \
   CONFIG.USER_REG_WR_RATE_CREDIT_DROP {0x004} \
   CONFIG.USER_REG_WR_RATE_CREDIT_LIMIT {0x0100} \
   CONFIG.USER_REG_WR_VCA_TOKEN0 {0xFF} \
 ] $S01_AXI_nmu
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells S01_AXI_nmu]

  # Create instance: const_0, and set properties
  set const_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $const_0
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_cells const_0]

  # Create instance: hier_nsw
  create_hier_cell_hier_nsw [current_bd_instance .] hier_nsw

  # Create interface connections
  connect_bd_intf_net -intf_net M00_AXI_nsu_MAXI4 [get_bd_intf_ports M00_AXI] [get_bd_intf_pins M00_AXI_nsu/MAXI4]
  connect_bd_intf_net -intf_net M01_AXI_nsu_MAXI4 [get_bd_intf_ports M01_AXI] [get_bd_intf_pins M01_AXI_nsu/MAXI4]
  connect_bd_intf_net -intf_net MC0_ddrc_CH0_DDR4 [get_bd_intf_ports CH0_DDR4_0] [get_bd_intf_pins MC0_ddrc/CH0_DDR4]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_ports S00_AXI] [get_bd_intf_pins S00_AXI_nmu/SAXI4]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_ports S01_AXI] [get_bd_intf_pins S01_AXI_nmu/SAXI4]
  connect_bd_intf_net -intf_net sys_clk0_1 [get_bd_intf_ports sys_clk0] [get_bd_intf_pins MC0_ddrc/SYS_CLK]

  # Create port connections
  connect_bd_net -net M00_AXI_nsw_NSU [get_bd_pins M00_AXI_nsu/NSU] [get_bd_pins hier_nsw/NSU2]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets M00_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets M00_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets M00_AXI_nsw_NSU]
  connect_bd_net -net M01_AXI_nsw_NSU [get_bd_pins M01_AXI_nsu/NSU] [get_bd_pins hier_nsw/NSU1]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets M01_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets M01_AXI_nsw_NSU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets M01_AXI_nsw_NSU]
  connect_bd_net -net MC0_nsw_NSU [get_bd_pins MC0_ddrc/from_noc_0] [get_bd_pins hier_nsw/NSU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets MC0_nsw_NSU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets MC0_nsw_NSU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets MC0_nsw_NSU]
  connect_bd_net -net S00_AXI_nmu_NMU [get_bd_pins S00_AXI_nmu/NMU] [get_bd_pins hier_nsw/NMU1]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets S00_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets S00_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets S00_AXI_nmu_NMU]
  connect_bd_net -net S01_AXI_nmu_NMU [get_bd_pins S01_AXI_nmu/NMU] [get_bd_pins hier_nsw/NMU]
  set_property HDL_ATTRIBUTE.DONT_TOUCH {true} [get_bd_nets S01_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.SYNTH_ONLY {true} [get_bd_nets S01_AXI_nmu_NMU]
  set_property HDL_ATTRIBUTE.NOC.IS_NOC_NET {true} [get_bd_nets S01_AXI_nmu_NMU]
  connect_bd_net -net aclk0_1 [get_bd_ports aclk0] [get_bd_pins S00_AXI_nmu/aclk]
  connect_bd_net -net aclk1_1 [get_bd_ports aclk1] [get_bd_pins S01_AXI_nmu/aclk]
  connect_bd_net -net aclk2_1 [get_bd_ports aclk2] [get_bd_pins M00_AXI_nsu/aclk]
  connect_bd_net -net aclk3_1 [get_bd_ports aclk3] [get_bd_pins M01_AXI_nsu/aclk]
  connect_bd_net -net const_0_dout [get_bd_pins S00_AXI_nmu/NMU_RD_DEST_MODE] [get_bd_pins S00_AXI_nmu/NMU_WR_DEST_MODE] [get_bd_pins S01_AXI_nmu/NMU_RD_DEST_MODE] [get_bd_pins S01_AXI_nmu/NMU_WR_DEST_MODE] [get_bd_pins const_0/dout]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_in_noc_credit_rdy [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_IN_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_credit_rdy]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_in_noc_credit_return [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_IN_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_credit_return]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_in_noc_flit [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_IN_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_flit]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_in_noc_valid [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_IN_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_in_noc_valid]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_out_noc_credit_rdy [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_OUT_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_credit_rdy]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_out_noc_credit_return [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_OUT_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_credit_return]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_out_noc_flit [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_OUT_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_flit]
  connect_bd_net -net m00_axi_nsu_if_noc_npp_out_noc_valid [get_bd_pins M00_AXI_nsu/IF_NOC_NPP_OUT_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m00_axi_nsu_if_noc_npp_out_noc_valid]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_in_noc_credit_rdy [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_IN_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_credit_rdy]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_in_noc_credit_return [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_IN_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_credit_return]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_in_noc_flit [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_IN_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_flit]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_in_noc_valid [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_IN_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_in_noc_valid]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_out_noc_credit_rdy [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_OUT_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_credit_rdy]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_out_noc_credit_return [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_OUT_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_credit_return]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_out_noc_flit [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_OUT_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_flit]
  connect_bd_net -net m01_axi_nsu_if_noc_npp_out_noc_valid [get_bd_pins M01_AXI_nsu/IF_NOC_NPP_OUT_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets m01_axi_nsu_if_noc_npp_out_noc_valid]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rdy_0 [get_bd_pins MC0_ddrc/dmc2noc_credit_rdy_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_0]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rdy_1 [get_bd_pins MC0_ddrc/dmc2noc_credit_rdy_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_1]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rdy_2 [get_bd_pins MC0_ddrc/dmc2noc_credit_rdy_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_2]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rdy_3 [get_bd_pins MC0_ddrc/dmc2noc_credit_rdy_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rdy_3]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rtn_0 [get_bd_pins MC0_ddrc/dmc2noc_credit_rtn_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_0]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rtn_1 [get_bd_pins MC0_ddrc/dmc2noc_credit_rtn_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_1]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rtn_2 [get_bd_pins MC0_ddrc/dmc2noc_credit_rtn_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_2]
  connect_bd_net -net mc0_ddrc_dmc2noc_credit_rtn_3 [get_bd_pins MC0_ddrc/dmc2noc_credit_rtn_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_credit_rtn_3]
  connect_bd_net -net mc0_ddrc_dmc2noc_data_out_0 [get_bd_pins MC0_ddrc/dmc2noc_data_out_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_0]
  connect_bd_net -net mc0_ddrc_dmc2noc_data_out_1 [get_bd_pins MC0_ddrc/dmc2noc_data_out_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_1]
  connect_bd_net -net mc0_ddrc_dmc2noc_data_out_2 [get_bd_pins MC0_ddrc/dmc2noc_data_out_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_2]
  connect_bd_net -net mc0_ddrc_dmc2noc_data_out_3 [get_bd_pins MC0_ddrc/dmc2noc_data_out_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_data_out_3]
  connect_bd_net -net mc0_ddrc_dmc2noc_valid_out_0 [get_bd_pins MC0_ddrc/dmc2noc_valid_out_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_0]
  connect_bd_net -net mc0_ddrc_dmc2noc_valid_out_1 [get_bd_pins MC0_ddrc/dmc2noc_valid_out_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_1]
  connect_bd_net -net mc0_ddrc_dmc2noc_valid_out_2 [get_bd_pins MC0_ddrc/dmc2noc_valid_out_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_2]
  connect_bd_net -net mc0_ddrc_dmc2noc_valid_out_3 [get_bd_pins MC0_ddrc/dmc2noc_valid_out_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_dmc2noc_valid_out_3]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rdy_0 [get_bd_pins MC0_ddrc/noc2dmc_credit_rdy_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_0]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rdy_1 [get_bd_pins MC0_ddrc/noc2dmc_credit_rdy_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_1]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rdy_2 [get_bd_pins MC0_ddrc/noc2dmc_credit_rdy_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_2]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rdy_3 [get_bd_pins MC0_ddrc/noc2dmc_credit_rdy_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rdy_3]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rtn_0 [get_bd_pins MC0_ddrc/noc2dmc_credit_rtn_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_0]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rtn_1 [get_bd_pins MC0_ddrc/noc2dmc_credit_rtn_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_1]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rtn_2 [get_bd_pins MC0_ddrc/noc2dmc_credit_rtn_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_2]
  connect_bd_net -net mc0_ddrc_noc2dmc_credit_rtn_3 [get_bd_pins MC0_ddrc/noc2dmc_credit_rtn_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_credit_rtn_3]
  connect_bd_net -net mc0_ddrc_noc2dmc_data_in_0 [get_bd_pins MC0_ddrc/noc2dmc_data_in_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_0]
  connect_bd_net -net mc0_ddrc_noc2dmc_data_in_1 [get_bd_pins MC0_ddrc/noc2dmc_data_in_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_1]
  connect_bd_net -net mc0_ddrc_noc2dmc_data_in_2 [get_bd_pins MC0_ddrc/noc2dmc_data_in_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_2]
  connect_bd_net -net mc0_ddrc_noc2dmc_data_in_3 [get_bd_pins MC0_ddrc/noc2dmc_data_in_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_data_in_3]
  connect_bd_net -net mc0_ddrc_noc2dmc_valid_in_0 [get_bd_pins MC0_ddrc/noc2dmc_valid_in_0]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_0]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_0]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_0]
  connect_bd_net -net mc0_ddrc_noc2dmc_valid_in_1 [get_bd_pins MC0_ddrc/noc2dmc_valid_in_1]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_1]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_1]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_1]
  connect_bd_net -net mc0_ddrc_noc2dmc_valid_in_2 [get_bd_pins MC0_ddrc/noc2dmc_valid_in_2]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_2]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_2]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_2]
  connect_bd_net -net mc0_ddrc_noc2dmc_valid_in_3 [get_bd_pins MC0_ddrc/noc2dmc_valid_in_3]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_3]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_3]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets mc0_ddrc_noc2dmc_valid_in_3]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_in_noc_credit_rdy [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_IN_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_credit_rdy]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_in_noc_credit_return [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_IN_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_credit_return]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_in_noc_flit [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_IN_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_flit]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_in_noc_valid [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_IN_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_in_noc_valid]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_out_noc_credit_rdy [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_OUT_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_credit_rdy]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_out_noc_credit_return [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_OUT_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_credit_return]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_out_noc_flit [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_OUT_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_flit]
  connect_bd_net -net s00_axi_nmu_if_noc_npp_out_noc_valid [get_bd_pins S00_AXI_nmu/IF_NOC_NPP_OUT_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s00_axi_nmu_if_noc_npp_out_noc_valid]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_in_noc_credit_rdy [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_IN_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_credit_rdy]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_in_noc_credit_return [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_IN_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_credit_return]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_in_noc_flit [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_IN_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_flit]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_in_noc_valid [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_IN_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_in_noc_valid]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_out_noc_credit_rdy [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_OUT_NOC_CREDIT_RDY]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_credit_rdy]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_credit_rdy]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_out_noc_credit_return [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_OUT_NOC_CREDIT_RETURN]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_credit_return]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_credit_return]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_out_noc_flit [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_OUT_NOC_FLIT]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_flit]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_flit]
  connect_bd_net -net s01_axi_nmu_if_noc_npp_out_noc_valid [get_bd_pins S01_AXI_nmu/IF_NOC_NPP_OUT_NOC_VALID]
  set_property HDL_ATTRIBUTE.SIM_ONLY {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.EXT_CONN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_valid]
  set_property HDL_ATTRIBUTE.HIDDEN {TRUE} [get_bd_nets s01_axi_nmu_if_noc_npp_out_noc_valid]

  # Create address segments


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


