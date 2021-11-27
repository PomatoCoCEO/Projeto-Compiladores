#!/bin/bash

lex gocompiler.l
yacc -d gocompiler.y
cc lex.yy.c y.tab.c ast_tree.c ast_node.c vector.c hash_table.c semantic.c tokens.c node_hash.c -o gocompiler
cc lex.yy.c y.tab.c ast_tree.c ast_node.c vector.c hash_table.c semantic.c tokens.c node_hash.c -o ../executable/gocompiler
