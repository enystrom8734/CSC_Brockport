###############################################################
# Program Name: Assignment 2 - Decoder
# Programmer: Erik D Nystrom
# Date: 03/5/2015
###############################################################
# Functional Description: 
# Decode a string that is typed by shifting the hand over one 
# character
###############################################################

	.data	# Data declaration section
# Super secret decoder ring (SSDR) and
# Super secret encoded string (SSES)
SSES:	.asciiz " QWERTYUIOPASDFGHJKLZXCVBNM."
SSDR:	.asciiz " WERTYUIOP[SDFGHJKL;XCVBNM,/"

# Declare space for 80 characters (console width, just in case)
Input:	.space 80

# User prompts
Prompt:	.asciiz "\n Input string to decode: "
Decode: .asciiz "\n Decoded string: "

# End prompt
Bye:	.asciiz "\n\n End Program"

	.globl main
	.text
###############################################################	
########    Start of code section    ##########################
###############################################################	
main:	la	$a0, Prompt	# Print input prompt
	li	$v0, 4		# Load Print string
	syscall			# Print string
	
	li	$v0, 8		# Load Read string
	li	$a1, 80		# Load 80 character buffer
	la	$a0, Input	# Load address to store string
	syscall			# Get user string!
	
	la	$a0, Input	# Load input string address
	jal	strlen
	move	$a0, $v0	# Pass string length
	la	$a1, Input	# Pass input string address
	jal	decoder		# Use our SSDR on SSES
			
	b End

###############################################################	
########    String length function    #########################
###############################################################
strlen:	li	$t0, 0		# Initialize loop
loop:	lb	$t1, 0($a0)	# Load character into $t1
	beqz	$t1, retstr	# End loop if null character
	addi	$a0, $a0, 1	# Increment to next character
	addi	$t0, $t0, 1	# Increment loop counter
	b	loop		# Loop!
retstr:	move	$v0, $t0	# Pass return value
	jr	$ra		# Return from function

###############################################################	
########    Decoder function    ###############################
###############################################################
decoder:			# $a0 set on call into function
	li	$v0, 9		# Initiate dynamic memory alloc
	syscall			# Allocate
	move	$s0, $v0	# Save address of output
	move	$t9, $s0	# Working address of output
	move	$t8, $a1	# Load input string address
	# Initialize decoding loop 3..2..1..
	li	$t0, 0		# Initialize loop
	li	$s1, 10		# New line character
dloop:
	lb	$t1, 0($t8)	# Load first character to check
	beq	$t1, $s1,retdec	# End loop if equal to nl
	la	$t2, SSES
	la	$t3, SSDR
	li	$t4, 0		# Init nested loop
nloop:
	lb	$t5, 0($t3)	# Load decoding character
	beq	$t1, $t5, mat	# Branch if matched
	addiu	$t4, $t4, 1	# Increment loop
	addiu	$t3, $t3, 1	# Next decoding character
	b	nloop		# Reloop
mat:				# If character matches
	add	$t2, $t2, $t4	# Get decoded character
	lb	$t4, 0($t2)	# Decoded character load
	sb	$t4, 0($t9)	# Store character in output
	addiu	$t9, $t9, 1	# Prepare next character
	addiu	$t8, $t8, 1	# Load next input character
	b	dloop		# Next character to decode
	
retdec:	la	$a0, Decode
	li	$v0, 4
	syscall
	move	$a0, $s0
	syscall
	jr	$ra
	
###############################################################	
########    End of program    #################################
###############################################################	
End:	li	$v0, 4
	la	$a0, Bye
	syscall
	li	$v0, 10
	syscall	

# END OF PROGRAM