#include <stdio.h>

int pedir_entero (char var) {
    int x;
    printf("Ingrese un valor para %c = ", var);
    scanf("%d", &x);
    return x;
}

int operacion (int x, int y) {
    if(x >= y) {
        x = 0;
    } else {
        x = 2;
    }
    return x;
}

int main (void) {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    int res = operacion(x, y);
    printf("Resultado de operacion: x = %d\n", res); // Imprimir el resultado
    return 0;
}
