#ifndef CODE_GEN_H
#define CODE_GEN_H

#include "ast_node.h"
#include "var_str.h"
static const char *ll_types[] = {"", "i32", "double", "i1", "i8*", "", "void"};
static const char *zeros[] = {"0", "0.0"};
char *zero(var_type v);
char *ll_type_str(var_type type);
void print_init();
void generate_code(ast_ptr node);
void generate_code_program(ast_ptr node);
void generate_code_funcdecl(ast_ptr node);
void generate_code_vardecl_local(ast_ptr node);
void generate_code_vardecl_global(ast_ptr node);

#endif