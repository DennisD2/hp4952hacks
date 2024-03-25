    .area STRAP0 (ABS)
    .module strap0_entrypoint_loc
    ;; Entry Point
	;.org 0xa147
	.org 0x147

	.globl __init

	.db 0x000
_entryaddr:
	.word #__init
