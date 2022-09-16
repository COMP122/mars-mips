            .text
            .macro print_string(%reg)
              move $a0, %reg
              li $v0, 4
              syscall
            .end_macro

            .macro print_char(%imm)
              li $a0, %imm
              li $v0, 11
              syscall
            .end_macro


main:       nop
            
            move $t0, $a1

            lw $t1, 0($t0)   # first arg
            print_string($t1)
            print_char('\n')

            lw $t2, 4($t0)   # second arg
            print_string($t2)
            print_char('\n')
