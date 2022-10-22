#Title: FileConverPerl Program
#Author: Manuel Holguin
#Date: 10/21/2022
#Description: The program reads the file and cleans out the noise data. If it sees a ^C triggers
#       the flag and ignores any input until it sees a ^B and then prints afterwards.  The program
#       works by reading a line at a time and then for each line iterate through the individual chars
#       then we store the ordinance of the char in $num and check with multple if statements.
#       If flag is true print the character. In the end we have a cleaned data sheet with no noise.
#

use warnings;
use strict;
#variables used in the program
my @ASCII = "";
my $filename = 'control-char.txt';
my $flag = 1;
my $ele;
#File Handler // opener
open(FH, '<', $filename) or die $!;
# Reading the file and printing the line read.
#While $stringLine is not -1 loop through
while(my $StringLine = <FH>){
 
    # This line seperates the strings into individual characters and stores them into an array called @ASCII
    @ASCII = split(//,$StringLine);

    # for each element in the array converts it to an integers and checks if it is 2 or 3
    foreach $ele (@ASCII){
        my $num = ord($ele);

        # If the number is 3 flag is false do not print 
        if($num == 3){
            $flag = 0;
        }
        # ElseIf it's true print the element of the array.
        elsif($flag){
            print "$ele";
        }
        # ElseIf num = 2 switch flag on again and print next element.
        elsif($num == 2){
            $flag = 1;
        }
    }
}

close(FH);