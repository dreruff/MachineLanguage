# CS24 Assignment 3 "Prime Number Program"
# Greg Ruffin gregoryaruffin@gmail.com

.globl main

.text
main: 	
		addi $v0,$0,4		# print welcome
		la $a0, s_welcome
		syscall
	
		addi $v0,$0,4		# print newline
		la $a0, s_newLine
		syscall
	
		addi $v0,$0,4		# print prompt
		la $a0, s_prompt
		syscall
		
		addi $v0,$0,5		# read int
		syscall
		add $s0,$v0,$0
		
		addi $v0,$0,1		# print first prime number(2)
		addi $a0,$0,2
		syscall
		addi $s0,$s0,-1
		
		addi $v0,$0,4		# print newline
		la $a0, s_newLine
		syscall
		
		beq $s0,0,exit		# if (n-1) = 0, exit
		
		addi $v0,$0,1		# print second prime number(3)
		addi $a0,$0,3
		syscall
		addi $s0,$s0,-1
		
		addi $v0,$0,4		# print newline
		la $a0, s_newLine
		syscall
		
		beq $s0,$0,exit		# if (n-2) = 0, exit
		
		addi $s1,$0,5		# s1 is test number		
loop:		
		jal test_prime
		beq $s2,$0, not_prime

		addi $v0,$0,1		# print prime num
		addi $a0,$s1,0
		syscall
		
		addi $v0,$0,4		# print newline
		la $a0, s_newLine
		syscall		
		
		addi $s0,$s0,-1		#n--
		
not_prime:	addi $s1,$s1,2
		bne $s0,$0,loop
		
exit:		addi $v0,$0,10		# end 
		syscall

test_prime:	addi $t0,$0,3		# division by 3 to n/2
test_loop:	divu $s1, $t0		# nextInt / oddNum <= n		
	 	mfhi $t1			
	 	mflo $t2			
	 	beq $t1,$0,false	
		addi $t0,$t0,1		
		bne $t0,$s1,test_loop	
true:	 	addi $s2,$0,1		# return true(prime)
	 	jr $ra
false:		addi $s2,$0,0		# return false(composite)
		jr $ra
print_:
		addi $v0,$0,1		# print first prime number(2)
		syscall
	

.data
s_welcome:	.asciiz "Prime Number Program"
s_newLine:	.asciiz "\n"
s_prompt:	.asciiz "How many primes? (n >= 0) "
