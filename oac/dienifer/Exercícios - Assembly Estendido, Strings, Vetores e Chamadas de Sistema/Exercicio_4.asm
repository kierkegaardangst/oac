# 4. Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5 posições. 
# Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
# A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória,
# ou seja, iniciando no endereço de memória 0x10010000.

.data

	Vetor: .word 1, 2, 3, 4, 5
	
.text

	la $t0, Vetor		# Carrega o endereço base do vetor em $t0
	la $s0, Vetor		# Carrega o endereço base do vetor em $s0
	
	li $t1, 0 		# Índice do loop
	
	addi $s0, $s0, 16	# $s0 agora aponta para o último elemento
		
Loop:

	beq $t1, 2, Fim		# Quando t1 atingir 2 (número de trocas feitas), termina
	
	lw $t2, 0($t0)		# Carrega o valor no índice $t1 (primeiro elemento)
	
	lw $t3, 0($s0)		# Carrega o valor no último índice (índice 4)
	
	sw $t3, 0($t0)		# Armazena o valor do último índice na posição atual de $t0
	
	sw $t2, 0($s0)		# Armazena o valor do primeiro índice na posição de $s0 (último)
	
	addi $t0, $t0, 4	# Avança $t0 para o próximo índice
	
	addi $s0, $s0, -4	# Retrocede $s0 para o índice anterior
	
	addi $t1, $t1, 1	# Incrementa o contador de trocas
	
	j Loop
	
Fim: