%{
int count = 0; %}
%%
\n count++; %%
main() {
printf("Enter the string: ");
yylex();
printf("\nThe no. of lines in the string = %d\n", count); }
