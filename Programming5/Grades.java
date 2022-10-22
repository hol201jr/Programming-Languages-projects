/*Author: Manuel Holguin
 * Title: Grades.java
 * Date: 10-04-2022
 * Description: This program is a interpretation from the grade_distribution.adb Ada code
 *              which was translated into Java.  Per project specifications only the second 
 *              exception in the code was modified to run the updating of Freq array within
 *              the catch block instead of the try block. Putting in a negative number in as
 *              input breaks the while loop as the same in the ADA code.
 */
import java.util.*;
import java.util.Scanner;

public class Grades {

    static void Grade_Distribution() {
        Scanner getGrade = new Scanner(System.in);
        // Initialized required variables
        int Freq[] = new int[10];
        int NewGrade = 0;
        int index = 0, limit_1 = 0, limit_2 = 0;
        boolean innerwhile = true;
        // Create grade loop
        while (innerwhile) {
            // First exception will catch if the input from the user is not an int and if the number is 
            // a natural number no negative numbers are allowed otherwise if negative exit loop.
                try {
                    //Gets the grade input from the user since we are working with Natural numbers
                    // 0,1,2,3 ... n any negative number throws the runtime exception which exists the loop
                    //Otherwise the user can continue to input numbers until they exit by exception.
                    NewGrade = getGrade.nextInt();
                    if (NewGrade < 0) {
                        throw new RuntimeException("Not seen: Must be a positive number!");
                    }
                }
                // If the input is not an int run exception and exit loop.
                catch (RuntimeException e) {
                    System.out.println("Is not of type int exit.");
                    innerwhile = false;
                    break;
                }
            index = NewGrade / 10  ;
            //*88888888888888888888888888888888888888888888888888888888888888 */
            //Segment for debugging purposes
            //System.out.println("This is the Index" + index + "Length of array is " + Freq.length);
            /*888888888888888888888888888888888888888888888888888888888888888 */
            
            /*This block runs the second exception in the program. By assignment specifications
             *this exception is the only one modified to always execute throw and activate the catch.
             *The exception used in the program is ArrayIndexOutOfbounds
             * which runs the catch portion that does all the changes to the array Freq within catch*/
            try {
                //Segement causes exception and puts us within the catch section.
                int[] exceptionArray = {1,2,3};
                System.out.println(exceptionArray[5]);
                
            } catch (ArrayIndexOutOfBoundsException e) {
                //In this segment all changes to Freq are made//
                //For debugging purposes and to see if we really are in the catch scope.
                System.out.println("Caught exception! yes!");

                /////////////////Changes to Freq array////////////////////////
                if (NewGrade == 100) {
                    Freq[9] = Freq[9] + 1;
                } 
                else if( NewGrade < 100){
                    Freq[index] = Freq[index] + 1;
                }
                else {
                    System.out.println("Error-- " + NewGrade + " --is out of range.");
                    e.printStackTrace();
                }
                ////////////////////end of the changes//////////////////////////
            }
        } // Closure of grade loop

        // While loop that shall not be changed per assignment requirements only prints results
            System.out.println("Limits  Frequency");
            for (int k = 0; k <= 9; k++) {
                limit_1 = 10 * k;
                limit_2 = limit_1 + 9;
                if (k == 9)
                    limit_2 = 100;

                System.out.print(limit_1 + "\t");
                System.out.print(limit_2 + "\t");
                System.out.print(Freq[k]);
                System.out.println();
            }
        
    }

    public static void main(String[] args) {

        Grade_Distribution();
    }
}