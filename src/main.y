

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' '[' ']' ':' ',' '"' STR INT

%%
DICI:
        '{' CONT '}' {}
        ;

CONT:
        '"' STR '"' ':' A {}
        ;

A:
        '"' STR '"' {}
        | INT     {}
        | DIC {}
        | LIST {}
        ;

LIST:
        '[' B ']' {}
        ;

B:
        D  {}
        |
        ;

D:
        D ',' D {}
        | A {}
        
%%

void yyerror(char *s) {
}

int main() {
  yyparse();
    return 0;

}
