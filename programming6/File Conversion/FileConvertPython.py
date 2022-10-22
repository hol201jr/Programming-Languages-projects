#Title: FileConvertPython.py 
#Author: Manuel Holguin
#Date: 10-22-2022
#Description: Takes a file as input which has unneeded information inside. 
#       The program's job is to clean that unneeded information and print
#       a clean version of that file. This program follows the same concept
#       as the other programs uses a nested loop and checks for the ordinance
#       of the character if it is either ETX or STX then this triggers the 
#       flag on and off and prints accordingly cleaning the data.

#Open the file control-char.txt
f = open("control-char.txt")

#flag boolean
flag = True
#This variable will store individual char in a string 
fileOutput = ""

# Now that the file is open we will begin reading the lines.
with open("control-char.txt") as fileobject:
    for line in fileobject:
        for character in line:
            #If statement if the ordinance of the character is 3 for (ETX) flag is false.
            if ord(character) == 3:
                flag = False
            # If flag is false do not print anything we are in the no go zone.
            elif flag:
                fileOutput += character
            #else if ordinance of character is 2 its a (STX) swtich flag on for printing.
            elif ord(character) == 2:
                flag = True
f.close
# print out the final output.
print (fileOutput)

#Lets extend the program and write to a new file 
f2 = open ("New Cntrl-Char.txt", "w")
f2.write(fileOutput)
f2.close