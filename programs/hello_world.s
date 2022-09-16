# This example MIPS program performs the traditional "hello-world" example.
# 
# 
#   1. the variable str is assigned to .data segment
#   1. the variable str is initialized with "Hello World\n"
#   1. the subroutines ("main" and "main2") are placed into the .text segment
#   1. the subroutine "main" uses macros to perform the system calls
#      - print_si: prints a "s"tring which is provided as an "i"mmediate value
#      - exiti: exits the program with the value of the given "i"mmediate value
#   1. the subroutine "main2" performs the same operations but without the use of macros
#      - system call #4 is used to print the string
#      - system call #17 is used to exit the program with a value

                .data
str:            .asciiz "Hello World\n" # H,e,l,l,o, ,W,o,r,l,d,\n,\0

                .text
                .globl main
                .include "macros/syscalls.s"

main:           nop
                print_si(str)
                exiti(0)


main2:           nop
                la $a0, str     # a0 contains the address of str
                li $v0, 4       # v0 contains the number for print_s, 4
                syscall         # trap: print_s(str)

                li $a0, 0       # a0 contains the return value        
                li $v0, 17      # v0 contains the number for exiti, 17
                syscall         # trap: exit
        
        



        
