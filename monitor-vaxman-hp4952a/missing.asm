; collection of all missing parts from SCM source related to disassembler file.
; defines are from various source files.

kNull:          equ 0              ;Null character/byte (000h)
kSpace:         equ 32             ;Space character (020h)


iHL:        defw  00005h         ;Register pair HL
iAF:        defw  00002h         ;Register pair AF
iBC:        defw  00003h         ;Register pair BC
iSP:        defw  00011h         ;Register pair SP (Stack Pointer)

iStrStart:  defw  00000h         ;Start of current string buffer
iStrSize:   defw  000h           ;Size of current string buffer (0 to Len-1)


; String Write character
;   On entry A = Character to write to string buffer
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
; The specified character is writted to the string buffer and a null
; terminator added.
StrWrChar:
            PUSH AF
            PUSH DE
            PUSH HL
            LD   E,A            ;Store character to write
            LD   HL,(iStrStart) ;Start of current string buffer
            LD   A,(HL)         ;Get length of string in buffer
; TODO >>>>> Trap strings too long for the buffer
            INC  (HL)           ;Increment string length
            INC  A              ;Inc to skip length byte
            ADD  A,L            ;Add A to start of buffer...
            LD   L,A            ;  to get address for next character
            JR   NC,_S_Store
            INC  H
_S_Store:     LD   (HL),E         ;Store character in buffer
            POP  HL
            POP  DE
            POP  AF
            RET

; Utility Write hex prefix (eg. "&") to current string buffer
;   On entry No parameters r:equired
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
WrHexPrefix:
            PUSH AF
            LD   A,'$'
            CALL StrWrChar      ;Write '$'
;           LD   A,'0'
;           CALL StrWrChar      ;Write '0'
;           LD   A,'x'
;           CALL StrWrChar      ;Write 'x'
            POP  AF
            RET


; String Write hex byte to string buffer
;   On entry A = Hex byte
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrWrHexByte:
            PUSH AF
            PUSH DE
            CALL ConvertByteToNibbles
            LD   A,D
            CALL StrWrHexNibble
            LD   A,E
            CALL StrWrHexNibble
            POP  DE
            POP  AF
            RET

; String Write hex nibble to string buffer
;   On entry A = Hex nibble
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrWrHexNibble:
            PUSH AF
            AND  00Fh           ;Mask off nibble
            CP   00Ah           ;Nibble > 10 ?
            JR   C,_S_Skip        ;No, so skip
            ADD  A,7            ;Yes, so add 7
_S_Skip:      ADD  A,030h         ;Add ASCII '0'
            CALL StrWrChar      ;Write character
            POP  AF
            RET

; Utility Convert byte to nibbles
;   On entry A = Hex byte
;   On exit  D = Most significant nibble
;             E = Least significant nibble
;             A BC HL IX IY I AF' BC' DE' HL' preserved
;             Interrupts not enabled
ConvertByteToNibbles:
            PUSH AF
            LD   E,A            ;Get byte to convert
            RRA                 ;Shift top nibble to
            RRA                 ;  botom four bits..
            RRA
            RRA
            AND  00Fh           ;Mask off unwanted bits
            LD   D,A            ;Store top nibble
            LD   A,E            ;Get byte to convert
            AND  00Fh           ;Mask off unwanted bits
            LD   E,A            ;Store bottom nibble
            POP  AF
            RET


; Utility Find start of specified string in bit 7 delimited list
;   On entry A = String number
;             HL = Start of string list
;   On exit  HL = Start of string
;             AF BC DE IX IY I AF' BC' DE' HL' preserved
; Find string A in bit 7 delimited string list
FindStringInList:
            PUSH AF
            PUSH BC
            DEC  HL             ;Point to address before string list
            LD   B,A            ;Get string number
Next_find:      INC  HL             ;Point to next character
            BIT  7,(HL)         ;Start of new string?
            JR   Z,Next_find        ;No, so go get next character
            DJNZ Next_find          ;Loop back if not the right string
            POP  BC
            POP  AF
            RET


; String Write hex word to string buffer
;   On entry DE = Hex word
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrWrHexWord:
            PUSH AF
            LD   A,D            ;Get hi byte
            CALL StrWrHexByte   ;Write as two hex digits
            LD   A,E            ;Get lo byte
            CALL StrWrHexByte   ;Write as two hex digits
            POP  AF
            RET

; String Append specified zero (null) terminated string
;   On entry DE = Start of string to be appended
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
; Appends specified zero (null) terminated string to current string
; buffer. The string does not have the usual length prefix but
; instead is terminated with a zero (null).
StrAppendZ:
            PUSH AF
            PUSH DE
_S_Next2:      LD   A,(DE)         ;Get length of specified string
            OR   A              ;Null string?
            JR   Z,_S_Done2        ;Yes, so we're done
            CALL StrWrChar      ;Write character to current string
            INC  DE             ;Point to next character
            JR   _S_Next2          ;Loop back if more character
_S_Done2:      POP  DE
            POP  AF
            RET



; String Write space character to string buffer
;   On entry No parameters
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrWrSpace:
            PUSH AF
            LD   A,kSpace       ;Space character
            CALL StrWrChar      ;Write space character
            POP  AF
            RET


; String  Write padding (spaces) to specified length
;   On entry A = R:equired length of string
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrWrPadding:
            PUSH AF
            PUSH BC
            PUSH HL
            LD   B,A
            LD   HL,(iStrStart) ;Get start of current string buffer
            SUB  (HL)           ;Compare r:equired length to current
            JR   C,End_Pad         ;End now if already too long
            JR   Z,End_Pad         ;End now if already r:equired length
            CALL StrWrSpaces    ;Write r:equired number of spaces
End_Pad:       POP  HL
            POP  BC
            POP  AF
            RET


; String Append specified string to current string buffer
;   On entry DE = Start of string to be appended
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrAppend:
            PUSH AF
            PUSH BC
            PUSH DE
            LD   A,(DE)         ;Get length of specified string
            OR   A              ;Null string?
            JR   Z,_S_Done1        ;Yes, so we're done
            LD   B,A            ;Store length of string
_S_Next1:      INC  DE             ;Point to next character to append
            LD   A,(DE)         ;Get character from specified string
            CALL StrWrChar      ;Write character to current string
            DJNZ _S_Next1          ;Loop back if more character
_S_Done1:      POP  DE
            POP  BC
            POP  AF
            RET


; String Write ascii character to string buffer
;   On entry A = ASCII character
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
; If the character is not printable then a dot is written instead
StrWrAsciiChar:
            PUSH AF
            CALL ConvertByteToAscii
            CALL StrWrChar      ;Write character or a dot
            POP  AF
            RET


; String Write address, colon, space to string buffer
;   On entry DE = Address
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
; Example output "1234 "
StrWrAddress:
            PUSH AF
            CALL StrWrHexWord   ;Write start address of this line
            LD   A,':'
            CALL StrWrChar      ;Write colon
            CALL StrWrSpace     ;Write space
            POP  AF
            RET

; String Initialise and select default string buffer
;   On entry No parameters r:equired
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrInitDefault:
            PUSH AF
            XOR  A              ;Select default string buffer (0)
            CALL StrInitialise  ;Select and initialise buffer
            POP  AF
            RET


; String Initialise default or supplied string buffer
;   On entry A = Size of buffer or zero to restore defaults
;             DE = Start address of string buffer
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
; Size includes the string's length byte so needs to be one byte
; longer than the largest string it can hold.
StrInitialise:
            PUSH AF
            PUSH DE
            OR   A              ;Buffer length zero?
            JR   NZ,_S_Init       ;No, so go use supplied values
            LD   DE,kStrBuffer  ;Get start of default buffer
            LD   A,kStrSize     ;Get size of default buffer
_S_Init:      LD   (iStrStart),DE ;Store start of string buffer
            LD   (iStrSize),A   ;Store size of string buffer
            XOR  A              ;Prepare for length zero
            LD   (DE),A         ;Initialise string with length zero
            POP  DE
            POP  AF
            RET



; Utility Convert byte to ascii character
;   On entry A = Byte
;   On exit  A = ASCII character
;             BC DE HL IX IY I AF' BC' DE' HL' preserved
;             Interrupts enabled during this call
; If not printable then a dot is output instead.
ConvertByteToAscii:
            CP   32             ;<SPACE?
            JR   C,ZGW_c
            CP   07Fh           ;>07Fh?
            JR   C,ZGX_c
ZGW_c:       LD   A,'.'
ZGX_c:       RET

; String Write spaces to string buffer
;   On entry A = Number of spaces to write
;   On exit  AF BC DE HL IX IY I AF' BC' DE' HL' preserved
StrWrSpaces:
            PUSH AF
_S_Loop_sws:      CALL StrWrSpace     ;Print one space character
            DEC  A              ;Written all r:equired spaces?
            JR   NZ,_S_Loop_sws       ;No, so go write another
            POP  AF
            RET
