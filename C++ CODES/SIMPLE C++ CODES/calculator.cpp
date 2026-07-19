#include<stdio.h>
int main(){
int num1, num2, op;
printf("Enter num1 num2 and operation:\n");
scanf("%d %d %d", &num1, &num2, &op);
// 1: + 2: - 3: * 4: /
switch(op){
case 1: printf("\n%d", num1+num2); break;
case 2: printf("\n%d", num1-num2); break;
case 3: printf("\n%d", num1*num2); break;
case 4: printf("\n%d", num1/num2); break;
default: printf("Type valid operation or operands");
}
return(0);
}