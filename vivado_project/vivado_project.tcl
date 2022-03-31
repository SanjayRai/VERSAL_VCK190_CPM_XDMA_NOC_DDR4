# Created : 9:31:38, Tue Jun 21, 2016 : Sanjay Rai

source ../device_type.tcl
create_project -force project_X project_X -part [DEVICE_TYPE] 
set_property board_part [BOARD_TYPE] [current_project]

add_files -fileset sources_1 -norecurse {
../IP/CPM_bd/CPM_bd.bd
../rtl/CPM_bd_wrapper.v
../IP/vio_0v/vio_0v.xci
../rtl/block_ram_daisy_chain_v2.v
../rtl/clk_gen.v
../rtl/dsp.v
../rtl/dsp_top.v
../rtl/logic_slr.v
../rtl/top_log.v
../rtl/vck190_tester_top.sv
}
add_files -fileset constrs_1 -norecurse ../rtl/vck190_tester_top.xdc

launch_runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -jobs 8
wait_on_run impl_1
open_run impl_1
launch_runs impl_1 -to_step write_device_image -jobs 8
wait_on_run impl_1
write_hw_platform -fixed -include_bit -force -file ./vck190_tester_top.xsa
report_power -file {./vck190_tester_top_power.txt} -xpe {./vck190_tester_top_power.xpe} -rpx {./vck190_tester_top_power.rpx} -name {power_1}
report_utilization -file {./vck190_tester_top_utilization.txt} -name utilization_1
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets -name timing_1 -file ./vck190_tester_top_timing_summary.txt
report_clock_interaction -delay_type min_max -significant_digits 3 -name timing_2
