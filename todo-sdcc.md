# TODOs

App consists of 4 areas.
These have defined origin (.org directive).
They also have a defined offset in output file, but this directive (.seek) does exist in z80asm, but not
in sdcc/sdasz80.

I assume that the positioning in output file is a linker task, so there is no directive in sdcc for that.
The order of areas can be defined, by list these in correct order in first file (some asm file or crt0.s).
But this is for address space, not for location in output file.


| Part   | loc. start | loc. end | padded until | file offset   | Desired file offset | comment      |
|--------|------------|----------|--------------|---------------|---------------------|--------------|
| strap  | 0x2000     | 0x2070   |              | 0x0           | 0x800               | delta=-0x800 |
| app1   | 0x2071     | 0x2145   | 0x21ff       | 0x71          | 0x871               | delta=-0x800 |
| app2   | 0x2200     | 0x2417   | 0x2900       | 0x200         | 0xa00               | delta=-0x800 |
| header | 0xa000     | 0xa2cb   | 0xa7ff       | 0x8000        | 0x0                 | delta=0x8000 |
|        | ok(.org)   | egal     | map-Datei?   | evtl eingeben | ok(seek)            |              |


https://stackoverflow.com/questions/44358613/cant-figure-out-how-to-write-interrupt-handler-for-z80-using-sdcc

### Defining area order
https://stackoverflow.com/questions/1606926/code-banking-with-sdcc



```asm
//bank.asm
    .area HOME    (CODE)
    .area GSINIT0 (CODE)
    .area GSINIT1 (CODE)
    .area GSINIT2 (CODE)
    .area GSINIT3 (CODE)
    .area GSINIT4 (CODE)
    .area GSINIT5 (CODE)
    .area GSINIT  (CODE)
    .area GSFINAL (CODE)
    .area CSEG    (CODE)
    .area HOME    (CODE)
```


### Z-80 Code Generation with SDCC
http://bricologica.com/projects/z80/2015/08/17/z-80-code-generation-with-sdcc.html

SDCC Part 2 of 4 : Compiling our first C program
http://norecess.cpcscene.net/sdcc-part-2---compiling-our-first-c-program.html

CPC - Introduction to programming in C with SDCC: Compiling and testing a "Hello World"
http://www.cpcmania.com/Docs/Programming/Introduction_to_programming_in_SDCC_Compiling_and_testing_a_Hello_World.htm