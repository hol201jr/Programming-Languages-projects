#testing the question from CS471 
from ast import main


main
inOne = int(input("Enter Number 1 "))

inTwo = int(input("Enter Number 2 "))

for x in range(inOne, inTwo + 1 , 3):
    print(inOne)
    inOne = inOne + 3

if inOne >= inTwo:
    print (inTwo)