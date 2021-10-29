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
    int semicolon = 0, column = 1, line = 1, saved_line, saved_column, prev_col=1, prev_line=1; 
    void act_prev() {prev_col = column, prev_line= line;}
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
{SEMICOLON}                                             { semicolon = 0; act_prev();  column += yyleng;  return SEMICOLON; }
{COMMA}                                                 { semicolon = 0; act_prev();   column += yyleng; return COMMA;}
{BLANKID}                                               {  semicolon = 0; act_prev();   column += yyleng; return BLANKID; }
{ASSIGN}                                                { semicolon = 0; act_prev();   column += yyleng; return ASSIGN;}
{STAR}                                                  { semicolon = 0; act_prev();   column += yyleng; return STAR;}
{DIV}                                                   { semicolon = 0; act_prev();   column += yyleng; return DIV; }
{MINUS}                                                 {  semicolon = 0; act_prev();   column += yyleng; return MINUS;}
{PLUS}                                                  { semicolon = 0; act_prev();   column += yyleng; return PLUS;}
{EQ}                                                    { semicolon = 0; act_prev();   column += yyleng; return EQ;}
{GE}                                                    {  semicolon = 0; act_prev();   column += yyleng; return GE;}
{GT}                                                    {  semicolon = 0; act_prev(); column += yyleng;  return GT;}
{LBRACE}                                                { semicolon = 0; act_prev(); column += yyleng; return LBRACE;}
{LE}                                                    { semicolon = 0; act_prev(); column += yyleng; return LE; }
{LPAR}                                                  { semicolon = 0; act_prev(); column += yyleng; return LPAR;}
{LSQ}                                                   {  semicolon = 0; act_prev(); column += yyleng; return LSQ;}
{LT}                                                    { semicolon = 0; act_prev(); column += yyleng; return LT;}
{MOD}                                                   { semicolon = 0; act_prev(); column += yyleng; return MOD;}
{NE}                                                    {  semicolon = 0; act_prev(); column += yyleng; return NE;}
{NOT}                                                   { semicolon = 0; act_prev(); column += yyleng; return NOT;}
{AND}                                                   { semicolon = 0; act_prev(); column += yyleng; return AND;}
{OR}                                                    { semicolon = 0; act_prev(); column += yyleng; return OR;}
{RBRACE}                                                { semicolon = 1; act_prev(); column += yyleng; return RBRACE;}
{RPAR}                                                  { semicolon = 1; act_prev(); column += yyleng; return RPAR;}
{RSQ}                                                   { semicolon = 1; act_prev(); column += yyleng; return RSQ;}
{PACKAGE}                                               { semicolon = 0; act_prev(); column += yyleng; return PACKAGE;}
{RETURN}                                                { semicolon = 1; act_prev(); column += yyleng; return RETURN;}
{ELSE}                                                  { semicolon = 0; act_prev(); column += yyleng; return ELSE;}
{FOR}                                                   { semicolon = 0; act_prev(); column += yyleng; return FOR;}
{IF}                                                    { semicolon = 0; act_prev(); column += yyleng; return IF;}
{VAR}                                                   { semicolon = 0; act_prev(); column += yyleng; return VAR;}
{INT}                                                   {  semicolon = 0; act_prev(); column += yyleng; return INT;}
{FLOAT32}                                               { semicolon = 0; act_prev(); column += yyleng; return FLOAT32;}
{BOOL}                                                  { semicolon = 0; act_prev(); column += yyleng; return BOOL;}
{STRING}                                                { semicolon = 0; act_prev(); column += yyleng; return STRING;}
{PRINT}                                                 { semicolon = 0; act_prev(); column += yyleng; return PRINT;}
{PARSEINT}                                              { semicolon = 0; act_prev(); column += yyleng; return PARSEINT;}
{FUNC}                                                  { semicolon = 0; act_prev(); column += yyleng; return FUNC;}
{CMDARGS}                                               { semicolon = 0; act_prev(); column += yyleng; return CMDARGS;}
{RESERVED}                                              { semicolon = 0; act_prev(); column += yyleng; return RESERVED;}
{ID}                                                    { semicolon = 1; act_prev(); column += yyleng; return ID;}
{INTLIT}                                                { semicolon = 1; act_prev(); column += yyleng; return INTLIT;}
{INVALID_OCTAL}                                         { printf("Line %d, column %d: invalid octal constant (%s)\n", line, column, yytext); semicolon = 0; act_prev(); column += yyleng; }
{REALLIT}                                               { semicolon = 1; act_prev(); column += yyleng; return REALLIT;}
{EMPTY_STRING}                                          { semicolon = 1; act_prev(); column += yyleng; return STRLIT;}
{STRLIT}                                                { semicolon = 1; act_prev(); column += yyleng; BEGIN 0; return STRLIT;}
{QUOTE}                                                 { BEGIN INVALID_STRING; semicolon = 0; act_prev(); column += yyleng; } 
<INVALID_STRING>{QUOTE}                                 { BEGIN 0;  semicolon = 0; act_prev(); column += yyleng;}
<INVALID_STRING>{VALID_ESCAPE}                          { semicolon = 0; act_prev(); column += yyleng;  }
<INVALID_STRING>{INVALID_ESCAPE}                        { printf("Line %d, column %d: invalid escape sequence (%s)\n", line, column, yytext); act_prev(); column += yyleng; }
<INVALID_STRING><<EOF>>                                 { BEGIN 0; printf("Line %d, column %d: unterminated string literal\n", saved_line, saved_column); column += yyleng; semicolon = 0;  }
<INVALID_STRING>\n                                      { semicolon = 0; act_prev(); BEGIN 0; printf("Line %d, column %d: unterminated string literal\n", saved_line, saved_column); column = 1; line++;}
<INVALID_STRING>.                                       { act_prev();  column += yyleng; semicolon = 0;}
\n                                                      { act_prev(); column = 1; line++; if(semicolon) {semicolon = 0;   return SEMICOLON;}   }
<<EOF>>                                                 { if(semicolon) { semicolon=0; return SEMICOLON;} return 0; }
" "|"\t"|"\r"                                           { act_prev(); column += yyleng; }
.                                                       { act_prev(); printf("Line %d, column %d: illegal character (%s)\n", line, column, yytext); semicolon = 0; act_prev(); column += yyleng; }
%%

int yywrap() {
    return 1;
}
