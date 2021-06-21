

PROJ ?= arty


.PHONY: bits
  bits:
	cd ${FPGA_PATH}; \
	make SUB_PROJECT=$(PROJ) bitstream; \
	cd -

.PHONY: generate-bsp
  generate-bsp: $(bits)
	cd ${build_dir}; \
	if [ -d "./bsp"]; then
		cd ./bsp;\
	else
		mkdir bsp && cd $_; \
	fi
	echo ${PWD}

	
