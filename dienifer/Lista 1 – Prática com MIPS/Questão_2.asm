# Lista 1 - Pratica com MIPS

# Questão 2: 

# Coloque 0x70000000 no registrador $t0 e a seguir:
# a) Use a instrução addu para somar o conteúdo de $t0 a si mesmo.

ori $t0, $zero, 0x7000 		# Coloca no registrador $t0 o valor 0x7000
sll $t0, $t0, 16     	        # Descola 16 bits para a esquerda

addu $t0, $t0, $t0              # Adiciona em $t0 a soma de $t0 com $t0

# b) Escreva o resultado da soma nos comentários e responda a seguinte pergunta: 
# Considerando números representados em complemento de dois, o resultado encontrado está correto? Por quê?

# Resultado: 0x70000000 + 0x70000000 = 0xE0000000

# O valor 0xE0000000 em complemento de dois representa um numero negativo. 
# Se realizarmos complemento de dois em 0xE0000000, obtemos 0x20000000. Seu valor positivo correspondente.

# No contexto de números em complemento de dois, o valor de 0xE0000000está correto como soma, mas representa um número negativo. 
# Ou seja, não esta correto, pois uma soma que deveria resultar em um valor positivo acabou sendo negativo. E isso ocorre devido ao overflow.

# c) Também nos comentários, explique o que acontece se substituirmos a instrução addu por uma instrução add equivalente e por quê 

# ori $t4, $zero, 0x7000 
# sll $t4, $t4, 16       

# add $t4, $t4, $t4

# Um overflow aritmético ocorre durante a operação de soma, fazendo com que o valor armazenado em $t4 permaneça inalterado. 

# A instrução addu não verifica overflow, permitindo que o valor seja somado sem considerar os limites de espaço. 
# Por outro lado, a instrução add realiza essa verificação e gera uma exceção caso o overflow aconteça.

# >"<