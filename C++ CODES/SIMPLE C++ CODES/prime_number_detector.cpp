#include <stdio.h>
#include <stdbool.h>
int main()
int n;
int rem = 0;
bool primenumber;
printf("Enter a number greater than 1: ");
scanf("%d", &n);
for(int i=2; i <= n ; i++){
rem = n%i;
if (rem == 0 && i<n){
primenumber = 0;
break;

else
primenumber = 1;

if (primenumber == 1) printf("Number is prime");
else printf("Number is not prime");
return(0);

}
