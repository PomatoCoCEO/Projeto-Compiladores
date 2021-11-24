#!/bin/bash

lex gocompiler.l
yacc -d gocompiler.y
clang lex.yy.c y.tab.c ast_tree.c ast_node.c vector.c -o ../executable/gocompiler
