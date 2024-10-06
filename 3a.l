%{
    #include <stdio.h>
    int nc=0;
%}

%%
"/*"[a-zA-Z0-9\t\n ]*"*/" {nc++;}
"//"[a-zA-Z0-9\t ]*\n {nc++; fprintf(yyout, "\n");}
. {fprintf(yyout, "%s", yytext);}
%%

int main()
{
    yyin=fopen("3a_ip.txt","r");
    yyout=fopen("3a_op.txt","w");

    yylex();
    printf("%d",nc);
    return 0;
}
int yywrap()
{
    return 1;
}