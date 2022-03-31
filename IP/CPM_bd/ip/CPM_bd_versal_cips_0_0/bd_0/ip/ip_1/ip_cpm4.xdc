# GT Reference clock 0
create_clock -period 10.0 -name GT_REFCLK0 [get_pins -filter {REF_PIN_NAME==I} -of [get_cells IBUFDS_GTE5_PCIeA0_inst]]

# GT XPIPE clock 0
create_clock -period 4.0 -name XPIPE_GT_OUTCLK_0 [get_pins -filter {REF_PIN_NAME == IFCPMXPIPELINK0XPIPEGTOUTCLK} -of [get_cells CPM_INST]]
create_clock -period 4.0 -name XPIPE_GT_PIPECLK_0 [get_pins -filter {REF_PIN_NAME == IFCPMXPIPELINK0XPIPEGTPIPECLK} -of [get_cells CPM_INST]]

# DPLL0 Clock
create_clock -period 3.2 -name dpll0_clkout1 [get_pins -filter {REF_PIN_NAME == CLKOUT1} -of [get_cells DPLL_PCIE0_inst]]

#Set asynchronous group
set_clock_groups -name gt_clk_grp0 -asynchronous -group [get_clocks GT_REFCLK0] -group [get_clocks XPIPE_GT_PIPECLK_0]
set_clock_groups -name dpll0_clk_grp -asynchronous -group [get_clocks dpll0_clkout1] -group [get_clocks dpll0_drp_dclk]

# PCIe 0 DPLL Location
set_property LOC DPLL_X1Y4 [get_cells DPLL_PCIE0_inst]

# DPLL0 Timing constraints
set_property PERF_MODE FULL [get_cells DPLL_PCIE0_inst]
set_property DESKEW_DELAY 12 [get_cells DPLL_PCIE0_inst]
set_property DESKEW_DELAY_EN TRUE [get_cells DPLL_PCIE0_inst]
set_property DESKEW_DELAY_PATH TRUE [get_cells DPLL_PCIE0_inst]
set_property GCLK_DESKEW Off [get_nets -of [get_pins bufg_pcie_0/O]]
set_property USER_CLOCK_ROOT X1Y2 [get_nets -of [get_pins bufg_pcie_0/O]]

# PCIE 0 GT Locations
set_property LOC GTY_QUAD_X0Y3 [get_cells gt_quad_inst0/inst/quad_inst]
set_property LOC GTY_QUAD_X0Y4 [get_cells gt_quad_inst1/inst/quad_inst]

# GT Reference clock 0 Location
set_property LOC GTY_REFCLK_X0Y6 [get_cells IBUFDS_GTE5_PCIeA0_inst]

set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_*XPD[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_RXSLIDE]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXCOMSAS]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXCOMINIT]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXCOMWAKE]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXINHIBIT]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXPIPPMEN]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_*XRATE[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXDATA[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXDETECTRX]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXELECIDLE]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXCTRL*[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_*XPOLARITY]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXHEADER[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXONESZEROS]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_RXCHBONDI[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_*XPRBSSEL[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_RXGEARBOXSLIP]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXSEQUENCE[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_EYESCANTRIGGER]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/CH*_TXPIPPMSTEPSIZE[*]]

set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/RXMARGINREQREQ]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/RXMARGINRESACK]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/RXMARGINREQCMD[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/RXMARGINREQPAYLD[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/RXMARGINREQLANENUM[*]]

set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/S*_AXIS_TLAST]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/S*_AXIS_TVALID]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/M*_AXIS_TREADY]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/S*_AXIS_TDATA[*]]
set_case_analysis 0 [get_pins gt_quad_inst*/inst/quad_inst/DEBUGTRACEREADY]

# Waiving DPLL Deskew defeatured DRC error
create_waiver -type DRC -id {AVALXA-261} -tags 1079051 -scoped -internal -description "Waiving DPLL Deskew defeatured DRC" -objects [get_cells  DPLL_*]
create_waiver -type Methodology -id TIMING-1 -tags 1100037 -scoped -internal -description "Waive off Clock generation" -objects [get_clocks dpll?_clkout1]
create_waiver -type Methodology -id TIMING-2 -tags 1100037 -scoped -internal -description "Waive off Clock generation" -objects [get_clocks XPIPE_GT_OUTCLK*]
create_waiver -type Methodology -id TIMING-3 -tags 1100037 -scoped -internal -description "Waive off Clock generation" -objects [get_clocks "GT_REFCLK* XPIPE_GT_PIPECLK* dpll?_clkout1"]
