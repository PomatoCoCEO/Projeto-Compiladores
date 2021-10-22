%{
    #include<stdio.h>
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
%}
%token AND ASSIGN BLANKID BOOL CMDARGS COMMA DIV ELSE EQ FLOAT32 FOR FUNC GE GT ID IF INT INTLIT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PACKAGE PARSEINT PLUS PRINT RBRACE REALLIT RESERVED RETURN RPAR RSQ SEMICOLON STAR STRING STRLIT VAR 

%%
Program :       PACKAGE ID SEMICOLON Declarations {printf("Program\n");} 
                ;
Declarations :  VarDeclaration SEMICOLON Declarations 
                | FuncDeclaration SEMICOLON Declarations
                | 
                ;
VarDeclaration  : VAR VarSpec {printf("VarDecl\n");}
                | VAR LPAR VarSpec SEMICOLON RPAR {printf("VarDecl\n");}
VarSpec : ID_NTERM REP_COMMA_ID Type; 
REP_COMMA_ID: COMMA ID_NTERM REP_COMMA_ID | ;
Type :          INT {printf("Int\n");} 
                | FLOAT32 {printf("Float32\n");} 
                | BOOL {printf("Bool\n");}
                | STRING {printf("String\n");}
                ;
FuncDeclaration : FuncHeader FuncBody {printf("FuncDecl\n");}
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
Statement :     ID_NTERM ASSIGN Expr {printf("Assign\n");};
                | LBRACE BLOCK RBRACE ;
                | IF Expr LBRACE BLOCK RBRACE {printf("If\n");}
                | IF Expr LBRACE BLOCK RBRACE ELSE LBRACE BLOCK RBRACE {printf("If\n");};
                | FOR LBRACE BLOCK RBRACE {printf("For\n");}
                | FOR Expr LBRACE BLOCK RBRACE {printf("For\n");}
                | RETURN {printf("Return\n");}
                | RETURN Expr {printf("Return\n");} 
                | FuncInvocation  // calling a function? 
                | ParseArgs
                | PRINT LPAR Expr RPAR {printf("Print\n");}
                | PRINT LPAR STRLIT RPAR {printf("Print\n");};
ParseArgs : ID_NTERM COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR {printf("Parseargs\n");}
REP_COMMA_EXPR: COMMA Expr REP_COMMA_EXPR 
                | 
                ;
FuncInvocation : ID_NTERM LPAR Expr REP_COMMA_EXPR RPAR {printf("Call\n");}
                | ID_NTERM LPAR RPAR {printf("Call\n");}
                ;
Pred4 : INTLIT {printf("IntLit(%s)\n", yytext);} 
        | REALLIT {printf("RealLit(%s)\n", yytext);}
        | ID_NTERM
        | FuncInvocation
        | LPAR Expr RPAR
Pred3 : Pred4 PLUS Pred3 {printf("Plus\n");}
        | Pred4 MINUS Pred3 {printf("Minus\n");}
        | Pred4 STAR Pred3 {printf("Mul\n");}
        | Pred4 DIV Pred3 {printf("Div\n");}
        | Pred4 MOD Pred3 {printf("Mod\n");}
        | Pred4 ;
Pred2 : Pred3 LT Pred2 {printf("Lt\n");}
        | Pred3 GT Pred2 {printf("Gt\n");}
        | Pred3 EQ Pred2 {printf("Eq\n");}
        | Pred3 NE  Pred2 {printf("Ne\n");}
        | Pred3  LE Pred2 {printf("Le\n");}
        | Pred3 GE Pred2 {printf("Ge\n");}
        | Pred3;
Pred1:  Pred2 AND Pred1 {printf("And\n");}
        | Pred2;
Expr :  Pred1 OR Pred1 {printf("Or\n");}
        | Pred1 ;
        | NOT Expr {printf("Not\n");}
        | MINUS Expr {printf("Minus\n");}
        | PLUS Expr {printf("Plus\n");}
        ;
ID_NTERM: ID {printf("Id(%s)\n", yytext);}
%%
int main()
{
    yyparse();
    return 0;
}
void yyerror(const char *s)
{
    printf("%s\n", s);
}