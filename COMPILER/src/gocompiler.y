%{
#include "ast_tree.h"

int yylex();
void yyerror(char *);
extern vector stack;


%}
%token AND ASSIGN BLANKID BOOL CMDARGS COMMA DIV ELSE EQ FLOAT32 FOR FUNC GE GT ID IF INT INTLIT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PACKAGE PARSEINT PLUS PRINT RBRACE REALLIT RESERVED RETURN RPAR RSQ SEMICOLON STAR STRING STRLIT VAR 

%%
Program :       PACKAGE ID SEMICOLON Declarations {
                    push_with_children(Program, "Program", stack.size);
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
VarDeclaration  : VAR VarSpec {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1);*/}
                | VAR LPAR VarSpec SEMICOLON RPAR {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1);*/}
                ;
VarSpec : ID_NTERM REP_COMMA_ID Type {
    // ast_ptr n = new_node_ptr(VarDecl, "VarDecl");
    // printf("VarSpec\n");
    ast_ptr type = pop_node();
    // printf("Type: %s\n", type->str);
    ast_ptr rep = pop_node();
    ast_ptr id = pop_node();
    // printf("Id:%s\n", id->str);
    ast_ptr v_spec = new_node_ptr(VarSpec, "");
    ast_ptr n = new_node_ptr(VarDecl, "VarDecl");
    
    // if(rep->children.size ==0) {
        push_back(&(n->children), &type);
        push_back(&(n->children), &id);
        push_back(&(v_spec->children), &n);
    // }
        // push_back(&stack, &n);
   
    
    if(rep->children.size >0) {
        vector to_free = new_vector(sizeof(ast_ptr));
        ast_ptr aid = rep;
        push_back(&to_free, &aid);
        while(aid->children.size > 1) {
            ast_ptr ch = new_node_ptr(VarDecl, "VarDecl");
            ast_ptr t = new_node_ptr(type->node_type, type->str);
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
    // handle_rep(VarDecl, "VarDecl", 1);
    // ast_ptr tot = pop_node();
    // push_back(&(n->children), )

}; 
REP_COMMA_ID: COMMA ID_NTERM REP_COMMA_ID {push_with_children(Rep_Comma_Id, "", 2);} | {push_node(Rep_Comma_Id, "", "");};
Type :          INT {
                    // printf("Int\n");
                    P_NODE(Int, "");
                } 
                | FLOAT32 {
                    // printf("Float32\n");
                    P_NODE(Float32, "");
                } 
                | BOOL {
                    //printf("Bool\n");
                    P_NODE(Bool, "");
                }
                | STRING {
                    //printf("String\n");
                    P_NODE(String, "");
                }
                ;
FuncDeclaration : FuncHeader FuncBody {
                    // ast_ptr body, header;
                    /*body = pop_node();
                    header = pop_node();
                    ast_ptr n = new_node_ptr(FuncDecl, "FuncDecl");
                    push_back(&(n->children), &header);
                    push_back(&(n->children), &body);*/
                    // P_NODE(FuncDecl, 2);
                    push_with_children(FuncDecl, "FuncDecl", 2);
                    // push_back(&stack, &n);
                }
                ;
FuncHeader      : FUNC ID_NTERM FuncParams Type {
                    ast_ptr type, id , params;
                    type = pop_node();
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader");
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &type);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
                | FUNC ID_NTERM FuncParams {
                    ast_ptr id , params;
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader");
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
                ;
FuncParams      : LPAR Parameters RPAR {
                        // push_with_children(FuncParams, "FuncParams", 1);
                        ast_ptr par = pop_node(), funcPar = new_node_ptr(FuncParams, "FuncParams");
                        for(size_t i = 0; i< par->children.size/2; i++) {
                            ast_ptr p = new_node_ptr(ParamDecl, "ParamDecl");
                            push_back(&(p->children), get(&(par->children), 2*i));
                            push_back(&(p->children), get(&(par->children), 2*i+1));
                            push_back(&(funcPar->children), &p);
                        }
                        free_ast_ptr(par);
                        push_back(&stack, &funcPar);
                    }
                | LPAR RPAR {/*printf("FuncParams\n");*/push_node(FuncParams, "FuncParams", "");}

REP_COMMA_ID_TYPE:  COMMA ID_NTERM Type REP_COMMA_ID_TYPE {/* printf("Rep_Comma_id here!!!\n"); */push_with_children(Rep_Comma_Id, "", 3);}
                    | {push_node(Rep_Comma_Id, "", "");};
                    ;
Parameters : ID_NTERM Type REP_COMMA_ID_TYPE {
    ast_ptr rp = pop_node();
    if(rp->children.size > 0) {
        vector ch = flat_children(rp, 2, true);
        rp = new_node_ptr(ParamDecl, "ParamDecl");
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
        ast_ptr n = new_node_ptr(ParamDecl, "ParamDecl");
        n->children = new_children;
        push_back(&stack, &n);
    }
};
FuncBody : LBRACE VarsAndStatements RBRACE {
    ast_ptr rp = pop_node();
    if(rp->children.size == 0) {
        free(rp);
        P_NODE(FuncBody, "");
    }
    else {
        ast_ptr node = new_node_ptr(FuncBody, "FuncBody");
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
VarsAndStatements : VarDeclaration SEMICOLON VarsAndStatements  {push_with_children(Vars_Statements, "", 2);}
                    | Statement SEMICOLON VarsAndStatements  {push_with_children(Vars_Statements, "", 2);}
                    | {push_node(Vars_Statements, "", "");}
                    | SEMICOLON VarsAndStatements
                    ;
BLOCK: REP_STATEMENT_SEMICOLON {
    ast_ptr rp = pop_node();
    vector ch = flat_children(rp, 1,0);
    ast_ptr n = new_node_ptr(Block, "Block");
    n->children = ch;
    push_back(&stack, &n);
}
REP_STATEMENT_SEMICOLON: Statement SEMICOLON REP_STATEMENT_SEMICOLON {push_with_children(Rep_Statement_Semicolon, "", 2);} 
                        |  {push_node(Rep_Statement_Semicolon, "", "");}
                        ;
Statement :     ID_NTERM ASSIGN Expr {/*printf("Assign\n");*/ push_with_children(Assign, "Assign", 2);};
                | LBRACE BLOCK RBRACE ;
                | IF Expr LBRACE BLOCK RBRACE {
                    ast_ptr bl = pop_node();
                    ast_ptr expr = pop_node();
                    ast_ptr n = new_node_ptr(If, "If"), b = new_node_ptr(Block, "Block");
                    vector v = new_vector(sizeof(ast_ptr));
                    push_back(&v, &expr);
                    push_back(&v, &bl);
                    push_back(&v, &b);
                    n->children = v;
                    push_back(&stack, &n);
                }
                | IF Expr LBRACE BLOCK RBRACE ELSE LBRACE BLOCK RBRACE {/*printf("If\n");*/ push_with_children(If, "If", 3);};
                | FOR LBRACE BLOCK RBRACE {/*printf("For\n");*/ push_with_children(For, "For", 1);}
                | FOR Expr LBRACE BLOCK RBRACE {/*printf("For\n");*/ push_with_children(For, "For", 2);}
                | RETURN {/*printf("Return\n");*/push_node(Return, "Return", "");}
                | RETURN Expr {/*printf("Return\n");*/push_with_children(Return, "Return", 1);} 
                | FuncInvocation  // calling a function? 
                | ParseArgs
                | PRINT LPAR Expr RPAR {/*printf("Print\n");*/push_with_children(Print, "Print", 1);}
                | PRINT LPAR STRLIT_NTERM RPAR {/*printf("Print\n");*/push_with_children(Print, "Print", 1);}
                | ERR_NTERM {/* yyerrok; yyclearin; yyerror("syntax error");*/}
ParseArgs : ID_NTERM COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR {/*printf("Parseargs\n");*/ push_with_children(ParseArgs, "ParseArgs", 2);}
            |  ID_NTERM COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ ERR_NTERM RSQ RPAR {/*yyerror("syntax error");*/}
REP_COMMA_EXPR: COMMA Expr REP_COMMA_EXPR {push_with_children(Rep_Comma_Expr, "", 2);}
                | {push_node(Rep_Comma_Expr, "", "");}
                ;
FuncInvocation : ID_NTERM LPAR Expr REP_COMMA_EXPR RPAR {
                    ast_ptr rp = *(ast_ptr*)get(&stack, stack.size-1);
                    if(rp->children.size > 0) {
                        rp = pop_node();
                        vector ch = flat_children(rp, 1, false); //! rp was freed
                        rp = new_node_ptr(Call, "Call");
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
                        push_with_children(Call, "Call", 2);
                    }
                }
                | ID_NTERM LPAR RPAR {push_with_children(Call,"Call", 1);}
                | ID_NTERM LPAR ERR_NTERM RPAR { }
                ;
Pred5 : INTLIT {
            push_node(IntLit, "IntLit(%s)", yytext);
        } 
        | REALLIT {
            push_node(RealLit, "RealLit(%s)", yytext);
            }
        | ID_NTERM
        | FuncInvocation
        | LPAR Expr RPAR{;}
        | NOT Pred5 {/*printf("Not\n");*/push_with_children(Not, "Not",1);}
        | MINUS Pred5 {/*printf("Minus\n");*/push_with_children(Minus, "Minus",1);}
        | PLUS Pred5 {/*printf("Plus\n");*/push_with_children(Plus, "Plus",1);}
        | LPAR ERR_NTERM RPAR 
Pred4:  Pred4 STAR Pred5 {/*printf("Mul\n");*/push_with_children(Mul, "Mul",2);}
        | Pred4 DIV Pred5 {/*printf("Div\n");*/push_with_children(Div, "Div",2);}
        | Pred4 MOD Pred5 {/*printf("Mod\n");*/push_with_children(Mod, "Mod",2);}
        | Pred5 ;
Pred3 : Pred3 PLUS Pred4 {/*printf("Plus\n");*/ push_with_children(Add, "Add",2);}
        | Pred3 MINUS Pred4 {/*printf("Minus\n");*/push_with_children(Sub, "Sub",2);}
        | Pred4 ;
Pred2 : Pred2 LT Pred3 {/*printf("Lt\n");*/push_with_children(Lt, "Lt",2);}
        | Pred2 GT Pred3 {/*printf("Gt\n");*/push_with_children(Gt, "Gt",2);}
        | Pred2 EQ Pred3 {/*printf("Eq\n");*/push_with_children(Eq, "Eq",2);}
        | Pred2 NE  Pred3 {/*printf("Ne\n");*/push_with_children(Ne, "Ne",2);}
        | Pred2  LE Pred3 {/*printf("Le\n");*/push_with_children(Le, "Le",2);}
        | Pred2 GE Pred3 {/*printf("Ge\n");*/push_with_children(Ge, "Ge",2);}
        | Pred3;
Pred1:  Pred1 AND Pred2 {/*printf("And\n");*/push_with_children(And, "And",2);}
        | Pred2;
Expr :  Expr OR Pred1 {/*printf("Or\n");*/push_with_children(Or, "Or",2);}
        | Pred1
        ;
ID_NTERM: ID {
    push_node(Id, "Id(%s)", yytext);
}
STRLIT_NTERM: STRLIT {
    push_node(StrLit, "StrLit(%s)", yytext);
}
ERR_NTERM: error {}
%%