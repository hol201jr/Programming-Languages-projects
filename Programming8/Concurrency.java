/* Title: Concurrency.java 
 * Author: Shaun Cooper
 * Modified by: Manuel Holguin
 * Date: 11/10/2022
 * Description: The program gets input from the user n
 *      which then creates a nxn matrix filles with random values
 *      in which we will calculate the max, min, average using multithread
 *      concurrency. These threads will each take over one
 *      role of the matrix and calculated the requested information.
 *      returning it to the main thread.  We are expected to learn 
 *      about Concurrency programming and how it is implemented 
 *      using Java.
 * 
 * 
 */

import java.util.Scanner;
import java.util.Random;
import java.util.ArrayList;
import java.lang.Math;

class Concurrency {

    // This method was to truncate the values of random
    // to insure int types instead of doubles. However
    // implementing an int array automatically casts
    // without having to truncate. I left this intentionally
    // for potential future use.
    static int trunc(int x) {
        // x=x * Math.pow(10,0);
        // x= Math.floor(x);
        // x=x / Math.pow(10,0);

        return x;
    }

    // Creates a list of Threads in order to id each one created.
    private static ArrayList<Thread> listOfThreads = new ArrayList<Thread>();
    // Shared Thread data segment all created Threads will have access
    // to this global data.
    public static int n;//user input
    public static int doubleNarray[][];//randomly generated array
    public static int maxs[];//Stores the max for each line in doubleNarray
    public static int mins[];//Stores the min for each line in doubleNarray
    public static int averages[];//Stores the averages for each line in doubleNarray
    /*Note the summation of the line is done within the Threads class and 
     * returned to averages for final calculation */

    public static void main(String[] args) throws InterruptedException {

        // Random and Scanner created
        Random rand = new Random();
        Scanner scan = new Scanner(System.in);

        // Take user input and explain the problem.
        System.out.println("Please type in a number and click enter.");
        n = scan.nextInt();
        scan.close();
        System.out.println("The number you put is : " + n + " thus the matrix will be [" + n + "]" + "[" + n + "]");
        System.out.println("It will then create " + n + " threads that will help this main thread");
        
        //Create the matrix and array with n lengths
        doubleNarray = new int[n][n];
        averages = new int[n];
        maxs = new int[n];
        mins = new int[n];
        
       
        int randomly;
        // Fills the array with random ints
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                randomly =(int) ((Math.pow(2, 32-n) - Math.pow(2, 31 - n)) * rand.nextDouble() + Math.pow(2, 31 -n));
            //trunc((2 ^ (32 - n) - (2 ^ 31 - n)) * rand.nextInt() + 2 ^ (31 - n));
                doubleNarray[i][j] = randomly; 
            }
        }

        // Start the timer!
        long startTime = System.nanoTime();

        // The for loop will create N number of Threads and give them an ID. Then is will add
        // them to the arraylist
        for (int k = 0; k < n; k++) {
            Thread t1 = new Thread(new Threadtest(k));
            t1.start();
            listOfThreads.add(t1);
        }

        // main thread wait segment block
        for (int h = 0; h < listOfThreads.size(); h++) {
            listOfThreads.get(h).join();
        }
        // Perform final calculations on data
        System.out.println("Calculating Results...\n");
        int finMax = maxs[0];
        int finMin = mins[0];
        int finAve= 0;
        //Find the max, min and average.
        for (int i = 0; i < n; i++) {
            if(finMax < maxs[i]){
                finMax = maxs[i];
            }
            if(finMin > mins[i]){
                finMin = mins[i];
            }
            finAve = finAve + averages[i]; 

        }
        //Prints out the calculations for data gathering
        System.out.println("Max is: "+ finMax);
        System.out.println("Min is: "+ finMin);
        System.out.println("Average is: "+ finAve/n + "\n");

        // End of calculations calculate time it took to run
        long endTime = System.nanoTime();
        long elapsedTime = endTime - startTime;

        // prints out the time for analysis
        System.out.println("Elapsed Thread completion time in nano secs: "+ elapsedTime);
        //System.out.println("Elapsed Time in seconds:");
        //System.out.println(TimeUnit.SECONDS.convert(elapsedTime, TimeUnit.NANOSECONDS));

        // Prints out the 2D array to check for any issues
       /*
         System.out.println("Printing out the 2D array...");
          for (int i = 0; i < doubleNarray.length; i++) {
          for (int j = 0; j < doubleNarray[i].length; j++) {
          System.out.print(doubleNarray[i][j] + " ");
          }
          // printing next line
          System.out.println();
          }
         */ 
    }
}

// Special Thread class which is called by the main Thread
class Threadtest implements Runnable {
    // only visible to itself Thread
    private int id;
    private int sum = 0;
    // get reference addresses from father Thread
    private int threadN = Concurrency.n;
    private int max = Concurrency.doubleNarray[id][0];
    private int min = Concurrency.doubleNarray[id][0];;

    // constructors
    Threadtest(int i) {
        id = i;
    }

    // run the Thread
    public void run() {
        try {

            //This section gets the max and min of the array assigned to the Thread
            for (int i = 0; i < threadN; i++) {

                if (Concurrency.doubleNarray[id][i] > max) {
                    max = Concurrency.doubleNarray[id][i];
                }

                if (Concurrency.doubleNarray[id][i] < min) {
                    min = Concurrency.doubleNarray[id][i];
                }
                sum = sum + Concurrency.doubleNarray[id][i];
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        //Writes the results back to Main Thread.
        Concurrency.maxs[id] = max;
        Concurrency.mins[id] = min;
        Concurrency.averages[id] = sum / threadN;
    }

}