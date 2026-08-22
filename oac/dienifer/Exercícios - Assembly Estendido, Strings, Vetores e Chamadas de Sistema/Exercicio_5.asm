# 5. Declare três vetores do mesmo tamanho:

#	.data
#	tamanho: .word 7
#	vetor1: .word -30, -23, 56, -43, 72, -18, 71
#	vetor2: .word 45, 23, 21, -23, -82, 0, 69
#	soma: .word 0, 0, 0, 0, 0, 0, 0

# Inicialize um ponteiro para cada vetor (pseudo-instrução la) 
# e faça a soma dos elementos dos vetores 2 a 2.
# O vetor resultante deve ser armazenado depois dos elementos do segundo vetor.

# Exemplo: soma[i] = vetor1[i]+vetor2[i]

.data

	tamanho: 	.word 7
	vetor1: 	.word -30, -23, 56, -43, 72, -18, 71
	vetor2: 	.word 45, 23, 21, -23, -82, 0, 69
	soma: 		.word 0, 0, 0, 0, 0, 0, 0
	
.text

	lw $t0, tamanho		# Carrega o tamanho do vetor
	
	la $t1, vetor1		# Ponteiro para vetor1
	la $t2, vetor2		# Ponteiro para vetor2
	la $t3, soma		# Ponteiro para soma
	
	li $t7, 0		# Contador i = 0
	
Loop:

	beq $t7, $t0, Fim	# Se i == tamanho, sai do loop
	
	lw $t4, 0($t1)		# Carrega vetor1[i]
	
	lw $t5, 0($t2)		# Carrega vetor2[i]
	
	add $t6, $t4, $t5	# soma[i] = vetor1[i] + vetor2[i]
	
	sw $t6, 0($t3)		# Armazena soma[i]
	
	addi $t1, $t1, 4	# Avança para próximo elemento de vetor1
	
	addi $t2, $t2, 4	# Avança para próximo elemento de vetor2
	
	addi $t3, $t3, 4	# Avança para próximo elemento de soma
	
	addi $t7, $t7, 1	# i++
	
	j Loop
	
Fim: