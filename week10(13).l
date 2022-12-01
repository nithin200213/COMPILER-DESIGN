%{
#include &quot;y.tab.h&quot;
%}
%%
[0-9]+ {yylval=atoi(yytext);
return NUMBER;
}
[\t] ;
\n return 0;
. return yytext[0];
%%
 
Yacc program:-
%{
#include&lt;stdio.h&gt;
%}
%token NUMBER
%%
S: E { printf(&quot;The result is =%d\n&quot;,$1);}
;
E: E&#39;+&#39;T { $$ = $1 + $3; }
| T { $$ = $1;}
;
T: T&#39;*&#39;F { $$ = $1 * $3; }
 
| F { $$ = $1;}
;
F: &#39;(&#39;E&#39;)&#39; { $$ = $2;}
| NUMBER { $$ = $1;}
;
%%
int main(){
yyparse();
}
int yywrap(){
return 1;
}
void yyerror(char *s){
printf(&quot;Error %s&quot;,s);
}
