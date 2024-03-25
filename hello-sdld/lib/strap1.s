    .area STRAP1 (ABS)
    .module strap1_launch_app_loc
    ;; Main Application
	;.org 0xa150
	.org 0x150

	.globl _launch_app

	.word #_launch_app
