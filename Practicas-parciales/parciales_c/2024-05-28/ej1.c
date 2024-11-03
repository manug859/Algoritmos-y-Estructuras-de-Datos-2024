#include <stdio.h>
#include <assert.h>

int pedir_entero (char name) {
    int num;
    printf("Ingrese un numero para %c: ", name);
    scanf("%d", &num);
    return num;
}

void asig_mul(int x, int y, int z) {
    int X = x;
    int Y = y;
    int Z = z;

    int temp_x = x;
    int temp_y = y;

    assert(X == x && Y == y && Z == z && X > 0 && Y > 0 && Z > 0);

    x = y + z;
    y = z * temp_x;
    z = temp_x / temp_y;

    assert(x == Y + Z && y == Z * X && z == X / Y);
    
    printf("x = %d, y = %d, z = %d\n", x, y, z);
}

int main(void) {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    int z = pedir_entero('z');

    asig_mul(x, y, z);

    return 0;
}