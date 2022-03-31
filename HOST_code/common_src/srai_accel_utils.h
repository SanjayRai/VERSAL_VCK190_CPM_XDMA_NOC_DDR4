/* Sanjay Rai - Routine to access PCIe via  dev.mem mmap  */
#ifndef SRAI_ACCEL_UTILS_H_
#define SRAI_ACCEL_UTILS_H_

/* Address Ranges as defined in VIvado IPI Address map */
/* NOTE: Be aware on any PCIe-AXI Address translation setup on the xDMA/PCIEBridge*/ 
/*       These address translations affect the address shown . THese address are  */
/*       exactly waht is populated on the IPI Address tab                         */
/* AXI MM Register interfaces */
#define AXI_MM_DDR4_C0         0x8000000400000000ULL
#define AXI_LITE_SCRATCH_PAD_BRAM        0x00000000UL

int fpga_clean (fpga_xdma_dev_mem *my_fpga_ptr);
void fpga_test_AXIL_LITE_8KSCRATCHPAD_BRAM (fpga_xdma_dev_mem *fpga_AXI_Lite_ptr);
void SRAI_dbg_wait (string dbg_string);
#endif // SRAI_ACCEL_UTILS_H_
