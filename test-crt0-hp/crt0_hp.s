    .module crt0
    .globl  _main

    .area _HEADER (ABS)
    .org  0x0

    ; address offsets resulting from not possible seek/org combination (possible in za80adm,
    ; but not in sdcc. So I used the .org directive to point initial value 0xa000, which is memory
    ; address of code after being loaded from floppy.
    ; The code parts are then copied to several locations in memory using ldir opcode.
    ; There are they executed. This means that the addresses used for call op codes must be correct for
    ; final location. This is reflected by "org" in original assembler code.
    ;
    ; Here, it is tangled different way.
    ;
    ; Order of things happening is:
    ; * load code from floppy or remote connection into 0xa0000
    ; * call __init, which does copy code to target sections (0x2200 etc.)
    ; * __init also does dll fixup (reroute some public addresses to some internal addresses in ROMs)
    ; * execute __launch_app or _p_mm_launch_app. The first call would execute immediately the app. The second
    ; does just add applications menu entry to system menu. The app is executed later, when selecting the
    ; soft ḱey.
    ;
    ; For both __init and _execute_app, there are words reserved in file, at 0x147 and 0x150.
    ; This allows Operating system to find the starting point of apps.
    ;
    ; Because I can do only a single ".org" in header, otherwise the area-crossing label uses would fail,
    ; I keep the offsets to the (three) target areas where code is executed in the three defines below
    ; as offset values for related addresses.
    ;
    ; This is somehow silly, but I could not get it work in another way.
    x_org_splash    .equ 0x1800
    x_org_dllfixup  .equ 0x27f0
    x_org_header    .equ 0xa000

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
    .word #__init + #x_org_header
    ;; Main Application
    ;.org 0x150
    .ds 0x6

    .word #_launch_app + #x_org_splash

    ;; ???
    ;.org 0x17e
    .ds 0x2c
    .word #0xf958

;.org 0x180

    ;; Dynamic link loader data pointer & size
    .word (#__dll_fixups_end - #__dll_fixups) / 6 ; Number of patches

    .word #__dll_fixups	+ #x_org_header		; Location of patches

__init:
	di				; Disable Interrupts
	call _load_dll_stub + #x_org_header		; Call our dynamic linker

    ld de,#_splash_start + #x_org_splash		;

	ld hl,#0xa800 			; Load menu data & stubs

    ld bc,#_splash_end-#_splash_start  	;

	ldir				;

; call app directly or via menu function/splash
	jp _launch_app + #x_org_splash			; Use this to make an autostart
;	jp _splash_start  + #x_org_splash			; Run main menu stub

__0a196h:
	ld hl,#0xa800			;
    ld de,#_splash_start + #x_org_splash			; Load menu data & stubs again?

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
    ld de,#_splash_start + #x_org_splash		; Load menu data & stubs again?

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

	jp __0a1b3h	+ x_org_header		; Loop Forever
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
	call _dll_stub	+ #x_org_dllfixup		;

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
	call la246h	+ #x_org_header		;

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
	call la246h	+ #x_org_header		;
	ret				    ;

;------------------------------------------- STRAP5 ---------------------------------
	;.org 0xa246
	;.org 0x246

la246h::
	ld ix,#_dll_tmp	+ #x_org_header		;
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
	call l20x65	+	+ #x_org_splash		;
	ld hl,#_splash_screen_data	+ #x_org_splash	;
	push hl				;
	call 0x1cf8			; Patched to 2d50 -> 01cf8
	pop hl				;
	call l20x32	+ #x_org_splash			;
	call 0x007e			; Patched to 2d6c -> 0007e

	ld a,#0x06			; Load Page 6 (Application RAM)
	call 0x0e60			; Patched to 2d02 -> 00e60

	ld de,#0xa800			;
	ld hl,#0x2000			; Copy tis section back to A800
	ld bc,#0x0200			; now that it is Patched
	ldir				;

	ld a,#0x02			; Load Page 2
	call 0x0e60			; Patched to 2d02 -> 00e60

	jp 0x14d5			; Return via call -> 02e32 -> 014d5

l20x32:
	ld a,#0x02			; Load Page 2 (10046 ROM)
	call 0x0e60			;
	ld hl,#_splash_screen_data		+ #x_org_splash;

    ; Error: <a> Invalid Addressing Mode. ld (nn),l gives an error. I replace it with "ld (nnnn),hl"
    ;ld (0x761d),l			; Screen Paint Script Location
    ld (0x761d),hl

	ld hl,(0x761f)			; Copy main menu pointers
	ld de,#_p_main_menu_page_one	+ #x_org_splash	; over the first page menu
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
	ld de,#_p_mm_reset		+ #x_org_splash	;
	ld bc,#0x000c			;
	ldir				;

	ld hl,#_launch_app	+ #x_org_splash		; Patch our application vector
	ld (#_p_mm_launch_app	+ #x_org_splash),hl	; for button five on page two
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
	.word _p_main_menu_page_two		+ #x_org_splash  ; Next Page

_p_main_menu_page_two:
	.word _splash_menu_data	+ #x_org_splash  	;; Second Page Menu Data
_p_mm_reset::
	.word #0xbb1a			;; Entry Point for Re-Set
_p_mm_bert:
	.word 0xb22c			;; Entry Point for BERT Menu
_p_mm_remote:
	.word 0xd963			;; Entry Point for Remote & Print
_p_mm_masstorage:
	.word 0x0f0c			;; Entry Point for Mass Storage
_p_mm_launch_app::
	.word #_launch_app	+ #x_org_splash  	;; Entry Point for Application
_p_mm_selftest:
	.word #0x136f			;; Ordinal 12ah Self Test
_p_mm_next2:
	.word #_p_main_menu_page_one + #x_org_splash  	;; Next Page

_launch_app ::
	ld a, #0x06
	call 0x0e60			; Page in 6
	ld hl,#0xaa00			; Copy application to Work RAM
	ld de,#_code_start + x_org_splash 	;

	; TODO POI - add 128 bytes for C-Code start at 0xccb for testing
	ld bc,#_code_end-#_code_start ; + 0x80	;

	ldir				;
	jp _main_entry	+ #x_org_splash  		; Run the application

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
	call _clear_screen + x_org_splash

_main_loop:
	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr+ x_org_splash), a

	call _keyscan + x_org_splash

	ld hl, #_keystates+_scancode_exit+ x_org_splash
	ld a, (hl)
	cp #0x07
	jr z, _exit_prompt

	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr+ x_org_splash), a
	ld a, #0x08				; Line 1 (Top)
	ld (#_cur_y+ x_org_splash), a
	ld a, #0x02				; Column 1 (Left)
	ld (#_cur_x+ x_org_splash), a

    ; 1. orig code
	 ;ld hl, #_str_hello1+ x_org_splash
	; end 1.

	; 2. use c string
     _ext_c_string   .equ 0x0cdb
	 ld hl,#_ext_c_string + x_org_splash
    ; end 2.

    	; 2a. use c string
         _ext_c_string   .equ 0x0d00
         call _global_init + x_org_splash
         ld hl,(#_ext_c_string + x_org_splash)
    	 ;;;;;ld hl,(_ext_c_string + x_org_splash)
        ; end 2a.

    ; 3. use c function
    ; TODO can _global_init + _fun be used here?

    ;_ext_c_global_init  .equ 0x0cc2
    ;_ext_c_fun          .equ 0x0ce6
    ;call _ext_c_global_init + x_org_splash
    ;ld a,#2
    ;call _ext_c_fun + x_org_splash
	;ld h,d
	;ld l,e
    ; end 3.
	call _writestring + x_org_splash

	jr _main_loop

_exit_prompt:
	call _clear_screen + x_org_splash

	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr + x_org_splash), a
	ld a, #0x08				; Line 1 (Top)
	ld (#_cur_y + x_org_splash), a
	ld a, #0x02				; Column 1 (Left)
	ld (#_cur_x + x_org_splash), a

	ld hl, #_str_exit + x_org_splash
	call _writestring + x_org_splash

_wait_exit:
	call _keyscan + x_org_splash

	call _getkey_wait + x_org_splash
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
	call _clear_screen + x_org_splash

	jp 0x14d5   				; Return to main menu.

   .include "lib/string.s"
   .include "lib/screen.s"
     ;.include "lib/printf.s"
   .include "lib/keyb.s"

_c_code_here::
    .dw 0xaffe
    .ds 0x100
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
