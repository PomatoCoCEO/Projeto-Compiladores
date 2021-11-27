#ifndef AST_NODE_H
#define AST_NODE_H

#include "vector.h"

#define true 1
#define false 0
#define P_NODE(a, b, l, c) push_node(a, #a, b, l, c)

typedef struct _node
{
    int node_type, line, column;
    char *str;
    vector children;
} ast_node;

typedef ast_node *ast_ptr;
extern char *yytext;
extern int prev_line, prev_col, yyleng;
extern int syn_error;

typedef enum
{
    Program,
    VarDecl,
    Int,
    Float32,
    Bool,
    String,
    FuncDecl,
    FuncHeader,
    FuncParams,
    ParamDecl,
    FuncBody,
    Block,
    If,
    For,
    Return,
    ParseArgs,
    Print,
    IntLit,
    RealLit,
    Id,
    StrLit,
    Or,
    And,
    Eq,
    Ne,
    Lt,
    Gt,
    Le,
    Ge,
    Add,
    Sub,
    Mul,
    Div,
    Mod,
    Not,
    Minus,
    Plus,
    Assign,
    Call,
    Rep_Statement_Semicolon,
    Rep_Comma_Id,
    Vars_Statements,
    Rep_Comma_Expr,
    VarSpec
} ast_node_type;

ast_node new_node(int node_type, char *name);
ast_node *new_node_ptr(int node_type, char *name, int line, int column);

void add_child(ast_node *node, ast_node **child);

void remove_child(ast_node *node);

void free_ast_ptr(ast_ptr node);

void print_ast_tree(ast_node *node, int depth);

#endif