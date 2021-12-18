#include "tokens.h"

extern vector token_free;
token_t *new_token(char *id, int line, int column)
{
    token_t *new_token = (token_t *)malloc(sizeof(token_t));

    new_token->id = strdup(id);
    new_token->line = line;
    new_token->column = column;
    push_back(&token_free, &new_token);
    return new_token;
}
