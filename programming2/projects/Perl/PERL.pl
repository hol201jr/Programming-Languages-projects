#Title: PERL Programming Assignment 2 Short Circuit evaluation
#Author: Manuel Holguin
#Date: 09-29-2022 Re-submission
#Description: Program evaluates the and conjunction 
#              in order to see if the language implementes short circuiting.
#              The utilization of fucntion calls allowed me to evaluate if the 
#              operator indeed short circuited or tested both statements after
#              the value of the first one was established.

sub falsy_func{
    print "evaluating and F statement.\n";
    return 0;

}
sub truthsly{
    print "evaluating and T statement.\n";
    return 1;

}
sub short_c{

    #test1 T and T
    if(1 == 1 && truthsly ){
    print "A T and T = T and works for this test works\n";
    }
    else{
    print "Test 1 failed\n"
    }
    #Test 2 T and F will implement a function to make sure the statement is evaluated
    if(1 == 1 && falsy_func ){
    print "A T and F = F  if this prints short circuit did not eval second Statement\n";
    }
    else{
    print "Test 2 showed that Perl evaluated both statements correctly \n"
    }
    #Test 3 F and T if short circuit should exit after evaluating statement 1
    # to make sure statement 2 is check function truthsly will be called returning T
    if( falsy_func && truthsly ){
    print "A F and T = F  Only the Eval for falsy should run \n";
    }
    else{
    print "Test 3 showed that Perl evaluated 1st statement correctly and ended conjunction \n"
    }
    #Test 4 tests for F and F = F should only eval first statement
    if( falsy_func && falsy_func ){
    print "A F and F = F  This statement should not run. \n";
    }
    else{
    print "Test 4 showed that Perl evaluated 1st statement correctly and ended conjunction \n"
    }
}

short_c();