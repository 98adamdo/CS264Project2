# Who:  Adam Do
# What: Project 2
# Why:  A template to be used for all CS264 labs
# When: Created:	4/30/18
#		Due:		5/2/18
# How:  List the uses of registers

.data
Array:			.space 		188													#47-element integer array
Prompt:			.asciiz		"Please enter a positive integer less than 48.\n"	#print message for user prompt
Error:			.asciiz		"Error. Incorrect input.\n"

.text
.globl main


main:	# program entry
	jal CheckNum

CheckNum:
	li 		$v0, 4										#system call for print String
	la		$a0, Prompt									#load address of Prompt into $a0
	syscall
	li 		$v0, 5										#system call for read int
	syscall
	move	$t0, $v0									#move $v0 to $t0, where the number is stored
	slti	$t1, $v0, 48								#if num is less than 48, $t1 is 1
	bne		$t1, $zero, StoreArray						#if $t1 != 0, jump to StoreArray
	li 		$v0, 4
	la 		$a0, Error
	syscall
	j CheckNum

StoreArray:
li $v0, 10		# terminate the program
syscall
	





li $v0, 10		# terminate the program
syscall
