// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
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


//------------------------------------------------------------------------------------
// Filename:    bd_f29c_M01_AXI_nsu_0_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//   Aldec Riviera-PRO Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module bd_f29c_M01_AXI_nsu_0 (
  output bit [63 : 0] IF_NOC_AXI_ARADDR,
  output bit [1 : 0] IF_NOC_AXI_ARBURST,
  output bit [3 : 0] IF_NOC_AXI_ARCACHE,
  output bit [1 : 0] IF_NOC_AXI_ARCID,
  output bit [7 : 0] IF_NOC_AXI_ARLEN,
  output bit [0 : 0] IF_NOC_AXI_ARLOCK,
  output bit [2 : 0] IF_NOC_AXI_ARPROT,
  output bit [3 : 0] IF_NOC_AXI_ARQOS,
  output bit [3 : 0] IF_NOC_AXI_ARREGION,
  output bit [2 : 0] IF_NOC_AXI_ARSIZE,
  output bit [17 : 0] IF_NOC_AXI_ARUSER,
  output bit_as_bool IF_NOC_AXI_ARVALID,
  output bit [63 : 0] IF_NOC_AXI_AWADDR,
  output bit [1 : 0] IF_NOC_AXI_AWBURST,
  output bit [3 : 0] IF_NOC_AXI_AWCACHE,
  output bit [1 : 0] IF_NOC_AXI_AWCID,
  output bit [7 : 0] IF_NOC_AXI_AWLEN,
  output bit [0 : 0] IF_NOC_AXI_AWLOCK,
  output bit [2 : 0] IF_NOC_AXI_AWPROT,
  output bit [3 : 0] IF_NOC_AXI_AWQOS,
  output bit [3 : 0] IF_NOC_AXI_AWREGION,
  output bit [2 : 0] IF_NOC_AXI_AWSIZE,
  output bit [17 : 0] IF_NOC_AXI_AWUSER,
  output bit_as_bool IF_NOC_AXI_AWVALID,
  output bit_as_bool IF_NOC_AXI_BREADY,
  output bit_as_bool IF_NOC_AXI_RREADY,
  output bit [127 : 0] IF_NOC_AXI_WDATA,
  output bit [0 : 0] IF_NOC_AXI_WLAST,
  output bit [15 : 0] IF_NOC_AXI_WSTRB,
  output bit [16 : 0] IF_NOC_AXI_WUSER,
  output bit_as_bool IF_NOC_AXI_WVALID,
  input bit_as_bool IF_NOC_AXI_ARREADY,
  input bit_as_bool IF_NOC_AXI_AWREADY,
  input bit [1 : 0] IF_NOC_AXI_BCID,
  input bit [1 : 0] IF_NOC_AXI_BRESP,
  input bit_as_bool IF_NOC_AXI_BVALID,
  input bit [1 : 0] IF_NOC_AXI_RCID,
  input bit [127 : 0] IF_NOC_AXI_RDATA,
  input bit [0 : 0] IF_NOC_AXI_RLAST,
  input bit [1 : 0] IF_NOC_AXI_RRESP,
  input bit [16 : 0] IF_NOC_AXI_RUSER,
  input bit_as_bool IF_NOC_AXI_RVALID,
  input bit_as_bool IF_NOC_AXI_WREADY,
  output bit [7 : 0] IF_NOC_NPP_IN_NOC_CREDIT_RETURN,
  output bit_as_bool IF_NOC_NPP_OUT_NOC_CREDIT_RDY,
  output bit [181 : 0] IF_NOC_NPP_OUT_NOC_FLIT,
  output bit [7 : 0] IF_NOC_NPP_OUT_NOC_VALID,
  input bit_as_bool aclk,
  input bit_as_bool IF_NOC_NPP_IN_NOC_CREDIT_RDY,
  input bit [181 : 0] IF_NOC_NPP_IN_NOC_FLIT,
  input bit [7 : 0] IF_NOC_NPP_IN_NOC_VALID,
  input bit [7 : 0] IF_NOC_NPP_OUT_NOC_CREDIT_RETURN,
  input bit_as_bool NSU,
  output bit_as_bool AXI_OUT
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module bd_f29c_M01_AXI_nsu_0 (IF_NOC_AXI_ARADDR,IF_NOC_AXI_ARBURST,IF_NOC_AXI_ARCACHE,IF_NOC_AXI_ARCID,IF_NOC_AXI_ARLEN,IF_NOC_AXI_ARLOCK,IF_NOC_AXI_ARPROT,IF_NOC_AXI_ARQOS,IF_NOC_AXI_ARREGION,IF_NOC_AXI_ARSIZE,IF_NOC_AXI_ARUSER,IF_NOC_AXI_ARVALID,IF_NOC_AXI_AWADDR,IF_NOC_AXI_AWBURST,IF_NOC_AXI_AWCACHE,IF_NOC_AXI_AWCID,IF_NOC_AXI_AWLEN,IF_NOC_AXI_AWLOCK,IF_NOC_AXI_AWPROT,IF_NOC_AXI_AWQOS,IF_NOC_AXI_AWREGION,IF_NOC_AXI_AWSIZE,IF_NOC_AXI_AWUSER,IF_NOC_AXI_AWVALID,IF_NOC_AXI_BREADY,IF_NOC_AXI_RREADY,IF_NOC_AXI_WDATA,IF_NOC_AXI_WLAST,IF_NOC_AXI_WSTRB,IF_NOC_AXI_WUSER,IF_NOC_AXI_WVALID,IF_NOC_AXI_ARREADY,IF_NOC_AXI_AWREADY,IF_NOC_AXI_BCID,IF_NOC_AXI_BRESP,IF_NOC_AXI_BVALID,IF_NOC_AXI_RCID,IF_NOC_AXI_RDATA,IF_NOC_AXI_RLAST,IF_NOC_AXI_RRESP,IF_NOC_AXI_RUSER,IF_NOC_AXI_RVALID,IF_NOC_AXI_WREADY,IF_NOC_NPP_IN_NOC_CREDIT_RETURN,IF_NOC_NPP_OUT_NOC_CREDIT_RDY,IF_NOC_NPP_OUT_NOC_FLIT,IF_NOC_NPP_OUT_NOC_VALID,aclk,IF_NOC_NPP_IN_NOC_CREDIT_RDY,IF_NOC_NPP_IN_NOC_FLIT,IF_NOC_NPP_IN_NOC_VALID,IF_NOC_NPP_OUT_NOC_CREDIT_RETURN,NSU,AXI_OUT)
(* integer foreign = "SystemC";
*);
  output wire [63 : 0] IF_NOC_AXI_ARADDR;
  output wire [1 : 0] IF_NOC_AXI_ARBURST;
  output wire [3 : 0] IF_NOC_AXI_ARCACHE;
  output wire [1 : 0] IF_NOC_AXI_ARCID;
  output wire [7 : 0] IF_NOC_AXI_ARLEN;
  output wire [0 : 0] IF_NOC_AXI_ARLOCK;
  output wire [2 : 0] IF_NOC_AXI_ARPROT;
  output wire [3 : 0] IF_NOC_AXI_ARQOS;
  output wire [3 : 0] IF_NOC_AXI_ARREGION;
  output wire [2 : 0] IF_NOC_AXI_ARSIZE;
  output wire [17 : 0] IF_NOC_AXI_ARUSER;
  output wire IF_NOC_AXI_ARVALID;
  output wire [63 : 0] IF_NOC_AXI_AWADDR;
  output wire [1 : 0] IF_NOC_AXI_AWBURST;
  output wire [3 : 0] IF_NOC_AXI_AWCACHE;
  output wire [1 : 0] IF_NOC_AXI_AWCID;
  output wire [7 : 0] IF_NOC_AXI_AWLEN;
  output wire [0 : 0] IF_NOC_AXI_AWLOCK;
  output wire [2 : 0] IF_NOC_AXI_AWPROT;
  output wire [3 : 0] IF_NOC_AXI_AWQOS;
  output wire [3 : 0] IF_NOC_AXI_AWREGION;
  output wire [2 : 0] IF_NOC_AXI_AWSIZE;
  output wire [17 : 0] IF_NOC_AXI_AWUSER;
  output wire IF_NOC_AXI_AWVALID;
  output wire IF_NOC_AXI_BREADY;
  output wire IF_NOC_AXI_RREADY;
  output wire [127 : 0] IF_NOC_AXI_WDATA;
  output wire [0 : 0] IF_NOC_AXI_WLAST;
  output wire [15 : 0] IF_NOC_AXI_WSTRB;
  output wire [16 : 0] IF_NOC_AXI_WUSER;
  output wire IF_NOC_AXI_WVALID;
  input bit IF_NOC_AXI_ARREADY;
  input bit IF_NOC_AXI_AWREADY;
  input bit [1 : 0] IF_NOC_AXI_BCID;
  input bit [1 : 0] IF_NOC_AXI_BRESP;
  input bit IF_NOC_AXI_BVALID;
  input bit [1 : 0] IF_NOC_AXI_RCID;
  input bit [127 : 0] IF_NOC_AXI_RDATA;
  input bit [0 : 0] IF_NOC_AXI_RLAST;
  input bit [1 : 0] IF_NOC_AXI_RRESP;
  input bit [16 : 0] IF_NOC_AXI_RUSER;
  input bit IF_NOC_AXI_RVALID;
  input bit IF_NOC_AXI_WREADY;
  output wire [7 : 0] IF_NOC_NPP_IN_NOC_CREDIT_RETURN;
  output wire IF_NOC_NPP_OUT_NOC_CREDIT_RDY;
  output wire [181 : 0] IF_NOC_NPP_OUT_NOC_FLIT;
  output wire [7 : 0] IF_NOC_NPP_OUT_NOC_VALID;
  input bit aclk;
  input bit IF_NOC_NPP_IN_NOC_CREDIT_RDY;
  input bit [181 : 0] IF_NOC_NPP_IN_NOC_FLIT;
  input bit [7 : 0] IF_NOC_NPP_IN_NOC_VALID;
  input bit [7 : 0] IF_NOC_NPP_OUT_NOC_CREDIT_RETURN;
  input bit NSU;
  output wire AXI_OUT;
endmodule
`endif

`ifdef RIVIERA
(* SC_MODULE_EXPORT *)
module bd_f29c_M01_AXI_nsu_0 (IF_NOC_AXI_ARADDR,IF_NOC_AXI_ARBURST,IF_NOC_AXI_ARCACHE,IF_NOC_AXI_ARCID,IF_NOC_AXI_ARLEN,IF_NOC_AXI_ARLOCK,IF_NOC_AXI_ARPROT,IF_NOC_AXI_ARQOS,IF_NOC_AXI_ARREGION,IF_NOC_AXI_ARSIZE,IF_NOC_AXI_ARUSER,IF_NOC_AXI_ARVALID,IF_NOC_AXI_AWADDR,IF_NOC_AXI_AWBURST,IF_NOC_AXI_AWCACHE,IF_NOC_AXI_AWCID,IF_NOC_AXI_AWLEN,IF_NOC_AXI_AWLOCK,IF_NOC_AXI_AWPROT,IF_NOC_AXI_AWQOS,IF_NOC_AXI_AWREGION,IF_NOC_AXI_AWSIZE,IF_NOC_AXI_AWUSER,IF_NOC_AXI_AWVALID,IF_NOC_AXI_BREADY,IF_NOC_AXI_RREADY,IF_NOC_AXI_WDATA,IF_NOC_AXI_WLAST,IF_NOC_AXI_WSTRB,IF_NOC_AXI_WUSER,IF_NOC_AXI_WVALID,IF_NOC_AXI_ARREADY,IF_NOC_AXI_AWREADY,IF_NOC_AXI_BCID,IF_NOC_AXI_BRESP,IF_NOC_AXI_BVALID,IF_NOC_AXI_RCID,IF_NOC_AXI_RDATA,IF_NOC_AXI_RLAST,IF_NOC_AXI_RRESP,IF_NOC_AXI_RUSER,IF_NOC_AXI_RVALID,IF_NOC_AXI_WREADY,IF_NOC_NPP_IN_NOC_CREDIT_RETURN,IF_NOC_NPP_OUT_NOC_CREDIT_RDY,IF_NOC_NPP_OUT_NOC_FLIT,IF_NOC_NPP_OUT_NOC_VALID,aclk,IF_NOC_NPP_IN_NOC_CREDIT_RDY,IF_NOC_NPP_IN_NOC_FLIT,IF_NOC_NPP_IN_NOC_VALID,IF_NOC_NPP_OUT_NOC_CREDIT_RETURN,NSU,AXI_OUT)
  output wire [63 : 0] IF_NOC_AXI_ARADDR;
  output wire [1 : 0] IF_NOC_AXI_ARBURST;
  output wire [3 : 0] IF_NOC_AXI_ARCACHE;
  output wire [1 : 0] IF_NOC_AXI_ARCID;
  output wire [7 : 0] IF_NOC_AXI_ARLEN;
  output wire [0 : 0] IF_NOC_AXI_ARLOCK;
  output wire [2 : 0] IF_NOC_AXI_ARPROT;
  output wire [3 : 0] IF_NOC_AXI_ARQOS;
  output wire [3 : 0] IF_NOC_AXI_ARREGION;
  output wire [2 : 0] IF_NOC_AXI_ARSIZE;
  output wire [17 : 0] IF_NOC_AXI_ARUSER;
  output wire IF_NOC_AXI_ARVALID;
  output wire [63 : 0] IF_NOC_AXI_AWADDR;
  output wire [1 : 0] IF_NOC_AXI_AWBURST;
  output wire [3 : 0] IF_NOC_AXI_AWCACHE;
  output wire [1 : 0] IF_NOC_AXI_AWCID;
  output wire [7 : 0] IF_NOC_AXI_AWLEN;
  output wire [0 : 0] IF_NOC_AXI_AWLOCK;
  output wire [2 : 0] IF_NOC_AXI_AWPROT;
  output wire [3 : 0] IF_NOC_AXI_AWQOS;
  output wire [3 : 0] IF_NOC_AXI_AWREGION;
  output wire [2 : 0] IF_NOC_AXI_AWSIZE;
  output wire [17 : 0] IF_NOC_AXI_AWUSER;
  output wire IF_NOC_AXI_AWVALID;
  output wire IF_NOC_AXI_BREADY;
  output wire IF_NOC_AXI_RREADY;
  output wire [127 : 0] IF_NOC_AXI_WDATA;
  output wire [0 : 0] IF_NOC_AXI_WLAST;
  output wire [15 : 0] IF_NOC_AXI_WSTRB;
  output wire [16 : 0] IF_NOC_AXI_WUSER;
  output wire IF_NOC_AXI_WVALID;
  input bit IF_NOC_AXI_ARREADY;
  input bit IF_NOC_AXI_AWREADY;
  input bit [1 : 0] IF_NOC_AXI_BCID;
  input bit [1 : 0] IF_NOC_AXI_BRESP;
  input bit IF_NOC_AXI_BVALID;
  input bit [1 : 0] IF_NOC_AXI_RCID;
  input bit [127 : 0] IF_NOC_AXI_RDATA;
  input bit [0 : 0] IF_NOC_AXI_RLAST;
  input bit [1 : 0] IF_NOC_AXI_RRESP;
  input bit [16 : 0] IF_NOC_AXI_RUSER;
  input bit IF_NOC_AXI_RVALID;
  input bit IF_NOC_AXI_WREADY;
  output wire [7 : 0] IF_NOC_NPP_IN_NOC_CREDIT_RETURN;
  output wire IF_NOC_NPP_OUT_NOC_CREDIT_RDY;
  output wire [181 : 0] IF_NOC_NPP_OUT_NOC_FLIT;
  output wire [7 : 0] IF_NOC_NPP_OUT_NOC_VALID;
  input bit aclk;
  input bit IF_NOC_NPP_IN_NOC_CREDIT_RDY;
  input bit [181 : 0] IF_NOC_NPP_IN_NOC_FLIT;
  input bit [7 : 0] IF_NOC_NPP_IN_NOC_VALID;
  input bit [7 : 0] IF_NOC_NPP_OUT_NOC_CREDIT_RETURN;
  input bit NSU;
  output wire AXI_OUT;
endmodule
`endif
