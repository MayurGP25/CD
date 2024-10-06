%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror();
    int n=0;
%}
%token IF EXP NUM

%%
S: I;
I: IF A B {n++;}
;
A: '(' EXP ')'
| '(' NUM ')'
;
B: '{' B '}'
| I
|
;
%%
int main()
{
    printf("\n");
    yyparse();
    printf("%d",n);
    return 0;
}
void yyerror()
{
    printf("ERROR");
    exit(1);
}