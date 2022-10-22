//This is programming assignment #1 for CS 471 
//Author: Manuel Holguin
//Date: 08/27/2022
//Title: Simple C aliasing Problem
#include <stdio.h>
int A[100];

int main(void){

//int Array has values in ASCII format

A[0] = ((((117)*256 + 110)*256+97)*256+77);
A[1] = ((((72)*256 + 32)*256+108)*256+101);
A[2] = ((((117)*256 + 103)*256+108)*256+111);
A[3] = ((( 0)*256+110)*256+105);

//This is the location of the array in the Stack
printf("array is located at:    %20u  located on the stack.\n", &A);
//deference operator set to varaible S
char *S;
printf("S is located at:        %20u  located on the stack\n", &S);

        //set pointer equal to the position in memory of the array 
        S = (char *) A;

        //print the value of that segment of the array as a char
        printf("My name is %s", S);
}
