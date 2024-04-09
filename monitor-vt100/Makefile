# assemble vt100 with monitor code
vt100m:
	z80asm -o vt100m.app vt100.asm
	cp vt100m.app $(HOME)/dosbox/util_1/VT100M.APP
	z80dasm -t -a -g 0xa000 -o vt100m.dasm vt100m.app

clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb vt100m.dasm
