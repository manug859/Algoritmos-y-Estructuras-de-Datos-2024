#include <stdio.h>
#include <assert.h>

int pedir_entero (char name) {
    int x;
    printf("Introduce el valor de %c: ", name);
    scanf("%d", &x);
    return x;
}

void mul_asig(int x, int y, int z) {
    int X = x;
    int Y = y;
    int Z = z;
    
    assert(x == X && y == Y && z == Z);  // Precondición
    
    int temp_x = x;
    int temp_y = y;
    x = y;
    y = temp_y + temp_x + z;
    z = temp_y + temp_x;
    
    assert(x == Y && y == Y + X + Z && z == Y + X);  // Postcondición
}


int main() {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    int z = pedir_entero('z');

    mul_asig(x, y, z);
    return 0;
}