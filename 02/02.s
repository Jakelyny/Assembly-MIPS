    .data
msg1: .asciiz"\n"
    .text

    .globl main

main:
        CONST=11		
        li $t1, 1 		
	
FOR_LOOP:
        beq $t1, CONST, END_FOR  
        li $v0, 1              
        move $a0, $t1   
        syscall         
        li $v0,4			
        la $a0,msg1
        syscall
        addi $t1, $t1, 1 	
        j FOR_LOOP

END_FOR:
