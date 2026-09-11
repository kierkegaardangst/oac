.data

	string: .asciiz "meu professor é muito bom\n"
	
.text

	la $a0, string		# Carrega o endereço da String
	li $t1, 0		# Flag para indicar o inicio
	
	li $v0, 4		# Exibir a palavra
	la $a0, string
	syscall

Loop:	
	
	lbu $t2, 0($a0) 		# Carrega o caractere atual
	
	beq $t2, $zero, Fim		# Se for \0, termina o loop
	
	beq $t2, ' ', Espaço		# Se for espaço, processa
	
	beq $t1, $zero, Primeira	# Se for o inicio de uma palavra
	
	addi $a0, $a0, 1		# Avança para o proximo caractere
	
	j Loop				# Loop
	
Primeira:
	
	li $t1, 1			# Atribiu 1 a $t4
		
	li $t3, 'a'
	li $t4, 'z'
	
	blt $t2, $t3, Continuar		# Se for menor que 'a', não mexe
	bgt $t2, $t4, Continuar		# Se for maior que 'z', não mexe
	
	addi $t2, $t2, -32
	
	sb $t2, 0($a0)
	
Continuar: 

	addi $a0, $a0, 1
	
	j Loop

Espaço:
	
	li $t1, 0
	
	addi $a0, $a0, 1
	
	j Loop
			
Fim:

	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 10
	syscall