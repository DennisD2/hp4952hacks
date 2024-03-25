;; crt0.s for HP4952a
;; From SDCC..

  .module crt0
  .globl  _main

  .area _HEADER (ABS)
;; Reset vector
  .org  0x2071 ;; Start from address &100
  .defb 0ffh
  jp  init

  .org  0x2200

init:

;; Stack at the top of memory.
;;  ld  sp,#0xffff
;;  I will use the Basic stack, so the program can return to basic!

;; Initialise global variables
  call    gsinit
  call  _main
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