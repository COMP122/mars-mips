# Program Name: add
# Description:
#   The add subroutine is designed to use the CLI to add to numbers together
#   This program demonstrates:
#     1. how values from the environment are passed as arguments to the main subroutine
#     1. how a ASCII string is converted into an integer
#     1. how a return value is passed back to the environment
#     
#   The two numbers are provided as ASCII strings 
#
# General Usage Example:
#   $ add 3 4
#   7              
#   $ echo $?      
#   7
#   $
#
# MARS Usage:  
#   $ mars me p add.asm pa 3 4  2>/dev/null      # where arg1=3, arg=4
#   7              # Output the sum on stdout 
#   $ echo $?      # Return the sum from the program
#   7
#   $
#   
                .text
                .globl main

main:           nop 
                # v0: sum    -- the value to be returned from the program
                # a0: argc   -- the argument "count", an integer
                # a1: &argv  -- the arguments "values", an array of ASCII strings
                
                # t0: sum    -- the initial value of the sum
                # t1: arg1   -- the first input argument
                # t2: arg2   -- the second input argument
                
                # load the address of the ASCII strings associated with the 1st & 2nd arg 
                lw $t1, 0($a1)                  # $t1 = argv[0];
                lw $t2, 4($a1)                  # $t2 = argv[1];
                 
                move $a0, $t1                   # Convert the ASCII string to an integer
                jal atoi                        # t1 = atoi(t1)
                move $t1, $v0
                
                move $a0, $t2                   # Convert the ASCII string to an integer
                jal atoi                        # t2 = atoi(t2)
                move $t2, $v0
                
                add $t0, $t1, $t2               # sum = arg1 + arg2
   
                move $a0, $t0                   # printf("%d", sum);
                li $v0, 1
                syscall
      
                li $a0, '\n'                    # printf("%c", '\n');
                li $v0, 11
                syscall
              
                move $a0, $t0                   # exit(sum);
                li $v0, 17
                syscall


####################################################################
##      The C and Java equivalent implemenation follows
##
##----------------------------------------------------------------
##      C Code
##----------------------------------------------------------------
##      #include <stdio.h>
##      #include <stdlib.h>
##
##      int main(int argc, char * argv[]) {
##      
##        int count = argc;
##        int operand1 = atoi(argv[1]);  // Note: In C, argv[0] refers to the program name.
##        int operand2 = atoi(argv[2]);
##      
##        int sum = operand1 + operand2;
##      
##        printf("%d\n", sum);
##        exit(sum);
##      }
##      
##      
##----------------------------------------------------------------
##      Java Code
##----------------------------------------------------------------
##
##      import java.lang.System.*;
##      public class sum {
##       
##        public static void main(String args[])  {
##        
##          // Demarshall the commandline arguments
##          int count    = args.length;
##          String arg1  = args[0];
##          String arg2  = args[1];
##        
##          // Convert the ASCII string to an Integer
##          int operand1 = Integer.parseInt(arg1);
##          int operand2 = Integer.parseInt(arg2);
##        
##          int sum = operand1 + operand2;    // Add the operands together
##        
##          System.out.printf("%d\n", sum);   // Print the integer: "sum"
##          System.exit(sum);                 // Exit program with the value "sum"
##          return;
##        }
##      }
##      
