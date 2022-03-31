# XILINX_VCK190_POWER_MEASUREMENT_SETUP

To  recoustomize IP:
> cd IP
> vivado -source vivado_project.tcl

To Build with Vivado 2021.1 :
> cd vivado_project
> vivado -source vivado_project.tcl
THis will build the  test design and write the vck190_test_top.xsa file

To Create  SD Bootable LInux using petaLinux:

> cd PLNX
> ./plnx_bld

 - THis will open  Linux configuration menu. Modify the  selections as below:
     DTG Settings ---> versal-vck190-reva-x-ebm-01-reva
     Image Packaging Configuration -> Root filesyatem type -> SD Card

 - All other menu selections a can be defaults.


 After the build finishes BOOT.BIN. boot.scr, image.ub  and rootfs.tar.gz can be copied to an SD card as follows.

 1. Prepare an SD Card with 2 Partition
     First Partition  with FAT32 format ( 1GB size)
     Second Partition ext4 (> 8GB , could be any size)
 2. Copy BOOT.BIN, boot.scr and image.ub to the First Partition (FAT32).
 3. Extract rootfs.tar.gz to the seconf Partition (ext4)
      -ie,  tar -zxvf rootfs.tar.gz -C <mount_pont_of_Second_partition>
  4. sync

Running the design  on VCK190 and ,measuring power:
    Use the process outlined in the following confluence page:
    https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/973078551/BEAM+Tool+for+VCK190+Evaluation+Kit


