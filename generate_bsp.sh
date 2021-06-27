#!/bin/bash

#A Shell Script to generate bsp files for an elaborated FPGA design in
#Chipyard

#Had to do some shenanigans to add "flash@0" device in DTS under SPI Flash node. This is checked by overlay generators in
#the Freedom E SDK


#Name of the directory where generated board files are placed
#in the default project, this is the following:
LONG_NAME=chipyard.fpga.arty.ArtyFPGATestHarness.ArtyWithGPIOConfig

#Generated DTS Path
GENERATED_DTS=${FPGA_PATH}/generated-src/${LONG_NAME}/${LONG_NAME}.dts

EXIT_DIR=$(pwd)
cd "$(dirname "$0")"

if [ ! -f "${GENERATED_DTS}" ]; then
	echo "Generated DTS file does not exist. Ensure the \"LONG_NAME\" variable is set correctly in this script";
	exit 1;
fi


#edit dts file to include 'flash' device under spi@10014000 node
LINE_NUM=$(awk '/@10014000/ {print FNR}' ${GENERATED_DTS})

if grep -qF "flash@0" ${GENERATED_DTS};then
	echo "DTS File already has flash device"
else
	echo "Editing DTS File"
	sed -i "${LINE_NUM},/\};/{s/\};/\tflash@0 \{\n\t\t\t\tcompatible = \"jedec,spi-nor\"; \n\t\t\t\treg = <0x20000000 0x7a12000>; \n\t\t\t\}; \n\t\t\};/}" ${GENERATED_DTS}

fi


if [ ! -d "${FREEDOM_SDK}/bsp/chipyard_arty" ]; then
	mkdir ${FREEDOM_SDK}/bsp/chipyard_arty;
fi

#Use Freedom E SDK 'update-targets.sh' script to generate board files
cd ${FREEDOM_SDK}/bsp
./update-targets.sh --target-name chipyard_arty --target-type arty --sdk-path=${FREEDOM_SDK} --target-dts=${GENERATED_DTS} || exit 1;

echo "File Generation Complete. Find the created files in ${FREEDOM_SDK}/bsp/chipyard_arty"

cd ${EXIT_DIR}
