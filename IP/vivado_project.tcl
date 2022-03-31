# Created : 9:31:38, Tue Jun 21, 2016 : Sanjay Rai

source ../device_type.tcl
create_project -force project_X project_X -part [DEVICE_TYPE] 
set_property board_part [BOARD_TYPE] [current_project]

add_files -fileset sources_1 -norecurse {
../IP/CPM_bd/CPM_bd.bd
../IP/vio_0v/vio_0v.xci
}

proc regenrate_cips {} {
    reset_target all [get_files  cips_ddr_pl_debug.bd]
    generate_target all [get_files cips_ddr_pl_debug.bd]
}
