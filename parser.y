%{                                                                                   
   #include <stdarg.h> 
   #include "analyser_shared.h"                                                        
   #define YYSTYPE char *                                                            
   int yydebug=1;                                                                    
   int indent=0;                                                                     
   char *iden_dum;                                                                   
%}                                                                                   

/*TOKENS*/
%token ELSE
%token IF
%token INT
%token RETURN
%token VOID
%token WHILE
%token ADD
%token SUBTRACT
%token MULTIPLY
%token DIVIDE
%token LESS_THAN
%token LESS_THAN_OR_EQUAL
%token GREATER_THAN
%token GREATER_THAN_OR_EQUAL
%token EQUAL
%token NOT_EQUAL
%token ASSIGNMENT
%token EOL
%token COMMA
%token LEFT_BRACE
%token RIGHT_BRACE
%token LEFT_PARANTHESE
%token RIGHT_PARANTHESE
%token LEFT_BRACKET
%token RIGHT_BRACKET
%token ID
%token NUM

%%

/* GRAMMAR RULES */
program: declaration-list;
declaration-list: declaration-list declaration | declaration;
declaration: var-declaration | fun-declaration;
var-declaration: type-specifier ID EOL | type-specifier ID LEFT_BRACKET NUM RIGHT_BRACKET EOL;
type-specifier: INT | VOID;
fun-declaration: type-specifier ID LEFT_PARANTHESE params RIGHT_PARANTHESE compound-stmt;
params: param-list | VOID;
param-list: param-list COMMA param | param;
param: type-specifier ID | type-specifier ID LEFT_BRACKET RIGHT_BRACKET;
compound-stmt: LEFT_BRACE local-declarations statement-list RIGHT_BRACE;
local-declarations: local-declarations var-declaration | %empty;
statement-list: statement-list statement | %empty;
statement: expression-stmt | compound-stmt | selection-stmt | iteration-stmt | return-stmt;
expression-stmt: expression EOL | EOL;
selection-stmt: IF LEFT_PARANTHESE expression RIGHT_PARANTHESE statement | IF LEFT_PARANTHESE expression RIGHT_PARANTHESE statement ELSE statement;
iteration-stmt: WHILE LEFT_PARANTHESE expression RIGHT_PARANTHESE statement;
return-stmt: RETURN EOL | RETURN expression EOL;
expression: var ASSIGNMENT expression | simple-expression;
var: ID | ID LEFT_BRACKET expression RIGHT_BRACKET;
simple-expression: additive-expression relop additive-expression | additive-expression;
relop: LESS_THAN | LESS_THAN_OR_EQUAL | GREATER_THAN | GREATER_THAN_OR_EQUAL | EQUAL | NOT_EQUAL;
additive-expression: additive-expression addop term | term;
addop: ADD | SUBTRACT;
term: term mulop factor | factor;
mulop: MULTIPLY | DIVIDE;
factor: LEFT_PARANTHESE expression RIGHT_PARANTHESE | var | call | NUM;
call: ID LEFT_PARANTHESE args RIGHT_PARANTHESE;
args: arg-list | %empty;
arg-list: arg-list COMMA expression | expression;

%%                                                                              
 
main ()                                                                              
{                                                                                    
  yyparse ();                                                                        
}