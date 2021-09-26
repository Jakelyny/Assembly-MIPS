    .data
vetin: .word 12,14,2,7,5,0,10,19,34,52,26,12,53,78,56,32,33,45,44,18
vet: .space 20*4		
spc:   .asciiz ", "
msg1:   .asciiz "\nInsira um numero: " 
msg2:   .asciiz "\nOPS, O NUMERO JÁ EXISTE! ! !\n" 
    .text

    .globl main

main: 
        N_VET=20*4 		
        PRINT_INT=1		
        PRINT_STR=4

        li $t0, 0 		

WRITE_LOOP:
        bge $t0, N_VET, END_WRITE 
        lw $t1, vetin($t0)
        li $t5, 0

TESTE_LOOP: 
        bge $t5, $t0, END_TESTE
        lw $t8, vet($t5)

        beq $t1, $t8, EXISTE
        addi $t5, $t5, 4	

END_TESTE:
        sw $t1, vet($t0)			
        addi $t0, $t0, 4	
        j WRITE_LOOP


EXISTE:
        li $v0, 4      
        la $a0, msg2    
        syscall

        li $v0, 1    
        move $a0, $t1   
        syscall       

        li $v0, 4       
        la $a0, msg1   
        syscall        

        li $v0, 5      
        syscall         
        move $t1, $v0	

        sw $t1, vetin($t0)
        j TESTE_LOOP

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