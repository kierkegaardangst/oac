# Questão 1: 

# Escrever um algoritmo que leia as 3 notas dos alunos, calcule a média e escreva sua média e situação acadêmica.
# Suponha a seguinte tabela apoiada no regimento da universidade para indicar o situação final do aluno.
# Faça com que o programa fique em laço e pergunte ao usuário quando deseja sair, por exemplo, 
# Digite 0 para continuar ou 1 para sair.
# Use chamadas de sistema para entrada de notas, escrita da média e situação acadêmica, bem como sair do laço e encerrar o programa.

# 	Situação Condição
# 	Reprovado media < 3
#	Exame 3 <= media < 7
# 	Aprovado media >= 7

# Estou assumindo que serão apenas valores inteiros.

.data

	Mensagem_Primeira_Nota: .asciiz	"- Informe a Primeira Nota: "
	Mensagem_Segunda_Nota: 	.asciiz "- Informe a Segunda Nota: "
	Mensagem_Terceira_Nota: .asciiz "- Informe a Terceira Nota: "
	 
	Mensagem_Reprovado:	.asciiz "Reprovado!\n"
	Mensagem_Exame: 	.asciiz "Em Exame!\n"
	Mensagem_Aprovado: 	.asciiz "Aprovado!\n"
	 
	Mensagem_Media: 	.asciiz "\n- Media do Aluno: "
	Mensagem_Situacao: 	.asciiz "\n- Situação do Aluno: "
	 
	Mensagem_Loop: 		.asciiz "\n- Digite: \n\t(0) Continuar\n\t(1) Sair\n- Escolha: "
	Mensagem_Sair: 		.asciiz "\n- Programa Encerrado!"
	Mensagem_Iniciar: 	.asciiz "\n- Programa Iniciado!\n\n"

.text	

Loop:

	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Iniciar		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Primeira_Nota		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
	li $v0, 5				# Código para ler um número inteiro
	syscall					# Lê a entrada do usuário
    	move $t1, $v0  				# Armazena o número lido em $t1
    	
    	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Segunda_Nota		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
	
	li $v0, 5				# Código para ler um número inteiro
	syscall					# Lê a entrada do usuário
    	move $t2, $v0  				# Armazena o número lido em $t2

	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Terceira_Nota		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional

	li $v0, 5				# Código para ler um número inteiro
	syscall					# Lê a entrada do usuário
    	move $t3, $v0  				# Armazena o número lido em $t3
    	
    	ori $t4, $zero, 3			# Carrega o valor 3 em $t4
    	
    	add $s0, $t1, $t2			# Soma a primeira e a segunda nota e armazena em $s0
    	add $s0, $s0, $t3			# Soma a terceira nota em $s0
    	
    	div $s0, $t4				# Divide a soma das notas por 3
    	mflo $s1				# Move o resultado da divisão para $s1
    	
    	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Media			# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
    	li $v0, 1				# Código para imprimir um número inteiro
	move $a0, $s1				# Carrega $s1 em $a0
	syscall					# Invoca o sistema operacional
    	
    	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Situacao		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
    	ori $t5, $zero, 1			# Carrega o valor 1 em $t5
    	
    	slti $s2, $s1, 3 			# Se média < 3, $s2 = 1, senão $s2 = 0
    	
    	beq $s2, $t5, Reprovado			# Se $s2 == $t5, pula para "Reprovado" 
    	
    	slti $s2, $s1, 7 			# Se média < 7, $s2 = 1, senão $s2 = 0
    	
    	beq $s2, $t5, Exame			# Se $s2 == $t5, pula para "Exame"
    	
    	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Aprovado		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
    	j Fim
    	
Reprovado: 
    
    	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Reprovado		# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
    	j Fim					# Pula para o fim
    	
Exame:
    	
   	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Exame			# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
    	j Fim	  				# Pula para o fim
    	
Fim:
    	
    	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Loop			# Carrega o endereço da string
    	syscall					# Invoca o sistema operacional
    	
    	li $v0, 5				# Código para ler um número inteiro
	syscall					# Lê a entrada do usuário
    	move $t6, $v0 				# Armazena a escolha do usuário em $t6
    	
	beq $t6, $zero, Loop 			# Se 0, volta para o início do loop
	
	li $v0, 4				# Código para imprimir string
    	la $a0, Mensagem_Sair			# Carrega o endereço da string
    	syscall    				# Invoca o sistema operacional
    	
    	li $v0, 10				# Código para encerrar o programa
	syscall					# Encerra o programa
	
