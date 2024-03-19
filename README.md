# Analyzing the VT100 application for HP4952a

VT100.no_header is the VT100 application extracted from HP disks.
It was extracted with lifutils, patched version 1.7.11, without LIF headers.

This is Z80 code for HP495x platform.

# Disassemble the code
```shell
make disassemble
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