hello: crt0 hello.c
	sdcc -mz80 --no-std-crt0 --nostdlib --nostdinc --codeseg 0x2200 --dataseg 0x2071 crt0.rel hello.c
	hex2bin hello.ihx
	z80dasm -t -a -g 0x2071 -o hello.dasm hello.bin

mist:
	#sdcc -mz80 --no-std-crt0  --codeseg 0x2071 --dataseg 0x8000 \
 	#	--constseg 0x0000  -o hello hello.c
 	#sdcc -mz80 --code-loc 0x0138 --data-loc 0 --no-std-crt0 crt0_cpc.rel putchar_cpc.rel sdcc01.c

disassemble:
	z80dasm -t -a -g 0x2071 -o hello.dasm hello.bin

crt0:
	sdasz80 -o crt0.s

clean:
	rm -f hello *.asm *.lk *.lst *.map *.noi *.rel *.sym *.ihx *.bin




