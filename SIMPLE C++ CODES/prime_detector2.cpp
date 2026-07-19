#include <stdio.h>
int main(){
    int n, count = 0;
    printf("Enter a number greater than 1: ");
    scanf("%d", &n);
    for(int i= 2; i <= n ; i++)
    if (n%i == 0) count++;
    if (count == 1) printf("Number is prime");
    else printf("Number is not prime");
    return(0);
}

