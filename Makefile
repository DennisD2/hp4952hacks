
disassemble:
	z80dasm -t -a -g 0xa000 -o vt100.dasm VT100.no_header
