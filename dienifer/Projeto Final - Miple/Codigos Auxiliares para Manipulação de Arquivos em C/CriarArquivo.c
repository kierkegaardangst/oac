#include <stdio.h>

int main() {
    
    const char *caminho_arquivo = "C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Organizando\\NIVEL.bin";

    int valor_inicial = 365; // Valor inicial (0) a ser escrito no arquivo

    // Abrir o arquivo para escrita em modo binário
    FILE *arquivo = fopen(caminho_arquivo, "wb");

    if (arquivo == NULL) {

        printf("Erro ao abrir o arquivo.\n");

        return 1; // Encerra o programa com código de erro

    }

    // Escrever o valor inicial no arquivo
    size_t bytes_escritos = fwrite(&valor_inicial, sizeof(int), 1, arquivo);

    if (bytes_escritos != 1) {

        printf("Erro ao escrever no arquivo.\n");

        fclose(arquivo);

        return 1; // Encerra o programa com código de erro

    }

    // Fechar o arquivo
    fclose(arquivo);

    printf("Arquivo criado e inicializado com sucesso!\n");
    return 0; // Encerra o programa com sucesso

}