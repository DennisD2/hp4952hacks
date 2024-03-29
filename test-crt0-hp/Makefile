
# crt in sdcc SDASZ80 code style
crt:
	sdasz80 -o crt0_hp.s
	#sdasz80 -o putchar_hp.s
	# next step is: link


fun:
	sdcc -mz80 -c fun.c

link:
	sdcc -o sdcc01.ihx -mz80 --code-loc 0x0cc0 --data-loc 0x0 --no-std-crt0 --nostdinc --nostdlib crt0_hp.rel fun.rel
	#sdcc -mz80 --code-loc 0x0138 --data-loc 0 --no-std-crt0 crt0_hp.rel putchar_hp.rel sdcc01.c


#			-mz80 -Wl -y --code-loc 0xa000  \ ;--data-loc 0xb000
#link-sdcc:
#	sdcc -o hello.ihx \
#			-mz80 -Wl -y --code-loc 0xa000 \
#			--std-c11 -mz80 --debug \
#			--no-std-crt0 --nostdinc --nostdlib \
#			crt0.rel hello.rel
#
	# next step is:  binary

binary:
	hex2bin sdcc01.ihx
	cp sdcc01.bin $(HOME)/dosbox/util_1/SDC.APP
	z80dasm -t -a -g 0x0 sdcc01.bin -o sdcc01.dasm


clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb *.dasm




