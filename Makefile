# assemble and compare result against original.
check:
	z80asm -o vt100c.app vt100.asm
	z80dasm -t -a -g 0xa000 -o vt100.dasm vt100c.app
	cmp -b -l vt100c.app VT100.no_header

# initial disassemble step
vt100dis:
	z80dasm -t -a -g 0xa000 -o vt100-orig.dasm VT100.no_header

copydisk:
	z80dasm -t -a -g 0xa000 -o copy-disk-orig.dasm COPY_DISC.APP

# keyboard test app from https://github.com/dkgrizzly/4952oss
keyboard:
	z80asm -o keyboard.app keyboard.asm
	cp keyboard.app $(HOME)/dosbox/util_1/KEYBOARD.APP

# hello world app - reduced from keyboard app
hello:
	z80asm -o hello.app hello.asm 
	cp hello.app $(HOME)/dosbox/util_1/HELLO.APP
	z80dasm -t -a -g 0xa000 hello.app -o hello.dasm

clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb


