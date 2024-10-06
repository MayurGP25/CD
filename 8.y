%{
    #include <stdio.h>
    #include <stdlib.h>
    #include<string.h>
    void yyerror();
    int yylex(void);
%}

%union
{
    char *id;
    char *str;
    int num;
}

%token<id> ID
%token<num> NUM
%token<str> STRING
%token INT MAIN PRINTF ADD ASSIGN SEMI COMMA LPAREN RPAREN LBRACE RBRACE 
%start S

%%
S: INT MAIN LPAREN RPAREN LBRACE stmt_list RBRACE
   {
      printf(".data");
      printf(".LCO");
      printf(".text");
      printf(".globl main");
      printf(".main:");
   }
;

stmt_list: stmt 
| stmt_list stmt
;

stmt: INT ID ASSIGN NUM SEMI {
    printf("movl $%d, %s",$4,$2);
}

    | ID ASSIGN ID ADD ID SEMI {
        printf("    movl %s, %%eax\n", $3);
        printf("    addl %s, %%eax\n", $5);
        printf("    movl %%eax, %s\n", $1);
    }
    | PRINTF LPAREN STRING COMMA ID RPAREN SEMI {
        printf("    movl %s, %%edi\n", $5);  // Load argument into %edi
        printf("    movl $.LC0, %%rsi\n");   // Address of format string into %rsi
        printf("    call printf\n");         // Call printf function
    }
    ;
%%

int main() {
    printf("Assembly code output:\n");
    yyparse();
    return 0;
}

void yyerror()
{
    printf("Error");
    exit(1);
}