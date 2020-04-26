

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' '[' ']' ':' ',' '"' '\n' STR INT

%%
S:
        DIC '\n' {printf('VALIDO\n');}

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

void yyerror(char *s) { printf('INVALIDO\n');
}

int main() {
  yyparse();
    return 0;

}
