%{
    #include<stdio.h>
    #include<stdarg.h>
    #include "ast_tree.c"
    int yylex(void);
    void yyerror (const char *s);
    void decl() {
        printf("Declarations\n");
    }
    extern char* yytext;
    typedef enum {
        Program, VarDecl, Int, Float32, Bool, String, FuncDecl, FuncHeader, FuncParams, ParamDecl, FuncBody, Block, 
        If, For, Return, ParseArgs, Print, Int, Float32, Bool, String, IntLit, RealLit, Id, StrLit,
        Or, And, Eq, Ne, Lt, Gt, Le, Ge, Add, Sub, Mul, Div, Mod,
        Not, Minus, Plus, Assign, Call
    } ast_node_type;

    vector stack;

    void push_node(int node_type, char* format, char* val) {
        char*name;
        if(node_type == Intlit || node_type == RealLit || node_type == StrLit || node_type == Id) {
            name = malloc(strlen(format)+strlen(val)+2);
            sprintf(name, format, val);
        }
        else {
            name = malloc(strlen(format)+2);
            strcpy(name, format);
        }
        ast_ptr n = new_node_ptr(node_type, name);
        push_back(stack, &n);
        free(name);
    }

    void push_with_children(int node_type, char* name, int no_children) {
        ast_ptr n = new_node_ptr(node_type, name);
        for(int i = stack.size-no_children; i<stack.size; i++) {
            add_child(n, get(&stack, i));
        }
        for(int i = 0; i<no_children; i++) pop_back(&stack);
        push_back(&stack, n);
    }

    ast_ptr pop_node() {
        ast_ptr* ans = get(&stack, stack.children.size-1);
        if(ans == NULL) {
            fprintf(stderr, "No values in stack!\n");
            exit(-1);
        }
        pop_back(&stack);
        return *ans;
    }

%}
%token AND ASSIGN BLANKID BOOL CMDARGS COMMA DIV ELSE EQ FLOAT32 FOR FUNC GE GT ID IF INT INTLIT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PACKAGE PARSEINT PLUS PRINT RBRACE REALLIT RESERVED RETURN RPAR RSQ SEMICOLON STAR STRING STRLIT VAR 

%%
Program :       PACKAGE ID SEMICOLON Declarations {
                    push_with_children(Program, "Program", stack.size);
                /*
                    printf("Program\n");
                    ast_ptr prog_node = new_node_ptr(Program, "Program");
                    for(int i = 0; i<stack.size; i++) {
                        add_child(prog_node, get(&stack, i));
                    }
                    while(stack.size > 0) pop_back(&stack);
                    push_back(&stack, &prog_node);*/
                } 
                ;
Declarations :  VarDeclaration SEMICOLON Declarations 
                | FuncDeclaration SEMICOLON Declarations
                | 
                ;
VarDeclaration  : VAR VarSpec {printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1);}
                | VAR LPAR VarSpec SEMICOLON RPAR {printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1);}
VarSpec : ID_NTERM REP_COMMA_ID Type; 
REP_COMMA_ID: COMMA ID_NTERM REP_COMMA_ID | ;
Type :          INT {
                    printf("Int\n");
                    push_node(Int, "Int", "");
                } 
                | FLOAT32 {
                    printf("Float32\n");
                    push_node(Float32, "Float32", "");
                } 
                | BOOL {
                    printf("Bool\n");
                    push_node(Bool, "Bool", "");
                }
                | STRING {
                    printf("String\n");
                    push_node(String, "String", "");
                }
                ;
FuncDeclaration : FuncHeader FuncBody {
                    printf("FuncDecl\n");
                    ast_ptr fdecl_node = new_node_ptr(FuncDecl, "FuncDecl");
                    for(int i = stack.size-2; i<stack.size; i++) {
                        add_child(prog_node, get(&stack, i));
                    }
                    pop_back(&stack), pop_back(&stack);
                    push_back(&stack, &fdecl_node);
                }
                ;
FuncHeader      : FUNC ID_NTERM FuncParams Type {printf("FuncHeader\n");}
                | FUNC ID_NTERM FuncParams {printf("FuncHeader\n");}
                ;
FuncParams      : LPAR Parameters RPAR {printf("FuncParams\n");}
                | LPAR RPAR {printf("FuncParams\n");}
/*
FUNC ID LPAR Parameters RPAR Type FuncBody {printf("Func Declared 1\n");}
                | FUNC ID LPAR RPAR Type FuncBody {printf("Func Declared 2\n");}
                | FUNC ID LPAR Parameters RPAR FuncBody {printf("Func Declared 3\n");}
                | FUNC ID LPAR RPAR FuncBody {printf("Func Declared 4\n");}
                ;
                */
REP_COMMA_ID_TYPE:  COMMA ID_NTERM Type REP_COMMA_ID_TYPE 
                    | 
                    ;
Parameters : ID_NTERM Type REP_COMMA_ID_TYPE {printf("ParamDecl\n");};
FuncBody : LBRACE VarsAndStatements RBRACE {printf("FuncBody\n");}
VarsAndStatements : VarsAndStatements VarDeclaration SEMICOLON 
                    | VarsAndStatements Statement SEMICOLON
                    |
                    ;
BLOCK: REP_STATEMENT_SEMICOLON {printf("Block\n");}
REP_STATEMENT_SEMICOLON: Statement SEMICOLON REP_STATEMENT_SEMICOLON |  ;
Statement :     ID_NTERM ASSIGN Expr {printf("Assign\n"); push_with_children(Assign, "Assign", 2)};
                | LBRACE BLOCK RBRACE ;
                | IF Expr LBRACE BLOCK RBRACE {printf("If\n");}
                | IF Expr LBRACE BLOCK RBRACE ELSE LBRACE BLOCK RBRACE {printf("If\n");};
                | FOR LBRACE BLOCK RBRACE {printf("For\n");}
                | FOR Expr LBRACE BLOCK RBRACE {printf("For\n");}
                | RETURN {printf("Return\n");push_node(Return, "Return", "");}
                | RETURN Expr {printf("Return\n");push_with_children(Return, "Return", 1);} 
                | FuncInvocation  // calling a function? 
                | ParseArgs
                | PRINT LPAR Expr RPAR {printf("Print\n"); push_with_children(Print, "Print", 1);}
                | PRINT LPAR STRLIT_NTERM RPAR {printf("Print\n");push_with_children(Print, "Print", 1);};
ParseArgs : ID_NTERM COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR {printf("Parseargs\n"); push_with_children(ParseArgs, "ParseArgs", 2);}
REP_COMMA_EXPR: COMMA Expr REP_COMMA_EXPR 
                | 
                ;
FuncInvocation : ID_NTERM LPAR Expr REP_COMMA_EXPR RPAR {printf("Call\n");}
                | ID_NTERM LPAR RPAR {printf("Call\n");push_with_children(Call,"Call", 1);}
                ;
Pred4 : INTLIT {
            printf("IntLit(%s)\n", yytext);
            push_node(IntLit, "IntLit(%s)\n", yytext);
        } 
        | REALLIT {
            printf("RealLit(%s)\n", yytext);
            push_node(RealLit, "RealLit(%s)\n", yytext);
            }
        | ID_NTERM
        | FuncInvocation
        | LPAR Expr RPAR
Pred3 : Pred4 PLUS Pred3 {printf("Plus\n"); push_with_children(Plus, "Plus",2);}
        | Pred4 MINUS Pred3 {printf("Minus\n");push_with_children(Minus, "Minus",2);}
        | Pred4 STAR Pred3 {printf("Mul\n");push_with_children(Mul, "Mul",2);}
        | Pred4 DIV Pred3 {printf("Div\n");push_with_children(Div, "Div",2);}
        | Pred4 MOD Pred3 {printf("Mod\n");push_with_children(Mod, "Mod",2);}
        | Pred4 ;
Pred2 : Pred3 LT Pred2 {printf("Lt\n"); push_with_children(Lt, "Lt",2);}
        | Pred3 GT Pred2 {printf("Gt\n");push_with_children(Gt, "Gt",2);}
        | Pred3 EQ Pred2 {printf("Eq\n");push_with_children(Eq, "Eq",2);}
        | Pred3 NE  Pred2 {printf("Ne\n"); push_with_children(Ne, "Ne",2);}
        | Pred3  LE Pred2 {printf("Le\n");push_with_children(Le, "Le",2);}
        | Pred3 GE Pred2 {printf("Ge\n");push_with_children(Ge, "Ge",2);}
        | Pred3;
Pred1:  Pred2 AND Pred1 {printf("And\n");push_with_children(And, "And",2);}
        | Pred2;
Expr :  Pred1 OR Pred1 {printf("Or\n");push_with_children(Or, "Or",2);}
        | Pred1 
        | NOT Expr {printf("Not\n"); push_with_children(Not, "Not",1);}
        | MINUS Expr {printf("Minus\n");push_with_children(Minus, "Minus",1);}
        | PLUS Expr {printf("Plus\n");push_with_children(Plus, "Plus",1);}
        ;
ID_NTERM: ID {
    /* printf("Id(%s)\n", yytext);
    char* name = malloc(strlen("Id()")+strlen(yytext)+2);
    sprintf(name, "Id(%s)", yytext);
    push_back(&stack, new_node_ptr(Id, name));
    free(name);*/
    push_node(Id, "Id(%s)", yytext);
}
STRLIT_NTERM: STRLIT {
    printf("StrLit(%s)\n", yytext);
    push_node(StrLit, "StrLit(%s)", yytext);
}
%%
int main()
{
    stack = new_vector(sizeof(ast_ptr));
    yyparse();

    return 0;
}
void yyerror(const char *s)
{
    printf("%s\n", s);
}