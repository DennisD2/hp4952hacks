//#include <stdio.h>

char *myStringGlobal = "pqr";
//char *myString1 = "xyz";
const char *myString;
const char *myString1;

void global_init() {
    myString = "abcdef";
    myString1 = "xyz";
}

char *fun(unsigned char v) __naked {
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
