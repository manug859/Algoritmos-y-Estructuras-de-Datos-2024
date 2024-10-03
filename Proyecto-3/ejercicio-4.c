#include <stdio.h>

int pedir_enteros (char var) {
    int x;
    printf("Ingrese un valor para %c", var);
    scanf("%d", &x);
        if (x < 0) {
            printf("El valor ingresado es negativo, se convertira a positivo\n");
            x = x * -1;
        }
    return x;    
}

int iteracion (int i) {
    while(i != 0) {
        printf("i = %d\n", i);
        i--;
    }
}

int main (void) {
    int i = pedir_enteros('i');
    iteracion(i);
    return 0;
}