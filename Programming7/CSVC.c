/*Title:CSVC.c for Program7 for CS471
 *Author: Manuel Holguin
 *Date: 10-30-2022
 *Description: The program takes a CSV file as input and prints out the format requested
 *       by the assignment. Exammple input is as follows:
 *       LastName, FirstName,Middle Initial
 *       acosta,abel,f.jpg
 *       alberson,dean,clinton.jpg
 *       Output:
 *       acosta,abel,f.jpg ; Acosta ; Abel ; F ;
 *       alberson,dean,clinton.jpg ; Alberson ; Dean ; Clinton ;
 *       The following C algorithm to solve this issue is as follows
 *       Function strremove @param remove .jpg from the string if it exist.
 *      I start by opening file reader and writer take line input and then
 *      use strcspn(string, "\n") to remove newline from read input. Then I 
 *      wrote the string to the file, and passed the string to a tokenizer for loop
 *      and stored the tokens into an array in order to manipulate in the next for loop.
 *      For loop number 2 manipulates the string changing by copying from the array to 
 *      a string then uppercasing the first char, then removing the unwanted substring
 *      ".jpg" then finally writing the format pattern to the file adding a newline at the end.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

/*The function was borrowed from stack overflow 
https://stackoverflow.com/questions/47116974/remove-a-substring-from-a-string-in-c#:~:text=There%20is%20no%20predefined%20function,source%20and%20destination%20arrays%20overlap 
By chqrlie. It takes a string input from the user and removes the substring from
the string then returns the new string.*/

char *strremove(char *str, const char *sub)
{
    size_t len = strlen(sub);
    if (len > 0)
    {
        char *p = str;
        size_t size = 0;
        while ((p = strstr(p, sub)) != NULL)
        {
            size = (size == 0) ? (p - str) + strlen(p + len) + 1 : size - len;
            memmove(p, p + len, size - (p - str));
        }
    }
    return str;
}

int main(void)
{
    // Create and open files
    FILE *fp = fopen("ConvertCSV input", "r");
    FILE *fp2 = fopen("NewConvertCSVOutputC", "w");
    // Char arrays used to store read input
    char string[100];
    char *object[30];

    size_t n = 0;
    while (fgets(string, sizeof(string), fp))
    {

        // Clean the string input from "\n"
        string[strcspn(string, "\n")] = 0;

        // Debuggin
        // printf("%s\n", string);

        // Printing to file
        fprintf(fp2, "%s ; ", string);

        /*Tokenizer implementation for loop
        char *token = strtok(string, ",");
        the for loop tokenizes the string input from the
        read file and then stores it in an array called
        object. which is used to manipulate the strings
        to produce the CSV format.
        */
        for (char *p = strtok(string, ","); p; p = strtok(NULL, ","))
        {
            // if it goes over the threshold exit out.
            if (n >= 30)
            {
                break;
            }
            // Store token in array.
            object[n++] = p;
        }

        /*The following for loop iterates through
        the array created in the previous for loop
        and creates a string copy of the array at index
        and then I uppercase the first char. The final part
        of the loop calls strmove in order to remove the specific
        subtring ".jpg"*/
        for (size_t i = 0; i != n; ++i)
        {
            char currentString[30];

            //copy array[index] to a string
            strcpy(currentString, object[i]);

            //uppercase the string at first index
            currentString[0] = toupper(currentString[0]);

            //debuggin purposes
            // printf("The token stored is: %s\n", currentString);

            // function to remove .jpg
            strremove(currentString, ".jpg");

            // Finally print to file
            fprintf(fp2, "%s ; ", currentString);

        }//end copy, upper and remove for loop

        // print newline in file
        fprintf(fp2, "\n");

        //reset n for the next line
        n = 0;
    }//end outter loop

//closing files
    fclose(fp);
    fclose(fp2);
    return 0;
}//end of program