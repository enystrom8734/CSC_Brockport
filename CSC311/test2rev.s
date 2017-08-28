###############################################################
# Program Name: Assignment 2 - Mistypes
# Programmer: Erik D Nystrom
# Date: 03/5/2015
###############################################################
# Functional Description: 
# Decode a string that is typed by shifting the hand over one 
# character
###############################################################

	.data	# Data declaration section
# Super secret decover ring!
Alpha:	.asciiz " QWERTYUIOPASDFGHJKLZXCVBNM."
SAlpha: .asciiz " WERTYUIOP[SDFGHJKL;XCVBNM,/"

# Declare space for 80 characters (console width, just in case)
Input:	.space 80

# Element of function variables
Prompt:	.asciiz " Input string to decode:\n"

# End prompt
Bye:	.asciiz "\n\n End Program"

	.globl main
	.text
###############################################################	
########    Start of code section    ##########################
###############################################################	
main:
	la	$a0, Prompt	# Print input prompt
	li	$v0, 4		# Load Print string
	syscall			# Print string
	
	li	$v0, 8		# Load Read string
	li	$a1, 80		# Load 80 character buffer
	la	$a0, Input	# Load address to store string
	syscall			# Get user string!
	
	b End
	
	
	
	
###############################################################	
########    Print set function    #############################
###############################################################
prnset:	
	li	$t0, 1		# Initialize bit mask
	li	$a2, 1		# Set i = 1
	li	$a3, 32		# Set i limit to 32
	la	$a0, LeftB	# Start set building
	li	$v0, 4
	syscall
While:	
	bgt	$a2, $a3, fin	# Loop while a2 <= 32
	and 	$t3, $a1, $t0	# Does this number exist in set?
	beqz	$t3, else	# If != 0 then
	la	$a0, CmSpc	# Build set
	li	$v0, 4		# Print string
	syscall
	move	$a0, $a2	# Copy result to print
	li 	$v0, 1		# Print i
	syscall	
	addiu	$a2, 1		# Increment loop
	sll	$t0, $t0, 1	# Shift mask left to see if present
	b	next
else:	
	addiu	$a2, 1		# Increment loop
	sll	$t0, $t0, 1	# Shift mask left to see if present
next:
	b 	While	
fin:	
	la	$a0, RghtB	# End set
	li	$v0, 4		# Print string
	syscall
	jr	$ra

###############################################################	
########    Element of function    ############################
###############################################################
element:
	li	$v0, 4
	la	$a0, Prompt
	syscall
	li	$v0, 5
	syscall
	move	$t1, $v0
	addiu	$t1, $t1, -1
	li	$t0, 1		# Initialize bit mask
	sllv 	$t0, $t0, $t1	# Mask shift to set number
	and	$t2, $a1, $t0	# Does element exist?
	beqz	$t2, DNE	# If != 0 then
	la	$a0, In		# Exists!
	li	$v0, 4		# Print string
	syscall
	b	return
DNE:	
	la	$a0, Notin	# DNE
	li	$v0, 4		# Print string
	syscall
return:	jr	$ra

###############################################################	
########    Union function    #################################
###############################################################
union:
	or	$a1, $a1, $a2	
	move	$t9, $ra
	la	$a0, unn
	li	$v0, 4
	syscall
	jal	prnset
	jr	$t9
	
###############################################################	
########    Intersection function    ##########################
###############################################################
inter:
	and	$a1, $a1, $a2	
	move	$t9, $ra
	la	$a0, int
	li	$v0, 4
	syscall
	jal	prnset
	jr	$t9
	
End:	#End program
	li	$v0, 4
	la	$a0, Bye
	syscall
	li	$v0, 10
	syscall	

# END OF PROGRAM