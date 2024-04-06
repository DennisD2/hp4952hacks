# Analysis of HP4952A code

This is work in progress. Not much is yet known.

### Application startup
Application file bytes uploaded by remore feature (and I suppose, also by loading it from disk),
are put to RAM address 0xa0000. This seems standard behaviour of HP4952A.

The application file contains several sections. 

Some of them are assembled to be executed at start addresses around 0xa0000 and larger. 
These are initial startup code parts for the application.

Some other parts of them are assembled to be executed at other RAM areas. So, the
startup code of the application (around 0xa0000 as said) includes memory copy
code that copies these sections to required locations in HP4952A RAM where they
can be executed. 

VT100 app contains a big part to be executed around 0x2000. This seems to be
a standard address, where the application code can be copied to, and then executed.

For VT100 app, I have defined a constant for the target address where code
is copied to and executed:
```asm
app_target_area:        equ     02a00h
```
It can be seen that e.g. all ```call``` op codes use addresses of the target area,
like 0x2acf . If this code would be executed at its initial location, without copying
it to app_target_area, it would fail.

### System Memory map


| 0x000-0x7fff  | Application RAM     |
|---------------|---------------------|
| 0x8000-0xffff | U500 ROM lower 32KB |
|               | U500 ROM upper 32KB |

### ROM content
There are various ROMs in the device, several on each of the boards.

At https://github.com/VintageProject/HP4952A, the ROM dumps are available.
I haven't dumped all my ROMs so far, but will do it later.

Of most interest are the ROMs on the RAM/ROM board.

These are mapped into the address space by an out opcode with a special 
address with some value.
Some decoding logic at the special address then will use the value to
select the correct RAM/ROM, and enable its ```Chip Enable``` pin. By doing
this, the CPU has access to more than 64KB, despite having only a 64KB
address space.

#### U500 chip
The ROM chip U500 looks interesting. It has 64KB size. Either its lower 32KB or
its upper 32KB can be mapped in at 0x8000.

This can be derived by examining its content. Both parts start with some
jump table (example for lower part):
```c
	jp 08352h		;8000	c3 52 83 	. R . 
	jp 083d2h		;8003	c3 d2 83 	. . . 
	jp 083d8h		;8006	c3 d8 83 	. . . 
	jp 0843eh		;8009	c3 3e 84 	. > . 
	jp 08482h		;800c	c3 82 84 	. . .
```
And at e.g. 0x8352 or 0x83d2, we find real code.

Same for upper part, it has the jump table at offset 0 too:
```c
	jp 00000h		;8000	c3 00 00 	. . . 
	jp 00000h		;8003	c3 00 00 	. . . 
	jp 011c6h		;8006	c3 c6 11 	. . . 
	jp 011bfh		;8009	c3 bf 11 	. . . 
	jp 08080h		;800c	c3 80 80 	. . . 
	jp 081b9h		;800f	c3 b9 81 	. . . 
	jp 08187h		;8012	c3 87 81 	. . .
```
Here it is interesting that the first two entries point to 0x0000,
supposed to be system reset. Entries 3 and 4 point to 0x1..., which
is supposed to be in RAM. 

#### U502
128KB ROM. also contain valid code.

#### U503
128KB ROM. also contain valid code.

#### U204
maybe not Z80 code.

#### U304
Code for 87C51.

### Data transfer to/from ports
In application code, many out/in calls can be seen.

#### Data transfer with SCC chip
By checking the schematics, SCC CE is driven by A14=15=1 (and IO/~M = 1). This means, if
SCC should be invoked, upper address byte of address bus need to be used.
(Detail: A15,A14 and IO/~M go into a AND gate, followed by inverter. So these signals
are combined by NAND function, is zero only if all inputs are high.)

Z80 allows 16 bit addressed ports using bc register, and an ``out (c),xxx`` call is required then. In that case,
b contains upper part of port address. 
For register b from bc register, then bit 0 (A14) and bit 1 (A15) are to be set.

What I did not find in vt100 app code, was a call using a 16 bit port address.

So I checked all the ROM code and found a single function doing that, in ROM U500,
a MBM27C512 64KB ROM.

Disassembled ROM:
[U500_04952-10028_MBM27C512-lower.BIN.dasm](ROMs/RAM-ROM%20Board/U500_04952-10028_MBM27C512-lower.BIN.dasm)

Code piece found:
```asm
    ;; outputs to any port at address bc, a sequence of bytes. Ends with 0x00.
    ;; all args in (hl)
    ;; b from hl
    ;; c from hl+1
    ;; a from hl+2
	ld b,(hl)			;d369	46 	F 
	inc hl			;d36a	23 	# 
	ld c,(hl)			;d36b	4e 	N 
	inc hl			;d36c	23 	# 
l_d36d:
	ld a,(hl)			;d36d	7e 	~ 
	out (c),a		;d36e	ed 79 	. y 
	inc hl			;d370	23 	# 
	djnz $-4		;d371	10 fa 	. . 
	ret			;d373	c9 	. 
```

SCC also uses address bits 9 and 8 for D/~C and A/~B. 
So, addresses for SCC always look like Cx0x, Cx1x, Cx2x, Cx3x.

| A9 = D/~C | A8 = A/~B | Meaning                      |
|-----------|-----------|------------------------------|
| 0         | 0         | Control byte (command), PORTB |
| 0         | 1         | Control byte (command), PORTA |
| 1         | 0         | Data byte, PORTB   |
| 1         | 1         | Data byte, PORTA    |
