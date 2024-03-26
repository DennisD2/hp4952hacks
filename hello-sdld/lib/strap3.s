    .area STRAP3 (ABS)
    .module strap3_load_dll_stub
    ;; _load_dll_stub function
	;.org 0xa180
	.org 0x180

    .globl la246h
    .globl __dll_fixups_end

    ;; Dynamic link loader data pointer & size
; TODO POI002 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
; see strap6
;.word (#__dll_fixups_end - #__dll_fixups) / 6 ; Number of patches
.word 0x0000

    .globl __init
    .globl _dll_tmp
    .globl _dll_stub

    .word #__dll_fixups			; Location of patches

__init:
	di				; Disable Interrupts
	call _load_dll_stub		; Call our dynamic linker

    ld de,#_splash_start		;

	ld hl,#0xa800			; Load menu data & stubs

; TODO POI005 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
; Solution: if linker cannot calculate "end-start" expression,
; we do it with 16bit subtraction during runtime.
push hl
ld hl,#_splash_end
ld bc,#_splash_start
sbc hl,bc
ld b,h
ld c,l
pop hl
;REPLACED LINE: ld bc,#_splash_end-#_splash_start	;

	ldir				;

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
; TODO POI008 Error: <a> Invalid Addressing Mode.
ld (0x110d),a
;ld (0x110d),l			;
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
; TODO POI010 Error: <a> Invalid Addressing Mode.
ld bc,#0x0000
;ld (0x110d),l			;
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
