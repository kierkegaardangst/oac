.data
    numero: .word 20        # Cria uma única variável com valor 20 na memória

.text
.globl main

main:
    # 1. 'la' (Load Address): Pega o endereço de memória de 'numero'
    la $s0, numero          # $s0 = endereço onde 'numero' está guardado

    # 2. 'lw' (Load Word): Busca o valor da memória e traz para a CPU
    lw $t0, 0($s0)          # Endereço: $s0 + 0. Agora $t0 = 20

    # 3. 'addi' / 'li': Manipula o valor dentro da CPU (nos registradores)
    li $t1, 5               # $t1 = 5 (apenas uma constante imediata)
    add $t0, $t0, $t1       # $t0 = 20 + 5 = 25

    # 4. 'sw' (Store Word): Devolve o valor de $t0 (25) para a memória
    sw $t0, 0($s0)          # Escreve 25 no endereço $s0 + 0 (substitui o 20 por 25)

    syscall
