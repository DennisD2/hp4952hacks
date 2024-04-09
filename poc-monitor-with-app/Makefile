
# memdump code + monitor
memdump:
	z80asm -o memdump.app memdump.asm
	cp memdump.app $(HOME)/dosbox/util_1/MEMDUMP.APP
	z80dasm -t -a -g 0x0 memdump.app -o memdump.dasm

clean:
	rm -f memdump.app  memdump.dasm




