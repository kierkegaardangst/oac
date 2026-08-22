# 3. Escreva um programa que leia um vetor de 10 posições (.word) da memória
# (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
# Use o registrador $t0 como flag.
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário.


.data 

	Vetor: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
.text 
	
	la $s0, Vetor			# Carrega o endereço do vetor
	
	li $t1, 0			# Contador de elementos lidos
	
Leitura:

	beq $t1, 10, Verificar		# Se leu 10 elementos, vai para a verificação
	
	li $v0, 5			# Syscall para ler um número inteiro
	syscall
	sw $v0, 0($s0) 			# Armazena o valor lido no vetor
	
	addi $s0, $s0, 4		# Avança para a próxima posição do vetor (4 bytes)
	
	addi $t1, $t1, 1		# Incrementa o contador
	
	j Leitura
	
Verificar:

	la $s0, Vetor			# Resetamos o ponteiro para o início do vetor
	
	li $t1, 0			# Contador de índice
	
	li $t0, 1			# Assume que o vetor está ordenado
	
Checagem:

	beq $t1, 9, Fim			# Verifica até o penúltimo elemento (índice 9)
	
	lw $t2, 0($s0)			# Carrega o elemento atual
	
	lw $t3, 4($s0)			# Carrega o próximo elemento

	
	bgt $t2, $t3, Desordenado	# Se o atual for maior que o próximo, não está ordenado
	
	addi $s0, $s0, 4		# Avança para a próxima posição (4 bytes)
	
	addi $t1, $t1, 1		# Incrementa o contador
	
	j Checagem
	
Desordenado:

	li $t0, 0			# Marca como desordenado
	
Fim: 
	
	li $v0, 10			# Syscall para terminar o programa
	syscall
	
	
	
	
	
	