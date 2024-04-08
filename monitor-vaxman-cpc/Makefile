MON_SRCDIR=../monitor-vaxman-hp4952a

# Assemble monitor for Amstrad CPC

# There is no assemble goal here for source "monitor-cpca.asm", because this source
# is read and assembled by WinAPE.

# After a development delta is done, change to directory ../monitor-vaxman-hp4952a and execute the the make.
# That will convert the assembler code to z80adm flavour and create there a binary for HP4952a.

#  Goal to get sources that CPC assembler does understood.
# convert-from-asm-flavour:
convert-to-cpc-flavour:
	sed -E -f ../hp4952tools/scripts/z80asm-to-cpc-assembler.sed \
		<$(MON_SRCDIR)/monitor.asm >monitor.asm
	sed -E -f ../hp4952tools/scripts/z80asm-to-cpc-assembler.sed \
		$(MON_SRCDIR)/disassembler.asm >disassembler.asm
	sed -E -f ../hp4952tools/scripts/z80asm-to-cpc-assembler.sed \
		<$(MON_SRCDIR)/disdata.asm >disdata.asm
	sed -E -f ../hp4952tools/scripts/z80asm-to-cpc-assembler.sed \
		<$(MON_SRCDIR)/missing.asm >missing.asm

clean:
	rm -f monitor.app
