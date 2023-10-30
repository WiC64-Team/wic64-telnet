ASM = acme
ASMFLAGS = -Dwic64_build_report=1 -Dwic64_optimize_for_size=0 -v3 --color -Wno-label-indent
EMU ?= x64sc
EMUFLAGS ?=
LIBRARY = ../wic64-library
INCLUDES = -I$(LIBRARY)
SOURCES = $(LIBRARY)/wic64.asm $(LIBRARY)/wic64.h

.PHONY: all clean

%.prg: %.asm $(SOURCES)
	$(ASM) $(ASMFLAGS) $(INCLUDES) -f cbm -l $*.sym -o $*.prg  $*.asm

all: main.prg

test: main.prg
	$(EMU) $(EMUFLAGS) main.prg

clean:
	rm -f *.{prg,sym}