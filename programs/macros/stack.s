# Filename: stack.s
#
# Description: 
#    This file contains a set macros to provide the perform the basic operation 
#    to push and pop items from the stack.
#
#    Note that Macros are not part of the ISA, but are provided by the assembler
#    Here we presume either the MARS or SPIM assembler is used.
#
#    The general usage is as follows:
#    
#      - push $reg1 [, $reg2, ... $reg10 ]
#      - pop  $reg1 [, $reg2, ... $reg10 ]
#
#      - push_t_registers
#      - pop_t_registers
#
#      - push_s_registers
#      - pop_s_registers
#
# Note on the ARM ISA
#    The ARM ISA provides a native push and pop instruction of the following form:
#      - push { $r1, $r2, $r3 }
#    The macros define here mimic this operation
#
# Operational Description.
#    On the MIPS ISA, 
#      - the $sp register holds the address of stored element on top of the stack
#      - the stack grows downwards in memory
#      - Push:
#          1. move the top of the stack up by decrementing $sp by 4 bytes
#          1. store the register into the top position of the stack
#      - Pop:
#          1. load the register from the top position of the stack
#          1. move the top of the stack down by incrementing $sp by 4 bytes
#  
#      - Multiple Push/Pop:
#          1. for a push, the $sp is adjusted by the required space
#          1. relative address is used to store/load registers to/from the stack
#          1. for a pop, the $sp is adjusted by the required space
#

######################
# Push Macros

.macro push(%r0)
   addiu $sp, $sp, -4
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1)
   addiu $sp, $sp, -8
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2)
   addiu $sp, $sp, -12
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3)
   addiu $sp, $sp, -16
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3, %r4)
   addiu $sp, $sp, -20
   sw %r4, 16($sp)
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3, %r4, %r5)
   addiu $sp, $sp, -24
   sw %r5, 20($sp)
   sw %r4, 16($sp)
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3, %r4, %r5, %r6)
   addiu $sp, $sp, -28
   sw %r6, 24($sp)
   sw %r5, 20($sp)
   sw %r4, 16($sp)
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3, %r4, %r5, %r6, %r7)
   addiu $sp, $sp, -32
   sw %r7, 28($sp)
   sw %r6, 24($sp)
   sw %r5, 20($sp)
   sw %r4, 16($sp)
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3, %r4, %r5, %r6, %r7, %r8)
   addiu $sp, $sp, -36
   sw %r8, 32($sp)
   sw %r7, 28($sp)
   sw %r6, 24($sp)
   sw %r5, 20($sp)
   sw %r4, 16($sp)
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro

.macro push(%r0, %r1, %r2, %r3, %r4, %r5, %r6, %r7, %r8, %r9)
   addiu $sp, $sp, -40
   sw %r9, 36($sp)
   sw %r8, 32($sp)
   sw %r7, 28($sp)
   sw %r6, 24($sp)
   sw %r5, 20($sp)
   sw %r4, 16($sp)
   sw %r3, 12($sp)
   sw %r2, 8($sp)
   sw %r1, 4($sp)
   sw %r0, 0($sp)
.end_macro


######################
# Pop Macros

.macro pop(%r0)
   lw %r0, 0($sp)
   addiu $sp, $sp, 4
.end_macro

.macro pop(%r0, %r1)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 8
.end_macro

.macro pop(%r0, %r1, %r2)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 12
.end_macro

.macro pop(%r0, %r1, %r2, %r3)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 16
.end_macro

.macro pop(%r0, %r1, %r2, %r3, %r4)
   lw %r4, 16($sp)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 20
.end_macro

.macro pop(%r0, %r1, %r2, %r3, %r4, %r5)
   lw %r5, 20($sp)
   lw %r4, 16($sp)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 24
.end_macro

.macro pop(%r0, %r1, %r2, %r3, %r4, %r5, %r6)
   lw %r6, 24($sp)
   lw %r5, 20($sp)
   lw %r4, 16($sp)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 28
.end_macro

.macro pop(%r0, %r1, %r2, %r3, %r4, %r5, %r6, %r7)
   lw %r7, 28($sp)
   lw %r6, 24($sp)
   lw %r5, 20($sp)
   lw %r4, 16($sp)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 32
.end_macro

.macro pop(%r0, %r1, %r2, %r3, %r4, %r5, %r6, %r7, %r8)
   lw %r8, 32($sp)
   lw %r7, 28($sp)
   lw %r6, 24($sp)
   lw %r5, 20($sp)
   lw %r4, 16($sp)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 36
.end_macro

.macro pop(%r0, %r1, %r2, %r3, %r4, %r5, %r6, %r7, %r8, %r9)
   lw %r9, 36($sp)
   lw %r8, 32($sp)
   lw %r7, 28($sp)
   lw %r6, 24($sp)
   lw %r5, 20($sp)
   lw %r4, 16($sp)
   lw %r3, 12($sp)
   lw %r2, 8($sp)
   lw %r1, 4($sp)
   lw %r0, 0($sp)
   addiu $sp, $sp, 40
.end_macro


######################
# Aggregate Macros

.macro push_s_registers()
   push $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9
.end_macro

.macro pop_s_registers()
   pop $t0, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9
.end_macro

.macro push_s_registers()
   pop $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7
.end_macro

.macro pop_s_registers()
   pop $s0, $s1, $s2, $s3, $s4, $s5, $s6, $s7
.end_macro
