	.data
prompt1: .asciiz "Please enter a integer: "
prompt2: .asciiz "\nPlease enter another integer: "
minmsg:  .asciiz "\nThe minunum value of these two integers is: \n"
equalmsg: .asciiz "\nThese numbers are the same "
	.text
.globl main

main:


	li $v0, 4
	la $a0,prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0,prompt2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	blt $t0, $t1, minLabel
	blt $t1, $t0, min1Label
	beq $t0, $t1, equalLabel
	b exitLabel
	
    minLabel:
    	li $v0,4
    	la $a0, minmsg
    	syscall 
    	
    	li $v0, 1
	move $a0, $t0
	syscall
	
	b exitLabel
    
    min1Label:
	li $v0,4
    	la $a0, minmsg
    	syscall 
    	
    	li $v0, 1
	move $a0, $t1
	syscall

	b exitLabel
	
   equalLabel:
	li $v0,4
    	la $a0, equalmsg
    	syscall 

	b exitLabel


  exitLabel:
	
	
	li $v0, 10
	syscall