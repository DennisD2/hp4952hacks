# What is this?
This is a proof of Concept, to combinme monitor source code with some application source code, and to
call application from monitor and to return to monitor.

## How does it work?
Combination of memdump application as a testee + monitor application.

Monitor code is appended to app as an include. 

Entry address for app is now monitor. From monitor, the application memdump can be called via
Group Memory and command char x. 

Or manually, Group Control and there command char (S)tart, then enter address of memdump, which is 0x2200.

When exiting memdump, code retuns to monitor.

## How to build
See [Makefile](Makefile).

Execute make to create binary ```memdump```, which can run on HP4952A.
```
make 
```

## Related work
This work uses the libraries for HP4952A created here: https://github.com/dkgrizzly/4952oss .
Monitor source code from http://www.vaxman.de/projects/tiny_z80/ .