%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    int ind=0;
    char temp='A';
    void q();
    char addtotable(char, char, char);
    struct incod {
        char opd1;
        char opd2;
        char opr;
    };
    int yylex(void);
    void yyerror();
%}
%union{
    char sym;
}
%token <sym> NUMBER LETTER
%type <sym> expr
%left '+'  '-'
%left '*' '/'
%%
S: LETTER '=' expr ';' {addtotable($1,$3,'=');}
| expr ';' 
;
expr: expr '+' expr {$$=addtotable($1,$3,'+');}
|  expr '-' expr {$$=addtotable($1,$3,'-');}
|  expr '*' expr {$$=addtotable($1,$3,'*');}
|  expr '/' expr {$$=addtotable($1,$3,'/');}
| '(' expr ')' {$$=$2;}
| LETTER {$$=$1;}
| NUMBER {$$=$1;}
;
%%
struct incod code[20];
char addtotable(char opd1, char opd2, char opr)
{
    code[ind].opd1=opd1;
    code[ind].opd2=opd2;
    code[ind].opr=opr;
    ind++;
    return temp++;
}
void q()
{
    printf("Quadruple three address code\n");
    for(int i=0;i<ind;i++)
    {
        printf("%d\t%c\t%c\t%c\n",i,code[i].opr,code[i].opd1,code[i].opd2);
    }
}
void threeAddressCode() {
    printf("\nTHREE ADDRESS CODE\n");
    char tmp = 'T';  // Temporary variable for 3AC
    for (int i = 0; i < ind; i++) {
        if (code[i].opr == '=') {
            printf("%c = %c\n", code[i].opd1, code[i].opd2); // Assignment
        } else {
            printf("%c = %c %c %c\n", tmp++, code[i].opd1, code[i].opr, code[i].opd2); // Operation
        }
    }
}
int main()
{
    printf("Enter thr expression\n");
    yyparse();
    q();
    return 0;
}
void yyerror()
{
    printf("Error");
    exit(1);
}
