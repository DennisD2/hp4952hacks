; z80dasm 1.1.6
; command line: z80dasm -t -a -g 0xa000 -o x.asm VT100.no_header
;
; -------------------------------------------------------------------
; application memory map
; -------------------------------------------------------------------
; App has these sections:
;
;  org      seek
; ------------------
;  0xa000   0x0
;    a102   0x102                           word, filesize/256, minimum is 1
;    a147   0x147                           entry point ("jp __init")
;    a180   0x180                           number in dll fixup list
;    a190   0x190                           fixup list
;    a410   0x410                           _load_dll_stub, _dll_tmp, _dll_stub, la246h, __init + the app code?
;  0xd400   0x3400 code_p_d400              ?
;  0xdbe0   0x3be0 code_p_dbe0              small area for variables, size 0x20
;  0xc000   0x2000 _splash_screen_data      splash screen and menu data
;  0x2a00                                   APP_TARGET_AREA
;  0xe800   0x4800 code_p_endfill           contains fill bytes up to next multiple of 256

; -------------------------------------------------------------------
; system memory map (work in progress)
; -------------------------------------------------------------------
;    0x0 - 0x1000   ?
; 0x1000 - 0x3f00   Application RAM
; 0x3f01 -          ?
; 0x8000 - ?        10046 ROM
; 0xda20 - ?        Application RAM
; 0xdbe0 - 0xdbff   Application RAM
; 0xdc00 - 0xffff   ?
;
; There are overlapping spaces for RAM/ROM. using out (020h),<page-id> or bank-id,
; it can be selected what memory appears for some address.
; I need to study the HP4952 doc more on that.
;
; Collected details:
;	0x1000 seems RAM
;	ld (010b5h),a		;a4d8	32 b5 10 	2 . . 		; value copied to various locations, address range 0x1xxx, must also be RAM
;	ld (0112dh),a		;a4db	32 2d 11 	2 - .
;	ld (01067h),a		;a4de	32 67 10 	2 g .
;	ld (01133h),a		;a4e1	32 33 11 	2 3 .
; 	ld (0110ch),a		;a50b	32 0c 11 	2 . .       ; (0110ch):=a
;
;	0x2a00 seems safe RAM, also 2d00: Application RAM
;
;   0x3f00 seems safe RAM
; 	ld hl,0dbe0h		;a533	21 e0 db 	! . .
;	ld de,03f00h		;a536	11 00 3f 	. . ?
;
; 	0x8000 seems to be ROM "10046 ROM"
;	ld hl,08000h		;a450	21 00 80 	! . .   ; Copy system ordinals from 10046 ROM
;
; Switching pages:
;	ld a,004h		;a44c	3e 04 	> .             ; Access Page 4 - 10046 ROM Lower Page
;	out (020h),a		;a44e	d3 20 	.           ;
;
;   0xda20 contains readable data
;	ld hl,0da20h
;
;   0xdbe0 seems to have 0x20 bytes of interest,

; -------------------------------------------------------------------
; out/in found
; -------------------------------------------------------------------
; out(000h) 9x    - 0x70, 0x78, 0x90, 0xd3, 0xd4
; out(001h) 1x    - 0x0
; out(002h) 7x    - 0x0, 0x80
; out(020h) 17x   - sets "page" to value in a; 4=10046 ROM lower page, 2 ="Application ROM"
;                   more values: 1, 3, 9, 0x10, 0x30, 0x33, 0x42
; out(021h) 21x   - 0, 1, 3, 5, 8, 9, 0x10, 0xc0, 0x10, 0x30, 0x33, 0x82
; out(023h) 1x
; out(040h) 2x    - 0x0, 0xd2
; out(080h) 3x    - 0x0
; out(090h) 2x
;
; in(001h)  1x
; in(020h)  2x
; in(021h)  1x
; in(022h)  1x
; in(023h)  1x
; in(02ah)  1x
; in(0cbh)  1x

; not found in this code:
; lib/keyb.asm:   out (0d0h) set row bits; related to keyboard input control
; -------------------------------------------------------------------

; target address where app code is being copied during startup by HP4952 app loading
app_target_area:        equ     02a00h

; HP4952a firmware/OS functions
os_loadpage:            equ     00e60h      ; loads a page; ROM function
os_rtn_to_main_menu:    equ     014d5h      ; jumps back to HP4953 main menu, ends app

;------------------------------------------------------------------
; a000 area
;------------------------------------------------------------------
	org	0a000h
	seek 00000h

_file_start:
	defb "4952 Protocol Analyzer"
	
	org 0a016h
	seek 00016h
	defw 003c4h
	defw 00800h

	org 0a01ah
	seek 0001ah
	defb "VT100 ASYNC TERMINAL EMULATOR   ", 000h

_filesize:
	org 0a102h
	seek 00102h

	;defb "X"
    ;defb 000h
    defw ((_file_end - _file_start) / 256)-1        ; Blocks in file - 1

	defb "        TERMINAL  4952  "
	defw 00800h

_fileflags:
	;defb 000h, 001h
	defw 00100h                                     ; Flags 0200h is copy protect


	defb "Async Terminal Emulator - DUMB  ", 000h

;; Entry Point
    org 0a147h
    seek 00147h

;; see lib/strap.asm
_entryaddr:
	;jp 0a497h		;a147	c3 97 a4 	. . .
    jp __init

;; Some applications define main application entry point here
;; See  lib/strap.asm
;; Main Application
    org 0a150h
    seek 0050h
;; Obviously, vt100.app does not define any value here.
    defw 00000h

    org 0a17dh
    seek 0017dh

    ;; for next 3 bytes, meaning is unknown
    ;	ld (bc),a			;a17d	02 	.
    ;	cp d			;a17e	ba 	.
    ;	rst 30h			;a17f	f7 	.
    ;; sequence is 02,ba,f7
    defb 002h, 0bah, 0f7h


    org 0a180h
    seek 00180h
num_fixups:
    ;; Dynamic link loader data pointer & size (text from lib/splash.asm)
    ;; I see only "number of patches" entry in the code
    ;defb 061h
    defw (__dll_fixups_end - __dll_fixups) / 6 ; Number of patches

    org 0a190h
    seek 00190h

__dll_fixups:
    ; Example of conversion step per 6 bytes
    ;defw 02d02h, 00000h, 0c136h
	;ld (bc),a			;a190	02 	.
	;dec l			;a191	2d 	-
	;nop			;a192	00 	.
	;nop			;a193	00 	.
	;ld (hl),0c1h		;a194	36 c1 	6 .

    ; dll-fixup table offset 0x190 - converted with small go routine
    ; Table meaning: Each entry describes a replacement of an address.
    ;   <new target address>, <?>, <location, in this file, of address word to patch>
    ;
    ; Example 1:
    ; This entry:
    ;   defw 02d32h, 00000h, 0a49ch ; entry 50, offset 700
    ; refers to word at address 0a49ch. The related assembler line is:
    ;   call 01543h		;a49b	cd 43 15 	. C .
    ; So, at a49c, we have bytes "43 15", which is word 01543h.
    ; This value is now replaced by 02d32h .
    ;
    ; Example 2:
    ;   defw 02e6eh, 00000h, 0a49fh ; entry 51, offset 706
    ; refers to word at address 0a49fh. The related assembler line is:
    ;	call 00fe9h		;a49e	cd e9 0f
    ; So, at a49f we have bytes "e9 0f", which is word 00fe9h.
    ; This value is now replaced by 02e6eh

    defw 02d02h, 00000h, 0c136h ; entry 0, offset 400
    defw 02d02h, 00000h, 0c170h ; entry 1, offset 406
    defw 02d02h, 00000h, 0c196h ; entry 2, offset 412
    defw 02d50h, 00000h, 0c19dh ; entry 3, offset 418
    defw 02d02h, 00000h, 0c307h ; entry 4, offset 424
    defw 02d02h, 00000h, 0c30dh ; entry 5, offset 430
    defw 02e54h, 00000h, 0c314h ; entry 6, offset 436
    defw 02d02h, 00000h, 0c31ah ; entry 7, offset 442
    defw 02d02h, 00000h, 0c339h ; entry 8, offset 448
    defw 02d02h, 00000h, 0c347h ; entry 9, offset 454
    defw 02d02h, 00000h, 0c350h ; entry 10, offset 460
    defw 02d02h, 00000h, 0c35eh ; entry 11, offset 466
    defw 02e3ch, 00000h, 0c41bh ; entry 12, offset 472
    defw 02e3ch, 00000h, 0c41dh ; entry 13, offset 478
    defw 02e3ch, 00000h, 0c41fh ; entry 14, offset 484
    defw 02e3ch, 00000h, 0c421h ; entry 15, offset 490
    defw 02e3ch, 00000h, 0c423h ; entry 16, offset 496
    defw 02e3ch, 00000h, 0c425h ; entry 17, offset 502
    defw 02e3ch, 00000h, 0c427h ; entry 18, offset 508
    defw 02e3ch, 00000h, 0c429h ; entry 19, offset 514
    defw 02e3ch, 00000h, 0c42bh ; entry 20, offset 520
    defw 02e42h, 00000h, 0c42dh ; entry 21, offset 526
    defw 02e42h, 00000h, 0c42fh ; entry 22, offset 532
    defw 02e42h, 00000h, 0c431h ; entry 23, offset 538
    defw 02e42h, 00000h, 0c433h ; entry 24, offset 544
    defw 02e42h, 00000h, 0c435h ; entry 25, offset 550
    defw 02e42h, 00000h, 0c437h ; entry 26, offset 556
    defw 02e42h, 00000h, 0c439h ; entry 27, offset 562
    defw 02e42h, 00000h, 0c43bh ; entry 28, offset 568
    defw 02e42h, 00000h, 0c43dh ; entry 29, offset 574
    defw 02d02h, 00000h, 0c8d7h ; entry 30, offset 580
    defw 02e3ah, 00000h, 0c8f4h ; entry 31, offset 586
    defw 02d02h, 00000h, 0c932h ; entry 32, offset 592
    defw 02d02h, 00000h, 0c93bh ; entry 33, offset 598
    defw 02d38h, 00000h, 0c93eh ; entry 34, offset 604
    defw 02d02h, 00000h, 0c948h ; entry 35, offset 610
    defw 02d50h, 00000h, 0c954h ; entry 36, offset 616
    defw 02e60h, 00000h, 0c9fdh ; entry 37, offset 622
    defw 02e60h, 00000h, 0ca09h ; entry 38, offset 628
    defw 02e60h, 00000h, 0ca15h ; entry 39, offset 634
    defw 02e60h, 00000h, 0ca21h ; entry 40, offset 640
    defw 02e60h, 00000h, 0ca2dh ; entry 41, offset 646
    defw 02e60h, 00000h, 0ca39h ; entry 42, offset 652
    defw 02e60h, 00000h, 0ca45h ; entry 43, offset 658
    defw 02e60h, 00000h, 0ca51h ; entry 44, offset 664
    defw 02e60h, 00000h, 0ca5dh ; entry 45, offset 670
    defw 02df8h, 00000h, 0caf7h ; entry 46, offset 676
    defw 02deah, 00000h, 0cafah ; entry 47, offset 682
    defw 02e02h, 00000h, 0cb1dh ; entry 48, offset 688
    defw 02dd0h, 00000h, 0cb20h ; entry 49, offset 694
    defw 02d32h, 00000h, 0a49ch ; entry 50, offset 700
    defw 02e6eh, 00000h, 0a49fh ; entry 51, offset 706
    defw 02e66h, 00003h, 0a4a2h ; entry 52, offset 712
    defw 02e66h, 00003h, 0a4ach ; entry 53, offset 718
    defw 02e66h, 00004h, 0a4b2h ; entry 54, offset 724
    defw 02e32h, 00000h, 0a4c9h ; entry 55, offset 730
    defw 02eb2h, 00000h, 0a4d9h ; entry 56, offset 736
    defw 02edah, 00000h, 0a4dch ; entry 57, offset 742
    defw 02e98h, 00000h, 0a4dfh ; entry 58, offset 748
    defw 02edch, 00000h, 0a4e2h ; entry 59, offset 754
    defw 02d6ch, 00000h, 0a506h ; entry 60, offset 760
    defw 02eceh, 00003h, 0a50ch ; entry 61, offset 766
    defw 02e54h, 00000h, 0a50fh ; entry 62, offset 772
    defw 02eceh, 00004h, 0a512h ; entry 63, offset 778
    defw 02eceh, 00000h, 0a519h ; entry 64, offset 784
    defw 02eb2h, 00000h, 0a621h ; entry 65, offset 790
    defw 02edah, 00000h, 0a624h ; entry 66, offset 796
    defw 02e98h, 00000h, 0a627h ; entry 67, offset 802
    defw 02edch, 00000h, 0a62ah ; entry 68, offset 808
    defw 02e92h, 00003h, 0a62dh ; entry 69, offset 814
    defw 02e92h, 00004h, 0a633h ; entry 70, offset 820
    defw 02e92h, 00003h, 0a63bh ; entry 71, offset 826
    defw 02e92h, 00004h, 0a641h ; entry 72, offset 832
    defw 02e2ch, 00000h, 0a644h ; entry 73, offset 838
    defw 02e92h, 00003h, 0a64ch ; entry 74, offset 844
    defw 02e92h, 00004h, 0a652h ; entry 75, offset 850
    defw 02e1ch, 00000h, 0a655h ; entry 76, offset 856
    defw 02e1ch, 00001h, 0a65bh ; entry 77, offset 862
    defw 02e1ch, 00000h, 0a664h ; entry 78, offset 868
    defw 02ecch, 00000h, 0a667h ; entry 79, offset 874
    defw 02e1ch, 00001h, 0a66ah ; entry 80, offset 880
    defw 02ecch, 00003h, 0a66fh ; entry 81, offset 886
    defw 02ecch, 00004h, 0a675h ; entry 82, offset 892
    defw 02e92h, 00000h, 0a67ah ; entry 83, offset 898
    defw 02e1ch, 00000h, 0a684h ; entry 84, offset 904
    defw 02e1ch, 00001h, 0a68ah ; entry 85, offset 910
    defw 02e1ch, 00000h, 0a68dh ; entry 86, offset 916
    defw 02ecch, 00003h, 0a693h ; entry 87, offset 922
    defw 02e1ch, 00000h, 0a696h ; entry 88, offset 928
    defw 02ecch, 00004h, 0a699h ; entry 89, offset 934
    defw 02ecch, 00000h, 0a6d0h ; entry 90, offset 940
    defw 02d9ch, 00000h, 0a6d5h ; entry 91, offset 946
    defw 02d06h, 00000h, 0a6d8h ; entry 92, offset 952
    defw 02edah, 00000h, 0a887h ; entry 93, offset 958
    defw 02e98h, 00000h, 0a8a5h ; entry 94, offset 964
    defw 02e1ch, 00000h, 0a8a8h ; entry 95, offset 970
    defw 02e1ch, 00000h, 0a8c9h ; entry 96, offset 976
    ; dllfixup table has 97 (0x61) entries.
__dll_fixups_end:

    org 0a410h
    seek 00410h

;; This is a dynamic linker, at runtime it loads a copy of the
;; ROM vector table into RAM and fixes up all the stubbed
;; ROM references in the executable

;; Load and execute ordinal patching stub from a safe location
_load_dll_stub:
	ld hl,_dll_stub		;a410	21 4c a4 	! L .		; copy 0x36 bytes from a44c to 2a00
	ld de,app_target_area		;a413	11 00 2a 	. . *       : this is _dll_stub function code block
	;ld bc,00036h		;a416	01 36 00 	. 6 .
	ld bc,_dll_stub_end-_dll_stub		;a416	01 36 00 	. 6 .
	ldir		;a419	ed b0 	. .

	call app_target_area    ;a41b	cd 00 2a 	. . * 			; jump to copied code, i.e. _dll_stub
	;call 02a00h		;a41b	cd 00 2a 	. . * 			

    ;; 0a190h -> __dll_fixups
    ;; 0a180h -> num_fixups
	ld ix,__dll_fixups		        ;a41e	dd 21 90 a1 	. ! . .
	ld bc,(num_fixups)		;a422	ed 4b 80 a1 	. K . .
    ld l,(ix+000h)                  ;
    ld h,(ix+001h)                  ;
    ld e,(hl)                       ; Read L Byte
    inc hl                          ;
    ld d,(hl)                       ; Read H Byte
    ld l,(ix+002h)                  ; Get Patch Value
    ld h,(ix+003h)                  ;
    add hl,de                       ; Patch the pointer
    ex de,hl                        ;
    ld l,(ix+004h)                  ; Dest Address
    ld h,(ix+005h)                  ;
    ld (hl),e                       ; Write L Byte
    inc hl                          ;
    ld (hl),d                       ; Write H Byte
    ld de,00006h                    ;
    add ix,de                       ; Next Entry
    dec bc                          ;
    ld a,b                          ;
    or c                            ;
    jr nz,$-34                      ; More entries?
    ret                             ;

;; Local temp index variable
;; seems to be read-only.
_dll_tmp:
	;nop			;a44b	00 	.
	defb 000h

;; see line 138ff
; a44c -> _dll_stub
_dll_stub:
	ld a,004h		;a44c	3e 04 	> .             ; Access Page 4 - 10046 ROM Lower Page
	out (020h),a		;a44e	d3 20 	.           ;

	ld hl,08000h		;a450	21 00 80 	! . .   ; Copy system ordinals from 10046 ROM
	ld de,02d00h		;a453	11 00 2d 	. . -	; copy 0x134 bytes from 08000 to 02d00
	ld bc,00134h		;a456	01 34 01 	. 4 .
	ldir		;a459	ed b0 	. .

	ld a,002h		;a45b	3e 02 	> .             ; Load Page 2 - Application "ROM"
	out (020h),a		;a45d	d3 20 	.

	ld hl,(02d0ch)		;a45f	2a 0c 2d 	* . -   ; Generate 17 more for 02e34h = 0d9f0h...0da20h
	ld bc,00003h		;a462	01 03 00 	. . .   ; stepping 3 bytes
	ld a,011h		;a465	3e 11 	> .             ;  amount to copy .. Source appears to be a jump table
	;; 0a482h --> la246h
	call la246h		;a467	cd 82 a4 	. . .

	ld hl,(02e16h)		;a46a	2a 16 2e 	* . .   ; Generate 0x44/68 more for 02e56h =
	ld a,(hl)			;a46d	7e 	~
	inc hl			;a46e	23 	#
	ld h,(hl)			;a46f	66 	f
	ld l,a			;a470	6f 	o
	ld bc,00006h		;a471	01 06 00 	. . .   ; stepping 6 bytes
	ld a,044h		;a474	3e 44 	>               ; amount to copy
	;; 0a482h --> la246h
	call la246h		;a476	cd 82 a4 	. . .

	ld bc,00002h		;a479	01 02 00 	. . .   ; stepping 3, Generate 30 more for 02edeh = 0eb98h..
	;; STRANGE, LIB/STRAP.ASM HAS 01EH AS VALUE FOR NEXT LINE
	ld a,01dh		;a47c	3e 1d 	> .             ; amount to copy
	;; 0a482h --> la246h
	call la246h		;a47e	cd 82 a4 	. . .
	ret			;a481	c9 	.
_dll_stub_end:

; copies words from HL to loc.starting.at.DE, A iterations
; HL steps BC, DE steps 2
; uses _dll_tmp variable for loop counter,counted down to 0
la246h:
    ld ix,_dll_tmp                  ;
    ld (ix+000h),a                  ;
loop_la246h:
    ld a,l                          ; do {
    ld (de),a                       ;   *DE = L
    inc de                          ;   DE++
    ld a,h                          ;
    ld (de),a                       ;   *DE = H
    inc de                          ;   DE++
    add hl,bc                       ;   HL+=BC
    dec (ix+000h)                   ; } while(TMP-- != 0)
    jr nz,$-10                      ; -> loop_la246h
    ret                             ;

_tmp_page:
    ; This looks like a variable for the current page, initialized with 2
	;ld (bc),a			;a496	02 	.
	; a496 -> _tmp_page
	defb 002h

;; main entry point...
    ; vars:
    ; 0fd4
    ; 0fd5
__init:
	di			;a497	f3 	.
	call _load_dll_stub		;a498	cd 10 a4 	. . .				; 0a410 -> _load_dll_stub
	call 01543h		;a49b	cd 43 15 	. C . 						; Patched to 2d32 -> 01543h
	call 00fe9h		;a49e	cd e9 0f 	      						; Patched to 2e6e -> 00fe9h
	ld a,(00fd4h)		;a4a1	3a d4 0f 	: . . 					; a:=(0fd4)
	and 07fh		;a4a4	e6 7f 	.  							; clear highest bit
	ld (_tmp_page),a		;a4a6	32 96 a4 	2 . .				; save result in _tmp_page (a496), (a496):=a

l2065h:
    ; comment from lib/strap.asm: "Patch 00fd4h -> our menu display function"
	ld a,006h		;a4a9	3e 06 	> .             				; (fd4h):=6
	ld (00fd4h),a		;a4ab	32 d4 0f 	2 . .   				;
;; POI-010 a4cd seems to be some data or table section see POI-011
	ld hl,var_word_a4cd		;a4ae	21 cd a4 	! . .   			; h1:=a4cdh
	ld (00fd5h),hl		;a4b1	22 d5 0f 	" . .   				; (fd5):=hl
	call fun_a9c7		;a4b4	cd c7 a9 	. . .   				;

	; copy 0x1400 bytes starting _splash_screen_data to 0x2a00
	ld hl,_splash_screen_data		;a4b7	21 00 c0 	! . .		; this will overwrite just copied _dll_stub code, which is no longer needed
	ld de,app_target_area		;a4ba	11 00 2a 	. . *

	;ld bc,01400h		;a4bd	01 00 14 	. . .                   ; copy 0x1400 bytes
	ld bc,code_p_d400-_splash_screen_data    ;a4bd	01 00 14 	. . .
	ldir		;a4c0	ed b0 	. .

; next line: 02b23h points into the block just copied by ldir above. The block was copied 
; to start address 02a00h, so 02a00h was named/defined to app_target_area
; This means, a "call 02b23" points to the app_target_area with offset 0123h.
; in this file, we will find the function 02b3 with base "org" offset 0xc000 and 
; offset 123h, so at 0c123h
;
; How do we formulate this as a calculation of label values?
; result must be 2b23. Input is app_target_area and the function label to be created at c123.
; result = app_target_area + (f_2b23 - _splash_screen_data)
; or rearranged for improved reading:
; result = f_2b23 + app_target_area-_splash_screen_data
	call  f_2b23 + app_target_area-_splash_screen_data	;a4c2	cd 23 2b 	. # +
	;call 02b23h		;a4c2	cd 23 2b 	. # +
    ;call to app_target_area + 018fh	, label l_2b8f
	call l_2b8f + app_target_area-_splash_screen_data	;a4c5	cd 8f 2b 	. . +
	;call 02b8fh		;a4c5	cd 8f 2b 	. . +

    ; see lib/strap.asm
    ; return to main menu, means we have set up the menu part. Do nothing until menu item for this app is selected
    ; then main menu handler will call some entry function of this app. What function is this????
	jp os_rtn_to_main_menu		;a4c8	c3 d5 14 	. . . ; Patched to 02e32h
	;jp 014d5h
	
	
;; POI-011, some data, used by POI-10 line
var_word_a4cb:
	defb	021h, 076h
var_word_a4cd:
	defb 	0f3h, 021h ; adress value a4cd used by line a4ae and stored in (fd5)
	defb	021h, 076h
	;ld hl,0f376h		;a4cb	21 76 f3 	! v .
	;ld hl,07621h		;a4ce	21 21 76 	! ! v
	defb 022h, 0cbh, 0a4h
	;ld (var_word_a4cb),hl		;a4d1	22 cb a4 	" . .

;; POI-100 who enters this loop?
loop_a4d4:
	di			;a4d4	f3 	.                           ; DI
	ld a,(0a530h)		;a4d5	3a 30 a5 	: 0 . 		; a530 contains a0cdh, at least at initialization
	ld (010b5h),a		;a4d8	32 b5 10 	2 . . 		; value copied to various locations, address range 0x1xxx, must also be RAM
	ld (0112dh),a		;a4db	32 2d 11 	2 - . 
	ld (01067h),a		;a4de	32 67 10 	2 g . 
	ld (01133h),a		;a4e1	32 33 11 	2 3 .

	ld hl,_splash_screen_data		;a4e4	21 00 c0 	! . . ; copies 0x1400 bytes from _splash_screen_data to 2a00h
	ld de,app_target_area		;a4e7	11 00 2a 	. . *
	ld bc,code_p_d400-_splash_screen_data 		;a4ea	01 00 14 	. . .
	ldir		;a4ed	ed b0 	. .

	call read_dbe0		;a4ef	cd 33 a5 	. 3 . 		; a533 -> read_dbe0
	ld a,021h		;a4f2	3e 21 	> !                 ; (07501h):=0x21
	ld (07501h),a		;a4f4	32 01 75 	2 . u       ;
	ei			;a4f7	fb 	.                           ; EI
	
	ld a,(03f12h)		;a4f8	3a 12 3f 	: . ?       ; a:=(3f12h), this address was populated by read_dbe0()
	cp 003h		;a4fb	fe 03 	. .                     ; a==0x3 ?
	jr z,$+33		;a4fd	28 1f 	( .                 ; yes, jump to l_a51e
	call write_dbe0		;a4ff	cd 3f a5 	. ? . 		; no, a5ef -> write_dbe0 ; write back values as read, unchanged !?!

    call f_2b23 + app_target_area-_splash_screen_data
	;call 02b23h		;a502	cd 23 2b 	. # +

	call 0007eh		;a505	cd 7e 00 	. ~ . 			; Patched to 02d6ch
	ld a,(_tmp_page)		;a508	3a 96 a4 	: . .   ; a:=_tmp_page
	ld (0110ch),a		;a50b	32 0c 11 	2 . .       ; (0110ch):=a
	ld hl,0da20h		;a50e	21 20 da 	!   .       ; hl:=da20h
	ld (0110dh),hl		;a511	22 0d 11 	" . .       ; (0110f):=h1
	ld hl,(var_word_a4cb)		;a514	2a cb a4 	* . .       ; h1:= (a4cb)
	push hl			;a517	e5 	.                       ; save hl
	call 01109h		;a518	cd 09 11 	. . . 			; ;; call main menu handler	, Patched to 02eceh
	pop hl			;a51b	e1 	.                       ; restore hl
	jr $+11		;a51c	18 09 	. .                     ; uncoditioned jr to l_a52d
l_a51e:
	call set_3f12_to_2		;a51e	cd ec a8 	. . .
	call write_dbe0		;a521	cd 3f a5 	. ? .

    call f_2cfc + app_target_area-_splash_screen_data
	;call 02cfch		;a524	cd fc 2c 	. . ,

	ld hl,0761ch		;a527	21 1c 76 	! . v       ; (a4cbh):=0x761
	ld (var_word_a4cb),hl		;a52a	22 cb a4 	" . .   ;
l_a52d:
	jp loop_a4d4		;a52d	c3 d4 a4 	. . .           ; Loop Forever

	;; 0a530 used by line a4d5, it is a defb
	;call 00000h		;a530	cd 00 00 	. . .
	defb	0cdh
	defb	000h, 000h

read_dbe0:
	; a533 -> read_dbe0
    ; copies from dbe0h -> 3f00h, 0x20 bytes
	ld hl,code_p_dbe0		;a533	21 e0 db 	! . .
	ld de,03f00h		;a536	11 00 3f 	. . ?
	ld bc,end_code_p_dbe0-code_p_dbe0		;a539	01 20 00 	.   .
	ldir		;a53c	ed b0 	. .
	ret			;a53e	c9 	.

write_dbe0:
	; a53f -> write_dbe0
    ; copies from 3f00h -> dbe0h, 0x20 bytes
	ld hl,03f00h		;a53f	21 00 3f 	! . ?
	ld de,code_p_dbe0		;a542	11 e0 db 	. . .
	ld bc,end_code_p_dbe0-code_p_dbe0		;a545	01 20 00 	.   .
	ldir		;a548	ed b0 	. . 
	ret			;a54a	c9 	. 

    ; delay, 0x1234 times looped
	ld hl,01234h		;a54b	21 34 12 	! 4 .   ; hl:=0x1234
loop_delay_a54e:
	dec hl			;a54e	2b 	+ 
	ld a,l			;a54f	7d 	} 
	or h			;a550	b4 	. 
	jr nz,$-3		;a551	20 fb 	  .             ; -> loop_delay_a54e

	call read_dbe0		;a553	cd 33 a5 	. 3 .   ; read back what we just wrote
	call f_a5f9		;a556	cd f9 a5 	. . .
	call 0a6e7h		;a559	cd e7 a6 	. . . 
	call 0a6e7h		;a55c	cd e7 a6 	. . . 
	call 0a702h		;a55f	cd 02 a7 	. . . 
	call 0a702h		;a562	cd 02 a7 	. . . 
	call 0a56fh		;a565	cd 6f a5 	. o . 
	call 0a606h		;a568	cd 06 a6 	. . . 
	call write_dbe0		;a56b	cd 3f a5 	. ? .
	ret			;a56e	c9 	. 

    ; checks b against several values
	call 0af71h		;a56f	cd 71 af 	. q . 
	jr z,$+69		;a572	28 43 	( C 
	ld a,(03f01h)		;a574	3a 01 3f 	: . ? 
	and c			;a577	a1 	. 
	ld c,a			;a578	4f 	O 
	jp p,0a580h		;a579	f2 80 a5 	. . . 
	res 7,b		;a57c	cb b8 	. . 
	res 6,b		;a57e	cb b0 	. . 
	ld a,c			;a580	79 	y 
	cp 020h		;a581	fe 20 	.   
	jr nc,$+28		;a583	30 1a 	0 . 
	cp 01bh		;a585	fe 1b 	. . 
	jr z,$+24		;a587	28 16 	( . 
	cp 00ah		;a589	fe 0a 	. . 
	jr z,$+20		;a58b	28 12 	( . 
	cp 00dh		;a58d	fe 0d 	. . 
	jr z,$+16		;a58f	28 0e 	( . 
	cp 008h		;a591	fe 08 	. . 
	jr z,$+12		;a593	28 0a 	( . 
	cp 007h		;a595	fe 07 	. . 
	jr z,$+8		;a597	28 06 	( . 
	ld a,(03f0eh)		;a599	3a 0e 3f 	: . ? 
	or a			;a59c	b7 	. 
	jr z,$+7		;a59d	28 05 	( . 
	push bc			;a59f	c5 	. 
	call 0aa21h		;a5a0	cd 21 aa 	. ! . 
	pop bc			;a5a3	c1 	. 
	ld a,005h		;a5a4	3e 05 	> . 
	cp c			;a5a6	b9 	. 
	jr nz,$+14		;a5a7	20 0c 	  . 
	ld a,(03f06h)		;a5a9	3a 06 3f 	: . ? 
	cp 001h		;a5ac	fe 01 	. . 
	jr nz,$+7		;a5ae	20 05 	  . 
	ld a,006h		;a5b0	3e 06 	> . 
	call 0a912h		;a5b2	cd 12 a9 	. . . 
	jr $-70		;a5b5	18 b8 	. . 
	ei			;a5b7	fb 	. 
	call 0a71dh		;a5b8	cd 1d a7 	. . . 
	jr z,$+59		;a5bb	28 39 	( 9 
	jp nc,0a5d5h		;a5bd	d2 d5 a5 	. . . 
	call 0a912h		;a5c0	cd 12 a9 	. . . 
	cp 00dh		;a5c3	fe 0d 	. . 
	jr nz,$+49		;a5c5	20 2f 	  / 
	ld a,(03f10h)		;a5c7	3a 10 3f 	: . ? 
	cp 001h		;a5ca	fe 01 	. . 
	jr nz,$+42		;a5cc	20 28 	  ( 
	ld a,00ah		;a5ce	3e 0a 	> . 
	call 0a912h		;a5d0	cd 12 a9 	. . . 
	jr $+35		;a5d3	18 21 	. ! 
	cp 0f8h		;a5d5	fe f8 	. . 
	ret z			;a5d7	c8 	. 

    ; checks a against 0xfa,fb,ff and calls functions
	cp 0fah		;a5d8	fe fa 	. . 
	jr nz,$+7		;a5da	20 05 	  . 
	call 0a922h		;a5dc	cd 22 a9 	. " . 
	jr $+23		;a5df	18 15 	. . 
	cp 0fbh		;a5e1	fe fb 	. . 
	jr nz,$+7		;a5e3	20 05 	  . 
	call 0a702h		;a5e5	cd 02 a7 	. . . 
	jr $+14		;a5e8	18 0c 	. . 
	cp 0ffh		;a5ea	fe ff 	. . 
	jr nz,$+7		;a5ec	20 05 	  . 
	call 0a6e7h		;a5ee	cd e7 a6 	. . . 
	jr $+5		;a5f1	18 03 	. . 
	call 0a9e0h		;a5f3	cd e0 a9 	. . . 
	jp 0a56fh		;a5f6	c3 6f a5 	. o .

f_a5f9:
	call fun_a9d7		;a5f9	cd d7 a9 	. . .
	call 0a6d4h		;a5fc	cd d4 a6 	. . . 
	call 0aee5h		;a5ff	cd e5 ae 	. . . 
	call 0a87bh		;a602	cd 7b a8 	. { . 
	ret			;a605	c9 	. 

	call 0a8e3h		;a606	cd e3 a8 	. . .
la609h:
	ret			;a609	c9 	.

la60ah:
;var_byte_a60a:
	; next bytes are variables
	defb        000h
	;nop			;a60a	00 	.

la60bh:
;var_byte_aa60b:
	defb        000h
	;nop			;a60b	00 	.

la60ch:
;var_word_aa60c:
	defw        000h
	;nop			;a60c	00 	.
	;nop			;a60d	00 	.

f_a60e:
    ; big setup like function
	call read_dbe0		;a60e	cd 33 a5 	. 3 .
	call sub_a87bh		;a611	cd 7b a8 	. { .
	call sub_a8e3h		;a614	cd e3 a8 	. . .
	call sub_a92bh		;a617	cd 2b a9 	. + .
	call write_dbe0		;a61a	cd 3f a5 	. ? .
	ld a,(la609h)		;a61d	3a 09 a6 	: . .  ; hm, at 0a609 we have an op code, not a var !?!
	ld (010b5h),a		;a620	32 b5 10 	2 . . 
	ld (0112dh),a		;a623	32 2d 11 	2 - . 
	ld (01067h),a		;a626	32 67 10 	2 g . 
	ld (01133h),a		;a629	32 33 11 	2 3 . 
	ld a,(01058h)		;a62c	3a 58 10 	: X . 
	ld (la60ah),a		;a62f	32 0a a6 	2 . .
	ld hl,(01059h)		;a632	2a 59 10 	* Y . 
	ld (la60ch),hl		;a635	22 0c a6 	" . .
	ld a,006h		;a638	3e 06 	> . 
	ld (01058h),a		;a63a	32 58 10 	2 X . 
	ld hl,la646h		;a63d	21 46 a6 	! F .
	ld (01059h),hl		;a640	22 59 10 	" Y . 
	jp 01381h		;a643	c3 81 13 	. . .

la646h:
	push af			;a646	f5 	. 
	push hl			;a647	e5 	. 
	ld a,(la60ah)		;a648	3a 0a a6 	: . .
	ld (01058h),a		;a64b	32 58 10 	2 X . 
	ld hl,(la60ch)		;a64e	2a 0c a6 	* . .
	ld (01059h),hl		;a651	22 59 10 	" Y . 
	ld a,(016e2h)		;a654	3a e2 16 	: . . 
	ld (la60bh),a		;a657	32 0b a6 	2 . .
	ld hl,(016e3h)		;a65a	2a e3 16 	* . . 
	ld (la60ch),hl		;a65d	22 0c a6 	" . .
	ld a,(la679h)		;a660	3a 79 a6 	: y .
	ld (016e2h),a		;a663	32 e2 16 	2 . . 
	ld hl,01103h		;a666	21 03 11 	! . . 
	ld (016e3h),hl		;a669	22 e3 16 	" . . 
	ld a,006h		;a66c	3e 06 	> . 
	ld (01106h),a		;a66e	32 06 11 	2 . . 
	ld hl,la67ch		;a671	21 7c a6 	! | .
	ld (01107h),hl		;a674	22 07 11 	" . . 
	pop hl			;a677	e1 	. 
	pop af			;a678	f1 	. 
la679h:
	jp 01055h		;a679	c3 55 10 	. U .
la67ch:
	push ix		;a67c	dd e5 	. .
	push af			;a67e	f5 	. 
	push hl			;a67f	e5 	. 
	ld a,(la60bh)		;a680	3a 0b a6 	: . .
	ld (016e2h),a		;a683	32 e2 16 	2 . . 
	ld hl,(la60ch)		;a686	2a 0c a6 	* . .
	ld (016e3h),hl		;a689	22 e3 16 	" . . 
	call 016e2h		;a68c	cd e2 16 	. . . ; Patched to e1ch
	ld a,(la60ah)		;a68f	3a 0a a6 	: . .
	ld (01106h),a		;a692	32 06 11 	2 . . 
	ld hl,016e2h		;a695	21 e2 16 	! . . 
	ld (01107h),hl		;a698	22 07 11 	" . . 
	ld ix,02808h		;a69b	dd 21 08 28 	. ! . ( 
	ld a,(ix+008h)		;a69f	dd 7e 08 	. ~ . 
	ld (ix+002h),a		;a6a2	dd 77 02 	. w . 
	ld (ix+004h),a		;a6a5	dd 77 04 	. w . 
	ld (ix+006h),a		;a6a8	dd 77 06 	. w . 
	ld a,(ix+009h)		;a6ab	dd 7e 09 	. ~ . 
	ld (ix+003h),a		;a6ae	dd 77 03 	. w . 
	ld (ix+005h),a		;a6b1	dd 77 05 	. w . 
	ld (ix+007h),a		;a6b4	dd 77 07 	. w . 
	set 1,(ix+013h)		;a6b7	dd cb 13 ce 	. . . . 
	set 7,(ix+013h)		;a6bb	dd cb 13 fe 	. . . . 
	set 7,(ix+037h)		;a6bf	dd cb 37 fe 	. . 7 . 
	ld hl,00000h		;a6c3	21 00 00 	! . . 
	ld (01df8h),hl		;a6c6	22 f8 1d 	" . . 
	out (080h),a		;a6c9	d3 80 	. . 
	pop hl			;a6cb	e1 	. 
	pop af			;a6cc	f1 	. 
	pop ix		;a6cd	dd e1 	. . 
	jp 01103h		;a6cf	c3 03 11 	. . . ; Patched to ecch
la6d2h:
	jr nz,$+34		;a6d2	20 20
sub_a6d4h:
	call 01961h		;a6d4	cd 61 19 	. a . ; Patched to d9ch
	call 01982h		;a6d7	cd 82 19 	. . . ; Patched to d06h
	xor a			;a6da	af 	. 
	ld (07e00h),a		;a6db	32 00 7e 	2 . ~ 
	ld a,020h		;a6de	3e 20 	>   
	ld (0a6d2h),a		;a6e0	32 d2 a6 	2 . . 
	ld (0a6d3h),a		;a6e3	32 d3 a6 	2 . . 
	ret			;a6e6	c9 	. 

f_a6e7:
	ld a,(0a6d2h)		;a6e7	3a d2 a6 	: . .   ; (0a6d2h)==0x20 SPACE ?
	cp 020h		;a6ea	fe 20 	.   
	jr nz,la6f2h		;a6ec	20 04 	  .             ; no -> l_a6f2
	ld a,02ah		;a6ee	3e 2a 	> *             ; yes , a:=2a
	jr $+4		;a6f0	18 02 	. .                 ; -> l_a6f4
la6f2h:
	ld a,020h		;a6f2	3e 20 	>               ; a:=0x20
la6f4h:
    ; copies a to 0a6d2, calls a function and reads a from 0a6d2
	ld (0a6d2h),a		;a6f4	32 d2 a6 	2 . .   ; (0a6d2h):=a
	call set_byte_4346		;a6f7	cd b2 ab 	. . .   ; a -> 0x4346 var
	ld a,(0a6d2h)		;a6fa	3a d2 a6 	: . .   ; read back 0a6d2h
	ret			;a6fd	c9 	. 

read_a6d2:
	ld a,(la6d2h)		;a6fe	3a d2 a6 	: . .   ; a:=(0a6d2h)
	ret			;a701	c9 	. 

	ld a,(0a6d3h)		;a702	3a d3 a6 	: . .   : a:= (0a6d3)
	cp 020h		;a705	fe 20 	.                   ; a==SPACE?
	jr nz,la70dh 	;a707	20 04 	  .             ; no, -> l_a70d
	ld a,02ah		;a709	3e 2a 	> *             ; yes, a:=0x2a, '*'
	jr la70fh		;a70b	18 02 	. .                 ; -> l_a70f
la70dh:
	ld a,020h		;a70d	3e 20 	>
la70fh:
;l_a70f:
	ld (0a6d3h),a		;a70f	32 d3 a6 	2 . . ^ ; a6d3h:=a
	call set_byte_4372		;a712	cd b6 ab 	. . .
	ld a,(0a6d3h)		;a715	3a d3 a6 	: . .   ; a:=a6d3h
	ret			;a718	c9 	. 

	ld a,(0a6d3h)		;a719	3a d3 a6 	: . . 
	ret			;a71c	c9 	. 

sub_a71dh:
	call sub_a852h		;a71d	cd 52 a8 	. R .
	ret z			;a720	c8 	. 

	ld l,a			;a721	6f 	o 
	or l			;a722	b5 	.
	ret m			;a723	f8 	. 

	ld a,(la6d2h)		;a724	3a d2 a6 	: . .   ; a:=(0a6d2h)
	cp 02ah		;a727	fe 2a 	. *                 ; a==2a '*' ?
	jr nz,la737h		;a729	20 0c 	  .             ; no -> l_a736
	ld a,l			;a72b	7d 	}                   ; a:=l
	cp 061h		;a72c	fe 61 	. a                 ; a < 0x61 'a' ?
	jr c,la737h		;a72e	38 07 	8 .             ;  -> l_a736
	cp 07bh		;a730	fe 7b 	. {                 ; a > 7b?
	jr nc,la737h		;a732	30 03 	0 .             ; yes, -> l_a736
	sub 020h		;a734	d6 20 	.               ; a:=a-0x20
;l_a736:
	ld l,a			;a736	6f 	o                   ; l:=a
la737h:
	or a			;a737	b7 	.
	ret m			;a738	f8 	.                   ; ret if a  < 0 -> then a is control char SPACE

	ld a,(0a6d3h)		;a739	3a d3 a6 	: . .   ; a:=(0a6d3h)
	ld h,a			;a73c	67 	g                   ; h:=a
	cp 020h		;a73d	fe 20 	.                   ; a== 0x20 SPACE
	jr nz,la746h		;a73f	20 05 	  .             ; no -> l_a744
la741h:
	or 0ffh		;a741	f6 ff 	. .                 ; a:=ff,
	scf			;a743	37 	7                       ; set carry
;l_a744:
	ld a,l			;a744	7d 	}                   ; a:=l
	ret			;a745	c9 	. 

    ; hexchar read in function; called when entering a hex number in VT session via "hex entry" soft key
    ; Interprets a character value in hl as BCD number input and converts it to BCD number in a
    ; e.g. hl=0x3132 (characters '1' and '2') result in a=0x12
la746h:
	ld a,l			;a746	7d 	}                   ; a:=l
	cp '0'		    ;a747	fe 30 	. 0             ; a<0x30 '0' ?
	jr c,la783h		;a749	38 38 	8 8             ; yes -> l_7a1
	cp ':'		    ;a74b	fe 3a 	. :             ; a<0x3a ? this selects 0..9
	jr c,la75fh		;a74d	38 10 	8 .             ; yes -> l_765
	cp 'A'		    ;a74f	fe 41 	. A             ; a<0x41 'A'
	jr c,la783h		;a751	38 30 	8 0             ; yes -> l_7a1
	cp 'G'		    ;a753	fe 47 	. G             ; a<0x47 'G' ? this selects 'a'..'f'
	jr c,la75fh		;a755	38 08 	8 .             ; yes -> l_765
	cp 'a'		    ;a757	fe 61 	. a             ; a<0x61 'a' ?
	jr c,la783h		;a759	38 28 	8 (             ; yes -> l_a79b
	cp 'g'		    ;a75b	fe 67 	. g             ; a>=0x67 'F' this selects 'A'..'F'
	jr nc,la783h		;a75d	30 24 	0 $             ; yes -> l_f795, BUT NO VALID OPCODE THERE
la75fh:
	ld a,h			;a75f	7c 	|                   ; a:=h
	cp '*'		    ;a760	fe 2a 	. *             ; a==0x2a '*' ? mybe special handling for * ?
	ld a,l			;a762	7d 	}                   ; a:=l
	jr z,la77dh		;a763	28 18 	( .             ; yes, -> l_a77d
l_a765:
	call sub_a785h		;a765	cd 85 a7 	. . .       ; get num value of number e.g. 0x31->0x1
	ld l,a			;a768	6f 	o                   ; l:=a, we save a in l
	ld a,h			;a769	7c 	|                   ; a:=h
	call sub_a785h		;a76a	cd 85 a7 	. . .       ; again, get num value, now for h
	add a,a			;a76d	87 	.                   ; shift a 4 times left (to upper nibble)
	add a,a			;a76e	87 	. 
	add a,a			;a76f	87 	. 
	add a,a			;a770	87 	. 
	add a,l			;a771	85 	.                   ; add l value to lower nibble; looks like we have created BCD code from h and l charcodes
	ld l,a			;a772	6f 	o
	ld a,02ah		;a773	3e 2a 	> *             ; (0a6d3h):= 0x2a *
	ld (0a6d3h),a		;a775	32 d3 a6 	2 . .   ;
	call set_byte_4372		;a778	cd b6 ab 	. . .
	jr $-58		;a77b	18 c4 	. .                 ; -> l_a723

la77dh:
l_a77d:
	ld (0a6d3h),a		;a77d	32 d3 a6 	2 . .
	call set_byte_4372		;a780	cd b6 ab 	. . .
la783h:
    xor a
    ret

sub_a785h:
	cp 03ah		;a785	fe 3a 	. :         ; a>0x3a ':' ?
	jr nc,$+5		;a787	30 03 	0 .     ; yes -> l_a78b
l_a789:
    ; a is a number
    ; returns int value from '1'-'9', 0x31 -> 0x1
	sub 030h		;a789	d6 30 	. 0
l_a78b:
	ret			;a78b	c9 	. 

la78ch:
	sub 057h		;a78c	d6 57 	. W 
	ret p			;a78e	f0 	. 

	add a,020h		;a78f	c6 20 	.   
	ret			;a791	c9 	.

    ; this below does not look like code, opcodes all ff, fb etc.
la792h:
	ret m			;a792	f8 	. 
	rst 38h			;a793	ff 	. 
	cp 0fdh		;a794	fe fd 	. .     ; a795 is function entry from above !?!
	call m,0fafbh		;a796	fc fb fa 	. . .
	ld sp,hl			;a799	f9 	. 
	rst 18h			;a79a	df 	.

l_a79b:
	dec c			;a79b	0d 	. 
	ex af,af'			;a79c	08 	. 
	rst 18h			;a79d	df 	. 
	dec c			;a79e	0d 	. 
	dec c			;a79f	0d 	. 
	dec c			;a7a0	0d 	.
l_a7a1:
	jr nz,$+50		;a7a1	20 30 	  0     ; --> a7f1, but there is data
	                                        ; also, in case "z", we run into data

;; character array follows, containing 0-9,a-z, A-Z,
	defb "123456789:;,-./`"
	defb "abcdefghijklmnopqrstuvwxyz"
	defb "[\\]^_"

la7d2h:
    defb 0f8h
    ;ret m			;a7d2	f8 	.
    ; next lines until defb do not look like code
    defb 0ffh, 0feh, 0fdh, 0fch, 0fbh, 0fah, 0f9h, 0f7h, 0f6h, 0f5h, 0f4h
    defb 00dh, 00dh, 00dh
	;rst 38h			;a7d3	ff 	.
	;cp 0fdh		;a7d4	fe fd 	. .
	;call m,0fafbh		;a7d6	fc fb fa 	. . .
	;ld sp,hl			;a7d9	f9 	.
	;rst 30h			;a7da	f7 	.
	;or 0f5h		;a7db	f6 f5 	. .
	;call p,00d0dh		;a7dd	f4 0d 0d 	. . .
	;dec c			;a7e0	0d 	.
	jr nz,$+97		;a7e1	20 5f 	  _ 

	defb "!\"#$%&'()*+<=>?"
	defb "@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	defb "{|}~"

	ld a,a			;a811	7f 	 
    ;; line above seems to be end of character array

    ; lines below still do not look like code, but data
la812h:
    defb 0f8h
	;ret m			;a812	f8 	.
    defb 0ffh, 0feh, 0fdh, 0fch, 0fbh, 0fah, 0f9h, 0f7h, 0f6h, 0f5h, 0f4h
	;rst 38h			;a813	ff 	.
	;cp 0fdh		;a814	fe fd 	. .
	;call m,0fafbh		;a816	fc fb fa 	. . .
	;ld sp,hl			;a819	f9 	.
	;rst 30h			;a81a	f7 	.
	;or 0f5h		;a81b	f6 f5 	. .
	defb 00dh, 00dh, 00dh
	;call p,00d0dh		;a81d	f4 0d 0d 	. . .
	;dec c			;a820	0d 	.

	;; 1,2,3,4,5..
	jr nz,$+129		;a821	20 7f 	  
	defb '1', '2', '3', '4', '5', '6', '7', '8', '9'
	;ld sp,03332h		;a823	31 32 33 	1 2 3
	;inc (hl)			;a826	34 	4
	;dec (hl)			;a827	35 	5
	;ld (hl),037h		;a828	36 37 	6 7
	;jr c,$+59		;a82a	38 39 	8 9

	;; some ascii codes?
	ld a,(de)			;a82c	1a 	. 
	dec de			;a82d	1b 	. 
	inc e			;a82e	1c 	. 
	dec e			;a82f	1d 	. 
	ld e,01fh		;a830	1e 1f 	. . 
	nop			;a832	00 	.
	;; 01..1f
	defb 001h, 002h, 003h, 004h, 005h, 006h, 007h, 008h, 009h, 00ah, 00bh, 00ch, 00dh, 00eh, 00fh, 010h
	defb 011h, 012h, 013h, 014h, 015h, 016h, 017h, 018h, 019h, 01ah, 01bh, 01ch, 01dh, 01eh, 01fh
	;ld bc,00302h		;a833	01 02 03 	. . .
	;inc b			;a836	04 	.
	;dec b			;a837	05 	.
	;ld b,017h		;a838	06 07 	. .
	;ex af,af'			;a83a	08 	.
	;add hl,bc			;a83b	09 	.
	;ld a,(bc)			;a83c	0a 	.
	;dec bc			;a83d	0b 	. 
	;inc c			;a83e	0c 	. 
	;dec c			;a83f	0d 	. 
	;ld c,01fh		;a840	0e 0f 	. . 
	;djnz $+19		;a842	10 11 	. .
	;ld (de),a			;a844	12 	.
	;inc de			;a845	13 	.
	;inc d			;a846	14 	.
	;dec d			;a847	15 	.
	;ld d,017h		;a848	16 17 	. .
	;jr $+27		;a84a	18 19 	. .
	;ld a,(de)			;a84c	1a 	.
	;dec de			;a84d	1b 	.
	;inc e			;a84e	1c 	.
	;dec e			;a84f	1d 	.
	;ld e,01fh		;a850	1e 1f 	. .

    ; compares finally against 0dfh
sub_a852h:
	ld a,(07e00h)		;a852	3a 00 7e 	: . ~   ; a:=(07e00h)
la855h:
	or a			;a855	b7 	.                   ;
	ret z			;a856	c8 	.                   ; is (07e00h) zero? yes, return
	ld bc,(07e01h)		;a857	ed 4b 01 7e 	. K . ~
	xor a			;a85b	af 	. 
	ld (07e00h),a		;a85c	32 00 7e 	2 . ~ 
	bit 3,b		;a85f	cb 58 	. X 
	jr nz,la86ch		;a861	20 09 	  .
	bit 2,b		;a863	cb 50 	. P 
la865h:
	jr nz,la871h		;a865	20 0a 	  .
	ld hl,la792h		;a867	21 92 a7 	! . .
	jr la874h		;a86a	18 08 	. .
la86ch:
	ld hl,la7d2h		;a86c	21 d2 a7 	! . .
	jr la874h		;a86f	18 03 	. .
la871h:
	ld hl,la812h		;a871	21 12 a8 	! . .
la874h:
	ld b,000h		;a874	06 00 	. . 
	add hl,bc			;a876	09 	. 
	ld a,(hl)			;a877	7e 	~ 
	cp 0dfh		;a878	fe df 	. . 
	ret			;a87a	c9 	. 

sub_a87bh:
    ;; next lines look like code, because it has a patch
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

    ;; looks like a loop that waits for (0dff0h)==0
waitforz_dff0_a897:
	ld a,(0dff0h)		;a897	3a f0 df 	: . . 
	cp 000h		;a89a	fe 00 	. . 
	jr nz,$-5		;a89c	20 f9 	  .             ; -> loop_a897
	ret			;a89e	c9 	. 

    ; this does write 2x zero to port 80
out80_a89f:
	ld a,0ffh		;a89f	3e ff 	> .             ; (01df8h):=ff
	ld (01df8h),a		;a8a1	32 f8 1d 	2 . .   ;
	call 01067h		;a8a4	cd 67 10 	. g .       ; Patched to e98h
	call 016e2h		;a8a7	cd e2 16 	. . .       ; Patched to e1ch
	ld hl,code_p_d400		;a8aa	21 00 d4 	! . . : (01dfah): := address of code part 0d400
	ld (01dfah),hl		;a8ad	22 fa 1d 	" . .   ;
	ld hl,07800h		;a8b0	21 00 78 	! . x   ; (01dfch) :=07800
	ld (01dfch),hl		;a8b3	22 fc 1d 	" . .   ;
	ld hl,00800h		;a8b6	21 00 08 	! . .   ; (01dfeh):= 00800
	ld (01dfeh),hl		;a8b9	22 fe 1d 	" . .   ;
	ld a,000h		;a8bc	3e 00 	> .             ; (01df9h):=0
	ld (01df9h),a		;a8be	32 f9 1d 	2 . .   ;
	ld a,000h		;a8c1	3e 00 	> .             ; (01df8h):=0
	ld (01df8h),a		;a8c3	32 f8 1d 	2 . .   ;
	out (080h),a		;a8c6	d3 80 	. .         ; out 80  (this outputs 0)
	call 016e2h		;a8c8	cd e2 16 	. . .       ; Patched to e1ch
	ld a,000h		;a8cb	3e 00 	> .             ; (0dff0h):=0
	ld (0dff0h),a		;a8cd	32 f0 df 	2 . .   ;
	ld hl,07800h		;a8d0	21 00 78 	! . x   ;  (01dfah):=07800
	ld (01dfah),hl		;a8d3	22 fa 1d 	" . .   ;
	ld a,004h		;a8d6	3e 04 	> .             ; (01df9h):=4
	ld (01df9h),a		;a8d8	32 f9 1d 	2 . .   ;
	ld a,000h		;a8db	3e 00 	> .             ; (01df8h):=0
	ld (01df8h),a		;a8dd	32 f8 1d 	2 . .   ;
	out (080h),a		;a8e0	d3 80 	. .         ; out 80 (this outputs 0)
	ret			;a8e2	c9 	. 

sub_a8e3h:
    ; waits for dff0==0 an then writes 5 to it
	call waitforz_dff0_a897		;a8e3	cd 97 a8 	. . .
	ld a,005h		;a8e6	3e 05 	> .             ; (0dff0h):=5
	ld (0dff0h),a		;a8e8	32 f0 df 	2 . . 
	ret			;a8eb	c9 	. 

set_3f12_to_2:
    ; (03f12h) := 2
	ld a,002h		;a8ec	3e 02 	> .
	ld (03f12h),a		;a8ee	32 12 3f 	2 . ? 
	ret			;a8f1	c9 	. 
la8f2h:
	call out80_a89f		;a8f2	cd 9f a8 	. . .
	ld a,008h		;a8f5	3e 08 	> . 
	ld (ldff0h),a		;a8f7	32 f0 df 	2 . .
	ld a,002h		;a8fa	3e 02 	> . 
	ld (03f12h),a		;a8fc	32 12 3f 	2 . ? 
	ret			;a8ff	c9 	. 

;sub_a900h:
read_3f12:
	ld a,(03f12h)		;a900	3a 12 3f 	: . ?
	or a			;a903	b7 	. 
	ret z			;a904	c8 	. 

	call out80_a89f		;a905	cd 9f a8 	. . .
	ld a,007h		;a908	3e 07 	> . 
	ld (ldff0h),a		;a90a	32 f0 df 	2 . .
	xor a			;a90d	af 	. 
	ld (03f12h),a		;a90e	32 12 3f 	2 . ? 
	ret			;a911	c9 	. 
sub_a912h:
	push af			;a912	f5 	. 
	call waitforz_dff0_a897		;a913	cd 97 a8 	. . .
	pop af			;a916	f1 	. 
	ld c,a			;a917	4f 	O 
	ld (ldff1h),a		;a918	32 f1 df 	2 . .
	ld a,003h		;a91b	3e 03 	> . 
	ld (ldff0h),a		;a91d	32 f0 df 	2 . .
	ld a,c			;a920	79 	y 
	ret			;a921	c9 	. 

sub_a922h:
	call waitforz_dff0_a897		;a922	cd 97 a8 	. . .
	ld a,004h		;a925	3e 04 	> . 
	ld (ldff0h),a		;a927	32 f0 df 	2 . .
	ret			;a92a	c9 	. 

sub_a92bh:
	ld b,0ffh		;a92b	06 ff 	. .
la92dh:
	djnz la92dh		;a92d	10 fe 	. .
	call out80_a89f		;a92f	cd 9f a8 	. . .
	ld a,006h		;a932	3e 06 	> . 
	ld (ldff0h),a		;a934	32 f0 df 	2 . .
	call waitforz_dff0_a897		;a937	cd 97 a8 	. . .
	ld a,003h		;a93a	3e 03 	> . 
	ld (03f12h),a		;a93c	32 12 3f 	2 . ? 
	ret			;a93f	c9 	. 

la940h:
	nop			;a940	00 	. 
	ld b,b			;a941	40 	@
la942h:
	nop			;a942	00 	.
la943h:
	nop			;a943	00 	.

la944h:
	; below does not look like code, a944 is a var
	ld bc,00026h		;a944	01 26 00 	. & . 
	add hl,hl			;a947	29 	) 
	add hl,hl			;a948	29 	) 
	add hl,hl			;a949	29 	) 
	add hl,hl			;a94a	29 	) 
	add hl,hl			;a94b	29 	) 
	add hl,hl			;a94c	29 	) 
	ld bc,04000h		;a94d	01 00 40 	. . @ 
	add hl,bc			;a950	09 	. 
	ex de,hl			;a951	eb 	. 
	ld bc,00040h		;a952	01 40 00 	. @ . 
	ldir		;a955	ed b0 	. . 
	ld hl,(la940h)		;a957	2a 40 a9 	* @ .
	call sub_a991h		;a95a	cd 91 a9 	. . .
	ret			;a95d	c9 	. 
sub_a95eh:
	ld hl,(la940h)		;a95e	2a 40 a9 	* @ .
	ld (hl),c			;a961	71 	q 
	inc l			;a962	2c 	, 
	ld (hl),b			;a963	70 	p 
	ret			;a964	c9 	. 
sub_a965h:
	ld (la943h),a		;a965	32 43 a9 	2 C .
	jr la96dh		;a968	18 03 	. .
sub_a96ah:
	ld (la942h),a		;a96a	32 42 a9 	2 B .
la96dh:
	ld hl,(la940h)		;a96d	2a 40 a9 	* @ .
	call sub_a99fh		;a970	cd 9f a9 	. . .
	ld hl,(la942h)		;a973	2a 42 a9 	* B .
	ld h,000h		;a976	26 00 	& . 
	add hl,hl			;a978	29 	) 
	add hl,hl			;a979	29 	) 
	add hl,hl			;a97a	29 	) 
	add hl,hl			;a97b	29 	) 
	add hl,hl			;a97c	29 	) 
	add hl,hl			;a97d	29 	) 
	ld de,04000h		;a97e	11 00 40 	. . @ 
	add hl,de			;a981	19 	. 
	ld de,(la943h)		;a982	ed 5b 43 a9 	. [ C .
	ld d,000h		;a986	16 00 	. . 
	add hl,de			;a988	19 	. 
	add hl,de			;a989	19 	. 
	ld (la940h),hl		;a98a	22 40 a9 	" @ .
	call sub_a991h		;a98d	cd 91 a9 	. . .
	ret			;a990	c9 	. 
sub_a991h:
	push af			;a991	f5 	. 
	ld a,(la944h)		;a992	3a 44 a9 	: D .
	or a			;a995	b7 	. 
	jr nz,la99ah		;a996	20 02 	  .
	pop af			;a998	f1 	. 
	ret			;a999	c9 	. 
la99ah:
	pop af			;a99a	f1 	. 
	inc l			;a99b	2c 	, 
	set 4,(hl)		;a99c	cb e6 	. . 
	ret			;a99e	c9 	. 
sub_a99fh:
	inc l			;a99f	2c 	, 
	res 4,(hl)		;a9a0	cb a6 	. . 
	dec l			;a9a2	2d 	- 
	ret			;a9a3	c9 	.
sub_a9a4h:
	ld a,001h		;a9a4	3e 01 	> . 
	ld (la944h),a		;a9a6	32 44 a9 	2 D .
	ld hl,(la940h)		;a9a9	2a 40 a9 	* @ .
	call sub_a991h		;a9ac	cd 91 a9 	. . .
	ret			;a9af	c9 	. 

sub_a9b0h:
	xor a			;a9b0	af 	. 
	ld (la944h),a		;a9b1	32 44 a9 	2 D .
	ld hl,(la940h)		;a9b4	2a 40 a9 	* @ .
	call sub_a99fh		;a9b7	cd 9f a9 	. . .
	ret			;a9ba	c9 	. 

var_word_a9bb:
    ; a9bb -> var_byte_var_word_a9bb
	;nop			;a9bb	00 	.
    ;ret po			;a9bc	e0 	.
    defw 0e000h

var_word_a9bd:
    ; a9bd -> var_word_a9bd
	;nop			;a9bd	00 	.
    ;ret pe			;a9be	e8 	.
    defw code_p_endfill

var_byte_a9bf:
    ; a9bf -> var_byte_a9bf
	;ex af,af'			;a9bf	08 	.
	defb 008h

var_byte_a9c0:
    ; a9c0 -> var_byte_a9c0
	;nop			;a9c0	00 	.
    defb 000h

var_byte_a9c1:
    ; a9c1 -> var_byte_a9c1
	;nop			;a9c1	00 	.
    defb 000h

var_word_a9c2:
    ; a9c2 -> var_word_a9c2
	;nop			;a9c2	00 	.
	;ret pe			;a9c3	e8 	.
    defw code_p_endfill

var_byte_a9c4:
    ; byte variable used at numerous places, initialized with 8
    ; a9c4 -> var_byte_a9c4
	;;ex af,af'			;a9c4	08 	.
    defb 008h

var_byte_a9c5:
    ; byte variable , initialized with 1
    ; a9c5 -> var_byte_a9c5
	; ld bc,0cd83h		;a9c5	01 83 cd 	. . .
    defb 001h

var_byte_a9c6:
    ; byte variable, initialized with 83
    ; a9c6 -> var_byte_a9c6
    defb 083h

fun_a9c7:
    ; fun_a9c7 is called 1x only, during __init
    call fun_add6           ;a9c7	cd d6 ad 	. .
	call clear_screen_memory	        ;a9ca	cd f7 ad 	. . .
    ;; a:=83h
	ld a,083h		        ;a9cd	3e 83 	> .
	; call will save content of a to var_byte_a9c6
	call set_var_byte_a9c6	;a9cf	cd d3 a9 	. . .
	ret			            ;a9d2	c9 	.

    ; 0a9d3h -> set_var_byte_a9c6
    ; it looks like these ar character-like values, like "83"
set_var_byte_a9c6:
    ; load a into var_byte_3
    ;; a9c6h := a
	ld (var_byte_a9c6),a		;a9d3	32 c6 a9 	2 . .
	ret			            ;a9d6	c9 	.

fun_a9d7:
    ; a:=1
	ld a,001h		;a9d7	3e 01 	> .
	ld (var_byte_a9c5),a		;a9d9	32 c5 a9 	2 . .
	call sub_aa9ah		;a9dc	cd 9a aa 	. . .
	ret			;a9df	c9 	.

sub_a9e0h:
	cp 0f7h		;a9e0	fe f7 	. .
	jr nz,la9e9h		;a9e2	20 05 	  .
	call sub_ad19h		;a9e4	cd 19 ad 	. . .
	jr laa1dh		;a9e7	18 34 	. 4
la9e9h:
	cp 0f6h		;a9e9	fe f6 	. .
	jr nz,la9f2h		;a9eb	20 05 	  .
	call sub_ad53h		;a9ed	cd 53 ad 	. S .
	jr laa1dh		;a9f0	18 2b 	. +
la9f2h:
	cp 0f5h		;a9f2	fe f5 	. .
	jr nz,la9fbh		;a9f4	20 05 	  .
	call sub_ad5dh		;a9f6	cd 5d ad 	. ] .
	jr laa1dh		;a9f9	18 22 	. "
la9fbh:
	cp 0f4h		;a9fb	fe f4 	. .
	jr nz,laa04h		;a9fd	20 05 	  .
	call sub_ad70h		;a9ff	cd 70 ad 	. p .
	jr laa1dh		;aa02	18 19 	. .
laa04h:
	cp 0fdh		;aa04	fe fd 	. .
	jr nz,laa0dh		;aa06	20 05 	  .
	call sub_ae3ch		;aa08	cd 3c ae 	. < .
	jr laa1dh		;aa0b	18 10 	. .
laa0dh:
	cp 0fch		;aa0d	fe fc 	. .
	jr nz,laa16h		;aa0f	20 05 	  .
	call sub_ae18h		;aa11	cd 18 ae 	. . .
	jr laa1dh		;aa14	18 07 	. .
laa16h:
	cp 0feh		;aa16	fe fe 	. .
	jr nz,laa20h		;aa18	20 06 	  .
	call clear_screen_memory		;aa1a	cd f7 ad 	. . .
laa1dh:
	call sub_aa9ah		;aa1d	cd 9a aa 	. . .
laa20h:
	ret			;aa20	c9 	.
sub_aa21h:
	ld a,(0af9dh)		;aa21	3a 9d af 	: . .
	or a			;aa24	b7 	.
	jp nz,lafech		;aa25	c2 ec af 	. . .
	ld a,c			;aa28	79 	y
	cp 01bh		;aa29	fe 1b 	. .
	jp z,lafech		;aa2b	ca ec af 	. . .
	cp 008h		;aa2e	fe 08 	. .
	jr nz,laa3dh		;aa30	20 0b 	  .
	ld a,(var_byte_a9c0)		;aa32	3a c0 a9 	: . .
	or a			;aa35	b7 	.
	jr z,laa67h		;aa36	28 2f 	( /
	call sub_ad5dh		;aa38	cd 5d ad 	. ] .
	jr laa67h		;aa3b	18 2a 	. *
laa3dh:
	cp 007h		;aa3d	fe 07 	. .
	jr nz,laa4ch		;aa3f	20 0b 	  .
	ld a,(03f0ch)		;aa41	3a 0c 3f 	: . ?
	or a			;aa44	b7 	.
	jr z,laa67h		;aa45	28 20 	(
	;; the called routine does 2x an out
	call fun_acaf		;aa47	cd af ac 	. . .
	jr laa67h		;aa4a	18 1b 	. .
laa4ch:
	cp 00ah		;aa4c	fe 0a 	. .
	jr nz,laa55h		;aa4e	20 05 	  .
	call sub_ad97h		;aa50	cd 97 ad 	. . .
	jr laa67h		;aa53	18 12 	. .
laa55h:
	cp 00dh		;aa55	fe 0d 	. .
	jr nz,laa5eh		;aa57	20 05 	  .
	call sub_ad88h		;aa59	cd 88 ad 	. . .
	jr laa67h		;aa5c	18 09 	. .
laa5eh:
	cp 009h		;aa5e	fe 09 	. .
	jr nz,laa64h		;aa60	20 02 	  .
	ld c,020h		;aa62	0e 20 	.
laa64h:
	call sub_acfch		;aa64	cd fc ac 	. . .
laa67h:
	call sub_aa9ah		;aa67	cd 9a aa 	. . .
	ret			;aa6a	c9 	.
sub_aa6bh:
	ld a,e			;aa6b	7b 	{
	dec a			;aa6c	3d 	=
	cp 080h		;aa6d	fe 80 	. .
	jr c,laa73h		;aa6f	38 02 	8 .
	ld a,000h		;aa71	3e 00 	> .
laa73h:
	ld (var_byte_a9c0),a		;aa73	32 c0 a9 	2 . .
	ld a,l			;aa76	7d 	}
	dec a			;aa77	3d 	=
	cp 018h		;aa78	fe 18 	. .
	jr c,laa7eh		;aa7a	38 02 	8 .
	ld a,000h		;aa7c	3e 00 	> .
laa7eh:
	add a,008h		;aa7e	c6 08 	. .
	ld (var_byte_a9bf),a		;aa80	32 bf a9 	2 . .
	call sub_aa9ah		;aa83	cd 9a aa 	. . .
	ret			;aa86	c9 	.

sub_aa87h:
	ld de,(var_byte_a9c0)		;aa87	ed 5b c0 a9 	. [ . .
	ld d,000h		;aa8b	16 00 	. .
	ld a,(var_byte_a9bf)		;aa8d	3a bf a9 	: . .
	sub 008h		;aa90	d6 08 	. .
	inc a			;aa92	3c 	<
	ld l,a			;aa93	6f 	o
	ld h,d			;aa94	62 	b
	ret			;aa95	c9 	.

var_byte_aa96:
    defb 000h
	;nop			;aa96	00 	.
var_byte_aa97:
    defb 000h
	;nop			;aa97	00 	.
var_byte_aa98:
    defb 000h
	;nop			;aa98	00 	.
var_byte_aa99:
    defb 000h
	;nop			;aa99	00 	.

sub_aa9ah:
	;; sub_aa9ah this is large function...
	; could be a read in function from keybaord see cps to 013 and such
	ld hl,(var_byte_a9bf)		;aa9a	2a bf a9 	* . .
	call sub_ace8h		;aa9d	cd e8 ac 	. . .
	ld a,(var_byte_a9c0)		;aaa0	3a c0 a9 	: . .
	ld l,a			;aaa3	6f 	o
	ld h,000h		;aaa4	26 00 	& .
	add hl,hl			;aaa6	29 	)
	add hl,de			;aaa7	19 	.
	ld (var_word_a9bd),hl		;aaa8	22 bd a9 	" . .
	ld l,000h		;aaab	2e 00 	. .
laaadh:
	cp 020h		;aaad	fe 20 	.
	jr c,$+7		;aaaf	38 05 	8 .
	sub 010h		;aab1	d6 10 	. .
	inc l			;aab3	2c 	,
	jr laaadh		;aab4	18 f7 	. .
laab6h:
	ld (var_byte_aa96),a		;aab6	32 96 aa 	2 . .
	ld a,l			;aab9	7d 	}
	rlca			;aaba	07 	.
	rlca			;aabb	07 	.
	rlca			;aabc	07 	.
	rlca			;aabd	07 	.
	ld (var_byte_aa99),a		;aabe	32 99 aa 	2 . .
	ld a,(var_byte_a9bf)		;aac1	3a bf a9 	: . .
	ld l,013h		;aac4	2e 13 	. .
	cp 015h		    ;aac6	fe 15 	. .
	jr nc,$+11		;aac8	30 09 	0 .
	ld l,008h		;aaca	2e 08 	. .
	cp 013h		    ;aacc	fe 13 	. .
	jr c,$+5		;aace	38 03 	8 .
	ld hl,(var_byte_a9c4)		;aad0	2a c4 a9 	* . .
laad3h:
	sub l			;aad3	95 	.
	ld (var_byte_aa97),a		;aad4	32 97 aa 	2 . .
	ld a,l			;aad7	7d 	}
	ld (var_byte_aa98),a		;aad8	32 98 aa 	2 . .
	ld a,(var_byte_a9c5)		;aadb	3a c5 a9 	: . .
	or a			;aade	b7 	.
	jr nz,$+17		;aadf	20 0f 	  .
	ld a,(var_byte_a9c4)		;aae1	3a c4 a9 	: . .
	cp l			;aae4	bd 	.
	jr nz,$+11		;aae5	20 09 	  .
	ld hl,(var_byte_aa99)		;aae7	2a 99 aa 	* . .
	ld a,(var_byte_a9c1)		;aaea	3a c1 a9 	: . .
	cp l			;aaed	bd 	.
	jr z,$+31		;aaee	28 1d 	( .
laaf0h:
	ld a,(var_byte_aa99)		;aaf0	3a 99 aa 	: . .
	ld (var_byte_a9c1),a		;aaf3	32 c1 a9 	2 . .
	ld a,(var_byte_aa98)		;aaf6	3a 98 aa 	: . .
	ld (var_byte_a9c4),a		;aaf9	32 c4 a9 	2 . .
	ld l,a			;aafc	6f 	o
	call sub_ace8h		;aafd	cd e8 ac 	. . .
	ld (var_word_a9c2),de		;ab00	ed 53 c2 a9 	. S . .
	call sub_abbah		;ab04	cd ba ab 	. . .
	call sub_abcdh		;ab07	cd cd ab 	. . .
	call sub_ab59h		;ab0a	cd 59 ab 	. Y .
lab0dh:
	xor a			;ab0d	af 	.
	ld (var_byte_a9c5),a		;ab0e	32 c5 a9 	2 . .
	ld a,(var_byte_aa97)		;ab11	3a 97 aa 	: . .
	call sub_a96ah		;ab14	cd 6a a9 	. j .
	ld a,(var_byte_aa96)		;ab17	3a 96 aa 	: . .
	call sub_a965h		;ab1a	cd 65 a9 	. e .
	ld a,(var_byte_a9bf)		;ab1d	3a bf a9 	: . .
	sub 007h		;ab20	d6 07 	. .
	ld ix,043d8h		;ab22	dd 21 d8 43 	. ! . C
	call sub_ab35h		;ab26	cd 35 ab 	. 5 .
	ld a,(var_byte_a9c0)		;ab29	3a c0 a9 	: . .
	inc a			;ab2c	3c 	<
	ld ix,043e8h		;ab2d	dd 21 e8 43 	. ! . C
	call sub_ab35h		;ab31	cd 35 ab 	. 5 .
	ret			;ab34	c9 	.

sub_ab35h:
	ld (ix-004h),030h		;ab35	dd 36 fc 30 	. 6 . 0
lab39h:
	sub 064h		;ab39	d6 64 	. d
	jr c,lab42h		;ab3b	38 05 	8 .
	inc (ix-004h)		;ab3d	dd 34 fc 	. 4 .
	jr lab39h		;ab40	18 f7 	. .
lab42h:
	add a,064h		;ab42	c6 64 	. d
	ld (ix-002h),030h		;ab44	dd 36 fe 30 	. 6 . 0
lab48h:
	sub 00ah		;ab48	d6 0a 	. .
	jr c,lab51h			;ab4a	38 05 	8 .
	inc (ix-002h)		;ab4c	dd 34 fe 	. 4 .
	jr $-7		;ab4f	18 f7 	. .
lab51h:
	add a,00ah		;ab51	c6 0a 	. .
	add a,030h		;ab53	c6 30 	. 0
	ld (ix+000h),a		;ab55	dd 77 00 	. w .
	ret			;ab58	c9 	.

sub_ab59h:
	ld a,(var_byte_a9c1)		;ab59	3a c1 a9 	: . .
	rrca			;ab5c	0f 	.
	rrca			;ab5d	0f 	.
	rrca			;ab5e	0f 	.
	res 0,a		;ab5f	cb 87 	. .
	ld e,a			;ab61	5f 	_
	ld d,000h		;ab62	16 00 	. .
	ld hl,0ab82h		;ab64	21 82 ab 	! . .
	add hl,de			;ab67	19 	.
	ld a,(var_byte_a9c4)		;ab68	3a c4 a9 	: . .
	cp 008h		;ab6b	fe 08 	. .
	jr z,$+6		;ab6d	28 04 	( .
	ld de,0000eh		;ab6f	11 0e 00 	. . .
	add hl,de			;ab72	19 	.
	ld e,(hl)			;ab73	5e 	^
	inc hl			;ab74	23 	#
	ld d,(hl)			;ab75	56 	V
	ld hl,043c2h		;ab76	21 c2 43 	! . C
	ld a,(de)			;ab79	1a 	.
	or a			;ab7a	b7 	.
	ret z			;ab7b	c8 	.

	ld (hl),a			;ab7c	77 	w
	inc de			;ab7d	13 	.
	inc hl			;ab7e	23 	#
	inc hl			;ab7f	23 	#
	jr $-7		;ab80	18 f7 	. .
	and c			;ab82	a1 	.
	xor e			;ab83	ab 	.
	and l			;ab84	a5 	.
	xor e			;ab85	ab 	.
	and b			;ab86	a0 	.
	xor e			;ab87	ab 	.
	and h			;ab88	a4 	.
	xor e			;ab89	ab 	.
	sbc a,a			;ab8a	9f 	.
	xor e			;ab8b	ab 	.
	and e			;ab8c	a3 	.
	xor e			;ab8d	ab 	.
	sbc a,(hl)			;ab8e	9e 	.
	xor e			;ab8f	ab 	.
	xor e			;ab90	ab 	.
	xor e			;ab91	ab 	.
	xor a			;ab92	af 	.
	xor e			;ab93	ab 	.
	xor d			;ab94	aa 	.
	xor e			;ab95	ab 	.
	xor (hl)			;ab96	ae 	.
	xor e			;ab97	ab 	.
	xor c			;ab98	a9 	.
	xor e			;ab99	ab 	.
	xor l			;ab9a	ad 	.
	xor e			;ab9b	ab 	.
	xor b			;ab9c	a8 	.
	xor e			;ab9d	ab 	.
	sbc a,d			;ab9e	9a 	.
	sbc a,d			;ab9f	9a 	.
	sbc a,d			;aba0	9a 	.
	or e			;aba1	b3 	.
	nop			;aba2	00 	.
	sbc a,d			;aba3	9a 	.
	sbc a,d			;aba4	9a 	.
	or d			;aba5	b2 	.
	or c			;aba6	b1 	.
	nop			;aba7	00 	.
	sbc a,d			;aba8	9a 	.
	sbc a,d			;aba9	9a 	.
	sbc a,d			;abaa	9a 	.
	cp h			;abab	bc 	.
	nop			;abac	00 	.
	sbc a,d			;abad	9a 	.
	sbc a,d			;abae	9a 	.
	cp b			;abaf	b8 	.
	or h			;abb0	b4 	.
	nop			;abb1	00 	.
set_byte_4346:
    ;  (04346h) := a
	ld (04346h),a		;abb2	32 46 43 	2 F C
	ret			;abb5	c9 	.

set_byte_4372:
	ld (04372h),a		;abb6	32 72 43 	2 r C
	ret			;abb9	c9 	.
sub_abbah:
	ld hl,0000dh		;abba	21 0d 00 	! . .
	dec l			;abbd	2d 	-
	push hl			;abbe	e5 	.
	call 0acd0h		;abbf	cd d0 ac 	. . .
	pop hl			;abc2	e1 	.
	push hl			;abc3	e5 	.
	call 0a945h		;abc4	cd 45 a9 	. E .
	pop hl			;abc7	e1 	.
	ld a,h			;abc8	7c 	|
	or l			;abc9	b5 	.
	jr nz,$-13		;abca	20 f1 	  .
	ret			;abcc	c9 	.

sub_abcdh:
	ld hl,0000dh		;abcd	21 0d 00 	! . .
	ld de,0abefh		;abd0	11 ef ab 	. . .
	call 0a945h		;abd3	cd 45 a9 	. E .
	ld hl,0000eh		;abd6	21 0e 00 	! . .
	ld de,0ac2fh		;abd9	11 2f ac 	. / .
	call 0a945h		;abdc	cd 45 a9 	. E .
	ld hl,0000fh		;abdf	21 0f 00 	! . .
	ld de,0ac6fh		;abe2	11 6f ac 	. o .
	call 0a945h		;abe5	cd 45 a9 	. E .
	call read_a6d2		;abe8	cd fe a6 	. . .
	call set_byte_4346		;abeb	cd b2 ab 	. . .
	ret			;abee	c9 	.

    ;; "Cap  "
    defb "C",0abh,"a",0abh, "p", 0abh, " ", 0abh, " ", 083h
	;ld b,e			;abef	43 	C
	;xor e			;abf0	ab 	.
	;ld h,c			;abf1	61 	a
	;xor e			;abf2	ab 	.
	;ld (hl),b			;abf3	70 	p
	;xor e			;abf4	ab 	.
	;jr nz,$-83		;abf5	20 ab 	  .
	;jr nz,$-123		;abf7	20 83 	  .

    ;; "Clr   "
	defb "C", 0abh, "l", 0abh, "r", 0abh, " ", 0abh, " ", 083h, " ", 0abh
	;ld b,e			;abf9	43 	C
	;xor e			;abfa	ab 	.
	;ld l,h			;abfb	6c 	l
	;xor e			;abfc	ab 	.
	;ld (hl),d			;abfd	72 	r
	;xor e			;abfe	ab 	.
	;jr nz,$-83		;abff	20 ab 	  .
	;jr nz,$-123		;ac01	20 83 	  .
	;jr nz,$-83		;ac03	20 ab 	  .

    ;; "Display   "
	defb "D", 0abh, "i", 0abh, "s", 0abh, "p", 0abh, "l",0abh, "a", 0abh, "y", 0abh, " ", 0abh, " ", 0abh, " ", 083h
	;ld b,h			;ac05	44 	D
	;xor e			;ac06	ab 	.
	;ld l,c			;ac07	69 	i
	;xor e			;ac08	ab 	.
	;ld (hl),e			;ac09	73 	s
	;xor e			;ac0a	ab 	.
	;ld (hl),b			;ac0b	70 	p
	;xor e			;ac0c	ab 	.
	;ld l,h			;ac0d	6c 	l
	;xor e			;ac0e	ab 	.
	;ld h,c			;ac0f	61 	a
	;xor e			;ac10	ab 	.
	;ld a,c			;ac11	79 	y
	;xor e			;ac12	ab 	.
	;jr nz,$-83		;ac13	20 ab 	  .
	;jr nz,$-83		;ac15	20 ab 	  .
	;jr nz,$-123		;ac17	20 83 	  .

    ;; Hex Break Lock
	ld c,b			;ac19	48 	H
	xor e			;ac1a	ab 	.
	ld h,l			;ac1b	65 	e
	xor e			;ac1c	ab 	.
	ld a,b			;ac1d	78 	x
	xor e			;ac1e	ab 	.
	jr nz,$-83		;ac1f	20 ab 	  .
	jr nz,$-83		;ac21	20 ab 	  .
	jr nz,$-123		;ac23	20 83 	  .
	ld b,d			;ac25	42 	B
	xor e			;ac26	ab 	.
	ld (hl),d			;ac27	72 	r
	xor e			;ac28	ab 	.
	ld h,l			;ac29	65 	e
	xor e			;ac2a	ab 	.
	ld h,c			;ac2b	61 	a
	xor e			;ac2c	ab 	.
	ld l,e			;ac2d	6b 	k
	xor e			;ac2e	ab 	.
	ld c,h			;ac2f	4c 	L
	xor e			;ac30	ab 	.
	ld l,a			;ac31	6f 	o
	xor e			;ac32	ab 	.
	ld h,e			;ac33	63 	c
	xor e			;ac34	ab 	.
	ld l,e			;ac35	6b 	k
	xor e			;ac36	ab 	.
	jr nz,$-123		;ac37	20 83 	  .

	;; Scrn Top Bottom
	ld d,e			;ac39	53 	S
	xor e			;ac3a	ab 	.
	ld h,e			;ac3b	63 	c
	xor e			;ac3c	ab 	.
	ld (hl),d			;ac3d	72 	r
	xor e			;ac3e	ab 	.
	ld l,(hl)			;ac3f	6e 	n
	xor e			;ac40	ab 	.
	jr nz,$-123		;ac41	20 83 	  .
	ld d,h			;ac43	54 	T
	xor e			;ac44	ab 	.
	ld l,a			;ac45	6f 	o
	xor e			;ac46	ab 	.
	ld (hl),b			;ac47	70 	p
	xor e			;ac48	ab 	.
	jr nz,$-123		;ac49	20 83 	  .
	ld b,d			;ac4b	42 	B
	xor e			;ac4c	ab 	.
	ld l,a			;ac4d	6f 	o
	xor e			;ac4e	ab 	.
	ld (hl),h			;ac4f	74 	t
	xor e			;ac50	ab 	.
	ld (hl),h			;ac51	74 	t
	xor e			;ac52	ab 	.
	ld l,a			;ac53	6f 	o
	xor e			;ac54	ab 	.
	ld l,l			;ac55	6d 	m
	xor e			;ac56	ab 	.
	jr nz,$-123		;ac57	20 83 	  .

	;; "Entr "
	ld b,l			;ac59	45 	E
	xor e			;ac5a	ab 	.
	ld l,(hl)			;ac5b	6e 	n
	xor e			;ac5c	ab 	.
	ld (hl),h			;ac5d	74 	t
	xor e			;ac5e	ab 	.
	ld (hl),d			;ac5f	72 	r
	xor e			;ac60	ab 	.
	ld a,c			;ac61	79 	y
	xor e			;ac62	ab 	.
	jr nz,$-123		;ac63	20 83 	  .
	jr nz,$-83		;ac65	20 ab 	  .
	jr nz,$-83		;ac67	20 ab 	  .
	jr nz,$-83		;ac69	20 ab 	  .
	jr nz,$-83		;ac6b	20 ab 	  .
	jr nz,$-83		;ac6d	20 ab 	  .
	sbc a,h			;ac6f	9c 	.
	add a,d			;ac70	82 	.
	sbc a,d			;ac71	9a 	.
	add a,d			;ac72	82 	.
	sbc a,d			;ac73	9a 	.
	add a,d			;ac74	82 	.
	sbc a,d			;ac75	9a 	.
	add a,d			;ac76	82 	.
	sbc a,d			;ac77	9a 	.
	add a,d			;ac78	82 	.
	sub l			;ac79	95 	.
	add a,d			;ac7a	82 	.
	ld d,d			;ac7b	52 	R
	add a,e			;ac7c	83 	.
	ld l,a			;ac7d	6f 	o
	add a,e			;ac7e	83 	.
	ld (hl),a			;ac7f	77 	w
	add a,e			;ac80	83 	.
	ld a,(07883h)		;ac81	3a 83 78 	: . x
	add a,e			;ac84	83 	.
	ld a,b			;ac85	78 	x
	add a,e			;ac86	83 	.
	ld a,b			;ac87	78 	x
	add a,e			;ac88	83 	.
	jr nz,$-123		;ac89	20 83 	  .
	ld b,e			;ac8b	43 	C
	add a,e			;ac8c	83 	.
	ld l,a			;ac8d	6f 	o
	add a,e			;ac8e	83 	.
	ld l,h			;ac8f	6c 	l
	add a,e			;ac90	83 	.
	ld a,(07883h)		;ac91	3a 83 78 	: . x
	add a,e			;ac94	83 	.
	ld a,b			;ac95	78 	x
	add a,e			;ac96	83 	.
	ld a,b			;ac97	78 	x
	add a,e			;ac98	83 	.
	jr nz,$-123		;ac99	20 83 	  .
	jr nz,$-123		;ac9b	20 83 	  .
	jr nz,$-123		;ac9d	20 83 	  .
	jr nz,$-123		;ac9f	20 83 	  .
	jr nz,$-123		;aca1	20 83 	  .
	jr nz,$-123		;aca3	20 83 	  .
	jr nz,$-123		;aca5	20 83 	  .
	jr nz,$-123		;aca7	20 83 	  .
	jr nz,$-123		;aca9	20 83 	  .
	jr nz,$-123		;acab	20 83 	  .
	jr nz,$-123		;acad	20 83 	  .

	;; 2x di/ei and 2x time out to 090
	; vars:
	;  (0037)
	; ports:
	;  090

    ; this functions writes out the byte from (0037) to port 090.
    ; it writes it one time with bit 2 cleared, and one time with bit set.
    ; betweeen these 2 writes there is a delay countdown loop
    ; is this maybe the latch relay switching function for the pods?
fun_acaf:
	di			;acaf	f3 	.                       ;
	ld a,(00037h)		;acb0	3a 37 00 	: 7 .   ; a:=(0037)
	res 2,a		;acb3	cb 97 	. .                 ; bit 2 of a is CLEARED
	ld (00037h),a		;acb5	32 37 00 	2 7 .   ; (0037):=0
	out (090h),a		;acb8	d3 90 	. .         ; a -> 090
	ei			;acba	fb 	.                       ;
    ; next 6 lines count down from 2000 to 0; seems a delay
	ld hl,02000h		;acbb	21 00 20 	! .     ; hl:=2000
fun_acaf_loop:
	dec hl			;acbe	2b 	+                   ; hl--
	ld a,h			;acbf	7c 	|                   ;    a:=h
	or l			;acc0	b5 	.                   ;    a := a|l
	jr nz,$-3		;acc1	20 fb 	  .             ;    ^ these test for hl==0, back to fun_acaf_loop
    ; countdown is finished, go on
    ; code below close to fun_acaf, but sets bit 2
	di			;acc3	f3 	.                       ;
	ld a,(00037h)		;acc4	3a 37 00 	: 7 .   ; a:=(0037)
	set 2,a		;acc7	cb d7 	. .                 ; bit 2 of a is SET
	ld (00037h),a		;acc9	32 37 00 	2 7 .   ; (0037):=0
	out (090h),a		;accc	d3 90 	. .         ; a -> 090
	ei			;acce	fb 	.                       ;
	ret			;accf	c9 	.
; end of fun_acaf

	call 0acf8h		;acd0	cd f8 ac 	. . .
	ld a,(var_byte_a9c1)		;acd3	3a c1 a9 	: . .
	ld e,a			;acd6	5f 	_
	ld d,000h		;acd7	16 00 	. .
	add hl,de			;acd9	19 	.
	add hl,de			;acda	19 	.
	ld de,(var_word_a9c2)		;acdb	ed 5b c2 a9 	. [ . .
	add hl,de			;acdf	19 	.
	set 7,h		;ace0	cb fc 	. .
	set 6,h		;ace2	cb f4 	. .
	set 5,h		;ace4	cb ec 	. .
	ex de,hl			;ace6	eb 	.
	ret			;ace7	c9 	.

;; ace8 POI-13
;; call, acf8 = POI-14
;; adds var_word_a9bb to hl and sets bits 5,6,7 in h
sub_ace8h:
	call sub_acf8h		;ace8	cd f8 ac 	. . .
	ld de,(var_word_a9bb)		;aceb	ed 5b bb a9 	. [ . .     ; de:=var_word_a9bb
	add hl,de			;acef	19 	.                               ; hl += de
	set 7,h		;acf0	cb fc 	. .                                 ; set bits 7,6,5 in h
	set 6,h		;acf2	cb f4 	. .
	set 5,h		;acf4	cb ec 	. .
;; exchange dl with hl
	ex de,hl			;acf6	eb 	.                               ; put hl to de
	ret			;acf7	c9 	.                                       ; result is in de

;; acf8 POI-14
;; moves l to h and sets l to 0
;; like shift to right by 8
;; h:=l
sub_acf8h:
	ld h,l			;acf8	65 	e
	;; l:=0
	ld l,000h		;acf9	2e 00 	. .
	ret			;acfb	c9 	.

sub_acfch:
	ld a,(var_byte_a9c6)		;acfc	3a c6 a9 	: . .
	ld b,a			;acff	47 	G
	push bc			;ad00	c5 	.
	call sub_a95eh	;ad01	cd 5e a9 	. ^ .
	pop bc			;ad04	c1 	.
	ld hl,(var_word_a9bd)		;ad05	2a bd a9 	* . .
	ld (hl),c			;ad08	71 	q
	inc l			;ad09	2c 	,
	ld a,(var_byte_a9c6)		;ad0a	3a c6 a9 	: . .
	ld (hl),b			;ad0d	70 	p
	call sub_ad70h		;ad0e	cd 70 ad 	. p .
	ret nz			;ad11	c0 	.

	call sub_ad88h		;ad12	cd 88 ad 	. . .
	call sub_ad97h		;ad15	cd 97 ad 	. . .
	ret			;ad18	c9 	.

sub_ad19h:
	ld a,(var_byte_a9bf)		;ad19	3a bf a9 	: . .
	cp 008h		;ad1c	fe 08 	. .
	ret z			;ad1e	c8 	.

	dec a			;ad1f	3d 	=
	ld (var_byte_a9bf),a		;ad20	32 bf a9 	2 . .

sub_ad23h:
	ld hl,(var_word_a9bd)		;ad23	2a bd a9 	* . .
	ld de,0ff00h		;ad26	11 00 ff 	. . .
	add hl,de			;ad29	19 	.
	set 7,h		;ad2a	cb fc 	. .
	set 6,h		;ad2c	cb f4 	. .
	set 5,h		;ad2e	cb ec 	. .
	ld (var_word_a9bd),hl		;ad30	22 bd a9 	" . .
	or 0ffh		;ad33	f6 ff 	. .
	ret			;ad35	c9 	.

sub_ad36h:
	call sub_ad19h		;ad36	cd 19 ad 	. . .
	ret nz			;ad39	c0 	.

	call sub_ad23h		;ad3a	cd 23 ad 	. # .
	ld hl,(var_word_a9bb)		;ad3d	2a bb a9 	* . .
	add hl,de			;ad40	19 	.
	set 7,h		;ad41	cb fc 	. .
	set 6,h		;ad43	cb f4 	. .
	set 5,h		;ad45	cb ec 	. .
	ld (var_word_a9bb),hl		;ad47	22 bb a9 	" . .
	call sub_ae9ah		;ad4a	cd 9a ae 	. . .
	ld a,001h		;ad4d	3e 01 	> .
	ld (var_byte_a9c5),a		;ad4f	32 c5 a9 	2 . .
	ret			;ad52	c9 	.

sub_ad53h:
	ld a,(var_byte_a9bf)		;ad53	3a bf a9 	: . .
	cp 01fh		;ad56	fe 1f 	. .
	ret z			;ad58	c8 	.

	call sub_ad97h		;ad59	cd 97 ad 	. . .
	ret			;ad5c	c9 	.

sub_ad5dh:
	ld hl,(var_word_a9bd)		;ad5d	2a bd a9 	* . .
	ld a,(var_byte_a9c0)		;ad60	3a c0 a9 	: . .
	scf			;ad63	37 	7
	sbc a,000h		;ad64	de 00 	. .
	ret c			;ad66	d8 	.

	ld (var_byte_a9c0),a		;ad67	32 c0 a9 	2 . .
	dec l			;ad6a	2d 	-
	dec l			;ad6b	2d 	-
	ld (var_word_a9bd),hl		;ad6c	22 bd a9 	" . .
	ret			;ad6f	c9 	.

sub_ad70h:
	ld a,(var_byte_a9c0)		;ad70	3a c0 a9 	: . .
	inc a			;ad73	3c 	<
	cp 080h		;ad74	fe 80 	. .
	jr nc,lad86h		;ad76	30 0e 	0 .
	ld (var_byte_a9c0),a		;ad78	32 c0 a9 	2 . .
	ld hl,(var_word_a9bd)		;ad7b	2a bd a9 	* . .
	inc l			;ad7e	2c 	,
	inc l			;ad7f	2c 	,
	ld (var_word_a9bd),hl		;ad80	22 bd a9 	" . .
	or 0ffh		;ad83	f6 ff 	. .
	ret			;ad85	c9 	.
lad86h:
	xor a			;ad86	af 	.
	ret			;ad87	c9 	.

sub_ad88h:
	xor a			;ad88	af 	.
	ld (var_byte_a9c0),a		;ad89	32 c0 a9 	2 . .
	ld hl,(var_word_a9bd)		;ad8c	2a bd a9 	* . .
	ld a,l			;ad8f	7d 	}
	and 000h		;ad90	e6 00 	. .
	ld l,a			;ad92	6f 	o
	ld (var_word_a9bd),hl		;ad93	22 bd a9 	" . .
	ret			;ad96	c9 	.

sub_ad97h:
	ld hl,(var_word_a9bd)		;ad97	2a bd a9 	* . .
	ld de,00100h		;ad9a	11 00 01 	. . .
	add hl,de			;ad9d	19 	.
	set 7,h		;ad9e	cb fc 	. .
	set 6,h		;ada0	cb f4 	. .
	set 5,h		;ada2	cb ec 	. .
	ld (var_word_a9bd),hl		;ada4	22 bd a9 	" . .
	ld a,(var_byte_a9bf)		;ada7	3a bf a9 	: . .
	inc a			;adaa	3c 	<
	cp 020h		;adab	fe 20 	.
	jr nz,$+36		;adad	20 22 	  "

	; next lines do an ldir with size 0xfe=255. It is not clear from where to where it copies.
	ld hl,(var_word_a9bb)		;adaf	2a bb a9 	* . .   ; hl:=var_word_a9bb
	ld (hl),020h		;adb2	36 20 	6                   ; (hl):=020 SPACE
	inc l			;adb4	2c 	,                           ; l++
	ld (hl),083h		;adb5	36 83 	6 .                 ; (hl):=text attr
	ld e,l			;adb7	5d 	]                           ; de := hl
	ld d,h			;adb8	54 	T
	inc e			;adb9	1c 	.                           ; e++
	dec l			;adba	2d 	-                           ; l--
	ld bc,000feh		;adbb	01 fe 00 	. . .           ; bc := 0xfe,
	ldir		;adbe	ed b0 	. .

	ld a,001h		;adc0	3e 01 	> .
	ld (var_byte_a9c5),a		;adc2	32 c5 a9 	2 . .
	ex de,hl			;adc5	eb 	.
	set 7,h		;adc6	cb fc 	. .
	set 6,h		;adc8	cb f4 	. .
	set 5,h		;adca	cb ec 	. .
	ld (var_word_a9bb),hl		;adcc	22 bb a9 	" . .
	ld a,01fh		;adcf	3e 1f 	> .

ladd1h:
	ld (var_byte_a9bf),a		;add1	32 bf a9 	2 . .
	xor a			;add4	af 	.
	ret			;add5	c9 	.

fun_add6:
    ; this function is called only 1x during __init
    ; add6 -> fun_add6
	ld a,008h		;add6	3e 08 	> .                             ; a:=8
	ld (var_byte_a9bf),a		;add8	32 bf a9 	2 . .           ;
	ld (var_byte_a9c4),a		;addb	32 c4 a9 	2 . .           ;
	ld l,a			;adde	6f 	o                                   ;
	call 0ace8h		;addf	cd e8 ac 	. . .
	ld (var_word_a9bd),de		;ade2	ed 53 bd a9 	. S . .
	ld (var_word_a9c2),de		;ade6	ed 53 c2 a9 	. S . .
	xor a			;adea	af 	.
	ld (var_byte_a9c0),a		;adeb	32 c0 a9 	2 . .
	ld (var_byte_a9c1),a		;adee	32 c1 a9 	2 . .
	ld a,001h		;adf1	3e 01 	> .
	ld (var_byte_a9c5),a		;adf3	32 c5 a9 	2 . .
	ret			;adf6	c9 	.

;; loads 0x20 (SPACE) and then 0x83 (ASCII Normal attribute) to (h1)
;; between memory positions var_word_a9bd (lower start) .. var_word_a9bb (higher end)
;; this looks like a "clear screen" routine
clear_screen_memory:
    ; adf7 -> clear_screen_memory
    ; var_word_a9bd -> hl seems to be some start value for loop (but initially, it is e800)
	ld hl,(var_word_a9bd)		;adf7	2a bd a9 	* . .           ; hl:= ...
	; var_word_a9bb -> de seems to be some end value for loop (but initially, it is e000)
	ld de,(var_word_a9bb)		;adfa	ed 5b bb a9 	. [ . .     ; de:= ...
loop_clear_screen_memory:
	  ld (hl),020h		;adfe	36 20 	6                           ; (h1):=20h, a SPACE
	  ;ld (hl),07eh ; tilde
	  inc l			;ae00	2c 	,                                   ; l++
	  ld (hl),083h		;ae01	36 83 	6 .                         ; (h1):=83, normal text attribute
	  inc hl			;ae03	23 	#                               ; hl++
	  set 7,h		;ae04	cb fc 	. .                             ; set bits 7,6,5 of h
	  set 6,h		;ae06	cb f4 	. .                             ;
	  set 5,h		;ae08	cb ec 	. .                             ;
	  ld a,l			;ae0a	7d 	}                               ; a:=l
	  cp e			;ae0b	bb 	.                                   ; a== reg e ? (calc "a-e", set z flag according to result)
	  jr nz,$-14		;ae0c	20 f0 	  .                         ; if nz (a!=e), jump back to loop_clear_screen_memory
	 ld a,h			;ae0e	7c 	|                                   ; a:=h
	 cp d			;ae0f	ba 	.                                   ; a== reg d ?
	 jr nz,$-18		;ae10	20 ec 	  .                             ; if nz (a!=d), jump back to loop_clear_screen_memory
	ld a,001h		;ae12	3e 01 	> .                             ; a:=1
	ld (var_byte_a9c5),a		;ae14	32 c5 a9 	2 . .           ; var_byte_a9c5:=a
	ret			;ae17	c9 	.

sub_ae18h:
;; looks like initialization of variables, depending on other variables
	ld a,(var_byte_a9c4)		;ae18	3a c4 a9 	: . .   ; var_byte_a9c4==0x13 ?
	cp 013h		;ae1b	fe 13 	. .
	ret z			;ae1d	c8 	.                           ; yes, return
	ld a,013h		;ae1e	3e 13 	> .                     ; no
	ld (var_byte_a9c4),a		;ae20	32 c4 a9 	2 . .   ; var_byte_a9c4:= 0x13
	ld a,015h		;ae23	3e 15 	> .                     ; a:=0x15
	ld (var_byte_a9bf),a		;ae25	32 bf a9 	2 . .   ; var_byte_a9bf := 0x15
;; l:=a
	ld l,a			;ae28	6f 	o                           ; l:=a
;; call ace8 = POI-13
	call 0ace8h		;ae29	cd e8 ac 	. . .               ; this call adds some other var to a->hl returns in de , also sets bits 5,6,7
	ld (var_word_a9bd),de		;ae2c	ed 53 bd a9 	. S . . ; var_word_a9bd := de

	xor a			;ae30	af 	.                           ; a:=0
	ld (var_byte_a9c0),a		;ae31	32 c0 a9 	2 . .   ; var_byte_a9c0:=a
	ld (var_byte_a9c1),a		;ae34	32 c1 a9 	2 . .   ; var_byte_a9c1:=a
	inc a			;ae37	3c 	<                           ; a:=1
;; (a9c5):=a
	ld (var_byte_a9c5),a		;ae38	32 c5 a9 	2 . .   ; var_byte_a9c5:=a
	ret			;ae3b	c9 	.

sub_ae3ch:
;; 0x08 = Backspace
	ld a,(var_byte_a9c4)		;ae3c	3a c4 a9 	: . .   ; var_byte_a9c4==0x8 ?
	cp 008h		;ae3f	fe 08 	. .
	ret z			;ae41	c8 	.                           ; yes, return
	ld a,008h		;ae42	3e 08 	> .
	ld (var_byte_a9c4),a		;ae44	32 c4 a9 	2 . .   ; no , var_byte_a9c4:=0
	ld (var_byte_a9bf),a		;ae47	32 bf a9 	2 . .   ; var_byte_a9bf:=a
	ld l,a			;ae4a	6f 	o                           ; l:=a
	call 0ace8h		;ae4b	cd e8 ac 	. . .
	ld (var_word_a9bd),de		;ae4e	ed 53 bd a9 	. S . . ; var_word_a9bd:=de
	xor a			;ae52	af 	.                           ; a:=0
	ld (var_byte_a9c0),a		;ae53	32 c0 a9 	2 . .   ; var_byte_a9c0:=a
	ld (var_byte_a9c1),a		;ae56	32 c1 a9 	2 . .   ; var_byte_a9c1:=a
	inc a			;ae59	3c 	<                           ; a:=1
	ld (var_byte_a9c5),a		;ae5a	32 c5 a9 	2 . .   ; var_byte_a9c5:=a
	ret			;ae5d	c9 	.

sub_ae5eh:
;; '0' handling 0x30
	cp 000h		;ae5e	fe 00 	. .                         ; a==0x0?
	jr z,$+6		;ae60	28 04 	( .                     ; jp l_ae69

	cp 030h		;ae62	fe 30 	. 0                         ; a==0x30? (RS)
	jr nz,$+26		;ae64	20 18 	  .                     ; jp l_ae7e
	ld hl,(var_word_a9bd)		;ae66	2a bd a9 	* . .   ; hl:=var_word_a9bd
l_ae69:
	ld de,(var_word_a9bd)		;ae69	ed 5b bd a9 	. [ . . ; de:=var_word_a9bd
	ld bc,00100h		;ae6d	01 00 01 	. . .           ; bc:=0x100
	add hl,bc			;ae70	09 	.                       ; hl+=bc
	ld l,000h		;ae71	2e 00 	. .                     ; l:=0
	set 7,h		;ae73	cb fc 	. .                         ; set bits 5,6,7
	set 6,h		;ae75	cb f4 	. .
	set 5,h		;ae77	cb ec 	. .
	ex de,hl			;ae79	eb 	.                       ; dl:=hl
	call loop_clear_screen_memory		;ae7a	cd fe ad 	. . .               ;
	ret			;ae7d	c9 	.

;; '1' handling
l_ae7e:
	cp 031h		;ae7e	fe 31 	. 1                         ; a==0x31?
	jr nz,lae97h		;ae80	20 15 	  .                     ; lae97h
	ld hl,(var_word_a9bd)		;ae82	2a bd a9 	* . .   ; hl:=var_word_a9bd
	inc hl			;ae85	23 	#                           ; hl+=2
	inc hl			;ae86	23 	#
	set 7,h		;ae87	cb fc 	. .                         ; set bits 5,6,7
	set 6,h		;ae89	cb f4 	. .
	set 5,h		;ae8b	cb ec 	. .
	ex de,hl			;ae8d	eb 	.                       ; de:=hl
	ld hl,(var_word_a9bd)		;ae8e	2a bd a9 	* . .   ; hl:=var_word_a9bd
	ld l,000h		;ae91	2e 00 	. .                     ; l:=0
	call loop_clear_screen_memory		;ae93	cd fe ad 	. . .
	ret			;ae96	c9 	.

;; '2' handling
lae97h:
	cp 032h		;ae97	fe 32 	. 2                         ; a==0x32?
	ret nz			;ae99	c0 	.                           ; no, return

sub_ae9ah:
	ld hl,(var_word_a9bd)		;ae9a	2a bd a9 	* . .       ; hl:=var_word_a9bd
	ld de,(var_word_a9bd)		;ae9d	ed 5b bd a9 	. [ . . ; de:=var_word_a9bd (now hl==de)
	ld bc,00100h		;aea1	01 00 01 	. . .           ; bc:=0x100
	add hl,bc			;aea4	09 	.                       ; hl += bc
	ld l,000h		;aea5	2e 00 	. .                     ; l:=0
	set 7,h		;aea7	cb fc 	. .                         ; set bits 5,6,7
	set 6,h		;aea9	cb f4 	. .
	set 5,h		;aeab	cb ec 	. .
	ex de,hl			;aead	eb 	.                       ; de:=hl
	ld l,000h		;aeae	2e 00 	. .                     ; l:=0
	call loop_clear_screen_memory		;aeb0	cd fe ad 	. . .
	ret			;aeb3	c9 	.

sub_aeb4h:
;; again, '0' handling???
	cp 000h		    ;aeb4	fe 00 	. .                     ; a==0?
	jr z,l_aebc		;aeb6	28 04 	( .                     ; call l_aebc
	cp 030h		    ;aeb8	fe 30 	. 0                     ; a=0x30?
	jr nz,$+6		;aeba	20 04 	  .                     ; jr l_aebf, so skip clear_screen_memory
l_aebc:
	call clear_screen_memory	;aebc	cd f7 ad 	. . .
l_aebf:
	ret			    ;aebf	c9 	.

;; again, '1' handling???
;; very clode to l_ae7e area
	cp 031h		;aec0	fe 31 	. 1                         ; a=0x31
	jr nz,laed7h		;aec2	20 13 	  .                     ; jr l_aed6
	ld hl,(var_word_a9bd)		;aec4	2a bd a9 	* . .   ; hl:=var_word_a9bd
	inc hl			;aec7	23 	#                           ; hl+=2
	inc hl			;aec8	23 	#                           ;
	set 7,h		;aec9	cb fc 	. .                         ; set bits 5,6,7
	set 6,h		;aecb	cb f4 	. .
	set 5,h		;aecd	cb ec 	. .
	ex de,hl			;aecf	eb 	.                       ; de:=hl
	ld hl,(var_word_a9bb)		;aed0	2a bb a9 	* . .   ; var_word_a9bb:=hl
	call loop_clear_screen_memory		;aed3	cd fe ad 	. . .
l_aed6:
	ret			;aed6	c9 	. 

laed7h:
;; again, '2' handling???	
	cp 032h		;aed7	fe 32 	. 2                         ; a==0x32?
	ret nz			;aed9	c0 	.                           ; np, return

	ld hl,(var_word_a9bd)		;aeda	2a bd a9 	* . .           ; hl:=var_word_a9bd
	ld de,(var_word_a9bd)		;aedd	ed 5b bd a9 	. [ . .     ; de:=var_word_a9bd now de=hl
	call loop_clear_screen_memory		;aee1	cd fe ad 	. . .
	ret			;aee4	c9 	. 

sub_aee5h:
	ld hl,ldc00h		;aee5	21 00 dc 	! . .           ; hl:=0xdc00
	ld (lde02h),hl		;aee8	22 02 de 	" . .           ; (de02h):=hl
	ld (lde00h),hl		;aeeb	22 00 de 	" . .           ; (de00h):=hl
	xor a			;aeee	af 	.                           ; a:=0
	ld (lde06h),a		;aeef	32 06 de 	2 . .           ; (de06h):=0
	ld (lde07h),a		;aef2	32 07 de 	2 . .           ; (de06h):=0
	ld l,a			;aef5	6f 	o                           ; l:=0
	ld h,a			;aef6	67 	g                           ; h:=0
	ld (lde04h),hl		;aef7	22 04 de 	" . .           ; (de04h):=hl, i.e. 0
	ret			;aefa	c9 	. 

	ld a,001h		;aefb	3e 01 	> . 
	ld (lde07h),a		;aefd	32 07 de 	2 . .
laf00h:
	ld a,(lde06h)		;af00	3a 06 de 	: . .
	or a			;af03	b7 	. 
	jr z,laf17h		;af04	28 11 	( .
	xor a			;af06	af 	. 
	ld (lde07h),a		;af07	32 07 de 	2 . .
	push bc			;af0a	c5 	. 
	ld b,020h		;af0b	06 20 	.   
laf0dh:
	djnz laf0dh		;af0d	10 fe 	. .
	pop bc			;af0f	c1 	. 
	ld a,001h		;af10	3e 01 	> . 
	ld (lde07h),a		;af12	32 07 de 	2 . .
	jr laf00h		;af15	18 e9 	. .
laf17h:
	ld de,(lde04h)		;af17	ed 5b 04 de 	. [ . .
	ld hl,00100h		;af1b	21 00 01 	! . . 
	or a			;af1e	b7 	. 
	sbc hl,de		;af1f	ed 52 	. R 
	jr z,laf46h		;af21	28 23 	( #
	inc de			;af23	13 	. 
	ld (lde04h),de		;af24	ed 53 04 de 	. S . .
	ex de,hl			;af28	eb 	. 
	ld hl,(lde00h)		;af29	2a 00 de 	* . .
	ld (hl),c			;af2c	71 	q 
	inc l			;af2d	2c 	, 
	ld (hl),b			;af2e	70 	p 
	inc hl			;af2f	23 	# 
	set 2,h		;af30	cb d4 	. . 
	res 1,h		;af32	cb 8c 	. . 
	ld (lde00h),hl		;af34	22 00 de 	" . .
	xor a			;af37	af 	. 
	ld (lde07h),a		;af38	32 07 de 	2 . .
	ld a,d			;af3b	7a 	z 
	or a			;af3c	b7 	. 
	ret nz			;af3d	c0 	. 

	ld a,e			;af3e	7b 	{ 
	cp 020h		;af3f	fe 20 	.   
	jr c,laf46h		;af41	38 03 	8 .
	or 0ffh		;af43	f6 ff 	. . 
	ret			;af45	c9 	. 
laf46h:
	xor a			;af46	af 	. 
	ld (lde07h),a		;af47	32 07 de 	2 . .
	ret			;af4a	c9 	. 

	ld a,001h		;af4b	3e 01 	> . 
	ld (lde07h),a		;af4d	32 07 de 	2 . .
laf50h:
	ld a,(lde06h)		;af50	3a 06 de 	: . .
	or a			;af53	b7 	. 
	jr z,laf67h		;af54	28 11 	( .
	xor a			;af56	af 	. 
	ld (lde07h),a		;af57	32 07 de 	2 . .
	push bc			;af5a	c5 	. 
	ld b,020h		;af5b	06 20 	.   
laf5dh:
	djnz laf5dh		;af5d	10 fe 	. .
	pop bc			;af5f	c1 	. 
	ld a,001h		;af60	3e 01 	> . 
	ld (lde07h),a		;af62	32 07 de 	2 . .
	jr laf50h		;af65	18 e9 	. .
laf67h:
	ld hl,(lde04h)		;af67	2a 04 de 	* . .
	xor a			;af6a	af 	. 
	ld (lde07h),a		;af6b	32 07 de 	2 . .
	ld a,h			;af6e	7c 	| 
	or l			;af6f	b5 	. 
	ret			;af70	c9 	. 
sub_af71h:
	ld a,001h		;af71	3e 01 	> . 
	ld (lde06h),a		;af73	32 06 de 	2 . .
laf76h:
	ld a,(lde07h)		;af76	3a 07 de 	: . .
	or a			;af79	b7 	. 
	jr nz,$-4		;af7a	20 fa 	  . 
	ld hl,(0de04h)		;af7c	2a 04 de 	* . . 
	ld a,h			;af7f	7c 	| 
	or l			;af80	b5 	. 
	jr z,laf97h		;af81	28 14 	( .
	dec hl			;af83	2b 	+ 
	ld (lde04h),hl		;af84	22 04 de 	" . .
	ld hl,(lde02h)		;af87	2a 02 de 	* . .
	ld c,(hl)			;af8a	4e 	N 
	inc l			;af8b	2c 	, 
	ld b,(hl)			;af8c	46 	F 
	inc hl			;af8d	23 	# 
	set 2,h		;af8e	cb d4 	. . 
	res 1,h		;af90	cb 8c 	. . 
	ld (lde02h),hl		;af92	22 02 de 	" . .
	or 0ffh		;af95	f6 ff 	. . 
laf97h:
	ld a,000h		;af97	3e 00 	> .
	ld (lde06h),a		;af99	32 06 de 	2 . .
	ret			;af9c	c9 	. 
laf9dh:
	nop			;af9d	00 	. 
laf9eh:
	nop			;af9e	00 	.
laf9fh:
	rst 38h			;af9f	ff 	.
	xor a			;afa0	af 	. 
lafa1h:
	nop			;afa1	00 	.
	nop			;afa2	00 	. 
lafa3h:
	nop			;afa3	00 	.
	nop			;afa4	00 	. 
lafa5h:
	nop			;afa5	00 	.
lafa6h:
	nop			;afa6	00 	.
lafa7h:
	nop			;afa7	00 	.
	nop			;afa8	00 	. 
	nop			;afa9	00 	. 
	nop			;afaa	00 	. 
	nop			;afab	00 	. 
	nop			;afac	00 	. 
	nop			;afad	00 	. 
	nop			;afae	00 	. 
lafafh:
	nop			;afaf	00 	.
	nop			;afb0	00 	. 
	nop			;afb1	00 	. 
	nop			;afb2	00 	. 
	nop			;afb3	00 	. 
	nop			;afb4	00 	. 
	nop			;afb5	00 	. 
	nop			;afb6	00 	. 
	nop			;afb7	00 	. 
	nop			;afb8	00 	. 
	nop			;afb9	00 	. 
	nop			;afba	00 	. 
	nop			;afbb	00 	. 
	nop			;afbc	00 	. 
	nop			;afbd	00 	. 
	nop			;afbe	00 	. 
	nop			;afbf	00 	. 
	nop			;afc0	00 	. 
	nop			;afc1	00 	. 
	nop			;afc2	00 	. 
	nop			;afc3	00 	. 
	nop			;afc4	00 	. 
	nop			;afc5	00 	. 
	nop			;afc6	00 	. 
	nop			;afc7	00 	. 
	nop			;afc8	00 	. 
	nop			;afc9	00 	. 
	nop			;afca	00 	. 
	nop			;afcb	00 	. 
	nop			;afcc	00 	. 
	nop			;afcd	00 	. 
	nop			;afce	00 	. 
	nop			;afcf	00 	. 
	nop			;afd0	00 	. 
	nop			;afd1	00 	. 
	nop			;afd2	00 	. 
	nop			;afd3	00 	. 
	nop			;afd4	00 	. 
	nop			;afd5	00 	. 
	nop			;afd6	00 	. 
	nop			;afd7	00 	. 
	nop			;afd8	00 	. 
	nop			;afd9	00 	. 
	nop			;afda	00 	. 
	nop			;afdb	00 	. 
	nop			;afdc	00 	. 
	nop			;afdd	00 	. 
	nop			;afde	00 	. 
	nop			;afdf	00 	. 
	nop			;afe0	00 	. 
	nop			;afe1	00 	. 
	nop			;afe2	00 	. 
	nop			;afe3	00 	. 
	nop			;afe4	00 	. 
	nop			;afe5	00 	. 
	nop			;afe6	00 	. 
lafe7h:
	add a,e			;afe7	83 	.
lafe8h:
	add a,e			;afe8	83 	.
lafe9h:
	ld bc,06401h		;afe9	01 01 64 	. . d
lafech:
	ld a,c			;afec	79 	y
	cp 01bh		;afed	fe 1b 	. . 
	jp z,lb07dh		;afef	ca 7d b0 	. } .
	ld a,(laf9dh)		;aff2	3a 9d af 	: . .
	or a			;aff5	b7 	. 
	ret z			;aff6	c8 	.
	inc a			;aff7	3c 	< 
	ld (laf9dh),a		;aff8	32 9d af 	2 . .
	ld hl,(laf9fh)		;affb	2a 9f af 	* . .
	jp (hl)			;affe	e9 	. 
lafffh:
	ld a,(lafe9h+2)		;afff	3a eb af 	: . .
	cp 064h		;b002	fe 64 	. d 
	jp nz,lb260h		;b004	c2 60 b2 	. ` .
	ld a,c			;b007	79 	y
	cp 05bh		;b008	fe 5b 	. [ 
	jp z,lb0aeh		;b00a	ca ae b0 	. . .
	ld a,(laf9eh)		;b00d	3a 9e af 	: . .
	or a			;b010	b7 	. 
	jr nz,lb038h		;b011	20 25 	  %
	push bc			;b013	c5 	. 
	call sub_b08dh		;b014	cd 8d b0 	. . .
	pop bc			;b017	c1 	. 
	ld a,c			;b018	79 	y
	cp 037h		;b019	fe 37 	. 7 
	jp z,lb139h		;b01b	ca 39 b1 	. 9 .
	cp 038h		;b01e	fe 38 	. 8 
	jp z,lb15bh		;b020	ca 5b b1 	. [ .
	cp 044h		;b023	fe 44 	. D 
	jp z,lb259h		;b025	ca 59 b2 	. Y .
	cp 045h		;b028	fe 45 	. E 
	jp z,lb256h		;b02a	ca 56 b2 	. V .
	cp 04dh		;b02d	fe 4d 	. M 
	jp z,lb229h		;b02f	ca 29 b2 	. ) .
	cp 063h		;b032	fe 63 	. c 
	jp z,lb14bh		;b034	ca 4b b1 	. K .
	ret			;b037	c9 	. 
lb038h:
	ld a,c			;b038	79 	y
	cp 03bh		;b039	fe 3b 	. ; 
	jp z,lb0d5h		;b03b	ca d5 b0 	. . .
	cp 030h		;b03e	fe 30 	. 0 
	jr c,lb047h		;b040	38 05 	8 .
	cp 03ah		;b042	fe 3a 	. : 
	jp c,lb0e7h		;b044	da e7 b0 	. . .
lb047h:
	cp 048h		;b047	fe 48 	. H 
	jp z,lb10eh		;b049	ca 0e b1 	. . .
	cp 066h		;b04c	fe 66 	. f 
	jp z,lb10eh		;b04e	ca 0e b1 	. . .
	cp 06dh		;b051	fe 6d 	. m 
	jp z,lb172h		;b053	ca 72 b1 	. r .
	cp 04bh		;b056	fe 4b 	. K 
	jp z,lb1ceh		;b058	ca ce b1 	. . .
	cp 04ah		;b05b	fe 4a 	. J 
	jp z,lb1c1h		;b05d	ca c1 b1 	. . .
	cp 041h		;b060	fe 41 	. A 
	jp z,lb1dbh		;b062	ca db b1 	. . .
	cp 042h		;b065	fe 42 	. B 
	jp z,lb205h		;b067	ca 05 b2 	. . .
	cp 043h		;b06a	fe 43 	. C 
	jp z,lb211h		;b06c	ca 11 b2 	. . .
	cp 044h		;b06f	fe 44 	. D 
	jp z,lb21dh		;b071	ca 1d b2 	. . .
	cp 07ah		;b074	fe 7a 	. z 
	jp z,lb230h		;b076	ca 30 b2 	. 0 .
	call sub_b08dh		;b079	cd 8d b0 	. . .
	ret			;b07c	c9 	. 
lb07dh:
	ld a,001h		;b07d	3e 01 	> . 
	ld (laf9dh),a		;b07f	32 9d af 	2 . .
	ld hl,lafffh		;b082	21 ff af 	! . .
	ld (laf9fh),hl		;b085	22 9f af 	" . .
	xor a			;b088	af 	. 
	ld (laf9eh),a		;b089	32 9e af 	2 . .
	ret			;b08c	c9 	. 
sub_b08dh:
	xor a			;b08d	af 	. 
	ld (laf9dh),a		;b08e	32 9d af 	2 . .
	ld (laf9eh),a		;b091	32 9e af 	2 . .
	ret			;b094	c9 	. 
sub_b095h:
	ld de,00000h		;b095	11 00 00 	. . . 
	ld b,000h		;b098	06 00 	. . 
lb09ah:
	ld a,(hl)			;b09a	7e 	~
	or a			;b09b	b7 	. 
	ret z			;b09c	c8 	. 

	sub 030h		;b09d	d6 30 	. 0 
	ld c,a			;b09f	4f 	O 
	push hl			;b0a0	e5 	. 
	ex de,hl			;b0a1	eb 	. 
	add hl,hl			;b0a2	29 	) 
	push hl			;b0a3	e5 	. 
	add hl,hl			;b0a4	29 	) 
	add hl,hl			;b0a5	29 	) 
	pop de			;b0a6	d1 	. 
	add hl,de			;b0a7	19 	. 
	add hl,bc			;b0a8	09 	. 
	ex de,hl			;b0a9	eb 	. 
	pop hl			;b0aa	e1 	. 
	inc hl			;b0ab	23 	# 
	jr lb09ah		;b0ac	18 ec 	. .
lb0aeh:
	ld a,(laf9dh)		;b0ae	3a 9d af 	: . .
	cp 002h		;b0b1	fe 02 	. . 
	jr nz,sub_b08dh		;b0b3	20 d8 	  .
	ld a,001h		;b0b5	3e 01 	> . 
	ld (laf9eh),a		;b0b7	32 9e af 	2 . .
	ld hl,lafa7h		;b0ba	21 a7 af 	! . .
	ld (lafa1h),hl		;b0bd	22 a1 af 	" . .
	ld (lafa3h),hl		;b0c0	22 a3 af 	" . .
	push hl			;b0c3	e5 	. 
	pop de			;b0c4	d1 	. 
	ld (hl),000h		;b0c5	36 00 	6 . 
	inc de			;b0c7	13 	. 
	ld bc,0003fh		;b0c8	01 3f 00 	. ? . 
	ldir		;b0cb	ed b0 	. . 
	xor a			;b0cd	af 	. 
	ld (lafa5h),a		;b0ce	32 a5 af 	2 . .
	ld (lafa6h),a		;b0d1	32 a6 af 	2 . .
	ret			;b0d4	c9 	. 
lb0d5h:
	ld hl,(lafa3h)		;b0d5	2a a3 af 	* . .
	ld de,00008h		;b0d8	11 08 00 	. . . 
	add hl,de			;b0db	19 	. 
	ld (lafa1h),hl		;b0dc	22 a1 af 	" . .
	ld (lafa3h),hl		;b0df	22 a3 af 	" . .
	xor a			;b0e2	af 	. 
	ld (lafa5h),a		;b0e3	32 a5 af 	2 . .
	ret			;b0e6	c9 	. 
lb0e7h:
	ld a,(lafa5h)		;b0e7	3a a5 af 	: . .
	or a			;b0ea	b7 	. 
	jr nz,lb0f9h		;b0eb	20 0c 	  .
	ld a,(lafa6h)		;b0ed	3a a6 af 	: . .
	inc a			;b0f0	3c 	< 
	cp 009h		;b0f1	fe 09 	. . 
	jp nc,sub_b08dh		;b0f3	d2 8d b0 	. . .
	ld (lafa6h),a		;b0f6	32 a6 af 	2 . .
lb0f9h:
	ld a,(lafa5h)		;b0f9	3a a5 af 	: . .
	inc a			;b0fc	3c 	< 
	cp 008h		;b0fd	fe 08 	. . 
	jp nc,sub_b08dh		;b0ff	d2 8d b0 	. . .
	ld (lafa5h),a		;b102	32 a5 af 	2 . .
	ld hl,(lafa1h)		;b105	2a a1 af 	* . .
	ld (hl),c			;b108	71 	q 
	inc hl			;b109	23 	# 
	ld (lafa1h),hl		;b10a	22 a1 af 	" . .
	ret			;b10d	c9 	. 
lb10eh:
	call sub_b08dh		;b10e	cd 8d b0 	. . .
	ld hl,00001h		;b111	21 01 00 	! . . 
	ld de,00001h		;b114	11 01 00 	. . . 
	ld a,(lafa6h)		;b117	3a a6 af 	: . .
	or a			;b11a	b7 	. 
	jr nz,lb11fh		;b11b	20 02 	  .
	jr lb135h		;b11d	18 16 	. .
lb11fh:
	ld hl,lafa7h		;b11f	21 a7 af 	! . .
	call sub_b095h		;b122	cd 95 b0 	. . .
	push de			;b125	d5 	. 
	ld de,00001h		;b126	11 01 00 	. . . 
	ld hl,lafafh		;b129	21 af af 	! . .
	ld a,(lafa6h)		;b12c	3a a6 af 	: . .
	cp 002h		;b12f	fe 02 	. . 
	call z,sub_b095h		;b131	cc 95 b0 	. . .
	pop hl			;b134	e1 	. 
lb135h:
	call sub_aa6bh		;b135	cd 6b aa 	. k .
	ret			;b138	c9 	. 
lb139h:
	call sub_aa87h		;b139	cd 87 aa 	. . .
	ld a,l			;b13c	7d 	} 
	ld (lafe9h),a		;b13d	32 e9 af 	2 . .
	ld a,e			;b140	7b 	{ 
	ld (lafe9h+1),a		;b141	32 ea af 	2 . .
	ld a,(lafe7h)		;b144	3a e7 af 	: . .
	ld (lafe8h),a		;b147	32 e8 af 	2 . .
	ret			;b14a	c9 	. 
lb14bh:
	ld a,001h		;b14b	3e 01 	> . 
	ld (lafe9h),a		;b14d	32 e9 af 	2 . .
	ld (lafe9h+1),a		;b150	32 ea af 	2 . .
	ld a,083h		;b153	3e 83 	> . 
	ld (lafe8h),a		;b155	32 e8 af 	2 . .
	ld (lafe7h),a		;b158	32 e7 af 	2 . .
lb15bh:
	ld a,(lafe8h)		;b15b	3a e8 af 	: . .
	ld (lafe7h),a		;b15e	32 e7 af 	2 . .
	call set_var_byte_a9c6		;b161	cd d3 a9 	. . .
	ld de,(lafe9h+1)		;b164	ed 5b ea af 	. [ . .
	ld hl,(lafe9h)		;b168	2a e9 af 	* . .
	call sub_aa6bh		;b16b	cd 6b aa 	. k .
	call sub_aa9ah		;b16e	cd 9a aa 	. . .
	ret			;b171	c9 	. 
lb172h:
	call sub_b08dh		;b172	cd 8d b0 	. . .
	ld a,(lafa6h)		;b175	3a a6 af 	: . .
	or a			;b178	b7 	. 
	jr nz,lb17fh		;b179	20 04 	  .
	ld c,083h		;b17b	0e 83 	. . 
	jr lb1a5h		;b17d	18 26 	. &
lb17fh:
	ld b,a			;b17f	47 	G 
	ld a,(lafe7h)		;b180	3a e7 af 	: . .
	ld c,a			;b183	4f 	O 
	ld de,00008h		;b184	11 08 00 	. . . 
	ld hl,lafa7h		;b187	21 a7 af 	! . .
lb18ah:
	ld a,(hl)			;b18a	7e 	~ 
	or a			;b18b	b7 	. 
	jr z,lb1adh		;b18c	28 1f 	( .
	cp 030h		;b18e	fe 30 	. 0 
	jr z,lb1adh		;b190	28 1b 	( .
	cp 032h		;b192	fe 32 	. 2 
	jr z,lb1b1h		;b194	28 1b 	( .
	cp 034h		;b196	fe 34 	. 4 
	jr z,lb1b5h		;b198	28 1b 	( .
	cp 035h		;b19a	fe 35 	. 5 
	jr z,lb1b9h		;b19c	28 1b 	( .
	cp 037h		;b19e	fe 37 	. 7 
	jr z,lb1bdh		;b1a0	28 1b 	( .
lb1a2h:
	add hl,de			;b1a2	19 	. 
	djnz lb18ah		;b1a3	10 e5 	. .
lb1a5h:
	ld a,c			;b1a5	79 	y 
	ld (lafe7h),a		;b1a6	32 e7 af 	2 . .
	call set_var_byte_a9c6		;b1a9	cd d3 a9 	. . .
	ret			;b1ac	c9 	. 
lb1adh:
	ld c,083h		;b1ad	0e 83 	. . 
	jr lb1a2h		;b1af	18 f1 	. .
lb1b1h:
	set 5,c		;b1b1	cb e9 	. . 
	jr lb1a2h		;b1b3	18 ed 	. .
lb1b5h:
	res 1,c		;b1b5	cb 89 	. . 
	jr lb1a2h		;b1b7	18 e9 	. .
lb1b9h:
	set 2,c		;b1b9	cb d1 	. . 
	jr lb1a2h		;b1bb	18 e5 	. .
lb1bdh:
	set 3,c		;b1bd	cb d9 	. . 
	jr lb1a2h		;b1bf	18 e1 	. .
lb1c1h:
	call sub_b08dh		;b1c1	cd 8d b0 	. . .
	ld a,(lafa7h)		;b1c4	3a a7 af 	: . .
	call sub_aeb4h		;b1c7	cd b4 ae 	. . .
	call sub_aa9ah		;b1ca	cd 9a aa 	. . .
	ret			;b1cd	c9 	. 
lb1ceh:
	call sub_b08dh		;b1ce	cd 8d b0 	. . .
	ld a,(lafa7h)		;b1d1	3a a7 af 	: . .
	call sub_ae5eh		;b1d4	cd 5e ae 	. ^ .
	call sub_aa9ah		;b1d7	cd 9a aa 	. . .
	ret			;b1da	c9 	. 
lb1dbh:
	call sub_b08dh		;b1db	cd 8d b0 	. . .
	call sub_b1e6h		;b1de	cd e6 b1 	. . .
	ld hl,sub_ad19h		;b1e1	21 19 ad 	! . .
	jr lb1f5h		;b1e4	18 0f 	. .
sub_b1e6h:
	ld de,00001h		;b1e6	11 01 00 	. . . 
	ld hl,lafa7h		;b1e9	21 a7 af 	! . .
	ld a,(lafa6h)		;b1ec	3a a6 af 	: . .
	or a			;b1ef	b7 	. 
	call nz,sub_b095h		;b1f0	c4 95 b0 	. . .
	ld b,e			;b1f3	43 	C 
	ret			;b1f4	c9 	. 
lb1f5h:
	push bc			;b1f5	c5 	. 
	push de			;b1f6	d5 	. 
	push hl			;b1f7	e5 	. 
	call sub_b204h		;b1f8	cd 04 b2 	. . .
	pop hl			;b1fb	e1 	. 
	pop de			;b1fc	d1 	. 
	pop bc			;b1fd	c1 	. 
	djnz lb1f5h		;b1fe	10 f5 	. .
	call sub_aa9ah		;b200	cd 9a aa 	. . .
	ret			;b203	c9 	. 
sub_b204h:
	jp (hl)			;b204	e9 	. 
lb205h:
	call sub_b08dh		;b205	cd 8d b0 	. . .
	call sub_b1e6h		;b208	cd e6 b1 	. . .
	ld hl,sub_ad53h		;b20b	21 53 ad 	! S .
	jr lb1f5h		;b20e	18 e5 	. .
	ret			;b210	c9 	. 
lb211h:
	call sub_b08dh		;b211	cd 8d b0 	. . .
	call sub_b1e6h		;b214	cd e6 b1 	. . .
	ld hl,sub_ad70h		;b217	21 70 ad 	! p .
	jr lb1f5h		;b21a	18 d9 	. .
	ret			;b21c	c9 	. 
lb21dh:
	call sub_b08dh		;b21d	cd 8d b0 	. . .
	call sub_b1e6h		;b220	cd e6 b1 	. . .
	ld hl,sub_ad5dh		;b223	21 5d ad 	! ] .
	jr lb1f5h		;b226	18 cd 	. .
	ret			;b228	c9 	. 
lb229h:
	call sub_ad36h		;b229	cd 36 ad 	. 6 .
	call sub_aa9ah		;b22c	cd 9a aa 	. . .
	ret			;b22f	c9 	. 
lb230h:
	call sub_b08dh		;b230	cd 8d b0 	. . .
	ld a,(lafa6h)		;b233	3a a6 af 	: . .
	cp 002h		;b236	fe 02 	. . 
	jr nz,lb24eh		;b238	20 14 	  .
	ld a,(lafa7h)		;b23a	3a a7 af 	: . .
	cp 033h		;b23d	fe 33 	. 3 
	jr nz,lb24eh		;b23f	20 0d 	  .
	ld a,(lafafh)		;b241	3a af af 	: . .
	cp 031h		;b244	fe 31 	. 1 
	jr z,lb24eh		;b246	28 06 	( .
	cp 034h		;b248	fe 34 	. 4 
	jr z,lb252h		;b24a	28 06 	( .
	jr lb24eh		;b24c	18 00 	. .
lb24eh:
	call sub_a9a4h		;b24e	cd a4 a9 	. . .
	ret			;b251	c9 	. 
lb252h:
	call sub_a9b0h		;b252	cd b0 a9 	. . .
	ret			;b255	c9 	. 
lb256h:
	call sub_ad88h		;b256	cd 88 ad 	. . .
lb259h:
	call sub_ad97h		;b259	cd 97 ad 	. . .
	call sub_aa9ah		;b25c	cd 9a aa 	. . .
	ret			;b25f	c9 	. 
lb260h:
	ld a,c			;b260	79 	y 
	call sub_b08dh		;b261	cd 8d b0 	. . .
	ret			;b264	c9 	. 

;	in original file, we have "nop"	until 0bfffh.


;------------------------------------------------------------------
; c000 area
;------------------------------------------------------------------
	org 0c000h
	seek 02000h

_splash_screen_data: ; see lib/splash.asm
	;rst 38h			;c000	ff 	.
    defb 0ffh

    defb 004h, 009h, 0abh
	defb "VT100  Emulator", 000h

	defb 005h, 00bh, 083h
	defb "Rev A.00.03", 000h

;; "Copyright 1989 Hewlett-Packard Company for the HP4952"
    defb 007h, 009h, 083h
	defb 0abh ; seems copyright (c) char, stange is official 0xa9
	defb " Copyright 1989", 000h

    defb 008h, 005h, 083h
	defb "Hewlett-Packard Company", 000h

    defb 00bh, 009h, 083h
	defb "for the HP 4952", 000h

	defb 00ch, 008h, 083h
	defb "Protocol Analyzer", 000h

    defb 000h
; end of _splash_screen_data

l_2a7b:
    defw 02a8bh             ; 2a8b: 2a8b-2a00=8b c000+8b = c08b, see below
l_2a7d:
    ; 12 x 0 bytes
    defs 00ch, 000h
	;adc a,e			;c07b	8b 	.
	;ld hl,(00000h)		;c07c	2a 00 00 	* . .
	;nop			;c07f	00 	.
	;nop			;c080	00 	.
	;nop			;c081	00 	.
	;nop			;c082	00 	.
	;nop			;c083	00 	.
	;nop			;c084	00 	.
	;nop			;c085	00 	.
	;nop			;c086	00 	.
	;nop			;c087	00 	.
	;nop			;c088	00 	.

	defw 02acbh                             ; 2acb -> c0cb
	;sra d		;c089	cb 2a 	. *

    ; 2a89
l_2a8b:
	; 64 SPACEs follow
	defs 040h,' '

	defw 02adbh                                 ; 2adb -> c0db
	;in a,(02ah)		;c0cb	db 2a 	. *
l_2acd:
    ; 12 x 0 bytes
    defs 00ch, 000h
	;nop			;c0d7	00 	.
	;nop			;c0d8	00 	.
	defw 02a7bh
	;ld a,e			;c0d9	7b 	{
	;ld hl,(02020h)		;c0da	2a 20 20 	*

    ; 2a8b in target, is c08b in c000 space
l_2adb:
	; 64 SPACEs follow
	defs 040h,' '

	; Item text for main menu for new application , see POI-212
	; c11b is in target space: c11b-c000+2a00; 11b+2a00=2b1b
;; "VT-100"
	;;ld d,(hl)			;c11b	56 	V 
	;;ld d,h			;c11c	54 	T 
	;;dec l			;c11d	2d 	- 
	;;jr nz,$+34		;c11e	20 20 	    
	;;ld sp,03030h		;c120	31 30 30 	1 0 0 
	defb "VT- "
	defb " 100"

f_2b23:
    ; important app entry function, called by __init
    ; fills 4 smaller areas with ldir, and 2 os_loadpage calls. No other calls.
    ; So it looks like memory and menu preparation for app execution
	ld hl,app_target_area		;c123	21 00 2a 	! . * 	; (0761d) := 2a00
	ld (0761dh),hl		;c126	22 1d 76 	" . v   ; Screen Paint Script Location, see lib/strap.asm

; POI200 VGL: strap.asm, line 217-219; seems to load _p_main_menu_page_one into 0761fh and 07624h
	ld hl,l_2a7b+app_target_area-_splash_screen_data		;c129	21 7b 2a 	! { *   ; (0761f) := 2a7b
	ld (0761fh),hl		;c12c	22 1f 76 	" . v
	ld (07624h),hl		;c12f	22 24 76 	" $ v   ; (07624) := 2a7b
	ld a,(_tmp_page)	;c132	3a 96 a4 	: . .
	call os_loadpage    ;c135	cd 60 0e 	. ` .   ; Patched to 02d02h, Page-in _tmp_page
	ld hl,08326h		;c138	21 26 83 	! & .   ; hl:=08326h
	ld e,(hl)			;c13b	5e 	^               ; de := word at 08326h
	inc hl			    ;c13c	23 	#               ;
	ld d,(hl)			;c13d	56 	V               ;
	inc hl			    ;c13e	23 	#               ; hl++
	push hl			    ;c13f	e5 	.               ; save hl
	ex de,hl			;c140	eb 	.               ; hl:=de
	; copy 0x40 bytes from hl to space at l_2a8b
	ld de,l_2a8b+app_target_area-_splash_screen_data		;c141	11 8b 2a 	. . *   ; de:=02a8bh
	ld bc,00040h		;c144	01 40 00 	. @ .   ; size=0x040
	ldir		        ;c147	ed b0 	. .         ; do copy
	pop hl			    ;c149	e1 	.               ; restore hl
	; copy 0xc bytes from hl to space at l_2a7d
	ld de,l_2a7d+app_target_area-_splash_screen_data		;c14a	11 7d 2a 	. } *   ; de:=02a7dh
	ld bc,0000ch		;c14d	01 0c 00 	. . .   ; bc:=0xc
	ldir		        ;c150	ed b0 	. .         ; do copy
	ld e,(hl)			;c152	5e 	^               ; de := (hl)
	inc hl			    ;c153	23 	#
	ld d,(hl)			;c154	56 	V 
	ex de,hl			;c155	eb 	.               ; hl<->de
	ld e,(hl)			;c156	5e 	^               ; de := (hl)
	inc hl			    ;c157	23 	#               ;
	ld d,(hl)			;c158	56 	V               ;
	inc hl			    ;c159	23 	#               ; hl++
	push hl			    ;c15a	e5 	.               ; save hl
	; copy 0x40 bytes from hl to space at l_2adb
	ex de,hl			;c15b	eb 	.               ; hl:=de
	ld de,l_2adb+app_target_area-_splash_screen_data		;c15c	11 db 2a 	. . *   ; de:=02adbh
	ld bc,00040h		;c15f	01 40 00 	. @ .   ; size=0x040
	ldir		        ;c162	ed b0 	. .         ; do copy
	pop hl			    ;c164	e1 	.               ; restore hl
	; copy 0xc bytes from hl to space at l_2acd
	ld de,l_2acd+app_target_area-_splash_screen_data		;c165	11 cd 2a 	. . *   ;
	ld bc,0000ch		;c168	01 0c 00 	. . .   ; bc:=0xc
	ldir		        ;c16b	ed b0 	. .                 ; do copy
	ld a,006h		    ;c16d	3e 06 	> .             ; Load Page 6 (Application RAM)
	call os_loadpage	;c16f	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in 6
	ld hl,02cfch		;c172	21 fc 2c 	! . , 
	ld (02ad5h),hl		;c175	22 d5 2a 	" . *

	; POI-212 copy main menu item text for new application from 2b1b, which is c11b in load space
	; these are two lines of 4 bytes: "VT- " and " 100"
	ld hl,02b1bh		;c178	21 1b 2b 	! . +   ; from 02b1bh
	ld de,02af1h		;c17b	11 f1 2a 	. . *   ; to 2af1 (f1..f4)
	ld bc,00004h		;c17e	01 04 00 	. . .   ; size=4
	ldir		        ;c181	ed b0 	. .
	ld hl,02b1fh		;c183	21 1f 2b 	! . +   ; from 02b1fh
	ld de,02b11h		;c186	11 11 2b 	. . +   ; to 2b11 (11..14)
	ld bc,00004h		;c189	01 04 00 	. . .   ; size=4
	ldir		        ;c18c	ed b0 	. .
	ret			        ;c18e	c9 	.

l_2b8f:
    ; important app entry function, caslled by __init
    ; saves current page, loads a page, calls 01cf8 and restores old page
	in a,(020h)		;c18f	db 20 	.       ; get current page
	push af			;c191	f5 	.           ; save it
	ld a,(_tmp_page)		;c192	3a 96 a4 	: . .   ; get _tmp_page
	call os_loadpage		;c195	cd 60 0e 	. ` .   ; Patched to 02d02h, Page-in _tmp_page; loads page?
	ld hl,app_target_area		;c198	21 00 2a 	! . *       ; hl:=02a00
	push hl			;c19b	e5 	.                       ; save hl
	call 01cf8h		;c19c	cd f8 1c 	. . . 
	pop hl			;c19f	e1 	.                       ; restore hl
	pop af			;c1a0	f1 	.                       ; restore value read in
	out (020h),a		;c1a1	d3 20 	.               ; write it back
	ret			;c1a3	c9 	. 

    ; next 3 lines look like variables
    defb 001h
    defw 02ba9h         ; 2ba9 : 2ba9-2a00=1a9 ; c000+1a9 = c1a9 = vt100_start_screen!
	;ld bc,02ba9h		;c1a4	01 a9 2b 	. . +

	defw 02cach         ; 2cac : 2cac-2a00=2ac; c000+2ac = c2ac = 1st byte after  end of vt100_start_screen!
	;xor h			;c1a7	ac 	.
	;inc l			;c1a8	2c 	,

vt100_start_screen:
	defb 0ffh
	;rst 38h			;c1a9	ff 	.

    defb 001h, 006h, 083h
	defb "Terminal Emulator Menu", 000h

	defb 003h, 001h, 0abh
	defb "Setup Menu", 000h

    defb 003h, 00dh, 083h
	defb "Set communication", 000h

	defb 004h, 004h, 083h
	defb "parameters for terminal.", 000h

	defb 005h, 001h, 0abh
	defb "Setup=Sim.", 000h

    defb 005h, 00dh, 083h
	;; fixme paramaters -> parameters
	defb "Copy paramaters from", 000h

	defb 006h, 004h, 083h
	defb "simulate setup to terminal.", 000h

	defb 007h, 001h, 0abh
	defb "Simulate", 000h

    defb 007h, 00dh, 083h
	defb "Run simulate menu &", 000h

    defb 008h, 004h, 083h
	defb "return, keeping leads up.", 000h

	defb 009h, 001h, 0abh
	defb "Execute", 000h

    defb 009h, 00dh, 083h
	defb "Enter terminal mode.", 000h

    defb 000h
	;nop			;c2ab	00 	.
; end of vt100_start_screen

; POI-210
    ; Some menu structure definition
    ; 1. ref to a menu definition of type string "!...!....!"
    ; 2. some words which are addresses to functions, being called when selting softkey for some item
    ;    here, we have 6 such words (two of them are not used and have value 0)
    ; 3. back reference at the end (before menu definition string) pointing to first byte of menu structure definition
    ;
    ; all address values are based (org) on app_target_area, but the assembled code is based on c000 org (_splash_screen_data).
    ; so, a calculation is required to get value to be inserted below from app_target_area and _splash_screen_data
l_c2ac:
    ; Menu item text definition
    ; 2cbc : 2cbc-2a00=2bc; c000+2bc = c2bc = l_start_menu_2bc !
	defw l_start_menu_2bc + app_target_area-_splash_screen_data
	;defw 02cbch         ;
	;cp h			;c2ac	bc 	.
	;inc l			;c2ad	2c 	,

    ; Menu item 1 (of 6)
    ; 32d4 : 32d4 -2a00 = 8d4; c000+8d4 = c8d4 = fm_setup !
    defw fm_setup + app_target_area-_splash_screen_data
    ;defw 032d4h
	;call nc,00032h		;c2ae	d4 32 00 	. 2 .
	;nop			;c2b1	00 	.

    ; Menu item 2 (of 6)
    ; no function defined, free slot
    defw 00000h

    ; Menu item 3 (of 6)
    ; 3462 : 3462 - 2a00 = a62; c000 + a62 = ca62 = fm_setup2sim !
    defw fm_setup2sim + app_target_area-_splash_screen_data
    ;defw 03462h
	;ld h,d			;c2b2	62 	b
	;inc (hl)			;c2b3	34 	4

    ; Menu item 4 (of 6)
	; 2d4d: 2d4d -2a00 = 34d: c34d = fm_simulate !
	defw fm_simulate + app_target_area-_splash_screen_data
	;defw 02d4dh
	;ld c,l			;c2b4	4d 	M
	;dec l			;c2b5	2d 	-

    ; Menu item 5 (of 6)
    ; no function defined, free slot
    defb 000h, 000h
	;nop			;c2b6	00 	.
	;nop			;c2b7	00 	.

    ; Menu item 6 (of 6)
    ; 2d31 : 2d31 - 2a00 = 331: c331 = fm_execute !
    defw fm_execute + app_target_area-_splash_screen_data
    ;defw 02d31h

    ; 2cac : 2cac -2a00 = 2ac: c2ac = l_c2ac ! "back reference"
    defw l_c2ac + app_target_area-_splash_screen_data
    ;defw 02cach
	;ld sp,0ac2dh		;c2b8	31 2d ac 	1 - .
	;inc l			;c2bb	2c 	,

l_start_menu_2bc:
	defb "Setup!   !Setup!!Simu-!    !Exe-"
	defb " Menu!   !=Sim.!! late!    !cute"

;; POI-14, changes 2x page to 006, and finally back to old page
f_2cfc:
	in a,(020h)		;c2fc	db 20 	.               ;get current page
	push af			;c2fe	f5 	.                   ; save it
	ld a,022h		;c2ff	3e 22 	> "             ; (07501h):=0x22 ' " '
 	ld (07501h),a		;c301	32 01 75 	2 . u   ;

	ld a,006h		;c304	3e 06 	> .             ; Load Page 6 (Application RAM)
	call os_loadpage		;c306	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in 6
	ld a,(_tmp_page)		;c309	3a 96 a4 	: . . ; a:=tmp_page
	call os_loadpage		;c30c	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in _tmp_page
	ld hl,02ba4h		;c30f	21 a4 2b 	! . +   ; hl:=2ba4
	push hl			;c312	e5 	.                   ; save hl
	call 0da20h		;c313	cd 20 da 	.   .
	pop hl			;c316	e1 	.                   ; restore hl
	ld a,006h		;c317	3e 06 	> .             ; Load Page 6 (Application RAM)
	call os_loadpage		;c319	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in 6
	call read_dbe0		;c31c	cd 33 a5 	. 3 .
	call read_3f12		;c31f	cd 00 a9 	. . .
	call write_dbe0		;c322	cd 3f a5 	. ? .
	ld a,021h		;c325	3e 21 	> !             ; (07501h):=0x21 '!'
	ld (07501h),a		;c327	32 01 75 	2 . u   ;
	pop af			;c32a	f1 	.                   ;  restore af, = old page
	out (020h),a		;c32b	d3 20 	.           ; 0x20h port := a
	ld hl,00000h		;c32d	21 00 00 	! . .   ; hl:=0x0
	ret			;c330	c9 	. 

    ; function called by menu selection
    ; c331 function; "Execute" from main menu
fm_execute:
	ld a,062h		;c331	3e 62 	> b             ; (07501h):=0x62
	ld (07501h),a		;c333	32 01 75 	2 . u   ;
	ld a,006h		;c336	3e 06 	> .             ; Load Page 6 (Application RAM)
	call os_loadpage		;c338	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in 6
	call 0a54bh		;c33b	cd 4b a5 	. K .       ; maybe code in U503 at loc a54b, (or U502 but 503 looks more realistic)
	ld a,022h		;c33e	3e 22 	> "             ; (07501h):=0x22
	ld (07501h),a		;c340	32 01 75 	2 . u   ;
	ld a,(_tmp_page)		;c343	3a 96 a4 	: . . ; a:=tmp_page
	call os_loadpage		;c346	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in _tmp_page
	ld hl,00001h		;c349	21 01 00 	! . .   ; hl:=1
	ret			;c34c	c9 	. 

    ; function called by menu selection
    ; c34d function, "Simulate" from main menu
fm_simulate:
	ld a,006h		;c34d	3e 06 	> .             ; Load Page 6 (Application RAM)
	call os_loadpage		;c34f	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in 6
	call f_a60e		;c352	cd 0e a6 	. . .       ; large set up function, calls out(0xa80)
	ld a,022h		;c355	3e 22 	> "             ;  (07501h):=0x22
	ld (07501h),a		;c357	32 01 75 	2 . u   ;
	ld a,(_tmp_page)		;c35a	3a 96 a4 	: . .  ; a:=tmp_page
	call os_loadpage		;c35d	cd 60 0e 	. ` .       ; Patched to 02d02h, Page-in _tmp_page
	ld hl,00001h		;c360	21 01 00 	! . . 
	ret			;c363	c9 	. 

term_setup_screen:
    defb 0ffh
	;rst 38h			;c364	ff 	.

	defb 001h,006h, 083h
	defb "Terminal Setup Menu", 000h

	defb 003h, 001h, 083h
	defb "Data Code", 000h	

	defb 004h, 001h, 083h
	defb "Parity", 000h

	defb 005h, 001h, 083h
	defb "Bits/sec", 000h

	defb 008h, 001h, 083h
	defb "Handshake", 000h
	
	defb 006h, 001h, 083h
	defb "Mode", 000h

	defb 00ah, 001h, 083h
	defb "Echo", 000h

	defb 00bh, 001h, 083h
	defb "Bell", 000h
; 
	defb 00ch, 001h, 083h
	defb "Display Functions", 000h	

	defb 00dh, 001h, 083h
	defb "Auto LF after CR", 000h

    defb 000h
	;nop			;c3ed	00 	.
; end of term_setup_screen

	inc bc			;c3ee	03 	. 
	inc b			;c3ef	04 	. 
	dec b			;c3f0	05 	. 
	ex af,af'			;c3f1	08 	. 
	ld b,00ah		;c3f2	06 0a 	. . 
	dec bc			;c3f4	0b 	. 
	inc c			;c3f5	0c 	. 
	dec c			;c3f6	0d 	. 
	dec bc			;c3f7	0b 	. 
	dec bc			;c3f8	0b 	. 
	dec bc			;c3f9	0b 	. 
	dec bc			;c3fa	0b 	. 
	dec bc			;c3fb	0b 	. 
	dec bc			;c3fc	0b 	. 
	dec bc			;c3fd	0b 	. 
	inc de			;c3fe	13 	. 
	inc de			;c3ff	13 	. 
	ld bc,00101h		;c400	01 01 01 	. . . 
	ld bc,00101h		;c403	01 01 01 	. . . 
	ld bc,00101h		;c406	01 01 01 	. . . 
	nop			;c409	00 	. 
	ccf			;c40a	3f 	? 
	ld (bc),a			;c40b	02 	. 
	ccf			;c40c	3f 	? 
	inc b			;c40d	04 	. 
	ccf			;c40e	3f 	? 
	ld b,03fh		;c40f	06 3f 	. ? 
	ex af,af'			;c411	08 	. 
	ccf			;c412	3f 	? 
	ld a,(bc)			;c413	0a 	. 
	ccf			;c414	3f 	? 
	inc c			;c415	0c 	. 
	ccf			;c416	3f 	? 
	ld c,03fh		;c417	0e 3f 	. ? 
	djnz $+65		;c419	10 3f 	. ? 
	call m,0fcd9h		;c41b	fc d9 fc 	. . . 
	exx			;c41e	d9 	. 
	call m,0fcd9h		;c41f	fc d9 fc 	. . . 
	exx			;c422	d9 	. 
	call m,0fcd9h		;c423	fc d9 fc 	. . . 
	exx			;c426	d9 	. 
	call m,0fcd9h		;c427	fc d9 fc 	. . . 
	exx			;c42a	d9 	. 
	call m,005d9h		;c42b	fc d9 05 	. . . 
	jp c,0da05h		;c42e	da 05 da 	. . . 
	dec b			;c431	05 	. 
	jp c,0da05h		;c432	da 05 da 	. . . 
	dec b			;c435	05 	. 
	jp c,0da05h		;c436	da 05 da 	. . . 
	dec b			;c439	05 	. 
	jp c,0da05h		;c43a	da 05 da 	. . . 
	dec b			;c43d	05 	. 
	jp c,02e6ch		;c43e	da 6c 2e 	. l .

	; 2e6c : 2e6c - 2a00 = 56c: c56c but no usable result
	ld l,h			;c441	6c 	l 
	ld l,06ch		;c442	2e 6c 	. l 
	ld l,06ch		;c444	2e 6c 	. l 
	ld l,06ch		;c446	2e 6c 	. l 
	ld l,06ch		;c448	2e 6c 	. l 
	ld l,06ch		;c44a	2e 6c 	. l 
	ld l,06ch		;c44c	2e 6c 	. l 
	ld l,06ch		;c44e	2e 6c 	. l 
	ld l,000h		;c450	2e 00 	. . 
	nop			;c452	00 	. 
	nop			;c453	00 	. 
	nop			;c454	00 	. 
	nop			;c455	00 	. 
	nop			;c456	00 	. 
	nop			;c457	00 	. 
	nop			;c458	00 	. 
	nop			;c459	00 	. 
	ld l,(hl)			;c45a	6e 	n 
	ld l,0deh		;c45b	2e de 	. . 
	ld l,088h		;c45d	2e 88 	. . 
	cpl			;c45f	2f 	/ 
	ld (hl),h			;c460	74 	t 
	ld sp,031e4h		;c461	31 e4 31 	1 . 1 
	ld c,h			;c464	4c 	L 
	ld (0326ch),a		;c465	32 6c 32 	2 l 2 
	ld l,h			;c468	6c 	l 
	ld (0326ch),a		;c469	32 6c 32 	2 l 2 
	nop			;c46c	00 	. 
	nop			;c46d	00 	. 
	ld a,(hl)			;c46e	7e 	~ 
	ld l,0beh		;c46f	2e be 	. .
	ld l,0ceh		;c471	2e ce 	. . 
	ld l,000h		;c473	2e 00 	. . 
	nop			;c475	00 	. 
	nop			;c476	00 	. 
	nop			;c477	00 	. 
	nop			;c478	00 	. 
	nop			;c479	00 	. 
	nop			;c47a	00 	. 
	nop			;c47b	00 	. 
	
	ld l,(hl)			;c47c	6e 	n 
	
	defb 02eh
	defb "ASCII!ASCII!    !!    !    !    "
	defb "  8  !  7  !    !!    !    !    "

    defw 0ff60h
	;ld h,b			;c4be	60 	`
	;rst 38h			;c4bf	ff 	.

    ; 2ec6-2a00=4c6 -> c4c6 -> l_c4c6
	defw 02ec6h
	;add a,02eh		;c4c0	c6 2e 	. .

	defw 00000h
	defw 00000h
	;nop			;c4c2	00 	.
	;nop			;c4c3	00 	.
	;nop			;c4c4	00 	.
	;nop			;c4c5	00 	.

l_c4c6:
	defb "ASCII 8", 000h

    ; 7f20-2a00=5520; !?! not valid with standard calculation
    defw 07f20h
	;jr nz,$+129		;c4ce	20 7f 	  

    ; 2ed6-2a00=4d6 -> c4d6 -> lc4d6
	defw 02ed6h
	;sub 02eh		;c4d0	d6 2e 	. .

    defw 00000h
    defw 00000h
	;nop			;c4d2	00 	.
	;nop			;c4d3	00 	.
	;nop			;c4d4	00 	.
	;nop			;c4d5	00 	.

l_c4d6:
	defb "ASCII 7", 000h	

    ; 2eee-2a00 = 4ee -> c4ee, points to parity menu text
    defw 02eeeh
    ; 2f2e-2a00 = 52e -> c52e, -> l_c52e, a zero word
    defw 02f2eh
	;xor 02eh		;c4de	ee 2e 	. .
	;ld l,02fh		;c4e0	2e 2f 	. /

    ; 2f3d-2a00 = 53d -> c53d
	defw 02f3dh
	;dec a			;c4e2	3d 	=
	;cpl			;c4e3	2f 	/ `

	defw 02f4ch
	;ld c,h			;c4e4	4c 	L
	;cpl			;c4e5	2f 	/

	defw 02f5bh
	;ld e,e			;c4e6	5b 	[
	;cpl			;c4e7	2f 	/

	defw 02f6ah
	;ld l,d			;c4e8	6a 	j
	;cpl			;c4e9	2f 	/

	defw 02f79h
	;ld a,c			;c4ea	79 	y 0001h),a
	;cpl			;c4eb	2f 	/

	defw 02edeh
	;sbc a,02eh		;c4ec	de 2e 	. .

l_c4ee:
	defb "None!Odd!Even!!Space!Mark!Ignore"
	defb "    !   !    !! (ASCII7) !      "

l_c52e:
    defw 00000h
	;nop			;c52e	00 	.
	;nop			;c52f	00 	.

    ; 2f36-2a00=636 -> c636 ... TODO
    defw 02f36h
	;ld (hl),02fh		;c530	36 2f 	6 /
    defw 00000h
    defw 00000h
	;nop			;c532	00 	.
	;nop			;c533	00 	.
	;nop			;c534	00 	.
	;nop			;c535	00 	.

	defb "None  ", 000h	

l_c53d:
    defw 00001h

    ; 2f45 -> 645 -> c645 -> TODO
    defw 02f45h
	;ld bc,04500h		;c53d	01 00 45 	. . E
	;cpl			;c540	2f 	/
    defw 00000h
    defw 00000h
	;nop			;c541	00 	.
	;nop			;c542	00 	.
	;nop			;c543	00 	.
	;nop			;c544	00 	.

	defb "Odd   ", 000h	
 
	inc bc			;c54c	03 	. 
	nop			;c54d	00 	. 
	ld d,h			;c54e	54 	T 
	cpl			;c54f	2f 	/ 
	nop			;c550	00 	. 
	nop			;c551	00 	. 
	nop			;c552	00 	. 
	nop			;c553	00 	. 
	
	defb "Even  ", 000h

	inc b			;c55b	04 	. 
	nop			;c55c	00 	. 
	ld h,e			;c55d	63 	c 
	cpl			;c55e	2f 	/ 
	nop			;c55f	00 	. 
	nop			;c560	00 	. 
	nop			;c561	00 	. 
	nop			;c562	00 	. 

	defb "Space ", 000h	

	inc c			;c56a	0c 	. 
	nop			;c56b	00 	. 
	ld (hl),d			;c56c	72 	r 
	cpl			;c56d	2f 	/ 
	nop			;c56e	00 	. 
	nop			;c56f	00 	. 
	nop			;c570	00 	. 
	nop			;c571	00 	. 

	defb "Mark  ", 000h	

	ld b,e			;c579	43 	C 
	nop			;c57a	00 	. 
	add a,c			;c57b	81 	. 
	cpl			;c57c	2f 	/ 
	nop			;c57d	00 	. 
	nop			;c57e	00 	. 
	nop			;c57f	00 	. 
	nop			;c580	00 	. 

	defb "Ignore", 000h

	sbc a,b			;c588	98 	. 
	cpl			;c589	2f 	/ 
	ret c			;c58a	d8 	. 

	cpl			;c58b	2f 	/ 
	and 02fh		;c58c	e6 2f 	. / 
	call p,0022fh		;c58e	f4 2f 02 	. / . 
	jr nc,$+18		;c591	30 10 	0 . 
	jr nc,$+32		;c593	30 1e 	0 . 
	jr nc,$+46		;c595	30 2c 	0 ,
    defb "0"

	defb "300 !1200!2400!!4800!9600!19200~"
	defb "    !    !    !!    !    !     "

    defb 07ch
	;jr nz,$+126		;c5d6	20 7c 	  |
	rst 38h			;c5d8	ff 	. 
	rla			;c5d9	17 	. 
	ret po			;c5da	e0 	. 

	cpl			;c5db	2f 	/ 
	nop			;c5dc	00 	. 
	nop			;c5dd	00 	. 
	nop			;c5de	00 	. 
	nop			;c5df	00 	. 

	defb "300  ", 000h

	rst 38h			;c5e6	ff 	. 
	dec b			;c5e7	05 	. 
	xor 02fh		;c5e8	ee 2f 	. / 
	nop			;c5ea	00 	. 
	nop			;c5eb	00 	. 
	nop			;c5ec	00 	. 
	nop			;c5ed	00 	. 
	
	defb "1200 ", 000h
	
	rst 38h			;c5f4	ff 	. 
	ld (bc),a			;c5f5	02 	. 
	call m,0002fh		;c5f6	fc 2f 00 	. / . 
	nop			;c5f9	00 	. 
	nop			;c5fa	00 	. 
	nop			;c5fb	00 	. 
	
	defb "2400 ", 000h
  
	ld a,a			;c602	7f 	 
	ld bc,0300ah		;c603	01 0a 30 	. . 0 
	nop			;c606	00 	. 
	nop			;c607	00 	. 
	nop			;c608	00 	. 
	nop			;c609	00 	. 
	
	defb "4800 ", 000h

	cp a			;c610	bf 	. 
	nop			;c611	00 	. 
	jr $+50		;c612	18 30 	. 0 
	nop			;c614	00 	. 
	nop			;c615	00 	. 
	nop			;c616	00 	. 
	nop			;c617	00 	. 
	
	defb "9600 ", 000h

	ld e,a			;c61e	5f 	_ 
	nop			;c61f	00 	. 
	ld h,030h		;c620	26 30 	& 0 
	nop			;c622	00 	. 
	nop			;c623	00 	. 
	nop			;c624	00 	. 
	nop			;c625	00 	. 

	defb "19200", 000h

	inc a			;c62c	3c 	< 
	jr nc,$+126		;c62d	30 7c 	0 | 
	jr nc,$-102		;c62f	30 98 	0 . 
	jr nc,$-88		;c631	30 a6 	0 . 
	jr nc,$-74		;c633	30 b4 	0 . 
	jr nc,$-60		;c635	30 c2 	0 . 
	jr nc,$-46		;c637	30 d0 	0 . 
	jr nc,$-32		;c639	30 de 	0 .
    defb "0"

    defb "38400!200!600!!!1800!!3200!3600~"
	defb "     !   !   !!!    !!    !    "
   
	ld a,h			;c67b	7c 	| 
	cpl			;c67c	2f 	/ 
	nop			;c67d	00 	. 
	add a,h			;c67e	84 	. 
	jr nc,$+2		;c67f	30 00 	0 . 
	nop			;c681	00 	. 
	nop			;c682	00 	. 
	nop			;c683	00 	. 
	
	defb "38400", 000h

	ld (hl),e			;c68a	73 	s 
	ld b,c			;c68b	41 	A 
	sub d			;c68c	92 	. 
	jr nc,$+2		;c68d	30 00 	0 . 
	nop			;c68f	00 	. 
	nop			;c690	00 	. 
	nop			;c691	00 	. 
	
	defb "110  ", 000h

	rst 38h			;c698	ff 	. 
	inc hl			;c699	23 	# 
	and b			;c69a	a0 	. 
	jr nc,$+2		;c69b	30 00 	0 . 
	nop			;c69d	00 	. 
	nop			;c69e	00 	. 
	nop			;c69f	00 	. 
	
	defb "200  ", 000h

	rst 38h			;c6a6	ff 	. 
	dec bc			;c6a7	0b 	. 
	xor (hl)			;c6a8	ae 	. 
	jr nc,$+2		;c6a9	30 00 	0 . 
	nop			;c6ab	00 	. 
	nop			;c6ac	00 	. 
	nop			;c6ad	00 	. 
	
	defb "600  ", 000h

	rst 38h			;c6b4	ff 	. 
	inc bc			;c6b5	03 	. 
	cp h			;c6b6	bc 	. 
	jr nc,$+2		;c6b7	30 00 	0 . 
	nop			;c6b9	00 	. 
	nop			;c6ba	00 	. 
	nop			;c6bb	00 	. 

	defb "1800 ", 000h

	ccf			;c6c2	3f 	? 
	ld (bc),a			;c6c3	02 	. 
	jp z,00030h		;c6c4	ca 30 00 	. 0 . 
	nop			;c6c7	00 	. 
	nop			;c6c8	00 	. 
	nop			;c6c9	00 	. 
	inc sp			;c6ca	33 	3 
	
	defb "200 ", 000h

	rst 38h			;c6d0	ff 	. 
	ld bc,030d8h		;c6d1	01 d8 30 	. . 0 
	nop			;c6d4	00 	. 
	nop			;c6d5	00 	. 
	nop			;c6d6	00 	. 
	nop			;c6d7	00 	. 
	inc sp			;c6d8	33 	3 

	defb "600 ", 000h

	xor 030h		;c6de	ee 30 	. 0 
	adc a,d			;c6e0	8a 	. 
	jr nc,$+48		;c6e1	30 2e 	0 . 
	ld sp,0313ch		;c6e3	31 3c 31 	1 < 1 
	ld c,d			;c6e6	4a 	J 
	ld sp,03158h		;c6e7	31 58 31 	1 X 1 
	ld h,(hl)			;c6ea	66 	f 
	ld sp,02f88h		;c6eb	31 88 2f 	1 . / 
	
	defb "110 ! 75 ! 2000!!134.5!150!7200~"
	defb "    !    !     !!     !   !    "
   	    
	ld a,h			;c72d	7c 	| 
	rst 38h			;c72e	ff 	. 
	ld e,a			;c72f	5f 	_ 
	ld (hl),031h		;c730	36 31 	6 1 
	nop			;c732	00 	. 
	nop			;c733	00 	. 
	nop			;c734	00 	. 
	nop			;c735	00 	. 
	scf			;c736	37 	7 
	dec (hl)			;c737	35 	5 
	jr nz,$+34		;c738	20 20 	    
	jr nz,$+2		;c73a	20 00 	  . 
	sbc a,c			;c73c	99 	. 
	inc bc			;c73d	03 	. 
	ld b,h			;c73e	44 	D 
	ld sp,00000h		;c73f	31 00 00 	1 . . 
	nop			;c742	00 	. 
	nop			;c743	00 	. 
	
	defb "2000 ", 000h
  
	add a,a			;c74a	87 	. 
	dec (hl)			;c74b	35 	5 
	ld d,d			;c74c	52 	R 
	ld sp,00000h		;c74d	31 00 00 	1 . . 
	nop			;c750	00 	. 
	nop			;c751	00 	. 
	
	defb "134.5", 000h

	rst 38h			;c758	ff 	. 
	cpl			;c759	2f 	/ 
	ld h,b			;c75a	60 	` 
	ld sp,00000h		;c75b	31 00 00 	1 . . 
	nop			;c75e	00 	. 
	nop			;c75f	00 	. 
	
	
	defb "150  ", 000h

	rst 38h			;c766	ff 	. 
	nop			;c767	00 	. 
	ld l,(hl)			;c768	6e 	n 
	ld sp,00000h		;c769	31 00 00 	1 . . 
	nop			;c76c	00 	. 
	nop			;c76d	00 	. 
	scf			;c76e	37 	7 
	
		
	defb "200 ", 000h

	add a,h			;c774	84 	. 
	ld sp,031c4h		;c775	31 c4 31 	1 . 1 
	call nc,00031h		;c778	d4 31 00 	. 1 . 
	nop			;c77b	00 	. 
	nop			;c77c	00 	. 
	nop			;c77d	00 	. 
	nop			;c77e	00 	. 
	nop			;c77f	00 	. 
	nop			;c780	00 	. 
	nop			;c781	00 	. 
	ld (hl),h			;c782	74 	t 
	
	defb 031h
	defb "None!Enq/!     !!    !     !    "
	defb "    ! Ack!     !!    !     !    "
	        
	nop			;c7c4	00 	. 
	nop			;c7c5	00 	. 
	call z,00031h		;c7c6	cc 31 00 	. 1 . 
	nop			;c7c9	00 	. 
	nop			;c7ca	00 	. 
	nop			;c7cb	00 	. 

	defb "None   ", 000h	

	ld bc,0dc00h		;c7d4	01 00 dc 	. . . 
	ld sp,00000h		;c7d7	31 00 00 	1 . . 
	nop			;c7da	00 	. 
	nop			;c7db	00 	. 

	defb "Enq/Ack", 000h

	call p,03431h		;c7e4	f4 31 34 	. 1 4 
	ld (03240h),a		;c7e7	32 40 32 	2 @ 2 
	nop			;c7ea	00 	. 
	nop			;c7eb	00 	. 
	nop			;c7ec	00 	. 
	nop			;c7ed	00 	. 
	nop			;c7ee	00 	. 
	nop			;c7ef	00 	. 
	nop			;c7f0	00 	. 
	nop			;c7f1	00 	. 
	call po,02031h		;c7f2	e4 31 20 	. 1   
	
	defb "DTE ! DCE !    !!    !    !     "
	defb "    !     !    !!    !    !    "
    
	add a,c			;c834	81 	. 
	nop			;c835	00 	. 
	inc a			;c836	3c 	< 
	ld (00000h),a		;c837	32 00 00 	2 . . 
	nop			;c83a	00 	. 
	nop			;c83b	00 	. 
	
	defb "DTE", 000h

	add a,d			;c840	82 	. 
	nop			;c841	00 	. 
	ld c,b			;c842	48 	H 
	ld (00000h),a		;c843	32 00 00 	2 . . 
	nop			;c846	00 	. 
	nop			;c847	00 	. 
	
	defb "DCE", 000h

	ld a,h			;c84c	7c 	| 
	ld (0325ch),a		;c84d	32 5c 32 	2 \ 2 
	ld h,h			;c850	64 	d 
	ld (00000h),a		;c851	32 00 00 	2 . . 
	nop			;c854	00 	. 
	nop			;c855	00 	. 
	nop			;c856	00 	. 
	nop			;c857	00 	. 
	nop			;c858	00 	. 
	nop			;c859	00 	. 
	ld c,h			;c85a	4c 	L 
	ld (00001h),a		;c85b	32 01 00 	2 . . 
	call nz,00032h		;c85e	c4 32 00 	. 2 . 
	nop			;c861	00 	. 
	nop			;c862	00 	. 
	nop			;c863	00 	. 
	nop			;c864	00 	. 
	nop			;c865	00 	. 
	ret nc			;c866	d0 	. 

	ld (00000h),a		;c867	32 00 00 	2 . . 
	nop			;c86a	00 	. 
	nop			;c86b	00 	. 
	ld a,h			;c86c	7c 	| 
	ld (032bch),a		;c86d	32 bc 32 	2 . 2 
	ret z			;c870	c8 	. 

	ld (00000h),a		;c871	32 00 00 	2 . . 
	nop			;c874	00 	. 
	nop			;c875	00 	. 
	nop			;c876	00 	. 
	nop			;c877	00 	. 
	nop			;c878	00 	. 
	nop			;c879	00 	. 
	ld l,h			;c87a	6c 	l 
	defb 032h

    defb " On ! Off !    !!    !     !    "
	defb "    !     !    !!    !     !    "
   
	ld bc,0c400h		;c8bc	01 00 c4 	. . . 
	ld (00000h),a		;c8bf	32 00 00 	2 . . 
	nop			;c8c2	00 	. 
	nop			;c8c3	00 	. 
	
	defb "On ", 000h

	nop			;c8c8	00 	. 
	nop			;c8c9	00 	. 
	ret nc			;c8ca	d0 	. 

	ld (00000h),a		;c8cb	32 00 00 	2 . . 
	nop			;c8ce	00 	. 
	nop			;c8cf	00 	. 

	;; "Off"	
	defb "Off", 000h

; see POI-210
; called by main menu selection "Setup Menu"
; function c8d4
fm_setup:
	ld a,006h		;c8d4	3e 06 	> . ; Load Page 6 (Application RAM)
	call os_loadpage		;c8d6	cd 60 0e 	. ` . ; Patched to 02d02h, Page-in 6
	call read_dbe0		;c8d9	cd 33 a5 	. 3 .
	ld hl,(03f00h)		;c8dc	2a 00 3f 	* . ? 
	push hl			;c8df	e5 	. 
	ld hl,(03f02h)		;c8e0	2a 02 3f 	* . ? 
	push hl			;c8e3	e5 	. 
	ld hl,(03f04h)		;c8e4	2a 04 3f 	* . ? 
	push hl			;c8e7	e5 	. 
	ld hl,(03f08h)		;c8e8	2a 08 3f 	* . ? 
	push hl			;c8eb	e5 	. 
	call fun_c944 + app_target_area-_splash_screen_data		;c8ec	cd 44 33 	. D 3
	;call 03344h		;c8ec	cd 44 33 	. D 3
	ld hl,00032h		;c8ef	21 32 00 	! 2 .
	push hl			;c8f2	e5 	. 
	call 0d9f9h		;c8f3	cd f9 d9 	. . . 
	pop hl			;c8f6	e1 	. 
	ld a,(03f12h)		;c8f7	3a 12 3f 	: . ? 
	ld c,a			;c8fa	4f 	O 
	ld hl,(03f08h)		;c8fb	2a 08 3f 	* . ? 
	pop de			;c8fe	d1 	. 
	or a			;c8ff	b7 	. 
	sbc hl,de		;c900	ed 52 	. R 
	jr nz,lc921h		;c902	20 1d 	  .
	ld hl,(03f04h)		;c904	2a 04 3f 	* . ? 
	pop de			;c907	d1 	. 
	or a			;c908	b7 	. 
	sbc hl,de		;c909	ed 52 	. R 
	jr nz,lc923h		;c90b	20 16 	  .
	ld hl,(03f02h)		;c90d	2a 02 3f 	* . ? 
	pop de			;c910	d1 	. 
	or a			;c911	b7 	. 
	sbc hl,de		;c912	ed 52 	. R 
	jr nz,lc924h		;c914	20 0e 	  .
	ld hl,(03f00h)		;c916	2a 00 3f 	* . ? 
	pop de			;c919	d1 	. 
	or a			;c91a	b7 	. 
	sbc hl,de		;c91b	ed 52 	. R 
	jr nz,lc925h		;c91d	20 06 	  .
	jr lc92fh		;c91f	18 0e 	. .
lc921h:
	dec c			;c921	0d 	. 
	pop de			;c922	d1 	. 
lc923h:
	pop de			;c923	d1 	.
lc924h:
	pop de			;c924	d1 	.
lc925h:
	dec c			;c925	0d 	.
	xor a			;c926	af 	. 
	bit 7,c		;c927	cb 79 	. y 
	jr nz,lc92ch		;c929	20 01 	  .
	ld a,c			;c92b	79 	y 
lc92ch:
	ld (03f12h),a		;c92c	32 12 3f 	2 . ?
lc92fh:
	ld a,006h		;c92f	3e 06 	> . ; Load Page 6 (Application RAM)
	call os_loadpage		;c931	cd 60 0e 	. ` . ; Patched to 02d02h, Page-in 6
	call write_dbe0		;c934	cd 3f a5 	. ? .
	ld a,(_tmp_page)		;c937	3a 96 a4 	: . .
	call os_loadpage		;c93a	cd 60 0e 	. ` . ; Patched to 02d02h, Page-in _tmp_page
	call 01c47h		;c93d	cd 47 1c 	. G . 
	ld hl,00001h		;c940	21 01 00 	! . . 
	ret			;c943	c9 	. 

;; POI-010 below could be config steps for serial parameters
;; many ldirs/copying of small areas
; should have 0x3344 in 2a00 adress space
fun_c944:
	ld a,(_tmp_page)		;c944	3a 96 a4 	: . .
	call os_loadpage		;c947	cd 60 0e 	. ` . ; Patched to 02d02h, Page-in _tmp_page
	
	ld a,022h		;c94a	3e 22 	> " 
	ld (07501h),a		;c94c	32 01 75 	2 . u 
	ld hl,02d64h		;c94f	21 64 2d 	! d - 
	push hl			;c952	e5 	. 
	call 01cf8h		;c953	cd f8 1c 	. . . 
	
	pop hl			;c956	e1 	. 
	ld hl,07000h		;c957	21 00 70 	! . p 
	ld (hl),000h		;c95a	36 00 	6 . 
	ld d,h			;c95c	54 	T 
	ld e,l			;c95d	5d 	] 
	inc de			;c95e	13 	. 
	ld bc,002ffh		;c95f	01 ff 02 	. . . 
	ldir		;c962	ed b0 	. . 
	ld hl,02deeh		;c964	21 ee 2d 	! . - 
	ld de,07658h		;c967	11 58 76 	. X v 
	ld bc,00009h		;c96a	01 09 00 	. . . 
	ldir		;c96d	ed b0 	. . 
	ld hl,02df7h		;c96f	21 f7 2d 	! . - 
	ld de,07696h		;c972	11 96 76 	. . v 
	ld bc,00009h		;c975	01 09 00 	. . . 
	ldir		;c978	ed b0 	. . 
	ld hl,02e00h		;c97a	21 00 2e 	! . . 
	ld de,076d4h		;c97d	11 d4 76 	. . v 
	ld bc,00009h		;c980	01 09 00 	. . . 
	ldir		;c983	ed b0 	. . 
	ld hl,02e09h		;c985	21 09 2e 	! . . 
	ld de,07744h		;c988	11 44 77 	. D w 
	ld bc,00012h		;c98b	01 12 00 	. . . 
	ldir		;c98e	ed b0 	. . 
	ld hl,02e1bh		;c990	21 1b 2e 	! . . 
	ld de,077c0h		;c993	11 c0 77 	. . w 
	ld bc,00012h		;c996	01 12 00 	. . . 
	ldir		;c999	ed b0 	. . 
	ld hl,02e2dh		;c99b	21 2d 2e 	! - . 
	ld de,0783ch		;c99e	11 3c 78 	. < x 
	ld bc,00012h		;c9a1	01 12 00 	. . . 
	ldir		;c9a4	ed b0 	. . 
	ld hl,02e3fh		;c9a6	21 3f 2e 	! ? . 
	ld de,078b8h		;c9a9	11 b8 78 	. . x 
	ld bc,00012h		;c9ac	01 12 00 	. . . 
	ldir		;c9af	ed b0 	. . 
	ld hl,02e51h		;c9b1	21 51 2e 	! Q . 
	ld de,068aeh		;c9b4	11 ae 68 	. . h 
	ld bc,00009h		;c9b7	01 09 00 	. . . 
	ldir		;c9ba	ed b0 	. . 
	ld hl,02e5ah		;c9bc	21 5a 2e 	! Z . 
	ld de,06864h		;c9bf	11 64 68 	. d h 
	ld bc,00012h		;c9c2	01 12 00 	. . . 
	ldir		;c9c5	ed b0 	. . 
	ld a,033h		;c9c7	3e 33 	> 3 
	ld (07014h),a		;c9c9	32 14 70 	2 . p 
	ld a,034h		;c9cc	3e 34 	> 4 
	ld (07054h),a		;c9ce	32 54 70 	2 T p 
	ld a,035h		;c9d1	3e 35 	> 5 
	ld (07094h),a		;c9d3	32 94 70 	2 . p 
	ld a,036h		;c9d6	3e 36 	> 6 
	ld (07154h),a		;c9d8	32 54 71 	2 T q 
	ld a,037h		;c9db	3e 37 	> 7 
	ld (070d4h),a		;c9dd	32 d4 70 	2 . p 
	ld a,038h		;c9e0	3e 38 	> 8 
	ld (071d4h),a		;c9e2	32 d4 71 	2 . q 
	ld a,039h		;c9e5	3e 39 	> 9 
	ld (07214h),a		;c9e7	32 14 72 	2 . r 
	ld a,03ah		;c9ea	3e 3a 	> : 
	ld (07264h),a		;c9ec	32 64 72 	2 d r 
	ld a,03bh		;c9ef	3e 3b 	> ; 
	ld (072a4h),a		;c9f1	32 a4 72 	2 . r 
	ld hl,00032h		;c9f4	21 32 00 	! 2 . 
	push hl			;c9f7	e5 	. 
	ld hl,02e6eh		;c9f8	21 6e 2e 	! n . 
	push hl			;c9fb	e5 	. 
	call 00fbfh		;c9fc	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;c9ff	e1 	. 
	ld hl,00033h		;ca00	21 33 00 	! 3 . 
	ex (sp),hl			;ca03	e3 	. 
	ld hl,02edeh		;ca04	21 de 2e 	! . . 
	push hl			;ca07	e5 	. 
	call 00fbfh		;ca08	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca0b	e1 	. 
	ld hl,00034h		;ca0c	21 34 00 	! 4 . 
	ex (sp),hl			;ca0f	e3 	. 
	ld hl,02f88h		;ca10	21 88 2f 	! . / 
	push hl			;ca13	e5 	. 
	call 00fbfh		;ca14	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca17	e1 	. 
	ld hl,00035h		;ca18	21 35 00 	! 5 . 
	ex (sp),hl			;ca1b	e3 	. 
	ld hl,03174h		;ca1c	21 74 31 	! t 1 
	push hl			;ca1f	e5 	. 
	call 00fbfh		;ca20	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca23	e1 	. 
	ld hl,00036h		;ca24	21 36 00 	! 6 . 
	ex (sp),hl			;ca27	e3 	. 
	ld hl,031e4h		;ca28	21 e4 31 	! . 1 
	push hl			;ca2b	e5 	. 
	call 00fbfh		;ca2c	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca2f	e1 	. 
	ld hl,00037h		;ca30	21 37 00 	! 7 . 
	ex (sp),hl			;ca33	e3 	. 
	ld hl,0324ch		;ca34	21 4c 32 	! L 2 
	push hl			;ca37	e5 	. 
	call 00fbfh		;ca38	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca3b	e1 	. 
	ld hl,00038h		;ca3c	21 38 00 	! 8 . 
	ex (sp),hl			;ca3f	e3 	. 
	ld hl,0326ch		;ca40	21 6c 32 	! l 2 
	push hl			;ca43	e5 	. 
	call 00fbfh		;ca44	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca47	e1 	. 
	ld hl,00039h		;ca48	21 39 00 	! 9 . 
	ex (sp),hl			;ca4b	e3 	. 
	ld hl,0326ch		;ca4c	21 6c 32 	! l 2 
	push hl			;ca4f	e5 	. 
	call 00fbfh		;ca50	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca53	e1 	. 
	ld hl,0003ah		;ca54	21 3a 00 	! : . 
	ex (sp),hl			;ca57	e3 	. 
	ld hl,0326ch		;ca58	21 6c 32 	! l 2 
	push hl			;ca5b	e5 	. 
	call 00fbfh		;ca5c	cd bf 0f 	. . . ; Patched to 02e60h
	pop hl			;ca5f	e1 	. 
	pop hl			;ca60	e1 	. 
	ret			;ca61	c9 	. 

;
; Called on selection of main menu "Setup = Sim."
; function ca62
fm_setup2sim:
	ld hl,(03f00h)		;ca62	2a 00 3f 	* . ?
	push hl			;ca65	e5 	. 
	ld hl,(03f02h)		;ca66	2a 02 3f 	* . ? 
	push hl			;ca69	e5 	. 
	ld hl,(03f04h)		;ca6a	2a 04 3f 	* . ? 
	push hl			;ca6d	e5 	. 
	ld hl,(03f08h)		;ca6e	2a 08 3f 	* . ? 
	push hl			;ca71	e5 	. 
	ld a,(04806h)		;ca72	3a 06 48 	: . H 
	cp 001h		;ca75	fe 01 	. . 
	jr z,lca85h		;ca77	28 0c 	( .
	cp 002h		;ca79	fe 02 	. . 
	jr nz,lca8bh		;ca7b	20 0e 	  .
	ld hl,07f20h		;ca7d	21 20 7f 	!    
	ld (03f00h),hl		;ca80	22 00 3f 	" . ? 
	jr lca8bh		;ca83	18 06 	. .
lca85h:
	ld hl,0ff60h		;ca85	21 60 ff 	! ` . 
	ld (03f00h),hl		;ca88	22 00 3f 	" . ? 
lca8bh:
	ld a,(0481ah)		;ca8b	3a 1a 48 	: . H
	cp 003h		;ca8e	fe 03 	. . 
	jr z,lcaa3h		;ca90	28 11 	( .
	cp 002h		;ca92	fe 02 	. . 
	jr z,lcaa8h		;ca94	28 12 	( .
	cp 001h		;ca96	fe 01 	. . 
	jr z,lcaadh		;ca98	28 13 	( .
	cp 004h		;ca9a	fe 04 	. . 
	jr nz,lcab3h		;ca9c	20 15 	  .
	ld hl,00043h		;ca9e	21 43 00 	! C . 
	jr lcab0h		;caa1	18 0d 	. .
lcaa3h:
	ld hl,00000h		;caa3	21 00 00 	! . . 
	jr lcab0h		;caa6	18 08 	. .
lcaa8h:
	ld hl,00003h		;caa8	21 03 00 	! . . 
	jr lcab0h		;caab	18 03 	. .
lcaadh:
	ld hl,00001h		;caad	21 01 00 	! . . 
lcab0h:
	ld (03f02h),hl		;cab0	22 02 3f 	" . ?
lcab3h:
	ld ix,03525h		;cab3	dd 21 25 35 	. ! % 5
	ld de,00004h		;cab7	11 04 00 	. . . 
	ld b,012h		;caba	06 12 	. . 
	ld hl,(04816h)		;cabc	2a 16 48 	* . H 
	ld a,(04814h)		;cabf	3a 14 48 	: . H 
	ld h,a			;cac2	67 	g 
lcac3h:
	ld a,(ix+000h)		;cac3	dd 7e 00 	. ~ .
	cp l			;cac6	bd 	. 
	jr nz,lcacfh		;cac7	20 06 	  .
	ld a,(ix+001h)		;cac9	dd 7e 01 	. ~ . 
	cp h			;cacc	bc 	. 
	jr z,lcad5h		;cacd	28 06 	( .
lcacfh:
	add ix,de		;cacf	dd 19 	. . 
	djnz lcac3h		;cad1	10 f0 	. .
	jr lcaefh		;cad3	18 1a 	. .
lcad5h:
	ld l,(ix+002h)		;cad5	dd 6e 02 	. n . 
	ld h,(ix+003h)		;cad8	dd 66 03 	. f . 
	ld a,l			;cadb	7d 	} 
	or h			;cadc	b4 	. 
	jr nz,lcaech		;cadd	20 0d 	  .
	ld a,(04812h)		;cadf	3a 12 48 	: . H 
	cp 003h		;cae2	fe 03 	. . 
	ld hl,023ffh		;cae4	21 ff 23 	! . # 
	jr z,lcaech		;cae7	28 03 	( .
	ld hl,00399h		;cae9	21 99 03 	! . . 
lcaech:
	ld (03f04h),hl		;caec	22 04 3f 	" . ?
lcaefh:
	ld a,(07532h)		;caef	3a 32 75 	: 2 u
	dec a			;caf2	3d 	= 
	push af			;caf3	f5 	. 
	jr nz,lcafch		;caf4	20 06 	  .
	call 00ebbh		;caf6	cd bb 0e 	. . .
	call 00e94h		;caf9	cd 94 0e 	. . . 
lcafch:
	ld ix,(0498ah)		;cafc	dd 2a 8a 49 	. * . I
	ld a,(ix+00ah)		;cb00	dd 7e 0a 	. ~ . 
	cp 002h		;cb03	fe 02 	. . 
	jr z,lcb13h		;cb05	28 0c 	( .
	cp 001h		;cb07	fe 01 	. . 
	jr nz,lcb19h		;cb09	20 0e 	  .
	ld hl,00082h		;cb0b	21 82 00 	! . . 
	ld (03f08h),hl		;cb0e	22 08 3f 	" . ? 
	jr lcb19h		;cb11	18 06 	. .
lcb13h:
	ld hl,00081h		;cb13	21 81 00 	! . . 
	ld (03f08h),hl		;cb16	22 08 3f 	" . ? 
lcb19h:
	pop af			;cb19	f1 	.
	jr nz,lcb22h		;cb1a	20 06 	  .
	call 00eaah		;cb1c	cd aa 0e 	. . . 
	call 00eafh		;cb1f	cd af 0e 	. . . 
lcb22h:
	jp 032f7h		;cb22	c3 f7 32 	. . 2
	add a,b			;cb25	80 	. 
	ld bc,0002fh		;cb26	01 2f 00 	. / . 
	ret nz			;cb29	c0 	. 

	nop			;cb2a	00 	. 
	ld e,a			;cb2b	5f 	_ 
	nop			;cb2c	00 	. 
	ret nz			;cb2d	c0 	. 

	inc bc			;cb2e	03 	. 
	cp a			;cb2f	bf 	. 
	nop			;cb30	00 	. 
	ret nc			;cb31	d0 	. 

	ld (bc),a			;cb32	02 	. 
	rst 38h			;cb33	ff 	. 
	nop			;cb34	00 	. 
	ret po			;cb35	e0 	. 

	ld bc,0017fh		;cb36	01 7f 01 	.  . 
	ld l,b			;cb39	68 	h 
	ld bc,001ffh		;cb3a	01 ff 01 	. . . 
	ld b,b			;cb3d	40 	@ 
	ld bc,0023fh		;cb3e	01 3f 02 	. ? . 
	ret p			;cb41	f0 	. 

	nop			;cb42	00 	. 
	rst 38h			;cb43	ff 	. 
	ld (bc),a			;cb44	02 	. 
	or h			;cb45	b4 	. 
	nop			;cb46	00 	. 
	rst 38h			;cb47	ff 	. 
	inc bc			;cb48	03 	. 
	ld a,b			;cb49	78 	x 
	nop			;cb4a	00 	. 
	rst 38h			;cb4b	ff 	. 
	dec b			;cb4c	05 	. 
	ld e,b			;cb4d	58 	X 
	ld (bc),a			;cb4e	02 	. 
	rst 38h			;cb4f	ff 	. 
	dec bc			;cb50	0b 	. 
	inc l			;cb51	2c 	, 
	ld bc,017ffh		;cb52	01 ff 17 	. . . 
	ret z			;cb55	c8 	. 

	nop			;cb56	00 	. 
	nop			;cb57	00 	. 
	nop			;cb58	00 	. 
	sub (hl)			;cb59	96 	. 
	nop			;cb5a	00 	. 
	rst 38h			;cb5b	ff 	. 
	cpl			;cb5c	2f 	/ 
	add a,(hl)			;cb5d	86 	. 
	nop			;cb5e	00 	. 
	add a,a			;cb5f	87 	. 
	dec (hl)			;cb60	35 	5 
	ld l,(hl)			;cb61	6e 	n 
	nop			;cb62	00 	. 
	ld (hl),e			;cb63	73 	s 
	ld b,c			;cb64	41 	A 
	xor 002h		;cb65	ee 02 	. . 
	rst 38h			;cb67	ff 	. 
	ld e,a			;cb68	5f 	_ 
	call p,0ff01h		;cb69	f4 01 ff 	. . . 
	adc a,a			;cb6c	8f 	.

	;; in original file, we have nop until 0d400h

;------------------------------------------------------------------
; d400 area
;------------------------------------------------------------------
	org 0d400h
	seek 03400h
code_p_d400:

	jp 07804h		;d400	c3 04 78 	. . x 
	nop			;d403	00 	.

	ld sp,08000h		;d404	31 00 80 	1 . .   ; sp:=8000
	ld a,0ffh		;d407	3e ff 	> .             ; (09df8h):=0xff
	ld (09df8h),a		;d409	32 f8 9d 	2 . .   ;
	ld a,078h		;d40c	3e 78 	> x             ; a:=0x78
	out (000h),a		;d40e	d3 00 	. .         ; a -> out 000
	xor a			;d410	af 	.                   ; a:=0
	ld (07803h),a		;d411	32 03 78 	2 . x   ; (7803):=a
	jp 07828h		;d414	c3 28 78 	. ( x 
ld417h:
	call 0793dh		;d417	cd 3d 79 	. = y
	jr z,$+14		;d41a	28 0c 	( .             ; jr l_d426
	ld c,l			;d41c	4d 	M 
	ld b,h			;d41d	44 	D 
	call 07bf5h		;d41e	cd f5 7b 	. . { 
	jr nz,ld417h		;d421	20 f4 	  .
	call 078c7h		;d423	cd c7 78 	. . x
	jr ld417h		;d426	18 ef 	. .
ld428h:
	ld a,(07803h)		;d428	3a 03 78 	: . x 
	or a			;d42b	b7 	. 
	jr z,ld434h		;d42c	28 06 	( .
	call 07c45h		;d42e	cd 45 7c 	. E | 
	call z,078bdh		;d431	cc bd 78 	. . x 
ld434h:
	ld a,(ldff0h)		;d434	3a f0 df 	: . .
	cp 000h		;d437	fe 00 	. .
	jp z,07817h		;d439	ca 17 78 	. . x
	ld hl,07869h		;d43c	21 69 78 	! i x
	push hl			;d43f	e5 	.
	cp 001h		;d440	fe 01 	. .
	jp z,07871h		;d442	ca 71 78 	. q x 
	cp 002h		;d445	fe 02 	. .                 ; a==2?
	jp z,0787bh		;d447	ca 7b 78 	. { x 
	cp 003h		;d44a	fe 03 	. .                 ; a==3?
	jp z,0787fh		;d44c	ca 7f 78 	.  x 
	cp 004h		;d44f	fe 04 	. .                 ; a==4?
	jp z,07891h		;d451	ca 91 78 	. . x 
	cp 005h		;d454	fe 05 	. .                 ; a==5?
	jp z,078b2h		;d456	ca b2 78 	. . x 
	cp 006h		;d459	fe 06 	. .                 ; a==6?
	jp z,078d3h		;d45b	ca d3 78 	. . x 
	cp 007h		;d45e	fe 07 	. .                 ; a==7?
	jp z,0791dh		;d460	ca 1d 79 	. . y 
	cp 008h		;d463	fe 08 	. .                 ; a==8?
	jp z,0792ah		;d465	ca 2a 79 	. * y
	pop hl			;d468	e1 	.                   ; restore hl
	ld a,000h		;d469	3e 00 	> .             ; (0dff0h):=0
	ld (0dff0h),a		;d46b	32 f0 df 	2 . .   ;
	jp 07817h		;d46e	c3 17 78 	. . x 
	call 079cch		;d471	cd cc 79 	. . y 
	call 079d2h		;d474	cd d2 79 	. . y 
	call 07ad9h		;d477	cd d9 7a 	. . z 
	ret			;d47a	c9 	. 

	call 07ad9h		;d47b	cd d9 7a 	. . z 
	ret			;d47e	c9 	. 

	ld a,(0dff1h)		;d47f	3a f1 df 	: . . 
	ld c,a			;d482	4f 	O 
	call 0798dh		;d483	cd 8d 79 	. . y 
	ld a,(var_byte_dbea)		;d486	3a ea db 	: . .
	or a			;d489	b7 	. 
	ret z			;d48a	c8 	. 

	ld b,083h		;d48b	06 83 	. . 
	call 07bf5h		;d48d	cd f5 7b 	. . { 
	ret			;d490	c9 	. 

	call 07ac7h		;d491	cd c7 7a 	. . z 
	ld b,07fh		;d494	06 7f 	.  
ld496h:
	ld hl,000c6h		;d496	21 c6 00 	! . .
ld499h:
	push bc			;d499	c5 	.
	push hl			;d49a	e5 	. 
	call 0793dh		;d49b	cd 3d 79 	. = y 
	jr z,ld4a5h		;d49e	28 05 	( .
	ld c,l			;d4a0	4d 	M 
	ld b,h			;d4a1	44 	D 
	call 07bf5h		;d4a2	cd f5 7b 	. . { 
ld4a5h:
	pop hl			;d4a5	e1 	.
	pop bc			;d4a6	c1 	. 
	dec hl			;d4a7	2b 	+ 
	ld a,h			;d4a8	7c 	| 
	or l			;d4a9	b5 	. 
	jr nz,ld499h		;d4aa	20 ed 	  .
	djnz ld496h		;d4ac	10 e8 	. .
	call 07ad4h		;d4ae	cd d4 7a 	. . z 
	ret			;d4b1	c9 	.
	call 07b03h		;d4b2	cd 03 7b 	. . { 
	ld a,000h		;d4b5	3e 00 	> . 
	ld (ldff0h),a		;d4b7	32 f0 df 	2 . .
	jp 07931h		;d4ba	c3 31 79 	. 1 y 
	xor a			;d4bd	af 	. 
	ld (07803h),a		;d4be	32 03 78 	2 . x 
	ld c,011h		;d4c1	0e 11 	. . 
	call 0798dh		;d4c3	cd 8d 79 	. . y 
	ret			;d4c6	c9 	. 

	ld a,001h		;d4c7	3e 01 	> . 
	ld (07803h),a		;d4c9	32 03 78 	2 . x 
	ld c,013h		;d4cc	0e 13 	. . 
	call 0798dh		;d4ce	cd 8d 79 	. . y 
	ret			;d4d1	c9 	. 

	ret			;d4d2	c9 	. 

	call 07b9bh		;d4d3	cd 9b 7b 	. . { 
	ld a,000h		;d4d6	3e 00 	> . 
	ld (0dff0h),a		;d4d8	32 f0 df 	2 . . 
	ld a,(078d2h)		;d4db	3a d2 78 	: . x 
	ld (01994h),a		;d4de	32 94 19 	2 . . 
	ld hl,0790eh		;d4e1	21 0e 79 	! . y 
	ld (02a84h),hl		;d4e4	22 84 2a 	" . *

	ld hl,02a86h		;d4e7	21 86 2a 	! . *   ; copy 7 bytes 02a86h -> 02a87 - strange...
	ld de,02a87h		;d4ea	11 87 2a 	. . *
	ld bc,00007h		;d4ed	01 07 00 	. . . 
	ld (hl),000h		;d4f0	36 00 	6 . 
	ldir		;d4f2	ed b0 	. .

	ld hl,00000h		;d4f4	21 00 00 	! . . 
	ld (02a95h),hl		;d4f7	22 95 2a 	" . * 
	ld hl,07000h		;d4fa	21 00 70 	! . p 
	ld (07121h),hl		;d4fd	22 21 71 	" ! q 
	ld (07123h),hl		;d500	22 23 71 	" # q 
	ld a,070h		;d503	3e 70 	> p 
;;; POI-020, out command	
	out (000h),a		;d505	d3 00 	. . 
	ld a,000h		;d507	3e 00 	> . 
	ld (09dffh),a		;d509	32 ff 9d 	2 . . 
	jr $+37		;d50c	18 23 	. # 
	ld hl,(07915h)		;d50e	2a 15 79 	* . y 
	ld (00066h),hl		;d511	22 66 00 	" f . 
	ret			;d514	c9 	. 
	jr ld51dh		;d515	18 06 	. .
	ld (00000h),a		;d517	32 00 00 	2 . . 
	pop af			;d51a	f1 	. 
	retn		;d51b	ed 45 	. E 
ld51dh:
	call 07b03h		;d51d	cd 03 7b 	. . { 
	call 07b7ch		;d520	cd 7c 7b 	. | { 
	ld a,000h		;d523	3e 00 	> . 
	ld (ldff0h),a		;d525	32 f0 df 	2 . .
	jr ld531h		;d528	18 07 	. .
	call 079d2h		;d52a	cd d2 79 	. . y 
	call 07ad9h		;d52d	cd d9 7a 	. . z 
	ret			;d530	c9 	. 
ld531h:
	ld sp,08000h		;d531	31 00 80 	1 . . 
	ld a,070h		;d534	3e 70 	> p 
;;; POI-021, out command		
	out (000h),a		;d536	d3 00 	. . 
	jp 00063h		;d538	c3 63 00 	. c . 
	ld bc,00e00h		;d53b	01 00 0e 	. . . 
	jr nz,ld546h		;d53e	20 06 	  .
	ld (le83ah),hl		;d540	22 3a e8 	" : .
	in a,(0cbh)		;d543	db cb 	. . 
	ld b,a			;d545	47 	G 
ld546h:
	jr nz,ld54ch		;d546	20 04 	  .
	ld c,021h		;d548	0e 21 	. ! 
	ld b,023h		;d54a	06 23 	. # 
ld54ch:
	ld a,000h		;d54c	3e 00 	> .
;;; POI-022, out + in command		
	out (c),a		;d54e	ed 79 	. y 
	in l,(c)		;d550	ed 68 	. h 
	bit 0,l		;d552	cb 45 	. E 
	ret z			;d554	c8 	. 

	ld a,001h		;d555	3e 01 	> . 
;;; POI-023, out command		
	out (c),a		;d557	ed 79 	. y 
	in h,(c)		;d559	ed 60 	. ` 
	ld c,b			;d55b	48 	H 
	in a,(c)		;d55c	ed 78 	. x 
	ld c,a			;d55e	4f 	O 
	ld a,(var_byte_dbe2)		;d55f	3a e2 db 	: . .
	bit 2,a		;d562	cb 57 	. W 
	jr nz,ld572h		;d564	20 0c 	  .
	bit 6,a		;d566	cb 77 	. w 
	jr nz,ld580h		;d568	20 16 	  .
	bit 4,h		;d56a	cb 64 	. d 
	jr z,ld580h		;d56c	28 12 	( .
ld56eh:
	ld b,08fh		;d56e	06 8f 	. . 
	jr ld582h		;d570	18 10 	. .
ld572h:
	bit 3,a		;d572	cb 5f 	. _ 
	jr nz,ld57ch		;d574	20 06 	  .
	bit 7,c		;d576	cb 79 	. y 
	jr nz,ld56eh		;d578	20 f4 	  .
	jr ld580h		;d57a	18 04 	. .
ld57ch:
	bit 7,c		;d57c	cb 79 	. y 
	jr z,ld56eh		;d57e	28 ee 	( .
ld580h:
	ld b,083h		;d580	06 83 	. . 
ld582h:
	ld l,c			;d582	69 	i
	ld h,b			;d583	60 	` 
	ld a,030h		;d584	3e 30 	> 0 
;;; POI-024, 2 times out command		
	out (021h),a		;d586	d3 21 	. ! 
	out (020h),a		;d588	d3 20 	.   
	or 0ffh		;d58a	f6 ff 	. . 
	ret			;d58c	c9 	. 
ld58dh:
	ld a,(var_byte_dbe2)		;d58d	3a e2 db 	: . .
	bit 3,a		;d590	cb 5f 	. _ 
	jr z,ld596h		;d592	28 02 	( .
	set 7,c		;d594	cb f9 	. . 
ld596h:
	ld a,000h		;d596	3e 00 	> .
	out (021h),a		;d598	d3 21 	. ! 
	in a,(021h)		;d59a	db 21 	. ! 
	bit 2,a		;d59c	cb 57 	. W 
	jr z,ld58dh		;d59e	28 ed 	( .
	ld a,005h		;d5a0	3e 05 	> . 
	out (021h),a		;d5a2	d3 21 	. ! 
	ld a,(07a92h)		;d5a4	3a 92 7a 	: . z 
	or 008h		;d5a7	f6 08 	. . 
	out (021h),a		;d5a9	d3 21 	. ! 
	ld a,c			;d5ab	79 	y 
	out (023h),a		;d5ac	d3 23 	. # 
	ret			;d5ae	c9 	. 

;; POI-025, many out
;; outputs:  to port 21: 9,c0,9,82
;; outputs:  to port 20: 9,42
;; outputs:  to port 40: 42,0
;; outputs:  to port 40: 0
	ld a,009h		;d5af	3e 09 	> .
	out (021h),a		;d5b1	d3 21 	. ! 
	ld a,0c0h		;d5b3	3e c0 	> . 
	out (021h),a		;d5b5	d3 21 	. ! 
	ld a,009h		;d5b7	3e 09 	> . 
	out (021h),a		;d5b9	d3 21 	. ! 
	ld a,082h		;d5bb	3e 82 	> . 
	out (021h),a		;d5bd	d3 21 	. ! 
	ld a,009h		;d5bf	3e 09 	> . 
	out (020h),a		;d5c1	d3 20 	.   
	ld a,042h		;d5c3	3e 42 	> B 
	out (020h),a		;d5c5	d3 20 	.   
	ld a,000h		;d5c7	3e 00 	> . 
	out (040h),a		;d5c9	d3 40 	. @ 
	ret			;d5cb	c9 	. 

	call 07b19h		;d5cc	cd 19 7b 	. . { 
	call 079afh		;d5cf	cd af 79 	. . y 
	ld a,(var_byte_dbe2)		;d5d2	3a e2 db 	: . .
	bit 2,a		;d5d5	cb 57 	. W 
	ld a,060h		;d5d7	3e 60 	> ` 
	jr nz,ld5deh		;d5d9	20 03 	  .
	ld a,(var_byte_dbe0)		;d5db	3a e0 db 	: . .
ld5deh:
	or 080h		;d5de	f6 80 	. . 
	ld (07aadh),a		;d5e0	32 ad 7a 	2 . z 
	or 002h		;d5e3	f6 02 	. . 
	ld (07a92h),a		;d5e5	32 92 7a 	2 . z 
	ld a,(var_byte_dbe2)		;d5e8	3a e2 db 	: . .
	bit 2,a		;d5eb	cb 57 	. W 
	ld a,060h		;d5ed	3e 60 	> ` 
	jr nz,ld5f4h		;d5ef	20 03 	  .
	ld a,(var_byte_dbe0)		;d5f1	3a e0 db 	: . .
ld5f4h:
	rlca			;d5f4	07 	. 
	or 010h		;d5f5	f6 10 	. . 
	ld (07a90h),a		;d5f7	32 90 7a 	2 . z 
	ld (07aabh),a		;d5fa	32 ab 7a 	2 . z 
	ld a,(var_byte_dbe2)		;d5fd	3a e2 db 	: . .
	or 05ch		;d600	f6 5c 	. \ 
	ld (07a88h),a		;d602	32 88 7a 	2 . z 
	ld (07aa3h),a		;d605	32 a3 7a 	2 . z 
	ld hl,(var_word_dbe4)		;d608	2a e4 db 	* . .
	srl h		;d60b	cb 3c 	. < 
	rr l		;d60d	cb 1d 	. . 
	srl h		;d60f	cb 3c 	. < 
	rr l		;d611	cb 1d 	. . 
	srl h		;d613	cb 3c 	. < 
	rr l		;d615	cb 1d 	. . 
	dec hl			;d617	2b 	+ 
	ld a,l			;d618	7d 	} 
	ld (07a9ah),a		;d619	32 9a 7a 	2 . z 
	ld (07ab3h),a		;d61c	32 b3 7a 	2 . z 
	ld a,h			;d61f	7c 	| 
	ld (07a9ch),a		;d620	32 9c 7a 	2 . z 
	ld (07ab5h),a		;d623	32 b5 7a 	2 . z 
	ld c,021h		;d626	0e 21 	. ! 
	ld hl,07a87h		;d628	21 87 7a 	! . z 
	call 07abbh		;d62b	cd bb 7a 	. . z 
	ld c,020h		;d62e	0e 20 	.   
	ld hl,07aa2h		;d630	21 a2 7a 	! . z 
	call 07abbh		;d633	cd bb 7a 	. . z 
	ld a,003h		;d636	3e 03 	> . 
;; POI-026, many out 0x03 and 0x33	
	out (021h),a		;d638	d3 21 	. ! 
	ld a,(07a90h)		;d63a	3a 90 7a 	: . z 
	or 001h		;d63d	f6 01 	. . 
	out (021h),a		;d63f	d3 21 	. ! 
	ld a,033h		;d641	3e 33 	> 3 
	out (021h),a		;d643	d3 21 	. ! 
	ld a,(07a90h)		;d645	3a 90 7a 	: . z 
	or 001h		;d648	f6 01 	. . 
	out (021h),a		;d64a	d3 21 	. ! 
	in a,(023h)		;d64c	db 23 	. # 
	ld a,003h		;d64e	3e 03 	> . 
	out (021h),a		;d650	d3 21 	. ! 
	ld a,(07a90h)		;d652	3a 90 7a 	: . z 
	out (021h),a		;d655	d3 21 	. ! 
	ld a,003h		;d657	3e 03 	> . 
	out (020h),a		;d659	d3 20 	.   
	ld a,(07aabh)		;d65b	3a ab 7a 	: . z 
	or 001h		;d65e	f6 01 	. . 
	out (020h),a		;d660	d3 20 	.   
	ld a,033h		;d662	3e 33 	> 3 
	out (020h),a		;d664	d3 20 	.   
	ld a,(07aabh)		;d666	3a ab 7a 	: . z 
	or 001h		;d669	f6 01 	. . 
	out (020h),a		;d66b	d3 20 	.   
	in a,(022h)		;d66d	db 22 	. " 
	ld a,003h		;d66f	3e 03 	> . 
	out (020h),a		;d671	d3 20 	.   
	ld a,(07aabh)		;d673	3a ab 7a 	: . z 
	out (020h),a		;d676	d3 20 	.   
	ld a,010h		;d678	3e 10 	> . 
	out (021h),a		;d67a	d3 21 	. ! 
	out (020h),a		;d67c	d3 20 	.   
	ld a,0d2h		;d67e	3e d2 	> . 
	out (040h),a		;d680	d3 40 	. @ 
	ld hl,000ffh		;d682	21 ff 00 	! . . 
	or l			;d685	b5 	. 
	ret			;d686	c9 	. 

	inc b			;d687	04 	. 
	nop			;d688	00 	. 
	ld a,(bc)			;d689	0a 	. 
	nop			;d68a	00 	. 
	ld b,0ffh		;d68b	06 ff 	. . 
	rlca			;d68d	07 	. 
	rst 38h			;d68e	ff 	. 
	inc bc			;d68f	03 	. 
	nop			;d690	00 	. 
	dec b			;d691	05 	. 
	nop			;d692	00 	. 
	ld bc,00200h		;d693	01 00 02 	. . . 
	ld b,b			;d696	40 	@ 
	dec bc			;d697	0b 	. 
	ld d,b			;d698	50 	P 
	inc c			;d699	0c 	. 
	nop			;d69a	00 	. 
	dec c			;d69b	0d 	. 
	nop			;d69c	00 	. 
	ld c,003h		;d69d	0e 03 	. . 
	rrca			;d69f	0f 	. 
	nop			;d6a0	00 	. 
	nop			;d6a1	00 	. 
	inc b			;d6a2	04 	. 
	nop			;d6a3	00 	. 
	ld a,(bc)			;d6a4	0a 	. 
	nop			;d6a5	00 	. 
	ld b,016h		;d6a6	06 16 	. . 
	rlca			;d6a8	07 	. 
	ld d,003h		;d6a9	16 03 	. . 
	nop			;d6ab	00 	. 
	dec b			;d6ac	05 	. 
	nop			;d6ad	00 	. 
	ld bc,00b00h		;d6ae	01 00 0b 	. . . 
	ld d,b			;d6b1	50 	P 
	inc c			;d6b2	0c 	. 
	nop			;d6b3	00 	. 
	dec c			;d6b4	0d 	. 
	nop			;d6b5	00 	. 
	ld c,003h		;d6b6	0e 03 	. . 
	rrca			;d6b8	0f 	. 
	nop			;d6b9	00 	. 
	nop			;d6ba	00 	. 
ld6bbh:
	ld a,(hl)			;d6bb	7e 	~
	or a			;d6bc	b7 	. 
	ret z			;d6bd	c8 	. 

	out (c),a		;d6be	ed 79 	. y 
	inc hl			;d6c0	23 	# 
	ld a,(hl)			;d6c1	7e 	~ 
	out (c),a		;d6c2	ed 79 	. y 
	inc hl			;d6c4	23 	# 
	jr ld6bbh		;d6c5	18 f4 	. .
	ld l,010h		;d6c7	2e 10 	. . 
	ld a,005h		;d6c9	3e 05 	> . 
	out (021h),a		;d6cb	d3 21 	. ! 
	ld a,(07a92h)		;d6cd	3a 92 7a 	: . z 
	or l			;d6d0	b5 	. 
	out (021h),a		;d6d1	d3 21 	. ! 
	ret			;d6d3	c9 	. 

	ld l,000h		;d6d4	2e 00 	. . 
	jp 07ac9h		;d6d6	c3 c9 7a 	. . z 
	ld l,001h		;d6d9	2e 01 	. . 
	ld h,008h		;d6db	26 08 	& . 
	ld a,(var_byte_dbe8)		;d6dd	3a e8 db 	: . .
	bit 0,a		;d6e0	cb 47 	. G 
	ld a,003h		;d6e2	3e 03 	> . 
	jr nz,ld6f0h		;d6e4	20 0a 	  .
	out (021h),a		;d6e6	d3 21 	. ! 
	ld a,(07a90h)		;d6e8	3a 90 7a 	: . z 
	or l			;d6eb	b5 	. 
	out (021h),a		;d6ec	d3 21 	. ! 
	jr ld6f8h		;d6ee	18 08 	. .
ld6f0h:
	out (020h),a		;d6f0	d3 20 	.   
	ld a,(07aabh)		;d6f2	3a ab 7a 	: . z 
	or l			;d6f5	b5 	. 
	out (020h),a		;d6f6	d3 20 	.   
ld6f8h:
	ld a,005h		;d6f8	3e 05 	> .
	out (021h),a		;d6fa	d3 21 	. ! 
	ld a,(07a92h)		;d6fc	3a 92 7a 	: . z 
	or h			;d6ff	b4 	. 
	out (021h),a		;d700	d3 21 	. ! 
	ret			;d702	c9 	. 

	ld l,000h		;d703	2e 00 	. . 
	ld h,000h		;d705	26 00 	& . 
	jp 07addh		;d707	c3 dd 7a 	. . z 
ld70ah:
	ld bc,0010bh		;d70a	01 0b 01 	. . .
ld70dh:
	dec bc			;d70d	0b 	.
	ld a,b			;d70e	78 	x 
	or c			;d70f	b1 	. 
	jr nz,ld70dh		;d710	20 fb 	  .
	dec hl			;d712	2b 	+ 
	ld a,l			;d713	7d 	} 
	or h			;d714	b4 	. 
	ret z			;d715	c8 	. 

	ret z			;d716	c8 	. 
	jr ld70ah		;d717	18 f1 	. .
	call 07b98h		;d719	cd 98 7b 	. . { 
	ld a,(var_byte_dbe8)		;d71c	3a e8 db 	: . .
	ld e,a			;d71f	5f 	_ 
	ld a,090h		;d720	3e 90 	> . 
	out (000h),a		;d722	d3 00 	. . 
	xor a			;d724	af 	. 
	out (002h),a		;d725	d3 02 	. . 
	ld a,(0793ch)		;d727	3a 3c 79 	: < y 
	ld c,a			;d72a	4f 	O 
	ld b,000h		;d72b	06 00 	. . 
	ld hl,07b74h		;d72d	21 74 7b 	! t { 
	add hl,bc			;d730	09 	. 
	ld a,(hl)			;d731	7e 	~ 
	or a			;d732	b7 	. 
	jr z,ld761h		;d733	28 2c 	( ,
	call 07bd6h		;d735	cd d6 7b 	. . { 
	ld a,080h		;d738	3e 80 	> . 
	out (002h),a		;d73a	d3 02 	. . 
	call 07bd6h		;d73c	cd d6 7b 	. . { 
	xor a			;d73f	af 	. 
	out (002h),a		;d740	d3 02 	. . 
	call 07bd6h		;d742	cd d6 7b 	. . { 
	bit 1,e		;d745	cb 4b 	. K 
	ld a,0d2h		;d747	3e d2 	> . 
	jr nz,ld753h		;d749	20 08 	  .
	bit 0,e		;d74b	cb 43 	. C 
	ld a,0b4h		;d74d	3e b4 	> . 
	jr nz,ld753h		;d74f	20 02 	  .
	jr ld773h		;d751	18 20 	.
ld753h:
	out (000h),a		;d753	d3 00 	. . 
	call 07bd6h		;d755	cd d6 7b 	. . { 
	ld a,090h		;d758	3e 90 	> . 
	out (000h),a		;d75a	d3 00 	. . 
	call 07bd6h		;d75c	cd d6 7b 	. . { 
	jr ld773h		;d75f	18 12 	. .
ld761h:
	bit 1,e		;d761	cb 4b 	. K 
	jr z,ld76bh		;d763	28 06 	( .
	ld a,0d2h		;d765	3e d2 	> . 
	out (000h),a		;d767	d3 00 	. . 
	jr ld773h		;d769	18 08 	. .
ld76bh:
	bit 0,e		;d76b	cb 43 	. C 
	jr z,ld773h		;d76d	28 04 	( .
	ld a,0b4h		;d76f	3e b4 	> . 
	out (000h),a		;d771	d3 00 	. . 
ld773h:
	ret			;d773	c9 	.

	ld bc,00001h		;d774	01 01 00 	. . . 
	nop			;d777	00 	. 
	nop			;d778	00 	. 
	nop			;d779	00 	. 
	nop			;d77a	00 	. 
	nop			;d77b	00 	. 
	push de			;d77c	d5 	. 
	push bc			;d77d	c5 	. 
	call 079afh		;d77e	cd af 79 	. . y 
	ld a,090h		;d781	3e 90 	> . 
	out (000h),a		;d783	d3 00 	. . 
	call 07bd6h		;d785	cd d6 7b 	. . { 
	ld a,080h		;d788	3e 80 	> . 
	out (002h),a		;d78a	d3 02 	. . 
	call 07bd6h		;d78c	cd d6 7b 	. . { 
	xor a			;d78f	af 	. 
	out (002h),a		;d790	d3 02 	. . 
	call 07bd6h		;d792	cd d6 7b 	. . { 
	pop bc			;d795	c1 	. 
	pop de			;d796	d1 	. 
	ret			;d797	c9 	. 

	call 07bc3h		;d798	cd c3 7b 	. . {       ;
	xor a			;d79b	af 	.                   ; a:=0
	out (001h),a		;d79c	d3 01 	. .         ; a -> out 001
	in a,(001h)		;d79e	db 01 	. .             ; in 001 -> a
	ld (0793bh),a		;d7a0	32 3b 79 	2 ; y   ; (0793bh):=a
	and 0d0h		;d7a3	e6 d0 	. . 
	ld b,a			;d7a5	47 	G 
	rrc b		;d7a6	cb 08 	. . 
	rrc b		;d7a8	cb 08 	. . 
	rlca			;d7aa	07 	. 
	rlca			;d7ab	07 	. 
	or b			;d7ac	b0 	. 
	and 007h		;d7ad	e6 07 	. . 
	ld hl,07bbbh		;d7af	21 bb 7b 	! . { 
	ld b,000h		;d7b2	06 00 	. . 
	ld c,a			;d7b4	4f 	O 
	add hl,bc			;d7b5	09 	. 
	ld a,(hl)			;d7b6	7e 	~ 
	ld (0793ch),a		;d7b7	32 3c 79 	2 < y 
	ret			;d7ba	c9 	. 

	ld bc,00203h		;d7bb	01 03 02 	. . . 
	inc b			;d7be	04 	. 
	ld bc,00101h		;d7bf	01 01 01 	. . . 
	ex af,af'			;d7c2	08 	. 
	call 07bd6h		;d7c3	cd d6 7b 	. . { 
	ld a,080h		;d7c6	3e 80 	> . 
	out (002h),a		;d7c8	d3 02 	. . 
	call 07bd6h		;d7ca	cd d6 7b 	. . { 
	xor a			;d7cd	af 	. 
	out (002h),a		;d7ce	d3 02 	. . 
	ret			;d7d0	c9 	. 

	ld hl,0012ch		;d7d1	21 2c 01 	! , . 
	jr ld7d9h		;d7d4	18 03 	. .
	ld hl,02710h		;d7d6	21 10 27 	! . ' 
ld7d9h:
	dec hl			;d7d9	2b 	+
	ld a,h			;d7da	7c 	| 
	or l			;d7db	b5 	. 
	jr nz,ld7d9h		;d7dc	20 fb 	  .
	ret			;d7de	c9 	. 
	ld hl,ldc00h		;d7df	21 00 dc 	! . .
	ld (lde02h),hl		;d7e2	22 02 de 	" . .
	ld (lde00h),hl		;d7e5	22 00 de 	" . .
	xor a			;d7e8	af 	. 
	ld (lde06h),a		;d7e9	32 06 de 	2 . .
	ld (lde07h),a		;d7ec	32 07 de 	2 . .
	ld l,a			;d7ef	6f 	o 
	ld h,a			;d7f0	67 	g 
	ld (lde04h),hl		;d7f1	22 04 de 	" . .
	ret			;d7f4	c9 	. 

	ld a,001h		;d7f5	3e 01 	> . 
	ld (lde07h),a		;d7f7	32 07 de 	2 . .
ld7fah:
	ld a,(lde06h)		;d7fa	3a 06 de 	: . .
	or a			;d7fd	b7 	. 
	jr z,ld811h		;d7fe	28 11 	( .
	xor a			;d800	af 	. 
	ld (lde07h),a		;d801	32 07 de 	2 . .
	push bc			;d804	c5 	. 
	ld b,020h		;d805	06 20 	.   
ld807h:
	djnz ld807h		;d807	10 fe 	. .
	pop bc			;d809	c1 	. 
	ld a,001h		;d80a	3e 01 	> . 
	ld (lde07h),a		;d80c	32 07 de 	2 . .
	jr ld7fah		;d80f	18 e9 	. .
ld811h:
	ld de,(lde04h)		;d811	ed 5b 04 de 	. [ . .
	ld hl,00100h		;d815	21 00 01 	! . . 
	or a			;d818	b7 	. 
	sbc hl,de		;d819	ed 52 	. R 
	jr z,ld840h		;d81b	28 23 	( #
	inc de			;d81d	13 	. 
	ld (lde04h),de		;d81e	ed 53 04 de 	. S . .
	ex de,hl			;d822	eb 	. 
	ld hl,(lde00h)		;d823	2a 00 de 	* . .
	ld (hl),c			;d826	71 	q 
	inc l			;d827	2c 	, 
	ld (hl),b			;d828	70 	p 
	inc hl			;d829	23 	# 
	set 2,h		;d82a	cb d4 	. . 
	res 1,h		;d82c	cb 8c 	. . 
	ld (lde00h),hl		;d82e	22 00 de 	" . .
	xor a			;d831	af 	. 
	ld (lde07h),a		;d832	32 07 de 	2 . .
	ld a,d			;d835	7a 	z 
	or a			;d836	b7 	. 
	ret nz			;d837	c0 	. 

	ld a,e			;d838	7b 	{ 
	cp 020h		;d839	fe 20 	.   
	jr c,ld840h		;d83b	38 03 	8 .
	or 0ffh		;d83d	f6 ff 	. . 
	ret			;d83f	c9 	. 
ld840h:
	xor a			;d840	af 	. 
	ld (0de07h),a		;d841	32 07 de 	2 . . 
	ret			;d844	c9 	. 

	ld a,001h		;d845	3e 01 	> . 
	ld (lde07h),a		;d847	32 07 de 	2 . .
ld84ah:
	ld a,(lde06h)		;d84a	3a 06 de 	: . .
	or a			;d84d	b7 	. 
	jr z,ld861h		;d84e	28 11 	( .
	xor a			;d850	af 	. 
	ld (lde07h),a		;d851	32 07 de 	2 . .
	push bc			;d854	c5 	. 
	ld b,020h		;d855	06 20 	.   
ld857h:
	djnz ld857h		;d857	10 fe 	. .
	pop bc			;d859	c1 	. 
	ld a,001h		;d85a	3e 01 	> . 
	ld (lde07h),a		;d85c	32 07 de 	2 . .
	jr ld84ah		;d85f	18 e9 	. .
ld861h:
	ld hl,(lde04h)		;d861	2a 04 de 	* . .
	xor a			;d864	af 	. 
	ld (lde07h),a		;d865	32 07 de 	2 . .
	ld a,h			;d868	7c 	| 
	or l			;d869	b5 	. 
	ret			;d86a	c9 	. 

	ld a,001h		;d86b	3e 01 	> . 
	ld (lde06h),a		;d86d	32 06 de 	2 . .
ld870h:
	ld a,(lde07h)		;d870	3a 07 de 	: . .
	or a			;d873	b7 	. 
	jr nz,ld870h		;d874	20 fa 	  .
	ld hl,(lde04h)		;d876	2a 04 de 	* . .
	ld a,h			;d879	7c 	| 
	or l			;d87a	b5 	. 
	jr z,ld891h		;d87b	28 14 	( .
	dec hl			;d87d	2b 	+ 
	ld (lde04h),hl		;d87e	22 04 de 	" . .
	ld hl,(lde02h)		;d881	2a 02 de 	* . .
	ld c,(hl)			;d884	4e 	N 
	inc l			;d885	2c 	, 
	ld b,(hl)			;d886	46 	F 
	inc hl			;d887	23 	# 
	set 2,h		;d888	cb d4 	. . 
	res 1,h		;d88a	cb 8c 	. . 
	ld (lde02h),hl		;d88c	22 02 de 	" . .
	or 0ffh		;d88f	f6 ff 	. . 
ld891h:
	ld a,000h		;d891	3e 00 	> .
	ld (0de06h),a		;d893	32 06 de 	2 . . 
	ret			;d896	c9 	.
;; in original file, we have nop until 0dbdfh

;------------------------------------------------------------------
; dbe0 area
;------------------------------------------------------------------
    ;; this looks like an important variable section
	org 0dbe0h
	seek 03be0h
code_p_dbe0:

var_byte_dbe0:
    defb    060h
    defb    0ffh
	;ld h,b			;dbe0	60 	`
	;rst 38h		;dbe1	ff 	.

var_byte_dbe2:
    defb    000h
    defb    000h
	;nop			;dbe2	00 	.
	;nop			;dbe3	00 	.

var_word_dbe4:
    defb 0ffh, 005h
	;rst 38h		;dbe4	ff 	.
	;dec b			;dbe5	05 	.

	nop			    ;dbe6	00 	.
	nop			    ;dbe7	00 	.

var_byte_dbe8:
    defb 081h
	;add a,c		;dbe8	81 	.

	nop			    ;dbe9	00 	.

var_byte_dbea:
    defb 001h
    defb 000h, 001h
	;ld bc,00100h		;dbea	01 00 01 	. . .

	nop			;dbed	00 	.
	nop			;dbee	00 	. 
	nop			;dbef	00 	. 
	ld bc,00000h		;dbf0	01 00 00 	. . . 
	ret po			;dbf3	e0 	. 

    defb 000h, 000h, 000h, 000h
    defb 000h, 000h, 000h, 000h
    defb 000h, 000h, 000h, 000h
end_code_p_dbe0:

    org 0dc00h
    seek 03c00h
ldc00h:
	nop			;dc00	00 	.

    org 0de00h
    seek 03e00h
lde00h:
	nop			;de00	00 	.
	nop			;de01	00 	.
lde02h:
	nop			;de02	00 	.
	nop			;de03	00 	.
lde04h:
	nop			;de04	00 	.
	nop			;de05	00 	.
lde06h:
	nop			;de06	00 	.
lde07h:
	nop			;de07	00 	.

    org 0dff0h
    seek 04ff0h
ldff0h:
	nop         ;dff0   00  .
ldff1h:
	nop         ;dff1   00  .

    org 0e7bfh
    seek 047bfh
le7bfh:
	nop         ;e7bf   00  .

    org 0e83ah
    seek 0483ah
le83ah:
	jr nz,le7bfh		;e83a	20 83

;; in original file, we have nop until 0e7ffh
	org 0e800h
	seek 04800h

code_p_endfill:
;; from here to file end, we have, in original app, the pattern "20 83"
;; so from e800/e801  to f8fe/f8ff
;; For unknown reason, we need to have this space, can be filled with e.g. nops.
;; Fill to end of file
        ;org 0f8ffh
        ;seek 058ffh
        ;defb 000h

;; to allow "cmp" to work, we use original file tail. This is the only reason for include.
;; it is safe to use the directives commented above, but then cmp will fail.
    include "origtail.asm"
_file_end:
