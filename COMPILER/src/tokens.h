#ifndef TOKENS_H
#define TOKENS_H

#include <string.h>
#include <stdlib.h>
#include "vector.h"
typedef struct token
{
    char *id;
    int line, column;
} token_t;

token_t *new_token(char *id, int line, int column);
vector token_free; // = new_vector(sizeof(void *));
#endif