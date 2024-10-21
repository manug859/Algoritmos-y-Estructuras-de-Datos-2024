#include <stdio.h>

int pedir_entero(char name) {
    int x; 
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

int valor_abs (int x) {
    if (x >= 0) {
        return x;
    }
    else {
        return -(x);
    }
}

int main(void) {
    int x = pedir_entero('x');
    
    int res = valor_abs(x);

    printf("El valor absoluto de x = %d", res);
    return 0;
}