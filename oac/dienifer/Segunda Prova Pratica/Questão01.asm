.data

	StringPertence: .asciiz "\n-- Pertence ao intervalo fechado de [3, 4]\n"
	StringNaoPertence: .asciiz "\n-- Erro! Nao pertence ao intervalo fechado de [3, 4]\n"
	StringTriangulo: .asciiz "\n-- Triangulo\n"
	StringQuadrado: .asciiz "\n-- Quadrilatero\n"
	
	StringPerimetro: .asciiz "\n-- Perimetro da Figura: "
	StringMenorLado: .asciiz "\n-- Menor Lado da Figura: "
	StringListar: .asciiz "\n-- Lados da Figura: "
	StringEspaco: .asciiz "  "
	
	StringResultados: .asciiz "\n--- Resultados:\n "
	StringFimPrograma: .asciiz "\n\n--- Programa Finalizado!"
	
	aux: .word 0
	
	Valores: .space 16
	Perimetro: .space 4
	MenorLado: .space 4
	

.text

	# a)
	
	li $v0, 5
	syscall
	move $t0, $v0		# O $t0 foi usado apenas para armazenar o N

	# b)
	
PertenceIntervalo:
							
	bge $t0, 3, MaiorIgual3 

	j NaoPertence
		
	MaiorIgual3:

		ble $t0, 4, MenorIgual4
		
		j NaoPertence
		
	MenorIgual4:

		li $v0, 4
		la $a0, StringPertence
		syscall
		
		j C
	
	NaoPertence:

		li $v0, 4
		la $a0, StringNaoPertence
		syscall

		li $v0, 10
		syscall
	
					
	# c) 
	
C:

	jal Forma
		
		
	# d)
	
LerValores:
	
	li $t2, 0
		
	la $t1, Valores
		
	LoopLerValores:
		
		beq $t2, $t0, FimLerValores
			
		li $v0, 5
		syscall
		move $t5, $v0
			
		sw $t5, 0($t1)
			
		addi $t1, $t1, 4
		addi $t2, $t2, 1
			
		j LoopLerValores

	FimLerValores:

		j E


	# e)
	
E: 
		
	la $s0, Valores
	
	li $t2, 0
	
	LoopSomar:
	
		beq $t2, $t0, FimLoopSomar
	
		lw $s1, 0($s0)
	
		add $s3, $s3, $s1
	
		addi $s0, $s0, 4 
		addi $t2, $t2, 1
	
		j LoopSomar
	
	FimLoopSomar:
	
		sw $s3, Perimetro
		
		j F
		
	#F
	
F:
	
	la $s0, Valores
	
	lw $t1, 0($s0) 
	
	li $t2, 1
	
	addi $s0, $s0, 4
	
	LoopMenor:
	
		beq $t2, $t0, FimLoopMenor
		
		lw $t3, 0($s0) 
		
		blt $t1, $t3, Proximo
		
		move $t1, $t3
		
	Proximo:
		
		addi $s0, $s0, 4
		addi $t2, $t2, 1
		
		j LoopMenor
		
	FimLoopMenor:
		
		sw $t1, MenorLado

		j G
	
	
G:

	li $v0, 4
	la $a0, StringResultados
	syscall
	
	lw $s4, Perimetro
		
	li $v0, 4
	la $a0, StringPerimetro
	syscall
		
	li $v0, 1
	move $a0, $s4
	syscall
		
	lw $s4, MenorLado
	
	li $v0, 4
	la $a0, StringMenorLado
	syscall
		
	li $v0, 1
	move $a0, $s4
	syscall
		
	la $s4, Valores	
		
	li $v0, 4
	la $a0, StringListar
	syscall
	
	li $t2, 0
	
	LoopListar:
	
		beq $t2, $t0, Fim
		
		lw $s6, 0($s4)
				
		li $v0, 1
		move $a0, $s6
		syscall
		
		li $v0, 4
		la $a0, StringEspaco
		syscall
		
		addi $s4, $s4, 4
		addi $t2, $t2, 1
		
		j LoopListar


Fim:

	li $v0, 4
	la $a0, StringFimPrograma
	syscall
	
	li $v0, 10
	syscall
	

# --------------------------------------------------------------- # Forma

# c

Forma:

	beq $t0, 3, Triangulo
		
	li $v0, 4
	la $a0, StringQuadrado
	syscall
		
	Triangulo:

		li $v0, 4
		la $a0, StringTriangulo
		syscall
	
	jr $ra
	
# --------------------------------------------------------------- # 