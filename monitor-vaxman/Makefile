
# assemble Vaxmans original code, adjusted for z80asm
monitor-orig:
	z80asm -o monitor-orig-z80asm.app monitor-orig-z80asm.asm
	z80dasm -t -a -g 0x0 monitor-orig-z80asm.app -o monitor-orig-z80asm.dasm

clean:
	rm -f monitor.app  monitor.dasm hpmon.app




