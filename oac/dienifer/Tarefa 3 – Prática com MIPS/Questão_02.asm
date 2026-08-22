# Questão 2: 

# Ler um valor inteiro, armazenar este valor no registrador ($t0) e escrever a tabuada do valor lido.
# Use chamadas de sistema para entrada e saída de dados.

.data

	Mensagem_Inicio: 	.asciiz "-- Calcular Tabuada - Valor: "
	Mensagem_Tabuada: 	.asciiz "\n- Tabuada do "
	Mensagem_n: 		.asciiz "\n"	
	Mensagem_x: 		.asciiz " x "
	Mensagem_Igual: 	.asciiz " = "
	Mensagem_t: 		.asciiz "  "

.text

	ori $t1, $zero, 0 		# Inicializa $t1 com 0

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_Inicio		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	li $v0, 5			# Código para ler um número inteiro
	syscall				# Lê a entrada do usuário
	move $t0, $v0			# Armazena o número lido em $t0

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_Tabuada	# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	li $v0, 1			# Código para imprimir um número inteiro
	move $a0, $t0			# Carrega $s1 em $a0
	syscall				# Invoca o sistema operacional

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_n		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_n		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

Loop:
	
	beq $t1, 11, Fim 		# Se $t1 == 11, termina o loop

	mult $t0, $t1			# Multiplica $t0 por $t1
	mflo $t2			# Armazena o resultado da multiplicação em $t2

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_t		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	li $v0, 1			# Código para imprimir um número inteiro
	move $a0, $t0			# Carrega $t0 em $a0
	syscall				# Invoca o sistema operacional

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_x		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	li $v0, 1			# Código para imprimir um número inteiro
	move $a0, $t1			# Carrega $t1 em $a0
	syscall				# Invoca o sistema operacional

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_Igual		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	li $v0, 1			# Código para imprimir um número inteiro
	move $a0, $t2			# Carrega $t2 em $a0
	syscall				# Invoca o sistema operacional

	li $v0, 4			# Código para imprimir string
	la $a0, Mensagem_n		# Carrega o endereço da string
	syscall				# Invoca o sistema operacional

	addi $t1, $t1, 1		# Incrementa o contador

	j Loop				# Volta para o início do loop

Fim:

    	li $v0, 10		# Código para sair
    	syscall			# Invoca o sistema operacional
