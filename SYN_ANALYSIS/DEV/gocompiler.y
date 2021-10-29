%{
    #include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct
{
    void *array;
    size_t size, capacity, el_size;
} vector;

typedef struct _node
{
    int node_type;
    char *str;
    vector children;
} ast_node;
typedef ast_node *ast_ptr;

vector new_vector(size_t size_elem)
{
    vector ans;
    ans.size = ans.capacity = 0;
    ans.el_size = size_elem;
    ans.array = NULL;
    return ans;
}

void push_back(vector *vec, void *elem)
{
    if (vec->size == 0)
    {
        void *new_vec = malloc(vec->el_size);
        vec->array = new_vec;
        memcpy(vec->array, elem, vec->el_size);
        vec->capacity = 1;
        vec->size++;
        return;
    }
    if (vec->size >= vec->capacity)
    {
        void *new_vec = realloc(vec->array, 2 * vec->capacity * vec->el_size);
        vec->capacity *= 2;
        vec->array = new_vec;
    }

    memcpy(vec->array + vec->size * vec->el_size, elem, vec->el_size);
    vec->size++;
}

void *get(vector *vec, int pos)
{
    if (pos >= (int)vec->size)
    {
        printf("Vec with no children...\n");
        return NULL;
    }
    return (char *)vec->array + vec->el_size * pos;
}

void set(vector *vec, size_t pos, void *val)
{
    if (vec->size <= pos || pos < 0)
    {
        fprintf(stderr, "Invalid set in vector\n");
        exit(0);
    }
    memcpy(vec->array + vec->el_size * pos, val, vec->el_size);
}

void pop_back(vector *vec)
{
    if (vec->size == 0)
        return;
    vec->size--;
    if (vec->size < vec->capacity / 4)
    {
        vec->array /*void *r*/ = realloc(vec->array, vec->el_size * vec->capacity / 2);
        vec->capacity /= 2;
    }
}

void test_vector()
{
    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    vector v = new_vector(sizeof(int));

    for (int x = 0; x < (int)(sizeof(a) / sizeof(int)); x++)
        push_back(&v, &a[x]);

    for (int i = 0; i < (int)v.size; i++)
    {
        printf("v[%d] = %d\n", i, (*(int *)get(&v, i)));
    }
    printf("%ld\n", v.capacity);
    for (int i = 0; i < 6; i++)
        pop_back(&v);
    for (int i = 0; i < (int)v.size; i++)
    {
        printf("v[%d] = %d\n", i, (*(int *)get(&v, i)));
    }
    printf("%ld\n", v.capacity);
}

ast_node new_node(int node_type, char *name)
{
    ast_node ans;
    ans.node_type = node_type;
    int f = strlen(name) + 2;
    ans.str = malloc(f * sizeof(char));
    strcpy(ans.str, name);
    ans.children = new_vector(sizeof(ast_node *));
    return ans;
}

ast_node *new_node_ptr(int node_type, char *name)
{
    ast_node *ans = malloc(sizeof(ast_node));
    ans->node_type = node_type;
    int f = strlen(name) + 2;
    ans->str = malloc(f * sizeof(char));
    strcpy(ans->str, name);
    ans->children = new_vector(sizeof(ast_node *));
    return ans;
}

void add_child(ast_node *node, ast_node **child)
{
    push_back(&(node->children), /*(void *)(**/ child);
}

void remove_child(ast_node *node)
{
    pop_back(&(node->children));
}

void free_ast_ptr(ast_ptr node)
{
    free(node->children.array);
    free(node);
}

void print_ast_tree(ast_node *node, int depth)
{
    /*if (node == NULL || node->children.size == 0)
        return;*/
    //     if(depth>5) return;
    for (int i = 0; i < depth; i++)
        printf("..");
    printf("%s\n", node->str);
    for (size_t i = 0; i < node->children.size; i++)
    {
        print_ast_tree(*((ast_node **)get(&(node->children), i)), depth + 1);
    }
}

    #define true 1
    #define false 0
    #define P_NODE(a,b) push_node(a, #a, b)
    int yylex(void);
    void yyerror (const char *s);
    void decl() {
        printf("Declarations\n");
    }
    extern char* yytext;
    extern int prev_line, prev_col, yyleng;
    int syn_error = 0;
    typedef enum {
        Program, VarDecl, Int, Float32, Bool, String, FuncDecl, FuncHeader, FuncParams, ParamDecl, FuncBody, Block, 
        If, For, Return, ParseArgs, Print, IntLit, RealLit, Id, StrLit,
        Or, And, Eq, Ne, Lt, Gt, Le, Ge, Add, Sub, Mul, Div, Mod,
        Not, Minus, Plus, Assign, Call,
        Rep_Statement_Semicolon, Rep_Comma_Id, Vars_Statements, Rep_Comma_Expr, VarSpec
    } ast_node_type;

    vector stack;

    void push_node(int node_type, char* format, char* val) {
        char*name;
        if(node_type == IntLit || node_type == RealLit || node_type == StrLit || node_type == Id) {
            name = malloc(strlen(format)+strlen(val)+2);
            sprintf(name, format, val);
        }
        else {
            name = malloc(strlen(format)+2);
            strcpy(name, format);
        }
        ast_ptr n = new_node_ptr(node_type, name);
        push_back(&stack, &n);
        free(name);
    }

    void push_with_children(int node_type, char* name, int no_children) {
        ast_ptr n = new_node_ptr(node_type, name);
        for(size_t i = stack.size-no_children; i<stack.size; i++) {
            ast_ptr ch = *(ast_ptr*) get(&stack, i);
            add_child(n, &ch);
        }
        for(int i = 0; i<no_children; i++) pop_back(&stack);

        push_back(&stack, &n);
    }

    ast_ptr pop_node() {
        ast_ptr* ans = get(&stack, stack.size-1);
        if(ans == NULL) {
            fprintf(stderr, "No values in stack!\n");
            exit(-1);
        }
        pop_back(&stack);
        return *ans;
    }

    void print_top() {
        printf("Top:");
        ast_ptr* ans = get(&stack, stack.size-1);
        print_ast_tree(*ans, 0);
    }

    void handle_rep(int node_type, char* name, int no_children, int reverse) {
        ast_ptr n = pop_node(), aid = n;
        vector nodes = new_vector(sizeof(ast_ptr));
        vector to_free = new_vector(sizeof(ast_ptr));
        push_back(&to_free, &aid);
        while((int)aid->children.size > no_children) {
            if(!reverse) {
                for(int j = 0; j<no_children; j++) {
                    ast_ptr st_node = (*(ast_ptr*) get(&(aid->children), j));
                    push_back(&nodes, &st_node);
                }
            }
            else {
                for(int j = no_children-1; j>0; j--) {
                    ast_ptr st_node = (*(ast_ptr*) get(&(aid->children), j));
                    push_back(&nodes, &st_node);
                }
            }
            aid = (*(ast_ptr*) get(&(aid->children),no_children));
            push_back(&to_free, &aid);
        }
        if(nodes.size > 1/*no_children*/) {
            ast_ptr block_node = new_node_ptr(node_type, name);
            for(size_t i = 0; i<nodes.size; i++) {
                push_back(&(block_node->children), get(&nodes, i));
            }
            push_back(&stack, &block_node);
        }
        if(nodes.size == 1) push_back(&stack, get(&nodes, 0));
        for(size_t i = 0; i< to_free.size; i++) {
            free_ast_ptr((*(ast_ptr*)get(&to_free, i)));
        }
        free(nodes.array);
        free(to_free.array);
    }

    vector flat_children(ast_ptr node, int children, int reverse) {
        vector ans = new_vector(sizeof(ast_ptr));
        vector to_free = new_vector(sizeof(ast_ptr));
        ast_ptr cur = node;
        push_back(&to_free,&cur);
        while(cur->children.size > (size_t) children) {
            if(!reverse){
                for(int i = 0; i < children; i++) {
                push_back(&ans, get(&(cur->children), i));
            }
            }
            else {
                for(int i = children-1; i >= 0; i--) {
                push_back(&ans, get(&(cur->children), i));
            }
            }
            cur = *(ast_ptr*) get(&(cur->children), children);
            /*    RS
                /\ \  -> children 2
                S T RS
                /\
                S RS*/
            push_back(&to_free,&cur);
        }
        for(size_t i = 0; i< to_free.size; i++) {
            free_ast_ptr(*(ast_ptr*)get(&to_free, i));
        }
        free(to_free.array);
        return ans;
    }

    void yyerror(const char* s)
    {
        printf("Line %d, column %d: %s: %s\n", prev_line, prev_col,s, yytext);
        syn_error=1;
    }

    void handle_blocks(ast_ptr node) {
        int t = node->node_type;
        for(size_t i = 0; i<node->children.size; i++) {
            handle_blocks(*(ast_ptr*)get(&(node->children), i));
        }
        if(t != If && t != For) {
            vector to_eliminate = new_vector(sizeof(int));
            for(size_t i = 0; i<node->children.size; i++) {
                ast_ptr ch = *(ast_ptr*)get(&(node->children), i);
                if(ch->node_type == Block) {
                    if(ch->children.size==1) {
                        ast_ptr grandson = *(ast_ptr*)get(&(ch->children),0);
                        set(&(node->children), i, &grandson);
                        free_ast_ptr(ch);
                        ch = grandson;
                    }
                    else if(ch->children.size == 0) {
                        push_back(&to_eliminate, &i);
                    }
                    
                }
            }
            push_back(&to_eliminate, &(node->children.size));
            if(to_eliminate.size>0) {
                vector new_children = new_vector(sizeof(ast_ptr));
                int pos1 = *(int*)get(&to_eliminate, 0), pos_aid = 0;
                for(int i = 0; i<(int)node->children.size; i++) {
                    if(i==pos1) {
                        free_ast_ptr(*(ast_ptr*)get(&(node->children), i));
                        pos_aid++;
                        pos1 = *(int*)get(&to_eliminate, pos_aid);
                        continue;
                    }
                    else {
                        push_back(&new_children, get(&(node->children), i));
                    }
                }
                free(node->children.array);
                node->children = new_children;
            }
        }
    } 

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
                    ast_ptr body, header;
                    body = pop_node();
                    header = pop_node();
                    ast_ptr n = new_node_ptr(FuncDecl, "FuncDecl");
                    push_back(&(n->children), &header);
                    push_back(&(n->children), &body);
                    push_back(&stack, &n);
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
                | ID_NTERM LPAR RPAR {/*printf("Call\n");*/push_with_children(Call,"Call", 1);}
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
        | LPAR Expr RPAR{/*yyerror("syntax error");*/}
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
int main()
{
    stack = new_vector(sizeof(ast_ptr));
    yyparse();
    if(stack.size == 1 && ! syn_error){
        ast_ptr root = *(ast_ptr*)get(&stack,0);
        handle_blocks(root);
        print_ast_tree(root, 0);
    }
    return 0;
}
