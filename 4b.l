%{
    #include "4b.tab.h"

%}

%%
"if" {return IF;}
"(" {return '(';}
")" {return ')';}
"{" {return '{';}
"}" {return '}';}
[0-9]+ {return NUM;}
[a-zA-Z]+ {return EXP;}
\n {return 0;}
. {}
%%

int yywrap()
{
    return 1;
}