#include <stdio.h>


int pedir_entero (char var) {
    int x;
    printf("Ingrese un valor para %c", var);
    scanf("%d", &x);
    return x;
}

int operacion (int x, int y) {
    int i = 0;
    while(x >= y) {
        x = x - y;
        i++;
    }
    printf("El resultado de la division es %d\n", i);
    printf("El residuo de la division es %d\n", x);
return 0;
}

int main (void) {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    operacion(x, y);
    return 0;
}