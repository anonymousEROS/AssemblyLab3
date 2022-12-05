	.data 
prompt1: .asciiz "please enter a integer: "
prompt2: .asciiz "\nplease enter another integer: "
maxmsg:  .asciiz "\nThe maximum number value of these integer is: \n"
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
	
	bgt $t0, $t1, maxLabel
	bgt $t1, $t0, max1Label
	beq $t0, $t1, equalLabel
	b exitLabel
	
    maxLabel:
    	li $v0,4
    	la $a0, maxmsg
    	syscall 
    	
    	li $v0, 1
	move $a0, $t0
	syscall
	
	b exitLabel
    
    max1Label:
	li $v0,4
    	la $a0, maxmsg
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
	