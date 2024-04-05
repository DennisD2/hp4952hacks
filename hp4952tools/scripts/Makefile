# conversion tasks, currently more a simple demonstration
SRCDIR=../../disassembler-test

# convert z80 asm assembler flavour to CPC-WinApe flavour
z80asm-to-cpc-assembler: cpc-assembler-to-z80asm
	sed -E -f z80asm-to-cpc-assembler.sed \
		<./disassembler-z80a.asm >disassembler-cpca.asm
	sed -E -f z80asm-to-cpc-assembler.sed \
		<./disdata-z80a.asm >disdata-cpca.asm
	sed -E -f z80asm-to-cpc-assembler.sed \
		<./missing-z80a.asm >missing-cpca.asm
	#z80asm -o disassembler.app disassembler.asm
	#z80dasm -t -a -g 0x0 disassembler.app -o disassembler.dasm


# convert CPC-WinApe assembler flavour to z80 asm flavour
cpc-assembler-to-z80asm:
	sed -E -f cpc-assembler-to-z80asm.sed \
		<$(SRCDIR)/disassembler.asm >disassembler-z80a.asm
	sed -E -f cpc-assembler-to-z80asm.sed \
		<$(SRCDIR)/disdata.asm >disdata-z80a.asm
	sed -E -f cpc-assembler-to-z80asm.sed \
		<$(SRCDIR)/missing.asm >missing-z80a.asm
	z80asm -o disassembler-z80a.app disassembler-z80a.asm
	z80dasm -t -a -g 0x0 disassembler-z80a.app -o disassembler-z80a.dasm

clean:
	rm -f disassembler*.asm missing*.asm disdata*.asm *.app disassembler*.dasm
