    ;.include "lib/header.s"
    ;.include "lib/strap.s"

    .area APP (ABS)
    ;; splash screen and menu startup code and data
    .module app_launch
	;.org 0x2071
	;seek 00871h
	; TODO POI022 - I do not understand whats happening in original.
	; there, _dll_stub is located at and behind 0x800, due to seek 0x800
	; with SDCC, there is no seek and so a ".org 0x2000" would put the ocde to 0x2000
	; Currently I just define .org to 0x800 to have the bytes at correct place.
	; it this is copied later and then has wrong addresses somehow, how to solve?
	.org 0x871

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
	.word _p_main_menu_page_two	;; Next Page
_p_main_menu_page_two:
	.word _splash_menu_data		;; Second Page Menu Data
_p_mm_reset::
	.word #0xbb1a			;; Entry Point for Re-Set
_p_mm_bert:
	.word 0xb22c			;; Entry Point for BERT Menu
_p_mm_remote:
	.word 0xd963			;; Entry Point for Remote & Print
_p_mm_masstorage:
	.word 0x0f0c			;; Entry Point for Mass Storage
_p_mm_launch_app::
	.word #_launch_app		;; Entry Point for Application
_p_mm_selftest:
	.word #0x136f			;; Ordinal 12ah Self Test
_p_mm_next2:
	.word #_p_main_menu_page_one	;; Next Page

_launch_app::
	ld a, #0x06
	call 0x0e60			; Page in 6
	ld hl,#0xaa00			; Copy application to Work RAM
	ld de,#_code_start		;
	ld bc,#_code_end-#_code_start	;
	ldir				;
	jp _main_entry			; Run the application

_splash_end:
;; End of menu section

    .area APP (ABS)
    ;; Main Application
    .module app_main
	;.org 0x2200
	;seek 0xa00
	; TODO POI023 - I do not understand whats happening in original.
	; there, _dll_stub is located at and behind 0x800, due to seek 0x800
	; with SDCC, there is no seek and so a ".org 0x2000" would put the ocde to 0x2000
	; Currently I just define .org to 0x800 to have the bytes at correct place.
	; it this is copied later and then has wrong addresses somehow, how to solve?
	.org 0xa00
_code_start:

_str_hello1:
	.asciz "Hello World 1"

_str_exit:
	.asciz "Are you sure you wish to exit?"

_main_entry:
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

	jp 0x14d5				; Return to main menu.


    .include "lib/string.s"
    .include "lib/screen.s"
;.include "lib/printf.asm"
    .include "lib/keyb.s"


_code_end:

;; End of Main Application

;; Fill to end of file
	.org 0x10ff
	;.org 0xb0ff
	;seek 0x10ff
	.db 0x00
_file_end::