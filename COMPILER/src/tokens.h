#ifndef TOKENS_H
#define TOKENS_H

#include <string.h>
#include <stdlib.h>

extern int print_syn;

typedef struct token
{
    char *id;
    int line, column;
} token_t;

token_t *new_token(char *id, int line, int column);

#endif