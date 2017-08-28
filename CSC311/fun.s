# A program to demonstrate function calls

	.data	# Data declaration section
prompt: .asciiz "\n Please enter an integer "
result1: .asciiz "\n Side 1 is: "
result2: .asciiz "\n Side 2 is: "
result3: .asciiz "\n The distance squared is: "

	.text

main:		# Start of code section
	jal printst
	jal readint
	move $t0, $v0
	jal printst
	jal readint
	move $t1, $v0
	jal printst
	jal readint
	move $t2, $v0
	jal printst
	jal readint
	move $t3, $v0
	jal square
	jal printres
	li $v0, 10
	syscall
printst:
	li $v0, 4
	la, $a0, prompt
	syscall
	jr $ra
readint:
	li $v0, 5
	syscall
	jr $ra
square:
	la $s2, getdistance
	jalr $s3, $s2
	addi $t8, 1
	jr $ra
getdistance:
	la $s0, getsides
	jalr $s1, $s0
	mult $t4, $t4,
	mflo $t6
	mult $t5, $t5
	mflo $t7
	add $t8, $t6, $t7
	jr $s3
getsides:
	sub $t4, $t2, $t0
	sub $t5, $t3, $t1
	jr $s1
printres:
	li $v0, 4
	la, $a0, result1
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la, $a0, result2
	syscall
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la, $a0, result3
	syscall
	li $v0, 1
	move $a0, $t8
	syscall
	jr $ra

# END OF PROGRAM