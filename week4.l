%option noyywrap %{ #include<stdio.h> %}
%%
bool|int|float printf("Keyword");
[-,+]?[0-9]+ printf("digit");
[a-zA-Z]+ printf("Identifiers");
[>,<,=,>=,<=,==,!=]+ printf("Relational operators"); %%
int main()
{
printf("\nEnter the string : ");
yylex();
