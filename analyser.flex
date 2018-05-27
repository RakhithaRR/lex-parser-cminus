%{                                                                                          
#include "parser.tab.h"                                                                     
extern int line_number;
void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
 }                                                                          
%}                                                                                          
%option noyywrap                                                                            


%%                                                                                          

"else"                                    {return ELSE;}
"if"                                      {return IF;}
"int"                                     {return INT;}
"return"                                  {return RETURN;}
"void"                                    {return VOID;}
"while"                                   {return WHILE;}


"+"                                       {return ADD;}
"-"                                       {return SUBTRACT;}
"*"                                       {return MULTIPLY;}
"/"                                       {return DIVIDE;}
"<"                                       {return LESS_THAN;}
"<="                                      {return LESS_THAN_OR_EQUAL;}
">"                                       {return GREATER_THAN;}
">="                                      {return GREATER_THAN_OR_EQUAL;}
"=="                                      {return EQUAL;}
"!="                                      {return NOT_EQUAL;}
"="                                       {return ASSIGNMENT;}
";"                                       {return EOL;}
","                                       {return COMMA;}
"{"                                       {return LEFT_BRACE;}
"}"                                       {return RIGHT_BRACE;}
"("                                       {return LEFT_PARANTHESE;}
")"                                       {return RIGHT_PARANTHESE;}
"["                                       {return LEFT_BRACKET;}
"]"                                       {return RIGHT_BRACKET;}
[ \t\r]+                                  {;}
[\n]                                      {;}
[/][*]([^*]|\*+[^*/])*\*+"/"              {;}


[a-zA-Z][a-zA-Z]*   {return ID;}
[0-9][0-9]*         {return NUM;}

%%

