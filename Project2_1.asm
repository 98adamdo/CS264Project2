# Who:  Adam Do
# What: Project 2
# Why:  A template to be used for all CS264 labs
# When: Created:	4/30/18
#		Due:		5/2/18
# How:  List the uses of registers

.data
Array:			.space 		184				#46-element integer array
Prompt:			.asciiz		"Please enter an integer between 0 and 46, inclusive.\n"	#print message for user prompt
Error:			.asciiz		"User inputted integer is not between 0 and 46, inclusive. Now terminating the program."

.text
.globl main


main:	# program entry
li 		$v0, 4					#system call for print String
la 		$a0, Prompt 			#load address of Prompt into $a0
syscall
li 		$v0, 5					#system call for read int
syscall
move	$t0, $v0				#move $v0 into $t0 where the user int is stored
slt		$t1, $v0, $zero			#if user int < 0, $t1 == 1		check for negative
bne 	$t1, $zero, ErrorMsg	#if $t1 != 0, exit => if user int < 0, branch to Exit
slti	$t1, $v0, 47			#if user int < 47, $t == 1		check for greater than 47
beq		$t1, $zero, ErrorMsg 	#if $t1 == 0, exit => if user int >= 47, branch to Exit
j Exit

ErrorMsg:
li 		$v0, 4					#system call for print String
la 		$a0, Error 				#load address of Error into $a0
syscall
j Exit



Exit:
li 		$v0, 10					#terminate the program
syscall
