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


| Range           | Content                    |
|-----------------|----------------------------|
| 0x0000 - 0x7fff | Application RAM            |
| 0x8000 - 0xffff | U500 ROM lower 32KB        |
|                 | U500 ROM upper 32KB        |
| 0xa000 - ?      | Non-Application RAM 32KB   |
| ? - ?           | U502 ROM 64KB              |
| ? - ?           | U503 ROM 64KB              |
| ? - ?           | U204 ROM 32KB              |
| ? - ?           | Data Capture RAM           |
| ? - ?           | RAM from Extension Options |

U500 clearly contains code.

Besides U500, there are also ROMs U502 and U503 and U204
that look like they contain Z80 code (maybe boot+"OS" code)
They have each 64KB too.

There is also some non-application RAM, where e.g.
disk files are loaded into. This starts always at 
0xa000.

Finally, there is data capture RAM, and
maybe RAM from the RAM extension card (if present in a HP4952).

So memory map is complex.

### ROM content
There are various ROMs in the device, several on each of the boards.
Only a subset contains Z80 code.

Because there are also 8080,68000,87C51 CPUs built in the
HP4952A, some of the ROMs contain code for these CPUs.

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
```
	jp 08352h		;8000	c3 52 83 	. R . 
	jp 083d2h		;8003	c3 d2 83 	. . . 
	jp 083d8h		;8006	c3 d8 83 	. . . 
	jp 0843eh		;8009	c3 3e 84 	. > . 
	jp 08482h		;800c	c3 82 84 	. . .
```
And at e.g. 0x8352 or 0x83d2, we find real code.

Same for upper part, it has the jump table at offset 0 too:
```
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
64KB ROM. also contain valid Z80 code.

It looks like this ROM contains boot code,
i.e. the "main appliation" running after switching on,
with main menu and the built-in apps for setup,
remote functionality, printing etc.


#### U503
64KB ROM. also contain valid Z80 code.

Looks like also boot code: floppy handling, self test, 


#### U204
Current guess: Contains boot bode.

My first impression was, that this 32KB ROM seems to contain 68000 CPU code only. 
These are the only strings to be found in the ROM:
```
Error! Entry Mode=User
---Bus Error---#
---Address Error---#
---Illegal Instruction---#
---Zero Divide---#
---CHK Instruction---#
---TRAPV Instruction---#
---Privilege  Violation--- #
---Trace---#
---1010 Exception---
---1111 Exception---
Run Aborted! Mode=User
```
And that looks like some text strings in code handling 68000 exceptions. 
So I supposed first U204 contains 68000 code, but very low level functions.

Later I found that this is not true. The chip may contain 68000 code, but it
also contains Z80 code being executed during boot time and startup.

Maybe this ROM contains the boot code for the whole device.

#### U304
This chip is the 87C51 CPU, it contains also a 4KB ROM part,
with code for it.

### Data transfer to/from ports
In application code, many out/in calls can be seen.

#### Data transfer with SCC chip
By checking the schematics (of HP4951, because there is no schematics
available for HP4952) , SCC CE is driven by A14=15=1 (and IO/~M = 1). This means, if
SCC should be invoked, upper address byte of address bus need to be used.
(Detail: A15,A14 and IO/~M go into a AND gate, followed by inverter. So these signals
are combined by NAND function, is zero only if all inputs are high.)

Z80 allows 16 bit addressed ports using bc register, and an ``out (c),xxx`` call is required then. In that case,
b contains upper part of port address. 
For register b from bc register, then bit 0 (A14) and bit 1 (A15) are to be set.

What I did not find in vt100 app code, was a call using a 16 bit port address.

So I checked all the ROM code and found a single function doing that, in ROM U500.

Disassembled ROM:
[U500_04952-10028_MBM27C512-lower.BIN.dasm](ROMs/RAM-ROM%20Board/U500_04952-10028_MBM27C512-lower.BIN.dasm)

Code piece found:
```asm
    ; outputs to any port at address bc, a sequence of bytes. Ends with 0x00.
    ; all args in (hl)
    ; b from hl
    ; c from hl+1
    ; a from hl+2
	ld b,(hl)		;d369	46 	F 
	inc hl			;d36a	23 	# 
	ld c,(hl)		;d36b	4e 	N 
	inc hl			;d36c	23 	# 
ld36dh:
	ld a,(hl)		;d36d	7e 	~ 
	out (c),a		;d36e	ed 79 	. y 
	inc hl			;d370	23 	# 
	djnz ld36dh		;d371	10 fa 	. . 
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

##### fm_execute call chain
```asm
    ; function called by menu selection
    ; c331 function; "Execute" from main menu
fm_execute:
	ld a,062h		;c331	3e 62 	> b             ; (07501h):=0x62
	ld (07501h),a		;c333	32 01 75 	2 . u   ;
	ld a,006h		;c336	3e 06 	> .             ; Load Page 6 (Application RAM)
	call os_loadpage		;c338	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in 6

	call 0a54bh		;c33b	cd 4b a5 	. K .       

	ld a,022h		;c33e	3e 22 	> "             ; (07501h):=0x22
	ld (07501h),a		;c340	32 01 75 	2 . u   ;
	ld a,(_tmp_page)		;c343	3a 96 a4 	: . . ; a:=tmp_page
	call os_loadpage		;c346	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in _tmp_page
	ld hl,00001h		;c349	21 01 00 	! . .   ; hl:=1
	ret			;c34c	c9 	. 
```

(07501h) is being loaded with these values: 0x21, 0x22, 0x62.
fm_execute() is the only place where 0x62 is loaded into 07501h.

fm_execute is forwarding to sub_0a54bh. 
```asm
sub_0a54bh:
    ; delay, 0x1234 times looped
	ld hl,01234h		;a54b	21 34 12 	! 4 .   ; hl:=0x1234
loop_delay_a54e:
	dec hl			;a54e	2b 	+ 
	ld a,l			;a54f	7d 	} 
	or h			;a550	b4 	. 
	jr nz,loop_delay_a54e		;a551	20 fb 	  .

	call read_dbe0		;a553	cd 33 a5 	. 3 .
	;call monitor ; no SCC access so far
	call sub_a5f9h		;a556	cd f9 a5 	. . .   ; calls 4 other subs; these invoke 3 OS API calls
	call monitor ;  SCC access done, but terminal not yet running
	call sub_a6e7h		;a559	cd e7 a6 	. . .   ; calling sub_a6e7h twice, has no subs
	call sub_a6e7h		;a55c	cd e7 a6 	. . .   ; "
	;call monitor ; SCC access done, but terminal not yet running
	call sub_a702h		;a55f	cd 02 a7 	. . .   ; calling sub_a702h twice, has no subs
	call sub_a702h		;a562	cd 02 a7 	. . .   ; "
	;call monitor ; SCC access done, but terminal not yet running
;;	;call sub_a56fh		;a565	cd 6f a5 	. o .   ; large function, see below
	call sub_a606h		;a568	cd 06 a6 	. . .   ; "waits for dff0==0 an then writes 5 to it"
	;call monitor ; Terminal already runs
	call write_dbe0		;a56b	cd 3f a5 	. ? .
	ret			        ;a56e	c9 	.
```
Function sub_a5f9h:
```asm
sub_a5f9h:
  call sub_a9d7h		;a5f9	cd d7 a9 	. . .   ; invokes large function
  call sub_a6d4h		;a5fc	cd d4 a6 	. . .   ; calls 2 patched functions (OS API calls) call 01961h		;a6d4	cd 61 19 	. a . ; Patched to 2d9ch AND call 01982h		;a6d7	cd 82 19 	. . . ; Patched to 2d06h
  call sub_aee5h		;a5ff	cd e5 ae 	. . .   ; no subs, small
  call sub_a87bh		;a602	cd 7b a8 	. { .   ; calls 1 patched function (OS API) ; call 0112dh		;a886	cd 2d 11 	. - .   ; Patched to 2edah
  ret			        ;a605	c9 	.
  sub_a606h:
  call sub_a8e3h		;a606	cd e3 a8 	. . .   ; "waits for dff0==0 an then writes 5 to it"
  la609h:
  ret			        ;a609	c9 	.
```

And sub_a6d4h:
```asm
la6d2h:
  jr nz,la6f4h		;a6d2	20 20
  sub_a6d4h:
  call 01961h		    ;a6d4	cd 61 19 	. a . ; Patched to 2d9ch
  call 01982h		    ;a6d7	cd 82 19 	. . . ; Patched to 2d06h
  xor a			    ;a6da	af 	.
  ld (07e00h),a		;a6db	32 00 7e 	2 . ~
  ld a,020h		    ;a6de	3e 20 	>
  ld (la6d2h),a		;a6e0	32 d2 a6 	2 . .
  ld (la6d2h+1),a		;a6e3	32 d3 a6 	2 . .
  ret			        ;a6e6	c9 	.
```

And sub_a87bh:
```asm
sub_a87bh:
	ld a,(03f12h)		;a87b	3a 12 3f 	: . ? 
	or a			;a87e	b7 	. 
	jr nz,la8f2h		;a87f	20 71 	  q
	ld a,0aah		;a881	3e aa 	> . 
	ld (01df8h),a		;a883	32 f8 1d 	2 . . 
	call 0112dh		;a886	cd 2d 11 	. - .   ; Patched to edah
	call out80_a89f		;a889	cd 9f a8 	. . .
	ld a,001h		;a88c	3e 01 	> . 
	ld (ldff0h),a		;a88e	32 f0 df 	2 . .
	ld a,002h		;a891	3e 02 	> . 
	ld (03f12h),a		;a893	32 12 3f 	2 . ? 
	ret			;a896	c9 	. 
```

To summarize the code above, sub_a5f9h calls 3 OS API functions:
* via sub_a6d4h:
  * 01961h "Patched to 2d9ch"
  * 01982h "Patched to 2d06h"
* via sub_a87bh:
  * 0112dh "Patched to 2edah"

01961h and 01982h both can be found in ROM U503, see U503_04952-10026_MBM27C512.BIN.dasm.
0112dh too, but this looks strange.

As an example, sub_1961h:
```asm
; seems to be OS API function 01961h, called by vt100:sub_a6d4h
fapi_1961h:
sub_1961h:
  xor a			    ;1961	af 	.
  ld (l1a1dh),a		;1962	32 1d 1a 	2 . .
  ld (l7e03h),a		;1965	32 03 7e 	2 . ~
  ld hl,l7e2bh		;1968	21 2b 7e 	! + ~
  ld (hl),a			;196b	77 	w
  ld de,l7e2ch		;196c	11 2c 7e 	. , ~
  ld bc,l001fh+1		;196f	01 20 00 	.   .
  ldir		        ;1972	ed b0 	. .
  ld hl,l7e09h		;1974	21 09 7e 	! . ~
  ld (07e07h),hl		;1977	22 07 7e 	" . ~
  dec a			    ;197a	3d 	=
  ld (l7e00h),a		;197b	32 00 7e 	2 . ~
  ld (l7e04h),a		;197e	32 04 7e 	2 . ~
  ret			        ;1981	c9 	.
```

And sub_1982h, which is first code that does an out-call:
```asm
; seems to be OS API function 01982h, called by vt100:sub_a6d4h
; accesses port 0xbb, writes 0xc to that port
fapi_1982h:
sub_1982h:
	di			        ;1982	f3 	.
	ld hl,l1991h		;1983	21 91 19 	! . . 
	ld (07504h),hl		;1986	22 04 75 	" . u 
	ld a,00ch		    ;1989	3e 0c 	> .
	out (0bbh),a		;198b	d3 bb 	. . 
	call sub_162fh		;198d	cd 2f 16 	. / . 
	ret			        ;1990	c9 	.
```

And 0112dh in U503, which is inside of some other function. There is no return statement close,
the code looks strange.
```asm
...
	jp c,l44cdh		;1126	da cd 44 	. . D 
	dec c			;1129	0d 	. 
	add a,d			;112a	82 	. 
	inc de			;112b	13 	. 
	add a,l			;112c	85 	.
; maybe an OS API function, but has no defined end... ret/jp
sub_112dh:
	call sub_0d44h		;112d	cd 44 0d 	. D . 
	add a,a			;1130	87 	. 
	ld d,b			;1131	50 	P 
	and a			;1132	a7 	. 
sub_1133h:
	call sub_0d44h		;1133	cd 44 0d 	. D . 
	add a,a			;1136	87 	. 
	add hl,sp			;1137	39 	9 
...
```
-----------

After several approaches to get a clue what's going on, by following all subroutines and
jumps spawning of from this function, I gave up. Without almost any hint or documentation
regarding the system it would last forever to get a grip on that task.

Because I also have a Kingst LA5032 logic analyzer in my toolbox, I tried to do some 
hardware analysis to move forward.

After first approach analyzing the signals at SCC itself, I moved to analysis of the
Z80 CPU itself, and there were first real results.

## Hardware analysis with logic analyzer
I own a nice Kingst LA5032 logic analyzer. it offers 32 ports and up to 500Mhz sample rate
with virtually "infinite" sample depth, hundreds of Gigasamples are possible, this could be minutes
of data captures from a e.g. 10Mhz bus. So it is a very powerful device.

There is also sigrok+pulseview, a great open source software for Linux, that can access
a large number of logic analyzers, oscilloscopes and other measurement devices of all kinds.
While sgirok offers a cli, pulseview is a graphical UI for sigrok.

Sigrok supports the Kingst LA5032, this was one of main reasons for me to buy that product.

I also ordered some used Pomona (and 3M) IC tester clips before, including a 40 pin clip.
So I have all at hands to hook on directly to the Z80 CPU and look at its signals.

Some friendly guys even have written a Z80 decoder for sigrok/pulseview. This decoder has 
bugs, but is even with bugs a great help in understanding what the HP4952A is doing.

So I hooked up the logic analyzer to the HP4952A. Close to the Z80 (Toshiba TMP84C00)
there is an Xtal with  7.3728Mhz. I suppose that this is part of clock oscillator
for the Z80. From logic analyzer I see roughly 400ns / 2.5Mhz for a full clock cycle.
So this is somehow strange. 

When switching on, the SCC is initialized. I have the following config for detailled analysis:
* All signals supported by Z80 decoder hooked up. These are:
  * D0-D7
  * M1
  * RD, WR
  * MREQ, IOREQ
* SCC Chip Enable CE pin
* Clock signal at Z80 pin 6
* Wait signal at Z80 pin 24 (added later, see below)

I can now locate accesses to the SCC Chip (then CE goes low). The next large screenshot
shows more or the first call to SCC chip done by HP4952A after switching on.

![](doc/hp4952a-switchon-z80dd-decoder.png)

In the screenshot, all pins can be seen. Also decoder output, see the four "Z80" lines (Data bus, Instructions,
Operands, Warnings). The original code of the decoder has an issue decoding out and in opcodes and also
at fetching opcodes from RAM. In my case, the external chips and RAM are not fast enough for immediate response
and assert the /WAIT pin. This is ignored by the original z80 decoder, resulting in wrong decodings,
sometimes even "Invalid instruction" is dumped out.

After having studied the source code of the z80 decoder, written in Python, I was able to fix this issue at least
partly. Check the two lines at the bottom of screenshot. These are the decodings from the fixed decoder.
No "invalid instructions" anymore, and the decoding in general looks much more correct. 
I suppose the original decoder works well on a system with slow CPU, where RAM and external devices maybe do 
not assert /WAIT at all.

But coming back to my goal, we have a nice dump of the first access to SCC now.
it looks like this, I added comments:
```asm
...
LD  C,21h       ; seems to be output port number of SCC
IN  A,(C)       ; read from SCC, I guess this returns RR0 (read register 0), result seems to be ignored
LD  A,09h       ; select register (W)R9
OUT (C),A       
LD  A,0C0h      ; write out value 0x0c to selected register
OUT (C),A       ;
...
```

And what means "write out value ```0xc0``` to selected register" ? Lets check Zilogs SCC user manual, page 167:

![](doc/scc_ug_wr9.png)

So 0xc0 = 1100.0000, meaning command "Force Hardware Reset". Which makes totally sense, to initialize the chip
after being switched on, before any further use.

With this piece of code, we can do a search in the disassembled ROMs. And there is a match, in ROM U204.
file U204_04952-10029_TMS27C256.BIN.dasm . Code piece is:
```asm
...
	jp 00063h		;1387	c3 63 00 	. c . 
	
; here we go, code piece from above:	
	ld c,021h		;138a	0e 21 	. ! 
	in a,(c)		;138c	ed 78 	. x 
	ld a,009h		;138e	3e 09 	> . 
	out (c),a		;1390	ed 79 	. y 
	ld a,0c0h		;1392	3e c0 	> . 
	out (c),a		;1394	ed 79 	. y 
; end of matched code piece
	
	ex af,af'			;1396	08 	. 
	ex af,af'			;1397	08 	. 
	ld a,001h		;1398	3e 01 	> . 
	out (040h),a		;139a	d3 40 	. @
    ; maybe SCC Port A,Control	, probability 5%
	ld b,001h		;139c	06 01 	. . 
	ld e,000h		;139e	1e 00 	. . 
	ld c,021h		;13a0	0e 21 	. ! 
	ld d,00ch		;13a2	16 0c 	. . 
	ld a,d			;13a4	7a 	z 
	out (c),a		;13a5	ed 79 	. y 
...
```
I kept in the copy above an old comment from me from two weeks ago, where I was checking ROM content code-wise.
There I was also considering that area as maybe related to SCC handling, but without any level of certainty.

### Strange intermediate result: Toshiba TMP84C00 is not executing all Z80 code !?
When HP4952 is executing app code, like my monitor code, the TMP84C00 seems
not to be involved. No activity on the pins the Logic Analyzer is checking.
I thought the whole time, until I found this, that the TMP84C00 is the chip
that controls the whole device and runs all Z80 code.

But now, it looks like only if SCC is accessed, the TMP84C00 is being used. 

So some other CPU-like chip is executing the Z80 code. This is very strange, 
mostly because there is no other Z80 chip in the device.

Maybe the PAL/GAL chip on memory board named "1820-4838" is executing Z80 code.

See my input to some discussion here: 
https://hackaday.io/project/163027-hp-4952a-turned-general-purpose-cpm-machine

Because there is nothing known about that chip, I cannot proceed with my approach,
looking at TMP84C00 only. 

So I came back to the approach analyzing the working VT100 app code to get a clue
how to access SCC chip. 

## VT100 app memory map
App is being loaded to 0xa0000 RAM. From there, parts are copied to fsafe RAM areas by apps own startup code.
Menu system is set up and control is given back to menu handler.

App involvement comes, if the user selects "VT100" menu item. 

Then the VT100 menues are active, e.g. fm_execute function is called by menu handler if "Execute" menu
item is selected, or fm_setup is called if "Setup" menu item is selected.

App setup code is in load area 0xa000.

Menu setup code and data is in 0xc000 area.

Then there is a 0xd400 area, purpose unknown.

A small variable buffer area is at 0xdbe0.

App code / data end seems to be at 0xe800. 

From 0xe800 to and of file (0xf8fe), there are fill bytes 0x20,0x82, which may be just fill bytes, or maybe
this is some kind of screen data buffer (because 0x20=SPACE and 0x83 "normal text" mode attribute).

| org    | (org)  | seek   | Labels                               | Comment                                  | Free Space          |
|--------|--------|--------|--------------------------------------|------------------------------------------|---------------------|
| 0xa000 |        | 0x0    |                                      | 0xa000 area, app init code               |
|        | 0xa102 | 0x102  |                                      | word, filesize/256, minimum is 1         |
|        | 0xa147 | 0x147  | entry point ("jp __init")            |                                          |
|        | 0xa180 | 0x180  |                                      | number in dll fixup list                 |
|        | 0xa190 | 0x190  |                                      | fixup list                               |
|        | 0xa410 | 0x410  | _load_dll_stub, _dll_tmp, _dll_stub, | + the app code?                          |
|        |        |        | la246h, __init                       |                                          |
|        | 0xb264 |        |                                      | end of 0xa000 area code                  |
|        | 0xb265 |        |                                      | start fill with zero bytes               | 0xd9a=3842 DISASSEM |
|        | 0xbfff |        |                                      | end of 0xa000 area                       |
| 0xc000 |        | 0x2000 | _splash_screen_data                  | 0xc000 area, splash screen and menu data |
|        | 0xcb6c |        |                                      | end of 0xc000 area code                  |
|        | 0xcb6d |        |                                      | start fill with zero bytes               | 0x892=2194 MON      |
|        | 0xd3ff |        |                                      | end of 0xc000 area                       |
| 0xd400 |        | 0x3400 | code_p_d400                          | 0xd400 area                              |
|        | 0xd896 |        |                                      | end of code_p_d400 area code             |
|        | 0xd897 |        |                                      | start fill with zero bytes               | 0x348=840 SCREEN+KBD |
|        | 0xdbdf |        |                                      | end of code_p_d400 area                  |  
| 0xdbe0 |        | 0x3be0 | code_p_dbe0                          | small area for variables, size 0x20      |
| 0xdc00 |        |        |                                      | a var here?                              |
| 0xde00 |        |        |                                      | a var here?                              |
| 0xe800 |        | 0x4800 | code_p_endfill                       | start of fill bytes 0x20,0x83            | 0x10fe=4350         |
| 0xf8fe |        |        | _file_end                            | end of file, last byte                   |

Monitor w/o Disassembler: 0x711 = 1809 bytes. 

Monitor with Disassembler: 0x121b = 4635 bytes. 

## fm_execute SCC initialization
inside the fm_execute function, SCC is initialized. With logic analyzer I found that the 
initialization is done during call of sub function sub_a5f9h.
```asm
sub_0a54bh:
; delay, 0x1234 times looped
ld hl,01234h		;a54b	21 34 12 	! 4 .   ; hl:=0x1234
loop_delay_a54e:
dec hl			;a54e	2b 	+
ld a,l			;a54f	7d 	}
or h			;a550	b4 	.
jr nz,loop_delay_a54e		;a551	20 fb 	  .

	call read_dbe0		;a553	cd 33 a5 	. 3 .
	;call monitor ; no SCC access so far
	call sub_a5f9h		;a556	cd f9 a5 	. . .   ; calls 4 other subs; these invoke 3 OS API calls
	call monitor ;  SCC access done, but terminal not yet running
	call sub_a6e7h		;a559	cd e7 a6 	. . .   ; calling sub_a6e7h twice, has no subs
	call sub_a6e7h		;a55c	cd e7 a6 	. . .   ; "
	;call monitor ; SCC access done, but terminal not yet running
	call sub_a702h		;a55f	cd 02 a7 	. . .   ; calling sub_a702h twice, has no subs
	call sub_a702h		;a562	cd 02 a7 	. . .   ; "
	;call monitor ; SCC access done, but terminal not yet running
;;	;call sub_a56fh		;a565	cd 6f a5 	. o .   ; large function, see below
call sub_a606h		;a568	cd 06 a6 	. . .   ; "waits for dff0==0 an then writes 5 to it"
;call monitor ; Terminal already runs
call write_dbe0		;a56b	cd 3f a5 	. ? .
ret			        ;a56e	c9 	.
```

The initialization is like:
```asm
ret
;address 79cf on data bus, so I guess its read from stack, return address
; this is command read, at pc, which is now 79cf
call 79afh
; address 79d2 on data bus, so I guess its written to stack, return address for call above

ld a,09h
out (21h),a
ld a,0c0h
out (21h),a
ld a,09h
out (21h),a
ld a,82h
out (21h),a

ld a,09h
out (20h),a
ld a,42h
out (20h),a

ld a,00h
out (40h),a
ret
;address 79d2 on data bus, so I guess its read from stack, return address
```

The lines above look like content of a ROM that is mapped into memory at the time of execution. When I
check the addresses e.g. 79af later in monitor, the content is different. But when I checked all ROMs, there
is no such a command sequence in any ROM.

Next SCC data is
```
4, 5c
a, 0
6, ff
7, ff
3, d0
5, e2
1, 0
2, 50
8, 50
c, ae
d, 0
e, 3
f, 0

4, 5c             ; 0101.1100; 01xx. = x16 clock mode, .11xx = 2 stopbits/char
a, 0
6, 16 
7, 16
3, d0
5, e0
1, 0
b, 50
c, be (z80: ae)   ; lower byte baud rate gen 0xbe = 190   
d, 0              ; upper byte baud rate gen 
e, 3              ; BRG enable, BRG clock source = PCLK pin
f, 0
3, d0 (z80: d1)

in a,(0x23)

3, d0
3, d0

...
out (0x20),a...
in a,(0x22)...

```

Data is written out in a loop:
```asm
  ld    a,l
  ld    (07a9ah),a
  ld    (07ab3h),a
  ld    a,h
  ld    (07a9ch),a
  ld    (07ab5h),a
  ld    c,021h      ; target port for outloop
  ld    hl,07a87h
  call  07abbh
outloop:
  ld    a,(hl)      ; read first byte
  or    a
  ret   z           ; end if first byte a==0
  out   c,(a)       ; write out first byte
  inc   hl
  ld    a,(hl)      ; read 2nd byte
  out   c,(a)       ; write out second byte
  inc   hl
  jr    outloop     ; $-10 repeat loop
```

This code piece is also not contained in any ROM.

### Verifying Time Constant value in WR12 and WR13
In example above, we read these values from data bus:
```asm
c, be             ; lower byte baud rate gen 0xbe = 190   
d, 0              ; upper byte baud rate gen = 0
```
WR12 is lower byte = 0xbe, WR13 upper byte = 0x00. This means, 0x00be = 190 decimal = Time Constant.

Is this value valid or pure nonsense (i.e. is my bus data analysis based on valid data or not) ?

Formula (SCC user manual page 168):<br>
(Clock Frequency / (2 x Desired_Rate * BR_Clock_Period)) -2

E.g.: Desired_Rate = 1200, clock freq. = 7,3728 Mhz, 
BR_Clock_Period = 1 (from examples in Internet).

Then, to have the value 190 valid for 1200 Baud, we need a clock frequency of 7.3728 Mhz/16

The divider by 16 is selected as x16 clock mode in WR4. 

Because the SCC is configured to read clock from PCLK pin, this pin should have the =7,3728 Mhz.
Measured there, value is fine. So the value 190 is valid.

## Further reading

* SCC/ESCC User Manual TBD