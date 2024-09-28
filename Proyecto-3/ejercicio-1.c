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
    printf("x + y + 1 = %d\n", x+y+1);

    printf("z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);

    b = y - 2 == (x * 3 + 1) % 5;

    printf("b = %d\n", b);

    printf("y / 2 * x = %d\n", y / 2 * x);
    
    w = y < x * z;

    printf("w = %d\n", w);
    return 0;
}

int main (void) {
    int x = pedir_enteros('x');
    int y = pedir_enteros('y');
    int z = pedir_enteros('z');

    int res = operaciones(x, y, z);
    printf(res);

return 0;
}
