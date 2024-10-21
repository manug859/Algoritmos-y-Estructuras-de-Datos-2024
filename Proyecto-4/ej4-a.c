#include <stdio.h>

int pedir_entero(char name) {
    int x; 
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

int minino (int x, int y) {
    if (x >= y) {
        return y;
    }
    else {
        return x;
    }
}

int main(void) {
    
}