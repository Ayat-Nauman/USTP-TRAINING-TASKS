#include <stdio.h>
int main() {
int n;
int first = 0;
int second = 1;
int next_term;
printf("Enter Number N:");
scanf("%d", &n);
for(int i= 0; i <= n ; i++){
if (i <= 1)
next_term = i;
else

next_term = first+second;
first = second;
second = next_term;

printf("%d, ", next_term);

return(0);

}

}
