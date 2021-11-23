/*
    Compiladores, 2021

    Meta 2

    Autores:
        Paulo Cortesão, uc2019216517
        Samuel Carinhas, uc2019217199
*/

%X COMMENT_LINE COMMENT_MULTILINE STR INVALID_STRING
%{
    #include "y.tab.h"
    #include "tok_type.h"
    extern vector stack;
    int semicolon = 0, column = 1, line = 1, saved_line, saved_column, prev_col=1, prev_line=1; 
    void act_prev() {prev_col = column, prev_line= line;}
    int print=0;
    void print_tok(tok_type tok) {
        if(tok>=RESERVED_T) {
            printf("%s", tok_names[tok]);
            printf("(%s)", yytext);
        }
        else printf("%s",tok_names[tok]);
        printf("\n");
    }

    void handle_tok(tok_type tok) {
        if(print) print_tok(tok);
    }
%}
COMMENT                                                 "//"
OPEN_COMMENT                                            "/*"
CLOSE_COMMENT                                           "*/"
SEMICOLON                                               ";"
COMMA                                                   ","
BLANKID                                                 "_"
ASSIGN                                                  "="
STAR                                                    "*"
DIV                                                     "/"
MINUS                                                   "-"
PLUS                                                    "+"
EQ                                                      "=="
GE                                                      ">="
GT                                                      ">"
LBRACE                                                  "{"
LE                                                      "<="
LPAR                                                    "("
LSQ                                                     "["
LT                                                      "<"
MOD                                                     "%"
NE                                                      "!="
NOT                                                     "!"
AND                                                     "&&"
OR                                                      "||"
RBRACE                                                  "}"
RPAR                                                    ")"
RSQ                                                     "]"
PACKAGE                                                 package
RETURN                                                  return
ELSE                                                    else
FOR                                                     for
IF                                                      if
VAR                                                     var
INT                                                     int
FLOAT32                                                 float32
BOOL                                                    bool
STRING                                                  string
PRINT                                                   fmt"."Println
PARSEINT                                                strconv"."Atoi
FUNC                                                    func
CMDARGS                                                 os"."Args
letter                                                  [a-zA-Z_]
digit                                                   [0-9]
hexdigit                                                [0-9A-Fa-f]
octaldigit                                              [0-7]
decint                                                  [1-9]({digit})*|0
hexint                                                  {hexdigit}({hexdigit})*
octalint                                                0({octaldigit})*
alphanum                                                {letter}|{digit}
ID                                                      {letter}{alphanum}*
VALID_ESCAPE                                            "\\f"|"\\n"|"\\t"|"\\\\"|"\\\""|"\\r"
EMPTY_STRING                                            \"\"
STRLIT                                                  \"([^\r\n\"\\]|({VALID_ESCAPE}))+\"
QUOTE                                                   \"
INVALID_ESCAPE                                          "\\"|("\\"[^\n\r])
INTLIT                                                  {decint}|({octalint})|(0[xX]{hexint})
INVALID_OCTAL                                           0[0-9]+
REALLIT                                                 (({digit}+"."{digit}*)|({digit}*"."{digit}+)|({digit}+))([eE][+-]?{digit}+)?
RESERVED                                                "--"|"++"|"break"|"default"|"interface"|"select"|"case"|"defer"|"go"|"map"|"struct"|"chan"|"goto"|"package"|"switch"|"const"|"fallthrough"|"range"|"type"|"continue"|"import"
NEWLINE                                                 "\n" 
%%
{COMMENT}                                               { BEGIN COMMENT_LINE; act_prev(); column += yyleng; }
<COMMENT_LINE>\n                                        { BEGIN 0; act_prev(); line++; column = 1; }
<COMMENT_LINE>.                                         { act_prev(); column += yyleng; }
{OPEN_COMMENT}                                          { BEGIN COMMENT_MULTILINE; act_prev(); saved_line = line, saved_column = column; column += yyleng; }
<COMMENT_MULTILINE>{CLOSE_COMMENT}                      { BEGIN 0; act_prev(); column += yyleng; }
<COMMENT_MULTILINE><<EOF>>                              { printf("Line %d, column %d: unterminated comment\n", saved_line, saved_column); BEGIN 0; }
<COMMENT_MULTILINE>.                                    { act_prev(); column += yyleng; }
<COMMENT_MULTILINE>\n                                   { act_prev();  line ++; column = 1; } 
{SEMICOLON}                                             { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(SEMICOLON_T); return SEMICOLON; }
{COMMA}                                                 { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(COMMA_T); return COMMA; }
{BLANKID}                                               { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(BLANKID_T); return BLANKID; }
{ASSIGN}                                                { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(ASSIGN_T); return ASSIGN; }
{STAR}                                                  { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(STAR_T); return STAR; }
{DIV}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(DIV_T); return DIV; }
{MINUS}                                                 { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(MINUS_T); return MINUS; }
{PLUS}                                                  { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(PLUS_T); return PLUS; }
{EQ}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(EQ_T); return EQ; }
{GE}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(GE_T); return GE; }
{GT}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(GT_T); return GT; }
{LBRACE}                                                { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(LBRACE_T); return LBRACE; }
{LE}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(LE_T); return LE; }
{LPAR}                                                  { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(LPAR_T); return LPAR; }
{LSQ}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(LSQ_T); return LSQ; }
{LT}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(LT_T); return LT; }
{MOD}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(MOD_T); return MOD; }
{NE}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(NE_T); return NE; }
{NOT}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(NOT_T); return NOT; }
{AND}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(AND_T); return AND; }
{OR}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(OR_T); return OR; }
{RBRACE}                                                { semicolon = 1; act_prev(); column += yyleng; if(print) print_tok(RBRACE_T); return RBRACE; }
{RPAR}                                                  { semicolon = 1; act_prev(); column += yyleng; if(print) print_tok(RPAR_T); return RPAR; }
{RSQ}                                                   { semicolon = 1; act_prev(); column += yyleng; if(print) print_tok(RSQ_T); return RSQ; }
{PACKAGE}                                               { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(PACKAGE_T); return PACKAGE; }
{RETURN}                                                { semicolon = 1; act_prev(); column += yyleng; if(print) print_tok(RETURN_T); return RETURN; }
{ELSE}                                                  { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(ELSE_T); return ELSE; }
{FOR}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(FOR_T); return FOR; }
{IF}                                                    { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(IF_T); return IF; }
{VAR}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(VAR_T); return VAR; }
{INT}                                                   { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(INT_T); return INT; }
{FLOAT32}                                               { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(FLOAT32_T); return FLOAT32; }
{BOOL}                                                  { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(BOOL_T); return BOOL; }
{STRING}                                                { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(STRING_T); return STRING; }
{PRINT}                                                 { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(PRINT_T); return PRINT; }
{PARSEINT}                                              { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(PARSEINT_T); return PARSEINT; }
{FUNC}                                                  { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(FUNC_T); return FUNC; }
{CMDARGS}                                               { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(CMDARGS_T); return CMDARGS; }
{RESERVED}                                              { semicolon = 0; act_prev(); column += yyleng; if(print) print_tok(RESERVED_T); return RESERVED; }
{ID}                                                    { semicolon = 1; act_prev(); column += yyleng; if(print) print_tok(ID_T); return ID; }
{INTLIT}                                                { semicolon = 1; act_prev(); column += yyleng; if(print) print_tok(INTLIT_T); return INTLIT; }
{INVALID_OCTAL}                                         { printf("Line %d, column %d: invalid octal constant (%s)\n", line, column, yytext); semicolon = 0; act_prev(); column += yyleng; }
{REALLIT}                                               { semicolon = 1; act_prev(); column += yyleng;  if(print) print_tok(REALLIT_T);return REALLIT; }
{EMPTY_STRING}                                          { semicolon = 1; act_prev(); column += yyleng;  if(print) print_tok(STRLIT_T);return STRLIT; }
{STRLIT}                                                { semicolon = 1; act_prev(); column += yyleng; BEGIN 0;  if(print) print_tok(STRLIT_T);return STRLIT; }
{QUOTE}                                                 { BEGIN INVALID_STRING; saved_line = line, saved_column = column; semicolon = 0; act_prev(); column += yyleng; } 
<INVALID_STRING>{QUOTE}                                 { BEGIN 0;  semicolon = 0; act_prev(); column += yyleng; }
<INVALID_STRING>{VALID_ESCAPE}                          { semicolon = 0; act_prev(); column += yyleng; }
<INVALID_STRING>{INVALID_ESCAPE}                        { printf("Line %d, column %d: invalid escape sequence (%s)\n", line, column, yytext); act_prev(); column += yyleng; }
<INVALID_STRING><<EOF>>                                 { BEGIN 0; printf("Line %d, column %d: unterminated string literal\n", saved_line, saved_column); column += yyleng; semicolon = 0;}
<INVALID_STRING>\n                                      { semicolon = 0; act_prev(); BEGIN 0; printf("Line %d, column %d: unterminated string literal\n", saved_line, saved_column); column = 1; line++; }
<INVALID_STRING>.                                       { act_prev();  column += yyleng; semicolon = 0; }
\n                                                      { act_prev(); column = 1; line++; if(semicolon) {semicolon = 0;  if(print) print_tok(SEMICOLON_T); return SEMICOLON;} }
<<EOF>>                                                 { if(semicolon) { semicolon=0; if(print) print_tok(SEMICOLON_T); return SEMICOLON;} return 0; }
" "|"\t"|"\r"                                           { act_prev(); column += yyleng; }
.                                                       { act_prev(); printf("Line %d, column %d: illegal character (%s)\n", line, column, yytext); semicolon = 0; act_prev(); column += yyleng; }
%%

int yywrap() {
    return 1;
}

int main(int argc, char** argv) {
    if(argc>=2 && strcmp(argv[1], "-l")==0) {
        print=1;
        yylex();
    }
    else {
        if(argc>=2 && strcmp(argv[1], "-t")==0) {
        stack = new_vector(sizeof(ast_ptr));
        yyparse();
        if(stack.size == 1 && ! syn_error){
        ast_ptr root = *(ast_ptr*)get(&stack,0);
        handle_blocks(root);
        print_ast_tree(root, 0);
    }
    }
    }
}
