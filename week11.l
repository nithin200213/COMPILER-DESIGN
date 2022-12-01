%{
#include&lt;stdio.h&gt;
int regs[26];
int base;
%}
 
%union { int a; }
 
%token DIGIT LETTER
 
%left &#39;|&#39;
%left &#39;&amp;&#39;
%left &#39;+&#39; &#39;-&#39;
%left &#39;*&#39; &#39;/&#39; &#39;%&#39;
%left UMINUS /*supplies precedence for unary minus */
 
%type &lt;a&gt; stat expr number DIGIT LETTER
 
%% /* beginning of rules section */
 
list: list stat &#39;\n&#39;
|
list error &#39;\n&#39;
{
yyerrok;
}
| /*empty */
;
stat: expr
{
printf(&quot;%d\n&quot;,$1);
}
|
LETTER &#39;=&#39; expr
{
regs[$1] = $3;
}
 
;
 
expr: &#39;(&#39; expr &#39;)&#39;
{
$$ = $2;
}
|
expr &#39;*&#39; expr
{
 
$$ = $1 * $3;
}
|
 
expr &#39;/&#39; expr
{
$$ = $1 / $3;
}
|
expr &#39;%&#39; expr
{
$$ = $1 % $3;
}
|
expr &#39;+&#39; expr
{
$$ = $1 + $3;
}
|
expr &#39;-&#39; expr
{
$$ = $1 - $3;
}
|
expr &#39;&amp;&#39; expr
{
$$ = $1 &amp; $3;
}
|
expr &#39;|&#39; expr
{
$$ = $1 | $3;
}
|
 
&#39;-&#39; expr %prec UMINUS
{
$$ = -$2;
}
|
LETTER
{
$$ = regs[$1];
}
 
|
number
;
 
number: DIGIT
{
$$ = $1;
base = ($1==0) ? 8 : 10;
}
|
number DIGIT
{
$$ = base * $1 + $2;
 
}
;
 
%%
main()
{
return(yyparse());
 
}
 
yyerror(s)
char *s;
{
fprintf(stderr, &quot;%s\n&quot;,s);
}
 
yywrap()
{
return(1);
}
