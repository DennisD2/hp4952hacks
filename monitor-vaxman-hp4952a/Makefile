
# assemble monitor for HP4592A

monitor-new:
	z80asm -o monitor-z80asm.app monitor.asm
	cp monitor-z80asm.app $(HOME)/dosbox/util_1/MON.APP
	z80dasm -t -a -g 0x0 monitor-z80asm.app -o monitor-z80asm.dasm

monitor:
	z80asm -o monitor.app monitor.asm
	cp monitor.app $(HOME)/dosbox/util_1/MON.APP
	z80dasm -t -a -g 0x0 monitor.app -o monitor.dasm


clean:
	rm -f monitor.app  monitor.dasm hpmon.app




