.data
	prompt:       .asciiz "Digite alguma coisa: "
	String2:      .asciiz ", Muito!"
	
	# Strings de input precisam de espaço reservado na memória RAM.
	String1:      .space 100     # Reserva 100 bytes (letras) para o input do usuário
	Resultado:    .space 200     # Reserva 200 bytes para guardar as duas strings juntas

.text
main:
	# 1. Ler string do prompt - syscall 4
	li $v0, 4
	la $a0, prompt
	syscall

	# 2. Ler a String 1 (Input) - syscall 8
	li $v0, 8           # Syscall 8 é para ler string
	la $a0, String1     # $a0 = endereço da memória onde o texto será salvo
	li $a1, 100         # $a1 = limite máximo de letras que ele pode ler
	syscall
	
	# 3. "Ponteiros" para juntar as strings
	la $t0, String1     # $t0 aponta para a base da string digitada
	la $t1, String2     # $t1 aponta para a base da segunda string
	la $t2, Resultado   # $t2 aponta para onde vamos guardar a resposta final

# 4. Loop para copiar a String1 para o Resultado
loop_string1:
	# Valor em t3 da String 1
	lb $t3, 0($t0)      # Lê 1 byte (letra) da String1 em t0
	beq $t3, 10, loop_string2 # Se for 'Enter', pula para a próxima string
	beq $t3, 0, loop_string2  # Se for o fim da string (Nulo / zero), pula para a próxima string
	
	sb $t3, 0($t2)      # Salva a letra no buffer de Resultado em t2
	addi $t0, $t0, 1    # Avança para a próxima letra da String1
	addi $t2, $t2, 1    # Avança para a próxima posição vazia no Resultado
	j loop_string1      # Repete o ciclo

# 5. Loop para copiar a String2 para logo depois da String1 no Resultado
loop_string2:
	lb $t3, 0($t1)      # Lê 1 byte da String2
	beq $t3, 0, fim     # Se for 0 (fim da String2), pula pro fim
	
	sb $t3, 0($t2)      # Salva a letra no buffer de Resultado
	addi $t1, $t1, 1    # Avança para a próxima letra da String2
	addi $t2, $t2, 1    # Avança para a próxima posição vazia no Resultado
	j loop_string2      # Repete o ciclo

# 6. Finalizar e imprimir
fim:
	sb $zero, 0($t2)    # Coloca um '\0' (zero) no fim do texto do Resultado para o print funcionar

	# Imprimir a string final concatenada
	li $v0, 4           # Syscall 4 para printar string
	la $a0, Resultado 
	syscall

