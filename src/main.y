

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' '[' ']' ':' ',' '"' STR INT FLOAT

%%
S:
        JSON   {printf("VALIDO\n");}
        ;

JSON:
        '{' CONT '}'  {}
        ;

CONT:
        '"' STR '"' ':' A {}
        | CONT ',' CONT {}
        ;

A:
        '"' STR '"' {}
        | INT     {}
        | FLOAT {}
        | JSON {}
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

void yyerror(char *s) { printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
