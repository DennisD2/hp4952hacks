
# crt in sdcc SDASZ80 code style
crt:
	z80asm -o monitor.app monitor.asm
	# next step is: link

binary:
	cp monitor.bin $(HOME)/dosbox/util_1/mon.APP
	z80dasm -t -a -g 0x0 monitor.bin -o monitor.dasm

clean:
	rm -f monitor.app  monitor.dasm




