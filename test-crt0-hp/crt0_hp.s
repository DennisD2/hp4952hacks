    .module crt0
    .globl  _main

    .area _HEADER (ABS)
    .org  0x0

_file_start:
    .ascii "4952 Protocol Analyzer"

    ;.org 0x0016
    .word 0x03c4
    .word 0x0800

    ;.org 0x001a
    .ascii "4952 Hacking the 4952           "

    ;.org 0x0102
    .ds 0xc8

_filesize:
    .word ((#_file_end - #_file_start) / 256)-1				; Blocks in file - 1, but min=1
    ;.word 0x0001

    .ascii " HP4952 HAX       4952  "
    .word 0x0800

_fileflags:
    .word 0x0000

    .ascii "4952 Hacking the 4952           "

    ; fill space because we cannot move pc
    .ds 0x7

    ;; Entry Point
    ;.org 0x147
    .db 0x00
_entryaddr:
    .word #__init + #0xa000
    ;; Main Application
    ;.org 0x150
    .ds 0x6

    .word #_launch_app + #0x1800

    ;; ???
    ;.org 0x17e
    .ds 0x2c
    .word #0xf958

;.org 0x180

    ;; Dynamic link loader data pointer & size
    .word (#__dll_fixups_end - #__dll_fixups) / 6 ; Number of patches

    .word #__dll_fixups	+ #0xa000		; Location of patches

__init:
	di				; Disable Interrupts
	call _load_dll_stub + #0xa000		; Call our dynamic linker

    ld de,#_splash_start + #0x1800		;

	ld hl,#0xa800 			; Load menu data & stubs

    ld bc,#_splash_end-#_splash_start  	;

	ldir				;

; call app directly or via menu function/splash
	jp _launch_app + #0x1800			; Use this to make an autostart
;	jp _splash_start  + #0x1800			; Run main menu stub

__0a196h:
	ld hl,#0xa800			;
    ld de,#_splash_start + #0x1800			; Load menu data & stubs again?

    ld bc,#_splash_end-#_splash_start	;
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
    ld de,#_splash_start + #0x1800		; Load menu data & stubs again?

    ld bc,#_splash_end-#_splash_start	;
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

	jp __0a1b3h	+0xa000		; Loop Forever
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
	call _dll_stub	+ #0x27f0		;

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
	call la246h	+ #0xa000		;

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
	call la246h	+ #0xa000		;
	ret				    ;

;------------------------------------------- STRAP5 ---------------------------------
	;.org 0xa246
	;.org 0x246

la246h::
	ld ix,#_dll_tmp	+ #0xa000		;
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

	;.org 0xa25a
	;.org 0x25a


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

;;;;;;;;;;;;;;;;;;;;; STRAP AREA
    ;.area STRAP (ABS,OVR)
    ;.module strap
    ;; _splash_start function
    ;; Relocated at runtime from 0xa800 to 02000
	;; TODO  .org 0x2000
	;seek 00800h

_splash_start::
	call 0x1543			; Patched to 2d32 -> 01543
	call 0x0fe9			; Patched to 2e6e -> 00fe9
	call 0x0085			; Patched to 2d4a -> 00085
	call l20x65	+	+ #0x1800		;
	ld hl,#_splash_screen_data	+ #0x1800	;
	push hl				;
	call 0x1cf8			; Patched to 2d50 -> 01cf8
	pop hl				;
	call l20x32	+ #0x1800			;
	call 0x007e			; Patched to 2d6c -> 0007e

	ld a,#0x06			; Load Page 6 (Application RAM)
	call 0x0e60			; Patched to 2d02 -> 00e60

	ld de,#0xa800			;
	ld hl,#0x2000			; Copy tis section back to A800
	ld bc,#0x0200			; now tat it is Patched
	ldir				;

	ld a,#0x02			; Load Page 2
	call 0x0e60			; Patched to 2d02 -> 00e60

	jp 0x14d5			; Return via call -> 02e32 -> 014d5

l20x32:
	ld a,#0x02			; Load Page 2 (10046 ROM)
	call 0x0e60			;
	ld hl,#_splash_screen_data		+ #0x1800;

    ; Error: <a> Invalid Addressing Mode. ld (nn),l gives an error. I replace it with "ld (nnnn),hl"
    ;ld (0x761d),l			; Screen Paint Script Location
    ld (0x761d),hl

	ld hl,(0x761f)			; Copy main menu pointers
	ld de,#_p_main_menu_page_one	+ #0x1800	; over the first page menu
	ld (0x761f),de			; pointers in our table
	ld (0x7624),de			;
	ld bc,#0x000e			;
	ldir				;

	ld a,(hl)			;
	inc hl				;
	ld h,(hl)			;
	ld l,a				;
	inc hl				; Skip to page two...
	inc hl				;
	ld de,#_p_mm_reset		+ #0x1800	;
	ld bc,#0x000c			;
	ldir				;

	ld hl,#_launch_app	+ #0x1800		; Patch our application vector
	ld (#_p_mm_launch_app	+ #0x1800),hl	; for button five on page two
	ret				;

l20x65:
	ld a,#0x06			; Patch 00fd4 -> our menu display function
	ld (0x0fd4),a			;
	ld hl,#0xa196			;
	ld (0x0fd5),hl			;
	ret				;

;;; APP1 AREA
    ;.area APP1 (ABS,OVR)
    ;; splash screen and menu startup code and data
    ; .module app_launch
	; TODO .org 0x2071
	;seek 00871h

    ; repeat from screen.s
    _scrattr_ascii_n	.equ 0x83

_splash_screen_data::
	.db 0xff

	.db 0x02, 0x0d, _scrattr_ascii_n
	.asciz "HP 4952A"
	.db 0x03, 0x07, _scrattr_ascii_n
	.asciz "Open Source Software"

	.db 0x07, 0x0b, _scrattr_ascii_n
	.asciz "Hello World"

	.db 0x0c, 0x08, _scrattr_ascii_n
	.asciz "Hacking the 4952"
	.db 0x0d, 0x09, _scrattr_ascii_n
	.asciz "based on hackaday.io"

	.db 0x00							;; End of Screen Data

_splash_menu_data:
	.ascii "Re-!BERT!Remote!Mass !Hell!Self~"
	.ascii "set!Menu!&Print!Store!o   !Test|"

_p_main_menu_page_one::
	.word #0x8336			;; First Page Menu Data
_p_mm_autoconfig:
	.word 0x141c			;; Ordinal 120h Auto Config
_p_mm_setup:
	.word 0xb5a8			;; Entry Point for Setup
_p_mm_mon:
	.word 0x100d			;; Entry Point for Monitor Menu
_p_mm_sim:
	.word 0x1013			;; Entry Point for Sim Menu
_p_mm_run:
	.word 0xb9ff			;; Entry Point for Run Menu
_p_mm_exam:
	.word 0x13cd			;; Ordinal 12eh Examine Data
_p_mm_next1:
	.word _p_main_menu_page_two		+ #0x1800  ; Next Page

_p_main_menu_page_two:
	.word _splash_menu_data	+ #0x1800  	;; Second Page Menu Data
_p_mm_reset::
	.word #0xbb1a			;; Entry Point for Re-Set
_p_mm_bert:
	.word 0xb22c			;; Entry Point for BERT Menu
_p_mm_remote:
	.word 0xd963			;; Entry Point for Remote & Print
_p_mm_masstorage:
	.word 0x0f0c			;; Entry Point for Mass Storage
_p_mm_launch_app::
	.word #_launch_app	+ #0x1800  	;; Entry Point for Application
_p_mm_selftest:
	.word #0x136f			;; Ordinal 12ah Self Test
_p_mm_next2:
	.word #_p_main_menu_page_one + #0x1800  	;; Next Page

_launch_app ::
	ld a, #0x06
	call 0x0e60			; Page in 6
	ld hl,#0xaa00			; Copy application to Work RAM
	ld de,#_code_start + 0x1800 	;
	ld bc,#_code_end-#_code_start + 0x370	;
	ldir				;
	jp _main_entry	+ #0x1800  		; Run the application

_splash_end::
;; End of menu section

; nothing until aa00-1
    .ds 0xba
	.db 0x00

;;;;;; APP2 AREA
    ;.area APP2 (ABS,OVR)
    ;; Main Application
    ;.module app_main
	; TODO .org 0x2200
	;seek 0xa00

_code_start::

_str_hello1:
	.asciz "Hello World 1"

_str_exit:
	.asciz "Are you sure you wish to exit?"

_main_entry::
	call _clear_screen

_main_loop:
	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr), a

	call _keyscan

	ld hl, #_keystates+_scancode_exit
	ld a, (hl)
	cp #0x07
	jr z, _exit_prompt

	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr), a
	ld a, #0x08				; Line 1 (Top)
	ld (#_cur_y), a
	ld a, #0x02				; Column 1 (Left)
	ld (#_cur_x), a

	ld hl, #_str_hello1
	call _writestring

	jr _main_loop

_exit_prompt:
	call _clear_screen

	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr), a
	ld a, #0x08				; Line 1 (Top)
	ld (#_cur_y), a
	ld a, #0x02				; Column 1 (Left)
	ld (#_cur_x), a

	ld hl, #_str_exit
	call _writestring

_wait_exit:
	call _keyscan

	call _getkey_wait
	cp #'y'
	jr z, _real_exit
	cp #'Y'
	jr z, _real_exit

	cp #'n'
	jr z, _main_entry
	cp #'N'
	jr z, _main_entry

	jr _wait_exit

_real_exit:
	call _clear_screen

	jp 0x14d5   				; Return to main menu.

   .include "lib/string.s"
   .include "lib/screen.s"
     ;.include "lib/printf.s"
   .include "lib/keyb.s"

_code_end::

;; End of Main Application

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; End file with padded bytes. File length must be multiple of 256.
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_file_end::
;; Fill to end of file
	;.org 0x10ff
	;.org 0xb0ff
	;seek 0x10ff

	;;; TODO: 7 is #bytes after _padded_end - will change!!!
	.ds ( #_file_start - #_file_end + 7) % 256
	.db 0x33
_padded_end::


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; some defs for C follow
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initialise global variables
   call    gsinit

   ;; here we would call main
   ;;call  _main

   jp  _exit

  ;; Ordering of segments for the linker.
  .area _HOME
  .area _CODE
  .area   _GSINIT
  .area   _GSFINAL
        
  .area _DATA
  .area   _BSS
  .area   _HEAP

  .area   _CODE
__clock::
  ret

_exit::
  ret
  
  .area   _GSINIT
gsinit::

.area   _GSFINAL
  ret
