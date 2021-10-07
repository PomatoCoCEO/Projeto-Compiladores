/*
    Compiladores, 2021

    Meta 1

    Autores:
        Paulo Cortesão, uc2019216517
        Samuel Carinhas, uc2019217199
*/

%X COMMENT_LINE COMMENT_MULTILINE
%{
    int semicolon = 0, column = 1, line = 1, comment_line, comment_column;
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
decint                                                  {digit}({digit})*
hexint                                                  {hexdigit}({hexdigit})*
octalint                                                {octaldigit}({octaldigit})*
alphanum                                                {letter}|{digit}
ID                                                      {letter}{alphanum}*
STRLIT                                                  \"([^\r\n\"]|(\\\"))*\"
INTLIT                                                  {decint}|(0{octalint})|(0[xX]{hexint})
REALLIT                                                 (({decint}"."?{decint}?)|({decint}?"."{decint}))([eE][+-]?{decint})?
RESERVED                                                "--"|"++"|"break"|"default"|"interface"|"select"|"case"|"defer"|"go"|"map"|"struct"|"chan"|"goto"|"package"|"switch"|"const"|"fallthrough"|"range"|"type"|"continue"|"import"
NEWLINE                                                 "\n" 
%%
{COMMENT}                                               { BEGIN COMMENT_LINE; semicolon = 0; column += yyleng ; }
<COMMENT_LINE>\n                                        { BEGIN 0; line += 1; semicolon = 0; column = 1 ; }
<COMMENT_LINE>.                                         { column += yyleng; }
{OPEN_COMMENT}                                          { BEGIN COMMENT_MULTILINE; semicolon = 0; comment_line = line, comment_column = column; column += yyleng;}
<COMMENT_MULTILINE>{CLOSE_COMMENT}                      { BEGIN 0; semicolon = 0; column += yyleng ; }
<COMMENT_MULTILINE><<EOF>>                              { printf("Line %d, column %d: unterminated comment\n", comment_line, comment_column); BEGIN 0; }
<COMMENT_MULTILINE>.                                    { column += yyleng; }
<COMMENT_MULTILINE>\n                                   { line += 1; column = 1; }
{SEMICOLON}                                             { printf("SEMICOLON\n"); semicolon = 0; column += yyleng ; }
{COMMA}                                                 { printf("COMMA\n"); semicolon = 0; column += yyleng ; }
{BLANKID}                                               { printf("BLANKID\n"); semicolon = 0; column += yyleng ; }
{ASSIGN}                                                { printf("ASSIGN\n"); semicolon = 0; column += yyleng ; }
{STAR}                                                  { printf("STAR\n"); semicolon = 0; column += yyleng ; }
{DIV}                                                   { printf("DIV\n"); semicolon = 0; column += yyleng ; }
{MINUS}                                                 { printf("MINUS\n"); semicolon = 0; column += yyleng ; }
{PLUS}                                                  { printf("PLUS\n"); semicolon = 0; column += yyleng ; }
{EQ}                                                    { printf("EQ\n"); semicolon = 0; column += yyleng ; }
{GE}                                                    { printf("GE\n"); semicolon = 0; column += yyleng ; }
{GT}                                                    { printf("GT\n"); semicolon = 0; column += yyleng ; }
{LBRACE}                                                { printf("LBRACE\n"); semicolon = 0; column += yyleng ; }
{LE}                                                    { printf("LE\n"); semicolon = 0; column += yyleng ; }
{LPAR}                                                  { printf("LPAR\n"); semicolon = 0; column += yyleng ; }
{LSQ}                                                   { printf("LSQ\n"); semicolon = 0; column += yyleng ; }
{LT}                                                    { printf("LT\n"); semicolon = 0; column += yyleng ; }
{MOD}                                                   { printf("MOD\n"); semicolon = 0; column += yyleng ; }
{NE}                                                    { printf("NE\n"); semicolon = 0; column += yyleng ; }
{NOT}                                                   { printf("NOT\n"); semicolon = 0; column += yyleng ; }
{AND}                                                   { printf("AND\n"); semicolon = 0; column += yyleng ; }
{OR}                                                    { printf("OR\n"); semicolon = 0; column += yyleng ; }
{RBRACE}                                                { printf("RBRACE\n"); semicolon = 1; column += yyleng ; }
{RPAR}                                                  { printf("RPAR\n"); semicolon = 1; column += yyleng ; }
{RSQ}                                                   { printf("RSQ\n"); semicolon = 1; column += yyleng ; }
{PACKAGE}                                               { printf("PACKAGE\n"); semicolon = 0; column += yyleng ; }
{RETURN}                                                { printf("RETURN\n"); semicolon = 1; column += yyleng ; }
{ELSE}                                                  { printf("ELSE\n"); semicolon = 0; column += yyleng ; }
{FOR}                                                   { printf("FOR\n"); semicolon = 0; column += yyleng ; }
{IF}                                                    { printf("IF\n"); semicolon = 0; column += yyleng ; }
{VAR}                                                   { printf("VAR\n"); semicolon = 0; column += yyleng ; }
{INT}                                                   { printf("INT\n"); semicolon = 0; column += yyleng ; }
{FLOAT32}                                               { printf("FLOAT32\n"); semicolon = 0; column += yyleng ; }
{BOOL}                                                  { printf("BOOL\n"); semicolon = 0; column += yyleng ; }
{STRING}                                                { printf("STRING\n"); semicolon = 0; column += yyleng ; }
{PRINT}                                                 { printf("PRINT\n"); semicolon = 0; column += yyleng ; }
{PARSEINT}                                              { printf("PARSEINT\n"); semicolon = 0; column += yyleng ; }
{FUNC}                                                  { printf("FUNC\n"); semicolon = 0; column += yyleng ; }
{CMDARGS}                                               { printf("CMDARGS\n"); semicolon = 0; column += yyleng ; }
{RESERVED}                                              { printf("RESERVED(%s)\n", yytext); semicolon = 0; column += yyleng ; }
{ID}                                                    { printf("ID(%s)\n", yytext); semicolon = 1; column += yyleng ; }
{STRLIT}                                                { printf("STRLIT(%s)\n", yytext); semicolon = 1; column += yyleng ; }
{INTLIT}                                                { printf("INTLIT(%s)\n", yytext); semicolon = 1; column += yyleng ; }
{REALLIT}                                               { printf("REALLIT(%s)\n", yytext); semicolon = 1; column += yyleng ; }
\n                                                      { if(semicolon) printf("SEMICOLON\n"); semicolon = 0; column = 1 ; line++; }
" "|"\t"|"\r"                                           { column += yyleng; }
.                                                       { printf("Line %d, column %d: illegal character (%s)\n", line, column, yytext); semicolon = 0; column += yyleng; }
%%
int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
