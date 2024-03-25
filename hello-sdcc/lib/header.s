
	.org 0xa000

    .globl _file_start
    .globl _file_end
_file_start:
    .ascii "4952 Protocol Analyzer"

	.org 0xa016
	.word 0x03c4
	.word 0x800

	.org 0xa01a
	.ascii "4952 Hacking the 4952           "

	.org 0xa102
_filesize:
; TODO POI001 - Error: <r> Arg1 - Arg2, Arg2 must be in same area.
;.word ((#_file_end - #_file_start) / 256)-1				; Blocks in file - 1
.word 0x000

    .ascii " HP4952 HAX       4952  "
	.word 0x800

_fileflags:
    .word 0x0000

    .ascii "4952 Hacking the 4952           "