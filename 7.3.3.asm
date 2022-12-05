	.data
prompt1: .asciiz "Please enter a digit between 1-12: "
results: .asciiz "\nYour number factorial is: "
	.text
.globl main

main:

	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall 
	move $t0, $v0
    
	li $t1, 1
	li $t2, 1
	
    loop:		
    	addi $t2, $t2,1
    	mul $t1, $t1,$t2
    	blt $t2, $t0,loop
    	
    	j res
    	
   
     res:
    	li $v0, 4
    	la $a0, results
    	syscall
    	
    	
    	
    	
    	li $v0, 1
	move $a0, $t1
	syscall
	
	
