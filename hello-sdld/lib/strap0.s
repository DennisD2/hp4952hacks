    .area STRAP0 (ABS)
    .module strap0_entrypoint_loc
    ;; Entry Point
	;.org 0xa147
	.org 0x147

	.globl __init

	.db 0x000
_entryaddr:
	.word #__init

    .area STRAP1 (ABS)
    .module strap1_launch_app_loc
    ;; Main Application
	;.org 0xa150
	.org 0x150

	.globl _launch_app

	.word #_launch_app

    .area STRAP2 (ABS)
    .module strap2_unknown
    ;; ???
	;.org 0xa17e
	.org 0x17e
	.word #0xf958
