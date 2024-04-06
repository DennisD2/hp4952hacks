

convert-from-asm-flavour:
	sed -E -f ../hp4952tools/scripts/z80asm-to-cpc-assembler.sed \
		<monitor.asm >monitor-cpca.asm

convert-to-asm-flavour:
	sed -E -f ../hp4952tools/scripts/cpc-assembler-to-z80asm.sed \
		<monitor-cpca.asm >monitor-z80asm.asm

clean:
	rm -f monitor.app  monitor.dasm hpmon.app




