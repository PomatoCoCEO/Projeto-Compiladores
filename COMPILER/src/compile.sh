#!/bin/bash

lex gocompiler.l
yacc -d gocompiler.y
cc -Wall lex.yy.c y.tab.c var_str.c ast_node.c var_type.c ast_tree.c code_gen.c vector.c hash_table.c semantic.c tokens.c node_hash.c  -o gocompiler
cc lex.yy.c y.tab.c ast_node.c var_str.c var_type.c ast_tree.c code_gen.c vector.c hash_table.c semantic.c tokens.c node_hash.c -o ../executable/gocompiler
