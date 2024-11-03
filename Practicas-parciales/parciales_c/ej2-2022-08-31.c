#include <stdio.h>
#include <assert.h>

int pedir_entero (char name) {
    int x;
    printf("Ingrese el valor de %c: ", name);
    scanf("%d", &x);
    return x;
}



int main(void) {
    return 0;
}