# Questão 2: Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5 posições. 
# Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1. 
# A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória, 
# ou seja, iniciando no endereço de memória 0x10010000.

.data

	Vetor: .word 1, 2, 3, 4, 5
	
.text

	la   $t0, Vetor         # Carrega o endereço base do vetor
        li   $t2, 0             # Índice inicial
        li   $t3, 4             # Índice final
        li   $t4, 2             # Trocas - Metade do tamanho do vetor

LOOP: 

	beq  $t2, $t4, FIM 	# Se $t2 == $t5, então terminou as trocas
	
	sll  $t5, $t2, 2        # Multiplica índice inicial por 4
        add  $t5, $t0, $t5      # Endereço do elemento inicial
        lw   $t1, 0($t5)        # Carrega o primeiro valor no temp
        
	sll  $t6, $t3, 2        # Multiplica índice final por 4
        add  $t6, $t0, $t6      # Endereço do elemento final
        lw   $t7, 0($t6)        # Carrega o último valor
      
        sw   $t7, 0($t5)        # Armazena o último no primeiro
        sw   $t1, 0($t6)        # Armazena o primeiro no último

        addi $t2, $t2, 1        # $t2++
        addi $t3, $t3, -1       # $t3--
	
	j LOOP			# Continua o loop
	
FIM:

	# Fim 