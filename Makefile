# assemble and compare result against original.
check:
	z80asm -o vt100c.app vt100.asm
	cmp vt100c.app VT100.no_header

# initial disassemble step
disassemble:
	z80dasm -t -a -g 0xa000 -o vt100.dasm VT100.no_header


