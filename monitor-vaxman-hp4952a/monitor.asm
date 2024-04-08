
HP_4952_Target:      equ 0x01
CPC_Target:          equ 0x00

DISASS:                 equ 0x00

if HP_4952_Target == 0x01
;****************************************************************************************
; HP4952 header start
;****************************************************************************************
    include "lib/header.asm"
    include "lib/strap.asm"

	org 02071h
	seek 00871h
_splash_screen_data:
	defb 0ffh

	defb 002h, 00dh, _scrattr_ascii_n
	defb "HP 4952A", 000h
	defb 003h, 007h, _scrattr_ascii_n
	defb "Open Source Software", 000h

	defb 007h, 00bh, _scrattr_ascii_n
	defb "Monitor", 000h

	defb 00ch, 008h, _scrattr_ascii_n
	defb "Hacking the 4952", 000h
	defb 00dh, 009h, _scrattr_ascii_n
	defb "A system monitor app", 000h

	defb 000h							;; End of Screen Data

_splash_menu_data:
	defb "Re-!BERT!Remote!Mass !Moni!Self~"
	defb "set!Menu!&Print!Store!tor !Test|"

_p_main_menu_page_one:
	defw 08336h			;; First Page Menu Data
_p_mm_autoconfig:
	defw 0141ch			;; Ordinal 120h Auto Config
_p_mm_setup:
	defw 0b5a8h			;; Entry Point for Setup
_p_mm_mon:
	defw 0100dh			;; Entry Point for Monitor Menu
_p_mm_sim:
	defw 01013h			;; Entry Point for Sim Menu
_p_mm_run:
	defw 0b9ffh			;; Entry Point for Run Menu
_p_mm_exam:
	defw 013cdh			;; Ordinal 12eh Examine Data
_p_mm_next1:
	defw _p_main_menu_page_two	;; Next Page

_p_main_menu_page_two:
	defw _splash_menu_data		;; Second Page Menu Data
_p_mm_reset:
	defw 0bb1ah			;; Entry Point for Re-Set
_p_mm_bert:
	defw 0b22ch			;; Entry Point for BERT Menu
_p_mm_remote:
	defw 0d963h			;; Entry Point for Remote & Print
_p_mm_masstorage:
	defw 00f0ch			;; Entry Point for Mass Storage
_p_mm_launch_app:
	defw _launch_app		;; Entry Point for Application
_p_mm_selftest:
	defw 0136fh			;; Ordinal 12ah Self Test
_p_mm_next2:
	defw _p_main_menu_page_one	;; Next Page

_launch_app:
	ld a, 006h
	call 00e60h			; Page in 6
	ld hl,0aa00h			; Copy application to Work RAM
	ld de,_code_start		;
	ld bc,_code_end-_code_start	;
	ldir				;
	jp _main_entry			; Run the application

_splash_end:
;; End of menu section

;; Main Application
	org 2200h
	seek 0a00h
_code_start:

_str_exit:
	defb "Are you sure you wish to exit?", 000h

_main_entry:
	call initialize

;****************************************************************************************
; HP4952 header end
;****************************************************************************************
endif



;******************************************************************************
;
;  Small monitor for the Z80 single board computer consisting of 32 kB ROM
; (00000h to 0ffffh), 32 kBADD32 RAM (08000h to 0ffffh) and a 16c550 UART.
;
; B. Ulmann, 28-SEP-2011, 29-SEP-2011, 01-OCT-2011, 02-OCT-2011, 30-OCT-2011,
;            01-NOV-2011, 02-NOV-2011, 03-NOV-2011, 06/07/08-JAN-2012
; I. Kloeckl, 06/07/08-JAN-2012 (FAT implementation for reading files)
; B. Ulmann, 14-JAN-2011,
;
; Version 0.8
;
;******************************************************************************
;
; TODO;
;       Read and print IDE error status codes in case of error!
;
; Known issues;
;       Memory Dump has a problem when the end address is >= FF00
;
;******************************************************************************
;
;  RST 000h will enter the monitor (do not care about the return address pushed
; onto the stack - the stack pointer will be reinitialized during cold as well
; as during warm starts.
;
;  Monitor routines will generally called by placing the necessary parameters
; into some processor registers and then issuing RST 008h. More about this later.
;
;  Memory layout is as follows;
;
;  +-------+
;  ! 0FFFFh !    General purpose 512 byte buffer
;  !  ---  !
;  ! 0FE00h !
;  +-------+
;  ! 0DFFFh !    FAT control block
;  !  ---  !
;  ! 0FDDCh !
;  +-------+
;  ! 0FDDBh !    File control block
;  !  ---  !
;  ! 0FBBEh !
;  +-------+
;  ! 0FBBDh !    81 byte string buffer
;  !  ---  !
;  ! 0FB6Dh !
;  +-------+
;  ! 0FB6Ch !    12 byte string buffer
;  !  ---  !
;  ! 0FB61h !
;  +-------+
;  ! 0FB60h !    Buffers for various routines
;  !  ---  !
;  ! 0FB4Dh !
;  +-------+
;  ! 0FB4Ch !    Cold/warm start control (1 byte)
;  +-------+
;  ! 0FBBDh !    Stack
;  !  ...  !
;  ! 08000h !    Begin of RAM
;  +-------+
;  ! 07FFFh !    ROM area
;  !  ---  !    RST 008h calls a system routine
;  ! 00000h !    RST 000h restarts the monitor
;  +-------+
;
;
;monitor_start:   equ     00000h           ; 00000h -> ROM, 08000h -> Test image
;
;                org     monitor_start
;
;rom_start:       equ     00h
;rom_end:         equ     07fffh
ram_start:       equ     08000h
ram_end:         equ     0ffffh
buffer:          equ     ram_end - 01ffh  ; 512 byte IDE general purpose buffer
;
; Define the FAT control block memory addresses:
;
datastart:       equ     buffer - 4      ; Data area start vector
rootstart:       equ     datastart - 4   ; Root directory start vector
fat1start:       equ     rootstart - 4   ; Start vector to first FAT
psiz:            equ     fat1start - 4   ; Size of partition (in sectors)
pstart:          equ     psiz - 4        ; First sector of partition
rootlen:         equ     pstart - 2      ; Maximum number of entries in directory
fatsec:          equ     rootlen - 2     ; FAT size in sectors
ressec:          equ     fatsec - 2      ; Number of reserved sectors
clusiz:          equ     ressec - 1      ; Size of a cluster (in sectors)
fatname:         equ     clusiz - 9      ; Name of the FAT (null terminated)
fatcb:           equ     fatname         ; Start of the FATCB
;
; Define a file control block (FCB) memory addresses and displacements:
;
file_buffer:     equ     fatcb - 0200h            ; 512 byte sector buffer
cluster_sector:  equ     file_buffer - 1         ; Current sector in cluster
current_sector:  equ     cluster_sector - 4      ; Current sector address
current_cluster: equ     current_sector - 2      ; Current cluster number
file_pointer:    equ     current_cluster - 4     ; Pointer for file position
file_type:       equ     file_pointer - 1        ; 0 -> not found, else OK
first_cluster:   equ     file_type - 2           ; First cluster of file
file_size:       equ     first_cluster - 4       ; Size of file
file_name:       equ     file_size - 12          ; Canonical name of file
fcb:             equ     file_name               ; Start of the FCB
;
;fcb_filename:            equ     0
;fcb_file_size:           equ     0ch
;fcb_first_cluster:       equ     010h
;fcb_file_type:           equ     012h
;fcb_file_pointer:        equ     013h
;fcb_current_cluster:     equ     017h
;fcb_current_sector:      equ     019h
;fcb_cluster_sector:      equ     01dh
;fcb_file_buffer:         equ     01eh
;
; We also need some general purpose string buffers:
;
string_81_bfr:   equ     fcb - 81
string_12_bfr:   equ     string_81_bfr - 12
;
;  A number of routines need a bit of scratch RAM, too. Since these are
; sometimes interdependent, each routine gets its own memory cells (only
; possible since the routines are not recursive).
;
load_file_scrat: equ     string_12_bfr - 2       ; Two bytes for load_file
str2filename_de: equ     load_file_scrat - 2     ; Two bytes for str2filename
fopen_eob:       equ     str2filename_de - 2     ; Eight bytes for fopen
fopen_rsc:       equ     fopen_eob - 4
fopen_scr:       equ     fopen_rsc - 2
dirlist_scratch: equ     fopen_scr - 2           ; Eight bytes for fopen
dirlist_eob:     equ     dirlist_scratch - 2
dirlist_rootsec: equ     dirlist_eob - 4
;
start_type:      equ     dirlist_rootsec  - 01h   ; Distinguish cold/warm start
;
;uart_base:       equ     00h
;ide_base:        equ     010h
;
;uart_register_0: equ     uart_base + 0
;uart_register_1: equ     uart_base + 1
;uart_register_2: equ     uart_base + 2
;uart_register_3: equ     uart_base + 3
;uart_register_4: equ     uart_base + 4
;uart_register_5: equ     uart_base + 5
;uart_register_6: equ     uart_base + 6
;uart_register_7: equ     uart_base + 7
;
eos:             equ     000h             ; End of string
cr:              equ     00dh             ; Carriage return
lf:              equ     00ah             ; Line feed
space:           equ     020h             ; Space
tab:             equ     009h             ; Tabulator
;
; Main entry point (RST 00H);
;
rst_00:         di                      ; Disable interrupts
                jr      initialize      ; Jump over the RST-area
;
;  RST-area - here is the main entry point into the monitor. The calling
; standard looks like this;
;
; 1) Set register IX to the number of the system routine to be called.
; 2) Set the remaining registers according to the routine's documentation.
; 3) Execute RST 008h to actually call the system routine.
; 4) Evaluate the values returned in the registers as described by the
;    Routine's documentation.
;
;  (Currently there are no plans to use more RST entry points, so this routine
; just runs as long as necessary in memory. If more RSTs will be used, this
; routine should to be moved to the end of the used ROM area with only a
; simple jump at the RST 008-hlocation.)
;
;  This technique of calling system routines can be used as the following
; example program that just echos characters read from the serial line
; demonstrates;
;
;         org     08000h           ; Start in lower RAM
; loop    ld      ix, 5           ; Prepare call to getc
;         rst     08              ; Execute getc
;         cp      3               ; CTRL-C pressed?
;         jr      z, exit         ; Yes - exit
;         ld      ix, 6           ; Prepare call to putc
;         rst     08              ; Execute putx
;         jr      loop            ; Process next character
; exit    ld      ix, 4           ; Exit - print a CR/LF pair
;         rst     08              ; Call CRLF
;         ld      hl, msg         ; Pointer to exit message
;         ld      ix, 7           ; Prepare calling puts
;         rst     08              ; Call puts
;         rst     00              ; Restart monitor (warm start)
; msg;     defb    "That's all folks.", 0dh, 0ah, 0
;
;  Currently the following functions are available (a more detailed description
; can be found in the dispatch table itself);
;
;       0;      cold_start
;       1;      is_hex
;       2;      is_print
;       3;      to_upper
;       4;      crlf
;       5;      getc
;       6;      putc
;       7;      puts
;       8;      strcmp
;       9;      gets
;       A;      fgetc
;       B;      dump_fcb
;       C;      fopen
;       D;      dirlist
;       E;      fatmount
;       F;      fatunmount
;
;                org     monitor_start + 008h
                nop                     ; Beware; zasm is buggy concerning
                nop                     ; the org pseudo-statement. Therefore
                nop                     ; The displacement to the RST 008h
                nop                     ; entry point is generated by this
                nop                     ; NOP-s:equence.
rst_08:         push    bc              ; Save bc and hl
                push    hl
                push    ix              ; Copy the contents of ix
                pop     hl              ; into hl
                add     hl, hl          ; Double to get displacement in table
                ld      bc, dispatch_table
                add     hl, bc          ; Calculate displacement in table

                ;;;;;;;;;ld      bc, (hl)        ; Load bc with the destination address
                push ix         ; save ix
                push hl         ; move hl to ix via stack
                pop ix          ;
                ld b,(ix+0)     ; b ;= (ix)
                ld c,(ix+1)     ; c ;= (ix+1)
                pop ix          ; restore ix

                push    bc
                pop     ix              ; Load ix with the destination address
                pop     hl              ; Restore hl
                pop     bc              ; and bc
                jp      (ix)            ; Jump to the destination routine
dispatch_table: ; defw    cold_start      ; 000h = clear etc.
                ; Parameters;    N/A
                ; Action;        Performs a cold start (memory is cleared!)
                ; Return values; N/A
                ;
                defw    is_hex
                ; Parameters;    A contains a character code
                ; Action;        Tests ('0' <= A <= '9) || ('A' <= A <= 'F')
                ; Return values; Carry bit is set if A contains a hex char.
                ;
                defw    is_print
                ; Parameters;    A contains a charater code
                ; Action;        Tests if the character is printable
                ; Return values; Carry bit is set if A contains a valid char.
                ;
                defw    to_upper
                ; Parameters;    A contains a character code
                ; Action;        Converts an ASCII character into upper case
                ; Return values; Converted character code in A
                ;
                defw    crlf
                ; Parameters;    N/A
                ; Action;        Sends a CR/LF to the serial line
                ; Return values; N/A
                ;
                defw    getc
                ; Parameters;    A contains a character code
                ; Action;        Reads a character code from the serial line
                ; Return values; N/A
                ;
                defw    putc
                ; Parameters;    A contains a character code
                ; Action;        Sends the character code to the serial line
                ; Return values; N/A
                ;
                defw    puts
                ; Parameters;    HL contains the address of a 0-terminated
                ;                string
                ; Action;        Send the string to the serial line (excluding
                ;                the termination byte, of course)
                ; Return values; N/A
                ;
                defw    strcmp
                ; Parameters;    HL and DE contain the addresses of two strings
                ; Action;        Compare both strings.
                ; Return values; A contains return value, <0 / 0 / >0
                ;
                defw    gets
                ; Parameters;    HL contains a buffer address, B contains the
                ;                buffer length (including the terminating
                ;                null byte!)
                ; Action;        Reads a string from STDIN. Terminates when
                ;                either the buffer is full or the string is
                ;                terminated by CR/LF.
                ; Return values; N/A
                ;
;
;  The stackpointer will be predecremented by a push instruction. Since we need
; a 512 byte buffer for data transfers to and from the IDE disk, the stack
; pointer is initialized to start at the beginning of this buffer space.
;
initialize:      ;ld      sp, start_type - 01h
;
; Initialize UART to 9600,8N1;
;
                ;ld      a, 080h
                ;out     (uart_register_3), a
                ;ld      a, 0ch           ; 1843200 / (16 * 9600)
                ;out     (uart_register_0), a
                ;xor     a
                ;out     (uart_register_1), a
                ;ld      a, 03h           ; 8N1
                ;out     (uart_register_3), a
;
; Print welcome message;
;
                call    _clear_screen
                ld      hl, hello_msg
                call    puts
;
;  If this is a cold start (the location start_type does not contain 0aah)
; all available RAM will be reset to 000h and a message will be printed.
;
                ;ld      a, (start_type)
                ;cp      0aah             ; Warm start?
                ;jr      z, main_loop    ; Yes - enter command loop
                jr      main_loop
                ;ld      hl, cold_start_msg
                ;call    puts            ; Print cold start message
                ;ld      hl, ram_start   ; Start of block to be filled with 000h

                ;;;;;;;;; next line is in original source, but it is not a valid Z80 op code ?!?
                ;;;;;;;;;ld      de, hl          ; End address of block
                ;;;;;;;;; relacement code
                ;push hl         ; move hl to de via stack
                ;pop de          ;

                ;inc     de              ; plus 1 (for ldir)
                ;ld      bc, ram_end - ram_start
                ;ld      (hl), 000h       ; Load first memory location
                ;ldir                    ; And copy this value down
                ;ld      hl, start_type
                ;ld      (hl), 0aah       ; Cold start done, remember this
;
; Read characters from the serial line and send them just back;
;
main_loop:      ld      hl, monitor_prompt
                call    puts
; The monitor is rather simple; All commands are just one or two letters.
; The first character selects a command group, the second the desired command
; out of that group. When a command is recognized, it will be spelled out
; automatically and the user will be prompted for arguments if applicable.
                call    monitor_key     ; Read a key
; Which group did we get?
                cp      'C'             ; Control group?
                jr      nz, help_group  ; No - test next group
                ;jr      nz, disk_group  ; No - test next group

                ld      hl, cg_msg      ; Print group prompt
                call    puts
                call    monitor_key     ; Get command key

                ;cp      'C'             ; Cold start?
                ;jp      z, cold_start
                ;cp      'W'             ; Warm start?
                ;jp      z, warm_start
                cp      'S'             ; Start?
                jp      z, start
                cp      'X'             ; exit app?
                jp      z, app_exit
                cp      'I'             ; Info?
                call    z, info
                jr      z, main_loop
                jp      cmd_error       ; Unknown control-group-command

help_group:     cp      'H'             ; Help? (No further level expected.)
                call    z, help         ; Yes ;-)
                jp      z, main_loop

memory_group:   cp      'M'             ; Memory group?
                jp      nz, dump_group  ; No - test next group
                ld      hl, mg_msg      ; Print group prompt
                call    puts
                call    monitor_key     ; Get command key
                jp      z, main_loop    ; no input, continue

                cp      'E'             ; Examine?
                call    z, examine
                jp      z, main_loop
                cp      'F'             ; Fill?
                call    z, fill
                jp      z, main_loop
                ;cp      'I'             ; INTEL-Hex load?
                ;call    z, ih_load
                ;jp      z, main_loop
                cp      'L'             ; Load?
                call    z, load
                jp      z, main_loop
                cp      'M'             ; Move?
                call    z, move
                jp      z, main_loop
                jr      cmd_error       ; Unknown memory-group-command

dump_group:    cp      'D'             ; Dump group?
               jp      nz, group_error ; No - print an error message
               ld      hl, dg_msg      ; Print group prompt
               call    puts
               call    monitor_key     ; Get command key
               jp      z, main_loop    ; no input, continue

               cp      'R'             ; Register dump?
               call    z, rdump
               jp      z, main_loop
               cp      'M'             ; Memory dump?
               call    z, mdump
               jp      z, main_loop
if DISASS == 0x01
               cp      'D'             ; Disassemble?
               call    z, disassemble
endif
               jp      z, main_loop

               jr      cmd_error       ; Unknown memory-group-command

group_error:    ld      hl, group_err_msg
                jr      print_error
cmd_error:      ld      hl, command_err_msg
print_error:    call    putc            ; Echo the illegal character
                call    puts            ; and print the error message
                jp      main_loop
;
; Some constants for the monitor;
;                defb    "                                ", cr, lf,
hello_msg:       defb    cr, lf, cr, lf
                 defb    "Simple Z80-monitor - V 0.9.4", cr, lf
                 defb    " (B. Ulmann, Sep.2011-Jan.2012)", cr, lf
                 defb    " adapted Apr. 2024 spurtikus.de", cr, lf, eos
monitor_prompt:  defb    cr, lf
                 defb     "Z> ", eos
cg_msg:          defb    "CONTROL/", eos
mg_msg:          defb    "MEMORY/", eos
dg_msg:          defb    "DUMP/", eos
command_err_msg: defb    ": Syntax error - command not found!", cr, lf, eos
group_err_msg:   defb    ": Syntax error - group not found!", cr, lf, eos
;
; Read a key for command group and command;
;
monitor_key:    call    getc
                cp      lf              ; Ignore LF
                jr      z, monitor_key  ; Just get the next character
                call    to_upper
                cp      cr              ; A CR will return to the prompt
                ret     nz              ; No - just return
                inc     sp              ; Correct SP to and avoid ret!
                jp      main_loop
;
;******************************************************************************
;***
;*** The following routines are used in the interactive part of the monitor
;***
;******************************************************************************
n_dump_bytes:             equ     005h             ; dumped bytes per line
;
; Dump a memory area
;
mdump:          push    af
                push    bc
                push    de
                push    hl
                ld      hl, dump_msg_1
                call    puts            ; Print prompt
                call    get_word        ; Read start address
                push    hl              ; Save start address
                ld      hl, dump_msg_2  ; Prompt for end address
                call    puts
                call    get_word        ; Get end address
                call    crlf
                inc     hl              ; Increment stop address for comparison

                ;;;;;;;;;ld      de, hl          ; DE now contains the stop address
                push hl         ; move hl to de via stack
                pop de          ;

                pop     hl              ; HL is the start address again
                ; This loop will dump 16 memory locations at once - even
                ; if this turns out to be more than r:equested.
dump_line:      ld      b, n_dump_bytes          ; This loop will process n_dump_bytes bytes
                push    hl              ; Save HL again
                call    print_word      ; Print address
                ld      hl, dump_msg_3  ; and a colon
                call    puts
                pop hl                  ; Restore address
                push    hl              ; We will need HL for the ASCII dump
dump_loop:      ld      a, (hl)         ; Get the memory content
                call    print_byte      ; and print it
                ld      a, ' '          ; Print a space
                call    putc
                inc     hl              ; Increment address counter
                djnz    dump_loop       ; Continue with this line
                ; This loop will dump the very same 16 memory locations - but
                ; this time printable ASCII characters will be written.
                ld      b, n_dump_bytes          ; n_dump_bytes characters at a time
                ld      a, ' '          ; We need some spaces
                call    putc            ; to print
                call    putc
                pop     hl              ; Restore the start address
dump_ascii_loop: ld      a, (hl)         ; Get byte
                call    is_print        ; Is it printable?
                jr      c, dump_al_1    ; Yes
                ld      a, '.'          ; No - print a dot
dump_al_1:      call    putc            ; Print the character
                inc     hl              ; Increment address to read from
                djnz    dump_ascii_loop
                ; Now we are finished with printing one line of dump output.
                call    crlf            ; CR/LF for next line on terminal
                push    hl              ; Save the current address for later
                and     a               ; Clear carry
                sbc     hl, de          ; Have we reached the last address?
                pop     hl              ; restore the address
                jr      c, dump_line    ; Dump next line of 16 bytes
                pop     hl
                pop     de
                pop     bc
                pop     af
                ret
dump_msg_1:      defb    "DUMP: START=", eos
dump_msg_2:      defb    " END=", eos
dump_msg_3:      defb    ": ", eos
;
; Examine a memory location:
; SPACE character shows next byte
;
examine:        push    af
                push    hl
                ld      hl, examine_msg_1
                call    puts
                call    get_word        ; Wait for a four-nibble address
                push    hl              ; Save address for later
                ld      hl, examine_msg_2
                call    puts
examine_loop:   pop     hl              ; Restore address
                ld      a, (hl)         ; Get content of address
                inc     hl              ; Prepare for next examination
                push    hl              ; Save hl again for later use
                call    print_byte      ; Print the byte
                call    getc            ; Get a character
                cp      ' '             ; A blank?
                jr      nz, examine_exit; No - exit
                ld      a, ' '          ; Print a blank character
                call    putc
                jr      examine_loop
examine_exit:   pop     hl              ; Get rid of save hl value
                call    crlf            ; Print CR/LF
                pop     hl
                pop     af
                ret
examine_msg_1:   defb    "EXAMINE (type ' '/RET): ADDR=", eos
examine_msg_2:   defb    " DATA=", eos
;
; Fill a block of memory with a single byte - the user is prompted for the
; start address, the length of the block and the fill value.
;
fill:           push    af              ; We will need nearly all registers
                push    bc
                push    de
                push    hl
                ld      hl, fill_msg_1  ; Prompt for start address
                call    puts
                call    get_word        ; Get the start address
                push    hl              ; Store the start address
                and     a               ; Clear carry
                ld      bc, ram_start
                sbc     hl, bc          ; Is the address in the RAM area?
                jr      nc, fill_get_length
                ld      hl, fill_msg_4  ; No!
                call    puts            ; Print error message
                pop     hl              ; Clean up the stack
                jr      fill_exit       ; Leave routine
fill_get_length: ld      hl, fill_msg_2  ; Prompt for length information
                call    puts
                call    get_word        ; Get the length of the block
                ; Now make sure that start + length is still in RAM;

                ;;;;;;;;;ld      bc, hl          ; BC contains the length
                push hl         ; move hl to bc via stack
                pop bc          ;

                pop     hl              ; HL now contains the start address
                push    hl              ; Save the start address again
                push    bc              ; Save the length
                add     hl, bc          ; Start + length
                and     a               ; Clear carry
                ld      bc, ram_start
                sbc     hl, bc          ; Compare with ram_start
                jr      nc, fill_get_value
                ld      hl, fill_msg_5  ; Print error message
                call    puts
                pop     bc              ; Clean up the stack
                pop     hl
                jr      fill_exit       ; Leave the routine
fill_get_value:  ld      hl, fill_msg_3  ; Prompt for fill value
                call    puts
                call    get_byte        ; Get the fill value
                pop     bc              ; Get the length from the stack
                pop     hl              ; Get the start address again

                ;;;;;;;;;ld      de, hl          ; DE = HL + 1
                push hl         ; move hl to de via stack
                pop de          ;

                inc     de
                dec     bc
                ; HL = start address
                ; DE = destination address = HL + 1
                ;      Please note that this is necessary - LDIR does not
                ;      work with DE == HL. ;-)
                ; A  = fill value
                ld      (hl), a         ; Store A into first memory location
                ldir                    ; Fill the memory
                call    crlf
fill_exit:      pop     hl              ; Restore the register contents
                pop     de
                pop     bc
                pop     af
                ret
fill_msg_1:      defb    "FILL: START=", eos
fill_msg_2:      defb    " LENGTH=", eos
fill_msg_3:      defb    " VALUE=", eos
fill_msg_4:      defb    " Illegal address!", cr, lf, eos
fill_msg_5:      defb    " Block exceeds RAM area!", cr, lf, eos
;
; Help
;
help:           push    hl
                ld      hl, help_msg
                call    puts
                pop     hl
                ret

;               defb    "                                ", cr, lf,
help_msg:       defb    "HELP: commandgroups+commands:", cr, lf
                defb    "  C(ontrol group):", cr, lf
                defb    "    I(nfo), S(tart), ", cr, lf
                defb    "    E(X)it", cr, lf

                defb    "  D(ump group):", cr, lf
                defb    "    M(emory), (R)egister,", cr, lf
                defb    "    D(isassemble)", cr, lf

                defb    "  M(emory group):", cr, lf
                defb    "    E(xamine), F(ill),", cr, lf
                defb    "    L(oad), M(ove)", cr, lf

                defb    "  H(elp)", cr, lf
                defb    cr, lf, eos

;
; Print version information etc.
;
info:           push    hl
                ld      hl, info_msg
                call    puts
                ld      hl, hello_msg
                call    puts
                pop     hl
                ret
info_msg:        defb    "INFO: ", eos
;
; Load data into memory. The user is prompted for a 16 bit start address. Then
; a s:equence of bytes in hexadecimal notation may be entered until a character
; that is not 0-9 or a-f is encountered.
;
load:           push    af
                push    bc
                push    de
                push    hl
                ld      hl, load_msg_1  ; Print command name
                call    puts
                call    get_word        ; Wait for the start address (2 bytes)
                push    hl              ; Remember address
                and     a               ; Clear carry
                ld      bc, ram_start   ; Check if the address is valid
                sbc     hl, bc          ; by subtracting the RAM start address
                pop     hl              ; Restore address
                ld      de, 0           ; Counter for bytes loaded
                jr      nc, load_loop   ; OK - start reading hex characters
                ld      hl, load_msg_3  ; Print error message
                call    puts
                jr      load_exit
                ; All in all we need two hex nibbles per byte. If two characters
                ; in a row are valid hexadecimal digits we will convert them
                ; to a byte and store this in memory. If one character is
                ; illegal, the load routine terminates and returns to the
                ; monitor.
load_loop:      ld      a, ' '
                call    putc            ; Write a space as byte delimiter
                call    getc            ; Read first character
                call    to_upper        ; Convert to upper case
                call    is_hex          ; Is it a hex digit?
                jr      nc, load_exit   ; No - exit the load routine
                call    nibble2val      ; Convert character to value
                call    print_nibble    ; Echo hex digit
                rlc     a
                rlc     a
                rlc     a
                rlc     a
                ld      b, a            ; Save the upper four bits for later
                call    getc            ; Read second character and proceed...
                call    to_upper        ; Convert to upper case
                call    is_hex
                jr      nc, load_exit
                call    nibble2val
                call    print_nibble
                or      b               ; Combine lower 4 bits with upper
                ld      (hl), a         ; Save value to memory
                inc     hl
                inc     de
                jr      load_loop       ; Get next byte (or at least try to)
load_exit:      call    crlf            ; Finished...

                ;;;;;;;;;ld      hl, de          ; Print number of bytes loaded
                push de         ; move hl to de via stack
                pop hl          ;

                call    print_word
                ld      hl, load_msg_2
                call    puts
                pop     hl
                pop     de
                pop     bc
                pop     af
                ret
load_msg_1:      defb    "LOAD (xx or else to end): ADDR=", eos
load_msg_2:      defb    " bytes loaded.", cr, lf, eos
load_msg_3:      defb    " Illegal address!", eos


;
; Move a memory block - the user is prompted for all necessary data;
;
move:           push    af              ; We won't even destroy the flags!
                push    bc
                push    de
                push    hl
                ld      hl, move_msg_1
                call    puts
                call    get_word        ; Get address of block to be moved
                push    hl              ; Push this address
                ld      hl, move_msg_2
                call    puts
                call    get_word        ; Get destination start address

                ;;;;;;;;;ld      de, hl          ; LDIR r:equires this in DE
                push hl         ; move hl to de via stack
                pop de          ;

                ; Is the destination address in RAM area?
                and     a               ; Clear carry
                ld      bc, ram_start
                sbc     hl, bc          ; Is the destination in RAM?
                jr      nc, move_get_length
                ld      hl, move_msg_4  ; No - print error message
                call    puts
                pop     hl              ; Clean up stack
                jr      move_exit
move_get_length: ld      hl, move_msg_3
                call    puts
                call    get_word        ; Get length of block

                ;;;;;;;;;ld      bc, hl          ; LDIR r:equires the length in BC XXX
                push hl         ; move hl to bc via stack
                pop bc          ;

                pop     hl              ; Get address of block to be moved
                ; I was lazy - there is no test to make sure that the block
                ; to be moved will fit into the RAM area.
                ldir                    ; Move block
move_exit:      call    crlf            ; Finished
                pop     hl              ; Restore registers
                pop     de
                pop     bc
                pop     af
                ret
move_msg_1:      defb    "MOVE: FROM=", eos
move_msg_2:      defb    " TO=", eos
move_msg_3:      defb    " LENGTH=", eos
move_msg_4:      defb    " Illegal destination address!", eos
;
; Dump the contents of both register banks;
;
rdump:          push    af
                push    hl
                ld      hl, rdump_msg_1 ; Print first two lines
                call    puts
                pop     hl
                call    rdump_one_set

if HP_4952_Target == 0x01
                ; CPC does not like the register set swap...
                ; I guess this would mixes up regular interrupts, not sure
                exx
                ex      af, af'
                push    hl
                ld      hl, rdump_msg_2
                call    puts
                pop     hl
                call    rdump_one_set
                ex      af, af'
                exx
endif

                push    hl
                ld      hl, rdump_msg_3
                call    puts
                push    ix
                pop     hl
                call    print_word
                ld      hl, rdump_msg_4
                call    puts
                push    iy
                pop     hl
                call    print_word
                ld      hl, rdump_msg_5
                call    puts
                ld      hl, 0
                add     hl, sp
                call    print_word
                call    crlf
                pop     hl
                pop     af
                ret
rdump_msg_1:     defb    "REGISTER DUMP", cr, lf, cr, lf
                 defb    "1st:", cr, lf, eos
rdump_msg_2:
                 defb    "2nd:", cr, lf, eos
rdump_msg_3:
                 defb    "PTR: IX=", eos
rdump_msg_4:     defb    " IY=", eos
rdump_msg_5:     defb    " SP=", eos
;
rdump_one_set:  push    hl              ; Print one register set
                ld      hl, rdump_os_msg_1
                call    puts
                push    af              ; Move AF into HL
                pop     hl
                call    print_word      ; Print contents of AF
                ld      hl, rdump_os_msg_2
                call    puts

                ;;;;;;;;;ld      hl, bc
                push    bc        ; move bc to hl via stack
                pop     hl          ;

                call    print_word      ; Print contents of BC
                ld      hl, rdump_os_msg_3
                call    puts

                ;;;;;;;;;ld      hl, de
                push de         ; move de to hl via stack
                pop hl          ;

                call    print_word      ; Print contents of DE
                ld      hl, rdump_os_msg_4
                call    puts
                pop     hl              ; Restore original HL
                call    print_word      ; Print contents of HL
                call    crlf
                ret
rdump_os_msg_1:  defb    "AF=", eos
rdump_os_msg_2:  defb    " BC=", eos
rdump_os_msg_3:  defb    " DE=", eos
rdump_os_msg_4:  defb    " HL=", eos
;
; Start a program - this will prompt for a four digital hexadecimal start
; address. A program should end with "jp 00h" to enter the monitor again.
;
start:          ld      hl, start_msg
                call    puts
                call    get_word        ; Wait for a four-nibble address
                call    crlf
                jp      (hl)            ; Start program (and hope for the best)
start_msg:      defb    "START: ADDR=", eos


;
;******************************************************************************
;***
;*** String routines
;***
;******************************************************************************
;
; is_hex checks a character stored in A for being a valid hexadecimal digit.
; A valid hexadecimal digit is denoted by a set C flag.
;
is_hex:         cp      'F' + 1         ; Greater than 'F'?
                ret     nc              ; Yes
                cp      '0'             ; Less than '0'?
                jr      nc, is_hex_1    ; No, continue
                ccf                     ; Complement carry (i.e. clear it)
                ret
is_hex_1:       cp      '9' + 1         ; Less or: equal '9*?
                ret     c               ; Yes
                cp      'A'             ; Less than 'A'?
                jr      nc, is_hex_2    ; No, continue
                ccf                     ; Yes - clear carry and return
                ret
is_hex_2:       scf                     ; Set carry
                ret
;
; is_print checks if a character is a printable ASCII character. A valid
; character is denoted by a set C flag.
;
is_print:       cp      space
                jr      nc, is_print_1
                ccf
                ret
is_print_1:     cp      07fh
                ret
;
; nibble2val expects a hexadecimal digit (upper case!) in A and returns the
; corresponding value in A.
;
nibble2val:     cp      '9' + 1         ; Is it a digit (less or: equal '9')?
                jr      c, nibble2val_1 ; Yes
                sub     7               ; Adjust for A-F
nibble2val_1:   sub     '0'             ; Fold back to 0..15
                and     0fh              ; Only return lower 4 bits
                ret
;
; Convert a single character contained in A to upper case;
;
to_upper:       cp      'a'             ; Nothing to do if not lower case
                ret     c
                cp      'z' + 1         ; > 'z'?
                ret     nc              ; Nothing to do, either
                and     05fh             ; Convert to upper case
                ret
;
;  Compare two null terminated strings, return >0 / 0 / <0 in A, works like
; strcmp. The routine expects two pointer in HL and DE which will be
; preserved.
;
strcmp:         push    de
                push    hl
strcmp_loop:    ld      a, (de)
                cp      0                       ; End of first string reached?
                jr      z, strcmp_exit
                cp      (hl)                    ; Compare two characters
                jr      nz, strcmp_exit         ; Different -> exit
                inc     hl
                inc     de
                jr      strcmp_loop
strcmp_exit:    sub     (hl)
                pop     hl
                pop     de
                ret
;
;******************************************************************************
;***
;*** IO routines
;***
;******************************************************************************
;
; Send a CR/LF pair;
;
crlf:           push    af
                ld      a, cr
                call    putc
                ld      a, lf
                call    putc
                pop     af
                ret
;
; Read a single character from the serial line, result is in A;
;
getc:           ;call    rx_ready
                ;in      a, (uart_register_0)
                call _getkey_wait
                ret
;
; Get a byte in hexadecimal notation. The result is returned in A. Since
; the routine get_nibble is used only valid characters are accepted - the
; input routine only accepts characters 0-9a-f.
;
get_byte:       push    bc              ; Save contents of B (and C)
                call    get_nibble      ; Get upper nibble
                rlc     a
                rlc     a
                rlc     a
                rlc     a
                ld      b, a            ; Save upper four bits
                call    get_nibble      ; Get lower nibble
                or      b               ; Combine both nibbles
                pop     bc              ; Restore B (and C)
                ret
;
; Get a hexadecimal digit from the serial line. This routine blocks until
; a valid character (0-9a-f) has been entered. A valid digit will be echoed
; to the serial line interface. The lower 4 bits of A contain the value of
; that particular digit.
;
get_nibble:     call    getc            ; Read a character
                call    to_upper        ; Convert to upper case
                call    is_hex          ; Was it a hex digit?
                jr      nc, get_nibble  ; No, get another character
                call    nibble2val      ; Convert nibble to value
                call    print_nibble
                ret
;
; Get a word (16 bit) in hexadecimal notation. The result is returned in HL.
; Since the routines get_byte and therefore get_nibble are called, only valid
; characters (0-9a-f) are accepted.
;
get_word:       push    af
                call    get_byte        ; Get the upper byte
                ld      h, a
                call    get_byte        ; Get the lower byte
                ld      l, a
                pop     af
                ret
;
;  Read a string from STDIN - HL contains the buffer start address,
; B contains the buffer length.
;
gets:           push    af
                push    bc
                push    hl
gets_loop:      call    getc                    ; Get a single character
                cp      cr                      ; Skip CR characters
                jr      z, gets_loop            ; only LF will terminate input
                call    to_upper
                call    putc                    ; Echo character
                cp      lf                      ; Terminate string at
                jr      z, gets_exit            ; LF or
                ld      (hl), a                 ; Copy character to buffer
                inc     hl
                djnz    gets_loop
gets_exit:      ld      (hl), 0                 ; Insert termination byte
                pop     hl
                pop     bc
                pop     af
                ret
;
; print_byte prints a single byte in hexadecimal notation to the serial line.
; The byte to be printed is expected to be in A.
;
print_byte:     push    af              ; Save the contents of the registers
                push    bc
                ld      b, a
                rrca
                rrca
                rrca
                rrca
                call    print_nibble    ; Print high nibble
                ld      a, b
                call    print_nibble    ; Print low nibble
                pop     bc              ; Restore original register contents
                pop     af
                ret
;
; print_nibble prints a single hex nibble which is contained in the lower
; four bits of A;
;
print_nibble:   push    af              ; We won't destroy the contents of A
                and     0fh              ; Just in case...
                add     '0'             ; If we have a digit we are done here.
                cp      '9' + 1         ; Is the result > 9?
                jr      c, print_nibble_1
                add     'A' - '0' - 0ah  ; Take care of A-F
print_nibble_1: call    putc            ; Print the nibble and
                pop     af              ; restore the original value of A
                ret
;
; print_word prints the four hex digits of a word to the serial line. The
; word is expected to be in HL.
;
print_word:     push    hl
                push    af
                ld      a, h
                call    print_byte
                ld      a, l
                call    print_byte
                pop     af
                pop     hl
                ret
;
; Send a single character to the serial line (a contains the character);
;
putc:           ;call    tx_ready
                ;out     (uart_register_0), a
                call    _writechar
                ret
;
; Send a string to the serial line, HL contains the pointer to the string;
;
puts:           push    af
                push    hl
puts_loop:      ld      a, (hl)
                cp      eos             ; End of string reached?
                jr      z, puts_end     ; Yes
                call    putc
                inc     hl              ; Increment character pointer
                jr      puts_loop       ; Transmit next character
puts_end:       pop     hl
                pop     af
                ret

app_exit:       ;call ClearScreen
if HP_4952_Target == 0x01
                jp 014d5h				; Return to main menu. HP4592a
endif
if CPC_Target == 0x01
                ret                     ; CPC
endif

    ; include disassembler source
    ;include "disassembler.asm"


if HP_4952_Target == 0x01
;****************************************************************************************
; HP4952 footer start
;****************************************************************************************
    include "lib/string.asm"
    include "lib/screen.asm"
    include "lib/printf.asm"
    include "lib/keyb.asm"

_code_end:
	defb 033h
;; End of Main Application


;; Fill to end of file
	org 0b0ffh
	seek 16ffh
	defb 000h

	defb 0affeh
_file_end:
;****************************************************************************************
; HP4952 footer end
;****************************************************************************************
endif