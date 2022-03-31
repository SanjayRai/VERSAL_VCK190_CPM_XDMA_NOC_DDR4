
`timescale 1 ns / 1 ps
(* DONT_TOUCH = "TRUE" *)
    module axis_dbg_stub_v1_0_0_axis_dbg_stub
    #(
      parameter integer C_AXIS_DATA_WIDTH   = 32
     )
     (
      input                                   aclk,
      (* DONT_TOUCH = "TRUE" *)input                                   aresetn,
      (* DONT_TOUCH = "TRUE" *)input                                   m_axis_tready,
      (* DONT_TOUCH = "TRUE" *)output                                  m_axis_tvalid,
      (* DONT_TOUCH = "TRUE" *)output                                  m_axis_tlast,
      (* DONT_TOUCH = "TRUE" *)output [C_AXIS_DATA_WIDTH-1 : 0]        m_axis_tdata,
      (* DONT_TOUCH = "TRUE" *)input                                   s_axis_tlast,
      (* DONT_TOUCH = "TRUE" *)input                                   s_axis_tvalid,
      (* DONT_TOUCH = "TRUE" *)input  [C_AXIS_DATA_WIDTH-1 : 0]        s_axis_tdata,
      (* DONT_TOUCH = "TRUE" *)output                                  s_axis_tready,
      output                                  aclk_int,
      (* DONT_TOUCH = "TRUE" *)output                                  aresetn_int,
      (* DONT_TOUCH = "TRUE" *)input                                   s_axis_tready_int,
      (* DONT_TOUCH = "TRUE" *)output                                  s_axis_tvalid_int,
      (* DONT_TOUCH = "TRUE" *)output                                  s_axis_tlast_int,
      (* DONT_TOUCH = "TRUE" *)output [C_AXIS_DATA_WIDTH-1 : 0]        s_axis_tdata_int,
      (* DONT_TOUCH = "TRUE" *)input                                   m_axis_tlast_int,
      (* DONT_TOUCH = "TRUE" *)input                                   m_axis_tvalid_int,
      (* DONT_TOUCH = "TRUE" *)input  [C_AXIS_DATA_WIDTH-1 : 0]        m_axis_tdata_int,
      (* DONT_TOUCH = "TRUE" *)output                                  m_axis_tready_int
     );


  assign aclk_int                           = aclk;
  assign aresetn_int                        = aresetn;
  assign s_axis_tvalid_int                  = s_axis_tvalid;
  assign s_axis_tdata_int                   = s_axis_tdata;
  assign s_axis_tlast_int                   = s_axis_tlast;
  assign s_axis_tready                      = s_axis_tready_int;
  assign m_axis_tvalid                      = m_axis_tvalid_int;
  assign m_axis_tdata                       = m_axis_tdata_int;
  assign m_axis_tlast                       = m_axis_tlast_int;
  assign m_axis_tready_int                  = m_axis_tready;

endmodule



