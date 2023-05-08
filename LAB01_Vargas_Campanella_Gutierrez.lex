%{
#include <stdio.h>
#include "y.tab.c"
int count = 1;
int numcount = 1;
int error = 0;
%}

BINARY [01]
op-not not
op-or or
op-and and
op-xor xor
op-mul \*
op-div \/
op-sum \+
op-menos \-
par-a \(
par-c \)
space [ \t]+
%%
{BINARY}+  {printf("num%d: %s\n", numcount,yytext); numcount++; return NUM;};
{op-not}  {printf("opt-not: %s\n", yytext); return NOT;}
{op-or}   {printf("opt-or: %s\n", yytext); return OR;}
{op-and}  {printf("opt-and: %s\n", yytext); return AND;}
{op-xor}  {printf("opt-xor: %s\n", yytext); return XOR;}
{op-sum}  {printf("opt-sum: %s\n", yytext); return SUM;}
{op-mul}  {printf("opt-mul: %s\n", yytext); return MULT;}
{op-div}  {printf("opt-div: %s\n", yytext); return DIV;}
{op-menos}  {printf("opt-menos: %s\n", yytext); return MENOS;}
{par-a}   {printf("par-a: %s\n", yytext); return PAR_A;}
{par-c}   {printf("par-c: %s\n", yytext); return PAR_C;}
{space}    {/* do nothing */ }
[01]*[2-9a-zA-Z][0-9a-zA-Z]*|[01]*[0-9]*[2-9a-zA-Z][0-9a-zA-Z]* {printf("ERROR Léxico!!\n"); error=1;};
\n {
    printf("Análisis Sintáctico:\n");
    if(error == 0) {
        if(errors > 0){
            printf("Errores Sintacticos: %d\n", errors);
        }else {
            printf("No se encontraron errores sintacticos\n");
        }
    }else {
        printf("No se ejecuta\n");
    }
    printf("---Line %d---\n", count); 
    count++;
    numcount = 1;
}
. printf("ERROR Léxico!!\n"); error=1;
%%

#define MAX_LINE_LENGTH 2048


int yywrap(){}
int main(int argc, char *argv[]) {
    if(argc == 2){
        FILE *fp;
        char line[MAX_LINE_LENGTH];

        // open the file for reading
        fp = fopen(argv[1], "r");

        // check if file exists and can be opened
        if (fp == NULL) {
            printf("Unable to open file\n");
            return 1;
        }

        printf("Componentes Léxicos:\n");
        printf("---Line 0---\n");
        while (fgets(line, sizeof(line), fp)) {
            printf("%s", line);
            YY_BUFFER_STATE buffer = yy_scan_string(line); 
            while (yylex() != 0) {
            
            }
            yyparse(); 
            yy_delete_buffer(buffer); 
        }
        // close the file
        fclose(fp);
    } else {
        printf("Only pass one parameter");
    }
    return 0;
}

