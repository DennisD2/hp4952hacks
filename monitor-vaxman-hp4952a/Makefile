
# assemble monitor for HP4592A

MON_SRCDIR=../monitor-vaxman-cpc

monitor:
	z80asm -o monitor-z80asm.app monitor.asm
	cp monitor-z80asm.app $(HOME)/dosbox/util_1/MON.APP
	z80dasm -t -a -g 0x0 monitor-z80asm.app -o monitor-z80asm.dasm


convert-to-asm-flavour:
	sed -E -f ../hp4952tools/scripts/cpc-assembler-to-z80asm.sed \
		<$(MON_SRCDIR)/monitor-cpca.asm >monitor-z80asm.asm
	sed -E -f ../hp4952tools/scripts/cpc-assembler-to-z80asm.sed \
		$(MON_SRCDIR)/disassembler.asm >disassembler.asm
	sed -E -f ../hp4952tools/scripts/cpc-assembler-to-z80asm.sed \
		<$(MON_SRCDIR)/disdata.asm >disdata.asm
	sed -E -f ../hp4952tools/scripts/cpc-assembler-to-z80asm.sed \
		<$(MON_SRCDIR)/missing.asm >missing.asm

# removes also assembler sources that were converted from MON_SRCDIR
clean:
	rm -f monitor.app  monitor.dasm hpmon.app *-z80asm.asm




