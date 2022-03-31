//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_a7b3_wrapper.bd
//Design : bd_a7b3_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_a7b3_wrapper
   (SLOT_0_AXI_araddr,
    SLOT_0_AXI_arburst,
    SLOT_0_AXI_arcache,
    SLOT_0_AXI_arid,
    SLOT_0_AXI_arlen,
    SLOT_0_AXI_arlock,
    SLOT_0_AXI_arprot,
    SLOT_0_AXI_arqos,
    SLOT_0_AXI_arready,
    SLOT_0_AXI_arregion,
    SLOT_0_AXI_arsize,
    SLOT_0_AXI_aruser,
    SLOT_0_AXI_arvalid,
    SLOT_0_AXI_awaddr,
    SLOT_0_AXI_awburst,
    SLOT_0_AXI_awcache,
    SLOT_0_AXI_awid,
    SLOT_0_AXI_awlen,
    SLOT_0_AXI_awlock,
    SLOT_0_AXI_awprot,
    SLOT_0_AXI_awqos,
    SLOT_0_AXI_awready,
    SLOT_0_AXI_awregion,
    SLOT_0_AXI_awsize,
    SLOT_0_AXI_awuser,
    SLOT_0_AXI_awvalid,
    SLOT_0_AXI_bid,
    SLOT_0_AXI_bready,
    SLOT_0_AXI_bresp,
    SLOT_0_AXI_bvalid,
    SLOT_0_AXI_rdata,
    SLOT_0_AXI_rid,
    SLOT_0_AXI_rlast,
    SLOT_0_AXI_rready,
    SLOT_0_AXI_rresp,
    SLOT_0_AXI_rvalid,
    SLOT_0_AXI_wdata,
    SLOT_0_AXI_wlast,
    SLOT_0_AXI_wready,
    SLOT_0_AXI_wstrb,
    SLOT_0_AXI_wvalid,
    clk,
    resetn);
  input [63:0]SLOT_0_AXI_araddr;
  input [1:0]SLOT_0_AXI_arburst;
  input [3:0]SLOT_0_AXI_arcache;
  input [1:0]SLOT_0_AXI_arid;
  input [7:0]SLOT_0_AXI_arlen;
  input [0:0]SLOT_0_AXI_arlock;
  input [2:0]SLOT_0_AXI_arprot;
  input [3:0]SLOT_0_AXI_arqos;
  input [0:0]SLOT_0_AXI_arready;
  input [3:0]SLOT_0_AXI_arregion;
  input [2:0]SLOT_0_AXI_arsize;
  input [17:0]SLOT_0_AXI_aruser;
  input [0:0]SLOT_0_AXI_arvalid;
  input [63:0]SLOT_0_AXI_awaddr;
  input [1:0]SLOT_0_AXI_awburst;
  input [3:0]SLOT_0_AXI_awcache;
  input [1:0]SLOT_0_AXI_awid;
  input [7:0]SLOT_0_AXI_awlen;
  input [0:0]SLOT_0_AXI_awlock;
  input [2:0]SLOT_0_AXI_awprot;
  input [3:0]SLOT_0_AXI_awqos;
  input [0:0]SLOT_0_AXI_awready;
  input [3:0]SLOT_0_AXI_awregion;
  input [2:0]SLOT_0_AXI_awsize;
  input [17:0]SLOT_0_AXI_awuser;
  input [0:0]SLOT_0_AXI_awvalid;
  input [1:0]SLOT_0_AXI_bid;
  input [0:0]SLOT_0_AXI_bready;
  input [1:0]SLOT_0_AXI_bresp;
  input [0:0]SLOT_0_AXI_bvalid;
  input [31:0]SLOT_0_AXI_rdata;
  input [1:0]SLOT_0_AXI_rid;
  input [0:0]SLOT_0_AXI_rlast;
  input [0:0]SLOT_0_AXI_rready;
  input [1:0]SLOT_0_AXI_rresp;
  input [0:0]SLOT_0_AXI_rvalid;
  input [31:0]SLOT_0_AXI_wdata;
  input [0:0]SLOT_0_AXI_wlast;
  input [0:0]SLOT_0_AXI_wready;
  input [3:0]SLOT_0_AXI_wstrb;
  input [0:0]SLOT_0_AXI_wvalid;
  input clk;
  input resetn;

  wire [63:0]SLOT_0_AXI_araddr;
  wire [1:0]SLOT_0_AXI_arburst;
  wire [3:0]SLOT_0_AXI_arcache;
  wire [1:0]SLOT_0_AXI_arid;
  wire [7:0]SLOT_0_AXI_arlen;
  wire [0:0]SLOT_0_AXI_arlock;
  wire [2:0]SLOT_0_AXI_arprot;
  wire [3:0]SLOT_0_AXI_arqos;
  wire [0:0]SLOT_0_AXI_arready;
  wire [3:0]SLOT_0_AXI_arregion;
  wire [2:0]SLOT_0_AXI_arsize;
  wire [17:0]SLOT_0_AXI_aruser;
  wire [0:0]SLOT_0_AXI_arvalid;
  wire [63:0]SLOT_0_AXI_awaddr;
  wire [1:0]SLOT_0_AXI_awburst;
  wire [3:0]SLOT_0_AXI_awcache;
  wire [1:0]SLOT_0_AXI_awid;
  wire [7:0]SLOT_0_AXI_awlen;
  wire [0:0]SLOT_0_AXI_awlock;
  wire [2:0]SLOT_0_AXI_awprot;
  wire [3:0]SLOT_0_AXI_awqos;
  wire [0:0]SLOT_0_AXI_awready;
  wire [3:0]SLOT_0_AXI_awregion;
  wire [2:0]SLOT_0_AXI_awsize;
  wire [17:0]SLOT_0_AXI_awuser;
  wire [0:0]SLOT_0_AXI_awvalid;
  wire [1:0]SLOT_0_AXI_bid;
  wire [0:0]SLOT_0_AXI_bready;
  wire [1:0]SLOT_0_AXI_bresp;
  wire [0:0]SLOT_0_AXI_bvalid;
  wire [31:0]SLOT_0_AXI_rdata;
  wire [1:0]SLOT_0_AXI_rid;
  wire [0:0]SLOT_0_AXI_rlast;
  wire [0:0]SLOT_0_AXI_rready;
  wire [1:0]SLOT_0_AXI_rresp;
  wire [0:0]SLOT_0_AXI_rvalid;
  wire [31:0]SLOT_0_AXI_wdata;
  wire [0:0]SLOT_0_AXI_wlast;
  wire [0:0]SLOT_0_AXI_wready;
  wire [3:0]SLOT_0_AXI_wstrb;
  wire [0:0]SLOT_0_AXI_wvalid;
  wire clk;
  wire resetn;

  bd_a7b3 bd_a7b3_i
       (.SLOT_0_AXI_araddr(SLOT_0_AXI_araddr),
        .SLOT_0_AXI_arburst(SLOT_0_AXI_arburst),
        .SLOT_0_AXI_arcache(SLOT_0_AXI_arcache),
        .SLOT_0_AXI_arid(SLOT_0_AXI_arid),
        .SLOT_0_AXI_arlen(SLOT_0_AXI_arlen),
        .SLOT_0_AXI_arlock(SLOT_0_AXI_arlock),
        .SLOT_0_AXI_arprot(SLOT_0_AXI_arprot),
        .SLOT_0_AXI_arqos(SLOT_0_AXI_arqos),
        .SLOT_0_AXI_arready(SLOT_0_AXI_arready),
        .SLOT_0_AXI_arregion(SLOT_0_AXI_arregion),
        .SLOT_0_AXI_arsize(SLOT_0_AXI_arsize),
        .SLOT_0_AXI_aruser(SLOT_0_AXI_aruser),
        .SLOT_0_AXI_arvalid(SLOT_0_AXI_arvalid),
        .SLOT_0_AXI_awaddr(SLOT_0_AXI_awaddr),
        .SLOT_0_AXI_awburst(SLOT_0_AXI_awburst),
        .SLOT_0_AXI_awcache(SLOT_0_AXI_awcache),
        .SLOT_0_AXI_awid(SLOT_0_AXI_awid),
        .SLOT_0_AXI_awlen(SLOT_0_AXI_awlen),
        .SLOT_0_AXI_awlock(SLOT_0_AXI_awlock),
        .SLOT_0_AXI_awprot(SLOT_0_AXI_awprot),
        .SLOT_0_AXI_awqos(SLOT_0_AXI_awqos),
        .SLOT_0_AXI_awready(SLOT_0_AXI_awready),
        .SLOT_0_AXI_awregion(SLOT_0_AXI_awregion),
        .SLOT_0_AXI_awsize(SLOT_0_AXI_awsize),
        .SLOT_0_AXI_awuser(SLOT_0_AXI_awuser),
        .SLOT_0_AXI_awvalid(SLOT_0_AXI_awvalid),
        .SLOT_0_AXI_bid(SLOT_0_AXI_bid),
        .SLOT_0_AXI_bready(SLOT_0_AXI_bready),
        .SLOT_0_AXI_bresp(SLOT_0_AXI_bresp),
        .SLOT_0_AXI_bvalid(SLOT_0_AXI_bvalid),
        .SLOT_0_AXI_rdata(SLOT_0_AXI_rdata),
        .SLOT_0_AXI_rid(SLOT_0_AXI_rid),
        .SLOT_0_AXI_rlast(SLOT_0_AXI_rlast),
        .SLOT_0_AXI_rready(SLOT_0_AXI_rready),
        .SLOT_0_AXI_rresp(SLOT_0_AXI_rresp),
        .SLOT_0_AXI_rvalid(SLOT_0_AXI_rvalid),
        .SLOT_0_AXI_wdata(SLOT_0_AXI_wdata),
        .SLOT_0_AXI_wlast(SLOT_0_AXI_wlast),
        .SLOT_0_AXI_wready(SLOT_0_AXI_wready),
        .SLOT_0_AXI_wstrb(SLOT_0_AXI_wstrb),
        .SLOT_0_AXI_wvalid(SLOT_0_AXI_wvalid),
        .clk(clk),
        .resetn(resetn));
endmodule
