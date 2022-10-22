<?php
//Title: Programming Assignment 2 PHP Short Circuit Operator
//Author: Manuel Holguin
//Date: 09-29-22 Re-submission
//Description: Tests for short circuiting AND operator in PHP.
//              The implementation of the program utilizes two
//              functions ev and evfals. That print out a statement
//              in order to evaluate if short circuiting is used
//              inside the PHP language.
echo "Hello Human!\n";

//If either of these two functions arent printed during testing then
//This means the PHP is a short circuiting programming language.
function ev(){
        echo "evaluating Statement 1 and Statement 2 \n";
        return True;

}
function evfals(){
        echo "evaluating Statement 1 and Statement 2 \n";
        return False;

}
        $number1 = 1;
        $number2 = 2;

        //Test case 1 for T and T 
        if($number1 < $number2 and ev() )
                $case1 = "Test 1 was passed! T and T = T\n";
        else {
                $case1 = "Test was failure\n";
        } 

        echo $case1;
        //Test Case 2 for T and F
        if($number1 < $number2 and evfals() )
        $case1 = "Test 2 failed T and F = F this should not print\n";
        else {
        $case1 = "Test 2 passed T and F = F did not print if statement.\n";
        } 

        echo $case1;

        //Test Case 3 for F and T
        if($number1 > $number2  and ev() )
        $case1 = "Test 3 failed F and T = F this should not print\n";
        else {
        $case1 = "Test 3 passed F and T = F did not print if statement.Short circuit.\n";
        } 
        
        echo $case1;

        //Test Case 4 for F and F
        if($number1 > $number2 and evfals() )
        $case1 = "Test 4 failed F and F = F this should not print\n";
        else {
        $case1 = "Test 4 passed F and F = F did not print if statement.Short circuit.\n";
        } 
                
        echo $case1;
?>
