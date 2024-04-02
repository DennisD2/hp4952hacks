# Analysis of HP4952A code

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
[U500_04952-10028_MBM27C512.BIN.dasm](ROMs/RAM-ROM%20Board/U500_04952-10028_MBM27C512.BIN.dasm)

Code piece found:
```asm
    ;; outputs to any port at address bc, a sequence of bytes. Ends with 0x00.
    ;; all args in (hl)
    ;; b from hl
    ;; c from hl+1
    ;; a from hl+2
	ld b,(hl)			;5369	46 	F 
	inc hl			;536a	23 	# 
	ld c,(hl)			;536b	4e 	N 
	inc hl			;536c	23 	#
l_536d:
	ld a,(hl)			;536d	7e 	~ 
	out (c),a		;536e	ed 79 	. y 
	inc hl			;5370	23 	# 
	djnz $-4		;5371	10 fa 	. .     ; -> l_536d
	ret			;5373	c9 	. 
```

SCC also uses address bits 9 and 8 for D/~C and A/~B. 
So, addresses for SCC always look like Cx0x, Cx1x, Cx2x, CSx3x.

| A9 = D/~C | A8 = A/~B | Meaning                      |
|-----------|-----------|------------------------------|
| 0         | 0         | Control byte (command), PORTB |
| 0         | 1         | Control byte (command), PORTA |
| 1         | 0         | Data byte, PORTB   |
| 1         | 1         | Data byte, PORTA    |
