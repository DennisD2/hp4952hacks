
# hello in sdcc SDASZ80 code style
hello:
	sdasz80 -losgff -o hello.s
	sdasz80 -losgff -o lib/header.s
	sdasz80 -losgff -o lib/strap0.s
	sdasz80 -losgff -o lib/strap3.s
	sdasz80 -losgff -o lib/strap4.s
	sdasz80 -losgff -o lib/strap5.s
	sdasz80 -losgff -o lib/strap6.s
	sdasz80 -losgff -o lib/strap7.s
	# next step is: link

link:
	sdld -z -i hello.ihx hello.rel \
		lib/header.rel \
		lib/strap0.rel lib/strap3.rel lib/strap4.rel lib/strap5.rel \
		lib/strap6.rel lib/strap7.rel

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
			# Finally, convert ihx to binary
			#sdobjcopy -I ihex -O binary hello.ihx hello.app
			hex2bin  hello.ihx
			#z80dasm -t -a -g 0xa000 hello.bin -o hello.dasm
			z80dasm -t -a -g 0x0 hello.bin -o hello.dasm
			cmp hello.bin hello.bin.0
			cmp hello.bin hello-orig.app

# hello in original z80 assembler style understood by z80asm
# created files: app binary for HP4952A and the app dissasembled back
hello-orig:
	z80asm -o hello-orig.app hello-orig.asm
	cp hello-orig.app $(HOME)/dosbox/util_1/HELLO0.APP
	z80dasm -t -a -g 0xa000 hello-orig.app -o hello-orig.dasm

clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb




