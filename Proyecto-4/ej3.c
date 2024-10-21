#include <stdio.h>
#include <stdbool.h>

char pedir_letra() {
    char letra;
    printf("Introduce una letra : "); 
    scanf("%c", &letra);
    return letra;
}

bool es_vocal (char letra) {
    return letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u';
}

int main() {
    char letra = pedir_letra();
    if (es_vocal(letra)) {
        printf("La letra %c es una vocal\n", letra);
    } else {
        printf("La letra %c no es una vocal\n", letra);
    }
    return 0;
}