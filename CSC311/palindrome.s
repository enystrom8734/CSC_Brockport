###############################################################
# Program Name: Palindrome
# Programmer: Erik D Nystrom
# Date: 02/07/2015
###############################################################
# Functional Description: 
# Find the palindrome (e.g. 9339) of any
# input number through addition and reversal
###############################################################
# Instructions for palindrome
#
# While m != 0 
#   r = m % 10
#   z = z * 10 + r
#   m = m/10
#
# r: remainder, z: reversal, m: input
# When the number can't be divided anymore
# exit loop
###############################################################

	.data	# Data declaration section
Input:	.asciiz "\n Input to find palindromic number: "
Result:	.asciiz "\n\n Palindrome found: "
Steps:	.asciiz "\n Steps to find: "
Bye:	.asciiz "\End Program"
	.globl	main
	.text

main:		# Start of code section
	li	$s0, 10		# 10 for divisor
	li	$s1, 0		# Initialize flip
	li 	$v0, 4		# Print String
	la 	$a0, Input	# Prompt for input
	syscall
	li 	$v0, 5		# Read Integer
	syscall
	move	$t0, $v0	# Move input into $t0
	move	$s2, $t0	# Copy input so we dont lose it



While: 	# Loop is not equal
	divu	$t0, $s0	# Mod/div in 1 process!
	mflo	$t0		# Move result into $t0
	mfhi	$t1		# Move remainder into $t1
	multu	$s1, $s0	# Being reversal
	mflo	$t2		# Prepare last digit first
	addu	$s1, $t2, $t1	# Place last digit first
	bnez	$t0, While	# Loop until cant divide
	
	# If reverse equals, branch to end and print results
	beq	$s1, $s2, End	# Check if palindrom, end if
	addi	$s7, $s7, 1	# Lets see how long it took
	addu	$t0, $s1, $s2	# Keep finding palindrome!
	li	$s1, 0		# reset flipper
	move	$s2, $t0	# We need to div this number
	b While			# Loop
	
End:	# Time to exit
	li	$v0, 4
	la	$a0, Result
	syscall
	li 	$v0, 1
	move	$a0, $s1
	syscall
	li	$v0, 4
	la	$a0, Steps
	syscall
	li 	$v0, 1
	move	$a0, $s7
	syscall
	#End
	li	$v0, 10
	syscall

# END OF PROGRAM