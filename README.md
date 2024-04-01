# Analyzing the VT100 application for HP4952a

VT100.no_header is the VT100 application extracted from HP disks.
It was extracted with lifutils, patched version 1.7.11, without LIF headers.

This is Z80 code for HP495x platform.

# Disassemble the code
```shell
make vt100dis
```
This will create a file vt100.dasm.

# Check that code stays the same after changes
Just execute ```make``` with no arguments. This will assemble the application and compare it
against the original binary. It will complain if these are not equal.
```shell
make 
```

# State of analysis
Check file ```vt100.asm```. 

# Required prerequisites

* Z80 Assembler: z80asm from Savannah (https://savannah.nongnu.org/projects/z80asm), 
on Github its here: https://github.com/AlbertVeli/z80asm/tree/master
This Assembler has the required directives. There are other Z80 assemblers, but they may differ in options
and directives.

* Z80 Disassmbler:
https://linux.die.net/man/1/z80dasm

Also helpful:
* Z80 Monitor. Part of another Z80 assembler package, see https://wwwhomes.uni-bielefeld.de/achim/z80-asm.html.
  The monitor in that package executable is called "z80-mon".

# References
* Z80 Opcode table - https://clrhome.org/table/
* VT100 codes - https://espterm.github.io/docs/VT100%20escape%20codes.html
* ASCII codes - https://lwp.interglacial.com/appf_01.htm
* Programmers Calculator - https://calc.penjee.com/