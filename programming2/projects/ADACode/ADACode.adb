--Title:Ada Short Circuit program.
--Author: Manuel Holguin
--Date 09-29-2022 Re-submission
--Purpose: Is to evaluate the AND short circuit Boolean in ADA
--          Each individual case tests for a posibilities in which the function f and fal's
--          Put_Line statements are printed. If for any of the test cases if the functions' lines
--          are printed then this means that ADA doesn't support short circuit evaluation.
--          However an addition to the code in test case 2.1 it was realized that using the follow
--          syntax if(<expression1> AND the <expression2>) then will actually implement short circuit evaluation.
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure ADACode is 
A : Integer := 0;
B : Integer := 50;

--If this function's Put_Line prints when statement 1 is False and Statement 2 is T then
--ADA does not support short circuiting
--However if this print statement doesnt print when statement 1 is false then short circuiting is supported.
function f return Boolean is
begin
    Put_Line("I have been evaluated True");
      return True;
end f;
-- This function evaluates to false by default.  The purpose is to check in the scenario where
-- If<expr1> == false And <expr2> this function will be replace <expr2> if the Put_line prints
-- Then it means short circuit evaluation is not supported in ADA all Statements get checked.
function fal return Boolean is
begin
    Put_Line("I have been evaluated False");
      return False;
end fal;

begin
--THE FOLLOWING TEST SHORT CIRCUIT IN THE AND OPERATOR--
    --Test case 1 T and F
    Put_Line("---------Test case 1 T and F---------");
    if B > A and fal then
        Put_Line("Test 1 Stament 1 is True but statement 2 is False this should not print.");
             
    else
        Put_line("Test 1 passed T and F");  
    end if;
   
    --Test case 2 F and T 
    Put_Line("---------Test case 2 F and T ---------");
    if B < A and f then
        Put_Line("Test 2 statement A is False but statement 2 Is True this should not print");

    else
       Put_Line("Test 2 passed  F and T if it prints I have been evaluated then ADA does not support short circuit. ");
    end if;
    --Test case 2.1 F and T using AND Then
    Put_Line("---------Test case 2.1 F and T ---------");
    if B < A and then f then
        Put_Line("Test 2 statement A is False but statement 2 Is True this should not print");

    else
       Put_Line("Test 2 passed F and T in this scenario utilizing AND THEN implements short circuit.  Since function f did not print out it's Put_line It proves the hypothesis.");
    end if;

    --Test case 3 T and T 
    Put_Line("---------Test case 3 T and T ---------");
    if f and f then
        Put_Line("Test 3 statement A is T statement B Is T this should  print");

    else
       Put_Line("Test 3 Failed!");
    end if;

    --Test case 4 F and F 
    Put_Line("---------Test case 4 F and F ---------");
    if B < A and fal then
        Put_Line("Test 4 statement A is False but statement 2 Is True this should not print");

    else
       Put_Line("Test 4 passed F and F if the eval statement prints then short circuit is not supported since statement 1 was already false no need to check second statement.");
    end if;

end ADACode; 
