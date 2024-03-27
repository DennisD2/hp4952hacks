    .area APPHEADER (ABS)
    .module header
    .org 0xa000
    ;.org 0x0

    .globl _splash_start
    .globl _file_end
    .globl _launch_app
    .globl la246h
    .globl __dll_fixups_end
    .globl __init
    .globl _dll_tmp
    .globl _dll_stub

_file_start::
    .ascii "4952 Protocol Analyzer"
__end1:
    ;.org 0xa016
    ;.org 0x0016

	.word 0x03c4
	.word 0x800

    ;.org 0xa01a
    ;.org 0x001a

	.ascii "4952 Hacking the 4952           "

    ;.org 0xa102
    ;.org 0x0102

    ; fill space because we cannot move pc
    .ds 0xc8

	.globl _file_start
    .globl _file_end

_filesize:
; TODO POI001 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
; could be calculated externally, because this is: filesize value / 256 -1
; in makefile, after binary creation, it could be patched
; .word ((#_file_end - #_file_start) / 256)-1				; Blocks in file - 1
.word 0x000

    .ascii " HP4952 HAX       4952  "
	.word 0x800

_fileflags:
    .word 0x0000

    .ascii "4952 Hacking the 4952           "

    ; fill space because we cannot move pc
    .ds 0x7

    ;------------------------------------------- STRAP0 ---------------------------------
    ;; Entry Point
	;.org 0xa147
	;.org 0x147

	.globl __init

	.db 0x00
_entryaddr:
	.word #__init

    ;------------------------------------------- STRAP1 ---------------------------------
    ;; Main Application
	;.org 0xa150
	;.org 0x150

    ; fill space because we cannot move pc
    .ds 0x6

	.word #_launch_app

    ;------------------------------------------- STRAP2 ---------------------------------
    ;; ???
	;.org 0xa17e
	;.org 0x17e

    ; fill space because we cannot move pc
    .ds 0x2c

	.word #0xf958

    ;------------------------------------------- STRAP3 ---------------------------------
    ;; _load_dll_stub function
	;.org 0xa180
	;.org 0x180

    ;; Dynamic link loader data pointer & size
    .word (#__dll_fixups_end - #__dll_fixups) / 6 ; Number of patches

    .word #__dll_fixups			; Location of patches

__init:
	di				; Disable Interrupts
	call _load_dll_stub		; Call our dynamic linker

    ld de,#_splash_start		;

	ld hl,#0xa800			; Load menu data & stubs

; TODO POI005 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
; Solution: if linker cannot calculate "end-start" expression,
    ; we could do it with 16bit subtraction during runtime.
        ;push hl
        ;ld hl,#_splash_end
        ;lld bc,#_splash_start
        ;lsbc hl,bc
        ;lld b,h
        ;lld c,l
        ;lpop hl
    ; but this code overlaps next code part...
;REPLACED LINE:
;ld bc,#_splash_end-#_splash_start	;
ld bc,#0x0

	ldir				;

; call app directly or via menu function/splash
	jp _launch_app			; Use this to make an autostart
;	jp _splash_start		; Run main menu stub

__0a196h:
	ld hl,#0xa800			;
    ld de,#_splash_start		; Load menu data & stubs again?

; TODO POI007 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
ld bc,#0x0000
;ld bc,#_splash_end-#_splash_start	;
	ldir				;

	ld hl,#0x7621			;
	push hl				;
	ld a,#0x02			; Patch function at 1109?
	ld (0x110c),a			;
	ld hl,#0xd966			;
    ; POI008 Error: <a> Invalid Addressing Mode.
    ;ld (0x110d),l			;
    ld (0x110d),hl
	call 0x1109			; Main Menu andler

__0a1b3h:
	ld hl,#0xa800			;
    ld de,#_splash_start		; Load menu data & stubs again?

; TODO POI009 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
ld bc,#0x0000
;ld bc,#_splash_end-#_splash_start	;
	ldir				;

	ld hl,#0x761c			;
	ex (sp), hl			;
	ld a,#0x02			; Patch function at 1109?
	ld (0x110c),a			;
	ld hl,#0xd966			;
    ; POI010 - Error: <a> Invalid Addressing Mode.
    ;ld (0x110d),l			;
    ld (0x110d),hl			;
	call 0x1109			; Main Menu andler

	jp __0a1b3h			; Loop Forever
	ret				; How can we ever get here?

;; This is a dynamic linker, at runtime it loads a copy of the
;; ROM vector table into RAM and fixes up all the stubbed
;; ROM references in the executable

;; Load and execute ordinal patching stub from a safe location
_load_dll_stub:
	ld hl,#0xa210			;
	ld de,#0x2a00			;
	ld bc,#0x0036			;
	ldir				;
	call _dll_stub			;

	ld ix,(#0xa182)			; Load patch table from ()
	ld bc,(#0xa180)			; Load patch count
	ld l,0(ix)			;
	ld h,1(ix)			;
	ld e,(hl)			; Read L Byte
	inc hl				;
	ld d,(hl)			; Read H Byte
	ld l,2(ix)			; Get Patch Value
	ld h,3(ix)			;
	add hl,de			; Patch the pointer
	ex de,hl			;
	ld l,4(ix)			; Dest Address
	ld h,5(ix)			;
	ld (hl),e			; Write L Byte
	inc hl				;
	ld (hl),d			; Write H Byte
	ld de,#0x0006			;
	add ix,de			; Next Entry
	dec bc				;
	ld a,b				;
	or c				;
	;jr nz,$-34			; More entries?
	jr nz,.-34			; More entries?
	ret				;

;; Local temp index variable
_dll_tmp:
	.db 0x00

;------------------------------------------- STRAP4 ---------------------------------
    ;; _dll_stub function
;; 54 Bytes - Relocated at runtime to 0x2a00 and executed
	;.org 0x2a00
	;seek 00210h

_dll_stub::
	ld a,#0x04			; Access Page 4 - 10046 ROM Lower Page
	out (0x20),a		;
	ld hl,#0x8000		; Copy system ordinals from 10046 ROM
	ld de,#0x2d00		;
	ld bc,#0x0134		;
	ldir				;
	ld a,#0x02			; Access Page 2 - Application "ROM"
	out (0x20),a		;

	ld hl,(0x2d0c)		; Generate 17 more for 02e34 = 0d9f0...0da20
	ld bc,#0x0003		;
	ld a,#0x11			; .. Source appears to be a jump table
	call la246h			;

	ld hl,(0x2e16)		; Generate 68 more for 02e56 =
	ld a,(hl)			;
	inc hl				; .. (some FM going on here...)
	ld h,(hl)			;
	ld l,a				;
	ld bc,#0x0006		;
	ld a,#0x44			;
	call 0xa246			;

	ld bc,#0x0002		; Generate 30 more for 02ede = 0eb98..
	ld a,#0x1e			;
	call la246h			;
	ret				    ;

;------------------------------------------- STRAP5 ---------------------------------
	;.org 0xa246
	;.org 0x246

la246h::
	ld ix,#_dll_tmp		;
	ld 0(ix),a			;
	ld a,l				; do {
	ld (de),a			;   *DE = L
	inc de				;   DE++
	ld a,h				;
	ld (de),a			;   *DE = H
	inc de				;   DE++
	add hl,bc			;   HL+=BC
	dec 0(ix)			; } wile(TMP-- != 0)
	;jr nz,$-10			;
	jr nz,.-10			;
	ret				    ;

;------------------------------------------- STRAP6 ---------------------------------
	;.org 0xa25a
	;.org 0x25a

	.globl __dll_fixups
    .globl __dll_fixups_end

__dll_fixups::
	.word 0x2d32, 0x0000, 0x0a801
	.word 0x2e6e, 0x0000, 0x0a804
	.word 0x2d4a, 0x0000, 0x0a807
	.word 0x2d50, 0x0000, 0x0a811
	.word 0x2d6c, 0x0000, 0x0a818
	.word 0x2d02, 0x0000, 0x0a81d
	.word 0x2d02, 0x0000, 0x0a82d
	.word 0x2e32, 0x0000, 0x0a830
	.word 0x2d02, 0x0000, 0x0a835
	.word 0x2e66, 0x0003, 0x0a868
	.word 0x2e66, 0x0004, 0x0a86e
;	.word 0x2d02, 0x0000, 0x0a946
	.word 0x2ece, 0x0003, 0x0a1a8
	.word 0x2e54, 0x0000, 0x0a1ab
	.word 0x2ece, 0x0004, 0x0a1ae
	.word 0x2ece, 0x0000, 0x0a1b1
	.word 0x2ece, 0x0003, 0x0a1c5
	.word 0x2e54, 0x0000, 0x0a1c8
	.word 0x2ece, 0x0004, 0x0a1cb
	.word 0x2ece, 0x0000, 0x0a1ce
__dll_fixups_end::
    ;; until 0xa2cb
	.ds 0x533
	.db 0x00
