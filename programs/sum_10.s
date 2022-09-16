	.data
count:  .word  10       # int count = 10;

	.text
	.globl main

main:   nop     	# label for the main program

	# s0: count
	# s1: sum

	nop		# initialize our loop
	la $t0, count   # t0 = &count
	lw $s0, 0($t0)	# s0 = MEM[ t0 + 1]

	move $s1, $zero	# s1 = 0

loop:	nop
	li $v0, 5     	# v0 = 5 (read_int == 5)
	syscall	      	# trap to the kernel: v0 = read_int()

	add $s1, $s1, $v0	# sum = sum + input
	addi $s0, $s0, -1	# count = count - 1
	bne $s0, $zero, loop	# if (count != 0 ) goto loop
	nop			# delayed branch?


	move $a0, $s1   # a0 = sum
	li $v0, 1    	# v0 = 1 (print_int == 1)
	syscall         # trap: print_int(a0)

	li $v0, 10   	# v0 = 10 (terminate == 10)
	syscall   	# trap: terminate

