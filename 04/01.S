    .data
vet: .space 5*4		
spc: .asciiz ", "
msg1: .asciiz "\nInsira o numero: " 
msg2: .asciiz "\nSoma: " 
    .text

    .globl main

main: 
        N_VET=5*4 		
        PRINT_INT=1		
        PRINT_STR=4

        li $t0, 0 		
        li $t3, 0

WRITE_LOOP:
        bge $t0, N_VET, END_WRITE 

        li $v0, 4      
        la $a0, msg1    
        syscall        

        li $v0, 5     
        syscall       
        move $t1, $v0	

        add $t3, $t3, $t1
        sw $t1, vet($t0)			
    
        addi $t0, $t0, 4	
        j WRITE_LOOP

END_WRITE:
	    li $t0, 0 			

PRINT_LOOP:
        lw $a0, vet($t0)	
        li $v0, PRINT_INT   
        syscall         	

        li $v0, PRINT_STR	
        la $a0, spc    		 
        syscall         	

        bge $t0, N_VET-4, END_PRINT 	
        addi $t0, $t0, 4		
        addi $t9, $t9, 4	
        j PRINT_LOOP

END_PRINT:

        li $v0, PRINT_STR      
        la $a0, msg2    
        syscall        

        li $v0, 1    
        move $a0, $t3   
        syscall       