%{
    #include <stdlib.h>
    #include <stdio.h>

    void yyerror(const char *s);
    int yylex(void);
%}

%token RET TYPE IDEN NUM
%left '+' '-'
%left '*' '/'

%%

// Starting rule
S: FUN { printf("Accepted\n"); exit(0); }
;

// Function definition
FUN: TYPE IDEN '(' PARAMS ')' '{' BODY '}'
;

// Function body - list of statements or a return
BODY: STATEMENT_LIST 
     | R ';'
;

// List of statements
STATEMENT_LIST: STATEMENT_LIST STATEMENT 
              | STATEMENT
;

// Parameter list
PARAMS: PARAM ',' PARAMS 
       | PARAM 
       | 
;

// Parameter definition
PARAM: TYPE IDEN
;

// Statement
STATEMENT: ASSGN ';' 
          | DECL ';' 
          | E ';' 
;

// Declaration (without and with initialization)
DECL: TYPE IDEN 
    | TYPE IDEN '=' E
;

// Assignment
ASSGN: IDEN '=' E
;

// Return statement
R: RET E
;

// Expressions
E: E '+' E
 | E '-' E
 | E '*' E
 | E '/' E
 | IDEN
 | NUM
;

%%

// Main function
int main() {
    printf("Enter the function definition: ");
    yyparse();
    return 0;
}

// Error handling
void yyerror(const char *s) {
    printf("Error: %s\n", s);
    exit(1);
}
