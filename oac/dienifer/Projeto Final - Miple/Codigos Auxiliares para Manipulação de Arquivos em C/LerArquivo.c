#include <stdio.h>
#include <stdlib.h>

int main() {
    
    FILE *file;
    int value;

    // Abrir o arquivo binário para leitura
    file = fopen("C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Organizando\\NIVEL.bin", "rb");

    if (file == NULL) {

        perror("Erro ao abrir o arquivo");

        return 1;

    }

    // Ler o valor inteiro do arquivo
    if (fread(&value, sizeof(int), 1, file) != 1) {

        perror("Erro ao ler o arquivo");

        fclose(file);

        return 1;

    }

    // Fechar o arquivo
    fclose(file);

    // Imprimir o valor lido
    printf("Valor lido do arquivo: %d\n", value);

    return 0;

}