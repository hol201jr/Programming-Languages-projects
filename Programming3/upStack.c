/* Program to demonstrate how to over write the
* return address inside of function
* we will use a global variable to store
* the address we want to go to on return
* and we will use an array in the function to
* seek the location and replace with the new value

 
Shaun Cooper

2020 September

Modified By: Manuel Holguin
Date: 10-06-2022
Description: Learning about the runtime stack adding enough variables
to were the printf that is skipped over returns and create a seg fault.
Finally changing the runstack in order to return to the original state.
 
*/

#include <stdio.h>

// dummy function which makes one important change

void f() {

    unsigned int *A;
    int i;

   A =(unsigned int *) &A;

    for (i=0;i<=10; i++)
       printf("%d %u\n",i,A[i]);

//return address of function f before creating two new varaibles.
//A[6] = A[6] + 10;

//Eventually the return address for the f function is shifted 
//due to the addition of the two new varaibles therefore A[6]
//no longer points to the return address.
   A[8]=A[8] + 10;

   //Adding more variables this will eventually cause a runtime stack
	int x = 1 ; // This is a 4 bit addition proven by the bottom
	int y = 1 ;
	




   printf("A is %u \n",A);

   for (i=-4;i<=10; i++)
    printf("%d %u\n",i,A[i]);
}

int main()
{

   int A[100];
   unsigned int L[4];
   L[0]=100;
   L[1]=200;
   L[2]=300;
   L[3]=400;
    for (int i=0; i < 100; i++) A[i]=i;

   printf("main is at %lu \n",main);

   printf("f is at %lu \n",f);
   printf("I am about to call f\n");
   f();
   printf("I called f\n");

out: printf(" I am here\n");

}