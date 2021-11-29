%{
#include "ast_tree.h"
#include "tokens.h"

int yylex();
void yyerror(char *);
extern vector stack;

%}

%union {
    token_t * token_id;
}

%token <token_id> AND ASSIGN BLANKID BOOL CMDARGS COMMA DIV ELSE EQ FLOAT32 FOR FUNC GE GT ID IF INT INTLIT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PACKAGE PARSEINT PLUS PRINT RBRACE REALLIT RESERVED RETURN RPAR RSQ SEMICOLON STAR STRING STRLIT VAR 


%%
Program :       PACKAGE ID SEMICOLON Declarations {
                    push_with_children(Program, "Program", stack.size, 0, 0);
                    ast_ptr n = *(ast_ptr*)get(&stack,0);
                    vector d = new_vector(sizeof(ast_ptr));
                    for(size_t i = 0; i<n->children.size; i++) {
                        ast_ptr ch = *(ast_ptr*)get(&(n->children), i);
                        if(ch->node_type == VarSpec) {
                            for(size_t j = 0; j<(ch->children.size); j++) {
                                push_back(&d, get(&(ch->children), j));
                            }
                            free_ast_ptr(ch);
                        }
                        else push_back(&d, &ch);
                    }
                    free(n->children.array);
                    n->children = d;

                /*
                    S S S ->
                       RS
                     / | \
                   |S  T| RS -> S S RS ->S S S RS -> S S S
                      /\
                     S RS
                       /\
                      S RS
                        ()
                    */
                } 
                ;
Declarations :  VarDeclaration SEMICOLON Declarations 
                | FuncDeclaration SEMICOLON Declarations
                | 
                ;
VarDeclaration  : VAR VarSpec {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl", 1, $1->line, $1->column);*/}
                | VAR LPAR VarSpec SEMICOLON RPAR {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1, $1->line, $1->column);*/}
                ;
VarSpec : ID_NTERM REP_COMMA_ID Type {
    ast_ptr type = pop_node();
    ast_ptr rep = pop_node();
    ast_ptr id = pop_node();
    ast_ptr v_spec = new_node_ptr(VarSpec, "", id->line, id->column);
    ast_ptr n = new_node_ptr(VarDecl, "VarDecl", id->line, id->column);

    push_back(&(n->children), &type);
    push_back(&(n->children), &id);
    push_back(&(v_spec->children), &n);
   
    if(rep->children.size >0) {
        vector to_free = new_vector(sizeof(ast_ptr));
        ast_ptr aid = rep;
        push_back(&to_free, &aid);
        while(aid->children.size > 1) {
            ast_ptr _id = *(ast_ptr*)get(&(aid->children), 0);
            ast_ptr ch = new_node_ptr(VarDecl, "VarDecl", _id->line, _id->column );
            ast_ptr t = new_node_ptr(type->node_type, type->str, 0, 0);
            // printf("Boo1\n");
            push_back(&(ch->children), &t);
            push_back(&(ch->children), get(&(aid->children), 0));
            // push_back(&stack, &ch);
            //printf("Boo1\n");
            push_back(&(v_spec->children), &ch);
            aid = (*(ast_ptr*)get(&(aid->children), 1));
            push_back(&to_free, &aid);
        }
        for(size_t i = 0; i<to_free.size; i++) free_ast_ptr(*(ast_ptr*)get(&to_free, i));
        free(to_free.array);
    }
    push_back(&stack, &v_spec);
}; 
REP_COMMA_ID: COMMA ID_NTERM REP_COMMA_ID {push_with_children(Rep_Comma_Id, "", 2, 0, 0);} | {push_node(Rep_Comma_Id, "", "", 0, 0);};
Type :            INT                   { P_NODE(Int, "", $1->line, $1->column); } 
                | FLOAT32               { P_NODE(Float32, "", $1->line, $1->column); } 
                | BOOL                  { P_NODE(Bool, "", $1->line, $1->column); }
                | STRING                { P_NODE(String, "", $1->line, $1->column); }
                ;
FuncDeclaration : FuncHeader FuncBody { push_with_children(FuncDecl, "FuncDecl", 2, 0, 0); }
                ;
FuncHeader      : FUNC ID_NTERM FuncParams Type {
                    ast_ptr type, id , params;
                    type = pop_node();
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader", 0, 0);
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &type);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
                | FUNC ID_NTERM FuncParams {
                    ast_ptr id , params;
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader", 0, 0);
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
                ;
FuncParams      : LPAR Parameters RPAR {
                        ast_ptr par = pop_node(), funcPar = new_node_ptr(FuncParams, "FuncParams", 0, 0);
                        for(size_t i = 0; i< par->children.size/2; i++) {
                            ast_ptr p = new_node_ptr(ParamDecl, "ParamDecl", 0, 0);
                            push_back(&(p->children), get(&(par->children), 2*i));
                            push_back(&(p->children), get(&(par->children), 2*i+1));
                            push_back(&(funcPar->children), &p);
                        }
                        free_ast_ptr(par);
                        push_back(&stack, &funcPar);
                    }
                | LPAR RPAR {push_node(FuncParams, "FuncParams", "", 0, 0);}

REP_COMMA_ID_TYPE:  COMMA ID_NTERM Type REP_COMMA_ID_TYPE {push_with_children(Rep_Comma_Id, "", 3, 0, 0);}
                    | {push_node(Rep_Comma_Id, "", "", 0, 0);};
                    ;
Parameters : ID_NTERM Type REP_COMMA_ID_TYPE {
    ast_ptr rp = pop_node();
    if(rp->children.size > 0) {
        vector ch = flat_children(rp, 2, true);
        rp = new_node_ptr(ParamDecl, "ParamDecl", 0, 0);
        vector new_children = new_vector(sizeof(ast_ptr));
        ast_ptr type = pop_node();
        ast_ptr id = pop_node();
        push_back(&new_children, &type);
        push_back(&new_children, &id);
        for(size_t i =0; i< ch.size; i++) {
            push_back(&new_children, get(&(ch), i));
        }
        rp->children = new_children;
        push_back(&stack, &rp);
    }
    else {
        free_ast_ptr(rp);
        ast_ptr type = pop_node();
        ast_ptr id = pop_node();
        vector new_children = new_vector(sizeof(ast_ptr));
        push_back(&new_children, &type);
        push_back(&new_children, &id);
        ast_ptr n = new_node_ptr(ParamDecl, "ParamDecl", 0, 0);
        n->children = new_children;
        push_back(&stack, &n);
    }
};
FuncBody : LBRACE VarsAndStatements RBRACE {
    ast_ptr rp = pop_node();
    if(rp->children.size == 0) {
        free(rp);
        P_NODE(FuncBody, "", 0, 0);
    }
    else {
        ast_ptr node = new_node_ptr(FuncBody, "FuncBody", 0, 0);
        vector v = flat_children(rp, 1,0);
        for(size_t i = 0; i<v.size; i++)  {
            ast_ptr ch = *(ast_ptr*)get(&(v), i);
            if(ch->node_type == VarSpec) {
                vector w = ch->children;
                for(size_t i = 0; i<w.size; i++) {
                    ast_ptr s = *(ast_ptr*) get(&w, i);
                    push_back(&(node->children), &s);
                }
                free_ast_ptr(ch);
            }
            else{ 
                push_back(&(node->children), &ch);
            }
        }
        push_back(&stack, &node);
    }
}
VarsAndStatements : VarDeclaration SEMICOLON VarsAndStatements  {push_with_children(Vars_Statements, "", 2, 0, 0);}
                    | Statement SEMICOLON VarsAndStatements  {push_with_children(Vars_Statements, "", 2, 0, 0);}
                    | {push_node(Vars_Statements, "", "", 0, 0);}
                    | SEMICOLON VarsAndStatements
                    ;
BLOCK: REP_STATEMENT_SEMICOLON {
    ast_ptr rp = pop_node();
    vector ch = flat_children(rp, 1,0);
    ast_ptr n = new_node_ptr(Block, "Block", 0, 0);
    n->children = ch;
    push_back(&stack, &n);
}
REP_STATEMENT_SEMICOLON: Statement SEMICOLON REP_STATEMENT_SEMICOLON {push_with_children(Rep_Statement_Semicolon, "", 2, 0, 0);} 
                        |  {push_node(Rep_Statement_Semicolon, "", "", 0, 0);}
                        ;
Statement :     ID_NTERM ASSIGN Expr {push_with_children(Assign, $2->id, 2, $2->line, $2->column);};
                | LBRACE BLOCK RBRACE ;
                | IF Expr LBRACE BLOCK RBRACE {
                    ast_ptr bl = pop_node();
                    ast_ptr expr = pop_node();
                    ast_ptr n = new_node_ptr(If, "If", $1->line, $1->column);
                    ast_ptr b = new_node_ptr(Block, "Block", 0, 0);
                    vector v = new_vector(sizeof(ast_ptr));
                    push_back(&v, &expr);
                    push_back(&v, &bl);
                    push_back(&v, &b);
                    n->children = v;
                    push_back(&stack, &n);
                }
                | IF Expr LBRACE BLOCK RBRACE ELSE LBRACE BLOCK RBRACE {/*printf("If\n");*/ push_with_children(If, "If", 3, $1->line, $1->column);};
                | FOR LBRACE BLOCK RBRACE {/*printf("For\n");*/ push_with_children(For, "For", 1, $1->line, $1->column);}
                | FOR Expr LBRACE BLOCK RBRACE {/*printf("For\n");*/ push_with_children(For, "For", 2, $1->line, $1->column);}
                | RETURN {/*printf("Return\n");*/push_node(Return, "Return", "", $1->line, $1->column);}
                | RETURN Expr {/*printf("Return\n");*/push_with_children(Return, "Return", 1, $1->line, $1->column);} 
                | FuncInvocation  // calling a function? 
                | ParseArgs
                | PRINT LPAR Expr RPAR {/*printf("Print\n");*/push_with_children(Print, "Print", 1, 0, 0);}
                | PRINT LPAR STRLIT_NTERM RPAR {/*printf("Print\n");*/push_with_children(Print, "Print", 1, 0, 0);}
                | ERR_NTERM {/* yyerrok; yyclearin; yyerror("syntax error");*/}
ParseArgs : ID_NTERM COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR {/*printf("Parseargs\n");*/ push_with_children(ParseArgs, $5->id, 2, $5->line, $5->column);}
            |  ID_NTERM COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ ERR_NTERM RSQ RPAR {/*yyerror("syntax error");*/}
REP_COMMA_EXPR: COMMA Expr REP_COMMA_EXPR {push_with_children(Rep_Comma_Expr, "", 2, 0, 0);}
                | {push_node(Rep_Comma_Expr, "", "", 0, 0);}
                ;
FuncInvocation : ID_NTERM LPAR Expr REP_COMMA_EXPR RPAR {
                    ast_ptr rp = *(ast_ptr*)get(&stack, stack.size-1);
                    if(rp->children.size > 0) {
                        rp = pop_node();
                        vector ch = flat_children(rp, 1, false); //! rp was freed
                        rp = new_node_ptr(Call, "Call", 0, 0);
                        vector new_children = new_vector(sizeof(ast_ptr));
                        ast_ptr expr = pop_node();
                        ast_ptr id = pop_node();
                        push_back(&new_children, &id);
                        push_back(&new_children, &expr);
                        for(size_t i = 0; i<ch.size; i++) {
                            push_back(&new_children, get(&ch, i));
                        } 
                        free(ch.array);
                        rp->children = new_children;
                        push_back(&stack, &rp);
                    }
                    else {
                        pop_node();
                        free_ast_ptr(rp);
                        push_with_children(Call, "Call", 2, 0, 0);
                    }
                }
                | ID_NTERM LPAR RPAR {push_with_children(Call,"Call", 1, 0, 0);}
                | ID_NTERM LPAR ERR_NTERM RPAR { }
                ;
Pred5 : INTLIT {
            push_node(IntLit, yytext,"", $1->line, $1->column);
        } 
        | REALLIT {
            push_node(RealLit, yytext,"", $1->line, $1->column);
            }
        | ID_NTERM
        | FuncInvocation
        | LPAR Expr RPAR{;}
        | NOT Pred5 {/*printf("Not\n");*/push_with_children(Not, $1->id,1, $1->line, $1->column);}
        | MINUS Pred5 {/*printf("Minus\n");*/push_with_children(Minus, $1->id,1, $1->line, $1->column);}
        | PLUS Pred5 {/*printf("Plus\n");*/push_with_children(Plus, $1->id,1, $1->line, $1->column);}
        | LPAR ERR_NTERM RPAR 
Pred4:  Pred4 STAR Pred5 {/*printf("Mul\n");*/push_with_children(Mul, $2->id,2, $2->line, $2->column);}
        | Pred4 DIV Pred5 {/*printf("Div\n");*/push_with_children(Div, $2->id,2, $2->line, $2->column);}
        | Pred4 MOD Pred5 {/*printf("Mod\n");*/push_with_children(Mod, $2->id,2, $2->line, $2->column);}
        | Pred5 ;
Pred3 : Pred3 PLUS Pred4 {/*printf("Plus\n");*/ push_with_children(Add, $2->id,2, $2->line, $2->column);}
        | Pred3 MINUS Pred4 {/*printf("Minus\n");*/push_with_children(Sub, $2->id,2, $2->line, $2->column);}
        | Pred4 ;
Pred2 : Pred2 LT Pred3 {/*printf("Lt\n");*/push_with_children(Lt, $2->id,2, $2->line, $2->column);}
        | Pred2 GT Pred3 {/*printf("Gt\n");*/push_with_children(Gt, $2->id,2, $2->line, $2->column);}
        | Pred2 EQ Pred3 {/*printf("Eq\n");*/push_with_children(Eq, $2->id,2, $2->line, $2->column);}
        | Pred2 NE  Pred3 {/*printf("Ne\n");*/push_with_children(Ne, $2->id,2, $2->line, $2->column);}
        | Pred2  LE Pred3 {/*printf("Le\n");*/push_with_children(Le, $2->id,2, $2->line, $2->column);}
        | Pred2 GE Pred3 {/*printf("Ge\n");*/push_with_children(Ge, $2->id,2, $2->line, $2->column);}
        | Pred3;
Pred1:  Pred1 AND Pred2 {/*printf("And\n");*/push_with_children(And, $2->id,2, $2->line, $2->column);}
        | Pred2;
Expr :  Expr OR Pred1 {/*printf("Or\n");*/push_with_children(Or, $2->id,2, $2->line, $2->column);}
        | Pred1
        ;
ID_NTERM: ID {
    push_node(Id, yytext,"", $1->line, $1->column);
}
STRLIT_NTERM: STRLIT {
    push_node(StrLit, yytext,"", $1->line, $1->column);
}
ERR_NTERM: error {}
%%