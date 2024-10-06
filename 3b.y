%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror();
    int n=0;
%}

%token FOR EXP NUM GE LE INC DEC

%%
S: I
;
I: FOR A B {n++;}
;
A: '(' E ';' E ';' E ')'
;
B: '{' B '}'
| I
| E
|
;
E: EXP Z EXP
| EXP Z NUM
| EXP INC 
| EXP DEC 
| INC EXP 
| DEC EXP 
;
Z: '>'
| '<'
| '='
| GE
| LE
;

%%
int main()
{
    printf("Enter the for statements\n");
    yyparse();
    printf("Number of nesting levels = %d",n);
    return 0;
}
void yyerror()
{
    printf("ERROR");
    exit(1);
}