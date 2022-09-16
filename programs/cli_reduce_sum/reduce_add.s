# Program Name: reduce_add
# Description:
#   The program reduces, via the add function, the series of ASCII numbers provided on the commandline
#   This program demonstrates:
#     1. how values from the environment are passed as arguments to the main subroutine
#     1. how to loop through each of the arguments
#     1. how to convert a signal ASCII number to binary integer
#     1. how a return value is passed back to the environment
#     
# General Usage Example:
#   $ add 1 2 3 4
#   10              
#   $ echo $?      
#   10
#   $
#
# MARS Usage:  
#   $ mars me p reduce_add.asm pa 1 2 3 4  2>/dev/null  
#   7              
#   $ echo $?      # Return the sum from the program
#   7
#   $
#   
                .text
                .globl main

main:           nop 
 top:               # v0: sum             -- the value to be returned from the program
                # a0: argc            -- the argument "count", an integer
                # a1: &argv           -- the arguments "values", an array of ASCII strings
                
                # t0: count           -- the argument "count", an integer
                # t1: ascii_string    -- in turn: argv[1], argv[2], ... argv[count]
                # --
                # t2: sum             -- the initial value of the sum
                # t3: i               -- the loop variant
        
                # Marshall your input arguments
                move $t0, $a0           # int count = argc;
                move $t1, $a1           # char ** ascii_values = argv;
        
                li $t2, 0               # sum = 0;
                li $t3, 1               # // int i=1;
    loop:       nop                     # for (int i=1; i <= count; i++) {
                bgt $t3, $t0, done  
                                      
                  lw $a0, 0($t1)        #   // Convert the ASCII string to an integer
                  jal atoi              #   value = atoi( (* ascii_string ));
                  move $t4, $v0
                
                  add  $t2, $t2, $t4    #   sum = sum + value;
                  addi $t1, $t1, 4      #   ascii_string++;
                  addi $t3, $t3, 1      #   i++;
                b loop                  # }
    done:       nop                     

                move $a0, $t2           # printf("%d", sum);
                li $v0, 1
                syscall
      
                li $a0, '\n'            # printf("%c", '\n');
                li $v0, 11
                syscall
              
                move $a0, $t2           # exit(sum);
                li $v0, 17
                syscall


####################################################################
##      C Code
##----------------------------------------------------------------
##      #include <stdio.h>
##      #include <stdlib.h>
##
##      int main(int argc, char * argv[]) {
##        
##        int count = argc;
##        char ** ascii_string = argv;
##
##        int sum = 0;
##        for (int i=1; i <= count; i++) {
##           // Convert the ASCII string to an integer
##           int value = atoi(* ascii_string); 
##           sum = sum + value;
##           ascii_string ++;
##        }
##
##        printf("%d\n", sum);
##        exit(sum);
##      }
##       
