
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
[0-9]+ {return INT;}
[a-zA-Z0-9]+[a-zA-Z0-9\ ]* {return STR;}
[0-9]+[.][0-9]+ {return FLOAT;}
[\n]* {return EOL;}
. ;




%%

int yywrap() {
  return 1;
}
