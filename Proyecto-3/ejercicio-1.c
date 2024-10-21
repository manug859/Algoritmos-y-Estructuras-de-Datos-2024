#include <stdio.h>
#include <stdbool.h>

bool w, b;

int pedir_enteros (char var) {
    int x;
    printf("Ingresa un valor para %c = ", var);
    scanf("%d", &x);
    return x;
}

int operaciones (int x, int y, int z) {
    printf("x + y + 1 = %d\n", x + y + 1);

    printf("z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);

    printf("y / 2 * x = %d\n", y / 2 * x);

    // Comparaciones booleanas
    b = (y - 2 == (x * 3 + 1) % 5);
    w = (y < x * z);

    return 0;
}

void imprimir_booleano(bool a) {
    if (a) {
        printf("True\n");
    } else {
        printf("False\n");
    }
}

int main (void) {
    int x = pedir_enteros('x');
    int y = pedir_enteros('y');
    int z = pedir_enteros('z');
    operaciones(x, y, z);
    
    printf("b = ");
    imprimir_booleano(b);
    printf("w = ");
    imprimir_booleano(w);
    
return 0;
}
