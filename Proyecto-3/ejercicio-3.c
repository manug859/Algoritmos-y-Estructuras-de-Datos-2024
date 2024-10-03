#include <stdio.h>

int pedir_enteros (char var) {
    int x;
    printf("Ingrese un valor para %c", var);
    scanf("%d", &x);
    return x;
}

int logica (int x, int y, int z, int m) {
    if(x<y) {
        m = x;
    }
    else {
        m = y;
    }
    if(m>=z) {
        m = z;
    }
    return m;
}

int main (void) {
    int x = pedir_enteros('x');
    int y = pedir_enteros('y');
    int m = pedir_enteros('m');
    int z = pedir_enteros('z');
    int res = logica(x, y, m, z);
    printf("m = %d", res);
    return 0;
}