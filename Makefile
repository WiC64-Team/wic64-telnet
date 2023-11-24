ASM = acme
ASMFLAGS = -f cbm -v3 --color -Wno-label-indent
EMU ?= x64sc
EMUFLAGS ?=
LIBRARY = ../wic64-library
INCLUDES = -I$(LIBRARY)
SOURCES = *.asm $(LIBRARY)/wic64.asm $(LIBRARY)/wic64.h
TARGET = wic64-telnet

.PHONY: all clean

all: $(TARGET).prg

$(TARGET).prg: $(SOURCES)
	$(ASM) $(ASMFLAGS) $(INCLUDES) -l $(TARGET).sym -o $(TARGET).prg  main.asm

test: $(TARGET).prg
	$(EMU) $(EMUFLAGS) $(TARGET).prg

clean:
	rm -f *.{prg,sym}