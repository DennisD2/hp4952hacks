# Converting different assembler source styles
This directory contains sed scripts to convert between different favours of Z80 assembler.

## Why?
To develop and test in WinApe, I use the built-in assembler. This assembler has maybe Amstrad CPC
related history, I do not know this, but the assembler code cannot be compiled with z80asm under
Linux. But my toolchain to create HP4952A binaries relies upon z80asm. So I could either develop
with CPC emulator and then manually convert the assembler source. Or better, use a script.

The script is not complete, I still have to fix manually a few locations. But unconverted code gives 
for example >700 errors when running z80 asm on it. When having converted them, I have currently
a single error to fix manually. Thats quite ok.

See Makefile how to invoke sed. Its generally like:
```makefile
sed -E -f z80asm-to-cpc-assembler.sed <./disassembler-z80a.asm >disassembler-cpca.asm
```

The sed control files are:
* z80asm-to-cpc-assembler.sed: convert z80asm to CPC WinAPE flavour
* cpc-assembler-to-z80asm.sed; convert CPC WinAPE Flavour to z80asm flavour

There are two more sed contrl files, *-test-only-additions.sed , you can ignore those, these are only 
for testing the scripts.
