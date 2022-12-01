%{
#include &quot;y.tab.h&quot;
%}
%%
[0-9]+ {yylval=atoi(yytext);
return digit;
}
[\t] ;
\n return 0;
. return yytext[0];
%%
 
Yacc program:-
%{
#include&lt;stdio.h&gt;
%}
%token DIGIT
%left &#39;-&#39; &#39;+&#39;
%left &#39;*&#39; &#39;/&#39;
%nonassoc UMINUS
%%
S: E { printf(&quot;The result is =%d\n&quot;,$1);}
;
E: E&#39;+&#39;E { $$ = $1 + $3; }
| E&#39;-&#39;E { $$ = $1 - $3; }
| E&#39;*&#39;E { $$ = $1 * $3; }
 
| E&#39;/&#39;E { if($3 == 0)
yyerror(&quot;Divide by zero&quot;);
else
$$ = $1 / $3; }
| &#39;-&#39;E %prec UMINUS { $$ = -$2; }
| &#39;(&#39; E &#39;)&#39; { $$ = $2; }
| DIGIT {$$ = $1;}
;
%%
int main()
{
yyparse();
}
int yywrap(){
return 1;
}
void yyerror(char *s){
printf(&quot;Error %s&quot;,s);exit(0);
