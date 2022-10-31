#Title CSV.rb for program7 for CS471
#Author: Manuel Holguin
#Date: 10-30-2022
#Description:  The program takes a CSV file as input and prints out the format requested 
#       by the assignment. Exammple input is as follows:  
#       LastName, FirstName,Middle Initial
#       acosta,abel,f.jpg
#       alberson,dean,clinton.jpg
#       Output:
#       acosta,abel,f.jpg ; Acosta ; Abel ; F ;
#       alberson,dean,clinton.jpg ; Alberson ; Dean ; Clinton ;
#       Algorithm for the program a nested for loop with a conditional
#       if statement within the send loop.
#       1st loop iterates through the lines created from reading the file
#       while writing to the output file. 2nd loop iterates throught he lines
#       which I converted into an array with the split command.
#       Then I capitalize the string and write to the file, 
#       finally the if statement splits the final string
#       containing .jpg and seperates it by "." then I only
#       write the first word to the file and end. 
#Create file readers for accessing and writting to file
file = File.open("ConvertCSV input")
file2 = File.open("NewConvertCSVOutputRuby","w")

#This line removes the \n at the end of each readline
file_data = file.readlines.map(&:chomp)
set = ".jpg"
#for loop to iterate through the objects in 
#the read file where it is then manipulated
#to produce the wanted output.
for value in file_data do
    #Write to file the first line read with a semicolon
    file2.write(value + " ; ")
    
    #store the line into an array seperated by ","
    lastname = value.split(",")
    x = 1
    #for loop to iterate through new created array lastname
    for e in lastname do
        #for each element capitalize and write to the file
       string = e.capitalize()
        #if value contains .jpg remove it       
        if e.include?(".jpg") 
            #split into array 
            f = e.split(".")
            #store only the first half and capitalize
            string = f[0].capitalize

        end#end include if
        #write to file
        file2.write ( string + " ; ") 
    end# end of nested for loop
    #Write an "\n" to file for formatting
    file2.write("\n")

end# end outter for loop

#close file readers
file.close
file2.close