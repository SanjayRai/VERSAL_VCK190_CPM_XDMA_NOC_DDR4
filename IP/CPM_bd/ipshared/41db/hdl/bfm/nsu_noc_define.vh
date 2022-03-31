`ifndef __NSU_NOC_DEFINE_VH__
`define __NSU_NOC_DEFINE_VH__

// NOC NSU BFM Register programming through Vivado IPI sidefile
`ifndef NPI_PROT_IF
`define SIDEFILE_EN 
`endif
`ifdef NOC_BFM_LOCAL_VERIF
`undef SIDEFILE_EN 
`endif

//`include "ref_common_define.vh"
// ********************************************************
// NOC General
// ********************************************************
`define NOC_CLOG2(x) \
      (x <= 2)   ? 1 : \
      (x <= 4)   ? 2 : \
      (x <= 8)   ? 3 : \
      (x <= 16)  ? 4 : \
      (x <= 32)  ? 5 : \
      (x <= 64)  ? 6 : \
      (x <= 128) ? 7 : \
      (x <= 256) ? 8 : \
      (x <= 512) ? 9 : \
      (x <= 1024) ? 10 : \
      (x <= 2048) ? 11 : \
      (x <= 4096) ? 12 : \
      (x <= 8192) ? 13 : \
      (x <= 16384) ? 14 : \
      (x <= 32768) ? 15 : \
      (x <= 65536) ? 16 : \
      (x <= 131072) ? 17 : \
      (x <= 262144) ? 18 : \
      (x <= 524288) ? 19 : \
      (x <= 1048576) ? 20 : \
      (x <= 2097152) ? 21 : \
      (x <= 4194304) ? 22 : \
      (x <= 8388608) ? 23 : \
      (x <= 16777216) ? 24 : \
      -1

`define NOC_AXSIZE(x) \
      (x == 3'd0) ? 1 : \
      (x == 3'd1) ? 2 : \
      (x == 3'd2) ? 4 : \
      (x == 3'd3) ? 8 : \
      (x == 3'd4) ? 16 : \
      (x == 3'd5) ? 32 : \
      (x == 3'd6) ? 64 : \
      (x == 3'd7) ? 128 : \
      0
	    
`define NOC_AXLEN(x) x+1

`define NOC_TCQ #2ps

`define _noc_nmu_rrob_64x32_
`define _noc_nmu_rrob_use_ram_
`define _noc_nmu_wbuf_use_ram_

`define _noc_nsu_rbuf_use_ram_
`define _noc_afifo_use_ram_
`define _noc_nsu_use_aoq_

`define NOC_ASYNC_FIFO_RWIDTH 596
`define NOC_ASYNC_FIFO_WWIDTH 684

//`define NOC_READ 0
//`define NOC_WRITE 1	    

// ********************************************************
// Clock Gating
// ********************************************************
/*
  `ifndef SYNTHESIS
 `define NOC_GCLK_EN (clk, en, te, clkout)   \
   logic latched_en;                     \ 
   always @(!clk) begin                  \
      latched_en = en & te;              \
   end                                   \
   always_comb clkout = clk & latched_en;
   
`else
   CKLNQD3BWP20P90LVT I_clock_gate ( .CP(clk), .E(en), .TE(te), .Q(clkout));
`endif
*/
	    
// ********************************************************
// NMU / NSU
// ********************************************************
// AXI CONVERSION MUX GROUP
`define NOC_AXI_DATA_G0_G0 31:0
`define NOC_AXI_DATA_G0_G1 63:32
`define NOC_AXI_DATA_G0_G2 95:64
`define NOC_AXI_DATA_G0_G3 127:96
`define NOC_AXI_DATA_G1_G0 159:128
`define NOC_AXI_DATA_G1_G1 191:160
`define NOC_AXI_DATA_G1_G2 223:192
`define NOC_AXI_DATA_G1_G3 255:224
`define NOC_AXI_DATA_G2_G0 287:256
`define NOC_AXI_DATA_G2_G1 319:288
`define NOC_AXI_DATA_G2_G2 351:320
`define NOC_AXI_DATA_G2_G3 383:352
`define NOC_AXI_DATA_G3_G0 415:384
`define NOC_AXI_DATA_G3_G1 447:416
`define NOC_AXI_DATA_G3_G2 479:448
`define NOC_AXI_DATA_G3_G3 511:480

`define NOC_AXI_WSTRB_G0_G0 3:0
`define NOC_AXI_WSTRB_G0_G1 7:4
`define NOC_AXI_WSTRB_G0_G2 11:8
`define NOC_AXI_WSTRB_G0_G3 15:12
`define NOC_AXI_WSTRB_G1_G0 19:16
`define NOC_AXI_WSTRB_G1_G1 23:20
`define NOC_AXI_WSTRB_G1_G2 27:24
`define NOC_AXI_WSTRB_G1_G3 31:28
`define NOC_AXI_WSTRB_G2_G0 35:32
`define NOC_AXI_WSTRB_G2_G1 39:36
`define NOC_AXI_WSTRB_G2_G2 43:40
`define NOC_AXI_WSTRB_G2_G3 47:44
`define NOC_AXI_WSTRB_G3_G0 51:48
`define NOC_AXI_WSTRB_G3_G1 55:52
`define NOC_AXI_WSTRB_G3_G2 59:56
`define NOC_AXI_WSTRB_G3_G3 63:60

`define NOC_AXI_PAR_G0_G0 3:0
`define NOC_AXI_PAR_G0_G1 7:4
`define NOC_AXI_PAR_G0_G2 11:8
`define NOC_AXI_PAR_G0_G3 15:12
`define NOC_AXI_PAR_G1_G0 19:16
`define NOC_AXI_PAR_G1_G1 23:20
`define NOC_AXI_PAR_G1_G2 27:24
`define NOC_AXI_PAR_G1_G3 31:28
`define NOC_AXI_PAR_G2_G0 35:32
`define NOC_AXI_PAR_G2_G1 39:36
`define NOC_AXI_PAR_G2_G2 43:40
`define NOC_AXI_PAR_G2_G3 47:44
`define NOC_AXI_PAR_G3_G0 51:48
`define NOC_AXI_PAR_G3_G1 55:52
`define NOC_AXI_PAR_G3_G2 59:56
`define NOC_AXI_PAR_G3_G3 63:60

`define NOC_NSU_WSTRB_PAR_G0_G0 0
`define NOC_NSU_WSTRB_PAR_G0_G1 1 
`define NOC_NSU_WSTRB_PAR_G0_G2 2 
`define NOC_NSU_WSTRB_PAR_G0_G3 3


`define NOC_NPP_WSTRB_G0_G0 137:134 
`define NOC_NPP_WSTRB_G0_G1 141:138 
`define NOC_NPP_WSTRB_G0_G2 145:140 
`define NOC_NPP_WSTRB_G0_G3 149:146 

`define NOC_NSU_WSTRB_G0_G0 3:0 
`define NOC_NSU_WSTRB_G0_G1 7:4 
`define NOC_NSU_WSTRB_G0_G2 11:8 
`define NOC_NSU_WSTRB_G0_G3 15:12 
// ********************************************************
// NMU
// ********************************************************
// --------------------------------------------------------
`define NOC_NMU_WRITE_PKT_TYPE_HDR 0
`define NOC_NMU_WRITE_PKT_TYPE_DATA 1
	
// --------------------------------------------------------
// Address Map
`define NOC_NMU_ADDR_MAP_STATUS_WIDTH  2
`define NOC_NMU_ADDR_MAP_STATUS_DDR  0             // Bit0 definition: Address Mapped is DDR
`define NOC_NMU_ADDR_MAP_STATUS_DDR_INTERLEAVE  1  // Bit0 definition: Address Mapped is DDR interleave
`define NOC_NMU_ADDR_REMAP_TABLE_DEPTH 16
//`define NOC_LOG2NMU_ADDR_REMAP_TABLE_DEPTH `CLOG2(`NMU_ADDR_REMAP_TABLE_DEPTH)
`define NOC_LOG2NMU_ADDR_REMAP_TABLE_DEPTH 4

// --------------------------------------------------------
// RROB
`ifdef _noc_nmu_rrob_64x32_
 `define NOC_NMU_NUM_RROB_ENTRY 64
 `define NOC_LOG2NMU_NUM_RROB_ENTRY 6
 `define NOC_NMU_RROB_REQ_FIFO_DEPTH 8
`else
 `define NOC_NMU_NUM_RROB_ENTRY 32
 `define NOC_LOG2NMU_NUM_RROB_ENTRY 5    
 `define NOC_NMU_RROB_REQ_FIFO_DEPTH 4
`endif

// --------------------------------------------------------
// Write Response Tracker
`define NOC_NMU_NUM_WRTRK_ENTRY 32
//`define NOC_LOG2NMU_NUM_WRTRK_ENTRY `CLOG2(`NMU_NUM_WRTRK_ENTRY)
`define NOC_LOG2NMU_NUM_WRTRK_ENTRY 5	    
`define NOC_NMU_MAX_NUM_CHOP 64
//`define NOC_LOG2NMU_MAX_NUM_CHOP `CLOG2(`NMU_MAX_NUM_CHOP)
`define NOC_LOG2NMU_MAX_NUM_CHOP 6
`define NOC_NMU_WRTRK_RESPONSE_STATUS_WIDTH 2
`define NOC_NMU_WRTRK_RESPONSE_STATUS_NONE 0    
`define NOC_NMU_WRTRK_RESPONSE_STATUS_PARTIAL 1
`define NOC_NMU_WRTRK_RESPONSE_STATUS_COMPLETE 2
	
// --------------------------------------------------------
// Rate limiting
`define NOC_NMU_RATE_PERIOD_CNT_WIDTH 20
`define NOC_NMU_RATE_CREDIT_CNT_WIDTH 12
`define NOC_NMU_RATE_CREDIT_DROP_WIDTH 10	    

// --------------------------------------------------------
// Write Buffer
`define NOC_NMU_WBUF_DEPTH 32
//`define NOC_LOG2NMU_WBUF_DEPTH `CLOG2(`NMU_WBUF_DEPTH)
`define NOC_LOG2NMU_WBUF_DEPTH 5
	
// --------------------------------------------------------
// Chopsize
`define NOC_NMU_CHOPSIZE_WIDTH 2
`define NOC_NMU_CHOPSIZE_64B   0
`define NOC_NMU_CHOPSIZE_128B  1
`define NOC_NMU_CHOPSIZE_256B  2    
`define NOC_NMU_CHOPSIZE_512B  3

`define NOC_NMU_DDR_BURST_LEN_WIDTH 1
`define NOC_NMU_DDR_BURST_LEN_16 0
`define NOC_NMU_DDR_BURST_LEN_32 1
	
// ********************************************************
// NSU
// ********************************************************
// --------------------------------------------------------
// Read Response Tracker
`define NOC_NSU_NUM_RDTRK_ENTRY 32 
//`define NOC_LOG2NSU_NUM_RDTRK_ENTRY `CLOG2(`NSU_NUM_RDTRK_ENTRY)
`define NOC_LOG2NSU_NUM_RDTRK_ENTRY 5
`define NOC_NSU_RDTRK_DATA_RESPONSE_STATUS_WIDTH 2
`define NOC_NSU_RDTRK_DATA_RESPONSE_STATUS_NONE 0    
`define NOC_NSU_RDTRK_DATA_RESPONSE_STATUS_PARTIAL 1
`define NOC_NSU_RDTRK_DATA_RESPONSE_STATUS_COMPLETE 2

// --------------------------------------------------------
// Write Response Tracker
`define NOC_NSU_NUM_WRTRK_ENTRY 32
//`define NOC_LOG2NSU_NUM_WRTRK_ENTRY `CLOG2(`NSU_NUM_WRTRK_ENTRY)
`define NOC_LOG2NSU_NUM_WRTRK_ENTRY 5	    
`define NOC_NSU_WRTRK_RESPONSE_STATUS_WIDTH 2
`define NOC_NSU_WRTRK_RESPONSE_STATUS_NONE 0    
`define NOC_NSU_WRTRK_RESPONSE_STATUS_PARTIAL 1
`define NOC_NSU_WRTRK_RESPONSE_STATUS_COMPLETE 2

`define NOC_NSU_MAX_NUM_CHOP 32
`define NOC_LOG2NSU_MAX_NUM_CHOP 5

// --------------------------------------------------------	    
// Request FIFO
`define NOC_NSU_REQ_FIFO_DEPTH 5 
`define NOC_LOG2NSU_REQ_FIFO_DEPTH 3
`define NOC_NSU_RESP_FIFO_DEPTH 5
`define NOC_LOG2NSU_RESP_FIFO_DEPTH 3
	    
// --------------------------------------------------------	    
// Read Buffer
`define NOC_NSU_RBUF_DEPTH 16
//`define NOC_LOG2NSU_RBUF_DEPTH `CLOG2(`NSU_RBUF_DEPTH)
`define NOC_LOG2NSU_RBUF_DEPTH 4

//Compressed ID
`define NOC_LOG2NSU_COMP_ID_INDEX_WIDTH 5
`define NOC_NSU_COMP_ID_INDEX_NUM 32
// ********************************************************
// NPS
// ********************************************************
// --------------------------------------------------------
`define NOC_NPS_NUM_PORT  4
`define NOC_LOG2NPS_NUM_PORT 2
`define NOC_NCRB_NUM_PORT  2
`define NOC_NPS_NUM_VC  8
//`define NOC_LOG2NPS_NUM_VC `CLOG2(`NPS_NUM_VC)
`define NOC_LOG2NPS_NUM_VC 3
`define NOC_NPS_IN_CREDIT_WIDTH 5
`define NOC_NPS_OUT_CREDIT_WIDTH 4
`define NOC_NPS_IPA_TOKEN_WIDTH  8
`define NOC_NPS_VCA_TOKEN_WIDTH  8

// Routing Table
`define NOC_NPS_NUM_RT_CHIP 2**2
`define NOC_NPS_NUM_RT_REGION 2**6
`define NOC_NPS_NUM_RT_LOCAL 2**4 
`define NOC_LOG2NPS_NUM_RT_CHIP 2  
`define NOC_LOG2NPS_NUM_RT_REGION 6
`define NOC_LOG2NPS_NUM_RT_LOCAL 4 
`define NOC_NPS_LOCAL_ID 3:0
`define NOC_NPS_REGION_ID 9:4
`define NOC_NPS_CHIP_ID 11:10 // FIXME when CHIP ID is added

//NPS ERROR Codes
`define NOC_ERR_REF_NPS_DST_PAR_ERR  20'h6_3_1_1_1
`define NOC_ERR_REF_NPS_ROUTE_ERR    20'hB_3_3_1_1
`define NOC_ERR_REF_NPS_CRDT_RDY_ERR 20'hB_3_3_1_2
`define NOC_ERR_REF_NPS_CRDT_OVF_ERR 20'hB_3_3_1_3
`define NOC_ERR_REF_NPS_BUF_OVF_ERR  20'hB_3_3_1_5
`define NOC_ERR_REF_NPS_SCAN_CLR_ERR 20'hB_3_3_1_4

// Number of Default routing table
`define NOC_LOG2NPS_NUM_DEFAULT_ROUTING_TABLE 4

//NSU wrtrk/rdtrk arb 
`define NOC_NSU_VC_INDEX_WIDTH 1
`define NOC_NSU_RDTRK_FIFO_INDEX_WIDTH 3
`define NOC_NSU_RDTRK_FIFO_ENTRY 8

`define NOC_NSU_RDTRK_NUM_VC_ARB 4
`define NOC_NSU_WRTRK_NUM_VC_ARB 4
`define NOC_NSU_RDTRK_TOKEN_WIDTH 8
`define NOC_NSU_WRTRK_TOKEN_WIDTH 8
`define NOC_NSU_VC_ARB_TOKEN_WIDTH 8

`define NOC_NSU_NUM_READ_VC 2
`define NOC_NSU_NUM_WRITE_VC 2
`define NOC_NSU_NUM_VC (`NOC_NSU_NUM_READ_VC + `NOC_NSU_NUM_WRITE_VC)

//`define NOC_NSU_VC_MAX_CREDIT_WIDTH 4
`define NOC_NSU_VC_MAX_CREDIT_WIDTH 5
`define NOC_NSU_VC_MAX_CREDIT 4'd5

`define NOC_AXI_AFIFO_DEPTH 8

`define NOC_NSU_AXADDR_LOWER_WIDTH  4'd8
`define NOC_NSU_AXADDR_UPPER_WIDTH  (`NOC_NPP_AXADDR_WIDTH-`NOC_NSU_AXADDR_LOWER_WIDTH)
`define NOC_NSU_AXADDR_LOWER 7:0
`define NOC_NSU_AXADDR_UPPER 63:8

//time expiration
`define NOC_NSU_EXP_CHK_WIDTH 2

// ********************************************************
// NCRB
// ********************************************************
// --------------------------------------------------------
`define NOC_NCRB_EB_DEPTH 8
`define NOC_LOG2NCRB_EB_DEPTH 3

// ********************************************************
// NMU Interface Common Define
// ********************************************************
`define NOC_NMU_MODE_WIDTH  3
`define NOC_NMU_DWIDTH_WIDTH  3
`define NOC_NMU_INTERRUPT_WIDTH 4
	    
// ********************************************************
// NSU Interface Common Define
// ********************************************************
`define NOC_NSU_MODE_WIDTH  3
`define NOC_NSU_DWIDTH_WIDTH  3
`define NOC_NSU_INTERRUPT_WIDTH 4
`define NOC_NSU_COMP_ID_WIDTH 2

// ********************************************************
// NPS Interface Common Define
// ********************************************************
`define NOC_NPS_INTERRUPT_WIDTH 4

// ********************************************************
// NoC Debug bus Interface Common Define
// ********************************************************
`define NOC_DBG_CTRL_WIDTH 8
`define NOC_DBG_MUX_WIDTH 128
`define NOC_DBG64_MUX_WIDTH 64

// ********************************************************
// NoC NMU AXI stream internal packet length
// ********************************************************
`define NOC_NMU_AXI_STRM_PKT_LEN 6'h3f
`define NOC_NMU_STRM_DATA_CNT_WIDTH 6

// ********************************************************
// NoC CHOP size Define
// ********************************************************
`define CHOP_64B     2'b00
`define CHOP_128B    2'b01
`define CHOP_256B    2'b10
`define CHOP_512B    2'b11

// ********************************************************
// NSU DATA PARITY
// ********************************************************
`define NOC_NMU_DATA_PARITY_WIDTH 16
`define NOC_LOG2NMU_DATA_PARITY_WIDTH 4
`define NOC_NMU_WSTRB_PARITY_WIDTH 2 
`define NOC_LOG2NMU_WSTRB64_PAR_WIDTH 3 //8 bit

`define NOC_NSU_DATA_PARITY_WIDTH 16
`define NOC_LOG2NSU_DATA_PARITY_WIDTH 4
`define NOC_NSU_WSTRB_PARITY_WIDTH 4 //4Byte data per 1 bit
`define NOC_NSU_WSTRB_PARITY_WIDTH_8B 2 //8Byte data per 1 bit
`define NOC_LOG2NSU_WSTRB_PARITY_WIDTH 1

`define NOC_NSU_ADDR_PARITY_WIDTH 8
`define NOC_LOG2NSU_ADDR_PARITY_WIDTH 3

// ********************************************************
// ECC ERR BIT WIDTH
// ********************************************************
`define NOC_ERR_ECC_BIT_WIDTH 8


// ********************************************************
// LOG2DEPTH of ASYNC_FIFO 
// ********************************************************
`define NOC_AFIFO_LOG2DEPTH 3

//`define AXI_SIM_1W_1R 
//`define AXI_NMU_512 
//`define AXI_NMU_64 

//---------------------------------------------------------
// (Temp) NoC Default Address Map
//    -SBA : Node System Base address (unit = MB)
//    -SIZE: Node Size (# of MB)
//    -NID : Node NoC ID
//---------------------------------------------------------
`define SBA_DDR_CH0_0      28'h0000000
`define SBA_LPD_AFI_FS     28'h0000800
//`define SBA_VCU            28'h0000A00
`define SBA_FPD_AFI_0      28'h0000A40
`define SBA_FPD_AFI_1      28'h0000B00
`define SBA_QSPI           28'h0000C00
`define SBA_PCIE_REGION_0  28'h0000E00
`define SBA_PMC            28'h0000F00
`define SBA_STM_CORESIGHT  28'h0000F80
`define SBA_GIC            28'h0000F90
//`define SBA_Reserved       28'h0000F91
`define SBA_CPM            28'h0000FC0
`define SBA_FPD_SLAVES     28'h0000FD0
`define SBA_LPD_SLAVES     28'h0000FE0
`define SBA_PMC_ALIAS_0    28'h0001000
`define SBA_PMC_ALIAS_1    28'h0001080
`define SBA_PMC_ALIAS_2    28'h0001100
`define SBA_PMC_ALIAS_3    28'h0001180
//`define SBA_Reserved       28'h0001200
`define SBA_ME_ARRAY_0     28'h0002000
`define SBA_ME_ARRAY_1     28'h0002400
`define SBA_ME_ARRAY_2     28'h0002800
`define SBA_ME_ARRAY_3     28'h0002C00
//`define SBA_Reserved       28'h0001200
`define SBA_PL_VIA_PS_0    28'h0004000
`define SBA_PCIE_REGION_1  28'h0006000
`define SBA_DDR_CH0_1      28'h0008000
//`define SBA_Reserved       28'h0010000
`define SBA_HBM_T0         28'h0020000
`define SBA_HBM_T1         28'h0030000
`define SBA_HBM_T2         28'h0040000
`define SBA_HBM_T3         28'h0050000
//`define SBA_Reserved       28'h0060000
`define SBA_PCIE_REGION_2  28'h0080000
`define SBA_DDR_CH0_2      28'h00C0000
`define SBA_DDR_CH0_3      28'h0100000
//`define SBA_Reserved       28'h01B7800
`define SBA_PL_VIA_NOC_0   28'h0200000
`define SBA_PL_VIA_PS_1    28'h0400000
`define SBA_DDR_CH1        28'h0500000
`define SBA_DDR_CH2        28'h0600000
`define SBA_DDR_CH3        28'h0700000
`define SBA_PL_VIA_NOC_1   28'h0800000
//`define SBA_Reserved       28'h1000000

`define SIZE_DDR_CH0_0        2048
`define SIZE_LPD_AFI_FS        512
//`define SIZE_VCU                64
`define SIZE_FPD_AFI_0         192
`define SIZE_FPD_AFI_1         256
`define SIZE_QSPI              512
`define SIZE_PCIE_REGION_0     256
`define SIZE_PMC               128
`define SIZE_STM_CORESIGHT      16
`define SIZE_GIC                 1
//`define SIZE_Reserved           47
`define SIZE_CPM                16
`define SIZE_FPD_SLAVES         16
`define SIZE_LPD_SLAVES         32
`define SIZE_PMC_ALIAS_0       128
`define SIZE_PMC_ALIAS_1       128
`define SIZE_PMC_ALIAS_2       128
`define SIZE_PMC_ALIAS_3       128
//`define SIZE_Reserved         3584
`define SIZE_ME_ARRAY_0       1024
`define SIZE_ME_ARRAY_1       1024
`define SIZE_ME_ARRAY_2       1024
`define SIZE_ME_ARRAY_3       1024
//`define SIZE_Reserved        11776
`define SIZE_PL_VIA_PS_0      8192
`define SIZE_PCIE_REGION_1    8192
`define SIZE_DDR_CH0_1       32768
//`define SIZE_Reserved        65536
`define SIZE_HBM_T0          65536
`define SIZE_HBM_T1          65536
`define SIZE_HBM_T2          65536
`define SIZE_HBM_T3          65536
//`define SIZE_Reserved       131072
`define SIZE_PCIE_REGION_2  262144
`define SIZE_DDR_CH0_2      262144
`define SIZE_DDR_CH0_3      751616
//`define SIZE_Reserved       296960
`define SIZE_PL_VIA_NOC_0  2097152
`define SIZE_PL_VIA_PS_1   1048576
`define SIZE_DDR_CH1       1048576
`define SIZE_DDR_CH2       1048576
`define SIZE_DDR_CH3       1048576
`define SIZE_PL_VIA_NOC_1  8388608

`define NOC_NMU_DDR_ADR_MAP_DEPTH  7
`define NOC_NMU_DDR_ADR_MAP_WIDTH 15

`define NOC_NMU_DDR_DST_MAP_DEPTH  8
`define NOC_NMU_DDR_DST_MAP_WIDTH 12

`define C_TBASE_WIDTH 35

`define NOC_DWIDTH_WIDTH 7

// ********************************************************
// NOC_ERROR LOG INFO
// ********************************************************

`define NOC_NSU_ERR_LOG_WIDTH 244 

`define NOC_NPP_AXADDR_WIDTH  64
`define NOC_NPP_AXADDR_LOWER_WIDTH  4'd12
`define NOC_NPP_AXADDR_UPPER_WIDTH  (`NOC_NPP_AXADDR_WIDTH-`NOC_NPP_AXADDR_LOWER_WIDTH)
`define NOC_NPP_AXLEN_WIDTH  8
`define NOC_NPP_AXSIZE_WIDTH  3
`define NOC_NPP_AXBURST_WIDTH  2
`define NOC_NPP_AXLOCK_WIDTH  1  // Only support exclusive, no legacy LOCK support
`define NOC_NPP_AXCACHE_WIDTH  4
`define NOC_NPP_AXPROT_WIDTH  3
`define NOC_NPP_AXQOS_WIDTH  4
`define NOC_NPP_AXID_WIDTH  16
`define NOC_NPP_AXUSER_WIDTH  16
`define NOC_NPP_POISON_WIDTH 1
`define NOC_NPP_RSVD_WIDTH 6
`define NOC_NPP_SMID_WIDTH 10

`define NOC_NPP_DATA_WIDTH  128

// dummy0 spacers for Request header
`define NOC_NPP_AXRSVD0_WIDTH  (`NOC_NPP_DATA_WIDTH-`NOC_NPP_AXADDR_WIDTH-`NOC_NPP_AXLEN_WIDTH-`NOC_NPP_AXSIZE_WIDTH-`NOC_NPP_AXBURST_WIDTH-`NOC_NPP_AXLOCK_WIDTH-`NOC_NPP_AXCACHE_WIDTH-`NOC_NPP_AXPROT_WIDTH-`NOC_NPP_AXQOS_WIDTH-`NOC_NPP_AXID_WIDTH-`NOC_NPP_AXUSER_WIDTH)
`define NOC_NPP_AXRSVD1_WIDTH  (`NOC_NPP_DATA_WIDTH-`NOC_NPP_AXUSER_WIDTH)

`define NOC_NPP_PKT_TYPE_WIDTH  4
`define NOC_NPP_MISC_CTRL_WIDTH  2 //xResp
`define NOC_NPP_TAG_WIDTH  8
`define NOC_NPP_SRC_WIDTH  12
`define NOC_NPP_WSTRB_WIDTH  16
`define NOC_NPP_TLAST_WIDTH  1
`define NOC_NPP_POISON_WIDTH 1
`define NOC_NPP_CTRLRSVD0_WIDTH (`NOC_NPP_TAG_WIDTH+`NOC_NPP_SRC_WIDTH-`NOC_NPP_WSTRB_WIDTH)
`define NOC_NPP_DST_WIDTH  12
`define NOC_NPP_DST_PAR_WIDTH 1
`define NOC_NPP_PRI_WIDTH 1
`define NOC_NPP_LAST_WIDTH  1
`define NOC_NPP_DBI_WIDTH 1
`define NOC_NPP_ECC_WIDTH  10
`define NOC_NPP_PKT_CTRL_WIDTH  (`NOC_NPP_PKT_TYPE_WIDTH + `NOC_NPP_MISC_CTRL_WIDTH + `NOC_NPP_TAG_WIDTH + `NOC_NPP_SRC_WIDTH + `NOC_NPP_DST_WIDTH + `NOC_NPP_DST_PAR_WIDTH + `NOC_NPP_PRI_WIDTH + `NOC_NPP_LAST_WIDTH + `NOC_NPP_ECC_WIDTH + `NOC_NPP_POISON_WIDTH + `NOC_NPP_TLAST_WIDTH + `NOC_NPP_DBI_WIDTH)
`define NOC_NPP_WIDTH  (`NOC_NPP_DATA_WIDTH + `NOC_NPP_PKT_CTRL_WIDTH)
`define NOC_NPP_TID_WIDTH 6
`define NOC_NPP_TDEST_WIDTH 10

// NPP bit assignment
`define NOC_NPP_AXADDR 63:0
`define NOC_NPP_AXADDR_16B 9:8
`define NOC_NPP_AXADDR_LOWER 11:0
`define NOC_NPP_AXADDR_UPPER 63:12
`define NOC_NPP_AXLEN 71:64
`define NOC_NPP_AXSIZE 74:72
`define NOC_NPP_AXBURST 76:75
`define NOC_NPP_AXLOCK 77:77
`define NOC_NPP_AXCACHE 81:78
`define NOC_NPP_AXPROT 84:82
`define NOC_NPP_AXQOS 88:85
`define NOC_NPP_AXID 104:89
`define NOC_NPP_AXUSER 120:105
`define NOC_NPP_RSVD 127:121
`define NOC_NPP_DATA 127:0
`define NOC_NPP_PKT_TYPE 131:128
`define NOC_NPP_MISC_CTRL 133:132
`define NOC_NPP_TAG 141:134
`define NOC_NPP_SRC 153:142
`define NOC_NPP_DST 165:154
`define NOC_NPP_DST_PAR 166:166
`define NOC_NPP_PRI 167:167
`define NOC_NPP_WRSTB 149:134
`define NOC_NPP_POISON 168:168
`define NOC_NPP_TLAST 169:169
`define NOC_NPP_LAST 170:170
`define NOC_NPP_DBI  171:171
`define NOC_NPP_WO_ECC 171:0
`define NOC_NPP_ECC 181:172
`define NOC_NPP_TID_L 153:150
`define NOC_NPP_TID_H 133:132
//`define NOC_NPP_STRM_SRC_H 181:172
//`define NOC_NPP_STRM_SRC_L 133:132
`define NOC_NPP_SMID 114:105
`define NOC_NPP_TDEST 181:172

`define NOC_NPP_LAST_LSB 170

`define NOC_NPP_CTRL_PKT_TYPE 3:0
`define NOC_NPP_CTRL_MISC_CTRL 5:4
`define NOC_NPP_CTRL_MISC_CTRL_LSB 4
`define NOC_NPP_CTRL_TAG 13:6
`define NOC_NPP_CTRL_TAG_LSB 6
`define NOC_NPP_CTRL_TAG_MSB 13
`define NOC_NPP_CTRL_SRC 25:14
`define NOC_NPP_CTRL_SRC_LSB 14
`define NOC_NPP_CTRL_SRC_MSB 25
`define NOC_NPP_CTRL_DST 37:26
`define NOC_NPP_CTRL_DST_LSB 26
`define NOC_NPP_CTRL_DST_MSB 37
`define NOC_NPP_CTRL_DST_PAR 38:38
`define NOC_NPP_CTRL_DST_PAR_LSB 38
`define NOC_NPP_CTRL_PRI 39:39
`define NOC_NPP_CTRL_WRSTB 21:6
`define NOC_NPP_CTRL_POISON 40:40
`define NOC_NPP_CTRL_TLAST 41:41
`define NOC_NPP_CTRL_LAST 42
`define NOC_NPP_CTRL_DBI  43:43
`define NOC_NPP_CTRL_ECC 53:44
`define NOC_NPP_CTRL_ECC_LSB 44
`define NOC_NPP_CTRL_ECC_MSB 53

// NPP field definition
`define NOC_NPP_PKT_TYPE_READ_REQ 4'd0
`define NOC_NPP_PKT_TYPE_WRITE_REQ 4'd1
`define NOC_NPP_PKT_TYPE_READ_RESP 4'd2
`define NOC_NPP_PKT_TYPE_WRITE_RESP 4'd3
`define NOC_NPP_PKT_TYPE_STRM_WRITE_REQ 4'd4


`endif
