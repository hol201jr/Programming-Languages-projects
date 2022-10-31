#Title:CSVPython.py for Program7 for CS471
#Author: Manuel Holguin
#Date: 10-28-2022
#Description: The program takes a CSV file as input and prints out the format requested 
#       by the assignment. Exammple input is as follows:  
#       LastName, FirstName,Middle Initial
#       acosta,abel,f.jpg
#       alberson,dean,clinton.jpg
#       Output:
#       acosta,abel,f.jpg ; Acosta ; Abel ; F ;
#       alberson,dean,clinton.jpg ; Alberson ; Dean ; Clinton ;
#       As per the example we are to remove the (1)".jpg" string and seperate the 
#       characters by ; instead of , while having the new text (2)appended to the string.
#       For this program I used to file readers one to open and read the input file 
#       the other to write the new output.  This was implemented using a nested for loop
#       within the nested for loop I have a conditional statement that (2.2)appends to the string.
#       We also had to capitalize the first letter of each string(2.3).
#       Finally in order to account for the \n character I used the (3)translate method and said
#       if the ordinance is \n remove from the string.  This accounted for the pesky \n at the
#       of each string which would cause the appended string to skip to the next line.

#import replace method
from dataclasses import replace

# Open two files on to read and the other to write to.
f = open("ConvertCSV input")
f2 = open("NewConvertCSVOutputPy", "a")
#Store an array of strings

#
with open("ConvertCSV input") as fileObject:
    for line in fileObject:
        #String will store the second portion of the csv file ex:
        # ; Acosta ; Abel ; F
        string =""
        #First line of the file is read
        x = line
        #(1) remove .jpg from the string and store in a new variable
        newx = x.replace('.jpg', '')
        #Split the string by , for processing and store in an array.
        array = newx.split(",")
        #Iterate through the array for each element
        for y in array:
            #(2.3)Capitalize each string 
            y = y.capitalize()
            #We being appending format to the string(2.2)
            if string == "":#If the string is empty its the first element append y.
                
                string = " ; " + y

            elif len(string) >= 1:#Else it had an element append ; and the next y.
                string = string + " ; " + y 
        #Append newly created string to x so result will be as follows
        #acosta,abel,f.jpg\n ; Acosta ; Abel ; F ;
        x = x + string
        # Translate func to remove pesky \n in between which makes it skip one line and 
        # then append a \n at the end of the full string.
        # Finally write to the new file. Iterate again per element in file.
        # One thing to notice if you run this on a windows OS it prints out 14 chars larger
        #  it's the convention in which windows handles newlines so the file will be slightly
        # larger.  On the contrary if you run it on Linux the file size will be the same as
        # in "ConverCSVoutput".
        x = x.translate({ord('\n'):None}) + " ;" + '\n'
        f2.write(x)
#End of program closing file openers.
f.close
f2.close
