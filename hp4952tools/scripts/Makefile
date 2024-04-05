SRCDIR=../../disassembler-test

# conversion task, currently more a simple demonstration
z80asm-to-cpc-assembler:
	sed -E -f cpc-assembler-to-cpc-z80asm.sed \
		<$(SRCDIR)/disassembler.asm >disassembler.asm
	sed -E -f cpc-assembler-to-cpc-z80asm.sed \
		<$(SRCDIR)/disdata.asm >disdata.asm
	sed -E -f cpc-assembler-to-cpc-z80asm.sed \
		<$(SRCDIR)/missing.asm >missing.asm
	z80asm -o disassembler.app disassembler.asm
	z80dasm -t -a -g 0x0 disassembler.app -o disassembler.dasm

#cpc-assembler-to-cpc-z80asm.sed
clean:
	rm -f *.asm  *.app
