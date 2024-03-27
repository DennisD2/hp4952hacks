    .area APP (ABS)
    ;; splash screen and menu startup code and data
    .module app_launch
	.org 0x2071
	;seek 00871h

    ;.globl _code_start
    ;.globl _code_end
    ;.globl _main_entry
    ;.globl _scrattr_ascii_n

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

_launch_app ::
	ld a, #0x06
	call 0x0e60			; Page in 6
	ld hl,#0xaa00			; Copy application to Work RAM
	ld de,#_code_start		;
	; TODO - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
	;ld bc,#_code_end-#_code_start	;
	ld bc,#0x0
	ldir				;
	jp _main_entry			; Run the application

_splash_end::
;; End of menu section

; nothing until aa00-1
    .ds 0xba
	.db 0x00