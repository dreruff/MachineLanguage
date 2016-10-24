# Greg Ruffin CS24 10/3/14
# adds integers together and prints sum and average

.globl main

.text
main:
	li $v0, 4		# print welcome
	la $a0, s_welcome
	syscall

	li $v0, 4		# print newline
	la $a0, s_newline
	syscall

	li $v0, 4		# print prompt
	la $a0, s_prompt
	syscall

	li $v0, 5		# read int
	syscall
	add $t0, $v0, $0	# t0 = first int
	addi $t2, $0, 1		# t2 = counter
	
loop:
	li $v0, 4		# print prompt
	la $a0, s_prompt
	syscall

	li $v0, 5		# read int
	syscall
	beq $v0, $0, end
	add $t1, $v0, $0	# t1 = next int
	addi $t2, $t2, 1	# i++
	
	add $t0, $t0, $t1	# t0 = prev sum + next int
	j loop

end:
	div $t0, $t2		# t1 = sum / i
	mflo $t1
	
	li $v0, 4		# print sumResult
	la $a0, s_sumResult
	syscall
	
	li $v0, 1		# print int
	add $a0, $t0, $0
	syscall
	
	li $v0, 4		# print newline
	la $a0, s_newline
	syscall

	li $v0, 4		# print avgResult
	la $a0, s_avgResult
	syscall
	
	li $v0, 1		# print int
	add $a0, $t1, $0
	syscall
	
	li $v0, 4		# print newline
	la $a0, s_newline
	syscall
	
	li $v0, 10		# exit
	syscall

.data
s_welcome:	.asciiz "Integer Sum and Average Program"
s_prompt:	.asciiz "Enter an integer: "
s_sumResult:	.asciiz "The sum is: " 
s_avgResult:	.asciiz "The average is: "
s_newline:	.asciiz "\n"	