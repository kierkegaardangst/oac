# Instrução BLT

blt $rs, $rt, label 	# Desvia se $rs for menor que $rt

# Instrução BGT

bgt $rs, $rt, label  	# Desvia se $rs for maior que $rt

# Imprimir um inteiro

li $v0, 1          # Carrega o código da syscall para imprimir um inteiro
li $a0, 42         # Carrega o valor 42 em $a0 (argumento)
syscall            # Chama a syscall

# Imprimir uma String

li $v0, 4          # Carrega o código da syscall para imprimir uma string
la $a0, mensagem   # Carrega o endereço da string em $a0
syscall            # Chama a syscall

# Ler um Inteiro

li $v0, 5          # Carrega o código da syscall para ler um inteiro
syscall            # Chama a syscall
move $t0, $v0      # Move o valor lido (em $v0) para $t0

# Alocar Memória

li $v0, 9          # Carrega o código da syscall para alocar memória
li $a0, 40         # Carrega 40 em $a0 (aloca 40 bytes)
syscall            # Chama a syscall
move $s0, $v0      # Move o endereço alocado (em $v0) para $s0

# Encerrar o Programa

li $v0, 10         # Carrega o código da syscall para encerrar o programa
syscall            # Chama a syscall