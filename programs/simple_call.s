	.include "macros/syscalls.s"
	
	.data
	.text
	.globl main

add4: 	nop			# Entry point of the add4 subroutine
	# Add the four arguments
	# Return the final value

	move $s0, $zero		# s0 = 0
	add $s0, $s0, $a0	# s0 += a0
	add $s0, $s0, $a1	# s0 += a1
	add $s0, $s0, $a2	# s0 += a2
	add $s0, $s0, $a3	# s0 += a3

	move $v0, $s0
	jr $ra


main:   nop   # Main program
	# x = add4(1, 11, 21, 31)
	li $a0, 1 	# position the first argument
	li $a1, 11
	li $a2, 21
	li $a3, 31	# position the last argument
	jal add4   	# call the subroutine
	move $s0, $v0	# move the return value

	print_d($s0)	# Answers should be 64
	exit(0)


