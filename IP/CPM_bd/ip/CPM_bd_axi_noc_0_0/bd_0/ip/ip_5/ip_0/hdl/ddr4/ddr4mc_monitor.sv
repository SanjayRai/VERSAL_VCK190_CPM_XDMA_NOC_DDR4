`ifndef _DDRMC_MONITOR_
`define _DDRMC_MONITOR_
 `include "noc_na_v1_0_0_dc_common_define.vh"
 `include "mc_macros.svh"
 

//virtual channels that each traffic class would take


`ifndef MC_DDR4_FLIT_TRANSACTION_OBJECT
`define MC_DDR4_FLIT_TRANSACTION_OBJECT
class noc_mc_ddr4_v1_0_flit_transaction_object;

`define FLIT_DATA_SIZE_BYTE 16

bit [11:0] PARAM_SRC_ID =0;
bit [11:0] PARAM_DEST_ID[10] ='{10{0}} ;
bit [11:0] PARAM_DEST_ID_WT[10] ='{10{0}} ;
bit [2:0] REG_RD_REQ_VC_MAP0  = 0;
bit [2:0] REG_WR_REQ_VC_MAP0  = 1;
bit [2:0] REG_RD_RESP_VC_MAP0 = 2;
bit [2:0] REG_WR_RESP_VC_MAP0 = 3;
bit [2:0] REG_RD_REQ_VC_MAP1  = 4;
bit [2:0] REG_WR_REQ_VC_MAP1  = 5;
bit [2:0] REG_RD_RESP_VC_MAP1 = 6;
bit [2:0] REG_WR_RESP_VC_MAP1 = 7;

string src_comp="NO";//to support monitoring og pkt

  int                                  u_trans_size_bytes;
  bit user_size =1'b0;
  bit [`NOC_AXADDR_WIDTH       -1 :0] u_aaddr;
  bit [`NOC_AXLEN_WIDTH        -1 :0] u_alen;
  bit [`NOC_AXSIZE_WIDTH       -1 :0] u_asize;
  bit [`NOC_AXBURST_WIDTH      -1 :0] u_aburst;
  bit [`NOC_AXLOCK_WIDTH       -1 :0] u_alock;
  bit [`NOC_AXCACHE_WIDTH      -1 :0] u_acache;
  bit [`NOC_AXPROT_WIDTH       -1 :0] u_aprot;
  bit [`NOC_AXQOS_WIDTH        -1 :0] u_aqos;
  bit [`NOC_AXUSER_WIDTH       -1 :0] u_auser;
  bit [`NOC_AXID_WIDTH         -1 :0] u_aid;

// FLIT control
  bit [`NOC_NPP_PKT_TYPE_WIDTH        -1 :0] u_tx_type_b;
  bit [`NOC_NPP_MISC_CTRL_WIDTH -1 :0] u_misc_ctrl;
  bit [`NOC_NPP_TAG_WIDTH         -1 :0] u_tag;
  bit [`NOC_NPP_SRC_WIDTH         -1 :0] u_src;
  bit [`NOC_NPP_DST_WIDTH        -1 :0] u_dest;
  bit [`NOC_NPP_DBI_WIDTH          -1 :0] u_dp;
  bit [`NOC_NPP_PRI_WIDTH         -1 :0] u_pri;
  bit [`NOC_NPP_ECC_WIDTH       -1 :0] u_fprot;
  bit [`NOC_NPP_LAST_WIDTH        -1 :0] u_last;
  bit [`NOC_AXSTRB16_WIDTH     -1 :0] u_per_byte[];//for data as data-wstrb
  /////////////////////////
// AXI fileds
  rand bit [`NOC_AXADDR_WIDTH       -1 :0] aaddr;
  rand bit [`NOC_AXLEN_WIDTH        -1 :0] alen;
  rand bit [`NOC_AXSIZE_WIDTH       -1 :0] asize;
  rand bit [`NOC_AXBURST_WIDTH      -1 :0] aburst;
  rand bit [`NOC_AXLOCK_WIDTH       -1 :0] alock;
  rand bit [`NOC_AXCACHE_WIDTH      -1 :0] acache;
  rand bit [`NOC_AXPROT_WIDTH       -1 :0] aprot;
  rand bit [`NOC_AXQOS_WIDTH        -1 :0] aqos;
  rand bit [`NOC_AXUSER_WIDTH       -1 :0] auser;
  //rand bit [`NOC_AXID_WIDTH         -1 :0] aid;
  randc bit [`NOC_AXID_WIDTH         -1 :0] aid;


// FLIT control
       bit [`NOC_NPP_PKT_TYPE_WIDTH        -1 :0] tx_type_b;
       bit [`NOC_NPP_MISC_CTRL_WIDTH -1 :0] misc_ctrl;
  rand bit [`NOC_NPP_TAG_WIDTH         -1 :0] tag;
  rand bit [`NOC_NPP_SRC_WIDTH         -1 :0] src;
  rand bit [`NOC_NPP_DST_WIDTH        -1 :0] dest;
       bit [`NOC_NPP_DBI_WIDTH          -1 :0] dp;
       bit [`NOC_NPP_PRI_WIDTH         -1 :0] pri;
       bit [`NOC_NPP_ECC_WIDTH       -1 :0] fprot;
       bit [`NOC_NPP_LAST_WIDTH        -1 :0] last;
  rand bit [`NOC_AXSTRB16_WIDTH     -1 :0] per_byte[];//for data as data-wstrb
       // for daat wstrb, and other data flit control fileds
// FLIT data
  //rand bit [`NOC_AXDATA128_WIDTH        -1 :0] data[$];//might take as a dynamic array of length flit_len
  rand bit [`NOC_AXDATA128_WIDTH        -1 :0] data[];//might take as a dynamic array of length flit_len
// entire FLIT transaction
       bit [`NOC_NPP_WIDTH              -1 :0] flit[$];//might take as a dynamic array of length flit_len

  rand int                                  flit_len;//total flit len, header+data+resp

  rand bit [2:0] vc_num; //fixme: not sure how to implement VC
  bit      [2:0] u_vc_num; //fixme: not sure how to implement VC
  //int npg_id = {`NPG_ID};
//inputs received from user
rand  bit [1:0] tx_type;
//rand  longint uid=0; //unique id
longint uid=0; //unique id

static int id_cnt;
//  addr_gen addr_gen_class;
  time start_time;
  time data_start_time;
  time data_end_time;
  bit [11:0] b_PARAM_SRC_ID;  
  bit [11:0] b_PARAM_DEST_ID[10];
  bit [11:0] b_PARAM_DEST_ID_WT[10];  



  rand int delay;//to delay the flit
  bit cfg_ddr_seq=0;


  //function new (bit [11:0] PARAM_SRC_ID = 0,bit [11:0] PARAM_DEST_ID[10] = '{10{0}},bit [11:0] PARAM_DEST_ID_WT[10] = '{10{0}});
  function new (
   bit [11:0] PARAM_SRC_ID =0
  ,bit [11:0] PARAM_DEST_ID[10] ='{10{0}} 
  ,bit [11:0] PARAM_DEST_ID_WT[10] ='{10{0}} 
  ,bit [2:0] REG_RD_REQ_VC_MAP0  = 0
  ,bit [2:0] REG_WR_REQ_VC_MAP0  = 1
  ,bit [2:0] REG_RD_RESP_VC_MAP0 = 2
  ,bit [2:0] REG_WR_RESP_VC_MAP0 = 3
  ,bit [2:0] REG_RD_REQ_VC_MAP1  = 4
  ,bit [2:0] REG_WR_REQ_VC_MAP1  = 5
  ,bit [2:0] REG_RD_RESP_VC_MAP1 = 6
  ,bit [2:0] REG_WR_RESP_VC_MAP1 = 7
  );

    b_PARAM_SRC_ID = PARAM_SRC_ID;
    b_PARAM_DEST_ID = PARAM_DEST_ID;
    b_PARAM_DEST_ID_WT = PARAM_DEST_ID_WT;
this.PARAM_SRC_ID          = PARAM_SRC_ID        ;
this.PARAM_DEST_ID         = PARAM_DEST_ID       ;
this.PARAM_DEST_ID_WT      = PARAM_DEST_ID_WT    ;
this.REG_RD_REQ_VC_MAP0    = REG_RD_REQ_VC_MAP0  ;
this.REG_WR_REQ_VC_MAP0    = REG_WR_REQ_VC_MAP0  ;
this.REG_RD_RESP_VC_MAP0   = REG_RD_RESP_VC_MAP0 ;
this.REG_WR_RESP_VC_MAP0   = REG_WR_RESP_VC_MAP0 ;
this.REG_RD_REQ_VC_MAP1    = REG_RD_REQ_VC_MAP1  ;
this.REG_WR_REQ_VC_MAP1    = REG_WR_REQ_VC_MAP1  ;
this.REG_RD_RESP_VC_MAP1   = REG_RD_RESP_VC_MAP1 ;
this.REG_WR_RESP_VC_MAP1   = REG_WR_RESP_VC_MAP1 ;
    //addr_gen_class= new();
    uid={PARAM_SRC_ID,id_cnt};
    id_cnt++;
  endfunction





  function automatic  integer get_npg_valid();
    bit [`NOC_NPS_NUM_VC-1:0] valid;
    case(this.vc_num)
    0 : valid = 8'b0000_0001;
    1 : valid = 8'b0000_0010;
    2 : valid = 8'b0000_0100;
    3 : valid = 8'b0000_1000;
    4 : valid = 8'b0001_0000;
    5 : valid = 8'b0010_0000;
    6 : valid = 8'b0100_0000;
    7 : valid = 8'b1000_0000;
    default : begin  $display("%m: not a valid vc_num %0d : ERROR",vc_num); $finish; end
    endcase
    return valid;
  endfunction

//updated it to updated data also
  function automatic void update_flit();
       bit [`NOC_NPP_WIDTH -1 :0] flit_l;
   for(int i=0;i<flit_len;i++) begin
    if(i==0)begin
      flit.delete;
      flit_l[`NOC_NPP_AXADDR]      = aaddr;
      flit_l[`NOC_NPP_AXLEN]       = alen;
      flit_l[`NOC_NPP_AXSIZE]      = asize;
      flit_l[`NOC_NPP_AXBURST]     = aburst;
      flit_l[`NOC_NPP_AXLOCK]      = alock;
      flit_l[`NOC_NPP_AXCACHE]     = acache;
      flit_l[`NOC_NPP_AXPROT]      = aprot;
      flit_l[`NOC_NPP_AXQOS]       = aqos;
      flit_l[`NOC_NPP_AXID]        = aid;
      flit_l[`NOC_NPP_AXUSER]      = auser;
      flit_l[`NOC_NPP_POISON]      = 0; //pavanas: check later
      flit_l[`NOC_NPP_RSVD]        = 0; //pavanas: check later

      flit_l[`NOC_NPP_TAG]         = tag;
      flit_l[`NOC_NPP_SRC]         = src;
    end else begin
      flit_l[`NOC_NPP_DATA]        = data[i-1];
      flit_l[`NOC_NPP_WRSTB]       = per_byte[i-1];
    end

      flit_l[`NOC_NPP_PKT_TYPE]    = tx_type;
      flit_l[`NOC_NPP_MISC_CTRL]   = misc_ctrl;
      flit_l[`NOC_NPP_DST]         = dest;
      flit_l[`NOC_NPP_DST_PAR]     = dp;
      flit_l[`NOC_NPP_PRI]         = pri;
      flit_l[`NOC_NPP_ECC]         = fprot;

      flit_l[`NOC_NPP_LAST]        = (i==flit_len-1) ? 1 : 0;

      // populating flit_q
      flit.push_back(flit_l);
   end
  endfunction

  function automatic void unpack_flit();
    bit [`NOC_NPP_WIDTH -1 :0] flit_l;
    //int flit_len = flit.size;
     flit_len = flit.size;
    //if(tx_type==NOC_NPP_PKT_TYPE_READ_RESP) begin
    if(flit_len>1) begin
       data     = new[flit[0][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_WRITE_REQ} ? flit_len-1 : flit_len];
       per_byte = new[flit[0][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_WRITE_REQ} ? flit_len-1 : flit_len];
    end

     //display("=======unpacking========");
   //for(int i=0;i<flit_len;i++) begin
   for(int i=0;i<flit.size;i++) begin
      //$display("111111111=======unpacking========");
      flit_l=flit[i];
      //print_flit_n(i);
    if(i==0 && flit[i][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_READ_REQ,`NOC_NPP_PKT_TYPE_WRITE_REQ,`NOC_NPP_PKT_TYPE_STRM_WRITE_REQ})begin
      //$display("122211111=======unpacking========");
       aaddr                  =flit[i][`NOC_NPP_AXADDR]        ;
       alen                   =flit[i][`NOC_NPP_AXLEN]         ;
       asize                  =flit[i][`NOC_NPP_AXSIZE]        ;
       aburst                 =flit[i][`NOC_NPP_AXBURST]       ;
       alock                  =flit[i][`NOC_NPP_AXLOCK]        ;
       acache                 =flit[i][`NOC_NPP_AXCACHE]       ;
       aprot                  =flit[i][`NOC_NPP_AXPROT]        ;
       aqos                   =flit[i][`NOC_NPP_AXQOS]         ;
       aid                    =flit[i][`NOC_NPP_AXID]          ;
       auser                  =flit[i][`NOC_NPP_AXUSER]        ;
       //0                      =flit_l[`NOC_NPP_POISON]        ; //pavanas: check later
       //RSVD                   =flit_l[`NOC_NPP_RSVD]          ; //pavanas: check later
                                                           
       tag                    =flit[i][`NOC_NPP_TAG]           ;
       src                    =flit[i][`NOC_NPP_SRC]           ;
    end         
    else begin
      //$display("111111111=======unpacking====== data == %0h ",flit[i][`NOC_NPP_DATA]);
    if(flit[i][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_READ_RESP,`NOC_NPP_PKT_TYPE_WRITE_RESP})begin
       tag                    =flit[i][`NOC_NPP_TAG]           ;
       src                    =flit[i][`NOC_NPP_SRC]           ;
    end 
    if(flit[i][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_READ_RESP})begin
       data[i]                =flit[i][`NOC_NPP_DATA]          ;
    end 
    else if(flit[i][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_WRITE_REQ})begin
       per_byte[i-1]            =flit[i][`NOC_NPP_WRSTB]         ;
       data[i-1]                =flit[i][`NOC_NPP_DATA]          ;
    end 
    end

       tx_type                =flit[i][`NOC_NPP_PKT_TYPE]      ;
       misc_ctrl              =flit[i][`NOC_NPP_MISC_CTRL]     ;
       dest                   =flit[i][`NOC_NPP_DST]           ;
       dp                     =flit[i][`NOC_NPP_DST_PAR]       ;
       pri                    =flit[i][`NOC_NPP_PRI]           ;
       fprot                  =flit[i][`NOC_NPP_ECC]           ;

       last                   =flit[i][`NOC_NPP_LAST]          ;
     //$display("=======unpacking=== tx_type =====",tx_type);
      // $display("====unpacking flit[%0d]",i);print();
      // populating flit_q
   end
  endfunction

  function automatic void print_flit_n(int n);
  //$display("flit.size ",flit.size);
      //$display(" flir[%0d]---->",i);
    if(n==0 && flit[n][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_READ_REQ,`NOC_NPP_PKT_TYPE_WRITE_REQ,`NOC_NPP_PKT_TYPE_STRM_WRITE_REQ})
     //if(n==0) 
     print_flit_0();
     else 
       print_flit_data(n);
  endfunction
  function automatic void print_flit();
  //$display("flit.size ",flit.size);
    //$display("=============smt uid = 'd%0d",this.uid);
    for(int i=0;i<flit.size();i++)begin
      //$display(" flir[%0d]---->",i);
     if(i==0 && flit[i][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_READ_REQ,`NOC_NPP_PKT_TYPE_WRITE_REQ,`NOC_NPP_PKT_TYPE_STRM_WRITE_REQ}) 
       print_flit_0();
     else 
       print_flit_data(i);
     end
  endfunction

  function automatic void print_flit_0();
    string str=" =========  FLIT[0]=============== \n";
    str = {str, $sformatf("AXADDR %0h,",     flit[0][`NOC_NPP_AXADDR]    ) };
    str = {str, $sformatf("AXLEN %0h,",      flit[0][`NOC_NPP_AXLEN]     ) };
    str = {str, $sformatf("AXSIZE %0h,",     flit[0][`NOC_NPP_AXSIZE]    ) };
    str = {str, $sformatf("AXBURST %0h,",    flit[0][`NOC_NPP_AXBURST]   ) };
    str = {str, $sformatf("AXLOCK %0h,",     flit[0][`NOC_NPP_AXLOCK]    ) };
    str = {str, $sformatf("AXCACHE %0h,",    flit[0][`NOC_NPP_AXCACHE]   ) };
    str = {str, $sformatf("AXPROT %0h,",     flit[0][`NOC_NPP_AXPROT]    ) };
    str = {str, $sformatf("AXQOS %0h,",      flit[0][`NOC_NPP_AXQOS]     ) };
    str = {str, $sformatf("AXID %0h,",       flit[0][`NOC_NPP_AXID]      ) };
    str = {str, $sformatf("AXUSER %0h,",     flit[0][`NOC_NPP_AXUSER]    ) };
    str = {str, $sformatf("POISON %0h,",     flit[0][`NOC_NPP_POISON]    ) };
    str = {str, $sformatf("RSVD %0h,",       flit[0][`NOC_NPP_RSVD]      ) };
    str = {str, $sformatf("TAG %0h,",        flit[0][`NOC_NPP_TAG]       ) };
    str = {str, $sformatf("SRC %0h,",        flit[0][`NOC_NPP_SRC]       ) };
    str = {str, $sformatf("TYPE %0h,",       flit[0][`NOC_NPP_PKT_TYPE]  ) };
    str = {str, $sformatf("MISC_CTRL %0h,",  flit[0][`NOC_NPP_MISC_CTRL] ) };
    str = {str, $sformatf("DST %0h,",        flit[0][`NOC_NPP_DST]       ) };
    str = {str, $sformatf("DP %0h,",         flit[0][`NOC_NPP_DST_PAR]   ) };
    str = {str, $sformatf("PRI %0h,",        flit[0][`NOC_NPP_PRI]       ) };
    str = {str, $sformatf("FPROT %0h,",      flit[0][`NOC_NPP_ECC]       ) };
    str = {str, $sformatf("LAST %0h,",       flit[0][`NOC_NPP_LAST]      ) };
    str = {str, $sformatf("vc %0d,",         vc_num                      ) };
    //str = {str," \n"};
   $display("%m: %0s",str);
  endfunction

  function automatic void print_flit_data(int i);
    string str ;//= " ========= FLIT_data[]=============== \n";
    str = {str, $sformatf("DATA[%0d] %0h,",i,     flit[i][`NOC_NPP_DATA]      ) };
    if(flit[i][`NOC_NPP_PKT_TYPE]==`NOC_NPP_PKT_TYPE_WRITE_REQ) begin
    str = {str, $sformatf("PER_BYTE[%0d] %0h,",i, flit[i][`NOC_NPP_WRSTB]     ) };
    end
    if(flit[i][`NOC_NPP_PKT_TYPE] inside {`NOC_NPP_PKT_TYPE_READ_RESP,`NOC_NPP_PKT_TYPE_WRITE_RESP}) begin
    str = {str, $sformatf("SRC %0h,",             flit[i][`NOC_NPP_SRC]     ) };
    str = {str, $sformatf("TAG %0h,",             flit[i][`NOC_NPP_TAG]     ) };
    end
    str = {str, $sformatf("TYPE %0h,",            flit[i][`NOC_NPP_PKT_TYPE]  ) };
    str = {str, $sformatf("MISC_CTRL %0h,",       flit[i][`NOC_NPP_MISC_CTRL] ) };
    str = {str, $sformatf("DST %0h,",             flit[i][`NOC_NPP_DST]       ) };
    str = {str, $sformatf("DP %0h,",              flit[i][`NOC_NPP_DST_PAR]   ) };
    str = {str, $sformatf("PRI %0h,",             flit[i][`NOC_NPP_PRI]       ) };
    str = {str, $sformatf("FPROT %0h,",           flit[i][`NOC_NPP_ECC]       ) };
    str = {str, $sformatf("LAST %0h,",            flit[i][`NOC_NPP_LAST]      ) };
   // str = {str," \n"};
   $display(str);
  endfunction

  function automatic void print();
   //if(`PRINT_CMD_PKTS ==1) begin
    $display("-----------------------------------------------------------------------------------");
    $display("-- %m");
    //$display(" %s CTRL PKT",Type.name);
    $display(" uid = 'd%0d",this.uid);
    $display(" vc_num = 'd%0d",this.vc_num);
    $display(" aaddr = 'h%0h",this.aaddr);
    $display(" alen = 'h%0h",this.alen);
    $display(" asize = 'h%0h",this.asize);
    $display(" aburst = 'h%0h",this.aburst);
    $display(" alock = 'h%0h",this.alock);
    $display(" acache = 'h%0h",this.acache);
    $display(" aprot = 'h%0h",this.aprot);
    $display(" aqos = 'h%0h",this.aqos);
    $display(" auser = 'h%0h",this.auser);
    $display(" aid = 'h%0h",this.aid);
    $display(" type = 'h%0h",this.tx_type);
    $display(" misc_ctrl = 'h%0h",this.misc_ctrl);
    $display(" tag = 'h%0h",this.tag);
    $display(" src = 'h%0h",this.src);
    $display(" dest = 'h%0h",this.dest);
    $display(" dp = 'h%0h",this.dp);
    $display(" pri = 'h%0h",this.pri);
    $display(" fprot = 'h%0h",this.fprot);
    $display(" last = 'h%0h",this.last);
    //$display(" flit = 'h%0h",this.flit);
    $display("-----------------------------------------------------------------------------------");
   //end 
  endfunction

  function int get_flit_len();
  return flit_len;
  endfunction


  function automatic bit [`NOC_AXADDR_WIDTH -1 :0] get_flit_init_addr(bit [`NOC_AXADDR_WIDTH -1 :0] aaddr);
    return int'(aaddr/`FLIT_DATA_SIZE_BYTE);
  endfunction

  function automatic bit [`FLIT_DATA_SIZE_BYTE-1:0] get_flit_init_strb(bit [`NOC_AXADDR_WIDTH -1 :0] aaddr);
    int align_init = int'(aaddr%`FLIT_DATA_SIZE_BYTE);
    bit [`FLIT_DATA_SIZE_BYTE-1:0] wstrb;
    for(int i=align_init; i<`FLIT_DATA_SIZE_BYTE;i++) wstrb[i]=1'b1;
    return wstrb;
  endfunction

 
function int compare(noc_mc_ddr4_v1_0_flit_transaction_object rhs,bit check_err=0);
int err_cnt;
bit vc_mismatch;
bit src_mismatch;
bit dest_mismatch;
bit tag_mismatch;
bit type_mismatch;
int flit_mismatch;

rhs.unpack_flit();
this.unpack_flit();

if(this.vc_num != rhs.vc_num) begin
  err_cnt++;
  vc_mismatch=1;
  if(check_err)
    $error(" vc_mismatch  this:%0h rhs:%0f",this.vc_num,rhs.vc_num);
end
if(this.dest != rhs.dest) begin
  err_cnt++;
  dest_mismatch=1;
  if(check_err)
    $error(" dest_mismatch  this:%0h rhs:%0f",this.dest,rhs.dest);
end
if(this.src != rhs.src) begin
  err_cnt++;
  src_mismatch=1;
  if(check_err)
    $error(" src_mismatch  this:%0h rhs:%0f",this.src,rhs.src);
end
if(this.tag != rhs.tag) begin
  err_cnt++;
  tag_mismatch=1;
  if(check_err)
    $error(" tag_mismatch  this:%0h rhs:%0f",this.tag,rhs.tag);
end
if(this.tx_type != rhs.tx_type) begin
  err_cnt++;
  type_mismatch=1;
  if(check_err)
    $error(" type_mismatch  this:%0h rhs:%0f",this.tx_type,rhs.tx_type);
end
foreach(this.flit[i]) begin
  if(this.flit[i] != rhs.flit[i]) begin
    err_cnt++;
    flit_mismatch++;
  if(check_err)
    $error(" flit_mismatch  this:%0h rhs:%0f",this.flit[i],rhs.flit[i]);
  end
end

if(check_err)
if(err_cnt>0) begin
  $error("%m: FOUND MISMATCHES count : %0d",err_cnt);
end
else begin
 //`PRINT(DBG_FULL,$sformatf(" FOUND_MATCH "),DBG)
  //$display("-------- THIS ------------");
  //this.print_flit();
  //$display("-------- RHS ------------");
  //rhs.print_flit();
  //$display("-------- ---- ------------");
end

return (err_cnt>0)?0:1;

endfunction

endclass : noc_mc_ddr4_v1_0_flit_transaction_object
`endif

///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
//////////////////////////////////////////////////

module noc_mc_ddr4_phy_v1_0_0_monitor#(
     parameter  bit [11:0] PARAM_SRC_ID =0
    ,parameter  bit [11:0] PARAM_DEST_ID[10] ='{10{0}} 
    ,parameter  bit [11:0] PARAM_DEST_ID_WT[10] ='{10{0}} 
    ,parameter bit[31:0] NPI_REG_DDRMC_NSU_ING   = 32'h0113_2400
    ,parameter bit[31:0] NPI_REG_DDRMC_NSU_EGR   = 32'h0013_4012
    ,parameter bit[31:0] NPI_REG_DDRMC_NSU_R_EGR = 32'h0
    ,parameter bit[31:0] NPI_REG_DDRMC_NSU_W_EGR = 32'h0
    ,parameter VERBOSITY_EN = 0
)
(
  input bit leaf_node,
  input bit src_req_port,
  //might be an int
  noc_npp_if npp_if_in,
  noc_npp_if npp_if_out,
  input rst_n
);

parameter REG_LLR_VC_VLD      = NPI_REG_DDRMC_NSU_ING[24]; 
parameter REG_ISOCR_VC_VLD    = NPI_REG_DDRMC_NSU_ING[25]; 
parameter REG_BER_VC_VLD      = NPI_REG_DDRMC_NSU_ING[26]; 
parameter REG_RD_REQ_VC_MAP0  = REG_LLR_VC_VLD ? NPI_REG_DDRMC_NSU_ING[6:4] : 'hf;
parameter REG_RD_REQ_VC_MAP1  = REG_ISOCR_VC_VLD ? NPI_REG_DDRMC_NSU_ING[10:8] :'hf ;
parameter REG_RD_REQ_VC_MAP2  = REG_BER_VC_VLD ? NPI_REG_DDRMC_NSU_ING[14:12] :'hf;
parameter REG_WR_REQ_VC_MAP0  = NPI_REG_DDRMC_NSU_ING[18:16];
parameter REG_WR_REQ_VC_MAP1  = NPI_REG_DDRMC_NSU_ING[22:20];
parameter REG_RD_RESP_VC_MAP0 = REG_LLR_VC_VLD ? NPI_REG_DDRMC_NSU_EGR[2:0]: 'hf;
parameter REG_RD_RESP_VC_MAP1 = REG_ISOCR_VC_VLD ? NPI_REG_DDRMC_NSU_EGR[6:4]:'hf ;
parameter REG_RD_RESP_VC_MAP2 = REG_BER_VC_VLD ? NPI_REG_DDRMC_NSU_EGR[10:8]:'hf ;
parameter REG_WR_RESP_VC_MAP0 = NPI_REG_DDRMC_NSU_EGR[14:12];
parameter REG_WR_RESP_VC_MAP1 = NPI_REG_DDRMC_NSU_EGR[18:16];
`define FLIT_PARAM_INIT PARAM_SRC_ID,PARAM_DEST_ID,PARAM_DEST_ID_WT,REG_RD_REQ_VC_MAP0,REG_WR_REQ_VC_MAP0,REG_RD_RESP_VC_MAP0,REG_WR_RESP_VC_MAP0,REG_RD_REQ_VC_MAP1,REG_WR_REQ_VC_MAP1,REG_RD_RESP_VC_MAP1,REG_WR_RESP_VC_MAP1
string src_comp;
//// vc mapping logic 
int vc_map_rsp[int];
int vc_map_req[int];

int rd_vc_map[int];
int wr_rsp_map[int];
int wr_req_from_rsp_map[int];


initial 
begin 
  vc_map_rsp[REG_RD_REQ_VC_MAP0]=REG_RD_RESP_VC_MAP0;
  vc_map_rsp[REG_RD_REQ_VC_MAP1]=REG_RD_RESP_VC_MAP1;
  vc_map_rsp[REG_RD_REQ_VC_MAP2]=REG_RD_RESP_VC_MAP2;
  vc_map_rsp[REG_WR_REQ_VC_MAP0]=REG_WR_RESP_VC_MAP0;
  vc_map_rsp[REG_WR_REQ_VC_MAP1]=REG_WR_RESP_VC_MAP1;
  vc_map_req[REG_RD_RESP_VC_MAP0]=REG_RD_REQ_VC_MAP0;
  vc_map_req[REG_RD_RESP_VC_MAP1]=REG_RD_REQ_VC_MAP1;
  vc_map_req[REG_RD_RESP_VC_MAP2]=REG_RD_REQ_VC_MAP2;
  vc_map_req[REG_WR_RESP_VC_MAP0]=REG_WR_REQ_VC_MAP0;
  vc_map_req[REG_WR_RESP_VC_MAP1]=REG_WR_REQ_VC_MAP1;

  rd_vc_map[REG_WR_REQ_VC_MAP0]=REG_RD_REQ_VC_MAP0;
  rd_vc_map[REG_WR_REQ_VC_MAP1]=REG_RD_REQ_VC_MAP1;
  //rd_vc_map[REG_WR_REQ_VC_MAP2]=REG_RD_REQ_VC_MAP2;

  wr_rsp_map[REG_WR_REQ_VC_MAP0]=REG_WR_RESP_VC_MAP0;
  wr_rsp_map[REG_WR_REQ_VC_MAP1]=REG_WR_RESP_VC_MAP1;

  wr_req_from_rsp_map[REG_WR_RESP_VC_MAP0]=REG_WR_REQ_VC_MAP0;
  wr_req_from_rsp_map[REG_WR_RESP_VC_MAP1]=REG_WR_REQ_VC_MAP1;

end

initial begin
  //$display ("REG_LLR_VC_VLD %0d", REG_LLR_VC_VLD);
  //$display ("REG_ISOCR_VC_VLD %0d",REG_ISOCR_VC_VLD);
  //$display ("REG_BER_VC_VLD %0d",REG_BER_VC_VLD);
  //$display ("REG_RD_REQ_VC_MAP0 %0d",REG_RD_REQ_VC_MAP0);
  //$display ("REG_RD_REQ_VC_MAP1 %0d",REG_RD_REQ_VC_MAP1);
  //$display ("REG_RD_REQ_VC_MAP2 %0d",REG_RD_REQ_VC_MAP2);
  //$display ("REG_WR_REQ_VC_MAP0 %0d",REG_WR_REQ_VC_MAP0);
  //$display ("REG_WR_REQ_VC_MAP1 %0d",REG_WR_REQ_VC_MAP1);
  if(REG_LLR_VC_VLD && REG_ISOCR_VC_VLD) begin
    assert(REG_RD_REQ_VC_MAP0 != REG_RD_REQ_VC_MAP1) else $error("LLR %d vc is same as ISOCR %d vc",REG_RD_REQ_VC_MAP0,REG_RD_REQ_VC_MAP1);
  end
  if(REG_BER_VC_VLD && REG_ISOCR_VC_VLD) begin
    assert(REG_RD_REQ_VC_MAP2 != REG_RD_REQ_VC_MAP1) else $error("BER %d vc is same as ISOCR %d vc",REG_RD_REQ_VC_MAP2,REG_RD_REQ_VC_MAP1);
  end
   if(REG_BER_VC_VLD && REG_LLR_VC_VLD) begin
    assert(REG_RD_REQ_VC_MAP0 != REG_RD_REQ_VC_MAP2) else $error("LLR %d vc is same as BER %d vc",REG_RD_REQ_VC_MAP0,REG_RD_REQ_VC_MAP2);
  end
  if(REG_LLR_VC_VLD) begin
    assert(REG_RD_REQ_VC_MAP0 != REG_WR_REQ_VC_MAP0) else $error("LLR %d vc is same as ISOCW %d vc",REG_RD_REQ_VC_MAP0,REG_WR_REQ_VC_MAP0);
    assert(REG_RD_REQ_VC_MAP0 != REG_WR_REQ_VC_MAP1) else $error("LLR %d vc is same as BEW %d vc",REG_RD_REQ_VC_MAP0,REG_WR_REQ_VC_MAP1);
  end
  if(REG_ISOCR_VC_VLD) begin
    assert(REG_RD_REQ_VC_MAP1 != REG_WR_REQ_VC_MAP0) else $error("ISOCR %d vc is same as ISOCW %d vc",REG_RD_REQ_VC_MAP1,REG_WR_REQ_VC_MAP0);
    assert(REG_RD_REQ_VC_MAP1 != REG_WR_REQ_VC_MAP1) else $error("ISOCR %d vc is same as BEW %d vc",REG_RD_REQ_VC_MAP1,REG_WR_REQ_VC_MAP1);
  end
  if(REG_BER_VC_VLD) begin
    assert(REG_RD_REQ_VC_MAP2 != REG_WR_REQ_VC_MAP0) else $error("BER %d vc is same as ISOCW %d vc",REG_RD_REQ_VC_MAP2,REG_WR_REQ_VC_MAP0);
    assert(REG_RD_REQ_VC_MAP2 != REG_WR_REQ_VC_MAP1) else $error("BER %d vc is same as BEW %d vc",REG_RD_REQ_VC_MAP2,REG_WR_REQ_VC_MAP1);
  end
  assert(REG_WR_REQ_VC_MAP0 != REG_WR_REQ_VC_MAP1) else $error("BEW %d vc is same as ISOCW %d vc",REG_WR_REQ_VC_MAP0,REG_WR_REQ_VC_MAP1);
end
//bit transactions_done=0;
  int data_match, data_mismatch;
  int mismatch_vc;
  int mismatch_src;
  int mismatch_dst;
  int mismatch_pri;
  int mismatch_tag;

mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) mb_req_to_sb;
mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) mb_rsp_to_sb;
`define NUM_OF_VC 8
int vc_num;
integer rd_flit_count[`NUM_OF_VC] ={0,0,0,0,0,0,0,0};
bit wreq_first_flit[`NUM_OF_VC]={0,0,0,0,0,0,0,0};
bit wreq_last_flit[`NUM_OF_VC]={1,1,1,1,1,1,1,1};
bit rreq_first_flit[`NUM_OF_VC]={0,0,0,0,0,0,0,0};
bit rreq_last_flit[`NUM_OF_VC]={1,1,1,1,1,1,1,1};
bit wrsp_first_flit[`NUM_OF_VC]={0,0,0,0,0,0,0,0};
bit wrsp_last_flit[`NUM_OF_VC]={1,1,1,1,1,1,1,1};
bit rrsp_first_flit[`NUM_OF_VC]={0,0,0,0,0,0,0,0};
bit rrsp_last_flit[`NUM_OF_VC]={1,1,1,1,1,1,1,1};

int flit_to_capture_count[`NUM_OF_VC][int][$] ;

noc_mc_ddr4_v1_0_flit_transaction_object wr_rsp[`NUM_OF_VC][int];
noc_mc_ddr4_v1_0_flit_transaction_object wr_req[`NUM_OF_VC];
noc_mc_ddr4_v1_0_flit_transaction_object rd_req[`NUM_OF_VC];
noc_mc_ddr4_v1_0_flit_transaction_object rd_rsp[`NUM_OF_VC][int];//[vc_num][src,dest,tag] @cmd-req-port
`define FLIT_DST {flit[`NOC_NPP_DST],flit[`NOC_NPP_SRC],flit[`NOC_NPP_TAG]}
`define FLIT_SDT {flit[`NOC_NPP_SRC],flit[`NOC_NPP_DST],flit[`NOC_NPP_TAG]}
int flit_dst_out; 


//for write cmd-rsp flow
noc_mc_ddr4_v1_0_flit_transaction_object wr_req_q[int][$];//[vc_num][$]
noc_mc_ddr4_v1_0_flit_transaction_object wr_rsp_q[int][$];
//for read cmd-rsp flow
noc_mc_ddr4_v1_0_flit_transaction_object rd_req_q[int][int][$];//[vc_num][tag_id][$]
noc_mc_ddr4_v1_0_flit_transaction_object rd_rsp_q[int][int][$];

bit written_at[longint];//to check if write has reached before read

int wr_req_cnt[`NUM_OF_VC];
int wr_rsp_cnt[`NUM_OF_VC];
int rd_req_cnt[`NUM_OF_VC];
int rd_rsp_cnt[`NUM_OF_VC];

time wr_req_time_1;
time wr_req_time_2;
real wr_req_interval= 0;
real wr_req_bw = 0;
real wr_req_byte = 0;
bit first_req_wr = 0;
time wr_rsp_time_1;
time wr_rsp_time_2;
real wr_rsp_interval= 0;
real wr_rsp_bw = 0;
real wr_rsp_byte = 0;
bit first_rsp_wr = 0;
time rd_req_time_1;
time rd_req_time_2;
real rd_req_interval= 0;
real rd_req_bw = 0;
real rd_req_byte = 0;
bit first_req_rd = 0;
time rd_rsp_time_1;
time rd_rsp_time_2;
real rd_rsp_interval= 0;
real rd_rsp_bw = 0;
real rd_rsp_byte = 0;
bit first_rsp_rd = 0;
event  got_wr_rsp;
event  got_rd_rsp;

  initial begin
  bit [`NOC_NPP_WIDTH-1:0] flit;
  int rdata_cnt[`NUM_OF_VC][int];
  bit [7:0] tag;
    forever begin
    @(posedge npp_if_in.clk);  
          flit = npp_if_in.noc_flit;
    if(npp_if_in.noc_valid!=0)begin
       vc_num=get_vc_num(npp_if_in.noc_valid);
       `PRINT_MODEL(VERBOSITY_EN,$sformatf(" received flit.resp on vc_num = %0d",vc_num),DBG);
       `PRINT_MODEL(VERBOSITY_EN,$sformatf("%0t recvd pkt_type=%h ",$time,npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE]),DBG)
       flit_dst_out = {npp_if_in.noc_flit[`NOC_NPP_DST],npp_if_in.noc_flit[`NOC_NPP_SRC],npp_if_in.noc_flit[`NOC_NPP_TAG]};
       if(npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE] == `NOC_NPP_PKT_TYPE_WRITE_RESP) begin
         if(!(vc_num inside {REG_WR_RESP_VC_MAP0,REG_WR_RESP_VC_MAP1})) begin
           `PRINT_MODEL(1,$sformatf("wrong vc mapping %0d for type %0h :expecting %0d,%0d",vc_num,npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE],REG_WR_RESP_VC_MAP0,REG_WR_RESP_VC_MAP1),DBG);
           $fatal;
         end
         wrsp_last_flit[vc_num] = npp_if_in.noc_flit[`NOC_NPP_LAST];
         if(wrsp_last_flit[vc_num] != 1) begin
           $error("lflit is not set 1 for wr_rsp");
         end
         if(
         (!wr_rsp[vc_num].exists(`FLIT_DST) )
         ||
         (wr_rsp[vc_num].exists(`FLIT_DST) &&  wr_rsp[vc_num][`FLIT_DST] == null)
         ) begin
           wr_rsp[vc_num][`FLIT_DST] = new(`FLIT_PARAM_INIT);
           wr_rsp[vc_num][`FLIT_DST].data_start_time=$time;
           wr_rsp[vc_num][`FLIT_DST].src_comp=src_comp;
           wrsp_first_flit[vc_num]=1;
          end
          wr_rsp[vc_num][`FLIT_DST].flit.push_back(npp_if_in.noc_flit);

          wr_rsp[vc_num][`FLIT_DST].vc_num=vc_num;
          if(wr_rsp[vc_num][`FLIT_DST]==null) begin `PRINT_MODEL(1,$sformatf("%m : wr_rsp is null  : vc %0h",vc_num),DBG); $fatal; end
          wr_rsp_q[vc_num].push_back(wr_rsp[vc_num][`FLIT_DST]);
          wr_rsp[vc_num][`FLIT_DST].vc_num=vc_num;
          -> got_wr_rsp;
          `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m : putting wr_rsp vc_num %0d : wr_rsp_cnt %0d",vc_num,wr_rsp_cnt[vc_num]),DBG);
          wr_rsp_cnt[vc_num]++;
          wrsp_first_flit[vc_num]=0;
          wrsp_last_flit[vc_num]=0;
            if(first_rsp_wr == 0) begin
              wr_rsp_time_1 = $time;
              first_rsp_wr = 1;
            end
            else begin
              wr_rsp_time_2 = $time;
            end
            wr_rsp_byte = wr_rsp_byte + (16* (wr_req_q[vc_map_req[vc_num]][0].flit[0][`NOC_NPP_AXLEN]+1));
            $display(" rsp_time 1 = %t rsp_time 2 = %t , total_bytes_rsp= %d", wr_rsp_time_1,wr_rsp_time_2,wr_rsp_byte);
        end
       //end
       else if(npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE] == `NOC_NPP_PKT_TYPE_READ_RESP)begin
         if(!(vc_num inside {REG_RD_RESP_VC_MAP0,REG_RD_RESP_VC_MAP1,REG_RD_RESP_VC_MAP2})) begin
           `PRINT_MODEL(1,$sformatf("wrong vc mapping %0d for type %0h :expecting %0d,%0d,%0d",vc_num,npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE],REG_RD_RESP_VC_MAP0,REG_RD_RESP_VC_MAP1,REG_RD_RESP_VC_MAP2),DBG);
           $fatal;
         end
         rrsp_last_flit[vc_num] = npp_if_in.noc_flit[`NOC_NPP_LAST];
         if(
         (!rd_rsp[vc_num].exists(`FLIT_DST) )
         ||
         (rd_rsp[vc_num].exists(`FLIT_DST) &&  rd_rsp[vc_num][`FLIT_DST] == null)
         ) begin
	    rdata_cnt[vc_num][`FLIT_DST]=0;
           rd_rsp[vc_num][`FLIT_DST] = new(`FLIT_PARAM_INIT);
         end
	   tag = npp_if_in.noc_flit[`NOC_NPP_TAG];
         rd_rsp[vc_num][`FLIT_DST].src_comp=src_comp;
         rrsp_first_flit[vc_num]=1;
         rd_rsp[vc_num][`FLIT_DST].vc_num=vc_num;
         `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m : %0t :npp_if_in.noc_valid %h : vc %d : Data %0h ",$time,npp_if_in.noc_valid,vc_num,npp_if_in.noc_flit[`NOC_NPP_DATA]),DBG);
         if(rd_rsp[vc_num][`FLIT_DST]==null) begin `PRINT_MODEL(1,$sformatf("%m : rd_rsp is null : vc %h",vc_num),DBG); $fatal; end
         rd_rsp[vc_num][`FLIT_DST].flit.push_back(npp_if_in.noc_flit);
         rd_flit_count[vc_num] ++;
         `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m, Time = %0t MC_NPP_READ_DATA :: Address = %16h, ID = %0h, Size = %0h, Burst = %0h, Length = %0h, DATA[%0d] = %128h, WLAST= %0b, VC_NUM = %0d, FLIT = %0h, SRC_ID = %0h, DST_ID = %0h, PORT = Port%0s_resp_out",$time, rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_AXADDR], rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_AXID], rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_AXSIZE], rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_AXBURST], rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_AXLEN], rdata_cnt[vc_num][`FLIT_DST], npp_if_in.noc_flit[`NOC_NPP_DATA], 0, vc_num, npp_if_in.noc_flit, rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_SRC], rd_req_q[vc_map_req[vc_num]][tag][0].flit[0][`NOC_NPP_DST], src_comp[3]),DBG); //Gopal...
	 rdata_cnt[vc_num][`FLIT_DST]++;
         if(npp_if_in.noc_flit[`NOC_NPP_LAST]==1) begin rd_flit_count[vc_num] =0; end
        `PRINT_MODEL(VERBOSITY_EN,$sformatf(" dest %0f : src %0h: tag %0h",flit[`NOC_NPP_DST],flit[`NOC_NPP_SRC],flit[`NOC_NPP_TAG]),DBG);
        flit_to_capture_count[vc_num][`FLIT_DST][0] = flit_to_capture_count[vc_num][`FLIT_DST][0] - 1 ;
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("RD:left :flit_to_capture_count[%0d][%0h][0] = %0d",vc_num,{flit[`NOC_NPP_DST],flit[`NOC_NPP_SRC],flit[`NOC_NPP_TAG]},flit_to_capture_count[vc_num][{flit[`NOC_NPP_DST],flit[`NOC_NPP_SRC],flit[`NOC_NPP_TAG]}][0]),DBG)
        if(first_rsp_rd == 0) begin
              rd_rsp_time_1 = $time;
              first_rsp_rd = 1;
            end
            else begin
              rd_rsp_time_2 = $time;
            end
            rd_rsp_byte = rd_rsp_byte + 16;
            $display(" rd_rsp_time 1 = %t rsp_time 2 = %t , total_bytes_rsp= %d", rd_rsp_time_1,rd_rsp_time_2,rd_rsp_byte);
        if(flit_to_capture_count[vc_num][{flit[`NOC_NPP_DST],flit[`NOC_NPP_SRC],flit[`NOC_NPP_TAG]}][0]==0) begin
            //rd_rsp_q.push_back(rd_rsp[vc_num][`FLIT_DST]);
            rd_rsp[vc_num][`FLIT_DST].data_end_time = $time;
            rd_rsp[vc_num][`FLIT_DST].unpack_flit();

            rd_rsp_q[vc_num][flit[`NOC_NPP_TAG]].push_back(rd_rsp[vc_num][`FLIT_DST]);


            //`PRINT(NOC_MON_PRINT,$sformatf("=======SMT======== LAST : %0t : %0h ",$time,npp_if_in.noc_flit[`NOC_NPP_DATA]),DBG);
            //rd_rsp.print_flit();
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: putting rd_rsp vc_num %0d : rd_rsp_cnt %0d  ",vc_num,rd_rsp_cnt[vc_num]),DBG);
            -> got_rd_rsp;
            //cleaning rsp obj
            void'(flit_to_capture_count[vc_num][`FLIT_DST].pop_front());
            rd_rsp[vc_num][`FLIT_DST] = null;

            rd_rsp_cnt[vc_num]++;
            rrsp_first_flit[vc_num]=0;
            rrsp_last_flit[vc_num]=0;

                      end
        end
        else begin
          `PRINT_MODEL(1,$sformatf("ERROR::: MONITOR::: at time %t ::: invalid response type %0h, vc %0d,  flit ='h%43h",$time,npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE],vc_num,npp_if_in.noc_flit),NONE) $finish;
        end 
 //      `PRINT(NOC_MON_PRINT,$sformatf("time=%0t, resp  credit_return_queue[%0d].push_back(%8b)",$time,noc_npp_in.noc_valid),DBG)
      end  
    end
  end  



 initial begin
   bit [`NOC_NPP_WIDTH-1:0] flit;
   int wdata_cnt[`NUM_OF_VC];
   forever begin
   @(posedge npp_if_out.clk); #0; 
         flit = npp_if_out.noc_flit;
     if(npp_if_out.noc_valid!=0)begin
       vc_num=get_vc_num(npp_if_out.noc_valid);
       `PRINT_MODEL(VERBOSITY_EN,$sformatf(" received flit.req on vc_num = %0d",vc_num),DBG);
       `PRINT_MODEL(VERBOSITY_EN,$sformatf("%0t recvd pkt_type=%h ",$time,npp_if_in.noc_flit[`NOC_NPP_PKT_TYPE]),DBG)
       flit_dst_out = {npp_if_out.noc_flit[`NOC_NPP_DST],npp_if_out.noc_flit[`NOC_NPP_SRC],npp_if_out.noc_flit[`NOC_NPP_TAG]};
       if(npp_if_out.noc_flit[`NOC_NPP_PKT_TYPE] == `NOC_NPP_PKT_TYPE_READ_REQ)begin
         if(!(vc_num inside {REG_RD_REQ_VC_MAP0,REG_RD_REQ_VC_MAP1,REG_RD_REQ_VC_MAP2})) begin
           `PRINT_MODEL(1,$sformatf("wrong vc mapping %0d for type %0h :expecting %0d,%0d,%0d",vc_num,npp_if_out.noc_flit[`NOC_NPP_PKT_TYPE],REG_RD_REQ_VC_MAP0,REG_RD_REQ_VC_MAP1,REG_RD_REQ_VC_MAP2),DBG);
           $fatal;
         end
       rreq_last_flit[vc_num] = npp_if_out.noc_flit[`NOC_NPP_LAST];
         if(rreq_first_flit[vc_num]==0) begin
         rd_req[vc_num] = new(`FLIT_PARAM_INIT);
         rd_req[vc_num].src_comp=src_comp;
         rreq_first_flit[vc_num]=1;
         `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m, Time = %0t MC_NPP_READ_REQ :: Address = %16h, ID = %0h, Size = %0h, Burst = %0h, Length = %0h, VC_NUM = %0d, FLIT = %0h, SRC_ID = %0h, DST_ID = %0h, PORT = Port%0s_req_in",$time, npp_if_out.noc_flit[`NOC_NPP_AXADDR], npp_if_out.noc_flit[`NOC_NPP_AXID], npp_if_out.noc_flit[`NOC_NPP_AXSIZE], npp_if_out.noc_flit[`NOC_NPP_AXBURST], npp_if_out.noc_flit[`NOC_NPP_AXLEN], vc_num, npp_if_out.noc_flit, npp_if_out.noc_flit[`NOC_NPP_SRC], npp_if_out.noc_flit[`NOC_NPP_DST], src_comp[3]),DBG);  //Gopal...	
         end
         rd_req[vc_num].vc_num=vc_num;
         `PRINT_MODEL(VERBOSITY_EN,$sformatf("%0t :npp_if_out.noc_valid %h : vc %0d :Data %0h ",$time,npp_if_out.noc_valid,vc_num,npp_if_out.noc_flit[`NOC_NPP_DATA]),DBG);
         //rd_req[vc_num].print_flit();
         if(rd_req[vc_num]==null) begin `PRINT_MODEL(1,$sformatf("%m : rd_req is null : vc %h",vc_num),DBG); $fatal; end
         rd_req[vc_num].flit.push_back(npp_if_out.noc_flit);
         rd_flit_count[vc_num] ++;
         if(npp_if_out.noc_flit[`NOC_NPP_LAST]==1) begin rd_flit_count[vc_num] =0; end
         if(rreq_first_flit[vc_num] && rreq_last_flit[vc_num]) begin
            rd_req[vc_num].data_end_time = $time;
            rd_req[vc_num].unpack_flit();
            rd_req_q[vc_num][rd_req[vc_num].tag].push_back(rd_req[vc_num]);
            flit_dst_out = {rd_req[vc_num].src,rd_req[vc_num].dest,rd_req[vc_num].tag};
            flit_to_capture_count[vc_map_rsp[rd_req[vc_num].vc_num]][{rd_req[vc_num].src,rd_req[vc_num].dest,rd_req[vc_num].tag}].push_back((rd_req[vc_num].alen+1)*(2**rd_req[vc_num].asize)/(`NOC_NPP_DATA_WIDTH/8));
        //req.print_flit();
          `PRINT_MODEL(VERBOSITY_EN,$sformatf("setting flit_to_capture_count[%0d][%0h][%0d] = %0d",vc_map_rsp[rd_req[vc_num].vc_num],{rd_req[vc_num].src,rd_req[vc_num].dest,rd_req[vc_num].tag},flit_to_capture_count[vc_map_rsp[rd_req[vc_num].vc_num]][{rd_req[vc_num].src,rd_req[vc_num].dest,rd_req[vc_num].tag}].size-1,flit_to_capture_count[vc_map_rsp[rd_req[vc_num].vc_num]][{rd_req[vc_num].src,rd_req[vc_num].dest,rd_req[vc_num].tag}][flit_to_capture_count[vc_map_rsp[rd_req[vc_num].vc_num]][{rd_req[vc_num].src,rd_req[vc_num].dest,rd_req[vc_num].tag}].size-1]),DBG)

            if(written_at.exists(rd_req[vc_num].aaddr)) begin // && !written_at[rd_req[vc_num].aaddr]) begin
              `PRINT_MODEL(VERBOSITY_EN,$sformatf(" read issued on un-written address : %0h",rd_req[vc_num].aaddr),DBG);
            end
            if(rd_req[vc_num].aaddr > 41'h1ff_ffff_ffff) begin
               //`PRINT_MODEL(1,$sformatf("%m : address is out of range %0h",rd_req[vc_num].aaddr),DBG);
               //$fatal;
            end
            //if(src_req_port) begin
            mb_req_to_sb.put(rd_req[vc_num]);
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: putting rd_req in mb_req_to_sb "),DBG);
            //`PRINT(NOC_MON_PRINT,$sformatf("=======SMT======== LAST : %0t : %0h ",$time,npp_if_out.noc_flit[`NOC_NPP_DATA]),DBG);
            //rd_req.print_flit();
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: putting rd_req vc_num %0d : rd_req_cnt %0d ",vc_num,rd_req_cnt[vc_num]),DBG);
            rd_req_cnt[vc_num]++;
            rreq_first_flit[vc_num]=0;
            rreq_last_flit[vc_num]=0;
            if(first_req_rd == 0) begin
              rd_req_time_1 = $time;
              first_req_rd = 1;
            end
            else begin
              rd_req_time_2 = $time;
            end
            rd_req_byte = rd_req_byte + (16* (rd_req[vc_num].alen+1));
            $display("rd_req time 1 = %t time 2 = %t , total_bytes= %d", rd_req_time_1,rd_req_time_2,rd_req_byte);

          end
        end 
       else if(npp_if_out.noc_flit[`NOC_NPP_PKT_TYPE] == `NOC_NPP_PKT_TYPE_WRITE_REQ)begin
         if(!(vc_num inside {REG_WR_REQ_VC_MAP0,REG_WR_REQ_VC_MAP1})) begin
           `PRINT_MODEL(1,$sformatf("wrong vc mapping %0d for type %0h :expecting %0d,%0d",vc_num,npp_if_out.noc_flit[`NOC_NPP_PKT_TYPE],REG_WR_REQ_VC_MAP0,REG_WR_REQ_VC_MAP1),DBG);
           $fatal;
         end
         if(first_req_wr == 0) begin
              wr_req_time_1 = $time;
              first_req_wr = 1;
            end
            else begin
              wr_req_time_2 = $time;
            end
            wr_req_byte = wr_req_byte + (16);
            $display(" time 1 = %t time 2 = %t , total_bytes= %d", wr_req_time_1,wr_req_time_2,wr_req_byte);
       wreq_last_flit[vc_num] = npp_if_out.noc_flit[`NOC_NPP_LAST];
         if(wreq_first_flit[vc_num]==0) begin
         wr_req[vc_num] = new(`FLIT_PARAM_INIT);
         wr_req[vc_num].src_comp=src_comp;
         wreq_first_flit[vc_num]=1;
          `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m, Time = %0t MC_NPP_WRITE_REQ :: Address = %16h, ID = %0h, Size = %0h, Burst = %0h, Length = %0h, VC_NUM = %0d, FLIT = %0h, SRC_ID = %0h, DST_ID = %0h, PORT = Port%0s_req_in",$time, npp_if_out.noc_flit[`NOC_NPP_AXADDR], npp_if_out.noc_flit[`NOC_NPP_AXID], npp_if_out.noc_flit[`NOC_NPP_AXSIZE], npp_if_out.noc_flit[`NOC_NPP_AXBURST], npp_if_out.noc_flit[`NOC_NPP_AXLEN], vc_num,  npp_if_out.noc_flit, npp_if_out.noc_flit[`NOC_NPP_SRC], npp_if_out.noc_flit[`NOC_NPP_DST], src_comp[3]),DBG);  //Gopal...
	    wdata_cnt[vc_num] = 0;
         end
         wr_req[vc_num].vc_num=vc_num;
         `PRINT_MODEL(VERBOSITY_EN,$sformatf("%0t :npp_if_out.noc_valid %h : vc %0d : Data %0h ",$time,npp_if_out.noc_valid,vc_num,npp_if_out.noc_flit[`NOC_NPP_DATA]),DBG);
         //wr_req[vc_num].print_flit();
            
         if(wr_req[vc_num]==null) begin `PRINT_MODEL(1,$sformatf("%m : wr_req is null : vc %h",vc_num),DBG); $fatal; end
         wr_req[vc_num].flit.push_back(npp_if_out.noc_flit);
          if(wreq_first_flit[vc_num] && !wreq_last_flit[vc_num] && wdata_cnt[vc_num] != 0) 
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m, Time = %0t MC_NPP_WRITE_DATA :: Address = %16h, ID = %0h, Size = %0h, Burst = %0h, Length = %0h, DATA[%0d] = %128h, WLAST= %0b, VC_NUM = %0d, FLIT = %0h, SRC_ID = %0h, DST_ID = %0h, PORT = Port%0s_req_in",$time, wr_req[vc_num].flit[0][`NOC_NPP_AXADDR], wr_req[vc_num].flit[0][`NOC_NPP_AXID], wr_req[vc_num].flit[0][`NOC_NPP_AXSIZE], wr_req[vc_num].flit[0][`NOC_NPP_AXBURST], wr_req[vc_num].flit[0][`NOC_NPP_AXLEN], wdata_cnt[vc_num]-1, npp_if_out.noc_flit[`NOC_NPP_DATA], 0, vc_num,  npp_if_out.noc_flit, wr_req[vc_num].flit[0][`NOC_NPP_SRC], wr_req[vc_num].flit[0][`NOC_NPP_DST], src_comp[3]),DBG); //Gopal...
         // `ifndef PROFILING command_queue_local.compare_with_queue(rx_pkt_local[vc_num].rd_resp_pkt_local.resp_pkt_local[rd_flit_count[vc_num]]); `endif
         if(wreq_first_flit[vc_num] && wreq_last_flit[vc_num]) begin
            wr_req_q[vc_num].push_back(wr_req[vc_num]);
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m, Time = %0t MC_NPP_WRITE_DATA :: Address = %16h, ID = %0h, Size = %0h, Burst = %0h, Length = %0h, DATA[%0d] = %128h, WLAST= %0b, VC_NUM = %0d, FLIT = %0h, SRC_ID = %0h, DST_ID = %0h, PORT = Port%0s_req_in",$time, wr_req[vc_num].flit[0][`NOC_NPP_AXADDR], wr_req[vc_num].flit[0][`NOC_NPP_AXID], wr_req[vc_num].flit[0][`NOC_NPP_AXSIZE], wr_req[vc_num].flit[0][`NOC_NPP_AXBURST], wr_req[vc_num].flit[0][`NOC_NPP_AXLEN], wdata_cnt[vc_num]-1, npp_if_out.noc_flit[`NOC_NPP_DATA], 1, vc_num,  npp_if_out.noc_flit, wr_req[vc_num].flit[0][`NOC_NPP_SRC], wr_req[vc_num].flit[0][`NOC_NPP_DST], src_comp[3]),DBG); //Gopal...
            //rd_txn_q.push_back(wr_req[vc_num]);//might wait for okay read wr_req
            wr_req[vc_num].data_end_time = $time;
            wr_req[vc_num].unpack_flit();
            if(wr_req[vc_num].aaddr > 41'h1ff_ffff_ffff) begin
               //`PRINT_MODEL(1,$sformatf("%m :write request address is out of range %0h",wr_req[vc_num].aaddr),DBG);
               //$fatal;
            end

            written_at[wr_req[vc_num].aaddr] = 1;
            //if(src_req_port) begin
            mb_req_to_sb.put(wr_req[vc_num]);
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: putting wr_req in mb_req_to_sb "),DBG);

            //`PRINT(NOC_MON_PRINT,$sformatf("=======SMT======== LAST : %0t : %0h ",$time,npp_if_out.noc_flit[`NOC_NPP_DATA]),DBG);
            //wr_req.print_flit();
            `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: putting wr_req vc_num %0d : wr_req_cnt %0d ",vc_num,wr_req_cnt[vc_num]),DBG);
            wr_req_cnt[vc_num]++;
            wreq_first_flit[vc_num]=0;
            wreq_last_flit[vc_num]=0;
          end
	    wdata_cnt[vc_num]++;
        end 
        else begin
          `PRINT_MODEL(1,$sformatf("ERROR::: MONITOR::: at time %t ::: invalid response type %0h, vc %0d,  flit ='h%43h",$time,npp_if_out.noc_flit[`NOC_NPP_PKT_TYPE],vc_num,npp_if_out.noc_flit),NONE) $finish;
        end 
      end  
    end
  end  


function void connect_all_mb(mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) req,mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) rsp);
mb_req_to_sb = req;
mb_rsp_to_sb = rsp;
endfunction

function void connect_req_mb(mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) req);
mb_req_to_sb = req;
endfunction

function void connect_rsp_mb(mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) rsp);
mb_rsp_to_sb = rsp;
endfunction

function integer get_vc_num(input [`NUM_OF_VC -1:0] flit_in_valid);
  case(flit_in_valid)
    8'b0000_0001:   return 0;
    8'b0000_0010:   return 1;
    8'b0000_0100:   return 2;
    8'b0000_1000:   return 3;
    8'b0001_0000:   return 4;
    8'b0010_0000:   return 5;
    8'b0100_0000:   return 6;
    8'b1000_0000:   return 7;
    default : begin  $error("get_vc_num: ERROR111"); $finish; end
  endcase
endfunction

 always@(got_wr_rsp)begin
 //task write_rsp_checker();
 int rsp_vc;
 noc_mc_ddr4_v1_0_flit_transaction_object wr_rsp,wr_cmd;
 foreach(wr_rsp_q[i])
   while(wr_rsp_q[i].size>0) begin
    wr_rsp =  wr_rsp_q[i].pop_front();
    rsp_vc = vc_map_req[i];
    wr_cmd = wr_req_q[rsp_vc].pop_front();
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m, Time = %0t MC_NPP_WRITE_RESP :: Address = %16h, ID = %0h, Size = %0h, Burst = %0h, Length = %0h, WRESP = %0h, VC_NUM = %0d, FLIT = %0h, SRC_ID = %0h, DST_ID = %0h, PORT = Port%0s_resp_out",$time, wr_cmd.flit[0][`NOC_NPP_AXADDR], wr_cmd.flit[0][`NOC_NPP_AXID], wr_cmd.flit[0][`NOC_NPP_AXSIZE], wr_cmd.flit[0][`NOC_NPP_AXBURST], wr_cmd.flit[0][`NOC_NPP_AXLEN], wr_rsp.tx_type, i, wr_rsp.flit[0], wr_rsp.flit[0][`NOC_NPP_SRC], wr_rsp.flit[0][`NOC_NPP_DST], src_comp[3]),DBG); //Gopal...
    //$display("%m: vc_map_req[%0d] = %0d wr_req_q[vc_map_req[i]].size = %0d rsp_vc=%0d",i,vc_map_req[i],wr_req_q[rsp_vc].size,rsp_vc);

    if(wr_rsp!=null && wr_cmd==null) begin
      $display("%m: wr_cmd is null : found extra response wr_rsp_q[%0d].size : %0d",i,wr_rsp_q[i].size); 
      //wr_rsp.print_flit();
      $fatal;
    end
    else if(wr_rsp==null && wr_cmd!=null) begin
      $display("%m: wr_rsp is null : found extra cmd"); 
      $fatal;
    end
    if(wr_rsp==null) begin $display(" wr_rsp is null "); $fatal; end
    if(wr_cmd==null) begin $display(" wr_cmd is null "); $fatal; end
    //mb_req_to_sb.put(wr_cmd);
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("%m: putting wr_rsp in mb_rsp_to_sb "),DBG);

    check_cmd_rsp(wr_cmd,wr_rsp);
    mb_rsp_to_sb.put(wr_cmd);
  end
end
 
always @(got_rd_rsp) begin
noc_mc_ddr4_v1_0_flit_transaction_object rd_rsp,rd_cmd;
int pop_cnt;
foreach(rd_rsp_q[i,j])
  while(rd_rsp_q[i][j].size>0) begin
    rd_rsp =  rd_rsp_q[i][j].pop_front();
    pop_cnt++;
    rd_cmd =  rd_req_q[vc_map_req[i]][j].pop_front();
    if(rd_rsp!=null && rd_cmd==null) begin
      //$display("%m: rd_cmd is null : found extra response rd_rsp_q[%0d][%0h].size : %0d",i,j,rd_rsp_q[i][j].size); 
      $fatal;
    end
    else if(rd_rsp==null && rd_cmd!=null) begin
      $display("%m: rd_rsp is null : found extra cmd"); 
      $fatal;
    end
    if(rd_rsp==null) begin $display(" rd_rsp is null "); $fatal; end
    if(rd_cmd==null) begin $display(" rd_cmd is null "); $fatal; end
    if( rd_rsp.flit.size == rd_cmd.alen+1) begin
      `PRINT_MODEL(VERBOSITY_EN,$sformatf("NPG:::STORAGE_MEM::: got correct bytes : req alen+1 %0d : rsp flit-len %0d",(rd_cmd.alen+1),rd_rsp.flit.size),DBG)   
    end  
    else begin
      $error ("%m: NPG : MISMATCH : req alen+1 %0d : rsp flit-len %0d ",(rd_cmd.alen+1),rd_rsp.flit.size);
      rd_cmd.print_flit();
      rd_rsp.print_flit();
    end
    check_cmd_rsp(rd_cmd,rd_rsp);
    rd_rsp.aaddr = rd_cmd.aaddr;
    rd_rsp.aburst = rd_cmd.aburst;
    mb_rsp_to_sb.put(rd_rsp);

  end
end
  //function automatic void compare_with_queue ( resp_pkt resp_pkt_local);
  function automatic void check_cmd_rsp (noc_mc_ddr4_v1_0_flit_transaction_object cmd_pkt,noc_mc_ddr4_v1_0_flit_transaction_object resp_pkt_local);
    bit tag_matched =0;
    int match_at=0;
    resp_pkt_local.unpack_flit();//unpacking of a flit into different fields
    //resp_pkt_local.print_flit();
    //resp_pkt_local.print();
    if(resp_pkt_local.tx_type == `NOC_NPP_PKT_TYPE_WRITE_RESP && cmd_pkt.tx_type ==`NOC_NPP_PKT_TYPE_WRITE_REQ) begin
      //if(resp_pkt_local.tag!=0) begin
      // $fatal(0,"write reponse tag!=0");
      //end
      //if(cmd_pkt.tag!=0) begin
      //  $fatal(0,"write cmd tag!=0");
     // end
    end
    if(resp_pkt_local.tag == cmd_pkt.tag) begin
      tag_matched =1;
            //ctrl_pkt_tag_matched.push_back(cmd_pkt);
      if(((resp_pkt_local.tx_type == `NOC_NPP_PKT_TYPE_WRITE_RESP) && (cmd_pkt.tx_type ==`NOC_NPP_PKT_TYPE_WRITE_REQ)) || ((resp_pkt_local.tx_type == `NOC_NPP_PKT_TYPE_READ_RESP) && (cmd_pkt.tx_type ==`NOC_NPP_PKT_TYPE_READ_REQ)))begin
        match_at =1;
        if(resp_pkt_local.vc_num == vc_map_rsp[cmd_pkt.vc_num]) begin//update it FIXME
         match_at =2;
        end  
        else begin
          $error ("%m: NPG : MISMATCH : vc_num rsp-%0d : req-%0d, vc_map_rsp[%0d]=%0d",resp_pkt_local.vc_num,cmd_pkt.vc_num,cmd_pkt.vc_num,vc_map_rsp[cmd_pkt.vc_num]);
          mismatch_vc++;
        end
        if(resp_pkt_local.src == cmd_pkt.dest) begin
          match_at =3;
        end  
        else begin
          $error ("%m: NPG : MISMATCH : src rsp-%0d : req-%0d",resp_pkt_local.src,cmd_pkt.dest);
          mismatch_src++;
        end
        if(resp_pkt_local.dest == cmd_pkt.src) begin
          match_at =4;
        end  
        else begin
          $error ("%m: NPG : MISMATCH : dest rsp-%0d : req-%0d",resp_pkt_local.dest,cmd_pkt.src);
          mismatch_dst++;
          `PRINT_MODEL(1,$sformatf("================================"),DBG);
          //cmd_pkt.print_flit();
          `PRINT_MODEL(1,$sformatf("================-=================="),DBG);
          //resp_pkt_local.print_flit();
          `PRINT_MODEL(1,$sformatf("================-=================="),DBG);
        end
        if(resp_pkt_local.pri == cmd_pkt.pri) begin
          match_at =5;
          `PRINT_MODEL(VERBOSITY_EN,$sformatf("NPG:::STORAGE_MEM:::Found match between received %d and cmd %d for cmd uid=%0d",resp_pkt_local.tx_type,cmd_pkt.tx_type,cmd_pkt.uid),DBG)   
          return;
        end  
        else begin
          $error ("%m: NPG : MISMATCH : pri rsp-%0d, req-%0d",resp_pkt_local.pri ,cmd_pkt.pri);
          mismatch_pri++;
        end
      end 
    end 
   if(!(tag_matched)) begin
     mismatch_tag++;
     `PRINT_MODEL(1,$sformatf("ERROR:NPG:::STORAGE_MEM::: at time %0t Did not get a tag match for the received packet(tag=%0d)",$time,resp_pkt_local.tag),DBG) 
      //resp_pkt_local.print_flit();
   end 
   else begin
     `PRINT_MODEL(1,$sformatf("ERROR:::NPG:::STORAGE_MEM::: at time %0t Tag matched for the received packet but either the VC/SRC/DEST/PRI fields did not match",$time),DBG) 
     `PRINT_MODEL(1,$sformatf("match_at=%0d resp_pkt_local.src=%0d",match_at,resp_pkt_local.src),DBG) 
      //resp_pkt_local.print_flit();
     `PRINT_MODEL(1,$sformatf("Printing all the cmd packets whose tags matched with the resp packet"),DBG)
     //for(int i=0;i<ctrl_pkt_tag_matched.size();i++)
     //  ctrl_pkt_tag_matched[i].print();
    end  
    //ctrl_pkt_tag_matched = {};
    return; 
 endfunction

int watch_dog_timer_count_response[8];
int watch_dog_timer_count_credit_return[8];
wire watch_dog_timer_expired_rsp;
wire watch_dog_timer_expired_credit_rtn;
initial begin
    for(int i = 0 ; i < 8 ; i++) begin
    watch_dog_timer_count_response[i]  =0;
    watch_dog_timer_count_credit_return[i] = 0;
    end
end
always @(posedge npp_if_in.clk or negedge npp_if_out.rst_n)begin
  if(npp_if_out.rst_n == 0) begin
    for(int i = 0 ; i < 8 ; i++) begin
    watch_dog_timer_count_response[i] = 0;
    watch_dog_timer_count_credit_return[i] = 0;
    end
  end
  else begin //{
    for(int i = 0 ; i < 8 ; i++) begin //{
      if(i inside {REG_WR_REQ_VC_MAP0,REG_WR_REQ_VC_MAP1}) begin //{
        if(wr_req_q.exists(i)) begin //{
          if(wr_req_q[i].size() == 0) begin //{
            watch_dog_timer_count_response[vc_map_rsp[i]] = 0;
            watch_dog_timer_count_credit_return[vc_map_rsp[i]] = 0;
          end //}
          else begin //{
            if(npp_if_in.noc_valid[vc_map_rsp[i]] != 0) watch_dog_timer_count_response[vc_map_rsp[i]] = 0;
            else watch_dog_timer_count_response[vc_map_rsp[i]] +=1;
            if(watch_dog_timer_count_response[vc_map_rsp[i]]  >=32'h0010_FFFF ) begin //{
               `PRINT_MODEL(1,$sformatf("Watch dog failure :: did not recieve response for the req on vc %d resp_vc=%d",i,vc_map_rsp[i]),DBG);
              $fatal;
            end //}
            if(npp_if_out.noc_credit_return[vc_map_rsp[i]] != 0) watch_dog_timer_count_credit_return[vc_map_rsp[i]] = 0;
            else watch_dog_timer_count_credit_return[vc_map_rsp[i]] +=1;
            //`PRINT_MODEL(1,$sformatf("watch_dog_timer_count_credit_return for vc %d = %d",vc_map_rsp[i],watch_dog_timer_count_credit_return[vc_map_rsp[i]]),DBG);
            if(watch_dog_timer_count_credit_return[vc_map_rsp[i]]  >=32'h0010_FFFF ) begin //{
              `PRINT_MODEL(1,$sformatf("Watch dog failure :: did not recieve credit_return for the req on vc %d resp_vc=%d",i,vc_map_rsp[i]),DBG);
              $fatal;
            end //}
          end //}
        end //}
      end //}
      else if((REG_LLR_VC_VLD && (i == REG_RD_REQ_VC_MAP0)) || (REG_ISOCR_VC_VLD && (i == REG_RD_REQ_VC_MAP1)) || (REG_BER_VC_VLD && (i == REG_RD_REQ_VC_MAP2))) begin //{
        if(rd_req_q.exists(i)) begin //{
          //foreach(rd_req_q[i][j]) begin //{
          foreach(rd_req_q[i,j]) begin //{
            if(rd_req_q[i][j].size() == 0) begin //{
              watch_dog_timer_count_response[vc_map_rsp[i]] = 0;
              watch_dog_timer_count_credit_return[vc_map_rsp[i]] = 0;
            end //}
            else begin //{
              if(npp_if_in.noc_valid[vc_map_rsp[i]] != 0) watch_dog_timer_count_response[vc_map_rsp[i]] = 0;
              else watch_dog_timer_count_response[vc_map_rsp[i]] +=1;
              //`PRINT_MODEL(1,$sformatf(" watch_dog_timer_count_response[vc_map_rsp[i]] for vc %d = %d req on vc %d",vc_map_rsp[i],watch_dog_timer_count_response[vc_map_rsp[i]],i),DBG);
              if(watch_dog_timer_count_response[vc_map_rsp[i]]  >=32'h0010_FFFF ) begin //{
                `PRINT_MODEL(1,$sformatf("Watch dog failure :: did not recieve response for the req on vc %d resp_vc=%d pending req size = %d",i,vc_map_rsp[i],rd_req_q[i][j].size()),DBG);
                $fatal;
              end //}
              if(npp_if_out.noc_credit_return[vc_map_rsp[i]] != 0) watch_dog_timer_count_credit_return[vc_map_rsp[i]] = 0;
              else watch_dog_timer_count_credit_return[vc_map_rsp[i]] +=1;
             // `PRINT_MODEL(1,$sformatf("watch_dog_timer_count_credit_return for vc %d = %d",vc_map_rsp[i],watch_dog_timer_count_credit_return[vc_map_rsp[i]]),DBG);
              if(watch_dog_timer_count_credit_return[vc_map_rsp[i]]  >=32'h0010_FFFF ) begin //{
               `PRINT_MODEL(1,$sformatf("Watch dog failure :: did not recieve credit_return for the req on vc %d resp_vc=%d pending req size = %d",i,vc_map_rsp[i],rd_req_q[i].size()),DBG);
                $fatal; 
              end //}
            end //}
          end//}
        end //}
      end //}
    end //}
  end //}
end     

final begin
  for(int i = 0 ; i <8 ; i++) begin
    if(wr_req_cnt[i] > 0 ) begin
      `PRINT_MODEL(1,$sformatf(" total number of WRITE req on vc_num = %0d req=%d",i,wr_req_cnt[i]),DBG);
    end
    if(wr_rsp_cnt[i] > 0 ) begin
      `PRINT_MODEL(1,$sformatf(" total number of WRITE rsp on vc_num = %0d rsp=%d",i,wr_rsp_cnt[i]),DBG);
    end
    if(rd_req_cnt[i] > 0 ) begin
      `PRINT_MODEL(1,$sformatf(" total number of READ req on vc_num = %0d req=%d",i,rd_req_cnt[i]),DBG);
    end
    if(rd_rsp_cnt[i] > 0 ) begin
      `PRINT_MODEL(1,$sformatf(" total number of READ rsp on vc_num = %0d rsp=%d",i,rd_rsp_cnt[i]),DBG);
    end
  end
  wr_req_interval = wr_req_time_2 - wr_req_time_1;
  if(wr_req_byte != 0 && wr_req_interval != 0)begin
    wr_req_bw = (wr_req_byte*1000)/wr_req_interval;
    $display (" total wr_req time interval = %d wr_req_bw= %f",wr_req_interval,wr_req_bw);
  end
    wr_rsp_interval = wr_req_time_2 - wr_rsp_time_1;
  if(wr_rsp_byte != 0 && wr_rsp_interval != 0)begin
    wr_rsp_bw = (wr_rsp_byte*1000)/wr_rsp_interval;
    $display (" total wr_rsp time interval = %d wr_rsp_bw= %f",wr_rsp_interval,wr_rsp_bw);
  end
  rd_req_interval = rd_req_time_2 - rd_req_time_1;
  if(rd_req_byte != 0 && rd_req_interval != 0)begin
    rd_req_bw = (rd_req_byte*1000)/rd_req_interval;
    $display (" total rd_req time interval = %d rd_req_bw= %f",rd_req_interval,rd_req_bw);
  end
  rd_rsp_interval = rd_rsp_time_2 - rd_rsp_time_1;
  if(rd_rsp_byte != 0 && rd_rsp_interval != 0)begin
    rd_rsp_bw = (rd_rsp_byte*1000)/rd_rsp_interval;
    $display (" total rd_rsp time interval = %d rd_rsp_bw= %f",rd_rsp_interval,rd_rsp_bw);
  end
end
endmodule




//=================================================//
/////////////////////////////////////////////////////
/////////////////SCOREBOARD//////////////////////////
/////////////////////////////////////////////////////
//=================================================//
module noc_mc_ddr4_v1_0_scoreboard#(
     parameter DISABLE_E2E_CHECK = 0
    ,parameter REG_RD_REQ_VC_MAP0  = 0
    ,parameter REG_WR_REQ_VC_MAP0  = 1
    ,parameter REG_RD_RESP_VC_MAP0 = 2
    ,parameter REG_WR_RESP_VC_MAP0 = 3
    ,parameter REG_RD_REQ_VC_MAP1  = 4
    ,parameter REG_WR_REQ_VC_MAP1  = 5
    ,parameter REG_RD_RESP_VC_MAP1 = 6
    ,parameter REG_WR_RESP_VC_MAP1 = 7
    ,parameter WR_LATENCY_MAX = 100
    ,parameter RD_LATENCY_MAX = 100
    ,parameter VERBOSITY_EN = 1
    ,parameter DISABLE_DATA_CHECK = 0
)
(
input clk,
input rst_n
);

mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) mb_req_to_sb;
mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) mb_rsp_to_sb;
noc_mc_ddr4_v1_0_flit_transaction_object pkt;
noc_mc_ddr4_v1_0_flit_transaction_object pkt_req;
noc_mc_ddr4_v1_0_flit_transaction_object pkt_rsp;
typedef bit [`NOC_NPP_WIDTH-1:0] 		    flit_t;
typedef bit [`NOC_NPS_NUM_VC-1:0] 		  valid_t;
typedef bit [`NOC_NPP_WIDTH+`NOC_NPS_NUM_VC-1:0] 		  vc_flit_t;

string src_leaf_nodes[];
string dest_leaf_nodes[];

        bit src_exists=0;
        bit dest_exists=0;

//// vc mapping logic 
int vc_map_rsp[int];

initial begin
  vc_map_rsp[REG_RD_REQ_VC_MAP0]=REG_RD_RESP_VC_MAP0;
  vc_map_rsp[REG_RD_REQ_VC_MAP1]=REG_RD_RESP_VC_MAP1;
  vc_map_rsp[REG_WR_REQ_VC_MAP0]=REG_WR_RESP_VC_MAP0;
  vc_map_rsp[REG_WR_REQ_VC_MAP1]=REG_WR_RESP_VC_MAP1;
end
//bit transactions_done=0;
  int data_match, data_mismatch;
  int mismatch_vc;
  int mismatch_src;
  int mismatch_dst;
  int mismatch_pri;
  int mismatch_tag;
event  got_wr_rsp;
event  got_rd_rsp;
event got_rsp_q_item;
//event  got_wr_req;
//event  got_rd_req;
noc_mc_ddr4_v1_0_flit_transaction_object rd_req_q[string][int][int][$];// for cmd-rsp checking on leaf node
noc_mc_ddr4_v1_0_flit_transaction_object rd_rsp_q[string][int][int][$];// for cmd-rsp checking on leaf node
noc_mc_ddr4_v1_0_flit_transaction_object wr_req_q[string][int][int][$];// for cmd-rsp checking on leaf node
noc_mc_ddr4_v1_0_flit_transaction_object wr_rsp_q[string][int][int][$];// for cmd-rsp checking on leaf node

typedef bit [12+12+8-1:0] src_dest_tag_t;

noc_mc_ddr4_v1_0_flit_transaction_object req_q[int][$];//end-to-end checking on direction basis
noc_mc_ddr4_v1_0_flit_transaction_object rsp_q[int][$];//end-to-end checking on direction basis
parameter longint MEM_WIDTH = 128;

 reg [MEM_WIDTH-1:0]scb_mem[longint];//x16Byte/x128bit associative memory array
 reg [MEM_WIDTH-1:0]byte_enable[longint];//x16Byte/x128bit associative memory array
function void connect_all_mb(mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) req,mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) rsp);
mb_req_to_sb = req;
mb_rsp_to_sb = rsp;
endfunction

function void connect_req_mb(mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) req);
mb_req_to_sb = req;
endfunction

function void connect_rsp_mb(mailbox#(noc_mc_ddr4_v1_0_flit_transaction_object) rsp);
mb_rsp_to_sb = rsp;
endfunction




always @(negedge clk) begin
#10ps;
////`PRINT(SB_PRINT,$sformatf("mb_rsp_to_sb.num %0d",mb_rsp_to_sb.num),DBG)
if(mb_rsp_to_sb.num>0)
while(mb_rsp_to_sb.num >0) begin
  mb_rsp_to_sb.get(pkt);
  `PRINT_MODEL(VERBOSITY_EN,$sformatf("mb_rsp_to_sb: tx_type %0h, src_comp %0s, pkt.src %0d",pkt.tx_type,pkt.src_comp,pkt.src),DBG)
  req_q[pkt.src].push_back(pkt); // for end-to-end checking

  ////`PRINT(SB_PRINT,$sformatf("pkt.tx_type %p",pkt.tx_type),DBG)
  case(pkt.tx_type)
  {`NOC_NPP_PKT_TYPE_WRITE_REQ}: begin
        if(pkt.aburst == 2'b10) begin
          void'(write_to_memory_wrap(pkt));
        end
        else begin
          void'(write_to_memory(pkt));
        end
   end                                                           
  {`NOC_NPP_PKT_TYPE_READ_RESP} : begin   
  if(DISABLE_DATA_CHECK == 0) begin
  `ifndef DISABLE_DATA_CHECK
      if(pkt.aburst == 2'b10) begin
       check_data_integrity_wrap(pkt,pkt);
     end
     else begin
       check_data_integrity(pkt,pkt);
     end 
  `endif
    //pkt.print_flit();
   end                                                           
   end                                                           
  {`NOC_NPP_PKT_TYPE_READ_REQ}  : begin                          
    rd_req_q[pkt.src_comp][pkt.vc_num][pkt.tag].push_back(pkt);                       
                                                
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("rd_req_q : pkt type %0h, dest %0h, src %0h, tag %0h",pkt.tx_type,pkt.dest,pkt.src,pkt.tag),DBG)
    `PRINT_MODEL(VERBOSITY_EN,$sformatf("mb_req_to_sb: putting in rd_req_q[%s] : pkt type %0h : dest-src-tag %0h  ",pkt.src_comp,pkt.tx_type,{pkt.dest,pkt.src,pkt.tag}),DBG)
   end   
  default : begin
    $error(" unsupported type found : ",pkt.tx_type);
    $fatal;
   end
  endcase
end
end

function write_to_memory_wrap(noc_mc_ddr4_v1_0_flit_transaction_object req);
  longint addr_init ;
  bit [MEM_WIDTH -1 :0] wstrb_full;
  int total_blocks ;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data;
  int wrap_addr; 
  wrap_addr= 64;
  addr_init = req.aaddr;
  total_blocks = req.data.size;

   foreach(req.data[i])begin
      data = req.data[i];
      wstrb_full = expand_wstrb(req.per_byte[i]);
      if(scb_mem.exists(addr_init))begin
        scb_mem[addr_init] = (data & wstrb_full) | (scb_mem[addr_init] & !wstrb_full);
        byte_enable[addr_init] = wstrb_full | (byte_enable[addr_init] & !wstrb_full);
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("over writing @addr: %0h, data %0h, wstrb_full %0h, mem[%0h]=%0h",addr_init,data,wstrb_full,addr_init,scb_mem[addr_init]),DBG);
      end
      else begin
        byte_enable[addr_init] = wstrb_full;
        scb_mem[addr_init] = (data & wstrb_full) ; //there will be no x entries in mem
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("writing new @addr: %0h, data %0h, wstrb_full %0h, mem[%0h]=%0h",addr_init,data,wstrb_full,addr_init,scb_mem[addr_init]),DBG);
      end
      addr_init=addr_init+16;//check for 64KB limit
      if(addr_init % wrap_addr == 0) begin
        addr_init = addr_init - wrap_addr;
      end
   end
 endfunction


function write_to_memory(noc_mc_ddr4_v1_0_flit_transaction_object req);
  longint addr_init ;
  bit [MEM_WIDTH -1 :0] wstrb_full;
  int total_blocks ;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data;

  addr_init = req.aaddr;
  total_blocks = req.data.size;

   foreach(req.data[i])begin
      data = req.data[i];
      wstrb_full = expand_wstrb(req.per_byte[i]);
      if(scb_mem.exists(addr_init))begin
        scb_mem[addr_init] = (data & wstrb_full) | (scb_mem[addr_init] & !wstrb_full);
        byte_enable[addr_init] = wstrb_full | (byte_enable[addr_init] & !wstrb_full);
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("over writing @addr: %0h, data %0h, wstrb_full %0h, mem[%0h]=%0h",addr_init,data,wstrb_full,addr_init,scb_mem[addr_init]),DBG);
      end
      else begin
        byte_enable[addr_init] = wstrb_full;
        scb_mem[addr_init] = (data & wstrb_full) ; //there will be no x entries in mem
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("writing new @addr: %0h, data %0h, wstrb_full %0h, mem[%0h]=%0h",addr_init,data,wstrb_full,addr_init,scb_mem[addr_init]),DBG);
      end
      addr_init=addr_init+16;//check for 64KB limit
   end
 endfunction

 function void check_data_integrity_wrap(noc_mc_ddr4_v1_0_flit_transaction_object req, rsp);
  longint addr_init ;
  longint addr;
  bit [MEM_WIDTH -1 :0] wstrb_full;
  int total_blocks ;
  int wrap_addr;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data_rsp;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data_mem;

  addr_init = req.aaddr;
  addr = addr_init;
  total_blocks = rsp.data.size;
  if(total_blocks == 2) begin
    wrap_addr = 32;
  end
  else if(total_blocks == 4) begin
    wrap_addr = 64;
  end
   foreach(rsp.data[i])begin
      data = rsp.data[i];
      if(scb_mem.exists(addr) ) begin
       `PRINT_MODEL(VERBOSITY_EN,$sformatf("scb_mem[addr_init]= %0h , byte_enable[addr_init]= %0h ,addr_init = %0h",scb_mem[addr_init],byte_enable[addr_init],addr_init),DBG);
        data_mem = scb_mem[addr] ;
        data_rsp = rsp.data[i] & byte_enable[addr]; 
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("data_rsp= %0h , data_mem= %0h , actual data rsp.data[i] = %0h",data_rsp,data_mem,rsp.data[i]),DBG);

        //$display("data_rsp= %0h , data_mem= %0h , actual data rsp.data[i] = %0h",data_rsp,data_mem,rsp.data[i],DBG);
        if(data_rsp===data_mem) begin
        data_match++;
        end
        else begin
        //MISMATCH
        $error("data %0h @addr %0h does not match with rsp pkt data %0h",scb_mem[addr],addr,data);
        data_mismatch++;
        end
      end
      else begin
        //data doesn't exist
        //$error("addr %0h does not exist",addr);
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("addr %0h does not exist",addr),DBG);
      end
      addr = addr +16;
      if( addr%wrap_addr == 0 ) begin
        addr = addr - wrap_addr;
      end 
    if(data_mismatch>0) begin
      $error("%m: data integrity failed , data_mismatch %0d",data_mismatch);
    end
   end
 endfunction

function void check_data_integrity(noc_mc_ddr4_v1_0_flit_transaction_object req, rsp);
  longint addr_init ;
  bit [MEM_WIDTH -1 :0] wstrb_full;
  int total_blocks ;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data_rsp;
  bit [`NOC_AXDATA128_WIDTH-1 :0] data_mem;

  addr_init = req.aaddr;
  total_blocks = rsp.data.size;

   foreach(rsp.data[i])begin
      data = rsp.data[i];
      //wstrb_full = expand_wstrb(req.per_byte[i]);
      //what difference will it make if i check for existing addr or not
      if(scb_mem.exists(addr_init) ) begin
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("scb_mem[addr_init]= %0h , byte_enable[addr_init]= %0h ,addr_init = %0h",scb_mem[addr_init],byte_enable[addr_init],addr_init),DBG);
        data_mem = scb_mem[addr_init] ;//& byte_enable[addr_init];

        data_rsp = rsp.data[i] & byte_enable[addr_init];  
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("data_rsp= %0h , data_mem= %0h , actual data rsp.data[i] = %0h",data_rsp,data_mem,rsp.data[i]),DBG);
        //if(data===scb_mem[addr_init]) begin
        if(data_rsp===data_mem) begin
        //match
        data_match++;
        end
        else begin
        //MISMATCH
        $error("data %0h @addr %0h does not match with rsp pkt data %0h",scb_mem[addr_init],addr_init,data);
        data_mismatch++;
        end
      end
      else begin
        //data doesn't exist
        //$error("addr %0h does not exist",addr_init);
        `PRINT_MODEL(VERBOSITY_EN,$sformatf("addr %0h does not exist",addr_init),DBG);
      end
      addr_init=addr_init+16;//check for 64KB limit
   end
  if(data_mismatch>0) begin
    $error("%m: data integrity failed , data_mismatch %0d",data_mismatch);
      end
 endfunction

function automatic bit [MEM_WIDTH -1 :0] expand_wstrb(input bit [MEM_WIDTH/8 -1 :0] wstrb); 
  bit [MEM_WIDTH -1 :0] wstrb_full;
  for(int i=0;i<MEM_WIDTH;i++)begin
    wstrb_full[i]=wstrb[i/8];
  end  
  return wstrb_full;
endfunction


endmodule



`endif

