#include <stdio.h>
#include <stdbool.h>

int pedir_entero (char var) {
    int x;
    printf("Ingrese un valor para %c = ", var);
    scanf("%d", &x);
    return x;
}

void operacion (int x) {
    int i = 0;
    int res = true;
        while(i < x && res) {
            res = res && (x%i != 0);
            i++;
        }
    printf("res = %d", res);
}

int main (void) {
    int x = pedir_entero('x');
    operacion(x);
    return 0;
}