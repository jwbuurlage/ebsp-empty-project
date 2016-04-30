ESDK=${EPIPHANY_HOME}
ELDF=ext/bsp/ebsp_fast.ldf

CFLAGS=-std=c99 -O3 -ffast-math -Wall

INCLUDES = -Iext/bsp/include \
		   -I${ESDK}/tools/host/include

HOST_LIBS = -Lext/bsp/lib \
			-L${ESDK}/tools/host/lib \
			-L/usr/arm-linux-gnueabihf/lib

E_LIBS = -Lext/bsp/lib \
		 -L${ESDK}/tools/host/lib

HOST_LIB_NAMES = -lhost-bsp -le-hal -le-loader

E_LIB_NAMES = -le-bsp -le-lib

########################################################

all: bin bin/host_program bin/ecore_program.elf

########################################################

bin:
	@mkdir -p bin

bin/host_program: src/host_code.c
	@echo "CC $<"
	@gcc $(CFLAGS) $(INCLUDES) -o $@ $< $(HOST_LIBS) $(HOST_LIB_NAMES)
	
bin/ecore_program.elf: src/ecore_code.c
	@echo "CC $<"
	@e-gcc $(CFLAGS) -T ${ELDF} $(INCLUDES) -o $@ $< $(E_LIBS) $(E_LIB_NAMES)

########################################################

clean:
	rm -r bin
