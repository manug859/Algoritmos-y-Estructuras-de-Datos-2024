#include <stdio.h>
#include <assert.h>

int pedir_entero (char name) {
    int x;
    printf("Ingrese el valor de %c: ", name);
    scanf("%d", &x);
    return x;
}

void operacion (int x, int y, int z) {
    int X = x;
    int Y = y;
    int Z = z;

    assert(X == x && Y == y && Z == z); // Precondicion

    int temp_x = x;
    int temp_y = y;

    x = (2*temp_y) + temp_x;
    y = z + temp_x;
    z = temp_y / temp_x;

    assert(x == 2*Y + X && y == Z + X && z == Y / X); // Postcondicion

    printf("x = %d, y = %d, z = %d\n", x, y, z);
}

int main(void) {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    int z = pedir_entero('z');

    operacion(x, y, z);

    return 0;
}