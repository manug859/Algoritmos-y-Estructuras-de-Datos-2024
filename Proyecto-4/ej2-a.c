#include <stdio.h>
#include <assert.h>

int pedir_enteros(char name) {
    int x;
    printf("Ingrese el valor de %c: ", name);
    scanf("%d", &x);
    return x;
}

void mul_asig(int x, int y) {
    int X = x;
    int Y = y;

    assert(x == X && y == Y);
    y = x+y;
    x = x+1;
    assert(x == X+1 && y == Y+X);
}

int main(void) {
    int a = pedir_enteros('a');
    int b = pedir_enteros('b');
    mul_asig(a, b);
    return 0;
}