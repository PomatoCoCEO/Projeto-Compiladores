/*
    Compiladores, 2021

    Meta 1

    Autores:
        Paulo Cortesão, uc2019216517
        Samuel Carinhas, uc2019217199
*/

%X COMMENT_LINE COMMENT_MULTILINE
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
alphanum                                                {letter}|{digit}
ID                                                      {letter}{alphanum}*
STRLIT                                                  \"[^\r\n\"]\"
INTLIT                                                  {digit}+|0[xX]({digit}+|[a-fA-F])+
REALLIT                                                 {digit}+"."({digit}+|([eE][+-]?{digit}+))
RESERVED                                                "--"|"++"|"break"|"default"|"interface"|"select"|"case"|"defer"|"go"|"map"|"struct"|"chan"|"goto"|"package"|"switch"|"const"|"fallthrough"|"range"|"type"|"continue"|"import"
NEWLINE                                                 "\n" 
%%
{COMMENT}                                               { BEGIN COMMENT_LINE; }
<COMMENT_LINE>\n                                        { BEGIN 0; }
<COMMENT_LINE>.                                         ;
{OPEN_COMMENT}                                          { BEGIN COMMENT_MULTILINE; }
<COMMENT_MULTILINE>{CLOSE_COMMENT}                      { BEGIN 0; }
<COMMENT_MULTILINE>(.|\n)                               ;
{SEMICOLON}                                             { printf("SEMICOLON\n"); }
{COMMA}                                                 { printf("COMMA\n"); }
{BLANKID}                                               { printf("BLANKID\n"); }
{ASSIGN}                                                { printf("ASSIGN\n"); }
{STAR}                                                  { printf("STAR\n"); }
{DIV}                                                   { printf("DIV\n"); }
{MINUS}                                                 { printf("MINUS\n"); }
{PLUS}                                                  { printf("PLUS\n"); }
{EQ}                                                    { printf("EQ\n"); }
{GE}                                                    { printf("GE\n"); }
{GT}                                                    { printf("GT\n"); }
{LBRACE}                                                { printf("LBRACE\n"); }
{LE}                                                    { printf("LE\n"); }
{LPAR}                                                  { printf("LPAR\n"); }
{LSQ}                                                   { printf("LSQ\n"); }
{LT}                                                    { printf("LT\n"); }
{MOD}                                                   { printf("MOD\n"); }
{NE}                                                    { printf("NE\n"); }
{NOT}                                                   { printf("NOT\n"); }
{AND}                                                   { printf("AND\n"); }
{OR}                                                    { printf("OR\n"); }
{RBRACE}                                                { printf("RBRACE\n"); }
{RPAR}                                                  { printf("RPAR\n"); }
{RSQ}                                                   { printf("RSQ\n"); }
{PACKAGE}                                               { printf("PACKAGE\n"); }
{RETURN}                                                { printf("RETURN\n"); }
{ELSE}                                                  { printf("ELSE\n"); }
{FOR}                                                   { printf("FOR\n"); }
{IF}                                                    { printf("IF\n"); }
{VAR}                                                   { printf("VAR\n"); }
{INT}                                                   { printf("INT\n"); }
{FLOAT32}                                               { printf("FLOAT32\n"); }
{BOOL}                                                  { printf("BOOL\n"); }
{STRING}                                                { printf("STRING\n"); }
{PRINT}                                                 { printf("PRINT\n"); }
{PARSEINT}                                              { printf("PARSEINT\n"); }
{FUNC}                                                  { printf("FUNC\n"); }
{CMDARGS}                                               { printf("CMDARGS\n"); }
{RESERVED}                                              { printf("RESERVED\n"); }
{ID}                                                    { printf("ID(%s)\n", yytext); }
{STRLIT}                                                { printf("STRLIT(%s)\n", yytext); }
{INTLIT}                                                { printf("INTLIT(%s)\n", yytext); }
{REALLIT}                                               { printf("REALLIT(%s)\n", yytext); }
"\n"|" "|"\t"|"\r"                                      ;
.                                                       ;
%%
int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
