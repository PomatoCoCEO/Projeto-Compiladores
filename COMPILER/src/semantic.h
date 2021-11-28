#ifndef SEMANTIC_H
#define SEMANTIC_H

#include "hash_table.h"
#include "ast_tree.h"
#include "str.h"
#include "node_hash.h"
#include <ctype.h>
void semantic_analysis(ast_ptr node);
void print_st_program(hash_table *h);
void print_st_funcdecl(hash_table *fd);
void print_entry(ast_ptr decl);
void sem_analysis_program(ast_ptr program);
void add_global_function(ast_ptr funcdecl);
void sem_analysis_vardecl(ast_ptr vardecl);
void sem_analysis_funcdecl(ast_ptr funcdecl);
void sem_analysis_if(ast_ptr ifnode);
void sem_analysis_for(ast_ptr fornode);
void sem_analysis_or_and(ast_ptr propnode);
void sem_analysis_comp(ast_ptr propnode);
void sem_analysis_equality(ast_ptr propnode);
void sem_analysis_assign(ast_ptr propnode);
void sem_analysis_id(ast_ptr propnode);
void sem_analysis_propagate(ast_ptr propnode);
void sem_analysis_binary_math(ast_ptr propnode);
void sem_analysis_parseargs(ast_ptr node);
void sem_analysis_call(ast_ptr node);
void sem_analysis_unary_math(ast_ptr node);
void sem_analysis_add(ast_ptr node);
vector nodes(hash_table *h);

extern int semantic_errors;

#endif