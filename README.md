# chipyard-arty-fpga
Improvements for FPGA prototyping on Arty Board in Chipyard

This project will entail:
* Creating Support for utility of the Freedom E SDK project inside of the Chipyard FPGA Prototyping Framework
* Improvement of the Arty FPGA prototyping experience

*Steps Taken*

1. Added multilib support to RISCV-GNU-Toolchain in Chipyard by appending "--enable-multilib" to the arguments passed during toolchain creation (in /scripts/build-toolchains.sh)


# About

* The update\_build\_toolchains.sh script is intended to be used before running the 'build\_toolchains.sh script located under {chipyard\_dir}/scripts to enable multilib support required to compile c programs for RV32 (used by the Chipyard Arty FPGA project. This script also adds several variables used by the Freedom E SDK and other scripts to the environment variables file for Chipyard.

# Usage

# TODO finish Readme
