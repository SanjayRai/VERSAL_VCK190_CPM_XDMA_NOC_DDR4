//**********************************************************************
// Copyright (c) 2016-2018 Xilinx Inc.  All Rights Reserved
//**********************************************************************
//
//   TLM wrapper for NoC nsu.
//   Provides a sc_module anchor with for the axi side
//   (xtlm sockets, clock and reset). The NPP side is modeled within
//   the snoc IP
//
//**********************************************************************
#ifndef _bd_f29c_M00_AXI_nsu_0_core_h_
#define _bd_f29c_M00_AXI_nsu_0_core_h_

#include "NOCSlaveUnitXtlm.h"
#include "properties.h"

class bd_f29c_M00_AXI_nsu_0_core : public NOCSlaveUnitXtlm
{
public:

  // axi clock and reset are defined in base class
  // following xtlm socket pointers refer to instances in base class
  xtlm::xtlm_aximm_initiator_socket* MAXI4_rd_socket;
  xtlm::xtlm_aximm_initiator_socket* MAXI4_wr_socket;
  xtlm::xtlm_axis_initiator_socket* MAXI_STREAM_socket;

bd_f29c_M00_AXI_nsu_0_core( sc_core::sc_module_name nm, const xsc::common_cpp::properties& props )
  : NOCSlaveUnitXtlm(nm, props)
  , MAXI4_rd_socket( &arr_socket )
  , MAXI4_wr_socket( &awb_socket )
  , MAXI_STREAM_socket( &at_socket )

  ,NSU ( "NSU" )
  
  {
  }

  virtual ~bd_f29c_M00_AXI_nsu_0_core() = default;

public: // stub pin-to-pin RTL interface

  sc_in< sc_bv<8> >    IF_NOC_NPP_OUT_NOC_CREDIT_RETURN;
  sc_in< bool >        IF_NOC_NPP_IN_NOC_CREDIT_RDY;
  sc_in< sc_bv<182> >  IF_NOC_NPP_IN_NOC_FLIT;
  sc_in< sc_bv<8> >    IF_NOC_NPP_IN_NOC_VALID;

  sc_out< sc_bv<8> >   IF_NOC_NPP_IN_NOC_CREDIT_RETURN;
  sc_out< bool >       IF_NOC_NPP_OUT_NOC_CREDIT_RDY;
  sc_out< sc_bv<182> > IF_NOC_NPP_OUT_NOC_FLIT;
  sc_out< sc_bv<8> >   IF_NOC_NPP_OUT_NOC_VALID;

  sc_in< bool > NSU;

};

#endif
