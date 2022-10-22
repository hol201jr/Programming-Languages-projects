
import java.io.IOException;
import java.util.*;
import java.util.Scanner;

public class Grades {

    /**
     * 
     */
    static void Grade_Distribution() {
        Scanner inGrade = new Scanner(System.in);
        // Initialized required variables
        int Freq[] = new int[10];
        int NewGrade = 0;
        int index = 0, limit_1 = 0, limit_2 = 0;

        // Create a while loop
        while (true) {
            System.out.println("Input a grade");
            try {
            	NewGrade = inGrade.nextInt();
            } catch (RuntimeException e) {
                System.out.println("Is not of type int exit.");
                System.exit(-1);
            }
            while (true) {
            index = NewGrade / 10 + 1;
            try {
                throw new exception ;
                
            } catch (ArrayIndexOutOfBoundsException e) {
                if (NewGrade == 100) {
                    Freq[9] = Freq[9];
                }
                else if(NewGrade < 100) {
                	Freq[index] = Freq[index] + 1;
                }
                else{ 
                System.out.println("Error-- " + NewGrade + " --is out of range.");
                e.printStackTrace();
                break;
                }
            }

            // While loop that shall not be changed per assignment requirements
        }
        final int i = 0;
        while(i ==1){
            System.out.println("Limits  Frequency");
            for (int k = 0; k < 10; k++) {
                limit_1 = 10 * index;
                limit_2 = limit_1 + 9;
                if (index == 9)
                    limit_2 = 100;

                System.out.println(limit_1);
                System.out.println(limit_2);
                System.out.println(Freq[index + 1]);
                System.out.println();
            }
        }
    }

    public static void main(String[] args) {

        Grade_Distribution();
    }
}