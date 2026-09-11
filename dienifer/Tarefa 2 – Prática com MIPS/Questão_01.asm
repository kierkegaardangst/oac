# Questão 1: Escreva um programa que altere uma string para “capitalizar” a última letra de cada palavra.

.data

	string: 	.asciiz 	"eu sou aluno do centro de desenvolvimento tecnologico da ufpel"
    	Antes: 		.asciiz 	"-- Antes da Modificação\n\n"
    	Depois: 	.asciiz 	"\n\n-- Depois da Modificação\n\n"
 
.text

    	la $a0, string   	# Carrega o endereço da string
    	li $t0, 0        	# Índice da string
    	li $t1, 0        	# Indicar se encontrou uma letra

	# Mensagem Inicial
	
	li $v0, 4		# Código para imprimir string
    	la $a0, Antes		# Carrega o endereço da string
    	syscall			# Invoca o sistema operacional

	li $v0, 4		# Código para imprimir string
    	la $a0, string		# Carrega o endereço da string
    	syscall			# Invoca o sistema operacional

LOOP:

   	lbu $t2, 0($a0)   		# Carrega o caractere atual
    
    	beq $t2, $zero, ULTIMA  	# Se for '\0', termina o loop

    	beq $t2, ' ', MARCO 		# Se for um espaço, entra no marco, se não, continua

    	li $t1, 1  			# Indica que esta dentro de uma palavra
    
    	addi $a0, $a0, 1  		# Avança para o próximo caractere
    
    	j LOOP				# Continua o loop

MARCO:

    	beq $t1, $zero, RESETAR		# Resetamos a contagem para uma nova palavra
	
    	addi $a0, $a0, -1   		# Volta para a última letra antes do espaço
    
    	lb $t3, 0($a0)     		# Carrega a última letra
    
   	addi $t3, $t3, -32  		# Converte para maiúscula 
    
    	sb $t3, 0($a0)     		# Salva a nova letra maiúscula na string
    
    	addi $a0, $a0, 1   		# Retorna para a posição original

RESETAR:

    	li $t1, 0         		# Reseta a flag
    
    	addi $a0, $a0, 1  		# Avança para o próximo caractere
    
    	j LOOP            		# Continua o loop

ULTIMA:
    
    	beq $t1, $zero, RESULTADO
    
    	addi $a0, $a0, -1   		# Volta para a última letra
    
    	lb $t3, 0($a0)     		# Carrega a última letra
    
    	addi $t3, $t3, -32  		# Converte para maiúscula
    
    	sb $t3, 0($a0)     		# Salva na string

RESULTADO:
    
    	li $v0, 4		# Código para imprimir string
    	la $a0, Depois		# Carrega o endereço da string
    	syscall			# Invoca o sistema operacional

    	li $v0, 4		# Código para imprimir string
    	la $a0, string		# Carrega o endereço da string
    	syscall			# Invoca o sistema operacional

    	li $v0, 10		# Código para sair
    	syscall			# Invoca o sistema operacional
