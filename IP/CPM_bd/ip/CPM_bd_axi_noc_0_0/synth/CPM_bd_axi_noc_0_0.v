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


// IP VLNV: xilinx.com:ip:axi_noc:1.0
// IP Revision: 1

(* X_CORE_INFO = "bd_f29c,Vivado 2021.1" *)
(* CHECK_LICENSE_TYPE = "CPM_bd_axi_noc_0_0,bd_f29c,{}" *)
(* CORE_GENERATION_INFO = "CPM_bd_axi_noc_0_0,bd_f29c,{x_ipProduct=Vivado 2021.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_noc,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,Component_Name=CPM_bd_axi_noc_0_0,NUM_SI=2,NUM_HBM_BLI=-1,BLI_NAMES= ,NUM_MI=2,NUM_NSI=0,NUM_NMI=0,NUM_CLKS=4,SI_DESTID_PINS=,SI_SIDEBAND_PINS=,MI_SIDEBAND_PINS=,SI_USR_INTR_PINS=,MI_USR_INTR_PINS=,MI_INFO_PINS=,SI_NAMES=,MI_NAMES=,NSI_NAMES=,NMI_NAMES=,CLK_NAMES=,NUM_MC=1,NUM_MCP=1,MC_GUI=0,MC_INTERLEAVE_SIZE=12\
8,MC_BOARD_INTRF_EN=true,MC0_FLIPPED_PINOUT=false,MC1_FLIPPED_PINOUT=false,MC2_FLIPPED_PINOUT=false,MC3_FLIPPED_PINOUT=false,MC0_CONFIG_NUM=config17,MC1_CONFIG_NUM=config17,MC2_CONFIG_NUM=config17,MC3_CONFIG_NUM=config17,CH0_DDR4_0_BOARD_INTERFACE=ddr4_dimm1,CH0_DDR4_1_BOARD_INTERFACE=Custom,CH0_DDR4_2_BOARD_INTERFACE=Custom,CH0_DDR4_3_BOARD_INTERFACE=Custom,CH1_DDR4_0_BOARD_INTERFACE=Custom,CH1_DDR4_1_BOARD_INTERFACE=Custom,CH1_DDR4_2_BOARD_INTERFACE=Custom,CH1_DDR4_3_BOARD_INTERFACE=Custom,CH0\
_LPDDR4_0_BOARD_INTERFACE=Custom,CH0_LPDDR4_1_BOARD_INTERFACE=Custom,CH0_LPDDR4_2_BOARD_INTERFACE=Custom,CH0_LPDDR4_3_BOARD_INTERFACE=Custom,CH1_LPDDR4_0_BOARD_INTERFACE=Custom,CH1_LPDDR4_1_BOARD_INTERFACE=Custom,CH1_LPDDR4_2_BOARD_INTERFACE=Custom,CH1_LPDDR4_3_BOARD_INTERFACE=Custom,sys_clk0_BOARD_INTERFACE=ddr4_dimm1_sma_clk,sys_clk1_BOARD_INTERFACE=Custom,sys_clk2_BOARD_INTERFACE=Custom,sys_clk3_BOARD_INTERFACE=Custom,HBM_NUM_CHNL=0,HBM_START_CHNL=0,HBM_START_PHYSICAL_CHNL=-1,HBM_STACKS=0,HBM\
_CHNL_PARAM=0,HBM_CTRL_PHY_MODE=Controller_and_Physical_Layer,HBM_NUM_PHY=0,HBM_START_PHY=0,HBM_REF_CLK_SELECTION=Internal,HBM_CHNL_EN_0=false,HBM_CHNL_EN_1=false,HBM_CHNL_EN_2=false,HBM_CHNL_EN_3=false,HBM_CHNL_EN_4=false,HBM_CHNL_EN_5=false,HBM_CHNL_EN_6=false,HBM_CHNL_EN_7=false,HBM_CHNL_EN_8=false,HBM_CHNL_EN_9=false,HBM_CHNL_EN_10=false,HBM_CHNL_EN_11=false,HBM_CHNL_EN_12=false,HBM_CHNL_EN_13=false,HBM_CHNL_EN_14=false,HBM_CHNL_EN_15=false,HBM_AUTO_POPULATE=yes,HBM_MEMORY_FREQ0=1600,HBM_REF\
_CLK_FREQ0=100.000,HBM_MEMORY_FREQ1=1600,HBM_REF_CLK_FREQ1=100.000,HBM_STACK0_CONFIG= ,HBM_CHNL0_CONFIG= ,HBM_CHNL1_CONFIG= ,HBM_CHNL2_CONFIG= ,HBM_CHNL3_CONFIG= ,HBM_CHNL4_CONFIG= ,HBM_CHNL5_CONFIG= ,HBM_CHNL6_CONFIG= ,HBM_CHNL7_CONFIG= ,HBM_CHNL8_CONFIG= ,HBM_CHNL9_CONFIG= ,HBM_CHNL10_CONFIG= ,HBM_CHNL11_CONFIG= ,HBM_CHNL12_CONFIG= ,HBM_CHNL13_CONFIG= ,HBM_CHNL14_CONFIG= ,HBM_CHNL15_CONFIG= ,HBM_AP_BASE_CONFIG=HBM_CHNL0_CONFIG,HBM_DENSITY_PER_CHNL=NA,HBM_PHY_EN_0=false,HBM_PHY_EN_1=false,HBM_P\
HY_EN_2=false,HBM_PHY_EN_3=false,HBM_PHY_EN_4=false,HBM_PHY_EN_5=false,HBM_PHY_EN_6=false,HBM_PHY_EN_7=false,HBM_PHY_EN_8=false,HBM_PHY_EN_9=false,HBM_PHY_EN_10=false,HBM_PHY_EN_11=false,HBM_PHY_EN_12=false,HBM_PHY_EN_13=false,HBM_PHY_EN_14=false,HBM_PHY_EN_15=false,HBM_FCV_PARAM=Disable,HBM_MEMORY_MODEL=xilinx_responder,MC_NAME=MC,LOGO_FILE=data/noc_mc.png,CONTROLLERTYPE=DDR4_SDRAM,USER_NPI_REG_MC_NSU_0_ING=0x01132400,USER_NPI_REG_MC_NSU_0_EGR=0x00134012,USER_NPI_REG_MC_NSU_0_R_EGR=0x01010100,U\
SER_NPI_REG_MC_NSU_0_W_EGR=0x00010100,USER_NPI_REG_MC_NSU_1_ING=0x01132400,USER_NPI_REG_MC_NSU_1_EGR=0x00134012,USER_NPI_REG_MC_NSU_1_R_EGR=0x01010100,USER_NPI_REG_MC_NSU_1_W_EGR=0x00010100,USER_NPI_REG_MC_NSU_2_ING=0x01132400,USER_NPI_REG_MC_NSU_2_EGR=0x00134012,USER_NPI_REG_MC_NSU_2_R_EGR=0x01010100,USER_NPI_REG_MC_NSU_2_W_EGR=0x00010100,USER_NPI_REG_MC_NSU_3_ING=0x01132400,USER_NPI_REG_MC_NSU_3_EGR=0x00134012,USER_NPI_REG_MC_NSU_3_R_EGR=0x01010100,USER_NPI_REG_MC_NSU_3_W_EGR=0x00010100,MC_XPL\
L_MODE=VarRxVarTx,MC_XPLL_CLKOUT1_PH_CTRL=0x3,MC_XPLL_CLKOUT2_PH_CTRL=0x1,MC_XPLL_DSKW_DLY1=12,MC_XPLL_DSKW_DLY2=15,MC_XPLL_DSKW_DLY_EN1=TRUE,MC_XPLL_DSKW_DLY_EN2=TRUE,MC_XPLL_DSKW_DLY_PATH1=FALSE,MC_XPLL_DSKW_DLY_PATH2=TRUE,MC_XPLL_CLKOUT1_PHASE=0.000,MC_XPLL_CLKOUT1_PERIOD=1250,MC_XPLL_DIV4_CLKOUT12=TRUE,MC_XPLL_DIV4_CLKOUT3=TRUE,MC_XPLL_CLKOUTPHY_CASCIN_EN=TRUE,MC_XPLL_CLKOUTPHY_CASCOUT_EN=FALSE,MC_XPLL_DESKEW_MUXIN_SEL=TRUE,MC_XPLL_DESKEW2_MUXIN_SEL=TRUE,MC_XPLL_CLKOUT2_PHASE=0.0,MC_REG_RD_D\
RR_TKN_P0=0x00040404,MC_REG_RD_DRR_TKN_P1=0x00040404,MC_REG_RD_DRR_TKN_P2=0x00040404,MC_REG_RD_DRR_TKN_P3=0x00040404,MC_REG_WR_DRR_TKN_P0=0x00000404,MC_REG_WR_DRR_TKN_P1=0x00000404,MC_REG_WR_DRR_TKN_P2=0x00000404,MC_REG_WR_DRR_TKN_P3=0x00000404,MC_REG_QOS0=0x000F00F0,MC_REG_QOS1=0x00200804,MC_REG_QOS2=0x00000802,MC_REG_QOS_TIMEOUT0=0x01084210,MC_REG_QOS_TIMEOUT1=0xFFFFFFFF,MC_REG_QOS_TIMEOUT2=0x000000FF,MC_REG_RATE_CTRL_SCALE=0x00000000,MC_REG_P0_LLR_RATE_CTRL=0x003FFC0F,MC_REG_P0_ISR_RATE_CTRL=\
0x003FFC0F,MC_REG_P0_BER_RATE_CTRL=0x003FFC0F,MC_REG_P0_ISW_RATE_CTRL=0x003FFC0F,MC_REG_P0_BEW_RATE_CTRL=0x003FFC0F,MC_REG_P1_LLR_RATE_CTRL=0x003FFC0F,MC_REG_P1_ISR_RATE_CTRL=0x003FFC0F,MC_REG_P1_BER_RATE_CTRL=0x003FFC0F,MC_REG_P1_ISW_RATE_CTRL=0x003FFC0F,MC_REG_P1_BEW_RATE_CTRL=0x003FFC0F,MC_REG_P2_LLR_RATE_CTRL=0x003FFC0F,MC_REG_P2_ISR_RATE_CTRL=0x003FFC0F,MC_REG_P2_BER_RATE_CTRL=0x003FFC0F,MC_REG_P2_ISW_RATE_CTRL=0x003FFC0F,MC_REG_P2_BEW_RATE_CTRL=0x003FFC0F,MC_REG_P3_LLR_RATE_CTRL=0x003FFC0F\
,MC_REG_P3_ISR_RATE_CTRL=0x003FFC0F,MC_REG_P3_BER_RATE_CTRL=0x003FFC0F,MC_REG_P3_ISW_RATE_CTRL=0x003FFC0F,MC_REG_P3_BEW_RATE_CTRL=0x003FFC0F,MC_REG_CMDQ_CTRL0=0x01084210,MC_REG_CMDQ_CTRL1=0x01084210,MC_REG_CMDQ_LLR_RATE_CTRL=0x003FFC0F,MC_REG_CMDQ_ISR_RATE_CTRL=0x003FFC0F,MC_REG_CMDQ_BER_RATE_CTRL=0x003FFC0F,MC_REG_CMDQ_ISW_RATE_CTRL=0x003FFC0F,MC_REG_CMDQ_BEW_RATE_CTRL=0x003FFC0F,MC_REG_QOS_RATE_CTRL_SCALE=0x00000000,MC_DC_CMD_CREDITS=0x000002A8,MC_EXMON_CLR_EXE=0x00000100,MC_XMPU_CTRL=0x000000\
0B,MC_XMPU_START_LO0=0x00000000,MC_XMPU_START_HI0=0x00000000,MC_XMPU_END_LO0=0x00000000,MC_XMPU_END_HI0=0x00000000,MC_XMPU_MASTER0=0x00000000,MC_XMPU_CONFIG0=0x00000008,MC_XMPU_START_LO1=0x00000000,MC_XMPU_START_HI1=0x00000000,MC_XMPU_END_LO1=0x00000000,MC_XMPU_END_HI1=0x00000000,MC_XMPU_MASTER1=0x00000000,MC_XMPU_CONFIG1=0x00000008,MC_XMPU_START_LO2=0x00000000,MC_XMPU_START_HI2=0x00000000,MC_XMPU_END_LO2=0x00000000,MC_XMPU_END_HI2=0x00000000,MC_XMPU_MASTER2=0x00000000,MC_XMPU_CONFIG2=0x00000008\
,MC_XMPU_START_LO3=0x00000000,MC_XMPU_START_HI3=0x00000000,MC_XMPU_END_LO3=0x00000000,MC_XMPU_END_HI3=0x00000000,MC_XMPU_MASTER3=0x00000000,MC_XMPU_CONFIG3=0x00000008,MC_XMPU_START_LO4=0x00000000,MC_XMPU_START_HI4=0x00000000,MC_XMPU_END_LO4=0x00000000,MC_XMPU_END_HI4=0x00000000,MC_XMPU_MASTER4=0x00000000,MC_XMPU_CONFIG4=0x00000008,MC_XMPU_START_LO5=0x00000000,MC_XMPU_START_HI5=0x00000000,MC_XMPU_END_LO5=0x00000000,MC_XMPU_END_HI5=0x00000000,MC_XMPU_MASTER5=0x00000000,MC_XMPU_CONFIG5=0x00000008,M\
C_XMPU_START_LO6=0x00000000,MC_XMPU_START_HI6=0x00000000,MC_XMPU_END_LO6=0x00000000,MC_XMPU_END_HI6=0x00000000,MC_XMPU_MASTER6=0x00000000,MC_XMPU_CONFIG6=0x00000008,MC_XMPU_START_LO7=0x00000000,MC_XMPU_START_HI7=0x00000000,MC_XMPU_END_LO7=0x00000000,MC_XMPU_END_HI7=0x00000000,MC_XMPU_MASTER7=0x00000000,MC_XMPU_CONFIG7=0x00000008,MC_XMPU_START_LO8=0x00000000,MC_XMPU_START_HI8=0x00000000,MC_XMPU_END_LO8=0x00000000,MC_XMPU_END_HI8=0x00000000,MC_XMPU_MASTER8=0x00000000,MC_XMPU_CONFIG8=0x00000008,MC_\
XMPU_START_LO9=0x00000000,MC_XMPU_START_HI9=0x00000000,MC_XMPU_END_LO9=0x00000000,MC_XMPU_END_HI9=0x00000000,MC_XMPU_MASTER9=0x00000000,MC_XMPU_CONFIG9=0x00000008,MC_XMPU_START_LO10=0x00000000,MC_XMPU_START_HI10=0x00000000,MC_XMPU_END_LO10=0x00000000,MC_XMPU_END_HI10=0x00000000,MC_XMPU_MASTER10=0x00000000,MC_XMPU_CONFIG10=0x00000008,MC_XMPU_START_LO11=0x00000000,MC_XMPU_START_HI11=0x00000000,MC_XMPU_END_LO11=0x00000000,MC_XMPU_END_HI11=0x00000000,MC_XMPU_MASTER11=0x00000000,MC_XMPU_CONFIG11=0x00\
000008,MC_XMPU_START_LO12=0x00000000,MC_XMPU_START_HI12=0x00000000,MC_XMPU_END_LO12=0x00000000,MC_XMPU_END_HI12=0x00000000,MC_XMPU_MASTER12=0x00000000,MC_XMPU_CONFIG12=0x00000008,MC_XMPU_START_LO13=0x00000000,MC_XMPU_START_HI13=0x00000000,MC_XMPU_END_LO13=0x00000000,MC_XMPU_END_HI13=0x00000000,MC_XMPU_MASTER13=0x00000000,MC_XMPU_CONFIG13=0x00000008,MC_XMPU_START_LO14=0x00000000,MC_XMPU_START_HI14=0x00000000,MC_XMPU_END_LO14=0x00000000,MC_XMPU_END_HI14=0x00000000,MC_XMPU_MASTER14=0x00000000,MC_XM\
PU_CONFIG14=0x00000008,MC_XMPU_START_LO15=0x00000000,MC_XMPU_START_HI15=0x00000000,MC_XMPU_END_LO15=0x00000000,MC_XMPU_END_HI15=0x00000000,MC_XMPU_MASTER15=0x00000000,MC_XMPU_CONFIG15=0x00000008,MC_REG_ADEC0=0x00000000,MC_REG_ADEC1=0x00000000,MC_REG_ADEC2=0x00005000,MC_REG_ADEC3=0x00005000,MC_REG_ADEC4=0x279A5923,MC_REG_ADEC5=0x1349140F,MC_REG_ADEC6=0x185D6554,MC_REG_ADEC7=0x1D71B699,MC_REG_ADEC8=0x030207DE,MC_REG_ADEC9=0x081C6144,MC_REG_ADEC10=0x0D30B289,MC_REG_ADEC11=0x001A284E,MC_REG_NSU0_POR\
T=0x00000000,MC_REG_NSU1_PORT=0x00000000,MC_REG_NSU2_PORT=0x00000000,MC_REG_NSU3_PORT=0x00000000,MC_UB_CLK_MUX=0x00000000,MC_TCK=628,MC_MEMORY_TIMEPERIOD0=625,MC_MEMORY_TIMEPERIOD1=625,MC_OP_TIMEPERIOD0=625,MC_IP_TIMEPERIOD0_FOR_OP=1250,MC_FREQ_SEL=SYS_CLK_FROM_MEMORY_CLK,MC_MEMORY_FREQUENCY1=625,MC_MEMORY_FREQUENCY2=625,MC_INPUT_FREQUENCY0=200.000,MC_INPUTCLK0_PERIOD=5000,MC_INPUT_FREQUENCY1=400.000,MC_INPUTCLK1_PERIOD=2500,MC_SYSTEM_CLOCK=Differential,MC_INTERNAL_SYSCLK_EN=false,MC_MEMORY_DEVI\
CETYPE=UDIMMs,MC_MEMORY_SPEEDGRADE=DDR4-3200AA(22-22-22),MC_COMPONENT_WIDTH=x8,MC_MEM_DEVICE_WIDTH=x8,MC_MAIN_MODULE_NAME=DDRMC_MAIN_0,MC_NOC_MODULE_NAME=DDRMC_NOC_0,MC_MAIN_BASE_ADDR=0xF6150000,MC_NOC_BASE_ADDR=0xF6070000,MC_COMPONENT_DENSITY=8Gb,MC_MEMORY_DENSITY=8GB,MC_MEMORY_DEVICE_DENSITY=8Gb,MC_TCKEMIN=8,MC_TCKE=8,MC_TDQSCK_MIN=1500,MC_TDQSCK_MAX=0,MC_TDQSS_MIN=0.75,MC_TDQSS_MAX=1.25,MC_TDQS2DQ_MIN=0,MC_TDQS2DQ_MAX=0,MC_TFAW=21000,MC_TFAW_nCK=34,MC_TFAW_DLR=0,MC_TMRD=8,MC_TMRD_div4=0,MC_TM\
RD_nCK=0,MC_TCMR_MRD=0,MC_TRPRE=0.9,MC_TSTAB=0,MC_INTERNAL_CA_PARITY_EN=FALSE,MC_PARITY=false,MC_PARITYLATENCY=0,MC_REGVAL_COMPARE=false,MC_F1_PARITYLATENCY=0,MC_TPAR_ALERT_ON=10,MC_F1_TPAR_ALERT_ON=0,MC_TPAR_ALERT_PW_MAX=192,MC_F1_TPAR_ALERT_PW_MAX=0,MC_TPDM_RD=0,MC_F1_TPDM_RD=0,MC_RCD_PARITY=false,MC_TRAS=32000,MC_TRAS_nCK=0,MC_TRCD=13750,MC_TRCD_nCK=0,MC_F1_TRCD_nCK=0,MC_TREFI=7800000,MC_TRFC=350000,MC_TRP=13750,MC_SILICON_REVISION=NA,MC_TOSCO=0,MC_TOSCO_nCK=0,MC_TRPST=0.4,MC_TWPRE=0.9,MC_TWP\
ST=0.33,MC_TRRD_S=4,MC_TRRD_S_nCK=1,MC_TRRD_L=8,MC_TRRD_L_nCK=1,MC_TRRD_DLR=0,MC_TRTP=7500,MC_TRTP_nCK=12,MC_TMOD=24,MC_TMOD_nCK=24,MC_TMPRR=1,MC_TBCW=0,MC_TMRC=0,MC_TWR=15000,MC_TWR_nCK=0,MC_TWTR_S=2500,MC_TWTR_L=7500,MC_TXPR=576,MC_TXPR_nCK=5,MC_TXPMIN=10,MC_TXP=10,MC_TZQCS=128,MC_TZQCS_ITVL=1000000000,MC_TZQ_START_ITVL=0,MC_TZQINIT=1024,MC_TZQLAT=0,MC_TZQLAT_div4=0,MC_TZQLAT_nCK=0,MC_TMRW=0,MC_TMRW_div4=0,MC_TMRW_nCK=0,MC_TMRR=8,MC_TCCD_3DS=0,MC_TRTW=350,MC_TREFIPB=0,MC_TRFCAB=0,MC_TRFCPB=0,M\
C_TPBR2PBR=0,MC_TRPAB=0,MC_TRPAB_nCK=0,MC_TRPPB=0,MC_TRPPB_nCK=0,MC_TRRD=0,MC_TRRD_nCK=0,MC_TWTR=0,MC_TWTR_nCK=0,MC_TCCD=0,MC_TCCDMW=32,MC_ZQINTVL=350,MC_RTT=RZQ/6,MC_CLAMSHELL=false,MC_NO_CHANNELS=Single,MC_DATAWIDTH=64,MC_ROWADDRESSWIDTH=16,MC_COLUMNADDRESSWIDTH=10,MC_BG_WIDTH=2,MC_BA_WIDTH=2,MC_CA_MIRROR=false,MC_RANK=1,MC_STACKHEIGHT=1,MC_SLOT=Single,MC_ECC=false,MC_DDR4_2T=Disable,MC_CHANNEL_INTERLEAVING=false,MC_CH_INTERLEAVING_SIZE=NONE,MC_CASLATENCY=22,MC_CASWRITELATENCY=16,MC_ORDERING=S\
trict,MC_ADDRESSMAP=ROW_COLUMN_BANK,MC_SELFREFRESH=false,MC_SAVERESTORE=false,MC_SIMMODE=BFM,MC_POWERMODES=true,MC_ZQCS_FREQUENCY=true,MC_USERREFRESH=false,MC_LPDDR4_REFRESH_TYPE=ALL_BANK,MC_ADD_CMD_DELAY_EN=Disable,MC_ADD_CMD_DELAY=0,MC_F1_ADD_CMD_DELAY_EN=Disable,MC_F1_ADD_CMD_DELAY=0,MC_ZQCS_PIN=true,MC_SCRUBBING=off,MC_SVFLOW=Disable,MC_SKIPCAL=Disable,MC_FCV_FULLCAL=Disable,MC_PRUNECHIP_SIM_CHANGES=Disable,MC_MEM_ADDRESS_MAP=ROW_COLUMN_BANK,MC_TCCD_S=4,MC_TCCD_L=8,MC_TCCD_L_nCK=5,MC_TRC=457\
50,MC_REFRESH_RATE=1x,MC_REFRESH_SPEED=1x_SPEED-NORMAL_TEMPERATURE,MC_TRFC_DLR=0,MC_CORRECT_EN=1,MC_CLA=0,MC_F1_CLA=0,MC_RCD_DELAY=0,MC_F1_RCD_DELAY=0,MC_REGION=0,MC_EN_NPP_MONITOR=1,MC_DISABLE_DATA_CHECK=1,MC_LR_WIDTH=1,MC_CS_WIDTH=1,MC_PRE_DEF_ADDR_MAP_SEL=ROW_BANK_COLUMN_BGO,MC_USER_DEFINED_ADDRESS_MAP=16RA-2BA-2BG-10CA,MC_ADDR_BIT43=NA,MC_ADDR_BIT42=NA,MC_ADDR_BIT41=NA,MC_ADDR_BIT40=NA,MC_ADDR_BIT39=NA,MC_ADDR_BIT38=NA,MC_ADDR_BIT37=NA,MC_ADDR_BIT36=NA,MC_ADDR_BIT35=NA,MC_ADDR_BIT34=NA,MC_AD\
DR_BIT33=NA,MC_ADDR_BIT32=RA15,MC_ADDR_BIT31=RA14,MC_ADDR_BIT30=RA13,MC_ADDR_BIT29=RA12,MC_ADDR_BIT28=RA11,MC_ADDR_BIT27=RA10,MC_ADDR_BIT26=RA9,MC_ADDR_BIT25=RA8,MC_ADDR_BIT24=RA7,MC_ADDR_BIT23=RA6,MC_ADDR_BIT22=RA5,MC_ADDR_BIT21=RA4,MC_ADDR_BIT20=RA3,MC_ADDR_BIT19=RA2,MC_ADDR_BIT18=RA1,MC_ADDR_BIT17=RA0,MC_ADDR_BIT16=BA1,MC_ADDR_BIT15=BA0,MC_ADDR_BIT14=BG1,MC_ADDR_BIT13=CA9,MC_ADDR_BIT12=CA8,MC_ADDR_BIT11=CA7,MC_ADDR_BIT10=CA6,MC_ADDR_BIT9=CA5,MC_ADDR_BIT8=CA4,MC_ADDR_BIT7=CA3,MC_ADDR_BIT6=BG0,\
MC_ADDR_BIT5=CA2,MC_ADDR_BIT4=CA1,MC_ADDR_BIT3=CA0,MC_ADDR_BIT2=NC,MC_ADDR_BIT1=NC,MC_ADDR_BIT0=NC,MC_CHAN_REGION0=DDR_LOW0,MC_CHAN_REGION1=NONE,MC_DQ_WIDTH=64,MC_DQS_WIDTH=8,MC_DM_WIDTH=8,MC_CK_WIDTH=1,MC_CKE_WIDTH=1,MC_ADDR_WIDTH=17,MC_BURST_LENGTH=8,MC_ODT_WIDTH=1,MC_NUM_CK=1,MC_LP4_PIN_EFFICIENT=false,MC_CH0_LP4_CHA_ENABLE=false,MC_CH0_LP4_CHB_ENABLE=false,MC_CH1_LP4_CHA_ENABLE=false,MC_CH1_LP4_CHB_ENABLE=false,MC_LP4_DQ_A_WIDTH=0,MC_LP4_DQ_B_WIDTH=0,MC_LP4_DQS_A_WIDTH=0,MC_LP4_DQS_B_WIDTH=0\
,MC_LP4_DMI_A_WIDTH=0,MC_LP4_DMI_B_WIDTH=0,MC_LP4_CA_A_WIDTH=0,MC_LP4_CA_B_WIDTH=0,MC_LP4_CKT_A_WIDTH=0,MC_LP4_CKT_B_WIDTH=0,MC_LP4_CKE_A_WIDTH=0,MC_LP4_CKE_B_WIDTH=0,MC_LP4_CS_A_WIDTH=0,MC_LP4_CS_B_WIDTH=0,MC_LP4_RESETN_WIDTH=0,MC_TEMP_DIR_DELETE=TRUE,MC_TFAWMIN=21000,MC_TMRDMIN=8,MC_TRASMIN=32000,MC_TRCDMIN=13750,MC_TRPMIN=13750,MC_TRCMIN=45750,MC_TRRD_S_MIN=4,MC_TRRD_L_MIN=8,MC_TRTPMIN=7500,MC_TOSCOMIN=0,MC_TWRMIN=15000,MC_TWTRMIN=0,MC_TWTR_S_MIN=2500,MC_TWTR_L_MIN=0,MC_TRFCMIN=350000,MC_TCCD\
_L_MIN=8,MC_TCCD_3DS_MIN=0,MC_TMOD_MIN=24,MC_TRPABMIN=0,MC_TRPPBMIN=0,MC_TRRDMIN=0,MC_TZQCAL=0,MC_TZQCAL_div4=0,MC_TZQLATMIN=0,MC_TMRWMIN=0,MC_TRFCABMIN=0,MC_TRFCPBMIN=0,MC_TPBR2PBRMIN=0,MC_EN_ECC_SCRUBBING=false,MC_EN_BACKGROUND_SCRUBBING=false,MC_ECC_SCRUB_PERIOD=0x003E80,MC_PER_RD_INTVL=20000000,MC_INIT_MEM_USING_ECC_SCRUB=false,MC_IDLE_TIME_ENTR_PWR_DOWN_MODE=0x00000AA,MC_IDLE_TIME_ENTR_SELF_REF_MODE=0x0020000,MC_WRITE_DM_DBI=DM_NO_DBI,MC_READ_DBI=false,MC_ATTR_FILE=sidefile.xdc,MC_EN_INTR_R\
ESP=FALSE,MC_EXTENDED_WDQS=TRUE,MC_ODTLon=0,MC_F1_ODTLon=0,MC_TODTon_MIN=0,MC_F1_TODTon_MIN=0,MC_LP4_OPERATING_TEMP=STANDARD,MC_CONFIG_NUM=config17,MC_FREQ_SWITCHING_EN=FALSE,MC_FREQ_PARAM=F0,MC_IP_TIMEPERIOD1=625,MC_OP_TIMEPERIOD1=625,MC_F1_CASLATENCY=24,MC_F1_CASWRITELATENCY=20,MC_F1_TFAW=21000,MC_F1_TFAWMIN=21000,MC_F1_TFAW_nCK=0,MC_F1_TRRD_S=4,MC_F1_TRRD_S_MIN=4,MC_F1_TRRD_L=8,MC_F1_TRRD_L_MIN=8,MC_F1_TRTP=7500,MC_F1_TRTPMIN=7500,MC_F1_TRTP_nCK=0,MC_F1_TWTR_S=2500,MC_F1_TWTR_S_MIN=2500,MC_F1\
_TWTR_L=7500,MC_F1_TWTR_L_MIN=7500,MC_F1_TCCD_L=8,MC_F1_TCCD_L_MIN=8,MC_F1_TCCD_3DS=0,MC_F1_TCCD_3DS_MIN=0,MC_F1_TMOD=24,MC_F1_TMOD_MIN=24,MC_F1_TCKEMIN=0,MC_F1_TCKE=0,MC_F1_TXPMIN=0,MC_F1_TXP=0,MC_F1_TMRD=8,MC_F1_TMRD_nCK=0,MC_F1_TMRDMIN=8,MC_F1_TRAS=32000,MC_F1_TRAS_nCK=0,MC_F1_TRASMIN=32000,MC_F1_TRCD=13750,MC_F1_TRCDMIN=13750,MC_F1_TRPAB=0,MC_F1_TRPAB_nCK=0,MC_F1_TRPABMIN=0,MC_F1_TRPPB=0,MC_F1_TRPPB_nCK=0,MC_F1_TRPPBMIN=0,MC_F1_TRRD=0,MC_F1_TRRDMIN=0,MC_F1_TRRD_nCK=0,MC_F1_TWR=15000,MC_F1_TW\
R_nCK=0,MC_F1_TWRMIN=15000,MC_F1_TWTR=0,MC_F1_TWTR_nCK=0,MC_F1_TWTRMIN=0,MC_F1_TZQLAT=0,MC_F1_TZQLAT_nCK=0,MC_F1_TZQLATMIN=0,MC_F1_TMRW=0,MC_F1_TMRWMIN=0,MC_F1_TOSCO=0,MC_F1_TOSCO_nCK=0,MC_F1_TOSCOMIN=0,MC_F1_LPDDR4_MR1=0x0000,MC_F1_LPDDR4_MR2=0x0000,MC_F1_LPDDR4_MR3=0x0000,MC_F1_LPDDR4_MR11=0x0000,MC_F1_LPDDR4_MR13=0x0000,MC_F1_LPDDR4_MR22=0x0000,MC_UBLAZE_APB_INTF=FALSE,MC_REF_AND_PER_CAL_INTF=FALSE,MC_DDR4_CTLE=000,MC_READ_BANDWIDTH=6400.000,MC_WRITE_BANDWIDTH=6400.000,MC_ECC_SCRUB_SIZE=8192,\
MC_IBUFDISABLE=false,MC_DDR_INIT_TIMEOUT=0x00079C3E,MC_EN_PERF_STATS=false,MC_XLNX_RESPONDER=true,MC_VNC_ENABLE=FALSE,MC_DEVICE_TYPE=S80,MC_NETLIST_SIMULATION=false}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module CPM_bd_axi_noc_0_0 (
  S00_AXI_awaddr,
  S00_AXI_awlen,
  S00_AXI_awsize,
  S00_AXI_awburst,
  S00_AXI_awlock,
  S00_AXI_awcache,
  S00_AXI_awprot,
  S00_AXI_awregion,
  S00_AXI_awqos,
  S00_AXI_awvalid,
  S00_AXI_awready,
  S00_AXI_wdata,
  S00_AXI_wstrb,
  S00_AXI_wlast,
  S00_AXI_wvalid,
  S00_AXI_wready,
  S00_AXI_bresp,
  S00_AXI_bvalid,
  S00_AXI_bready,
  S00_AXI_araddr,
  S00_AXI_arlen,
  S00_AXI_arsize,
  S00_AXI_arburst,
  S00_AXI_arlock,
  S00_AXI_arcache,
  S00_AXI_arprot,
  S00_AXI_arregion,
  S00_AXI_arqos,
  S00_AXI_arvalid,
  S00_AXI_arready,
  S00_AXI_rdata,
  S00_AXI_rresp,
  S00_AXI_rlast,
  S00_AXI_rvalid,
  S00_AXI_rready,
  S01_AXI_awaddr,
  S01_AXI_awlen,
  S01_AXI_awsize,
  S01_AXI_awburst,
  S01_AXI_awlock,
  S01_AXI_awcache,
  S01_AXI_awprot,
  S01_AXI_awregion,
  S01_AXI_awqos,
  S01_AXI_awvalid,
  S01_AXI_awready,
  S01_AXI_wdata,
  S01_AXI_wstrb,
  S01_AXI_wlast,
  S01_AXI_wvalid,
  S01_AXI_wready,
  S01_AXI_bresp,
  S01_AXI_bvalid,
  S01_AXI_bready,
  S01_AXI_araddr,
  S01_AXI_arlen,
  S01_AXI_arsize,
  S01_AXI_arburst,
  S01_AXI_arlock,
  S01_AXI_arcache,
  S01_AXI_arprot,
  S01_AXI_arregion,
  S01_AXI_arqos,
  S01_AXI_arvalid,
  S01_AXI_arready,
  S01_AXI_rdata,
  S01_AXI_rresp,
  S01_AXI_rlast,
  S01_AXI_rvalid,
  S01_AXI_rready,
  M00_AXI_awaddr,
  M00_AXI_awlen,
  M00_AXI_awsize,
  M00_AXI_awburst,
  M00_AXI_awlock,
  M00_AXI_awcache,
  M00_AXI_awprot,
  M00_AXI_awregion,
  M00_AXI_awqos,
  M00_AXI_awvalid,
  M00_AXI_awready,
  M00_AXI_wdata,
  M00_AXI_wstrb,
  M00_AXI_wlast,
  M00_AXI_wvalid,
  M00_AXI_wready,
  M00_AXI_bresp,
  M00_AXI_bvalid,
  M00_AXI_bready,
  M00_AXI_araddr,
  M00_AXI_arlen,
  M00_AXI_arsize,
  M00_AXI_arburst,
  M00_AXI_arlock,
  M00_AXI_arcache,
  M00_AXI_arprot,
  M00_AXI_arregion,
  M00_AXI_arqos,
  M00_AXI_arvalid,
  M00_AXI_arready,
  M00_AXI_rdata,
  M00_AXI_rresp,
  M00_AXI_rlast,
  M00_AXI_rvalid,
  M00_AXI_rready,
  M01_AXI_awaddr,
  M01_AXI_awlen,
  M01_AXI_awsize,
  M01_AXI_awburst,
  M01_AXI_awlock,
  M01_AXI_awcache,
  M01_AXI_awprot,
  M01_AXI_awregion,
  M01_AXI_awqos,
  M01_AXI_awvalid,
  M01_AXI_awready,
  M01_AXI_wdata,
  M01_AXI_wstrb,
  M01_AXI_wlast,
  M01_AXI_wvalid,
  M01_AXI_wready,
  M01_AXI_bresp,
  M01_AXI_bvalid,
  M01_AXI_bready,
  M01_AXI_araddr,
  M01_AXI_arlen,
  M01_AXI_arsize,
  M01_AXI_arburst,
  M01_AXI_arlock,
  M01_AXI_arcache,
  M01_AXI_arprot,
  M01_AXI_arregion,
  M01_AXI_arqos,
  M01_AXI_arvalid,
  M01_AXI_arready,
  M01_AXI_rdata,
  M01_AXI_rresp,
  M01_AXI_rlast,
  M01_AXI_rvalid,
  M01_AXI_rready,
  aclk0,
  aclk1,
  aclk2,
  aclk3,
  sys_clk0_clk_p,
  sys_clk0_clk_n,
  CH0_DDR4_0_dq,
  CH0_DDR4_0_dqs_t,
  CH0_DDR4_0_dqs_c,
  CH0_DDR4_0_adr,
  CH0_DDR4_0_ba,
  CH0_DDR4_0_bg,
  CH0_DDR4_0_act_n,
  CH0_DDR4_0_reset_n,
  CH0_DDR4_0_ck_t,
  CH0_DDR4_0_ck_c,
  CH0_DDR4_0_cke,
  CH0_DDR4_0_cs_n,
  CH0_DDR4_0_dm_n,
  CH0_DDR4_0_odt,
  S01_AXI_arid,
  S01_AXI_aruser,
  S01_AXI_awid,
  S01_AXI_awuser,
  S01_AXI_bid,
  S01_AXI_rid,
  S01_AXI_ruser,
  S01_AXI_wuser,
  S00_AXI_arid,
  S00_AXI_aruser,
  S00_AXI_awid,
  S00_AXI_awuser,
  S00_AXI_bid,
  S00_AXI_rid,
  S00_AXI_ruser,
  S00_AXI_wuser,
  M00_AXI_arid,
  M00_AXI_aruser,
  M00_AXI_awid,
  M00_AXI_awuser,
  M00_AXI_bid,
  M00_AXI_rid,
  M01_AXI_arid,
  M01_AXI_aruser,
  M01_AXI_awid,
  M01_AXI_awuser,
  M01_AXI_bid,
  M01_AXI_rid,
  M01_AXI_ruser,
  M01_AXI_wuser
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *)
input wire [63 : 0] S00_AXI_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLEN" *)
input wire [7 : 0] S00_AXI_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWSIZE" *)
input wire [2 : 0] S00_AXI_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWBURST" *)
input wire [1 : 0] S00_AXI_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWLOCK" *)
input wire [0 : 0] S00_AXI_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWCACHE" *)
input wire [3 : 0] S00_AXI_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *)
input wire [2 : 0] S00_AXI_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREGION" *)
input wire [3 : 0] S00_AXI_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWQOS" *)
input wire [3 : 0] S00_AXI_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *)
input wire [0 : 0] S00_AXI_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *)
output wire [0 : 0] S00_AXI_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *)
input wire [127 : 0] S00_AXI_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *)
input wire [15 : 0] S00_AXI_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WLAST" *)
input wire [0 : 0] S00_AXI_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *)
input wire [0 : 0] S00_AXI_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *)
output wire [0 : 0] S00_AXI_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *)
output wire [1 : 0] S00_AXI_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *)
output wire [0 : 0] S00_AXI_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *)
input wire [0 : 0] S00_AXI_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *)
input wire [63 : 0] S00_AXI_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLEN" *)
input wire [7 : 0] S00_AXI_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARSIZE" *)
input wire [2 : 0] S00_AXI_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARBURST" *)
input wire [1 : 0] S00_AXI_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARLOCK" *)
input wire [0 : 0] S00_AXI_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARCACHE" *)
input wire [3 : 0] S00_AXI_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *)
input wire [2 : 0] S00_AXI_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREGION" *)
input wire [3 : 0] S00_AXI_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARQOS" *)
input wire [3 : 0] S00_AXI_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *)
input wire [0 : 0] S00_AXI_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *)
output wire [0 : 0] S00_AXI_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *)
output wire [127 : 0] S00_AXI_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *)
output wire [1 : 0] S00_AXI_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RLAST" *)
output wire [0 : 0] S00_AXI_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *)
output wire [0 : 0] S00_AXI_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *)
input wire [0 : 0] S00_AXI_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWADDR" *)
input wire [63 : 0] S01_AXI_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLEN" *)
input wire [7 : 0] S01_AXI_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWSIZE" *)
input wire [2 : 0] S01_AXI_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWBURST" *)
input wire [1 : 0] S01_AXI_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWLOCK" *)
input wire [0 : 0] S01_AXI_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWCACHE" *)
input wire [3 : 0] S01_AXI_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWPROT" *)
input wire [2 : 0] S01_AXI_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWREGION" *)
input wire [3 : 0] S01_AXI_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWQOS" *)
input wire [3 : 0] S01_AXI_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWVALID" *)
input wire [0 : 0] S01_AXI_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWREADY" *)
output wire [0 : 0] S01_AXI_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WDATA" *)
input wire [127 : 0] S01_AXI_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WSTRB" *)
input wire [15 : 0] S01_AXI_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WLAST" *)
input wire [0 : 0] S01_AXI_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WVALID" *)
input wire [0 : 0] S01_AXI_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WREADY" *)
output wire [0 : 0] S01_AXI_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BRESP" *)
output wire [1 : 0] S01_AXI_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BVALID" *)
output wire [0 : 0] S01_AXI_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BREADY" *)
input wire [0 : 0] S01_AXI_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARADDR" *)
input wire [63 : 0] S01_AXI_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLEN" *)
input wire [7 : 0] S01_AXI_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARSIZE" *)
input wire [2 : 0] S01_AXI_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARBURST" *)
input wire [1 : 0] S01_AXI_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARLOCK" *)
input wire [0 : 0] S01_AXI_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARCACHE" *)
input wire [3 : 0] S01_AXI_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARPROT" *)
input wire [2 : 0] S01_AXI_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREGION" *)
input wire [3 : 0] S01_AXI_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARQOS" *)
input wire [3 : 0] S01_AXI_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARVALID" *)
input wire [0 : 0] S01_AXI_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARREADY" *)
output wire [0 : 0] S01_AXI_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RDATA" *)
output wire [127 : 0] S01_AXI_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RRESP" *)
output wire [1 : 0] S01_AXI_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RLAST" *)
output wire [0 : 0] S01_AXI_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RVALID" *)
output wire [0 : 0] S01_AXI_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RREADY" *)
input wire [0 : 0] S01_AXI_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWADDR" *)
output wire [63 : 0] M00_AXI_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLEN" *)
output wire [7 : 0] M00_AXI_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWSIZE" *)
output wire [2 : 0] M00_AXI_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWBURST" *)
output wire [1 : 0] M00_AXI_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWLOCK" *)
output wire [0 : 0] M00_AXI_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWCACHE" *)
output wire [3 : 0] M00_AXI_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWPROT" *)
output wire [2 : 0] M00_AXI_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREGION" *)
output wire [3 : 0] M00_AXI_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWQOS" *)
output wire [3 : 0] M00_AXI_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWVALID" *)
output wire [0 : 0] M00_AXI_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWREADY" *)
input wire [0 : 0] M00_AXI_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WDATA" *)
output wire [31 : 0] M00_AXI_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WSTRB" *)
output wire [3 : 0] M00_AXI_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WLAST" *)
output wire [0 : 0] M00_AXI_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WVALID" *)
output wire [0 : 0] M00_AXI_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI WREADY" *)
input wire [0 : 0] M00_AXI_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BRESP" *)
input wire [1 : 0] M00_AXI_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BVALID" *)
input wire [0 : 0] M00_AXI_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BREADY" *)
output wire [0 : 0] M00_AXI_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *)
output wire [63 : 0] M00_AXI_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLEN" *)
output wire [7 : 0] M00_AXI_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARSIZE" *)
output wire [2 : 0] M00_AXI_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARBURST" *)
output wire [1 : 0] M00_AXI_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARLOCK" *)
output wire [0 : 0] M00_AXI_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARCACHE" *)
output wire [3 : 0] M00_AXI_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARPROT" *)
output wire [2 : 0] M00_AXI_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREGION" *)
output wire [3 : 0] M00_AXI_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARQOS" *)
output wire [3 : 0] M00_AXI_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *)
output wire [0 : 0] M00_AXI_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *)
input wire [0 : 0] M00_AXI_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *)
input wire [31 : 0] M00_AXI_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *)
input wire [1 : 0] M00_AXI_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RLAST" *)
input wire [0 : 0] M00_AXI_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *)
input wire [0 : 0] M00_AXI_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *)
output wire [0 : 0] M00_AXI_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWADDR" *)
output wire [63 : 0] M01_AXI_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWLEN" *)
output wire [7 : 0] M01_AXI_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWSIZE" *)
output wire [2 : 0] M01_AXI_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWBURST" *)
output wire [1 : 0] M01_AXI_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWLOCK" *)
output wire [0 : 0] M01_AXI_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWCACHE" *)
output wire [3 : 0] M01_AXI_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWPROT" *)
output wire [2 : 0] M01_AXI_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREGION" *)
output wire [3 : 0] M01_AXI_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWQOS" *)
output wire [3 : 0] M01_AXI_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWVALID" *)
output wire [0 : 0] M01_AXI_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREADY" *)
input wire [0 : 0] M01_AXI_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WDATA" *)
output wire [127 : 0] M01_AXI_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WSTRB" *)
output wire [15 : 0] M01_AXI_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WLAST" *)
output wire [0 : 0] M01_AXI_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WVALID" *)
output wire [0 : 0] M01_AXI_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WREADY" *)
input wire [0 : 0] M01_AXI_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BRESP" *)
input wire [1 : 0] M01_AXI_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BVALID" *)
input wire [0 : 0] M01_AXI_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BREADY" *)
output wire [0 : 0] M01_AXI_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARADDR" *)
output wire [63 : 0] M01_AXI_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARLEN" *)
output wire [7 : 0] M01_AXI_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARSIZE" *)
output wire [2 : 0] M01_AXI_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARBURST" *)
output wire [1 : 0] M01_AXI_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARLOCK" *)
output wire [0 : 0] M01_AXI_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARCACHE" *)
output wire [3 : 0] M01_AXI_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARPROT" *)
output wire [2 : 0] M01_AXI_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREGION" *)
output wire [3 : 0] M01_AXI_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARQOS" *)
output wire [3 : 0] M01_AXI_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARVALID" *)
output wire [0 : 0] M01_AXI_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREADY" *)
input wire [0 : 0] M01_AXI_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RDATA" *)
input wire [127 : 0] M01_AXI_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RRESP" *)
input wire [1 : 0] M01_AXI_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RLAST" *)
input wire [0 : 0] M01_AXI_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RVALID" *)
input wire [0 : 0] M01_AXI_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RREADY" *)
output wire [0 : 0] M01_AXI_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.aclk0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, ASSOCIATED_BUSIF S00_AXI, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.aclk0 CLK" *)
input wire aclk0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.aclk1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, ASSOCIATED_BUSIF S01_AXI, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.aclk1 CLK" *)
input wire aclk1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.aclk2, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, ASSOCIATED_BUSIF M00_AXI, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.aclk2 CLK" *)
input wire aclk2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.aclk3, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, ASSOCIATED_BUSIF M01_AXI, INSERT_VIP 0, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NSU" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.aclk3 CLK" *)
input wire aclk3;
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sys_clk0 CLK_P" *)
input wire [0 : 0] sys_clk0_clk_p;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_clk0, CAN_DEBUG false, FREQ_HZ 200000000, BOARD.ASSOCIATED_PARAM sys_clk0_BOARD_INTERFACE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 sys_clk0 CLK_N" *)
input wire [0 : 0] sys_clk0_clk_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DQ" *)
inout wire [63 : 0] CH0_DDR4_0_dq;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DQS_T" *)
inout wire [7 : 0] CH0_DDR4_0_dqs_t;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DQS_C" *)
inout wire [7 : 0] CH0_DDR4_0_dqs_c;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 ADR" *)
output wire [16 : 0] CH0_DDR4_0_adr;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 BA" *)
output wire [1 : 0] CH0_DDR4_0_ba;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 BG" *)
output wire [1 : 0] CH0_DDR4_0_bg;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 ACT_N" *)
output wire [0 : 0] CH0_DDR4_0_act_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 RESET_N" *)
output wire [0 : 0] CH0_DDR4_0_reset_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CK_T" *)
output wire [0 : 0] CH0_DDR4_0_ck_t;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CK_C" *)
output wire [0 : 0] CH0_DDR4_0_ck_c;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CKE" *)
output wire [0 : 0] CH0_DDR4_0_cke;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 CS_N" *)
output wire [0 : 0] CH0_DDR4_0_cs_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 DM_N" *)
inout wire [7 : 0] CH0_DDR4_0_dm_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CH0_DDR4_0, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, WRITE_BUFFER_SIZE 80, NOC_ID -1, MY_CATEGORY pl, BOARD.ASSOCIATED_PARAM CH0_DDR4_0_BOARD_INTERFACE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 CH0_DDR4_0 ODT" *)
output wire [0 : 0] CH0_DDR4_0_odt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARID" *)
input wire [15 : 0] S01_AXI_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI ARUSER" *)
input wire [17 : 0] S01_AXI_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWID" *)
input wire [15 : 0] S01_AXI_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI AWUSER" *)
input wire [17 : 0] S01_AXI_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI BID" *)
output wire [15 : 0] S01_AXI_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RID" *)
output wire [15 : 0] S01_AXI_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI RUSER" *)
output wire [16 : 0] S01_AXI_ruser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S01_AXI, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi1_clk, NUM_READ_TH\
READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, R_TRAFFIC_CLASS BEST_EFFORT, W_TRAFFIC_CLASS BEST_EFFORT, R_LATENCY 300, R_RATE_LIMITER 10, W_RATE_LIMITER 10, R_MAX_BURST_LENGTH 256, W_MAX_BURST_LENGTH 256, REGION 0, CONNECTIONS MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {5} write_bw {5}} , DEST_IDS M01_AXI:0x40:M00_AXI:0x\
0, WRITE_BUFFER_SIZE 80, MY_CATEGORY noc, CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S01_AXI WUSER" *)
input wire [16 : 0] S01_AXI_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARID" *)
input wire [15 : 0] S00_AXI_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARUSER" *)
input wire [17 : 0] S00_AXI_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWID" *)
input wire [15 : 0] S00_AXI_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWUSER" *)
input wire [17 : 0] S00_AXI_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BID" *)
output wire [15 : 0] S00_AXI_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RID" *)
output wire [15 : 0] S00_AXI_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RUSER" *)
output wire [16 : 0] S00_AXI_ruser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 16, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 64, NUM_WRITE_OUTSTANDING 64, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_cpm_pcie_noc_axi0_clk, NUM_READ_TH\
READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, R_TRAFFIC_CLASS BEST_EFFORT, W_TRAFFIC_CLASS BEST_EFFORT, R_LATENCY 300, R_RATE_LIMITER 10, W_RATE_LIMITER 10, R_MAX_BURST_LENGTH 256, W_MAX_BURST_LENGTH 256, REGION 0, CONNECTIONS MC_0 { read_bw {1720} write_bw {1720}} M01_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}} , DEST_IDS M01_AXI:0x40:M00_\
AXI:0x0, WRITE_BUFFER_SIZE 80, MY_CATEGORY noc, CATEGORY ps_pcie, PHYSICAL_CHANNEL PS_PCIE_TO_NOC_NMU" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WUSER" *)
input wire [16 : 0] S00_AXI_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARID" *)
output wire [1 : 0] M00_AXI_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARUSER" *)
output wire [17 : 0] M00_AXI_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWID" *)
output wire [1 : 0] M00_AXI_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI AWUSER" *)
output wire [17 : 0] M00_AXI_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI BID" *)
input wire [1 : 0] M00_AXI_bid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 250000000, ID_WIDTH 2, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_cpm_0_0_pcie0_user_clk, NUM_READ_THREADS 4, NUM_\
WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, WRITE_BUFFER_SIZE 80, NOC_ID -1, APERTURES {0x201_0000_0000 1G}, MY_CATEGORY noc, CATEGORY pl" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RID" *)
input wire [1 : 0] M00_AXI_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARID" *)
output wire [1 : 0] M01_AXI_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARUSER" *)
output wire [17 : 0] M01_AXI_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWID" *)
output wire [1 : 0] M01_AXI_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWUSER" *)
output wire [17 : 0] M01_AXI_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BID" *)
input wire [1 : 0] M01_AXI_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RID" *)
input wire [1 : 0] M01_AXI_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RUSER" *)
input wire [16 : 0] M01_AXI_ruser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M01_AXI, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 2, ADDR_WIDTH 64, AWUSER_WIDTH 18, ARUSER_WIDTH 18, WUSER_WIDTH 17, RUSER_WIDTH 17, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN bd_f512_pspmc_0_0_noc_cpm_pcie_axi0_clk, NUM_READ_THR\
EADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0, REGION 0, WRITE_BUFFER_SIZE 80, NOC_ID -1, MY_CATEGORY noc, CATEGORY ps_pcie, PHYSICAL_CHANNEL NOC_NSU_TO_PS_PCIE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WUSER" *)
output wire [16 : 0] M01_AXI_wuser;

  bd_f29c inst (
    .S00_AXI_awaddr(S00_AXI_awaddr),
    .S00_AXI_awlen(S00_AXI_awlen),
    .S00_AXI_awsize(S00_AXI_awsize),
    .S00_AXI_awburst(S00_AXI_awburst),
    .S00_AXI_awlock(S00_AXI_awlock),
    .S00_AXI_awcache(S00_AXI_awcache),
    .S00_AXI_awprot(S00_AXI_awprot),
    .S00_AXI_awregion(S00_AXI_awregion),
    .S00_AXI_awqos(S00_AXI_awqos),
    .S00_AXI_awvalid(S00_AXI_awvalid),
    .S00_AXI_awready(S00_AXI_awready),
    .S00_AXI_wdata(S00_AXI_wdata),
    .S00_AXI_wstrb(S00_AXI_wstrb),
    .S00_AXI_wlast(S00_AXI_wlast),
    .S00_AXI_wvalid(S00_AXI_wvalid),
    .S00_AXI_wready(S00_AXI_wready),
    .S00_AXI_bresp(S00_AXI_bresp),
    .S00_AXI_bvalid(S00_AXI_bvalid),
    .S00_AXI_bready(S00_AXI_bready),
    .S00_AXI_araddr(S00_AXI_araddr),
    .S00_AXI_arlen(S00_AXI_arlen),
    .S00_AXI_arsize(S00_AXI_arsize),
    .S00_AXI_arburst(S00_AXI_arburst),
    .S00_AXI_arlock(S00_AXI_arlock),
    .S00_AXI_arcache(S00_AXI_arcache),
    .S00_AXI_arprot(S00_AXI_arprot),
    .S00_AXI_arregion(S00_AXI_arregion),
    .S00_AXI_arqos(S00_AXI_arqos),
    .S00_AXI_arvalid(S00_AXI_arvalid),
    .S00_AXI_arready(S00_AXI_arready),
    .S00_AXI_rdata(S00_AXI_rdata),
    .S00_AXI_rresp(S00_AXI_rresp),
    .S00_AXI_rlast(S00_AXI_rlast),
    .S00_AXI_rvalid(S00_AXI_rvalid),
    .S00_AXI_rready(S00_AXI_rready),
    .S01_AXI_awaddr(S01_AXI_awaddr),
    .S01_AXI_awlen(S01_AXI_awlen),
    .S01_AXI_awsize(S01_AXI_awsize),
    .S01_AXI_awburst(S01_AXI_awburst),
    .S01_AXI_awlock(S01_AXI_awlock),
    .S01_AXI_awcache(S01_AXI_awcache),
    .S01_AXI_awprot(S01_AXI_awprot),
    .S01_AXI_awregion(S01_AXI_awregion),
    .S01_AXI_awqos(S01_AXI_awqos),
    .S01_AXI_awvalid(S01_AXI_awvalid),
    .S01_AXI_awready(S01_AXI_awready),
    .S01_AXI_wdata(S01_AXI_wdata),
    .S01_AXI_wstrb(S01_AXI_wstrb),
    .S01_AXI_wlast(S01_AXI_wlast),
    .S01_AXI_wvalid(S01_AXI_wvalid),
    .S01_AXI_wready(S01_AXI_wready),
    .S01_AXI_bresp(S01_AXI_bresp),
    .S01_AXI_bvalid(S01_AXI_bvalid),
    .S01_AXI_bready(S01_AXI_bready),
    .S01_AXI_araddr(S01_AXI_araddr),
    .S01_AXI_arlen(S01_AXI_arlen),
    .S01_AXI_arsize(S01_AXI_arsize),
    .S01_AXI_arburst(S01_AXI_arburst),
    .S01_AXI_arlock(S01_AXI_arlock),
    .S01_AXI_arcache(S01_AXI_arcache),
    .S01_AXI_arprot(S01_AXI_arprot),
    .S01_AXI_arregion(S01_AXI_arregion),
    .S01_AXI_arqos(S01_AXI_arqos),
    .S01_AXI_arvalid(S01_AXI_arvalid),
    .S01_AXI_arready(S01_AXI_arready),
    .S01_AXI_rdata(S01_AXI_rdata),
    .S01_AXI_rresp(S01_AXI_rresp),
    .S01_AXI_rlast(S01_AXI_rlast),
    .S01_AXI_rvalid(S01_AXI_rvalid),
    .S01_AXI_rready(S01_AXI_rready),
    .M00_AXI_awaddr(M00_AXI_awaddr),
    .M00_AXI_awlen(M00_AXI_awlen),
    .M00_AXI_awsize(M00_AXI_awsize),
    .M00_AXI_awburst(M00_AXI_awburst),
    .M00_AXI_awlock(M00_AXI_awlock),
    .M00_AXI_awcache(M00_AXI_awcache),
    .M00_AXI_awprot(M00_AXI_awprot),
    .M00_AXI_awregion(M00_AXI_awregion),
    .M00_AXI_awqos(M00_AXI_awqos),
    .M00_AXI_awvalid(M00_AXI_awvalid),
    .M00_AXI_awready(M00_AXI_awready),
    .M00_AXI_wdata(M00_AXI_wdata),
    .M00_AXI_wstrb(M00_AXI_wstrb),
    .M00_AXI_wlast(M00_AXI_wlast),
    .M00_AXI_wvalid(M00_AXI_wvalid),
    .M00_AXI_wready(M00_AXI_wready),
    .M00_AXI_bresp(M00_AXI_bresp),
    .M00_AXI_bvalid(M00_AXI_bvalid),
    .M00_AXI_bready(M00_AXI_bready),
    .M00_AXI_araddr(M00_AXI_araddr),
    .M00_AXI_arlen(M00_AXI_arlen),
    .M00_AXI_arsize(M00_AXI_arsize),
    .M00_AXI_arburst(M00_AXI_arburst),
    .M00_AXI_arlock(M00_AXI_arlock),
    .M00_AXI_arcache(M00_AXI_arcache),
    .M00_AXI_arprot(M00_AXI_arprot),
    .M00_AXI_arregion(M00_AXI_arregion),
    .M00_AXI_arqos(M00_AXI_arqos),
    .M00_AXI_arvalid(M00_AXI_arvalid),
    .M00_AXI_arready(M00_AXI_arready),
    .M00_AXI_rdata(M00_AXI_rdata),
    .M00_AXI_rresp(M00_AXI_rresp),
    .M00_AXI_rlast(M00_AXI_rlast),
    .M00_AXI_rvalid(M00_AXI_rvalid),
    .M00_AXI_rready(M00_AXI_rready),
    .M01_AXI_awaddr(M01_AXI_awaddr),
    .M01_AXI_awlen(M01_AXI_awlen),
    .M01_AXI_awsize(M01_AXI_awsize),
    .M01_AXI_awburst(M01_AXI_awburst),
    .M01_AXI_awlock(M01_AXI_awlock),
    .M01_AXI_awcache(M01_AXI_awcache),
    .M01_AXI_awprot(M01_AXI_awprot),
    .M01_AXI_awregion(M01_AXI_awregion),
    .M01_AXI_awqos(M01_AXI_awqos),
    .M01_AXI_awvalid(M01_AXI_awvalid),
    .M01_AXI_awready(M01_AXI_awready),
    .M01_AXI_wdata(M01_AXI_wdata),
    .M01_AXI_wstrb(M01_AXI_wstrb),
    .M01_AXI_wlast(M01_AXI_wlast),
    .M01_AXI_wvalid(M01_AXI_wvalid),
    .M01_AXI_wready(M01_AXI_wready),
    .M01_AXI_bresp(M01_AXI_bresp),
    .M01_AXI_bvalid(M01_AXI_bvalid),
    .M01_AXI_bready(M01_AXI_bready),
    .M01_AXI_araddr(M01_AXI_araddr),
    .M01_AXI_arlen(M01_AXI_arlen),
    .M01_AXI_arsize(M01_AXI_arsize),
    .M01_AXI_arburst(M01_AXI_arburst),
    .M01_AXI_arlock(M01_AXI_arlock),
    .M01_AXI_arcache(M01_AXI_arcache),
    .M01_AXI_arprot(M01_AXI_arprot),
    .M01_AXI_arregion(M01_AXI_arregion),
    .M01_AXI_arqos(M01_AXI_arqos),
    .M01_AXI_arvalid(M01_AXI_arvalid),
    .M01_AXI_arready(M01_AXI_arready),
    .M01_AXI_rdata(M01_AXI_rdata),
    .M01_AXI_rresp(M01_AXI_rresp),
    .M01_AXI_rlast(M01_AXI_rlast),
    .M01_AXI_rvalid(M01_AXI_rvalid),
    .M01_AXI_rready(M01_AXI_rready),
    .aclk0(aclk0),
    .aclk1(aclk1),
    .aclk2(aclk2),
    .aclk3(aclk3),
    .sys_clk0_clk_p(sys_clk0_clk_p),
    .sys_clk0_clk_n(sys_clk0_clk_n),
    .CH0_DDR4_0_dq(CH0_DDR4_0_dq),
    .CH0_DDR4_0_dqs_t(CH0_DDR4_0_dqs_t),
    .CH0_DDR4_0_dqs_c(CH0_DDR4_0_dqs_c),
    .CH0_DDR4_0_adr(CH0_DDR4_0_adr),
    .CH0_DDR4_0_ba(CH0_DDR4_0_ba),
    .CH0_DDR4_0_bg(CH0_DDR4_0_bg),
    .CH0_DDR4_0_act_n(CH0_DDR4_0_act_n),
    .CH0_DDR4_0_reset_n(CH0_DDR4_0_reset_n),
    .CH0_DDR4_0_ck_t(CH0_DDR4_0_ck_t),
    .CH0_DDR4_0_ck_c(CH0_DDR4_0_ck_c),
    .CH0_DDR4_0_cke(CH0_DDR4_0_cke),
    .CH0_DDR4_0_cs_n(CH0_DDR4_0_cs_n),
    .CH0_DDR4_0_dm_n(CH0_DDR4_0_dm_n),
    .CH0_DDR4_0_odt(CH0_DDR4_0_odt),
    .S01_AXI_arid(S01_AXI_arid),
    .S01_AXI_aruser(S01_AXI_aruser),
    .S01_AXI_awid(S01_AXI_awid),
    .S01_AXI_awuser(S01_AXI_awuser),
    .S01_AXI_bid(S01_AXI_bid),
    .S01_AXI_rid(S01_AXI_rid),
    .S01_AXI_ruser(S01_AXI_ruser),
    .S01_AXI_wuser(S01_AXI_wuser),
    .S00_AXI_arid(S00_AXI_arid),
    .S00_AXI_aruser(S00_AXI_aruser),
    .S00_AXI_awid(S00_AXI_awid),
    .S00_AXI_awuser(S00_AXI_awuser),
    .S00_AXI_bid(S00_AXI_bid),
    .S00_AXI_rid(S00_AXI_rid),
    .S00_AXI_ruser(S00_AXI_ruser),
    .S00_AXI_wuser(S00_AXI_wuser),
    .M00_AXI_arid(M00_AXI_arid),
    .M00_AXI_aruser(M00_AXI_aruser),
    .M00_AXI_awid(M00_AXI_awid),
    .M00_AXI_awuser(M00_AXI_awuser),
    .M00_AXI_bid(M00_AXI_bid),
    .M00_AXI_rid(M00_AXI_rid),
    .M01_AXI_arid(M01_AXI_arid),
    .M01_AXI_aruser(M01_AXI_aruser),
    .M01_AXI_awid(M01_AXI_awid),
    .M01_AXI_awuser(M01_AXI_awuser),
    .M01_AXI_bid(M01_AXI_bid),
    .M01_AXI_rid(M01_AXI_rid),
    .M01_AXI_ruser(M01_AXI_ruser),
    .M01_AXI_wuser(M01_AXI_wuser)
  );
endmodule
