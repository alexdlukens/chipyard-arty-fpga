# chipyard-arty-fpga
Improvements for FPGA prototyping on Arty Board in Chipyard

This project will entail:
* Customization of the SiFive Metal Library to include explicit support 
for ther Chipyard Arty Implementaiton
* Integrate OpenOCD and GDB support for creating software within the Chipyard framework

*Steps Taken*

1. Added multilib support to RISCV-GNU-Toolchain in Chipyard by replacing parameters in 
/toolchains/riscv-tools/riscv-gnu-toolchain/Makefile.in from "disable-multilib" to "enable-multilib"

2. Ensure $RISCV\_PATH and $RISCV\_OPENOCD\_PATH set for Freedom-e-sdk support

#TODO finish Readme
