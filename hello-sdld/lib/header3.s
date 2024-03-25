    .area APPHEADER3 (ABS)
	;.org 0xa102
	.org 0x0102

	.globl _file_start
    .globl _file_end

_filesize:
; TODO POI001 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
; could be calculated externally, because this is: filesize value / 256 -1
; in makefile, after binary creation, it could be patched
;.word ((#_file_end - #_file_start) / 256)-1				; Blocks in file - 1
.word 0x000

    .ascii " HP4952 HAX       4952  "
	.word 0x800

_fileflags:
    .word 0x0000

    .ascii "4952 Hacking the 4952           "