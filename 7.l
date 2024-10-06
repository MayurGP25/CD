%{
    #include "7.tab.h"
%}

%%
[\t\n ] ;

"int"|"float"|"char"|"void" {return TYPE;}

[a-zA-Z][a-zA-Z0-9_]* { 
    if (strcmp(yytext, "return") == 0) {
        return RET;  // Return the RET token for 'return'
    }
    return IDEN;  // Otherwise, treat it as an identifier
}

[0-9]+ {return NUM;}

. {return yytext[0];}

%%

int yywrap()
{
    return 1;
}