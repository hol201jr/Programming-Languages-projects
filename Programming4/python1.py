#Author: Manuel Holguin
#Date: 09-24-2022
#Description: The code runs Naive Gaussian Elimination without pivoting while recording
#   start time of the program and the ending time. Then does simple addition
#   to print out the output of the time is took to run the program.
#   Additionally the program creates a Matrix of size nXn which is the input 
#   from the user. Then is fills the Matrix with random numbers.
from ast import main
import time
import random

main
#take input from user and use it to set the array parameters.
total = input("Input number for n: ")
n = int(total)
#creates and array of zeros to store the solution but not needed for this project
x = [0.0]*n
#Creates and matrix with NXN
B = [[random.randint(0.0,300) for p in range(n)] for q in range(n)] 

#Time Starter
start_time = time.time()*1000
#forward elimination
for k in range(n):#Traverses rows
    for i in range(k+1 , n):#Traverses rows fractioning the columns by the previous one
        f = B[i][k] / B[k][k]
        for j in range(n): #k , n-1
            B[i][j] = B[i][j] - f*B[k][j]
#Backward substitution to set the values of the solution
x[n-1] = B[n-2][n-1] / B[n-2][n-2]
for i in range(n-2 , -1 ,-1):
    Sum = B[i][n-1]
    for j in range(i + 1, n):
        Sum = Sum - B[i][j]*x[j]
    x[i] = Sum/B[i][i]
#Print the result time
end_time = time.time()*1000
result = end_time - start_time
print(result)