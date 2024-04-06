# Vaxmans Monitor for HP4952A
This is a monitor application, ported in parts to HP4952A.

The original monitor source is from http://www.vaxman.de/projects/tiny_z80/ . A "how to use"-document can be found
there too, I have extracted it and put it [here](readme-vaxman.txt).

## Files
* [monitor.asm](monitor.asm): Source adjusted to run on HP4952A, based on monitor-z80asm.asm .

## Changes between HP4952A and original version
I changed the ASM source, which is for ZASM assembler, to work with z80asm.

Also, some parts related to disk and file handling were removed. Maybe added later.

Some parts that I do not fully understand (warm start and cold start, invocation of
monitor code via RST op code) are still in the code, but no effort have been made
to make them work on HP4952A.

The original monitor code targets a machine where all software on it is well-known (because
this is a monitor for a SBC built by Vaxman himself). I have a different situation,
software on HP4952A is 100% unknown, so I need more code analysis tooling. So I added:

Added Debugger code, from SBC project

Development was mostly done with WinAPE Emulator, running
with Wine under Linux. Therefore, there is also a Amstrad CPC version [in another directory](../monitor-vaxman-cpc).

## How to build
See [Makefile](Makefile). The make target also copies build result to a dosbox directory for
upload, you may delete this line.

Execute make to create ```monitor``` binary, which can run on HP4952A.
```
make
```

## How to develop
This is cross platform development in a somehow silly way, will improve that, but for now...

Development is done under Linux, using as Z80 Emulator WinAPE. WinAPE includes an assembler, so that is being used.
Leading source code in therefore in [../monitor-vaxman-cpc](../monitor-vaxman-cpc) .

If a version of the monitor needs to be tested on HP4952A, go to directory 
[../monitor-vaxman-hp4952a](../monitor-vaxman-hp4952a), i.e. this directory. A make started here will 
read the newest version of the monitor sources from the cpc directory, converts them to z80asm flavour code
Use make goal ``convert-to-asm-flavour``

Root source file here is ```monitor.asm```, so one manual step is needed. There is a marker section in source file 
monitor.asm, called ```start wrapper``` and ```end wrapper```. The new code, located in
```monitor-z80asm.asm``` must go between these two markers. Do this manually.

After manual inclusion run make goal ```monitor```.

## Related work
* This work uses the libraries for HP4952A created here: https://github.com/dkgrizzly/4952oss .
* Monitor source code from http://www.vaxman.de/projects/tiny_z80/ .
* Disassembler code from Small Computer Monitor Site https://smallcomputercentral.com/small-computer-monitor/,
  extracted from their source ZIP file

