//#include <stdio.h>

char *myString = "abcdef";
char *myString1 = "xyz";

void global_init() {
    myString = "abcdef";
    myString1 = "xyz";
}

char *fun(unsigned char v) {
    if (v==1) {
        return myString;
    }
    return myString1;
}

void main()
{
  //printf("Hello world");
  //while(1) {};
  return;
}
