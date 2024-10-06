%{
    int l=0;
    int w=0;
    int c=0;
    int s=0;
%}

%%
[ ] {s++;}
[\t] {s+=3;}
[.] {l++;}
[a-zA-Z]+ {w++; c+=yyleng;}
\n {return 0;}

%%

int main()
{
    printf("Enter the string");
    yylex();
    printf("%d %d %d %d",l,s,c,w);
}
int yywrap()
{
    return 1;
}