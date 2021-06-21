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
sed 

#return to starting dir
cd -
