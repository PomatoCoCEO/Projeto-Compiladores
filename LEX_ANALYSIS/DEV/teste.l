%X MODO
%%
a                                                           { BEGIN 0; }
<MODO,*>(.|\n)                                                        ;
%%
int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
