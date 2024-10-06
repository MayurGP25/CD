%{
    #include <stdio.h>
    int k=0;
    int id=0;
    int op=0;
%}


%%
"int"|"float"|"char"|"main" {k++;}
[a-zA-Z][a-zA-Z0-9_]* {id++;}
[+] {op++;}
[-] {op++;}
[*] {op++;}
[/] {op++;}
%%
int main()
{
    yyin=fopen("4a.txt","r");
    yylex();
    printf("%d %d %d",k,id,op);
    return 0;
}
int yywrap()
{
    return 1;
}