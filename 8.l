%{
    #include "8.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    #include<string.h>
%}

DIGIT [0-9]
ID [a-zA-z][a-zA-Z]* 
STRING \"[^"]*\" 
WS [\t\n]

%%


"int" {return INT;}
"main" {return MAIN;}
"printf" {return PRINTF;}
{DIGIT}+ {yylval.num=atoi(yytext); return NUM;}
{ID} {yylval.id=strdup(yytext); return ID;}
{STRING} {yylval.str=strdup(yytext); return STRING;}
"=" {return ASSIGN;}
"(" {return LPAREN;}
")" {return RPAREN;}
"{" {return LBRACE;}
"}" {return RBRACE;}
";" {return SEMI;}
"," {return COMMA;}
"+" {return ADD;}
{WS} ;
%%


int yywrap()
{
    return 1;
}