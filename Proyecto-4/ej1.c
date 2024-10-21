#include <stdio.h>

int pedir_entero(char name) {
    int x;
    printf("Introduce el valor de %c: ", name);
    scanf("%d", &x);
    return x;
}

void intercambio(int x, int y) {
    int z = x;
    x = y;
    y = z;

    printf("El valor de x es: %d\n", x);
    printf("El valor de y es: %d\n", y);
}

int main() {
    int x = pedir_entero('x');
    int y = pedir_entero('y');

    intercambio(x, y);

    return 0;
}