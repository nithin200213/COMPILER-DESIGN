#include<stdio.h>
#include<stdbool.h>
#include<string.h>
#define max 100
bool isDigit(char str) {
    if(str=='0'||str=='1'||str=='2'||str=='3'||str=='4'||str=='5'||str=='6'||str=='7'||str=='8'||str=='9') {
        return true;
    }
    return false;
}

bool isOperator(char str) {
    if(str=='*'||str=='-'||str=='+'||str=='('||str==')') {
        return true;
    }
    return false;
}

bool isLetter(char str) {
    char s[]  = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int i,count=0;
    for(i=0;s[i]!='\0';i++) {
        if(s[i]==str) {
            count = 1;
            break;
        }
    }
    if(count) {
        return true;
    }
    return false;
}

int main() {
    char str[max];
    int i,state=1;
    printf("Enter the string to be checked: ");
    scanf("%s",str);
    for(i=0;str[i]!='\0';i++) {
        switch(state) {
            case 1: if(str[i]=='\n' || str[i]=='\t' || str[i]=='\0') {
                state=1;
            }  else if(str[i]=='/') {
                state=2;
            } else if(isOperator(str[i])) {
                state=6;
            } else if(str[i]==':') {
                state = 11;
            } else if(str[i]=='.') {
                state=13;
            } else if(isDigit(str[i])) {
                state=14;
            } else if(isLetter(str[i])) {
                state = 16;
            }
            break;
            case 2: if(str[i]=='/') {
                state=3;
            } 
            case 11: if(str[i]=='=') {
                state= 12;
            }
            case 13: if(isDigit(str[i])) {
                state=15;
            }
            break;
            case 14: if(isDigit(str[i])) {
                state=14;
            } else if(str[i]=='.') {
                state=15;
            }
            break;
            case 15: if(isDigit(str[i])) {
                state=15;
            } else if(str[i]=='.') {
                state=16;
            }
            break;
            case 16: if(isDigit(str[i]||isLetter(str[i]))) {
                state = 16;
            }
            break;
        }
    }
    if(state==2||state==16||state==6||state==12||state==14||state==15) {
        printf("\nString is accepted");
    } else {
        printf("\nString is not accepted");
    }
}
