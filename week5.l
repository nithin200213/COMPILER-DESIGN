digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]\.[0-9]



%{
#include<stdio.h>
#include<string.h>
char symboltable[50][50];
int i=0,n=0,count=0,j=0;

%}
%%

int|float|char|double|return|printf|for|while|if|else   {fprintf(yyout,"\n%s is a keyword",yytext);}

[+|-]?{num}[eE][+|-][0-9]+                           {fprintf(yyout,"\n%s is an exponent",yytext);}

{id}                                  {  fprintf(yyout,"\n%s is identifier",yytext); count++;if(!look_up(symboltable,yytext,i))strcpy(symboltable[i++],yytext);}
[+|-]?{num}                                                        {printf("\n%s is float",yytext);}
[+|-]?{digit}                                            {fprintf(yyout,"\n%s is a signed or an unsigned integer",yytext);}



"<=" {fprintf(yyout,"\n%s is Relational operator Lessthan or Equal to",yytext);}
"<" {fprintf(yyout,"\n%s is Relational operator Lessthan",yytext);}
">=" {fprintf(yyout,"\n%s is Relational operator Greaterthan or Equal to",yytext);}
">" {fprintf(yyout,"\n%s is Relational operator Greaterthan",yytext);}
"==" {fprintf(yyout,"\n%s is Relational operator Equal to",yytext);}
"!=" {fprintf(yyout,"\n%s is Relational operator Not Equal to",yytext);}
"=" {fprintf(yyout,"\n%s is Assignment operator",yytext);}
"("  {fprintf(yyout,"\n%s is an opening paranthesis",yytext);}
")"  {fprintf(yyout,"\n%s is a closing paranthesis",yytext);}
"{"  {fprintf(yyout,"\n%s is an opening braces",yytext);}
"}"  {fprintf(yyout,"\n%s is an closing braces",yytext);}
";"  {fprintf(yyout,"\n%s is terminator",yytext);}




[\/][\*]   {fprintf(yyout,"\nmultiline comment starts");}
[\*][\/]   {fprintf(yyout,"\nmultiline comment ends");}

%%

int main()
{

extern FILE *yyin,*yyout;
yyin =fopen("m.txt","r");
yyout=fopen("n.txt","w");
yylex();

for(j=0;j<i;j++)
printf("\n %s",symboltable[j]); printf("\n\n");

fclose(yyin);
fclose(yyout);
return 0;
}

int yywrap()
{
return 1;
}

int look_up(char symboltable[10][10],char *id,int n)
{  for(i=0;i<count;i++)
    {if(strcmp(id,symboltable[i])==0)
	{
		return 1;
	}
	}
	return 0;
}
