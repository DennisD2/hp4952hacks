//#include <stdio.h>

char *myString = "abcdef";

void fun(char *s) {
    if (*s=='a') {
        *s='b';
    }
}

void main()
{
    char *test = myString;
    fun(test);

  //printf("Hello world");
  //while(1) {};
  return;
}
