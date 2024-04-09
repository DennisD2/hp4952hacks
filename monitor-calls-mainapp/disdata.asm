kDisSubsL: equ 13	;Last operand substitution string
kDisSubNN: equ 4	;Operand substitution string 'nn'
kDisSubC: equ 10	;Operand substitution string 'c'
kDisSubCC: equ 11	;Operand substitution string 'cc'
kDisBracHL: equ 21	;Bracketed HL
kDisHL: equ 24	;HL
kDisFlowF: equ 27	;First flow control instructions
kDisFlowL: equ 34	;Last flow control instructions
kDisJR: equ 27	;Operation string 'JR'
kDisDJNZ: equ 28	;Operation string 'DJNZ'
kDisRST: equ 29	;Operation string 'RST'
kDisJP: equ 30	;Operation string 'JP'
kDisCALL: equ 31	;Operation string 'CALL'
kDisRET: equ 32	;Operation string 'RET'
kDisOpMask: equ 03Fh	;Operand 1 mask to exclude pre-code bits
kDisMskC: equ 018h	;Condition bit mask for Operand 1 = C
kDisMskCC: equ 038h	;Condition bit mask for Operand 1 = CC
kDisMskRST: equ 038h	;Restart address bits

DisString:
	defb  080h                              	;String 001h =
	defb  080h+'n'                          	;String 002h = n
	defb  080h+'(',"n)"                     	;String 003h = (n)
	defb  080h+'n',"n"                      	;String 004h = nn
	defb  080h+'(',"nn)"                    	;String 005h = (nn)
	defb  080h+'r'                          	;String 006h = r
	defb  080h+'r',"2"                      	;String 007h = r2
	defb  080h+'d',"d"                      	;String 008h = dd
	defb  080h+'q',"q"                      	;String 009h = qq
	defb  080h+'c'                          	;String 00Ah = c
	defb  080h+'c',"c"                      	;String 00Bh = cc
	defb  080h+'t'                          	;String 00Ch = t
	defb  080h+'b'                          	;String 00Dh = b
	defb  080h+'B',"CDEHL-A"                	;String 00Eh = BCDEHL-A
	defb  080h+'B',"CDE**SP"                	;String 00Fh = BCDE**SP
	defb  080h+'B',"CDE**AF"                	;String 010h = BCDE**AF
	defb  080h+'N',"ZZ.NCC."                	;String 011h = NZZ.NCC.
	defb  080h+'N',"ZZ.NCC.POPEP.M."        	;String 012h = NZZ.NCC.POPEP.M.
	defb  080h+'0',"008101820283038"        	;String 013h = 0008101820283038
	defb  080h+'0',"1234567"                	;String 014h = 01234567
	defb  080h+'(',"HL)"                    	;String 015h = (HL)
	defb  080h+'(',"IX+"                    	;String 016h = (IX+
	defb  080h+'(',"IY+"                    	;String 017h = (IY+
	defb  080h+'H',"L"                      	;String 018h = HL
	defb  080h+'I',"X"                      	;String 019h = IX
	defb  080h+'I',"Y"                      	;String 01Ah = IY
	defb  080h+'J',"R"                      	;String 01Bh = JR
	defb  080h+'D',"JNZ"                    	;String 01Ch = DJNZ
	defb  080h+'R',"ST"                     	;String 01Dh = RST
	defb  080h+'J',"P"                      	;String 01Eh = JP
	defb  080h+'C',"ALL"                    	;String 01Fh = CALL
	defb  080h+'R',"ET"                     	;String 020h = RET
	defb  080h+'R',"ETI"                    	;String 021h = RETI
	defb  080h+'R',"ETN"                    	;String 022h = RETN
	defb  080h+'A'                          	;String 023h = A
	defb  080h+'(',"SP)"                    	;String 024h = (SP)
	defb  080h+'A',"F"                      	;String 025h = AF
	defb  080h+'D',"E"                      	;String 026h = DE
	defb  080h+'0'                          	;String 027h = 0
	defb  080h+'1'                          	;String 028h = 1
	defb  080h+'2'                          	;String 029h = 2
	defb  080h+'(',"BC)"                    	;String 02Ah = (BC)
	defb  080h+'(',"DE)"                    	;String 02Bh = (DE)
	defb  080h+'S',"P"                      	;String 02Ch = SP
	defb  080h+'I'                          	;String 02Dh = I
	defb  080h+'R'                          	;String 02Eh = R
	defb  080h+'(',"C)"                     	;String 02Fh = (C)
	defb  080h+'A',"F'"                     	;String 030h = AF'
	defb  080h+'A',"DC"                     	;String 031h = ADC
	defb  080h+'A',"DD"                     	;String 032h = ADD
	defb  080h+'A',"ND"                     	;String 033h = AND
	defb  080h+'B',"IT"                     	;String 034h = BIT
	defb  080h+'C',"CF"                     	;String 035h = CCF
	defb  080h+'C',"P"                      	;String 036h = CP
	defb  080h+'C',"PD"                     	;String 037h = CPD
	defb  080h+'C',"PDR"                    	;String 038h = CPDR
	defb  080h+'C',"PI"                     	;String 039h = CPI
	defb  080h+'C',"PIR"                    	;String 03Ah = CPIR
	defb  080h+'C',"PL"                     	;String 03Bh = CPL
	defb  080h+'D',"AA"                     	;String 03Ch = DAA
	defb  080h+'D',"EC"                     	;String 03Dh = DEC
	defb  080h+'D',"I"                      	;String 03Eh = DI
	defb  080h+'E',"I"                      	;String 03Fh = EI
	defb  080h+'E',"X"                      	;String 040h = EX
	defb  080h+'E',"XX"                     	;String 041h = EXX
	defb  080h+'H',"ALT"                    	;String 042h = HALT
	defb  080h+'I',"M"                      	;String 043h = IM
	defb  080h+'I',"N"                      	;String 044h = IN
	defb  080h+'I',"NC"                     	;String 045h = INC
	defb  080h+'I',"ND"                     	;String 046h = IND
	defb  080h+'I',"NDR"                    	;String 047h = INDR
	defb  080h+'I',"NI"                     	;String 048h = INI
	defb  080h+'I',"NIR"                    	;String 049h = INIR
	defb  080h+'L',"D"                      	;String 04Ah = LD
	defb  080h+'L',"DD"                     	;String 04Bh = LDD
	defb  080h+'L',"DDR"                    	;String 04Ch = LDDR
	defb  080h+'L',"DI"                     	;String 04Dh = LDI
	defb  080h+'L',"DIR"                    	;String 04Eh = LDIR
	defb  080h+'N',"EG"                     	;String 04Fh = NEG
	defb  080h+'N',"OP"                     	;String 050h = NOP
	defb  080h+'O',"R"                      	;String 051h = OR
	defb  080h+'O',"TDR"                    	;String 052h = OTDR
	defb  080h+'O',"TIR"                    	;String 053h = OTIR
	defb  080h+'O',"UT"                     	;String 054h = OUT
	defb  080h+'O',"UTD"                    	;String 055h = OUTD
	defb  080h+'O',"UTI"                    	;String 056h = OUTI
	defb  080h+'P',"OP"                     	;String 057h = POP
	defb  080h+'P',"USH"                    	;String 058h = PUSH
	defb  080h+'R',"ES"                     	;String 059h = RES
	defb  080h+'R',"L"                      	;String 05Ah = RL
	defb  080h+'R',"LA"                     	;String 05Bh = RLA
	defb  080h+'R',"LC"                     	;String 05Ch = RLC
	defb  080h+'R',"LCA"                    	;String 05Dh = RLCA
	defb  080h+'R',"LD"                     	;String 05Eh = RLD
	defb  080h+'R',"R"                      	;String 05Fh = RR
	defb  080h+'R',"RA"                     	;String 060h = RRA
	defb  080h+'R',"RC"                     	;String 061h = RRC
	defb  080h+'R',"RCA"                    	;String 062h = RRCA
	defb  080h+'R',"RD"                     	;String 063h = RRD
	defb  080h+'S',"BC"                     	;String 064h = SBC
	defb  080h+'S',"CF"                     	;String 065h = SCF
	defb  080h+'S',"ET"                     	;String 066h = SET
	defb  080h+'S',"LA"                     	;String 067h = SLA
	defb  080h+'S',"LL"                     	;String 068h = SLL
	defb  080h+'S',"RA"                     	;String 069h = SRA
	defb  080h+'S',"RL"                     	;String 06Ah = SRL
	defb  080h+'S',"UB"                     	;String 06Bh = SUB
	defb  080h+'X',"OR"                     	;String 06Ch = XOR
	defb  080h+'?',"???"                    	;String 06Dh = ????
	defb  080h

DisInst:
	defb  088h,0F8h,031h,023h,007h ;Opcode 088h - ADC  A   ,r2
	defb  0CEh,0FFh,031h,023h,002h ;Opcode 0CEh - ADC  A   ,n
	defb  04Ah,0CFh,031h,0D8h,008h ;Opcode 04Ah - ADC  HL  ,dd
	defb  080h,0F8h,032h,023h,007h ;Opcode 080h - ADD  A   ,r2
	defb  0C6h,0FFh,032h,023h,002h ;Opcode 0C6h - ADD  A   ,n
	defb  009h,0CFh,032h,018h,008h ;Opcode 009h - ADD  HL  ,dd
	defb  0A0h,0F8h,033h,007h,001h ;Opcode 0A0h - AND  r2  ,
	defb  0E6h,0FFh,033h,002h,001h ;Opcode 0E6h - AND  n   ,
	defb  040h,0C0h,034h,08Dh,007h ;Opcode 040h - BIT  b   ,r2
	defb  0C4h,0C7h,01Fh,00Bh,004h ;Opcode 0C4h - CALL cc  ,nn
	defb  0CDh,0FFh,01Fh,004h,001h ;Opcode 0CDh - CALL nn  ,
	defb  03Fh,0FFh,035h,001h,001h ;Opcode 03Fh - CCF      ,
	defb  0B8h,0F8h,036h,007h,001h ;Opcode 0B8h - CP   r2  ,
	defb  0FEh,0FFh,036h,002h,001h ;Opcode 0FEh - CP   n   ,
	defb  0A9h,0FFh,037h,0C1h,001h ;Opcode 0A9h - CPD      ,
	defb  0B9h,0FFh,038h,0C1h,001h ;Opcode 0B9h - CPDR     ,
	defb  0A1h,0FFh,039h,0C1h,001h ;Opcode 0A1h - CPI      ,
	defb  0B1h,0FFh,03Ah,0C1h,001h ;Opcode 0B1h - CPIR     ,
	defb  02Fh,0FFh,03Bh,001h,001h ;Opcode 02Fh - CPL      ,
	defb  027h,0FFh,03Ch,001h,001h ;Opcode 027h - DAA      ,
	defb  00Bh,0CFh,03Dh,008h,001h ;Opcode 00Bh - DEC  dd  ,
	defb  005h,0C7h,03Dh,006h,001h ;Opcode 005h - DEC  r   ,
	defb  0F3h,0FFh,03Eh,001h,001h ;Opcode 0F3h - DI       ,
	defb  010h,0FFh,01Ch,002h,001h ;Opcode 010h - DJNZ n   ,
	defb  0FBh,0FFh,03Fh,001h,001h ;Opcode 0FBh - EI       ,
	defb  0E3h,0FFh,040h,024h,018h ;Opcode 0E3h - EX   (SP),HL
	defb  008h,0FFh,040h,025h,030h ;Opcode 008h - EX   AF  ,AF'
	defb  0EBh,0FFh,040h,026h,018h ;Opcode 0EBh - EX   DE  ,HL
	defb  0D9h,0FFh,041h,001h,001h ;Opcode 0D9h - EXX      ,
	defb  076h,0FFh,042h,001h,001h ;Opcode 076h - HALT     ,
	defb  046h,0FFh,043h,0E7h,001h ;Opcode 046h - IM   0   ,
	defb  056h,0FFh,043h,0E8h,001h ;Opcode 056h - IM   1   ,
	defb  05Eh,0FFh,043h,0E9h,001h ;Opcode 05Eh - IM   2   ,
	defb  040h,0C7h,044h,0C6h,02Fh ;Opcode 040h - IN   r   ,(C)
	defb  0DBh,0FFh,044h,023h,003h ;Opcode 0DBh - IN   A   ,(n)
	defb  003h,0CFh,045h,008h,001h ;Opcode 003h - INC  dd  ,
	defb  004h,0C7h,045h,006h,001h ;Opcode 004h - INC  r   ,
	defb  0AAh,0FFh,046h,0C1h,001h ;Opcode 0AAh - IND      ,
	defb  0BAh,0FFh,047h,0C1h,001h ;Opcode 0BAh - INDR     ,
	defb  0A2h,0FFh,048h,0C1h,001h ;Opcode 0A2h - INI      ,
	defb  0B2h,0FFh,049h,0C1h,001h ;Opcode 0B2h - INIR     ,
	defb  0E9h,0FFh,01Eh,015h,001h ;Opcode 0E9h - JP   (HL),
	defb  0C2h,0C7h,01Eh,00Bh,004h ;Opcode 0C2h - JP   cc  ,nn
	defb  0C3h,0FFh,01Eh,004h,001h ;Opcode 0C3h - JP   nn  ,
	defb  020h,0E7h,01Bh,00Ah,002h ;Opcode 020h - JR   c   ,n
	defb  018h,0FFh,01Bh,002h,001h ;Opcode 018h - JR   n   ,
	defb  040h,0C0h,04Ah,006h,007h ;Opcode 040h - LD   r   ,r2
	defb  002h,0FFh,04Ah,02Ah,023h ;Opcode 002h - LD   (BC),A
	defb  012h,0FFh,04Ah,02Bh,023h ;Opcode 012h - LD   (DE),A
	defb  032h,0FFh,04Ah,005h,023h ;Opcode 032h - LD   (nn),A
	defb  022h,0FFh,04Ah,005h,018h ;Opcode 022h - LD   (nn),HL
	defb  043h,0CFh,04Ah,0C5h,008h ;Opcode 043h - LD   (nn),dd
	defb  00Ah,0FFh,04Ah,023h,02Ah ;Opcode 00Ah - LD   A   ,(BC)
	defb  01Ah,0FFh,04Ah,023h,02Bh ;Opcode 01Ah - LD   A   ,(DE)
	defb  03Ah,0FFh,04Ah,023h,005h ;Opcode 03Ah - LD   A   ,(nn)
	defb  02Ah,0FFh,04Ah,018h,005h ;Opcode 02Ah - LD   HL  ,(nn)
	defb  0F9h,0FFh,04Ah,02Ch,018h ;Opcode 0F9h - LD   SP  ,HL
	defb  001h,0CFh,04Ah,008h,004h ;Opcode 001h - LD   dd  ,nn
	defb  04Bh,0CFh,04Ah,0C8h,005h ;Opcode 04Bh - LD   dd  ,(nn)
	defb  057h,0FFh,04Ah,0E3h,02Dh ;Opcode 057h - LD   A   ,I
	defb  05Fh,0FFh,04Ah,0E3h,02Eh ;Opcode 05Fh - LD   A   ,R
	defb  047h,0FFh,04Ah,0EDh,023h ;Opcode 047h - LD   I   ,A
	defb  04Fh,0FFh,04Ah,0EEh,023h ;Opcode 04Fh - LD   R   ,A
	defb  006h,0C7h,04Ah,006h,002h ;Opcode 006h - LD   r   ,n
	defb  0A8h,0FFh,04Bh,0C1h,001h ;Opcode 0A8h - LDD      ,
	defb  0B8h,0FFh,04Ch,0C1h,001h ;Opcode 0B8h - LDDR     ,
	defb  0A0h,0FFh,04Dh,0C1h,001h ;Opcode 0A0h - LDI      ,
	defb  0B0h,0FFh,04Eh,0C1h,001h ;Opcode 0B0h - LDIR     ,
	defb  044h,0FFh,04Fh,0C1h,001h ;Opcode 044h - NEG      ,
	defb  000h,0FFh,050h,001h,001h ;Opcode 000h - NOP      ,
	defb  0B0h,0F8h,051h,007h,001h ;Opcode 0B0h - OR   r2  ,
	defb  0F6h,0FFh,051h,002h,001h ;Opcode 0F6h - OR   n   ,
	defb  0BBh,0FFh,052h,0C1h,001h ;Opcode 0BBh - OTDR     ,
	defb  0B3h,0FFh,053h,0C1h,001h ;Opcode 0B3h - OTIR     ,
	defb  041h,0C7h,054h,0EFh,006h ;Opcode 041h - OUT  (C) ,r
	defb  0D3h,0FFh,054h,003h,023h ;Opcode 0D3h - OUT  (n) ,A
	defb  0ABh,0FFh,055h,0C1h,001h ;Opcode 0ABh - OUTD     ,
	defb  0A3h,0FFh,056h,0C1h,001h ;Opcode 0A3h - OUTI     ,
	defb  0C1h,0CFh,057h,009h,001h ;Opcode 0C1h - POP  qq  ,
	defb  0C5h,0CFh,058h,009h,001h ;Opcode 0C5h - PUSH qq  ,
	defb  080h,0C0h,059h,08Dh,007h ;Opcode 080h - RES  b   ,r2
	defb  0C9h,0FFh,020h,001h,001h ;Opcode 0C9h - RET      ,
	defb  0C0h,0C7h,020h,00Bh,001h ;Opcode 0C0h - RET  cc  ,
	defb  04Dh,0FFh,021h,0C1h,001h ;Opcode 04Dh - RETI     ,
	defb  045h,0FFh,022h,0C1h,001h ;Opcode 045h - RETN     ,
	defb  010h,0F8h,05Ah,087h,001h ;Opcode 010h - RL   r2  ,
	defb  017h,0FFh,05Bh,001h,001h ;Opcode 017h - RLA      ,
	defb  000h,0F8h,05Ch,087h,001h ;Opcode 000h - RLC  r2  ,
	defb  007h,0FFh,05Dh,001h,001h ;Opcode 007h - RLCA     ,
	defb  06Fh,0FFh,05Eh,0C1h,001h ;Opcode 06Fh - RLD      ,
	defb  018h,0F8h,05Fh,087h,001h ;Opcode 018h - RR   r2  ,
	defb  01Fh,0FFh,060h,001h,001h ;Opcode 01Fh - RRA      ,
	defb  008h,0F8h,061h,087h,001h ;Opcode 008h - RRC  r2  ,
	defb  00Fh,0FFh,062h,001h,001h ;Opcode 00Fh - RRCA     ,
	defb  067h,0FFh,063h,0C1h,001h ;Opcode 067h - RRD      ,
	defb  0C7h,0C7h,01Dh,00Ch,001h ;Opcode 0C7h - RST  t   ,
	defb  098h,0F8h,064h,023h,007h ;Opcode 098h - SBC  A   ,r2
	defb  0DEh,0FFh,064h,023h,002h ;Opcode 0DEh - SBC  A   ,n
	defb  042h,0CFh,064h,0D8h,008h ;Opcode 042h - SBC  HL  ,dd
	defb  037h,0FFh,065h,001h,001h ;Opcode 037h - SCF      ,
	defb  0C0h,0C0h,066h,08Dh,007h ;Opcode 0C0h - SET  b   ,r2
	defb  020h,0F8h,067h,087h,001h ;Opcode 020h - SLA  r2  ,
	defb  030h,0F8h,068h,087h,001h ;Opcode 030h - SLL  r2  ,
	defb  028h,0F8h,069h,087h,001h ;Opcode 028h - SRA  r2  ,
	defb  038h,0F8h,06Ah,087h,001h ;Opcode 038h - SRL  r2  ,
	defb  090h,0F8h,06Bh,007h,001h ;Opcode 090h - SUB  r2  ,
	defb  0D6h,0FFh,06Bh,002h,001h ;Opcode 0D6h - SUB  n   ,
	defb  0A8h,0F8h,06Ch,007h,001h ;Opcode 0A8h - XOR  r2  ,
	defb  0EEh,0FFh,06Ch,002h,001h ;Opcode 0EEh - XOR  n   ,
	defb  000h,000h,06Dh,001h,001h ;Opcode 000h - ????     ,
	defb  000h,000h,06Dh,0C1h,001h ;Opcode 000h - ????     ,
