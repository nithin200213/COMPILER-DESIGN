#include&lt;stdio.h&gt;
#include&lt;string.h&gt;
int S() ,L() ,Ldash();
char *ip;
char string[50];
int main()
{
printf(&quot;Enter the string\n&quot;);
scanf(&quot;%s&quot;,string);
ip=string;
printf(&quot;\n\nInput\tAction\n-----------------------\n&quot;);
if(S() &amp;&amp; *ip==&#39;\0&#39;){
printf(&quot;\n-----------------------\n&quot;);
printf(&quot;\n String is sucessfully accepted\n&quot;);
}
else{
printf(&quot;\n---------------------------\n&quot;);
printf(&quot;String is not accepted \n&quot;);
}
}
int S()
{
if(*ip==&#39;(&#39;)
{
printf(&quot;%s\tS-&gt;(L) \n&quot;,ip);
ip++;
if(L())
{

if(*ip==&#39;)&#39;)
{
ip++;
return 1;
}
else
return 0;
}
else
return 0;
}
else if(*ip==&#39;a&#39;)
{
ip++;
printf(&quot;%s\tS-&gt;a \n&quot;,ip);
return 1;
}
else
return 1;
}
int L(){
printf(&quot;%s\tL-&gt;SL&#39; \n&quot;,ip);
if(S())
{
if(Ldash())
{
return 1;
}
else
return 0;
}
else
return 0;
}
int Ldash(){
if(*ip==&#39;,&#39;)
{
printf(&quot;%s\tL&#39;-&gt;,SL&#39; \n&quot;,ip);
ip++;
if(S())
{
if(Ldash()){
return 1;
}

else
return 0;
}
else
return 0;
}
}
