
hpmon:
	z80asm -o hpmon.app hpmon.asm
	cp hpmon.app $(HOME)/dosbox/util_1/mon.APP
	z80dasm -t -a -g 0x0 hpmon.app -o hpmon.dasm


monitor:
	z80asm -o monitor.app monitor.asm
	z80dasm -t -a -g 0x0 monitor.bin -o monitor.dasm


clean:
	rm -f monitor.app  monitor.dasm hpmon.app




