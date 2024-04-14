
# extract and disassemble lower+upper part of U500 ROM
u500:
	split -b 32768 U500_04952-10028_MBM27C512.BIN
	mv xaa U500_04952-10028_MBM27C512-lower.BIN
	mv xab U500_04952-10028_MBM27C512-upper.BIN
	z80dasm -t -a -g 0x0 -l U204_04952-10029_TMS27C256.BIN -o U204_04952-10029_TMS27C256.BIN.dasm
	z80dasm -t -a -g 0x8000 -l U500_04952-10028_MBM27C512-lower.BIN -o U500_04952-10028_MBM27C512-lower.BIN.dasm
	z80dasm -t -a -g 0x8000 -l U500_04952-10028_MBM27C512-upper.BIN -o U500_04952-10028_MBM27C512-upper.BIN.dasm
	z80dasm -t -a -g 0x0 -l U502_04952-10027_MBM27C512.BIN -o U502_04952-10027_MBM27C512.BIN.dasm
	z80dasm -t -a -g 0x0 -l U503_04952-10026_MBM27C512.BIN -o U503_04952-10026_MBM27C512.BIN.dasm


# disassemble with labels
# z80dasm -t -a -g 0xa000 -l -o vt100-labeled.asm VT100.no_header