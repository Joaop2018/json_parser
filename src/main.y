

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' '[' ']' ':' ',' '"' EOL STR INT FLOAT

%%
S:
        DICI EOL  {printf("VALIDO\n");}
        ;

DICI:
        '{' CONT '}' {}
        ;

CONT:
        '"' STR '"' ':' A {}
        | CONT ',' CONT {}
        ;

A:
        '"' STR '"' {}
        | INT     {}
        | FLOAT {}
        | DICI {}
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
