
# assemble monitor for HP4592A
monitor:
	z80asm -o monitor.app monitor.asm
	cp monitor.app $(HOME)/dosbox/util_1/MON.APP
	z80dasm -t -a -g 0x0 monitor.app -o monitor.dasm

# assemble original code, adjusted for z80asm
monitor-orig:
	z80asm -o monitor-z80asm.app monitor-z80asm.asm
	z80dasm -t -a -g 0x0 monitor-z80asm.app -o monitor-z80asm.dasm

clean:
	rm -f monitor.app  monitor.dasm hpmon.app




