    .data
msg1: .asciiz"Insira um numero: "
erro: .asciiz"\nERRROOOOUUUUU \nTente novamente: "
certo: .asciiz"\nACERTOOOU ! ! ! :)\n"
msg3: .asciiz ", BEMM MAIOR..."
msg4: .asciiz ", BEMM MENOR..."
msg5: .asciiz "\n" 
    .text

    .globl main

main:
	li $v0,4		
	la $a0,msg1
	syscall
	SENHA=842		
		
WHILE_LOOP:
        li $t1, 0 		
        li $v0, 5      
        syscall        
        move $t1, $v0	

        beq $t1, SENHA, END_WHILE 
        bgt $t1, SENHA, MAIOR

        li $v0, 4      
        la $a0, msg5    
        syscall

        li $v0, 1      
        move $a0, $t1  
        syscall       

        li $v0, 4       
        la $a0, msg4   
        syscall        

        li $v0, 4      
        la $a0, msg5  
        syscall

        li $v0,4
        la $a0,erro
        syscall
        j WHILE_LOOP

MAIOR:
        li $v0, 4       
        la $a0, msg5    
        syscall

        li $v0, 1       
        move $a0, $t1  
        syscall        

        li $v0, 4      
        la $a0, msg3    
        syscall         

        li $v0, 4      
        la $a0, msg5  
        syscall

        li $v0,4
        la $a0,erro
        syscall
        j WHILE_LOOP

	
END_WHILE:
        li $v0,4	
        la $a0,certo
        syscall	