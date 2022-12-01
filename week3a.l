%{
#include<stdio.h>
int vowel=0;
int cons=0;
%}
%%
"a"|"e"|"i"|"o"|"u"|"A"|"E"|"I"|"O"|"U" {printf("is a vowel\n");vowel++;} [a-zA-z] {printf("is a consonant\n");cons++;}
"\n" printf("vowel=%d and consonant=%d",vowel,cons);
%%
int yywrap()
{
return 1;
}
main()
{
printf("Enter String\n");
yylex();
}
