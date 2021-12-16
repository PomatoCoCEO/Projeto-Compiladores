#ifndef CODE_GEN_H
#define CODE_GEN_H
#include "node_hash.h"
#include "ast_node.h"
#include "var_str.h"
#include "hash_table.h"
#include <ctype.h>

char *zero(var_type v);
char *ll_type_str(var_type type);
void print_init();
void generate_code(ast_ptr node);
void generate_code_program(ast_ptr node);
void generate_code_id(ast_ptr node);
void generate_code_funcdecl(ast_ptr node);
void generate_code_vardecl_local(ast_ptr node);
void generate_code_vardecl_global(ast_ptr node);
void generate_code_intlit(ast_ptr node);
void generate_code_reallit(ast_ptr node);
void generate_code_strlit(ast_ptr node);
void generate_code_add(ast_ptr node);
void generate_code_sub(ast_ptr node);
void generate_code_mul(ast_ptr node);
void generate_code_mod(ast_ptr node);
void generate_code_div(ast_ptr node);
void generate_code_plus(ast_ptr node);
void generate_code_minus(ast_ptr node);
void generate_code_ne(ast_ptr node);
void generate_code_eq(ast_ptr node);
void generate_code_gt(ast_ptr node);
void generate_code_lt(ast_ptr node);
void generate_code_ge(ast_ptr node);
void generate_code_le(ast_ptr node);
void generate_code_for(ast_ptr node);
void generate_code_or(ast_ptr node);
void generate_code_and(ast_ptr node);
void generate_code_not(ast_ptr node);
void generate_code_id(ast_ptr node);
void generate_code_parseargs(ast_ptr node);
void generate_code_assign(ast_ptr node);
void generate_code_call(ast_ptr node);
void generate_code_return(ast_ptr node);
void generate_code_if(ast_ptr node);
void generate_code_print(ast_ptr node);
void print_return(var_type v);
int type_node_id(ast_ptr node);
char type_arith(ast_ptr node);
void assign_strlit(ast_ptr node);
#endif