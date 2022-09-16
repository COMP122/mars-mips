                .data
num:            .space 4        # space for a integer number
        
                .text
                .globl main
        
main:           nop             # label for the main program
                li $v0, 5       # v0 = 5 (read_d == 5)
                syscall         # trap to the kernel: v0 = read_d()
        
                nop             # num = v0
                la $t0, num     # - t0 = & num
                sw $v0, 0($t0)  # - MEM[ 0 + t0 ] = v0
        
                move $a0, $v0   # a0 = v0
                li $v0, 1       # v0 = 1 (print_d == 1)
                syscall         # trap: print_int(a0)
        
                li $v0, 10      # v0 = 10 (terminate == 10)
                syscall         # trap: terminate

