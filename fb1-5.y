%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER ADD SUB MUL DIV ABS EOL

%%

calclist:
        /* 빈 줄 허용 */
    |   calclist exp EOL { printf("= %d\n", $2); }
;

exp:
        factor               { $$ = $1; }
    |   exp ADD factor       { $$ = $1 + $3; }
    |   exp SUB factor       { $$ = $1 - $3; }
;

factor:
        term                 { $$ = $1; }
    |   factor MUL term      { $$ = $1 * $3; }
    |   factor DIV term      { $$ = $1 / $3; }
;

term:
        NUMBER               { $$ = $1; }
    |   ABS term             { $$ = $2 >= 0 ? $2 : -$2; }
;

%%

int main(void) {
    return yyparse();
}

int yyerror(const char *s) {
    fprintf(stderr, "error: %s\n", s);
    return 0;
}

