%{
#include "3b.tab.h"
%}

%%

"for" return FOR;

[a-zA-Z]+ return EXP; //EXP here means IDENTIFIER. Better to rename
[0-9]+ return NUM;
"<=" return LE;
">=" return GE;
"++" return INC;
"--" return DEC;
"(" return '(';
")" return ')';
"{" return '{';
"}" return '}';

";" return ';';
"=" return '=';
">" return '>';
"<" return '<';
\n return 0;
. {/*Ignore anything else*/};

%%

int yywrap() {
	return 1;
}

