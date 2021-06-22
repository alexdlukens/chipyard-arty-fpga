#!/bin/bash

#A Shell Script to generate bsp files for an elaborated FPGA design in
#Chipyard
#Alexander Lukens 06/21/2021


#Name of the directory where generated board files are placed
#in the default project, this is the following:
LONG_NAME=chipyard.fpga.arty.ArtyFPGATestHarness.TinyRocketArtyConfig

#Generated DTS Path
GENERATED_DTS=${FPGA_PATH}/generated-src/${LONG_NAME}/${LONG_NAME}.dts

EXIT_DIR=$(pwd)
cd "$(dirname "$0")"

if [ ! -f "${GENERATED_DTS}" ]; then
	echo "Generated DTS file does not exist. Ensure the \"LONG_NAME\" variable is set correctly in this script";
	exit 1;
fi
if [ ! -d "${FREEDOM_SDK}/bsp/chipyard_arty" ]; then
	mkdir ${FREEDOM_SDK}/bsp/chipyard_arty;
fi

#Use Freedom E SDK 'update-targets.sh' script to generate board files
cd ${FREEDOM_SDK}/bsp
./update-targets.sh --target-name chipyard_arty --target-type arty --sdk-path=${FREEDOM_SDK} --target-dts=${GENERATED_DTS} || exit 1;

echo "File Generation Complete. Find the created files in ${FREEDOM_SDK}/bsp/chipyard_arty"

cd ${EXIT_DIR}
