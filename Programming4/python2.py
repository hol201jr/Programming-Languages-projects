#Author: Manuel Holguin
#Date: 09-25-2022
#Description: The code runs Gaussian Elimination and pivoting with Numpy while recording
#   start time of the program and the ending time. Then does simple addition
#   to print out the output of the time is took to run the program.
#   Additionally the program creates a Matrix of size n*n+n which is the input 
#   from the user. Then is fills the Matrices with random numbers.
from ast import main
#import the numpy library for the assignment
import numpy as np
import time
#numpy fabs used for the absolute value running without numpy linalg library
from numpy import fabs

main
#Get the input from the user and insert into n for array parameters.
total = input("Input number for my n: ")
n = int(total)
#Creates an np array of NxN+1 dimensions and fills it with random ints
B = np.random.uniform(1.0,150.0,(n,n))
#creates an np array of N length for augmented values
C = np.random.uniform(1.0,150.0,(n))
#x vector for storing solutions
x = np.zeros(n)
#Time Starter
start_time = time.time()*1000
#used to solve the system of linear equations but result is not stored not required for this project
#only used to calcuate the time of running gaussian elimination this function uses LU and partial pivoting
np.linalg.solve(B,C)

end_time = time.time()*1000
#calculate the end time of the program
result = end_time - start_time
#Print the result
print("The time is: ")
print(result)    


