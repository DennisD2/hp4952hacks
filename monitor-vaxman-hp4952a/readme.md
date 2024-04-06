# What is this?

This is a monitor application, ported in parts to HP4952A.

The original monitor source is from http://www.vaxman.de/projects/tiny_z80/ .

## Files

* [monitor-orig.asm](monitor-orig.asm): Original source downloaded from www.vaxman.de
* [monitor-orig-z80asm.asm](monitor-orig-z80asm.asm): Original source, but manually adjusted regarding syntax to compile with z80asm assembler from savannah.org.
* [monitor.asm](monitor.asm): Source adjusted to run on HP4952A, based on monitor-z80asm.asm .

## Changes between HP4952A and original version
I changed the ASM source, which is for ZASM assember, to work with z80asm.

Also, some parts related to disk and file handling were removed. Maybe added later.

Some parts that I do not fully understand (warm start and cold start, invocation of
monitor code via RST op code) are still in the code, but no effort have been made
to make them work on HP4952A.

The original monitor code targets a machine where all software on it is well-known (because
this is a monitor for a SBC built by Vaxman himself). I have a different situation,
software on HP4952A is 100% unknown, so I need more code analysis tooling. So I added:

* Debugger code, from SBC project

## How to build
See [Makefile](Makefile). The make target also copies build result to a dosbox directory for
upload, you may delete this line.

Execute make to create ```monitor``` binary, which can run on HP4952A.
```
make
```

## Related work
* This work uses the libraries for HP4952A created here: https://github.com/dkgrizzly/4952oss .
* Monitor source code from http://www.vaxman.de/projects/tiny_z80/ .
* Diassembler code from Small Computer Monitor Site https://smallcomputercentral.com/small-computer-monitor/,
  extracted from their source ZIP file

