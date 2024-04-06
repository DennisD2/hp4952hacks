# Vaxmans Monitor Source Code
This is a monitor application.

The original monitor source is from http://www.vaxman.de/projects/tiny_z80/ . A "how to use"-document can be found
there too, I have extracted it and put it [here](readme-vaxman.txt).

I keep the original source here to serve as a start point for development of a HP4952 port.

## Files
* [monitor-orig.asm](monitor-orig.asm): Original source downloaded from www.vaxman.de
* [monitor-orig-z80asm.asm](monitor-orig-z80asm.asm): Original source, but manually adjusted regarding syntax to 
  compile with z80asm assembler from savannah.org and also big part (IDE disk driver, file handling) was simply removed.

I did code adjustments to have this monitor running on a HP4952A, 
see [directory for details](../monitor-vaxman-hp4952a) . Development was mostly done with WinAPE Emulator, running
with Wine under Linux. Therefore, there is also a Amstrad CPC version [in another directory](../monitor-vaxman-cpc).

## How to build the original, but adjusted source
See [Makefile](Makefile). 

Execute make to create ```monitor-orig-z80asm.app``` binary. The build just shows that assembler source is userstood
by assembler used.
```
make
```

## Related work
* Monitor source code from http://www.vaxman.de/projects/tiny_z80/ .

