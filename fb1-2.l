/* English -> American */
%%
"colour" { printf("color"); }
"flavour" { printf("flavor"); }
"smart" { printf("elegant"); }
"clever" { printf("smart"); }
"conservative" { printf("liberal"); }
. { printf("%s", yytext); }
%% 
