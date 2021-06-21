# chipyard-arty-fpga
Improvements for FPGA prototyping on Arty Board in Chipyard

This project will entail:
* Creating Support for utility of the Freedom E SDK project inside of the Chipyard FPGA Prototyping Framework
* Improvement of the Arty FPGA prototyping experience

*Steps Taken*

1. Added multilib support to RISCV-GNU-Toolchain in Chipyard by appending "--enable-multilib" to the arguments passed during toolchain creation (in /scripts/build-toolchains.sh)

#TODO finish Readme
