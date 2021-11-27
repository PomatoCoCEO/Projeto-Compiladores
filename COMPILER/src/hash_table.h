#ifndef HASH_TABLE_H
#define HASH_TABLE_H

#include "vector.h"
#include "ast_node.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define HASH_MOD (1000000007)

typedef struct
{
    size_t hash;
    size_t pos;
    void *object;
} hashable;

typedef struct
{
    vector vec;
    size_t size;
    size_t vec_size;
    size_t vec_size_pos;
    char *name;
    ast_ptr ref;
} hash_table;

extern int nos[];

hash_table new_hash_table(char *name, ast_ptr ref);
hashable new_hashable(void *object, size_t (*hash)(void *));

int contains(hash_table *h, hashable *d, int (*comp)(void *, void *));
int comp_string(void *a, void *b);
int comp_int(void *a, void *b);

size_t hash_string(void *st);
size_t hash_int(void *a);

void insert(hash_table *ht, hashable *elem);

#endif