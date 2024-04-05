SRCDIR=../../disassembler-test

# conversion tasks, currently more a simple demonstration
cpc-assembler-to-z80asm:
	sed -E -f cpc-assembler-to-z80asm.sed \
		<$(SRCDIR)/disassembler.asm >disassembler.asm
	sed -E -f cpc-assembler-to-z80asm.sed \
		<$(SRCDIR)/disdata.asm >disdata.asm
	sed -E -f cpc-assembler-to-z80asm.sed \
		<$(SRCDIR)/missing.asm >missing.asm
	z80asm -o disassembler.app disassembler.asm
	z80dasm -t -a -g 0x0 disassembler.app -o disassembler.dasm

z80asm-to-cpc-assembler: cpc-assembler-to-z80asm
	sed -E -f z80asm-to-cpc-assembler.sed \
		./disassembler.asm >disassembler-cpca.asm
	sed -E -f z80asm-to-cpc-assembler.sed \
		./missing.asm >missing-cpca.asm
	#z80asm -o disassembler.app disassembler.asm
	#z80dasm -t -a -g 0x0 disassembler.app -o disassembler.dasm


clean:
	rm -f *.asm  *.app
