
/////////////////////////////////////////////////////////////////
// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
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
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:noc_nsu:1.0
// IP Revision: 0
(* X_CORE_INFO = "noc_nsu_v1_0_0_0,Vivado 2018.1.0" *)
(* CHECK_LICENSE_TYPE = "noc_nsu_0,noc_nsu_v1_0_0_0,{}" *)

(* DowngradeIPIdentifiedWarnings = "yes" *)

`timescale 1ps/1ps
module bd_f29c_M01_AXI_nsu_0 
  (
  IF_NOC_AXI_ARADDR,
  IF_NOC_AXI_ARBURST,
  IF_NOC_AXI_ARCACHE,
  IF_NOC_AXI_ARCID,
  IF_NOC_AXI_ARLEN,
  IF_NOC_AXI_ARLOCK,
  IF_NOC_AXI_ARPROT,
  IF_NOC_AXI_ARQOS,
  IF_NOC_AXI_ARREGION,
  IF_NOC_AXI_ARSIZE,
  IF_NOC_AXI_ARUSER,
  IF_NOC_AXI_ARVALID,
  IF_NOC_AXI_AWADDR,
  IF_NOC_AXI_AWBURST,
  IF_NOC_AXI_AWCACHE,
  IF_NOC_AXI_AWCID,
  IF_NOC_AXI_AWLEN,
  IF_NOC_AXI_AWLOCK,
  IF_NOC_AXI_AWPROT,
  IF_NOC_AXI_AWQOS,
  IF_NOC_AXI_AWREGION,
  IF_NOC_AXI_AWSIZE,
  IF_NOC_AXI_AWUSER,
  IF_NOC_AXI_AWVALID,
  IF_NOC_AXI_BREADY,
  IF_NOC_AXI_RREADY,
  IF_NOC_AXI_WDATA,
  IF_NOC_AXI_WLAST,
  IF_NOC_AXI_WSTRB,
  IF_NOC_AXI_WUSER,
  IF_NOC_AXI_WVALID,
  IF_NOC_AXI_ARREADY,
  IF_NOC_AXI_AWREADY,
  IF_NOC_AXI_BCID,
  IF_NOC_AXI_BRESP,
  IF_NOC_AXI_BVALID,
  IF_NOC_AXI_RCID,
  IF_NOC_AXI_RDATA,
  IF_NOC_AXI_RLAST,
  IF_NOC_AXI_RRESP,
  IF_NOC_AXI_RUSER,
  IF_NOC_AXI_RVALID,
  IF_NOC_AXI_WREADY,
  IF_NOC_NPP_IN_NOC_CREDIT_RETURN,
  IF_NOC_NPP_OUT_NOC_CREDIT_RDY,
  IF_NOC_NPP_OUT_NOC_FLIT,
  IF_NOC_NPP_OUT_NOC_VALID,
  aclk,
  IF_NOC_NPP_IN_NOC_CREDIT_RDY,
  IF_NOC_NPP_IN_NOC_FLIT,
  IF_NOC_NPP_IN_NOC_VALID,
  IF_NOC_NPP_OUT_NOC_CREDIT_RETURN,
  AXI_OUT,
  NSU
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARADDR" *)
output wire [63 : 0] IF_NOC_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARBURST" *)
output wire [1 : 0] IF_NOC_AXI_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARCACHE" *)
output wire [3 : 0] IF_NOC_AXI_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARID" *)
output wire [1 : 0] IF_NOC_AXI_ARCID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARLEN" *)
output wire [7 : 0] IF_NOC_AXI_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARLOCK" *)
output wire [0 : 0] IF_NOC_AXI_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARPROT" *)
output wire [2 : 0] IF_NOC_AXI_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARQOS" *)
output wire [3 : 0] IF_NOC_AXI_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARREGION" *)
output wire [3 : 0] IF_NOC_AXI_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARSIZE" *)
output wire [2 : 0] IF_NOC_AXI_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARUSER" *)
output wire [17 : 0] IF_NOC_AXI_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARVALID" *)
output wire IF_NOC_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWADDR" *)
output wire [63 : 0] IF_NOC_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWBURST" *)
output wire [1 : 0] IF_NOC_AXI_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWCACHE" *)
output wire [3 : 0] IF_NOC_AXI_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWID" *)
output wire [1 : 0] IF_NOC_AXI_AWCID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWLEN" *)
output wire [7 : 0] IF_NOC_AXI_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWLOCK" *)
output wire [0 : 0] IF_NOC_AXI_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWPROT" *)
output wire [2 : 0] IF_NOC_AXI_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWQOS" *)
output wire [3 : 0] IF_NOC_AXI_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWREGION" *)
output wire [3 : 0] IF_NOC_AXI_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWSIZE" *)
output wire [2 : 0] IF_NOC_AXI_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWUSER" *)
output wire [17 : 0] IF_NOC_AXI_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWVALID" *)
output wire IF_NOC_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 BREADY" *)
output wire IF_NOC_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RREADY" *)
output wire IF_NOC_AXI_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 WDATA" *)
output wire [128 -1 :0] IF_NOC_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 WLAST" *)
output wire [0 : 0] IF_NOC_AXI_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 WSTRB" *)
output wire [16 -1:0] IF_NOC_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 WUSER" *)
output wire [16 : 0] IF_NOC_AXI_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 WVALID" *)
output wire IF_NOC_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 ARREADY" *)
input wire IF_NOC_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 AWREADY" *)
input wire IF_NOC_AXI_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 BID" *)
input wire [1 : 0] IF_NOC_AXI_BCID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 BRESP" *)
input wire [1 : 0] IF_NOC_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 BVALID" *)
input wire IF_NOC_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RID" *)
input wire [1 : 0] IF_NOC_AXI_RCID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RDATA" *)
input wire [128 -1 :0] IF_NOC_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RLAST" *)
input wire [0 : 0] IF_NOC_AXI_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RRESP" *)
input wire [1 : 0] IF_NOC_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RUSER" *)
input wire [16 : 0] IF_NOC_AXI_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 RVALID" *)
input wire IF_NOC_AXI_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MAXI4 WREADY" *)
input wire IF_NOC_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP CREDIT_RETURN" *)
output wire [7 : 0] IF_NOC_NPP_IN_NOC_CREDIT_RETURN;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP CREDIT_RDY" *)
output wire IF_NOC_NPP_OUT_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP FLIT" *)
output wire [181 : 0] IF_NOC_NPP_OUT_NOC_FLIT;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP VALID" *)
output wire [7 : 0] IF_NOC_NPP_OUT_NOC_VALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF MAXI4:MAXI_STREAM, FREQ_HZ 100000000, PHASE 0.000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP CREDIT_RDY" *)
input wire IF_NOC_NPP_IN_NOC_CREDIT_RDY;
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP FLIT" *)
input wire [181 : 0] IF_NOC_NPP_IN_NOC_FLIT;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SNPP, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 SNPP VALID" *)
input wire [7 : 0] IF_NOC_NPP_IN_NOC_VALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME MNPP, IN_SYNTHESIS_HDL NO, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:npp:1.0 MNPP CREDIT_RETURN" *)
input wire [7 : 0] IF_NOC_NPP_OUT_NOC_CREDIT_RETURN;
(* DONT_TOUCH = "TRUE" *) input NSU;
output AXI_OUT;

bd_f29c_M01_AXI_nsu_0_top #
(
.REG_AXI_LOOPBACK ('H0),
.REG_COMP_ID_INDEX0 ('H00),
.REG_COMP_ID_INDEX1 ('H01),
.REG_COMP_ID_MODE ('H0),
.REG_DISABLE_EX_MON ('H1),
.REG_DWIDTH ('H4),
.REG_ECC_CHK_EN ('H1),
.REG_FIXED_COMP_ID ('H0),
.REG_MODE_SELECT ('H0),
.REG_ODISABLE_AXI_RESP ('H0),
.REG_OUTSTANDING_RD_TXN ('H20),
.REG_OUTSTANDING_WR_TXN ('H20),
.REG_PAR_CHK ('H0),
.REG_RDTRK_VCA_TOKEN0 ('H10),
.REG_RDTRK_VCA_TOKEN1 ('H10),
.REG_RD_REQ_VC_MAP0 ('H4),
.REG_RD_REQ_VC_MAP1 ('H0),
.REG_RD_RESP_VC_MAP0 ('H6),
.REG_RD_RESP_VC_MAP1 ('H2),
.REG_RD_VCA_TOKEN0 ('H10),
.REG_RD_VCA_TOKEN1 ('H10),
.REG_SRC ('H040),
.REG_TBASE_AXI_TIMEOUT ('H2),
.REG_TBASE_TRK_TIMEOUT ('H2),
.REG_VMAP_OUT_RD_TOKEN0 ('H10),
.REG_VMAP_OUT_RD_TOKEN1 ('H10),
.REG_VMAP_OUT_WR_TOKEN0 ('H10),
.REG_VMAP_OUT_WR_TOKEN1 ('H10),
.REG_WRTRK_VCA_TOKEN0 ('H10),
.REG_WRTRK_VCA_TOKEN1 ('H10),
.REG_WR_REQ_VC_MAP0 ('H5),
.REG_WR_REQ_VC_MAP1 ('H1),
.REG_WR_RESP_VC_MAP0 ('H7),
.REG_WR_RESP_VC_MAP1 ('H3),
.REG_WR_VCA_TOKEN0 ('H10),
.REG_WR_VCA_TOKEN1 ('H10)
) bd_f29c_M01_AXI_nsu_0_top_INST (
.IF_NOC_AXI_ARADDR(IF_NOC_AXI_ARADDR),
.IF_NOC_AXI_ARBURST(IF_NOC_AXI_ARBURST),
.IF_NOC_AXI_ARCACHE(IF_NOC_AXI_ARCACHE),
.IF_NOC_AXI_ARCID(IF_NOC_AXI_ARCID),
.IF_NOC_AXI_ARLEN(IF_NOC_AXI_ARLEN),
.IF_NOC_AXI_ARLOCK(IF_NOC_AXI_ARLOCK),
.IF_NOC_AXI_ARPROT(IF_NOC_AXI_ARPROT),
.IF_NOC_AXI_ARQOS(IF_NOC_AXI_ARQOS),
.IF_NOC_AXI_ARREGION(IF_NOC_AXI_ARREGION),
.IF_NOC_AXI_ARSIZE(IF_NOC_AXI_ARSIZE),
.IF_NOC_AXI_ARUSER(IF_NOC_AXI_ARUSER),
.IF_NOC_AXI_ARVALID(IF_NOC_AXI_ARVALID),
.IF_NOC_AXI_AWADDR(IF_NOC_AXI_AWADDR),
.IF_NOC_AXI_AWBURST(IF_NOC_AXI_AWBURST),
.IF_NOC_AXI_AWCACHE(IF_NOC_AXI_AWCACHE),
.IF_NOC_AXI_AWCID(IF_NOC_AXI_AWCID),
.IF_NOC_AXI_AWLEN(IF_NOC_AXI_AWLEN),
.IF_NOC_AXI_AWLOCK(IF_NOC_AXI_AWLOCK),
.IF_NOC_AXI_AWPROT(IF_NOC_AXI_AWPROT),
.IF_NOC_AXI_AWQOS(IF_NOC_AXI_AWQOS),
.IF_NOC_AXI_AWREGION(IF_NOC_AXI_AWREGION),
.IF_NOC_AXI_AWSIZE(IF_NOC_AXI_AWSIZE),
.IF_NOC_AXI_AWUSER(IF_NOC_AXI_AWUSER),
.IF_NOC_AXI_AWVALID(IF_NOC_AXI_AWVALID),
.IF_NOC_AXI_BREADY(IF_NOC_AXI_BREADY),
.IF_NOC_AXI_RREADY(IF_NOC_AXI_RREADY),
.IF_NOC_AXI_WDATA(IF_NOC_AXI_WDATA),
.IF_NOC_AXI_WLAST(IF_NOC_AXI_WLAST),
.IF_NOC_AXI_WSTRB(IF_NOC_AXI_WSTRB),
.IF_NOC_AXI_WUSER(IF_NOC_AXI_WUSER),
.IF_NOC_AXI_WVALID(IF_NOC_AXI_WVALID),
.IF_NOC_AXI_ARREADY(IF_NOC_AXI_ARREADY),
.IF_NOC_AXI_AWREADY(IF_NOC_AXI_AWREADY),
.IF_NOC_AXI_BCID(IF_NOC_AXI_BCID),
.IF_NOC_AXI_BRESP(IF_NOC_AXI_BRESP),
.IF_NOC_AXI_BVALID(IF_NOC_AXI_BVALID),
.IF_NOC_AXI_RCID(IF_NOC_AXI_RCID),
.IF_NOC_AXI_RDATA(IF_NOC_AXI_RDATA),
.IF_NOC_AXI_RLAST(IF_NOC_AXI_RLAST),
.IF_NOC_AXI_RRESP(IF_NOC_AXI_RRESP),
.IF_NOC_AXI_RUSER(IF_NOC_AXI_RUSER),
.IF_NOC_AXI_RVALID(IF_NOC_AXI_RVALID),
.IF_NOC_AXI_WREADY(IF_NOC_AXI_WREADY),
.IF_NOC_AXI_TDEST(IF_NOC_AXI_TDEST),
.IF_NOC_NPP_IN_NOC_CREDIT_RETURN(IF_NOC_NPP_IN_NOC_CREDIT_RETURN),
.IF_NOC_NPP_OUT_NOC_CREDIT_RDY(IF_NOC_NPP_OUT_NOC_CREDIT_RDY),
.IF_NOC_NPP_OUT_NOC_FLIT(IF_NOC_NPP_OUT_NOC_FLIT),
.IF_NOC_NPP_OUT_NOC_VALID(IF_NOC_NPP_OUT_NOC_VALID),
.aclk(aclk),
.IF_NOC_NPP_IN_NOC_CREDIT_RDY(IF_NOC_NPP_IN_NOC_CREDIT_RDY),
.IF_NOC_NPP_IN_NOC_FLIT(IF_NOC_NPP_IN_NOC_FLIT),
.IF_NOC_NPP_IN_NOC_VALID(IF_NOC_NPP_IN_NOC_VALID),
.IF_NOC_NPP_OUT_NOC_CREDIT_RETURN(IF_NOC_NPP_OUT_NOC_CREDIT_RETURN),
.AXI_OUT(AXI_OUT),
.NSU(NSU)

);

endmodule

