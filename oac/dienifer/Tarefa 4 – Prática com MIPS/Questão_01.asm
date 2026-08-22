.data
	StringInicio: 	  .asciiz "\n|-----------------------------------------------------------|\n|---| Coleta de Dados\n|-----------------------------------------------------------|\n"
	
	StringResultados: .asciiz "|-----------------------------------------------------------|\n|---| Resultados\n|-----------------------------------------------------------|\n"
	
	StringValores: 	  .asciiz "|-----------------------------------------------------------|\n| Informe os valores:"
	
	StringLinha: 	  .asciiz "\n|-----------------------------------------------------------|\n"
	
	StringDigite: 	  .asciiz "| Informe a quantidade de valores a serem armazenados: "
	
	StringSoma: 	  .asciiz "| Soma dos valores pares: "
	
	StringQuantidade: .asciiz "| Quantidade de valores pares: "
	
	StringV: 	  .asciiz "| > "

	StringBarra: 	  .asciiz "\n"

.text
	
	li $v0, 4				# Código para imprimir uma string
	la $a0, StringInicio			# Carregar endereço da String
	syscall					# Executar a syscall
	
	li $v0, 4
	la $a0, StringDigite
	syscall
	
	li $v0, 5				# Codigo para ler inteiro
	syscall					# Executar a syscall
	move $s0, $v0				# Armazenar o valor lido em $s0
		
	li $v0, 4
	la $a0, StringValores
	syscall
	
	li $v0, 4
	la $a0, StringBarra
	syscall
	
	la $s4, 0x10010000			# Endereço inicial da memória para armazenar os valores
	
	jal AdicionarValores			# Chamar a subrotina AdicionarValores
	
	li $v0, 4
	la $a0, StringResultados
	syscall
	
	la $s4, 0x10010000			# Endereço inicial da memória para somar os valores
	
	li $s2, 0				# Inicializar soma dos pares ($s2) com 0
	li $s3, 0				# Inicializar contador de pares ($s3) com 0
	
	jal SomarValores			# Chamar a subrotina SomarValores
	
	li $v0, 4
	la $a0, StringSoma
	syscall
	
	li $v0, 1				# Código para imprimir um inteiro
	move $a0, $s2				# Carregar soma dos pares ($s2) em $a0
	syscall					# Executar a syscall
	
	li $v0, 4
	la $a0, StringLinha
	syscall
	
	li $v0, 4
	la $a0, StringQuantidade
	syscall
	
	li $v0, 1				# Código para imprimir um inteiro
	move $a0, $s3				# Carregar quantidade de pares ($s3) em $a0
	syscall					# Executar a syscall
	
	li $v0, 4
	la $a0, StringLinha
	syscall
	
	li $v0, 10				# Código para encerrar o programa
	syscall					# Executar a syscall
	
# ------------------------------------------------------------------------------------------------------------------------------ #
	
# Sub-rotina para a leitura e armazenamento dos valores

AdicionarValores:
	
	li $t1, 0				# Inicializar contador ($t1) com 0
	
	LoopAdicionar:

		beq $t1, $s0, FimCarregarValores		# Se contador ($t1) == N ($s0), terminar o loop
	
		li $v0, 4
		la $a0, StringV
		syscall
	
		li $v0, 5					# Código para ler um inteiro
		syscall						# Executar a syscall
		move $t0, $v0					# Armazenar o valor lido em ($t0)
	
		sw $t0, 0($s4)					# Armazenar valor ($t0) no endereço referenciado por $s4
 
		addi $s4, $s4, 4				# Avançar referencia ($s4) para a próxima posição de memória
		
		addi $t1, $t1, 1 				# Incrementar contador ($t1)
	
		j LoopAdicionar
	
	FimCarregarValores:
	
		jr $ra						# Retornar ao chamador
		
	
# ------------------------------------------------------------------------------------------------------------------------------ #

# Sub-rotina para encontrar e somar os pares

SomarValores:

	li $t1, 0						# Inicializar contador ($t1) com 0
	li $t2, 2						# Inicializar divisor ($t2) com 2
	
	LoopSomar:

		beq $t1, $s0, FimSomar				# Se contador ($t1) == N ($s0), terminar o loop
	
		lw $t0, 0($s4)					# Carregar valor da memória (endereço em $s4) para $t0
		
		div $t0, $t2					# Dividir valor ($t0) por 2 ($t2)
		mfhi $t3					# Resto da divisão em $t3
		
		beq $t3, 0, Pares				# Se resto ($t3) == 0, o valor é par
  
  		j Proximo
		
	Pares:
	
		add $s2, $s2, $t0				# Adicionar valor par ($t0) à soma ($s2)
	
		addi $s3, $s3, 1				# Incrementar contador de pares ($s3)
	
	Proximo:
	
		addi $s4, $s4, 4				# Avançar referencia ($s4) para a próxima posição de memória
		
		addi $t1, $t1, 1				# Incrementar contador ($t1)
		
		j LoopSomar
	
	FimSomar:
	
		jr $ra						# Retornar ao chamador
	
	
	
	


	