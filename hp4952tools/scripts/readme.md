# Converting different assembler source styles
This directory contains sed scripts to convert
between different falvours of Z80 assembler.

## Why?
To develop and test in WinApe, I use the built-in 
assembler. This assembler has maybe Amstrad CPC
related history, I do not know this, but the 
assembler code cannot be compiled with z80asm under
Linux. But my toolchain to create HP4952A binaries
relies upon z80asm. So I could either develop
with CPC emulator and then manually convert the
assembler source. Or better, use a script.

The script is not complete, I still have to fix
manually a few locations. But unconerted code gives 
for example >700 errors when running z80 asm on 
it. When having converted them, I have currently
a single error to fix manually. Thats quite ok.

See Makefile how to invoke sed.
