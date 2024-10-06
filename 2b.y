%{ 
    #include <stdio.h>
    #include<stdlib.h>
    #include<stdlib.h>
    void yyerror();
    int yylex(void);
    
    %}

%token NUM
%left '+' '-'
%left '*' '/'

%%
S: I {printf("Result is %d",$$);};
I: I '+' I {$$=$1 + $3;} 
|  I '-' I {$$=$1 - $3;} 
| I '*' I {$$=$1 * $3;} 
| I '/' I {
    if($3 == 0)
      yyerror();
      else
      $$=$1/$3;
} 
| '(' I ')' {$$=$2;} 
| NUM
;

%%

int main()
{
    if(yyparse()==0)
      printf("Valid string");
    return 0;
}
void yyerror()
{
    printf("ERROR");
    exit(1);
}