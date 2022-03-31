##
## All MU Type 3 instances constraints and wavier
##
set_false_path -from [get_pins -filter {REF_PIN_NAME=~CLK*} -of_objects [get_cells ALLX.L2_*FULL*/*_cfglut/S1*]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells ALLX.u_allx_carry/co_temp_reg]]
set_false_path -from [get_pins -filter {REF_PIN_NAME=~CLK*} -of_objects [get_cells ALLX.L2_*FULL*/*_cfglut/S2*]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells ALLX.u_allx_carry/co_temp_reg]]

create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~CLK*} -of_objects [get_cells ALLX.L2_*FULL*/*_cfglut/S1*]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells ALLX.u_allx_carry/co_temp_reg]]  -user "axis_ila" -description {This CDC is coming in Match unit of ILA. After the source gets updated, there is very large time after which the destination get the value.} -tags "1052662" -scope -internal 
create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~CLK*} -of_objects [get_cells ALLX.L2_*FULL*/*_cfglut/S2*]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells ALLX.u_allx_carry/co_temp_reg]]  -user "axis_ila" -description {This CDC is coming in Match unit of ILA. After the source gets updated, there is very large time after which the destination get the value.} -tags "1052662" -scope -internal 

