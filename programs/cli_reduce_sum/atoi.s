            .text
            .include "stack.s"
            .globl atoi
          
atoi:       nop               # int atoi(char * str);
                              #   Converts the initial portion of the string ("str")
                              #   into an integer (i.e., 2's complement)
                              # This subroutine presume that all input values are non-negative

            # v0 : value                  : the numeric value of the string
            # a0 : &str                   : the address of the input string

            # Epilogue: Save S-registers
            push $s0, $s1, $s2, $s3 

            # -------------------
            # s0 : value                  : the current value of the number
            # s1 : &ascii_digit           : the address of the current character
            # s2 : digit                  : the numeric value of the current char
            # s3 : base (10)              : the value 10

            # MIPS Code                   # C pseudo code
            li $v0, 0                     # value = 0;
            li $s3, 10
                                                
            move $s1, $a0                 # ascii_digit = str;
            lb $s2, 0($s1)                # digit = (* ascii_digit) - '0';
            subi $s2, $s2, '0'

top:        blt $s2, $zero, while_done    # while (0 <= digit && digit < base) {
            bge $s2, $s3, while_done
               mult $s0, $s3              #   value = value * base + digit;
               mflo $s0
               add $s0, $s0, $s2  
      
               addi $s1, $s1, 1           #   ascii_digit ++;
      
               lb $s2, 0($s1)             #   digit = (* acii_digit) - '0';
               subi $s2, $s2, '0'
            b top                         # }
while_done: nop

            move $v0, $s0

            # Prologue: Restore the S-registers
            pop $s0, $s1, $s2, $s3 

            jr $ra                        # return value;



# C pseudo code
# 
# int atoi(char * str) {
#   value = 0;
#   ascii_digit = str;
#   digit = (* ascii_digit) - '0';
#   while (0 <= digit && digit < base) {
#     value = value * base + digit;
#     ascii_digit ++;
#     digit = (* acii_digit) - '0';
#   }
#   return value;
# }
