#!/bin/bash

lex gocompiler.l
yacc -d gocompiler.y
cc -Wall lex.yy.c y.tab.c var_type.c ast_tree.c ast_node.c vector.c hash_table.c semantic.c tokens.c node_hash.c gen_code.c  -o gocompiler
cc lex.yy.c y.tab.c var_type.c ast_tree.c ast_node.c vector.c hash_table.c semantic.c tokens.c node_hash.c gen_code.c -o ../executable/gocompiler
