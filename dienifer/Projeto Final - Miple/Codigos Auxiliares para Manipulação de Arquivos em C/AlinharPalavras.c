#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

char* process_line(const char *line) {
    
    int len = strlen(line);

    char *out = malloc(len + 1);

    if (!out) {

        exit(1);

    }

    int j = 0;

    for (int i = 0; i < len; i++) {

        if (line[i] == ' ' || line[i] == '\n' || line[i] == '\r')

            continue;

        if ((unsigned char)line[i] == 0xC3 && (i + 1) < len) {

            unsigned char next = (unsigned char) line[i+1];

            char replacement = '\0';

            if (next == 0xA1 || next == 0xA0 || next == 0xA2 || next == 0xA3 || next == 0xA4)
                replacement = 'A'; // á à â ã ä
            else if (next == 0xA9 || next == 0xA8 || next == 0xAA || next == 0xAB)
                replacement = 'E'; // é è ê ë
            else if (next == 0xAD || next == 0xAC || next == 0xAE || next == 0xAF)
                replacement = 'I'; // í ì î ï
            else if (next == 0xB3 || next == 0xB2 || next == 0xB4 || next == 0xB5 || next == 0xB6)
                replacement = 'O'; // ó ò ô õ ö
            else if (next == 0xBA || next == 0xB9 || next == 0xBB || next == 0xBC)
                replacement = 'U'; // ú ù û ü
            else if (next == 0xA7)
                replacement = 'C'; // ç
            else if (next == 0x81 || next == 0x80 || next == 0x82 || next == 0x83 || next == 0x84)
                replacement = 'A'; // Á, À, Â, Ã, Ä
            else if (next == 0x89 || next == 0x88 || next == 0x8A || next == 0x8B)
                replacement = 'E'; // É, È, Ê, Ë
            else if (next == 0x8D || next == 0x8C || next == 0x8E || next == 0x8F)
                replacement = 'I'; // Í, Ì, Î, Ï
            else if (next == 0x93 || next == 0x92 || next == 0x94 || next == 0x95 || next == 0x96)
                replacement = 'O'; // Ó, Ò, Ô, Õ, Ö
            else if (next == 0x9A || next == 0x99 || next == 0x9B || next == 0x9C)
                replacement = 'U'; // Ú, Ù, Û, Ü
            else if (next == 0x87)
                replacement = 'C'; // Ç

            if (replacement) {

                out[j++] = replacement;

                i++;

                continue;

            }
        }

        out[j++] = toupper((unsigned char) line[i]);

    }

    out[j] = '\0';
    return out;

}

int main(void) {

    FILE *infile = fopen("C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Trabalho\\Antes.txt", "r");
   
    if (!infile) {

        perror("Tenta de novo :(");
        return 1;

    }
    
    FILE *outfile = fopen("C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Trabalho\\Depois.txt", "w");
    
    if (!outfile) {

        perror("Tenta de novo :(");

        fclose(infile);

        return 1;

    }
    
    char buffer[1024];

    while (fgets(buffer, sizeof(buffer), infile)) {

        char *processed = process_line(buffer);

        fprintf(outfile, "%s", processed);

        free(processed);

    }
    
    fclose(infile);
    fclose(outfile);
    
    printf(";)");
    return 0;

}