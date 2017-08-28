###############################################################
# Program Name: Lab 4 sets 1 and 2 defined
# Programmer: Erik D Nystrom
# Date: 03/4/2015
###############################################################
# Functional Description: 
# Set of a word given bit values, if an element exists,
# the union of two sets, and the intersection of the two sets
###############################################################

	.data	# Data declaration section
# Main string strings
Set1:	.asciiz "\n Set 1: "
Set2:	.asciiz	"\n Set 2: "

# Input for sets 1 and 2
In1:	.asciiz "\ Enter number to convert to set 1: "
In2:	.asciiz "\ Enter number to convert to set 2: "

# Element of function variables
Prompt:	.asciiz " Element to search for: "
In:	.asciiz "\n Set contains the element.\n"
Notin:  .asciiz "\n Set does not contain the element.\n"

# Print set function variables
LeftB:	.asciiz "{"
RghtB:	.asciiz " }\n"
CmSpc:	.asciiz " "

# Union set function variables
unn:	.asciiz "\n Unioned set: "

# Intersection set function variables
int:	.asciiz "\n Intersected set: "

# End prompt
Bye:	.asciiz "\n\n End Program"

	.globl main
	.text
###############################################################	
########    Start of code section    ##########################
###############################################################	
main:
	li	$s0, 0x24924924
	li	$s1, 0xaaaaaaaa

	move	$a1, $s0	# Print set 1
	la	$a0, Set1
	li	$v0, 4
	syscall
	jal	prnset		# Print set
	jal	element		# Determine if element exists
	move	$a1, $s1	# Print set 2
	la	$a0, Set2
	li	$v0, 4
	syscall
	jal	prnset		# Print set
	jal	element		# Determine if element exists
	
	move	$a1, $s0	# Load argument 1
	move	$a2, $s1	# Load argument 2
	jal 	union		# Determine union of two sets
	move	$a1, $s0	# Load argument 1
	move	$a2, $s1	# Load argument 2
	jal 	inter		# Determine intersection of sets
	j	End		# End
	
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