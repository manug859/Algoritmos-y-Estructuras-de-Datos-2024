#include <stdio.h>

int pedir_entero(char name) {
    int x; 
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

int minimo (int x, int y) {
    if (x >= y) {
        return y;
    }
    else {
        return x;
    }
}

int main(void) {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    
    int min = minimo(x, y);
    printf("El minimo entre x e y = %d", min);
    return 0;
}