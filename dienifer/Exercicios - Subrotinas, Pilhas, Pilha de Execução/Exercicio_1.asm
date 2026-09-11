.text

	li $v0, 5
	syscall
	move $a0, $v0
	
	jal Fatorial
	
	move $t1, $v0
	
	li $v0, 10
	syscall
	
Fatorial:

	beq $a0, $zero, Base
	
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	addi $a0, $a0, -1
	jal Fatorial
	
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	
	mul $v0, $a0, $v0
	
	jr $ra
	
Base:

	li $v0, 1
	jr $ra
	
	
	
	
	
	