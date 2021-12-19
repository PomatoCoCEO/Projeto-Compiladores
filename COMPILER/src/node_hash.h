#ifndef NODE_HASH_H
#define NODE_HASH_H
#include "ast_node.h"
#include "hash_table.h"
#include <assert.h>

size_t hash_ast_ptr(void *ptr);
int equals_decl(void *node1, void *node2);
char *name_decl(ast_ptr node);

#endif