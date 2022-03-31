

set_false_path -from [get_pins -filter {REF_PIN_NAME=~CLK*} -of_objects [get_cells -hierarchical -filter {NAME =~ "*axis_mu*/inst/ALLX.drive_srl*"}]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*axis_mu*/inst/ALLX.u_allx_carry/co_temp_reg"}]]
create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~CLK*} -of_objects [get_cells -hierarchical -filter {NAME =~ "*axis_mu*/inst/ALLX.drive_srl*"}]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*axis_mu*/inst/ALLX.u_allx_carry/co_temp_reg"}]] -user "axis_ila" -description {This CDC is coming in Match unit of ILA. After the source gets updated, there is very large time after which the destination get the value.} -tags "1052662" -scope -internal 
#set_false_path -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*axis_mu*/inst/ALLX.drive_srl*"}]] -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*axis_mu*/inst/ALLX.u_allx_carry/co_temp_reg"}]]

