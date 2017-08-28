###############################################################
# Program Name: FPshapes
# Programmer: Erik D Nystrom
# Date: 02/25/2015
###############################################################
# Functional Description: 
# Find the area of circle, square, or rectangle using floating
# point arithmetic and functions
###############################################################

	.data	# Data declaration section
#Data prompts
PrX1:	.asciiz	"\n\n Input X1 = "
PrY1:	.asciiz	" Input Y1 = "
PrX2:	.asciiz	" Input X2 = "
PrY2:	.asciiz	" Input Y2 = "
Pcir:	.asciiz "\n Area of circle: "
Psqr:	.asciiz "\n Area of square: "
Prec:	.asciiz "\n Area of rectangle: "
Bye:	.asciiz "\n\n End Program"

#Double data
Pi:	.double 3.1415926535897932

	.globl main
	.text

main:		# Start of code section
	li	$v0, 4		#Syscall for Print string
	la	$a0, PrX1	#Load address of Prx1
	syscall
	li	$v0, 7		#Read double
	syscall
	mov.d	$f30, $f0	#Copy X1 into $f30
	
	li	$v0, 4		#Syscall for Print string
	la	$a0, PrY1	#Load address of Pry1
	syscall
	li	$v0, 7		#Read double
	syscall
	mov.d	$f28, $f0	#Copy Y1 into $f28
	
	li	$v0, 4		#Syscall for Print string
	la	$a0, PrX2	#Load address of Prx2
	syscall
	li	$v0, 7		#Read double
	syscall
	mov.d	$f26, $f0	#Copy X2 into $f26
	
	li	$v0, 4		#Syscall for Print string
	la	$a0, PrY2	#Load address of Pry2
	syscall
	li	$v0, 7		#Read double
	syscall
	mov.d	$f24, $f0	#Copy Y2 into $f24
	
	jal	acir
	jal	asqr
	jal	arec
	j	End
	
###############################################################
# There be functions here, beware!                            #
###############################################################
lenX:	# Find the length of line from points X1 and X2
	# Returns register f22
	sub.d	$f22, $f26, $f30
	jr 	$s7
	
lenY:	# Find the length of line from points Y1 and Y2
	# Returns register f22
	sub.d	$f22, $f24, $f28
	jr 	$s7
	
sqXY:	# The square of the lengths X and Y
	# Returns registers f20, f22
	la	$t0, lenX
	jalr	$s7, $t0
	mov.d	$f2, $f22
	la	$t0, lenY
	jalr	$s7, $t0
	mov.d	$f4, $f22
	mul.d	$f20, $f2, $f2
	mul.d	$f22, $f4, $f4
	jr	$s6
	
acir:	# Find the area of a circle given X,Y points
	la	$s0, sqXY
	jalr	$s6, $s0
	mov.d	$f2, $f20
	mov.d	$f4, $f22
	add.d	$f2, $f2, $f4
	l.d	$f6, Pi
	mul.d	$f12, $f2, $f6

	li	$v0, 4
	la	$a0, Pcir
	syscall
	li	$v0, 3
	syscall
	
	jr	$ra
	
asqr:	# Find the area of a square given X,Y points
	la	$t0, sqXY
	jalr	$s6, $s0
	mov.d	$f2, $f20
	mov.d	$f4, $f22
	add.d	$f12, $f2, $f4
	
	li	$v0, 4
	la	$a0, Psqr
	syscall	
	li	$v0, 3
	syscall
	jr	$ra
	
arec:	# Find the area of a rectangle given X,Y points
	la	$t0, lenX
	jalr	$s7, $t0
	mov.d	$f2, $f22
	la	$t0, lenY
	jalr	$s7, $t0
	mov.d	$f4, $f22
	mul.d	$f12, $f2, $f4
	abs.d	$f12, $f12
	
	li	$v0, 4
	la	$a0, Prec
	syscall
	li	$v0, 3
	syscall
	
	jr	$ra

End:	#End program
	li	$v0, 4
	la	$a0, Bye
	syscall
	li	$v0, 10
	syscall	

# END OF PROGRAM