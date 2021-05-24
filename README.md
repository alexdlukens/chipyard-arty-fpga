# chipyard-arty-fpga
Improvements for FPGA prototyping on Arty Board in Chipyard

This project will entail:
* Customization of the SiFive Metal Library to include explicit support 
for ther Chipyard Arty Implementaiton
* Integrate OpenOCD and GDB support for creating software within the Chipyard framework

*Steps Taken*

1. Added multilib support to RISCV-GNU-Toolchain in Chipyard by appending "--enable-multilib" to the arguments passed during toolchain creation (in /scripts/build-toolchains.sh"

**make** module\_build riscv-gnu-toolchain --prefix="${RISCV}" --with-cmodel=medany

**this** module\_build riscv-gnu-toolchain --prefix="${RISCV}" --with-cmodel=medany **--enable-multilib**

2. Ensure $RISCV\_PATH and $RISCV\_OPENOCD\_PATH set for Freedom-e-sdk support

#TODO finish Readme
