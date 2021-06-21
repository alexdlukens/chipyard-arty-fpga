#!/bin/bash

#Script to enable multilib support to RISCV-GNU-Toolchain in Chipyard
#Alexander Lukens 06/21/2021

#Move to script directory
cd "$(dirname "$0")"

#Path to Chipyard Base DIR
CHIPYARD_DIR=$(pwd)/../..
#Path to 'build-toolchains.sh'
BUILD_TOOLCHAINS=${CHIPYARD_DIR}/scripts/build-toolchains.sh

#edit build_toolchians.sh to support multilib
sed -i 's/--enable-multilib/ /g ' $BUILD_TOOLCHAINS

sed -i 's/module_build riscv-gnu-toolchain --prefix="${RISCV}" --with-cmodel=medany/module_build riscv-gnu-toolchain --prefix="${RISCV}" --with-cmodel=medany --enable-multilib/g' $BUILD_TOOLCHAINS

#add additional variables to Chipyard ENV files to support Freedom E SDK
grep -qF 'RISCV_PATH' $BUILD_TOOLCHAINS || sed -i '/${LD_LIBRARY_PATH}"}/ a \\n#added by update_build_toolchains script \nexport RISCV_PATH=${RISCV} \nexport RISCV_OPENOCD_PATH=${RISCV} \nexport FREEDOM_SDK=/home/alex/Desktop/chipThings/freedom-e-sdk \nexport FPGA_PATH=${RISCV}/../fpga' $BUILD_TOOLCHAINS


#return to starting dir
cd -
