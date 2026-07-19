// factorial using loops

#include<stdio.h>
int factorial(int n);
int main(){
int n;
printf("Enter a number: ");
scanf("%d", &n);
printf("Factorial =%d \n", factorial(n));
return 0;

int factorial(int n){
int fact = 1;
if (n == 1 | | n == 0) fact == 1;
else

for (int i=1; i <= n ; i++){
fact = fact*i;

return fact;
}
