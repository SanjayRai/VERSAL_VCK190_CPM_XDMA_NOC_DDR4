`ifndef NOC_MC_DDR4_V1_0_ADDRESS_MAPPING_CHECKS
`define NOC_MC_DDR4_V1_0_ADDRESS_MAPPING_CHECKS

//`include "noc_na_v1_0_0_dc_common_define.vh"
class noc_mc_ddr4_v1_0_address_mapping_checks;

int NUM_CHS;
int NUM_OF_CHS;
bit[63:0] TOTAL_DRAM_SIZE;
bit[63:0] high_mem_base;
bit[63:0] high_mem_offset;
bit[63:0] low_mem_offset;
bit[63:0] low_mem_base;
bit[63:0] low_mem_region;
bit[63:0] eff_dram_size;
//bit[63:0] adec_4_11_decoding[$] = '{CH_SEL,GROUP_1,GROUP_0,BANK_1,BANK_0,COL_9,COL_8,COL_7,COL_6,COL_5,COL_4,COL_3,COL_2,COL_1,COL_0,ROW_18,ROW_17,ROW_16,
                                 // ROW_15,ROW_14,ROW_13,ROW_12,ROW_11,ROW_10,ROW_9,ROW_8,ROW_7,ROW_6,ROW_5,ROW_4,ROW_3,ROW_2,ROW_1,ROW_0,LRANK_2,LRANK_1,LRANK_0,RANK_1,RANK_0};
bit[63:0] na2dc_txn_address_1;
bit flag_high;
bit flag_low;
bit flag_invalid;
bit flag_low_mem;
bit flag_lmb;
bit flag_lmb_lmo;
bit flag_reg;
bit flag_hmo;
bit flag_error;
int intrlv_size=1;
int num_ch=1;

logic[31:0] REG_ADEC0;
logic[31:0] REG_ADEC1;
logic[31:0] REG_ADEC2;
logic[31:0] REG_ADEC3;
logic[31:0] REG_ADEC4;
logic[31:0] REG_ADEC5;
logic[31:0] REG_ADEC6;
logic[31:0] REG_ADEC7;
logic[31:0] REG_ADEC8;
logic[31:0] REG_ADEC9;
logic[31:0] REG_ADEC10;
logic[31:0] REG_ADEC11;
logic[31:0] REG_CONFIG0;
logic[31:0] REG_SCRUB0;

logic[31:0] adec[11:4];  //2-d array 
logic[5:0]  row[18:0];
logic[5:0]  col[9:0];
logic[5:0]  col_2_0[2:0];
logic[5:0]  col_3_0[3:0];
logic[5:0]  bank[1:0]; 
logic[5:0]  bank_group[1:0]; 
logic[5:0]  ch_sel;
logic[5:0]  rank[1:0];
logic[5:0]  l_rank[2:0];
logic[5:0] part_x4_x8_x16_row_4G_8G[18:16];
logic[5:0] part_x4_x8_x16_row_8G_16G[18:17];
logic[5:0] part_x4_row_16G;
logic[5:0] part_x8_x16_row_4G[18:15];
logic[5:0] unused_space[15:0];
logic[5:0] unused_space_49[14:0];
logic[5:0] lp4_part_x32_4G[18:14];
logic[5:0] lp4_part_x32_6G[18:15];
logic[5:0] lp4_part_x32_12G[18:16];
logic[5:0] lp4_part_x32_24G_32G[18:17];
logic[3:0] arr_intrlv[$];
logic[5:0] adec_addr_RBC[38:0];
logic[5:0] arr_intrlv_up[5];
logic[5:0] arr_intrlv_q[$] ;
logic[5:0] arr_intrlv_q_final[*] ;
logic[5:0] arr_intrlv_q1[$] ;
logic[5:0] arr_intrlv_q2[$] ;
logic[5:0] arr_intrlv_q3[$] ;
logic[5:0] arr_intrlv_q4[$] ;
logic[5:0] arr_intrlv_q5[$] ;
logic[5:0] arr_intrlv_q6[$] ;
   int j =48;
   int i =0;

bit[31:0] multiplier_256MB = 32'b1_0000_0000_0000_0000_0000_0000_0000;
int LOW_MEM_BASE;
int LOW_MEM_OFFSET;
int HIGH_MEM_BASE;
int HIGH_MEM_OFFSET;

int no_of_ranks;
int no_of_lranks;
int no_of_slots;
int width_per_channel_without_ECC;
int part_width;
int no_of_components;

function void DQReverse(ref logic[5:0] orig_array[$]);
  logic[5:0] stack[$];
  while(orig_array.size()!=0)begin
    stack.push_back(orig_array.pop_front());    
  end
  
  for (int i=stack.size()-1; i>=0; i--)begin
    orig_array.push_back(stack[i]);
  end

endfunction

//function int check_scrub0();
function void check_scrub0();

  if(REG_SCRUB0[23] == 1)
     REG_CONFIG0[10:8] = 3'b111;
endfunction 


//function int adec_decoding();
function void adec_decoding();
      check_scrub0();
      adec[4] = REG_ADEC4; adec[5] = REG_ADEC5; adec[6] = REG_ADEC6; adec[7] = REG_ADEC7; adec[8] = REG_ADEC8; adec[9] = REG_ADEC9;
      adec[10] = REG_ADEC10; adec[11] = REG_ADEC11;

      row[0]  = adec[5][5:0]; row[1]  = adec[5][11:6]; row[2]  = adec[5][17:12]; row[3]  = adec[5][23:18]; row[4]  = adec[5][29:24];
      row[5]  = adec[6][5:0]; row[6]  = adec[6][11:6]; row[7]  = adec[6][17:12]; row[8]  = adec[6][23:18]; row[9]  = adec[6][29:24];
      row[10] = adec[7][5:0]; row[11] = adec[7][11:6]; row[12] = adec[7][17:12]; row[13] = adec[7][23:18]; row[14] = adec[7][29:24];
      row[15] = adec[8][5:0]; row[16] = adec[8][11:6]; row[17] = adec[8][17:12]; row[18] = adec[8][23:18];
  
      col[0] = adec[8][29:24]; col[1] = adec[9][5:0]; col[2] = adec[9][11:6]; col[3] = adec[9][17:12]; col[4] = adec[9][23:18];
      col[5] = adec[9][29:24]; col[6] = adec[10][5:0]; col[7] = adec[10][11:6]; col[8] = adec[10][17:12]; col[9] = adec[10][23:18];
   
      col_2_0[0] = col[0]; col_2_0[1] = col[1]; col_2_0[2] = col[2];
      
      col_3_0[0] = col[0]; col_3_0[1] = col[1]; col_3_0[2] = col[2]; col_3_0[3] = col[3];

      bank[0] = adec[10][29:24]; bank[1] = adec[11][5:0];

      bank_group[0] = adec[11][11:6]; bank_group[1] = adec[11][17:12]; 

      ch_sel = adec[11][23:18];

      rank[0] = adec[4][5:0]; rank[1] = adec[4][11:6];

      l_rank[0] = adec[4][17:12]; l_rank[1] = adec[4][23:18]; l_rank[2] = adec[4][29:24];

      NUM_CHS = REG_CONFIG0[17];
      NUM_OF_CHS = 2**(NUM_CHS);  
       LOW_MEM_BASE    = REG_ADEC0[19:0];
       LOW_MEM_OFFSET  = REG_ADEC1[19:0];
       HIGH_MEM_BASE   = REG_ADEC2[19:0];
       HIGH_MEM_OFFSET = REG_ADEC3[19:0];
      
      high_mem_base   = HIGH_MEM_BASE * multiplier_256MB;  // multiples of 256MB 
      high_mem_offset = HIGH_MEM_OFFSET * multiplier_256MB; 
      low_mem_offset  = LOW_MEM_OFFSET * multiplier_256MB; 
      low_mem_base  =   LOW_MEM_BASE * multiplier_256MB; 
       if(REG_CONFIG0[10:8] == 3'b000)
          TOTAL_DRAM_SIZE = 64'b0000_0000_0000_0000_0000_0000_0000_0001_0000_0000_0000_0000_0000_0000_0000_0000; //4G 
       else if(REG_CONFIG0[10:8] == 3'b001)
          TOTAL_DRAM_SIZE = 64'b0000_0000_0000_0000_0000_0000_0000_0001_1000_0000_0000_0000_0000_0000_0000_0000; //6G 
       else if(REG_CONFIG0[10:8] == 3'b010)
          TOTAL_DRAM_SIZE = 64'b0000_0000_0000_0000_0000_0000_0000_0010_0000_0000_0000_0000_0000_0000_0000_0000; //8G 
       else if(REG_CONFIG0[10:8] == 3'b011)
          TOTAL_DRAM_SIZE = 64'b0000_0000_0000_0000_0000_0000_0000_0011_0000_0000_0000_0000_0000_0000_0000_0000; //12G 
       else if(REG_CONFIG0[10:8] == 3'b100)
          TOTAL_DRAM_SIZE = 64'b0000_0000_0000_0000_0000_0000_0000_0100_0000_0000_0000_0000_0000_0000_0000_0000; //16G 
       else if(REG_CONFIG0[10:8] == 3'b101)
          TOTAL_DRAM_SIZE = 64'b0000_0000_0000_0000_0000_0000_0000_1000_0000_0000_0000_0000_0000_0000_0000_0000; //32G 
     	
	TOTAL_DRAM_SIZE  =  TOTAL_DRAM_SIZE/8; //To convert to Bytes - component density
	no_of_ranks      =  2**REG_CONFIG0[ 15:14 ];
	no_of_lranks     =  2**REG_CONFIG0[ 21:20  ]		;
	no_of_slots	 =  2**REG_CONFIG0[ 16 ]		;
	part_width = ( 2 ** REG_CONFIG0 [5:4 ] ) *4  ;
	width_per_channel_without_ECC = REG_CONFIG0 [ 19:18 ] == 2'h0 ? 64 :  REG_CONFIG0 [ 19:18 ] == 2'h1 ? 32 :  REG_CONFIG0 [ 19:18 ] == 2'h2 ? 16 :64 ;
        no_of_components   =  	width_per_channel_without_ECC / part_width ;
	


        adec_addr_RBC[18:0]  = row[18:0];
        adec_addr_RBC[28:19] = col[9:0];
        adec_addr_RBC[30:29] = bank[1:0];
        adec_addr_RBC[32:31] = bank_group[1:0];
        adec_addr_RBC[33]    = ch_sel; 
        adec_addr_RBC[35:34] = rank; 
        adec_addr_RBC[38:36] = l_rank; 
 
        //$display("TOTAL_DRAM_SIZE = %0h",TOTAL_DRAM_SIZE);  
        //$display("high_mem_base = %0b",high_mem_base);  
        //$display("high_mem_offset = %0b",high_mem_offset);  
        //$display("low_mem_offset = %0b",low_mem_offset);  
        //$display("low_mem_base = %0b",low_mem_base);  
        //$display("multiplier_256MB = %0b",multiplier_256MB);  
        //$display("row0 = %0b",row[0]);  
        //$display("row1 = %0b",row[1]);  
        //$display("row2 = %0b",row[2]);  
        //$display("row3 = %0b",row[3]);  
        //$display("row4 = %0b",row[4]);  
        //$display("row5 = %0b",row[5]);  
        //$display("row6 = %0b",row[6]);  
        //$display("row7 = %0b",row[7]);  
        //$display("row8 = %0b",row[8]);  
        //$display("row9 = %0b",row[9]);  
        //$display("row10 = %0b",row[10]);  
        //$display("row11 = %0b",row[11]);  
        //$display("row12 = %0b",row[12]);  
        //$display("row13 = %0b",row[13]);  
        //$display("row14 = %0b",row[14]);  
        //$display("row15 = %0b",row[15]);  
        //$display("row16 = %0b",row[16]);  
        //$display("row17 = %0b",row[17]);  
        //$display("row18 = %0b",row[18]);  
        //$display("col0 = %0b",col[0]);  
        //$display("col1 = %0b",col[1]);  
        //$display("col2 = %0b",col[2]);  
        //$display("col3 = %0b",col[3]);  
        //$display("col4 = %0b",col[4]);  
        //$display("col5 = %0b",col[5]);  
        //$display("col6 = %0b",col[6]);  
        //$display("col7 = %0b",col[7]);  
        //$display("col8 = %0b",col[8]);  
        //$display("col9 = %0b",col[9]);  
        //$display("bank0 = %0b",bank[0]);  
        //$display("bank1 = %0b",bank[1]);  
        //$display("bg0 = %0b",bank_group[0]);  
        //$display("bg1 = %0b",bank_group[1]);  
        //$display("ch_sel = %0b",ch_sel);  
        //$display("rank0 = %0b",rank[0]);  
        //$display("rank1 = %0b",rank[1]);  
        //$display("l_rank0 = %0b",l_rank[0]);  
        //$display("l_rank1 = %0b",l_rank[1]);  
        //$display("l_rank2 = %0b",l_rank[2]);  
        //$display("REG_SCRUB0[23] = %0b",REG_SCRUB0[23]);  
           //for(int i=7;i<=12;i++) begin
           //arr_intrlv[j] = i;
           //j++;
           //end
           //$display("arr_intrlv = %0p",  arr_intrlv );
        
           //foreach(row[i]) begin
           //  //if()   
           //     //$display("i = %0d, matched row  = %0d",i, row[i]);
           //     //$display("i =%0d, matched arr_intrlv  = %0d",i, arr_intrlv[i]);
           //    if(row[i] == arr_intrlv[i]) begin
           //       $display("matched row with arr_intrlv1 = %0d", row[i]);
           //       arr_intrlv_q.push_front(row[i]);
           //       continue;
           //    end 
           //end

endfunction

task check_intrlv();
      int j=0;
           for(int i=7;i<=12;i++) begin
           arr_intrlv[j] = i;
           j++;
           end
           //$display("arr_intrlv = %0p",  arr_intrlv );
        
           adec_decoding(); // calling adec_decoding
           
           //foreach(adec_addr_RBC[i]) begin
                //$display("i = %0d, matched adec_addr_RBC  = %0d",i, adec_addr_RBC[i]);
                //$display("i =%0d, matched arr_intrlv  = %0d",i, arr_intrlv[i]);
             //for(int i=0;i<=5;i++) begin  
             arr_intrlv_q1 = adec_addr_RBC.find_first with (item == 7);
             arr_intrlv_q2 = adec_addr_RBC.find_first with (item == 8);
             arr_intrlv_q3 = adec_addr_RBC.find_first with (item == 9);
             arr_intrlv_q4 = adec_addr_RBC.find_first with (item == 10);
             arr_intrlv_q5 = adec_addr_RBC.find_first with (item == 11);
             arr_intrlv_q6 = adec_addr_RBC.find_first with (item == 12);
             
             if((arr_intrlv_q1.size == 0))
                  arr_intrlv_q1 = {0};
             if((arr_intrlv_q2.size == 0))
                  arr_intrlv_q2 = {0};
             if((arr_intrlv_q3.size == 0))
                  arr_intrlv_q3 = {0};
             if((arr_intrlv_q4.size == 0))
                  arr_intrlv_q4 = {0};
             if((arr_intrlv_q5.size == 0))
                  arr_intrlv_q5 = {0};
             if((arr_intrlv_q6.size == 0))
                  arr_intrlv_q6 = {0};
             arr_intrlv_q = {arr_intrlv_q6,arr_intrlv_q5,arr_intrlv_q4,arr_intrlv_q3,arr_intrlv_q2,arr_intrlv_q1};
             //end
             //arr_intrlv_q.reverse();
             DQReverse(arr_intrlv_q);
           //end
                  //$display($time," arr_intrlv_q  = %0p", arr_intrlv_q);
              
 
             foreach(arr_intrlv[i]) begin
                  //$display($time,"i=%0d, arr_intrlv_q[i]  = %0p",i, arr_intrlv_q[i]);
                  //$display($time,"i=%0d, arr_intrlv[i]  = %0p",i, arr_intrlv[i]);
               if(arr_intrlv_q[i] != arr_intrlv[i])
                  arr_intrlv_q_final[i] = arr_intrlv[i];

             end      
                  //$display($time," arr_intrlv_q_final  = %0p", arr_intrlv_q_final);
                  //$display($time," arr_intrlv_q_final.size  = %0p", arr_intrlv_q_final.size);

           if(NUM_OF_CHS == 1) begin // for single channel    
             if(arr_intrlv_q_final.size == 0) begin  // 1-way interleave // not kept any bits from 7-12 for interleave i.e used 7-12 bits
               intrlv_size = 1;
               num_ch = 1;

             end     
             
             if(arr_intrlv_q_final.size == 1) begin  // 2-way interleave
               intrlv_size = 2;
               num_ch = 1;
             end     
             
             if(arr_intrlv_q_final.size == 2) begin  // 4-way interleave 
               intrlv_size = 4;
               num_ch = 1;
             end     
           end
           if(NUM_OF_CHS == 2) begin    // for dual channel 
             if(arr_intrlv_q_final.size == 0) begin  // 1-way interleave // not kept any bits from 7-12 for interleave i.e used 7-12 bits
               intrlv_size = 1;
               num_ch = 2;
             end     
             
             if(arr_intrlv_q_final.size == 1) begin  // 2-way interleave
               intrlv_size = 2;
               num_ch = 2;
             end     
             
             if(arr_intrlv_q_final.size == 2) begin  // 4-way interleave 
               intrlv_size = 4;
               num_ch = 2;
             end     
           end
        
      // adec checks for checking initial configuartion
            //eff_dram_size = num_ch * intrlv_size * TOTAL_DRAM_SIZE;
            eff_dram_size = (no_of_slots * no_of_ranks * no_of_lranks *  no_of_components * TOTAL_DRAM_SIZE) * ( num_ch * intrlv_size);
            if (!eff_dram_size) begin  
		$fatal ("eff_dram_size is ZERO, no_of_slots %d, no_of_ranks %d , no_of_lranks %d ,  no_of_components %d , TOTAL_DRAM_SIZE %d,  num_ch %d, intrlv_size %d",no_of_slots , no_of_ranks , no_of_lranks ,  no_of_components , TOTAL_DRAM_SIZE ,  num_ch , intrlv_size);   
	     end
            low_mem_region =  (REG_ADEC2[20]) ? (high_mem_base - high_mem_offset) : eff_dram_size;
      
            if( low_mem_base != low_mem_offset) // added new
            begin     
                 flag_error = 1;
                //`FATAL_FINISH(1, $sformatf("FAILED : low_mem_base and low_mem_offset Programming must be similar, low_mem_base = %0h, low_mem_offset = %0h", low_mem_base, low_mem_offset), DBG); 
                $fatal(1,"FAILED : low_mem_base and low_mem_offset Programming must be similar, low_mem_base = %0h, low_mem_offset = %0h", low_mem_base, low_mem_offset); 
            end

            if(REG_ADEC2[20] && (high_mem_base <= low_mem_base)) // added new
            begin     
                 flag_error = 1;
                //`FATAL_FINISH(1, $sformatf("FAILED : high_mem_base is Programmed less than or equal to low_mem_base, high_mem_base = %0h, low_mem_base = %0h", high_mem_base, low_mem_base), DBG); 
                $fatal(1,"FAILED : high_mem_base is Programmed less than or equal to low_mem_base, high_mem_base = %0h, low_mem_base = %0h", high_mem_base, low_mem_base); 
            end

            if(REG_ADEC2[20] && (high_mem_base < high_mem_offset))
            begin     
                 flag_error = 1;
                //`FATAL_FINISH(1, $sformatf("FAILED : high_mem_base is Programmed less than high_mem_offset, high_mem_base = %0h, high_mem_offset = %0h", high_mem_base, high_mem_offset), DBG); 
                $fatal(1,"FAILED : high_mem_base is Programmed less than high_mem_offset, high_mem_base = %0h, high_mem_offset = %0h", high_mem_base, high_mem_offset); 
            end
            
            if(REG_ADEC2[20] && (low_mem_region > eff_dram_size))
            begin
                 flag_error = 1;
                 $fatal(1,"FAILED : low_mem_region is greater than effective DRAM size  low_mem_region = %0h, eff_dram_size = %0h", low_mem_region, eff_dram_size); 
            end   

endtask  


task adec_checker(logic[63:0] na2dc_txn_address);
           
     //$display($time," na2dc_txn_address_address_mapping_check = %0h", na2dc_txn_address);
       
     //adec_decoding(); // calling adec_decoding
                  
       //$display($time," ============== intrlv_size  = %0p", intrlv_size);
       //$display($time," ============== num_ch  = %0p", num_ch);
       //$display($time," ============== REG_ADEC2[20]  = %0p", REG_ADEC2[20]);
      
 
            if(REG_ADEC2[20] && high_mem_base != 0) 
            begin
                //$display($time," ============== Entered ");
                      //$display($time," ============== HIGH_MEM_CHECK  = %0d", (num_ch * intrlv_size * TOTAL_DRAM_SIZE));
            	//if(na2dc_txn_address > (high_mem_offset + (num_ch * intrlv_size * TOTAL_DRAM_SIZE)))  // MAX HIGH MEMORY REGION is = HMB+TDS-LMR(HMB-HMO) = HMB+TDS-HMB+HMO= TDS+HMO
            	if(na2dc_txn_address >= (high_mem_offset + eff_dram_size))  // MAX HIGH MEMORY REGION is = HMB+TDS-LMR(HMB-HMO) = HMB+TDS-HMB+HMO= TDS+HMO
                begin
                      flag_error = 1;
                      //`FATAL_FINISH(1, $sformatf("FAILED : Input System Address is greater than HIGH_MEM_REGION of DC. Input System_Address = 'h%0h, Max Address to DC = (high_mem_offset('h%0h) + (num_ch('h%0h) x Interleaving_type('h%0h) xTOTAL_DRAM_SIZE('h%0h))) = 'h%0h", na2dc_txn_address, high_mem_offset, num_ch, intrlv_size, TOTAL_DRAM_SIZE, (high_mem_offset + (num_ch * intrlv_size * TOTAL_DRAM_SIZE))), DBG ); 
                       $fatal(1,"FAILED : Input System Address is greater than HIGH_MEM_REGION of DC. Input System_Address = 'h%0h, Max Address to DC = (high_mem_offset('h%0h) + eff_dram_size(num_ch('h%0h) x Interleaving_type('h%0h) xTOTAL_DRAM_SIZE('h%0h))) = 'h%0h", na2dc_txn_address, high_mem_offset, num_ch, intrlv_size, TOTAL_DRAM_SIZE, (high_mem_offset+eff_dram_size)); 
     
                end
            end
            
            if(low_mem_offset > 0) 
            begin
                 if(na2dc_txn_address < low_mem_offset) 
                 begin
                      flag_error = 1;
                     //`FATAL_FINISH(1, $sformatf("FAILED : Input System Address to DC is less than low_mem_offset. Input System_Address = 'h%0h, low_mem_offset = 'h%0h",na2dc_txn_address, low_mem_offset), DBG); 
                     $fatal(1,"FAILED : Input System Address to DC is less than low_mem_offset. Input System_Address = 'h%0h, low_mem_offset = 'h%0h",na2dc_txn_address, low_mem_offset); 
                 end
            end

            if(REG_ADEC2[20] && (high_mem_base != high_mem_offset)) // checking for valid LOW Memory Region (high_mem_base != high_mem_offset)
            begin     
                   if(((na2dc_txn_address < high_mem_base) && (na2dc_txn_address >= (low_mem_offset + (high_mem_base - high_mem_offset))))) 
                   begin
                      flag_error = 1;
                    // `FATAL_FINISH(1, $sformatf(" FAILED : Input System Address('h%0h) in DC is in INVALID REGION, i.e it is less than high_mem_base('h%0h) but greater than low_memory_region 					           (low_mem_offset('h%0h) + (high_mem_base('h%0h) - high_mem_offset('h%0h)))", na2dc_txn_address, high_mem_base, low_mem_offset, high_mem_base, high_mem_offset), DBG ); 
                    $fatal(1," FAILED : Input System Address('h%0h) in DC is in INVALID REGION, i.e it is less than high_mem_base('h%0h) but greater than low_memory_region(low_mem_offset('h%0h) + (high_mem_base('h%0h) - high_mem_offset('h%0h)))", na2dc_txn_address, high_mem_base, low_mem_offset, high_mem_base, high_mem_offset); 
                   end
            end

	   `ifndef NPG_NA 
            if(!REG_ADEC2[20] && (na2dc_txn_address >= (low_mem_offset + eff_dram_size)))
            begin
                  flag_error = 1;
 		  //`FATAL_FINISH(1, $sformatf("FAILED : Input System Address in DC its greater than LOW_MEM_REGION, Input System_Address = 'h%0h, Max Address to DC = (low_mem_offset('h%0h) + (num_ch('h%0h) x Interleaving_type('h%0h) xTOTAL_DRAM_SIZE('h%0h))) = 'h%0h",na2dc_txn_address, low_mem_offset, num_ch, intrlv_size, TOTAL_DRAM_SIZE, (low_mem_offset + (num_ch * intrlv_size *TOTAL_DRAM_SIZE))), DBG);
 		  $fatal(1,"FAILED : Input System Address in DC its greater than LOW_MEM_REGION, Input System_Address = 'h%0h, Max Address to DC = (low_mem_offset('h%0h) + eff_dram_size(num_ch('h%0h) x Interleaving_type('h%0h) xTOTAL_DRAM_SIZE('h%0h))) = 'h%0h",na2dc_txn_address, low_mem_offset, num_ch, intrlv_size, TOTAL_DRAM_SIZE, (low_mem_offset + eff_dram_size));
            end
           `endif 
            


  
endtask 
 


//function int unused_space_check(logic[5:0] cfg_type[$], input string name,input string string_type = "");
function void unused_space_check(logic[5:0] cfg_type[$], input string name,input string string_type = "");

        //cfg_type.reverse;
        DQReverse (cfg_type);
        //$display("cfg_type %0p ",cfg_type); 
        //$display("cfg_type[0] %0p ",cfg_type[0]); 
        //$display("cfg_type[1] %0p ",cfg_type[1]); 
        //$display("cfg_type[2] %0p ",cfg_type[2]); 
 
 
        adec_decoding(); // calling adec_decoding
 
        while(i<=15)
        begin
           while(j<=63) //looping over unused space b/n 48 to 63
             begin
               unused_space[i] = j;
               unused_space_49[i] = j+1;
               i++;
               j++;
             end
        end
        //$display("unused_space %0p ",unused_space_49);  
            
     foreach(cfg_type[i]) begin
        
        if((name == "COLUMN") || (name == "BANK")) begin
           foreach(unused_space[j]) begin // check for unused bit
              if(cfg_type[i] == unused_space[j])
                $fatal(1,"%m, %0s bits should not be mapped to invalid bits [48:63] in system address, FAILED at :- %0s%0d, mapped_bit = %0d",name,name,i,cfg_type[i]);
           end
        end   
        else if((REG_CONFIG0[5:4] == 2'b00) || (REG_CONFIG0[5:4] == 2'b01)) begin //checks BG for CWX4 or CWX8
            if(name == "BANK_GROUP") begin
              foreach(unused_space[j]) begin // check for unused bit
                 if(cfg_type[i] == unused_space[j])
                   $fatal(1,"%m, %0s bits should not be mapped to invalid bits [48:63] in system address, FAILED at :- %0s%0d, mapped_bit = %0d",name,name,i,cfg_type[i]);
              end
            end
        end
        else begin
           foreach(unused_space_49[j]) begin // check for unused bit
            if(cfg_type[i] == unused_space_49[j]) begin
               if(name == "RANK")
                $fatal(1,"%m, For %0s %0s configuration - %0s%0d bits should not be mapped to invalid bits [49:63] in system address, FAILED at :- %0s%0d, mapped_bit = %0d",string_type,name,name,i,name,i,cfg_type[i]);
               if((name == "LRANK") || (name == "ROW"))
                $fatal(1, "%m, %0s bits should not be mapped to invalid bits [49:63] in system address, FAILED at :- %0s%0d, mapped_bit = %0d",name,name,i,cfg_type[i]);
               if(REG_CONFIG0[5:4] == 2'b10) begin// checks BG for CWX16                           
                    if(name == "BANK_GROUP") 
                      $fatal(1, "%m, %0s bits should not be mapped to invalid bits [49:63] in system address, FAILED at :- %0s%0d, mapped_bit = %0d",name,name,i,cfg_type[i]);
               end
               //else
               // $fatal(1, "%m, %0s bits should not be mapped to invalid bits [49:63] in system address, FAILED at :- %0s%0d, mapped_bit = %0d",name,name,i,cfg_type[i]);
            
            end
           end
        end
     end  
endfunction


bit row_flag = 1'b0;


//function int check_reserved_bits(logic[5:0] adec_array[$], input string array_type);
function void check_reserved_bits(logic[5:0] adec_array[$], input string array_type);
     //adec_array.reverse;
     DQReverse(adec_array);
     adec_decoding(); // calling adec_decoding

     if((REG_CONFIG0[19:18] == 2'b00)) begin // for x64
       foreach(adec_array[i]) begin
           //$display($time, "check_reserved_bits - adec_array[%0d] = %0d",i,adec_array[i]); 
           if((adec_array[i] == 'd0 ) || (adec_array[i] == 'd1) || (adec_array[i] == 'd2) || (adec_array[i] == 'd3) || (adec_array[i] == 'd4))
           $fatal(1, "%m, For CHWX64 configuration %0s bits should not be mapped to [0:4 reserved bits] in system address, FAILED at :- %0s%0d, mapped_bit = %0d", array_type, array_type, i, adec_array[i]);
       end
     end 
     if((REG_CONFIG0[19:18] == 2'b01)) begin // for x32
       foreach(adec_array[i]) begin
           if((adec_array[i] == 'd0 ) || (adec_array[i] == 'd1) || (adec_array[i] == 'd2) || (adec_array[i] == 'd3))
           $fatal(1, "%m, For CHWX32 configuration %0s bits should not be mapped to [0:3 reserved bits] in system address, FAILED at :- %0s%0d, mapped_bit = %0d", array_type, array_type, i, adec_array[i]);
       end
     end 
     if((REG_CONFIG0[19:18] == 2'b10)) begin // for x16
       foreach(adec_array[i]) begin
           if((adec_array[i] == 'd0 ) || (adec_array[i] == 'd1) || (adec_array[i] == 'd2))
           $fatal(1, "%m, For CHWX16 configuration %0s bits should not be mapped to [0:2 reserved bits] in system address, FAILED at :- %0s%0d, mapped_bit = %0d", array_type, array_type, i, adec_array[i]);
       end
     end 
    
   
endfunction

//function int rank_check(logic[5:0] rank_bits[$]);
//
//  rank_bits.reverse;
//  
//  foreach(rank_bits[i]) begin
//   
//      if(REG_CONFIG0[15:14] == 2'b00) begin // single rank check
//         if(rank_bits[i] != 'd48)  
//            $fatal(1, "%m, For Single Rank configuration, RANK0 and RANK1 should be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank_bits[i]);
//      end 
//   //`ifndef LPDDR4_MODEL   
//      if(REG_CONFIG0[15:14] == 2'b01) begin // dual rank check
//            
//            if((i == 0) & (rank_bits[i] == 48)) 
//               $fatal(1, "%m, For Dual Rank configuration RANK0 should not be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank_bits[i]);
//            
//            if((i == 1) & (rank_bits[i] != 48))  
//                $fatal(1, "%m, For Dual Rank configuration RANK1 should be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank_bits[i]);
//            
//            unused_space_check(rank,"RANK","dual"); //unused bits check
//      end    
//      if(REG_CONFIG0[15:14] == 2'b10) begin // quad rank check
//            if(rank_bits[i] == 48) 
//                $fatal(1, "%m, For qaud Rank configuration RANK0 and RANK1 should not be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank_bits[i]);
//            
//            unused_space_check(rank,"RANK","quad"); //unused bits check
//      end    
//   //`endif
//  end    
//
//endfunction


//function int check_ch_sel(logic[5:0] ch_sel);
function void check_ch_sel(logic[5:0] ch_sel);
     adec_decoding(); // calling adec_decoding
     if((REG_CONFIG0[19:18] == 2'b00)) begin // for x64
       int SIZE = 5;
       for(int i=0;i<SIZE;i++) begin 
          if((ch_sel == 'd0 ) || (ch_sel == 'd1) || (ch_sel == 'd2) || (ch_sel == 'd3) || (ch_sel == 'd4))
              $fatal(1, "%m, For CHWX64 configuration ch_sel should not be mapped to [0:4 reserved bits] in system address, FAILED at :- ch_sel mapped_bit = %0d",  ch_sel);
       end
     end
     if((REG_CONFIG0[19:18] == 2'b01)) begin // for x32
       int SIZE = 4;
       for(int i=0;i<SIZE;i++) begin 
          if((ch_sel == 'd0 ) || (ch_sel == 'd1) || (ch_sel == 'd2) || (ch_sel == 'd3))
              $fatal(1, "%m, For CHWX32 configuration ch_sel should not be mapped to [0:3 reserved bits] in system address, FAILED at :- ch_sel mapped_bit = %0d",  ch_sel);
       end
     end
     if((REG_CONFIG0[19:18] == 2'b10)) begin // for x16
       int SIZE = 3;
       for(int i=0;i<SIZE;i++) begin 
          if((ch_sel == 'd0 ) || (ch_sel == 'd1) || (ch_sel == 'd2))
              $fatal(1, "%m, For CHWX16 configuration ch_sel should not be mapped to [0:2 reserved bits] in system address, FAILED at :- ch_sel mapped_bit = %0d",  ch_sel);
       end
     end
endfunction


//function int lp4_device_den_check(logic[5:0] lp4_d[$], input string name);
function void lp4_device_den_check(logic[5:0] lp4_d[$], input string name);
     
     check_scrub0();
     //lp4_d.reverse();
     DQReverse(lp4_d);

     adec_decoding(); // calling adec_decoding
    
    if(REG_CONFIG0[0] == 1) begin  //lpddr4 check
          if(REG_CONFIG0[5:4] == 2'b11) begin // X32 dram_width check as per jedec { 
    
               foreach(lp4_d[i]) begin // {
 
                     if(REG_CONFIG0[10:8] == 3'b000) begin // 4Gb { 
                          lp4_part_x32_4G = '{row[18],row[17],row[16],row[15],row[14]};
                          foreach(lp4_part_x32_4G[j]) begin
                             if((i == j) & (lp4_part_x32_4G[j] !=48))
                             $fatal(1, "%m, For LPDDR4 - PART_WIDTH = X32 and Dram_size = 4G, Valid ROWS are ROW[0:13] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, lp4_d[i]);
                          end
                     end // }
                     if((REG_CONFIG0[10:8] == 3'b001) || (REG_CONFIG0[10:8] == 3'b010)) begin //6Gb or 8Gb
                          lp4_part_x32_6G = '{row[18],row[17],row[16],row[15]};
                          foreach(lp4_part_x32_6G[j]) begin
                             if((i == j) & (lp4_part_x32_6G[j] !=48))
                             $fatal(1, "%m, For LPDDR4 - PART_WIDTH = X32 and Dram_size = 6G or 8G, Valid ROWS are ROW[0:14] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, lp4_d[i]);
                          end
                     end
                     if((REG_CONFIG0[10:8] == 3'b011) || (REG_CONFIG0[10:8] == 3'b100)) begin //12Gb or 16Gb
                          lp4_part_x32_12G = '{row[18],row[17],row[16]};
                          foreach(lp4_part_x32_12G[j]) begin
                             if((i == j) & (lp4_part_x32_12G[j] !=48))
                             $fatal(1, "%m, For LPDDR4 - PART_WIDTH = X32 and Dram_size = 12G or 16G Valid ROWS are ROW[0:15] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, lp4_d[i]);
                          end
                     end
                     //if(REG_SCRUB0[23] == 1'b1) begin // for 24G
                     //       for(int j=0;j<=16;j++) begin
                     //          if((lp4_d[j] != 48) & (lp4_d[j] != 0)) begin
                     //            lp4_part_x32_24G_32G = '{row[18],row[17]};
                     //            foreach(lp4_part_x32_24G_32G[j]) begin
                     //               if((i == j) & (lp4_part_x32_24G_32G[j] !=48))
                     //               $fatal(1, "%m, For LPDDR4 - PART_WIDTH = X32 and Dram_size = 24G Valid ROWS are ROW[0:16] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, lp4_d[i]);
                     //            end
                     //          end
                     //       end
                     //end

 
                     if(REG_CONFIG0[10:8] == 3'b011) begin //32G 
                          lp4_part_x32_24G_32G = '{row[18],row[17]};
                          foreach(lp4_part_x32_24G_32G[j]) begin
                             if((i == j) & (lp4_part_x32_24G_32G[j] !=48))
                             $fatal(1, "%m, For LPDDR4 - PART_WIDTH = X32 and Dram_size = 32G Valid ROWS are ROW[0:16] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, lp4_d[i]);
                          end
                     end
                     
               end // }
          end // }
     end
endfunction

task check_config_task();
 check_intrlv();
`ifndef NPG_NA
 check_config();
`endif

endtask



//function int check_config();
function void check_config();

  
      adec_decoding(); // calling adec_decoding
      //check_interleave_bits();

      if(REG_CONFIG0[0] == 0)   // ddr4 check
        begin
               //begin  
                  foreach(row[i])
                    begin
		          check_reserved_bits(row, "ROW"); // reserved bits checks for CHWx32,x16
                     
                          unused_space_check(row,"ROW"); //unused bits check
                       
                       if(REG_CONFIG0[10:8] == 3'b000) begin // 4Gb { 
                       		if(REG_CONFIG0[5:4] == 2'b00) begin // X4 dram_width check as per jedec 
                                   part_x4_x8_x16_row_4G_8G  = '{row[18],row[17],row[16]};
                                   foreach(part_x4_x8_x16_row_4G_8G[j]) begin
                                     if((i == j) & (part_x4_x8_x16_row_4G_8G[j] != 48)) 
                                     $fatal(1, "%m, For PART_WIDTH = X4 and Dram_size = 4G, Valid ROWS are ROW[0:15] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, row[i]);
                                   end 
                                   
                                end                          
                       		if((REG_CONFIG0[5:4] == 2'b01) || (REG_CONFIG0[5:4] == 2'b10)) begin // X8  and X16 dram_width check as per jedec // for part_width X16 need to check, passing with resp, micron- data integrity 
                                   part_x8_x16_row_4G  = '{row[18],row[17],row[16],row[15]};
                                   foreach(part_x8_x16_row_4G[j]) begin
                                     if((i == j) & (part_x8_x16_row_4G[j] != 48)) 
                                     $fatal(1, "%m, For PART_WIDTH X8 or X16 and Dram_size = 4G, Valid ROWS are ROW[0:14] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d",i, row[i]);
                                   end 
                                   
                                end                          
                       end // }                         
                       
                       if(REG_CONFIG0[10:8] == 3'b010) begin // 8Gb { 
                         //$display("Density is 8Gb");
                       		if(REG_CONFIG0[5:4] == 2'b00) begin // X4 dram_width 
                                   //$display("PART_WIDTH is X4");
                                   part_x4_x8_x16_row_8G_16G  = '{row[18],row[17]};
                                   foreach(part_x4_x8_x16_row_8G_16G[j]) begin
                                   //$display("i = %d, part_X4 = %b",i,part_x4_x8_x16_row_8G_16G[i]);
                                     if((i == j) & (part_x4_x8_x16_row_8G_16G[j] != 48)) 
                                     $fatal(1, "%m, For PART_WIDTH X4 and Dram_size = 8G, Valid ROWS are ROW[0:16] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, row[i]);
                                   end 
                                   
                                end                          
                       		if((REG_CONFIG0[5:4] == 2'b01) || (REG_CONFIG0[5:4] == 2'b10)) begin // X8 and X16 dram_width check as per jedec // for part_width X16 need to check 
                                   part_x4_x8_x16_row_4G_8G  = '{row[18],row[17],row[16]};
                                   foreach(part_x4_x8_x16_row_4G_8G[j]) begin
                                   //$display("i = %d, part_X8 = %b",i,part_x4_x8_x16_row_4G_8G[i]);
                                     if((i == j) & (part_x4_x8_x16_row_4G_8G[j] != 48)) 
                                     $fatal(1, "%m, For PART_WIDTH X8 or X16 and Dram_size = 8G, Valid ROWS are ROW[0:15] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, row[i]);
                                   end 
                                   
                                end                          
                       end  // }                         
                       
                       if(REG_CONFIG0[10:8] == 3'b100) begin // 16Gb 
                       		if(REG_CONFIG0[5:4] == 2'b00) begin // X4 dram_width 
                                   part_x4_row_16G  = row[18];
                                     if(part_x4_row_16G != 48) 
                                     $fatal(1, "%m, For PART_WIDTH = X4 and Dram_size = 16G, Valid ROWS are ROW[0:17] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, row[i]);
                                end                          
                       		if((REG_CONFIG0[5:4] == 2'b01) || (REG_CONFIG0[5:4] == 2'b10)) begin // X8 and X16 dram_width check as per jedec // for part_width X16 need to check
                                   part_x4_x8_x16_row_8G_16G  = '{row[18],row[17]};
                                   foreach(part_x4_x8_x16_row_8G_16G[j]) begin
                                     if((i == j) & (part_x4_x8_x16_row_8G_16G[j] != 48)) 
                                     $fatal(1, "%m, For PART_WIDTH X8 or X16 Dram_size = 16G, Valid ROWS are ROW[0:16] unused ROWS should be mapped to 48 bit in system address FAILED at :- ROW%0d, mapped_bit = %0d", i, row[i]);
                                   end 
                                   
                                end                          
                       end                          

                    end
                  foreach(col[i])
                    begin
                       if((REG_CONFIG0[19:18] == 2'b00)) begin // for x64
                               if(col[i] == col_2_0[i])
                                  begin
                                    if((i == 0) && col_2_0[i] !=3)
                                      $fatal(1, "%m, For CHWX64 configuration column 0 should be mapped to bit 3 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 1) && col_2_0[i] !=4)
                                      $fatal(1, "%m, For CHWX64 configuration column 1 should be mapped to bit 4 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 2) && col_2_0[i] !=5)
                                      $fatal(1, "%m, For CHWX64 configuration column 2 should be mapped to bit 5 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                  end
                               else
                                  begin
                                    if((col[i] == 'd0 ) || (col[i] == 'd1) || (col[i] == 'd2) || (col[i] == 'd3) || (col[i] == 'd4))
                                      $fatal(1, "%m, For CHWX64 configuration COLUMN bits[3:9] should not be mapped to [0:4 reserved bits] in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                  end
                       
                       end
                       
                       if((REG_CONFIG0[19:18] == 2'b01)) begin // for x32
                               if(col[i] == col_2_0[i])
                                  begin
                                    if((i == 0) && col_2_0[i] !=2)
                                    $fatal(1, "%m, For CHWX32 configuration column 0 should be mapped to bit 2 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 1) && col_2_0[i] !=3)
                                      $fatal(1, "%m, For CHWX32 configuration column 1 should be mapped to bit 3 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 2) && col_2_0[i] !=4)
                                      $fatal(1, "%m, For CHWX32 configuration column 2 should be mapped to bit 4 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                               else
                                 begin
                                    if((col[i] == 'd0 ) || (col[i] == 'd1) || (col[i] == 'd2) || (col[i] == 'd3)) 
                                      $fatal(1, "%m, For CHWX32 configuration COLUMN bits[3:9] should not be mapped to [0:3 reserved bits] in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                       end
                       
                       if((REG_CONFIG0[19:18] == 2'b10)) begin // for x16
                               if(col[i] == col_2_0[i])
                                 begin
                                    //$display("//////// equal columns are i %d, values = %b", i, col[i]);
                                    //$display("//////// col_2_0 are i %d, values = %b", i, col_2_0[i]);
                                   if((i == 0) && col_2_0[i] !=1)
                                     $fatal(1, "%m, For CHWX16 configuration column 0 should be mapped to bit 1 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                   if((i == 1) && col_2_0[i] !=2)
                                     $fatal(1, "%m, For CHWX16 configuration column 1 should be mapped to bit 2 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                   if((i == 2) && col_2_0[i] !=3)
                                     $fatal(1, "%m, For CHWX16 configuration column 2 should be mapped to bit 3 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                               else
                                 begin
                                    //$display("//////// unequal columns are i %d, values = %b", i, col[i]);
                                   if((col[i] == 'b0 ) || (col[i] == 'd1) || (col[i] == 'd2))
                                     $fatal(1, "%m, For CHWX16 configuration COLUMN bits[3:9] should not be mapped to [0:2 reserved bits] in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                       end
                       unused_space_check(col,"COLUMN"); //unused bits check
                    end
                  foreach(bank[i])
                    begin
		       check_reserved_bits(bank, "BANK");  //reserved bits checks for CHW x64,x32,x16
                       
                       unused_space_check(bank,"BANK"); //unused bits check
                    end
                  foreach(bank_group[i])
                    begin

                       if(REG_CONFIG0[5:4] == 2'b10) begin// for DDR4 CWX16                           
                         if((i == 0) && (bank_group[i] == 48))
                          $fatal(1, "%m, For PART_WIDTH X16 - BANK_GROUP0 should not be mapped to unused bit 48 in system address FAILED at :- BANK_GROUP%0d, mapped_bit = %0d",i, bank_group[i]);
                         if((i == 1) && (bank_group[i] != 48))
                          $fatal(1, "%m, For PART_WIDTH X16 - BANK_GROUP1 should be mapped to unused bit 48 in system address FAILED at :- BANK_GROUP%0d, mapped_bit = %0d",i, bank_group[i]);
                           
                       end  

		       check_reserved_bits(bank_group, "BANK_GROUP");  // reserved bits checks for CHW x64,x32,x16
                       
                       unused_space_check(bank_group,"BANK_GROUP"); //unused bits check
                       
                    end 
                  foreach(rank[i])
                    begin

		         check_reserved_bits(rank, "RANK");  // reserved bits checks for CHW x64,x32,x16
                     
                         // (num_ranks -> 0 & num_slots -> 0 => rank_1)
                         // (num_ranks -> 0 & num_slots -> 1 or num_ranks -> 1 & num_slots -> 0 => rank_2 ) 
                         // (num_ranks -> 1 & num_slots -> 1 or num_ranks -> 2 & num_slots -> 0 => rank_4 )    
                        
                         //if((REG_CONFIG0[15:14] == 2'b00) && (REG_CONFIG0[16] == 1'b0)) begin // single rank check, i.e num_ranks= 0 -> 1 & num_slots= 0 -> 1 
                         if((REG_CONFIG0[15:14] == 2'b00) ) begin // single rank check, i.e num_ranks= 0 -> 1 & num_slots= 0 -> 1 
                            if(rank[i] != 'd48)  
                               $fatal(1, "%m, For Single Rank configuration, RANK0 and RANK1 should be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                         end    
                         
                         //if(((REG_CONFIG0[15:14] == 2'b00) && (REG_CONFIG0[16] == 1'b1)) || ((REG_CONFIG0[15:14] == 2'b01) && (REG_CONFIG0[16] == 1'b0))) begin // dual rank check
                         if(((REG_CONFIG0[15:14] == 2'b01) )) begin // dual rank check
                               if((i == 0) & (rank[i] == 48)) 
                                  $fatal(1, "%m, For Dual Rank configuration RANK0 should not be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                               
                               if((i == 1) & (rank[i] != 48))  
                                   $fatal(1, "%m, For Dual Rank configuration RANK1 should be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                         //      unused_space_check(rank,"RANK","dual"); //unused bits check
                         end

                         //if(((REG_CONFIG0[15:14] == 2'b01) && (REG_CONFIG0[16] == 1'b1)) || ((REG_CONFIG0[15:14] == 2'b10) && (REG_CONFIG0[16] == 1'b0))) begin //quad rank check
                         if (REG_CONFIG0[15:14] == 2'b10) begin //quad rank check  - CR-1069505:total ranks is programmed in reg_config0[15:14],no need to check no slots for determining Quad Rank
                               if(rank[i] == 48) 
                                   $fatal(1, "%m, For qaud Rank configuration RANK0 and RANK1 should not be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                               
     			       //unused_space_check(rank,"RANK","quad"); //unused bits check
                         end    

                         //TODO if num_ranks==4 and num_slot=2 is it a valid configuration to check , Does DIMM_types also affects num_ranks calculation?

 
                    end 
                  foreach(l_rank[i])
                    begin
		       check_reserved_bits(l_rank, "LRANK");  // reserved bits checks for CHW x64,x32,x16
                       
                       if((REG_CONFIG0[21:20] == 2'b01)) begin // dual lrank check
                               if((i == 0) & (l_rank[i] == 48)) 
                                  $fatal(1, "%m, For Dual 3DS LRANK configuration LRANK0 should not be mapped to unused bit 48 in system address, FAILED at :- LRANK%0d, mapped_bit = %0d", i, l_rank[i]);
                               
                               if((i != 0) & (l_rank[i] != 48))  
                                   $fatal(1, "%m, For Dual 3DS LRANK configuration LRANK1 and LRANK2 should be mapped to unused bit 48 in system address, FAILED at :- LRANK%0d, mapped_bit = %0d", i, l_rank[i]);
                       end    
                       if((REG_CONFIG0[21:20] == 2'b10)) begin // quad lrank check
                               if((i != 2) & (l_rank[i] == 48)) 
                                  $fatal(1, "%m, For Quad 3DS LRANK configuration LRANK0 and LRANK1 should not be mapped to unused bit 48 in system address, FAILED at :- LRANK%0d, mapped_bit = %0d", i, l_rank[i]);
                               if((i == 2) & (l_rank[i] != 48))  
                                   $fatal(1, "%m, For Quad 3DS LRANK configuration LRANK2 should be mapped to unused bit 48 in system address, FAILED at :- LRANK%0d, mapped_bit = %0d", i, l_rank[i]);
                       end 
                       if((REG_CONFIG0[21:20] == 2'b11)) begin // eight lrank check
                               if(l_rank[i] == 48)  
                                   $fatal(1, "%m, For Eight 3DS LRANK configuration LRANK0, LRANK1 & LRANK2 should not be mapped to unused bit 48 in system address, FAILED at :- LRANK%0d, mapped_bit = %0d", i, l_rank[i]);
                       end 
 
     		       unused_space_check(l_rank,"LRANK"); //unused bits check
                    end 
                  
                  check_ch_sel(ch_sel); // reserved bits checks for CHW x64,x32,x16
                  
                  //foreach(unused_space[j]) begin   // check for unused bit
                  //  if(ch_sel == unused_space[j])
                  //     $fatal(1, "%m, ch_sel should not be mapped to [48:63 reserved bits] in system address, FAILED at :- ch_sel mapped_bit = %0d",  ch_sel);
                  //end  
               //end
                  


        end

      if(REG_CONFIG0[0] == 1) begin  //lpddr4 check
              //$display("/////////// inside LPDDR4_check");   

               foreach(row[i]) begin
		          check_reserved_bits(row, "ROW"); // reserved bits checks for CHW x64,x32,x16
                     
                          unused_space_check(row,"ROW"); //unused bits check

                          //if(REG_CONFIG0[10:8] == 3'b000) begin // 4Gb { 
                          lp4_device_den_check(row,"ROW");                               
  


               end
               
               foreach(col[i]) begin
                       if((REG_CONFIG0[19:18] == 2'b01)) begin // for CHWx32
                               if(col[i] == col_3_0[i])
                                  begin
                                    //if((i == 0) && col_3_0[i] !=2)
                                    //  $fatal("%m, For LPDDR4 CHWX32 configuration column 0 should be mapped to bit 2 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    //if((i == 1) && col_3_0[i] !=3)
                                    //  $fatal("%m, For LPDDR4 CHWX32 configuration column 1 should be mapped to bit 3 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 2) && col_3_0[i] !=4)
                                      $fatal(1, "%m, For LPDDR4 CHWX32 configuration column 2 should be mapped to bit 4 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 3) && col_3_0[i] !=5)
                                      $fatal(1, "%m, For LPDDR4 CHWX32 configuration column 3 should be mapped to bit 5 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                               else
                                 begin
                                    if((col[i] == 'd0 ) || (col[i] == 'd1) || (col[i] == 'd2) || (col[i] == 'd3)) 
                                      $fatal(1, "%m, For LPDDR4 CHWX32 configuration COLUMN bits[4:9] should not be mapped to [0:3 reserved bits] in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                       end
                       if((REG_CONFIG0[19:18] == 2'b10)) begin // for CHWx16
                               if(col[i] == col_3_0[i])
                                  begin
                                    //if((i == 0) && col_3_0[i] !=1)
                                    //  $fatal("%m, For LPDDR4 CHWX16 configuration column 0 should be mapped to bit 1 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    //if((i == 1) && col_3_0[i] !=2)
                                    //  $fatal("%m, For LPDDR4 CHWX16 configuration column 1 should be mapped to bit 2 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 2) && col_3_0[i] !=3)
                                      $fatal(1, "%m, For LPDDR4 CHWX16 configuration column 2 should be mapped to bit 3 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                    if((i == 3) && col_3_0[i] !=4)
                                      $fatal(1, "%m, For LPDDR4 CHWX16 configuration column 3 should be mapped to bit 4 in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                               else
                                 begin
                                    if((col[i] == 'd0 ) || (col[i] == 'd1) || (col[i] == 'd2)) 
                                      $fatal(1, "%m, For LPDDR4 CHWX16 configuration COLUMN bits[4:9] should not be mapped to [0:2 reserved bits] in system address, FAILED at :- COLUMN%0d, mapped_bit = %0d", i, col[i]);
                                 end
                       
                       end
                          unused_space_check(col,"COLUMN"); //unused bits check
                       
               end
               
               foreach(bank[i]) begin
		          check_reserved_bits(bank, "BANK"); // reserved bits checks for CHWx32,x16
                          unused_space_check(bank,"BANK"); //unused bits check
               end
                  

               check_ch_sel(ch_sel); // reserved bits checks for CHW x64,x32,x16
                  
               //foreach(unused_space[j]) begin   // check for unused bit
               //  if(ch_sel == unused_space[j])
               //     $fatal("%m, ch_sel should not be mapped to [48:63 reserved bits] in system address, FAILED at :- ch_sel mapped_bit = %0d",  ch_sel);
               //end  
               
               foreach(rank[i]) begin
		         
                        check_reserved_bits(rank, "RANK");  // reserved bits checks for x32,x16
                     
                        //rank_check(rank);
                         //if((REG_CONFIG0[15:14] == 2'b00) && (REG_CONFIG0[16] == 1'b0)) begin // single rank check, i.e num_ranks= 0 -> 1 & num_slots= 0 -> 1 
                         if((REG_CONFIG0[15:14] == 2'b00) ) begin // single rank check,  
                            if(rank[i] != 'd48)  
                               $fatal(1, "%m, For Single Rank configuration, RANK0 and RANK1 should be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                         end    
                         
                         //if(((REG_CONFIG0[15:14] == 2'b00) && (REG_CONFIG0[16] == 1'b1)) || ((REG_CONFIG0[15:14] == 2'b01) && (REG_CONFIG0[16] == 1'b0))) begin // dual rank check
                         if( (REG_CONFIG0[15:14] == 2'b01) ) begin // dual rank check
                               if((i == 0) & (rank[i] == 48)) 
                                  $fatal(1, "%m, For Dual Rank configuration RANK0 should not be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                               
                               if((i == 1) & (rank[i] != 48))  
                                   $fatal(1, "%m, For Dual Rank configuration RANK1 should be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                         //      unused_space_check(rank,"RANK","dual"); //unused bits check
                         end

                         //if(((REG_CONFIG0[15:14] == 2'b01) && (REG_CONFIG0[16] == 1'b1)) || ((REG_CONFIG0[15:14] == 2'b10) && (REG_CONFIG0[16] == 1'b0))) begin //quad rank check
                         if((REG_CONFIG0[15:14] == 2'b10) ) begin //quad rank check
                               if(rank[i] == 48) 
                                   $fatal(1, "%m, For quad Rank configuration RANK0 and RANK1 should not be mapped to unused bit 48 in system address, FAILED at :- RANK%0d, mapped_bit = %0d", i, rank[i]);
                               
     			       //unused_space_check(rank,"RANK","quad"); //unused bits check
                         end    
               end 
                  
               foreach(bank_group[i]) begin
                   if((i == 0) && (bank_group[i] == 48))
                     $fatal(1, "%m, For LPDDR4 - BANK_GROUP0 should not be mapped to unused bit 48 in system address FAILED at :- BANK_GROUP%0d, mapped_bit = %0d",i, bank_group[i]);
                   if((i == 1) && (bank_group[i] != 48))
                     $fatal(1, "%m, For LPDDR4 - BANK_GROUP1 should be mapped to unused bit 48 in system address FAILED at :- BANK_GROUP%0d, mapped_bit = %0d",i, bank_group[i]);
               end
               
                 
     end
  
endfunction  


endclass 
`endif
