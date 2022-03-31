/******************************************************************************
// (c) Copyright 2016 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
******************************************************************************/
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 1.0
//  \   \         Application        : NOC
//  /   /         Filename           : noc_nsu_wrapper.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : 
//  \___\/\___\
//
// Device           : Versal
// Design Name      : NSU (NoC Slave Unit)
// Purpose:
// 
//
// Reference        :
// Revision History :
//*****************************************************************************
`timescale 1ps/1ps


module bd_f29c_M01_AXI_nsu_0_top #
(
   //NSU configuration parameters
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [1:0] REG_AXI_LOOPBACK = 2'h0,
  parameter [4:0] REG_COMP_ID_INDEX0 = 5'h00,
  parameter [4:0] REG_COMP_ID_INDEX1 = 5'h01,
  parameter [0:0] REG_COMP_ID_MODE = 1'h0,
  parameter [0:0] REG_DISABLE_EX_MON = 1'h1,
  parameter [2:0] REG_DWIDTH = 3'h4,
  parameter [0:0] REG_ECC_CHK_EN = 1'h1,
  parameter [1:0] REG_FIXED_COMP_ID = 2'h0,
  parameter [1:0] REG_MODE_SELECT = 2'h0,
  parameter [0:0] REG_ODISABLE_AXI_RESP = 1'h0,
  parameter [5:0] REG_OUTSTANDING_RD_TXN = 6'h20,
  parameter [5:0] REG_OUTSTANDING_WR_TXN = 6'h20,
  parameter [0:0] REG_PAR_CHK = 1'h0,
  parameter [7:0] REG_RDTRK_VCA_TOKEN0 = 8'h10,
  parameter [7:0] REG_RDTRK_VCA_TOKEN1 = 8'h10,
  parameter [2:0] REG_RD_REQ_VC_MAP0 = 3'h0,
  parameter [2:0] REG_RD_REQ_VC_MAP1 = 3'h4,
  parameter [2:0] REG_RD_RESP_VC_MAP0 = 3'h2,
  parameter [2:0] REG_RD_RESP_VC_MAP1 = 3'h6,
  parameter [7:0] REG_RD_VCA_TOKEN0 = 8'h10,
  parameter [7:0] REG_RD_VCA_TOKEN1 = 8'h10,
  parameter [11:0] REG_SRC = 12'h000,
  parameter [3:0] REG_TBASE_AXI_TIMEOUT = 4'h2,
  parameter [3:0] REG_TBASE_TRK_TIMEOUT = 4'h2,
  parameter [7:0] REG_VMAP_OUT_RD_TOKEN0 = 8'h10,
  parameter [7:0] REG_VMAP_OUT_RD_TOKEN1 = 8'h10,
  parameter [7:0] REG_VMAP_OUT_WR_TOKEN0 = 8'h10,
  parameter [7:0] REG_VMAP_OUT_WR_TOKEN1 = 8'h10,
  parameter [7:0] REG_WRTRK_VCA_TOKEN0 = 8'h10,
  parameter [7:0] REG_WRTRK_VCA_TOKEN1 = 8'h10,
  parameter [2:0] REG_WR_REQ_VC_MAP0 = 3'h1,
  parameter [2:0] REG_WR_REQ_VC_MAP1 = 3'h5,
  parameter [2:0] REG_WR_RESP_VC_MAP0 = 3'h3,
  parameter [2:0] REG_WR_RESP_VC_MAP1 = 3'h7,
  parameter [7:0] REG_WR_VCA_TOKEN0 = 8'h10,
  parameter [7:0] REG_WR_VCA_TOKEN1 = 8'h10
) (
  output [9:0] IF_NOC_AXI_TDEST,
  output IF_NOC_AXI_WVALID,
  input IF_NOC_AXI_WREADY,
  output [0:0] IF_NOC_AXI_WLAST,
  output wire [1 : 0] IF_NOC_AXI_AWCID,
  output [128-1 :0] IF_NOC_AXI_WDATA,
  output [16-1:0] IF_NOC_AXI_WSTRB,
  output [63:0] IF_NOC_AXI_ARADDR,
  output [1:0] IF_NOC_AXI_ARBURST,
  output [3:0] IF_NOC_AXI_ARCACHE,
  output wire [1 : 0] IF_NOC_AXI_ARCID,
  output [7:0] IF_NOC_AXI_ARLEN,
  output [0:0] IF_NOC_AXI_ARLOCK,
  output [2:0] IF_NOC_AXI_ARPROT,
  output [3:0] IF_NOC_AXI_ARQOS,
  output [3:0] IF_NOC_AXI_ARREGION,
  output [2:0] IF_NOC_AXI_ARSIZE,
  output wire [17 : 0] IF_NOC_AXI_ARUSER,
  output IF_NOC_AXI_ARVALID,
  output [63:0] IF_NOC_AXI_AWADDR,
  output [1:0] IF_NOC_AXI_AWBURST,
  output [3:0] IF_NOC_AXI_AWCACHE,
  output [7:0] IF_NOC_AXI_AWLEN,
  output [0:0] IF_NOC_AXI_AWLOCK,
  output [2:0] IF_NOC_AXI_AWPROT,
  output [3:0] IF_NOC_AXI_AWQOS,
  output [3:0] IF_NOC_AXI_AWREGION,
  output [2:0] IF_NOC_AXI_AWSIZE,
  output wire [17 : 0] IF_NOC_AXI_AWUSER,
  output IF_NOC_AXI_AWVALID,
  output IF_NOC_AXI_BREADY,
  output IF_NOC_AXI_RREADY,
  output wire [16 : 0] IF_NOC_AXI_WUSER,
  input IF_NOC_AXI_ARREADY,
  input IF_NOC_AXI_AWREADY,
  input wire [1 : 0] IF_NOC_AXI_BCID,
  input [1:0] IF_NOC_AXI_BRESP,
  input IF_NOC_AXI_BVALID,
  input wire [1 : 0] IF_NOC_AXI_RCID,
  input  [128-1 :0] IF_NOC_AXI_RDATA,
  input [0:0] IF_NOC_AXI_RLAST,
  input [1:0] IF_NOC_AXI_RRESP,
  input wire [16 : 0] IF_NOC_AXI_RUSER,
  input IF_NOC_AXI_RVALID,
  output [7:0] IF_NOC_NPP_IN_NOC_CREDIT_RETURN,
  output IF_NOC_NPP_OUT_NOC_CREDIT_RDY,
  output [181:0] IF_NOC_NPP_OUT_NOC_FLIT,
  output [7:0] IF_NOC_NPP_OUT_NOC_VALID,
  input aclk,
  input IF_NOC_NPP_IN_NOC_CREDIT_RDY,
  input [181:0] IF_NOC_NPP_IN_NOC_FLIT,
  input [7:0] IF_NOC_NPP_IN_NOC_VALID,
  input [7:0] IF_NOC_NPP_OUT_NOC_CREDIT_RETURN,
  output AXI_OUT,
 
  input NSU

);

wire [7:0] IF_NOC_AXI_ARADDR_PAR;
wire [7:0] IF_NOC_AXI_AWADDR_PAR;
wire [16 -1 :0] IF_NOC_AXI_WDATA_PAR;
wire IF_NOC_AXI_WPOISON;

assign IF_NOC_AXI_ARUSER[17:10] = IF_NOC_AXI_ARADDR_PAR;
assign IF_NOC_AXI_AWUSER[17:10] = IF_NOC_AXI_AWADDR_PAR;
assign IF_NOC_AXI_WUSER[0] = IF_NOC_AXI_WPOISON;
assign IF_NOC_AXI_WUSER[16:1] = IF_NOC_AXI_WDATA_PAR;

(* DONT_TOUCH = "TRUE" *) NOC_NSU128 
#(
.REG_AXI_LOOPBACK (REG_AXI_LOOPBACK),
.REG_COMP_ID_INDEX0 (REG_COMP_ID_INDEX0),
.REG_COMP_ID_INDEX1 (REG_COMP_ID_INDEX1),
.REG_COMP_ID_MODE (REG_COMP_ID_MODE),
.REG_DISABLE_EX_MON (REG_DISABLE_EX_MON),
.REG_DWIDTH (REG_DWIDTH),
.REG_ECC_CHK_EN (REG_ECC_CHK_EN),
.REG_FIXED_COMP_ID (REG_FIXED_COMP_ID),
.REG_MODE_SELECT (REG_MODE_SELECT),
.REG_ODISABLE_AXI_RESP (REG_ODISABLE_AXI_RESP),
.REG_OUTSTANDING_RD_TXN (REG_OUTSTANDING_RD_TXN),
.REG_OUTSTANDING_WR_TXN (REG_OUTSTANDING_WR_TXN),
.REG_PAR_CHK (REG_PAR_CHK),
.REG_RDTRK_VCA_TOKEN0 (REG_RDTRK_VCA_TOKEN0),
.REG_RDTRK_VCA_TOKEN1 (REG_RDTRK_VCA_TOKEN1),
.REG_RD_REQ_VC_MAP0 (REG_RD_REQ_VC_MAP0),
.REG_RD_REQ_VC_MAP1 (REG_RD_REQ_VC_MAP1),
.REG_RD_RESP_VC_MAP0 (REG_RD_RESP_VC_MAP0),
.REG_RD_RESP_VC_MAP1 (REG_RD_RESP_VC_MAP1),
.REG_RD_VCA_TOKEN0 (REG_RD_VCA_TOKEN0),
.REG_RD_VCA_TOKEN1 (REG_RD_VCA_TOKEN1),
.REG_SRC (REG_SRC),
.REG_TBASE_AXI_TIMEOUT (REG_TBASE_AXI_TIMEOUT),
.REG_TBASE_TRK_TIMEOUT (REG_TBASE_TRK_TIMEOUT),
.REG_VMAP_OUT_RD_TOKEN0 (REG_VMAP_OUT_RD_TOKEN0),
.REG_VMAP_OUT_RD_TOKEN1 (REG_VMAP_OUT_RD_TOKEN1),
.REG_VMAP_OUT_WR_TOKEN0 (REG_VMAP_OUT_WR_TOKEN0),
.REG_VMAP_OUT_WR_TOKEN1 (REG_VMAP_OUT_WR_TOKEN1),
.REG_WRTRK_VCA_TOKEN0 (REG_WRTRK_VCA_TOKEN0),
.REG_WRTRK_VCA_TOKEN1 (REG_WRTRK_VCA_TOKEN1),
.REG_WR_REQ_VC_MAP0 (REG_WR_REQ_VC_MAP0),
.REG_WR_REQ_VC_MAP1 (REG_WR_REQ_VC_MAP1),
.REG_WR_RESP_VC_MAP0 (REG_WR_RESP_VC_MAP0),
.REG_WR_RESP_VC_MAP1 (REG_WR_RESP_VC_MAP1),
.REG_WR_VCA_TOKEN0 (REG_WR_VCA_TOKEN0),
.REG_WR_VCA_TOKEN1 (REG_WR_VCA_TOKEN1)
) NOC_NSU128_INST 
 (
.IF_NOC_AXI_TDEST (IF_NOC_AXI_TDEST),
.IF_NOC_AXI_ARADDR (IF_NOC_AXI_ARADDR),
.IF_NOC_AXI_ARBURST (IF_NOC_AXI_ARBURST),
.IF_NOC_AXI_ARCACHE (IF_NOC_AXI_ARCACHE),
.IF_NOC_AXI_ARCID (IF_NOC_AXI_ARCID),
.IF_NOC_AXI_ARLEN (IF_NOC_AXI_ARLEN),
.IF_NOC_AXI_ARLOCK (IF_NOC_AXI_ARLOCK),
.IF_NOC_AXI_ARPROT (IF_NOC_AXI_ARPROT),
.IF_NOC_AXI_ARQOS (IF_NOC_AXI_ARQOS),
.IF_NOC_AXI_ARREGION (IF_NOC_AXI_ARREGION),
.IF_NOC_AXI_ARSIZE (IF_NOC_AXI_ARSIZE),
.IF_NOC_AXI_ARUSER (IF_NOC_AXI_ARUSER[9:0]),
.IF_NOC_AXI_ARVALID (IF_NOC_AXI_ARVALID),
.IF_NOC_AXI_AWADDR (IF_NOC_AXI_AWADDR),
.IF_NOC_AXI_AWBURST (IF_NOC_AXI_AWBURST),
.IF_NOC_AXI_AWCACHE (IF_NOC_AXI_AWCACHE),
.IF_NOC_AXI_AWCID (IF_NOC_AXI_AWCID),
.IF_NOC_AXI_AWLEN (IF_NOC_AXI_AWLEN),
.IF_NOC_AXI_AWLOCK (IF_NOC_AXI_AWLOCK),
.IF_NOC_AXI_AWPROT (IF_NOC_AXI_AWPROT),
.IF_NOC_AXI_AWQOS (IF_NOC_AXI_AWQOS),
.IF_NOC_AXI_AWREGION (IF_NOC_AXI_AWREGION),
.IF_NOC_AXI_AWSIZE (IF_NOC_AXI_AWSIZE),
.IF_NOC_AXI_AWUSER (IF_NOC_AXI_AWUSER[9:0]),
.IF_NOC_AXI_AWVALID (IF_NOC_AXI_AWVALID),
.IF_NOC_AXI_BREADY (IF_NOC_AXI_BREADY),
.IF_NOC_AXI_RREADY (IF_NOC_AXI_RREADY),
.IF_NOC_AXI_WCID (),
.IF_NOC_AXI_WDATA (IF_NOC_AXI_WDATA),
.IF_NOC_AXI_WLAST (IF_NOC_AXI_WLAST),
.IF_NOC_AXI_WSTRB (IF_NOC_AXI_WSTRB),
.IF_NOC_AXI_WUSER (),
.IF_NOC_AXI_WVALID (IF_NOC_AXI_WVALID),
.IF_NOC_AXI_ARREADY (IF_NOC_AXI_ARREADY),
.IF_NOC_AXI_AWREADY (IF_NOC_AXI_AWREADY),
.IF_NOC_AXI_BCID (IF_NOC_AXI_BCID),
.IF_NOC_AXI_BRESP (IF_NOC_AXI_BRESP),
.IF_NOC_AXI_BUSER ('h0),
.IF_NOC_AXI_BVALID (IF_NOC_AXI_BVALID),
.IF_NOC_AXI_RCID (IF_NOC_AXI_RCID),
.IF_NOC_AXI_RDATA (IF_NOC_AXI_RDATA),
.IF_NOC_AXI_RLAST (IF_NOC_AXI_RLAST),
.IF_NOC_AXI_RRESP (IF_NOC_AXI_RRESP),
.IF_NOC_AXI_RUSER (17'b0),
.IF_NOC_AXI_RVALID (IF_NOC_AXI_RVALID),
.IF_NOC_AXI_WREADY (IF_NOC_AXI_WREADY),
.IF_NOC_AXI_ARSRC_INFO (),
.IF_NOC_AXI_AWID_INFO (),
.IF_NOC_AXI_WID_INFO (),
.IF_NOC_AXI_AWSRC_INFO (),
.IF_NOC_AXI_ARID_INFO (),
.IF_NOC_AXI_WSRC_INFO (),
.IF_NOC_AXI_AWADDR_PAR (IF_NOC_AXI_AWADDR_PAR),
.IF_NOC_AXI_RDATA_PAR (IF_NOC_AXI_RUSER[16:1]),
.IF_NOC_AXI_RPOISON (IF_NOC_AXI_RUSER[0]),
.IF_NOC_AXI_WDATA_PAR (IF_NOC_AXI_WDATA_PAR),
.IF_NOC_AXI_WPOISON (IF_NOC_AXI_WPOISON),
.IF_NOC_AXI_ARADDR_PAR (IF_NOC_AXI_ARADDR_PAR),
.IF_NOC_NPP_IN_NOC_CREDIT_RETURN (IF_NOC_NPP_IN_NOC_CREDIT_RETURN),
.IF_NOC_NPP_IN_NOC_CREDIT_RETURN_EN (),
.IF_NOC_NPP_OUT_NOC_CREDIT_RDY (IF_NOC_NPP_OUT_NOC_CREDIT_RDY),
.IF_NOC_NPP_OUT_NOC_FLIT (IF_NOC_NPP_OUT_NOC_FLIT),
.IF_NOC_NPP_OUT_NOC_FLIT_EN (),
.IF_NOC_NPP_OUT_NOC_VALID (IF_NOC_NPP_OUT_NOC_VALID),
.IF_NOC_NPP_OUT_NOC_VALID_EN (),
.CLK (aclk),
.IF_NOC_NPP_IN_NOC_CREDIT_RDY (IF_NOC_NPP_IN_NOC_CREDIT_RDY),
.IF_NOC_NPP_IN_NOC_FLIT (IF_NOC_NPP_IN_NOC_FLIT),
.IF_NOC_NPP_IN_NOC_FLIT_EN (1'b1),
.IF_NOC_NPP_IN_NOC_VALID (IF_NOC_NPP_IN_NOC_VALID),
.IF_NOC_NPP_IN_NOC_VALID_EN (1'b1),
.IF_NOC_NPP_OUT_NOC_CREDIT_RETURN (IF_NOC_NPP_OUT_NOC_CREDIT_RETURN),
.IF_NOC_NPP_OUT_NOC_CREDIT_RETURN_EN (1'b1),
.AXI_OUT(AXI_OUT),
 
.NSU (NSU),
.NSU_USR_INTERRUPT_IN (4'b0)
);

//synthesis translate_off
defparam NOC_NSU128_INST.BM_NOC_NSU128_INST.IP_NAME = "bd_f29c_M01_AXI_nsu_0";
defparam NOC_NSU128_INST.BM_NOC_NSU128_INST.REG_FILE = "nocattrs.dat";
defparam NOC_NSU128_INST.BM_NOC_NSU128_INST.NOC_CLK_FREQ = 1000;
//synthesis translate_on

endmodule

