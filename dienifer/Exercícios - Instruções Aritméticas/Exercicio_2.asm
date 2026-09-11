# 2. Escreva 0xAAAAAAAA em $t1. 
# Faça um shift de um bit para a direita desse valor e coloque o resultado em $t2, deixando $t1 inalterado.
# Em $t3, $t4 e $t5 coloque os resultados das operações or, and e xor entre $t1 e $t2, respectivamente.
# Em comentários no final do código, explique os resultados obtidos, mostrando os valores binários.

ori $t1, $zero, 0xAAAA
sll $t1, $t1, 16
ori $t1, $t1, 0xAAAA

srl $t2, $t1, 4

or $t3, $t1, $t2 # $t3 = $t1 or $t2

# "1" se pelo menos um dos valores for "1"

# $t1 -> 0xaaaaaaaa
# $t2 -> 0x0aaaaaaa
#        ----------
# $t3 -> 0xaaaaaaaa

and $t4, $t1, $t2 # $t3 = $t1 and $t2

# "0" se pelo menos um dos valores for "0"

# $t1 -> 0xaaaaaaaa
# $t2 -> 0x0aaaaaaa
#        ----------
# $t3 -> 0x0aaaaaaa

xor $t5, $t1, $t2 # $t3 = $t1 xor $t2

# "0" se forem iguais, "1" se forem diferentes

# $t1 -> 0xaaaaaaaa
# $t2 -> 0x0aaaaaaa
#        ----------
# $t3 -> 0xa0000000