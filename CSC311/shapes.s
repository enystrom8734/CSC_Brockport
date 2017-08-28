# Shapes - Calculate area of shape based on input coordinates
# x1,y1 and x2,y2

	.data	# Data declaration section
#Data prompts
Prx1:	.asciiz	"\n\n Input X1 = "
Pry1:	.asciiz	" Input Y1 = "
Prx2:	.asciiz	" Input X2 = "
Pry2:	.asciiz	" Input Y2 = "
acirc:	.asciiz "\n Area of circle: "
asqre:	.asciiz "\n Area of square: "
arect:	.asciiz "\n Area of rectangle: "
Bye:	.asciiz "\n End Program"

#Menu Prompts
Pr1:	.asciiz "\n\n To quit enter 0"
Pr2:	.asciiz "\n To calculate the area of a circle enter 1"
Pr3:	.asciiz "\n To calculate the area of a square enter 2"
Pr4:	.asciiz "\n To calculate the area of a rectangle enter 3"
Mentry:	.asciiz	"\n Selection: "
	.globl main
	.text

main:		# Start of code section
	li	$s1, 314156	#Pi
	li	$s2, 100000	#Pi divisor
menu:		#Menu label
	li	$v0, 4
	la	$a0, Pr1	#Load address for Pr1
	syscall
	la	$a0, Pr2	#Load address for Pr2
	syscall
	la	$a0, Pr3	#Load address for Pr3
	syscall
	la	$a0, Pr4	#Load address for Pr4
	syscall
	la	$a0, Mentry	#Load address for Mentry
	syscall
	li	$v0, 5
	syscall
	move 	$s0, $v0
	li	$t0, 3
	bgt	$s0, $t0, menu	#branch back to menu if invalid
	bltz	$s0, menu
	beqz	$s0, End
	
entry:		#Coordinate entry
	li	$v0, 4		#Syscall for Print string
	la	$a0, Prx1	#Load address of Prx1
	syscall
	li	$v0, 5		#Read integer
	syscall
	move	$t0, $v0	#Copy X1 into $t0
	
	li	$v0, 4		#Syscall for Print string
	la	$a0, Pry1	#Load address of Pry1
	syscall
	li	$v0, 5		#Read integer
	syscall
	move	$t1, $v0	#Copy Y1 into $t2
	
	li	$v0, 4		#Syscall for Print string
	la	$a0, Prx2	#Load address of Prx2
	syscall
	li	$v0, 5		#Read integer
	syscall
	move	$t2, $v0	#Copy X2 into $t2
	
	li	$v0, 4		#Syscall for Print string
	la	$a0, Pry2	#Load address of Pry2
	syscall
	li	$v0, 5		#Read integer
	syscall
	move	$t3, $v0	#Copy Y2 into $t3
	
	li	$s6, 3
	li	$s5, 2
	beq	$s0, $s5, sqre
	beq	$s0, $s6, rect
	#Else circle follow through
	
	#(X2-X1)^2 + (Y2-Y1)^2 = Distance of line
circ:	#Circle calculation
	sub	$t4, $t2, $t0	#Subtract X2-X1
	sub	$t5, $t3, $t1	#Subtract Y2-Y1
	mult	$t4, $t4	#Square X
	mflo	$s3		#Move value from LO to $s3
	mult	$t5, $t5	#Square y
	mflo	$s4		#Move value from LO to $s4
	add	$t6, $s3, $s4	#Add X and Y
	
	mult 	$s1, $t6	#Mult Pi and r^2
	mflo	$t9		#Move from LO to $t9
	div	$t9, $s2	#Div 100,000
	mflo	$t9		#Result into $t9

	li	$v0, 4
	la	$a0, acirc
	syscall
	move	$a0, $t9	#Load integer into $a0
	li	$v0, 1		#Print Integer
	syscall
	b menu			#Branch back to menu
	
sqre:	#Square calculation
	sub	$t4, $t2, $t0	#Subtract X2-X1
	sub	$t5, $t3, $t1	#Subtract Y2-Y1
	mult	$t4, $t4	#Square X
	mflo	$s3		#Move value from LO to $s3
	mult	$t5, $t5	#Square y
	mflo	$s4		#Move value from LO to $s4
	add	$t9, $s3, $s4	#Add X and Y into $t9

	li	$v0, 4
	la	$a0, asqre
	syscall
	move	$a0, $t9	#Load integer into $a0
	li	$v0, 1		#Print Integer
	syscall
	b menu			#Branch back to menu

rect:	#Rectangle calculation
	sub	$t4, $t2, $t0	#Subtract X2-X1
	sub	$t5, $t3, $t1	#Subtract Y2-Y1
	mult	$t5, $t4	#Find diagonal
	mflo	$t9		#Result into $t9

	li	$v0, 4
	la	$a0, arect
	syscall
	move	$a0, $t9	#Load integer into $a0
	li	$v0, 1		#Print Integer
	syscall
	b menu			#Branch back to menu

End:	#End program
	li	$v0, 4
	la	$a0, Bye
	syscall
	li	$v0, 10
	syscall	

# END OF PROGRAM