#ifndef SEMANTIC_H
#define SEMANTIC_H

#include "hash_table.h"
#include "ast_tree.h"
#include "str.h"
#include "var_types.h"
#include "node_hash.h"
#include <ctype.h>
void semantic_analysis(ast_ptr node);
void print_st_program(hash_table *h);
void print_st_funcdecl(hash_table *fd);
void print_entry(ast_ptr decl);
void sem_analysis_program(ast_ptr program);
void sem_analysis_vardecl(ast_ptr vardecl);
void sem_analysis_funcdecl(ast_ptr funcdecl);
vector nodes(hash_table *h);

#endif