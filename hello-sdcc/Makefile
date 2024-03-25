
# hello in sdcc SDASZ80 code style
hello:
	sdasz80 -losgff -o hello.s
	# link

link:
	sdld hello.ihx hello.rel


#			-mz80 -Wl -y --code-loc 0xa000  \ ;--data-loc 0xb000
link-sdcc:
	sdcc -o hello.ihx \
			-mz80 -Wl -y --code-loc 0xa000 \
			--std-c11 -mz80 --debug \
			--no-std-crt0 --nostdinc --nostdlib \
			hello.rel
			# binary

binary:
			# Finally, convert ihx to binary
			#sdobjcopy -I ihex -O binary hello.ihx hello.app
			hex2bin  hello.ihx
			#z80dasm -t -a -g 0xa000 hello.bin -o hello.dasm
			z80dasm -t -a -g 0x0 hello.bin -o hello.dasm

# hello in original z80 assembler style understood by z80asm
# created files: app binary for HP4952A and the app dissasembled back
hello-orig:
	z80asm -o hello-orig.app hello-orig.asm
	cp hello-orig.app $(HOME)/dosbox/util_1/HELLO0.APP
	z80dasm -t -a -g 0xa000 hello-orig.app -o hello-orig.dasm


clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb




