
/*Author: Manuel Holguin
 * Title: Program 6 FileConverter.java
 * Date: 10/20/2022
 * Description: The program takes a txt file as an input and removes 
 *      all junk data between ^C and ^B then outputs a cleaned version of that file.
 *      The program does this by utilizing the java BufferedReader reading each 
 *      individual character and storing it as an Integer in an array.  In order to 
 *      clean the data in between the control blocks a boolean called flag was used
 *      Whenever a ^C was located the flag would be turned off and the reader would
 *      continue.  Otherwise if a ^B was found the flag would be activated allowing
 *      the character found to be stored in the array this was implemented using a while
 *      loop.  After the file was read it is then close and finally the Integer array 
 *      is iterated through and converted back into characters which are printed out to the 
 *      console.   
 */
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class FileConvert {

    public static void main(String[] args) throws IOException {
        try {
            //This array list stores the integer values of the characters
            ArrayList<Integer> chars = new ArrayList<>();
            //open file
            FileReader myfile = new FileReader("control-char.txt");
            //BufferedReader will iterate thru the file storing the raw bits
            BufferedReader br = new BufferedReader(myfile);
            // yes/no flag
            boolean flag = true;
            //stores the bit character
            int ch;
            //While it is not the end of the file.
            while ((ch = br.read()) != -1) {

                //If ascii = STX then flag is true
                if (ch == 2) {
                    flag = true;
                }
                //else if ascii = ETX switch flag off do not store anything
                else if (ch == 3) {
                    flag = false;
                }
                //Add the ch to the arraylist 
                else if (flag == true) {
                    chars.add(ch);
                }
                //Idk I just added to avoid any issues else just continue along soldier
                else{
                    continue;
                }
            }
            myfile.close();
            //Iterate through the array and print the characters
            for(int i = 0 ; i < chars.size(); i++){
                //convert from Integer to int
                int temp =  chars.get(i);
                //cast int to character in order to print to console.
                char c = (char) temp;
                System.out.print(c);
            }
        } catch (FileNotFoundException e) {
            System.out.println("File Not Found you Dummy!!");
            e.printStackTrace();
        }

    }
}