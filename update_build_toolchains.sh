#!/bin/bash

#Script to enable multilib support to RISCV-GNU-Toolchain in Chipyard
#Alexander Lukens 06/21/2021

#Move to script directory
cd "$(dirname "$0")"

#Path to Chipyard Base DIR
CHIPYARD_DIR=$(pwd)/../..
#Path to 'build-toolchains.sh'
BUILD_TOOLCHAINS=${CHIPYARD_DIR}/scripts/build-toolchains.sh
FREEDOM_SDK_PATH=${1:-$(readlink -f $(pwd)/../../../freedom-e-sdk)}

if [ $# -eq 0 ];
then
	echo "FREEDOM_SDK_PATH not specified, defaulting to:"
        echo "$FREEDOM_SDK_PATH"
	printf "\nUsage: ./update_build_toolchains.sh <PATH_TO_FREEDOM_SDK>\n\n"
fi

#edit build_toolchians.sh to support multilib
sed -i 's/--enable-multilib/ /g ' $BUILD_TOOLCHAINS

sed -i 's/module_build riscv-gnu-toolchain --prefix="${RISCV}" --with-cmodel=medany/module_build riscv-gnu-toolchain --prefix="${RISCV}" --with-cmodel=medany --enable-multilib/g' $BUILD_TOOLCHAINS

#if customizations already added, remove them
sed -i -e '/#added by update_build/, +4d' $BUILD_TOOLCHAINS 

#remove pesky empty line after deleted customizations (if it exists)
sed -i '/${LD_LIBRARY_PATH}/{N;s/\n$//}' $BUILD_TOOLCHAINS

#add additional variables to Chipyard ENV files to support Freedom E SDK
sed -i '/${LD_LIBRARY_PATH}"}/ a \\n#added by update_build_toolchains script \nexport RISCV_PATH=${RISCV} \nexport RISCV_OPENOCD_PATH=${RISCV} \nexport FPGA_PATH=${RISCV}/../fpga' $BUILD_TOOLCHAINS

sed -i "/{RISCV}\/..\/fpga/ a export FREEDOM_SDK=$FREEDOM_SDK_PATH" $BUILD_TOOLCHAINS


#return to starting dir
cd -
