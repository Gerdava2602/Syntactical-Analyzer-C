%{
#include <stdio.h>

int yylex();
void yyerror(char* s);
%}

%token NUM
%token NOT
%token AND
%token OR
%token XOR
%token SUM
%token MENOS
%token MULT
%token DIV
%token PAR_A
%token PAR_C

%error-verbose

%%

expr: NUM
    | expr SUM expr
    | expr MENOS expr
    | expr MULT expr
    | expr DIV expr
    | expr AND expr
    | expr OR expr
    | expr XOR expr
    | NOT expr
    | PAR_A expr PAR_C
    ;

%%

int errors = 0;

void yyerror(char* s) {
    fprintf(stderr, "Syntax error: %s\n", s);
    fprintf(stderr, "Input string that caused the error: %s\n", yytext);
    errors++;
}