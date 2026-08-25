.data

.text
main:
	add $t0, $t1, $t2

	# LOAD LW LOAD WORD / LOAD BYTE carregar dados da memória para o registrador
	# registrador : 1 gaveta de 4 bytes
	# .data conegela os dados na memória para depois serem manipulados com os registradores
	# $5 corresponde ao registrador $a1
	lw $t0, 32($s3)  # Array[8] : 8 * 4 bytes = 32, desolacmento de 32 bits até chegar na posição
	add $s1, $s2, $t0 # buscar na memória conteudo na posicao 8x4bytes = 32 bits
	
	# STORE SW armazenar dados do registrador na memória
	# O offset deslocamento funciona para andar na memória RAM e o registrador guarda os endereços (com os valores)s
	# da memória RAM
	
	# A[12] = h + A[8], h = $s2, endereço base = $s3
	lw $t0, 32($s3) # oitava posicao, oitavo byte: 8 * 4 bytes = 32, ele salta oito posicoes
	add $t0, $t0, $s2
	sw $t0, 48($t0) # armazena o conteudo de t0 no endereço base + deslocamento de 12 x 4 bytes 
	# 12 posicao, 12x4 bytes = 48 bits, ele salta 12 posicoes
	
	# Deslocamento i x 4 bytes 100 elementos
	# g = $s1, h = $s2, $s3 será o endereço base de A[i] e A[i] é salvo em $t1, i = $s4
	add $t1, $s4, $s4 # t1 recebe 2*i
	add $t1, $t1, $t1 # t1 recebe 4 * i
	add $t1, $t1, $s3 # t1 recebe 4i + $s3 (endereço-base)
	lw $t0, 0($t1) # load A[i]: 4i + endereço-base em $t0
	add $s1, $s2, $t0 # g recebe h + A[i] 
	
	
	  
end: