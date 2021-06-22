# chipyard-arty-fpga
Improvements for FPGA prototyping on Arty Board in Chipyard

This project will entail:
* Creating Support for utility of the Freedom E SDK project inside of the Chipyard FPGA Prototyping Framework
* Improvement of the Arty FPGA prototyping experience

*Steps Taken*

1. Added multilib support to RISCV-GNU-Toolchain in Chipyard by appending "--enable-multilib" to the arguments passed during toolchain creation (in /scripts/build-toolchains.sh)


# About

* **update\_build\_toolchains.sh**

This script is intended to be used before running the 'build\_toolchains.sh script located under {chipyard\_dir}/scripts. This will enable multilib support required to compile c programs for RV32 (used by the Chipyard Arty FPGA project. This script also adds several variables used by the Freedom E SDK and other scripts to the environment variables file for Chipyard.

Assumes that Freedom E SDK is in the same parent directory as Chipyard

* **genrate\_bsp.sh**

This script is used to generate custom board support files for the Freedom E SDK for the Chipyard Arty FPGA default project. After running the update\_build\_toolchains.sh script and re-executing build\_toolchains.sh, the environment variables should be updated to include the Freedom E SDK install location.

Running this script will create a new folder under the 'bsp' in the Freedom E SDK named 'chipyard\_arty"


# Usage

* **update\_build\_toolchains.sh**

> ./update\_build\_toolchains.sh \<Path to Freedom E SDK\>

* **generate\_bsp.sh**

> ./generate\_bsp.sh

# TODO finish Readme
