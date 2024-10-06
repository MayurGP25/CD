%{
    #include "5.tab.h"
%}
%%
"int"|"float"|"char" {return TYPE;}
[a-zA-Z][a-zA-Z0-9_]* {return IDENTIFIER;}
[0-9]+ {return NUM;}
"[" {return '[';}
"]" {return ']';}   
"," {return ',';}
";" {return ';';}

\n {return 0;}
. {}
%%
int yywrap()
{
    return 1;
}