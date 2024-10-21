#include <stdio.h>

int pedir_enteros (char var) {
    int x;
    printf("Ingrese un valor para %c = ", var);
    scanf("%d", &x);
    return x;    
}

int iteracion (int i) {
    while(i != 0) {
        printf("i = %d\n", i);
        i=0;
    }
}

int main (void) {
    int i = pedir_enteros('i');
    iteracion(i);
    return 0;
}