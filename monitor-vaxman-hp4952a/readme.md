# What is this?

This is a monitor application, ported in parts to HP4952A.

The original monitor source is from http://www.vaxman.de/projects/tiny_z80/ .

## Files

* [Original source downloaded from www.vaxman.de](monitor.asm.orig)
* [Original source, but changed regarding syntax](monitor-z80asm.asm) to compile with z80asm assembler from savannah.org.
* [Source adjusted to run on HP4952A](monitor.asm)

## Changes between HP4952A and original version
I changed the ASM source, which is for ZASM assember, to work with z80asm.

Also, some parts related to disk and file handling were removed. Maybe added later.

## How to build
See [Makefile](Makefile). The make target also copies build result to a dosbox directory for
upload, you may delete this line.

Execute make to create ```monitor``` binary, which can run on HP4952A.
```
make
```

## Related work
This work uses the libraries for HP4952A created here: https://github.com/dkgrizzly/4952oss .
Monitor source code from http://www.vaxman.de/projects/tiny_z80/ .
