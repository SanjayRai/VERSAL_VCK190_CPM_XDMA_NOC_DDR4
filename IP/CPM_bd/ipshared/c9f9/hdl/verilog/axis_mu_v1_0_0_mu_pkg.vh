
function integer full_32bit_block(input integer WIDTH);
  begin
      full_32bit_block = WIDTH/32;
  end
endfunction

function integer nfull_32bit_block(input integer WIDTH);
    integer temp;
  begin
    temp = WIDTH % 32;
    if (temp == 0)
    begin
      nfull_32bit_block = 0;
    end
    else
    begin
      nfull_32bit_block = 1;
    end
  end
endfunction

function integer full_80bit_block(input integer WIDTH);
  begin
      full_80bit_block = WIDTH/80;
  end
endfunction

function integer nfull_80bit_block(input integer WIDTH);
    integer temp;
  begin
    temp = WIDTH % 80;
    if (temp == 0)
    begin
      nfull_80bit_block = 0;
    end
    else
    begin
      nfull_80bit_block = 1;
    end
  end
endfunction

function integer cfglut_cnt(input integer WIDTH, input integer mu_type);
    integer temp;
  begin
    if (mu_type == 2 || mu_type == 3)
    begin
      temp = WIDTH % 2;
      if (temp == 0)
      begin
        cfglut_cnt = WIDTH / 2;
      end
      else
      begin
        cfglut_cnt = (WIDTH / 2) + 1;
      end
    end
    else
    begin
      temp = WIDTH % 5;
      if (temp == 0)
      begin
        cfglut_cnt = WIDTH / 5;
      end
      else
      begin
        cfglut_cnt = (WIDTH / 5) + 1;
      end
    end
  end
endfunction

function integer last_eq_cfglut(input integer WIDTH);
    integer temp;
  begin
      temp = WIDTH % 5;
      if (temp == 0)
        last_eq_cfglut = 0;
      else
        last_eq_cfglut = 1;
  end
endfunction

function integer last_eq_edge_cfglut(input integer WIDTH);
    integer temp;
  begin
      temp = WIDTH % 2;
      if (temp == 0)
        last_eq_edge_cfglut = 0;
      else
        last_eq_edge_cfglut = 1;
  end
endfunction

function integer last_carry4(input integer WIDTH);
    integer temp;
  begin
      temp = WIDTH % 4;
      if (temp == 0)
        last_carry4 = 0;
      else
        last_carry4 = 1;
  end
endfunction

function integer last_allx_cfglut(input integer WIDTH);
    integer temp;
  begin
      temp = WIDTH % 2;
      if (temp == 0)
        last_allx_cfglut = 0;
      else
        last_allx_cfglut = 1;
  end
endfunction

function integer cry4_cnt(input integer WIDTH);
    integer temp;
  begin
    temp = WIDTH % 4;
    if (temp == 0)
    begin
      cry4_cnt = WIDTH / 4;
    end
    else
    begin
      cry4_cnt = (WIDTH / 4) + 1;
    end
  end
endfunction
