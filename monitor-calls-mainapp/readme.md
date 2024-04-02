# What is this?

Combination of memdump application as a testee + monitor application.

Monitor code is appended to app as an include. 


## How to build
See [Makefile](Makefile).

Execute make to create binary ```memdump```, which can run on HP4952A.
```
make 
```

## Related work
This work uses the libraries for HP4952A created here: https://github.com/dkgrizzly/4952oss .
Monitor source code from http://www.vaxman.de/projects/tiny_z80/ .