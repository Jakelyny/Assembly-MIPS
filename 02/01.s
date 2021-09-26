    .data
msg4: .asciiz"\n"
msg1: .asciiz "\nInsira um numero: "
msg2: .asciiz "\nNumero lido: "
msg3: .asciiz "\nSoma: "
    .text

    .globl main

main:
        CONST=10		
        li $t1, 0 		
        
        li $v0, 4       
        la $a0, msg1    
        syscall        

        li $v0, 5      
        syscall       
        move $t0, $v0	
        
        li $v0, 4       
        la $a0, msg2    
        syscall         

        li $v0, 1      
        move $a0, $t0  
        syscall        

        li $v0, 4      
        la $a0, msg4   
        syscall        

FOR_LOOP:
        bgt $t1, $t0, END_FOR  
        li $v0, 1             
        move $a0, $t1   
        syscall         
        li $v0,4			
        la $a0,msg4
        syscall

        add $t3, $t1, $t3
        addi $t1, $t1, 1 	
        j FOR_LOOP

END_FOR:
        li $v0, 4      
        la $a0, msg3   
        syscall        

        li $v0, 1      
        move $a0, $t3  
        syscall        

        li $v0, 10 	
        syscall