#include<stdio.h>
#include<math.h>
#include <errno.h>

#include <fcntl.h>
#include <sys/types.h>
#include <sys/mman.h>

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <chrono>
#include <cmath>
#include "pcie_memio.h" 
#include "srai_accel_utils.h" 
#define ZERO_f 1.0e-4
#define ITERATION_SZ 1
//#define ITERATION_SZ 4096
//#define ITERATION_SZ 8192
//#define ITERATION_SZ 16384
//#define ITERATION_SZ 32768
#define ONE_GIG (1024UL*1024UL*1024UL)

#define TEST_DATA_SIZE 1024

using namespace std;


int main(int argc, char** argv) {

  unsigned long int itrn = 0;
  uint32_t itn_count = 0;
  time_t t;
  srand((unsigned) time(&t));
  double high_res_elapsed_time = 0.0f;
  double high_res_elapsed_time_HW = 0.0f;
  double high_res_elapsed_time_SW = 0.0f;
  chrono::high_resolution_clock::time_point start_t;
  chrono::high_resolution_clock::time_point stop_t;
  chrono::duration<double> elapsed_hi_res;


  uint64_t cal_itn_count = 0;

// Compile for SRAI custom HLS accelerator platform 
    uint32_t PCI_BAR_base_VF0;
    stringstream PCI_BAR_VF0_base_str;

    if (argc != 2) {
        printf("usage: %s fpga_bin_file \n", argv[0]);
        return -1;
    }

    PCI_BAR_VF0_base_str << hex <<  argv[1]; 

    PCI_BAR_VF0_base_str >> PCI_BAR_base_VF0;

    
    cout << "VF0 Base Addr = 0x"  << hex << PCI_BAR_base_VF0 << endl;

    cout << "Initializing FPGA\n";
    fpga_xdma_dev_mem *fpga_ptr_vf0 = new fpga_xdma_dev_mem;
    fpga_ptr_vf0->fpga_xdma_dev_mem_init((4*1024*1024), PCI_BAR_base_VF0);


    unsigned char *to_FPGA_data_buf = new unsigned char[ONE_GIG];
    unsigned char *from_FPGA_data_buf = new unsigned char[ONE_GIG];
    for (int i= 0; i < ONE_GIG; i ++) {
        to_FPGA_data_buf[i] = ((unsigned char)((rand() % 256)));
    }

    cout << dec << "Testing BRAM 8K Memory \n";
    fpga_test_AXIL_LITE_8KSCRATCHPAD_BRAM (fpga_ptr_vf0);

    int xfer_count = 0;
    int ERR_count = 0;
    start_t = chrono::high_resolution_clock::now();
    xfer_count = fpga_ptr_vf0->fpga_xDMA_write64((0x0000000000000000), (char *)(to_FPGA_data_buf), ONE_GIG);
    xfer_count = fpga_ptr_vf0->fpga_xDMA_read64((0x0000000000000000), (char *)(from_FPGA_data_buf), ONE_GIG);
    stop_t = chrono::high_resolution_clock::now();
    elapsed_hi_res = stop_t - start_t ;
    high_res_elapsed_time = elapsed_hi_res.count();
    double xDMA_round_Trip_thruput = (ONE_GIG/high_res_elapsed_time);
    cout << "xDMA Execution time =  " <<  high_res_elapsed_time << "s\n";
    cout << "xDMA THroughput =  " << xDMA_round_Trip_thruput  << " Bytes/s\n";
    for (int i= 0; i < ONE_GIG; i++) {
        if(to_FPGA_data_buf[i] != from_FPGA_data_buf[i]) {
            ERR_count++;
        }
    } 

    cout << "xDMA xfer Err Count : " << dec << ERR_count << endl;


    fpga_clean(fpga_ptr_vf0);
    cout << "*************     Test finished ****************************************************************************\n"; 
    return 0;
}


