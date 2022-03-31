  function [7:0] f_bit8_width(
  // Cast as bit8. Replace with null_value if not qualified.
      input [7:0] arg,
      input       qual, // boolean
      input [7:0] null_val
    );
    begin
      f_bit8_width = qual ? arg : null_val;
    end
  endfunction

function integer clogb2 (input integer bit_depth);
  begin
    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
      bit_depth = bit_depth >> 1;
  end
endfunction

