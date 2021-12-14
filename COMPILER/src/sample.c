#include <stdio.h>
#include <stdlib.h>

char ** arg;

int main(int argn, char * args[]) {
    arg = args;
    int i = atoi(arg[1]);
    printf("%d\n", i);
}