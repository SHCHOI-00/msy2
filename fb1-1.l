/* Example 1-1. Word count fb1-1.l */

/* just like Unix wc */
%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+    { words++; chars += strlen(yytext); }
\n           { chars++; lines++; }
.            { chars++; }

%%

int main(int argc, char **argv)
{
    yylex();
    printf("%d %d %d\n", lines, words, chars);
}

