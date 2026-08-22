# 1. Escreva um programa que remova os espaços de uma string. 

.data

string: .asciiz "Gosto muito do meu professor de AOC-I."

.text

	la $t0, string
	move $t1, $t0

Loop:
	
	lb $t2, 0($t0)
	
	beqz $t2, done
	
	beq $t2, 0x20, skip
	
	sb $t2, 0($t1)
	
	addi $t1, $t1, 1
	
skip: 

	addi $t0, $t0, 1
	j Loop
	
done:

	sb $zero, 0($t1)
	
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	

