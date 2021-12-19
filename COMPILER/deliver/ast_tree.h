#ifndef AST_TREE_2_H
#define AST_TREE_2_H

#include "ast_node.h"

extern vector stack;

void push_node(int node_type, char *format, char *val, int line, int colum);

void push_with_children(int node_type, char *name, int no_children, int line, int column);

ast_ptr pop_node();

void print_top();

void handle_rep(int node_type, char *name, int no_children, int reverse, int line, int column);

vector flat_children(ast_ptr node, int children, int reverse);

void handle_blocks(ast_ptr node);

#endif