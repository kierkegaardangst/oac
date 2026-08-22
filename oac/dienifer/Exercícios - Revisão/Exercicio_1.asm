# 1. Reescreva o seguinte código C em MIPS Assembly:

# int i;
# int vetor[8];

# for(i=0; i<8; i++) {

# 	if(i%2==0)
#		vetor[i] = i * 2;
#	else
#		vetor[i] = vetor[i] + vetor[i-1];

# }

# Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a partir da posição 0x1001000 da memória.

.data

vetor: .word 10, 10, 01

.text

lui $t0, 0x1001

lw $t1, 0x0($t0)
lw $t2, 0x4($t0)
lw $t3, 0x8($t0)
lw $t4, 0xC($t0)

addi $s0, $zero, 0 # i = 0
addi $s1, $zero, 0 # tamanho = 0;


