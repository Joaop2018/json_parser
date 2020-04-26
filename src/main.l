
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%

\{ {return '{';}
\} {return '}';}
\[ {return '[';}
\] {return ']';}
\" {return '"';}
\: {return ':';}
\, {return ',';}
[\n] {return '\n';}
[0-9]+ {return INT;}
[a-zA-Z]+ {return STR;}
. ;


%%

int yywrap() {
  return 1;
}
