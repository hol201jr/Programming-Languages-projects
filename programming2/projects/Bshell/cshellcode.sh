#!/bin/bash
#Title: ProgrammingAssignment 2 B-Shell short Circuit program
#Author: Manuel Holguin
#Date: 09-29-2022 Re-submission
#Description: Runs AND operator evaluations to check for short circuit in B-Shell
#             Tests are run with using function calls within the functions is an 
#             echo statement which lets me know it was evaluated and
#             a return value depending on the usage of the function it will return 
#             true or false.


set ${a}=10  
set ${b}=20

#functions used to return T or F to the test cases
function isTrue(){
echo "This true statement has been evaluated!"
return 0
}
#This function evaluates to false by default.  The purpose is to check in the scenario where
#If<expr1> == false And <expr2> this function will be replace <expr2> if echo prints
#Then it means short circuit evaluation is not supported in B-Shell all Statements get checked.
function isFalse(){
echo "This false statement has been evaluated!"
return 1
}


#Case 1 testing T and T
if ( ($a < $b)  &  (isTrue) ); 
then
    echo "Test one was a success T and T"
else
    echo "Test one failed T and T = T this should not print."
fi

#Case 2 testing T and F
if ( ($a == "10" )  &  ( isFalse) ); 
then 
    echo "Test 2 was a Failure T and F  this should not print."
else
    echo "Test 2 was a Success T and F = F"
fi

#Case 3 testing F and T
if ((isFalse ) &&  (isTrue)); 
then 
    echo "Test 3 was a failure F and T should not print"
else
    echo "Test 3 was a success F and T = F"
fi

#Case 4 testing F and F
if ((isFalse) &  (isFalse)); then 
    echo "Test 4 was a failure F and F = F should not print"
else
    echo "Test 4 was a success F and F = F do not print"
fi
