
%{
#include "fb1-5.tab.h"
#include <stdio.h>
#include <stdlib.h>

extern int yylval;
%}

%%

"+"       { return ADD; }
"-"       { return SUB; }
"*"       { return MUL; }
"/"       { return DIV; }
"|"       { return ABS; }
[0-9]+    { yylval = atoi(yytext); return NUMBER; }
\n        { return EOL; }
[ \t]     { /* skip whitespace */ }

"("       { return OP; }
")"       { return CP; }

"//".*  /* ignore comments */
.     { printf("Unknown char: %s\n", yytext); }
%%


