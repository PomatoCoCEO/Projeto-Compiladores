%{
    #include<stdio.h>
    int yylex(void);
    void yyerror (const char *s);
    void decl() {
        printf("Declarations\n");
    }
    extern char* yytext;
%}
%token AND ASSIGN BLANKID BOOL CMDARGS COMMA DIV ELSE EQ FLOAT32 FOR FUNC GE GT ID IF INT INTLIT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PACKAGE PARSEINT PLUS PRINT RBRACE REALLIT RESERVED RETURN RPAR RSQ SEMICOLON STAR STRING STRLIT VAR 

%%
calc: Program {printf("PROGRAM BOO\n");}
Program :   PACKAGE ID SEMICOLON Declarations {printf("Program boo\n");} 
            ;
Declarations : VarDeclaration SEMICOLON Declarations { decl(); } 
                | FuncDeclaration SEMICOLON Declarations {decl();} 
                | 
                ;
VarDeclaration : VAR VarSpec {printf("Declare1\n");}
VarDeclaration : VAR LPAR VarSpec SEMICOLON RPAR {printf("Declare2\n");}
VarSpec : ID REP_COMMA_ID Type {printf("VarSpec\n");}
REP_COMMA_ID: COMMA ID REP_COMMA_ID | ;
Type :          INT {printf("Int\n");} 
                | FLOAT32 {printf("Float32\n");} 
                | BOOL {printf("bool\n");}
                | STRING {printf("String\n");}
                ;
FuncDeclaration : FUNC ID LPAR Parameters RPAR Type FuncBody {printf("Func Declared 1\n");}
                | FUNC ID LPAR RPAR Type FuncBody {printf("Func Declared 2\n");}
                | FUNC ID LPAR Parameters RPAR FuncBody {printf("Func Declared 3\n");}
                | FUNC ID LPAR RPAR FuncBody {printf("Func Declared 4\n");}
                ;
REP_COMMA_ID_TYPE:  COMMA ID Type REP_COMMA_ID_TYPE 
                    | 
                    ;
Parameters : ID Type REP_COMMA_ID_TYPE ;
FuncBody : LBRACE VarsAndStatements RBRACE {printf("FuncBody\n");}
VarsAndStatements : VarsAndStatements VarDeclaration SEMICOLON 
                    | 
                    ; 
VarsAndStatements : VarsAndStatements Statement SEMICOLON ; 
REP_STATEMENT_SEMICOLON: Statement SEMICOLON REP_STATEMENT_SEMICOLON {printf("BLOCK\n");} | {printf("Empty ");} ;
Statement : ID ASSIGN Expr ;
Statement : LBRACE REP_STATEMENT_SEMICOLON RBRACE ;
Statement : IF Expr LBRACE REP_STATEMENT_SEMICOLON RBRACE 
            | IF Expr LBRACE REP_STATEMENT_SEMICOLON RBRACE ELSE LBRACE REP_STATEMENT_SEMICOLON RBRACE;
Statement : FOR LBRACE REP_STATEMENT_SEMICOLON RBRACE 
            |  FOR Expr LBRACE REP_STATEMENT_SEMICOLON RBRACE ;
Statement : RETURN {printf("Return\n");}
            | RETURN Expr {printf("Return\n");} 
            ;
Statement : FuncInvocation 
            | ParseArgs {printf("ParseArgs");} ;
Statement : PRINT LPAR Expr RPAR 
            | PRINT LPAR STRLIT RPAR;
ParseArgs : ID COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR {printf("Parseargs\n");}
REP_COMMA_EXPR: COMMA Expr REP_COMMA_EXPR 
                | 
                ;
FuncInvocation : ID LPAR Expr REP_COMMA_EXPR RPAR {printf("func_invocation\n");}
                | ID LPAR RPAR {printf("func_invocation\n");};
Pred4 : INTLIT {printf("Intlit(%s)\n", yytext);} 
        | REALLIT {printf("REALLIT(%s)\n", yytext);}
        | ID {printf("ID(%s)\n", yytext);}
        | FuncInvocation
        | LPAR Expr RPAR {printf("Expr\n");};
Pred3 : Pred4 PLUS Pred3 {printf("Plus\n");}
        | Pred4 MINUS Pred3 {printf("Minus\n");}
        | Pred4 STAR Pred3 {printf("Star\n");}
        | Pred4 DIV Pred3 {printf("Div\n");}
        | Pred4 MOD Pred3 {printf("Mod\n");}
        | Pred4 ;
Pred2 : Pred3 LT Pred2 {printf("LT\n");}
        | Pred3 GT Pred2 {printf("GT\n");}
        | Pred3 EQ Pred2 {printf("EQ\n");}
        | Pred3 NE  Pred2 {printf("NE\n");}
        | Pred3  LE Pred2 {printf("LE\n");}
        | Pred3 GE Pred2 {printf("GE\n");}
        | Pred3;
Pred1:  Pred2 AND Pred1 {printf("AND\n");}
        | Pred2;
Expr :  Pred1 OR Pred1 {printf("OR\n");}
        | Pred1 ;
Expr :  NOT Expr {printf("NOT\n");}
        | MINUS Expr {printf("MINUS\n");}
        | PLUS Expr {printf("PLUS\n");}
        ;
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