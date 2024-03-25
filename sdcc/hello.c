#include <stdio.h>

//static __sfr __at 0x03 sccDatA;
//static __sfr __at 0x02 sccDatB;
//static __sfr __at 0x01 sccComA;
//static __sfr __at 0x00 sccComB;
//static __sfr __at 0xF0 flagsReg;


unsigned char *line2 = "\002\015\203HP4952A";
/*
unsigned char *line3 = "\003\007\203Open Source Software";
unsigned char *line7 = "\007\000\203Hello World";
unsigned char *line12 = "\014\010\203Hacking the 4952";
unsigned char *line13 = "\015\011\203with SDCC";
 */
unsigned char end_of_screen_data = 0x00;

//unsigned char menuData = "Re-!BERT!Remote!Mass !Hell!Self~set!Menu!&Print!Store!o   !Test|";

void boot() {
    __asm
            LD SP,#0xFF00
    CALL _main
    __endasm;
}

/*
#define sccSetsCount 38
const unsigned char sccSets[] = {
        0x00,0x00,      //pointer reset
        0x09,0xC0,	//hardware reset
        0x04,0x04,	//1x clock, async, 1 stop, no par
        0x01,0x00,	//no dma, no interrupts
        0x02,0x00,	//clear int vector
        0x03,0xC0,	//rx 8 bits, disabled
        0x05,0x60,	//tx 8 bits, disabled
        0x09,0x01,	//status low, no interrupts
        0x0A,0x00,	//nrz encoding
        0x0B,0xD6,	//xtal, BRG for rxc, trxc output
        0x0C,0xfe,	//time constant low byte (1200)
        0x0D,0x05,	//time constant high byte(1200)
        0x0E,0x00,	//BRG source RTxC
        0x0E,0x80,	//clock source BRG
        0x0E,0x01,	//enable BRG
        0x0F,0x00,	//no ints
        0x10,0x10,	//reset interrupts
        0x03,0xC1,	//enable Rx
        0x05,0x68,	//enable Tx
        0x00,0x00	//overflow
};

void initSccA() {
    unsigned char i;
    for(i=0; i<sccSetsCount; i++){
        sccComA = sccSets[i];
    }
}
*/
void main() {
    unsigned char c;
    //flagsReg = 0x80;	//turn on LED
    //initSccA();
    //flagsReg = 0;		//turn off LED
    //printf("SCC Init Complete");
    while(1){
        //c = getchar();
        //putchar(c);
    };
}

/*
void putchar(char cin) {
    unsigned char c;
    //check status of tx buf, then output
    do{
        sccComA = 0;
        c = sccComA;
        c &= 4;
    }while(c == 0);
    sccDatA = cin;
}

char getchar() {
    unsigned char c;
    do{
        sccComA = 0;
        c = sccComA;
        c &= 1;
    }while(c != 1);
    c = sccDatA;
    return c;
}
 */