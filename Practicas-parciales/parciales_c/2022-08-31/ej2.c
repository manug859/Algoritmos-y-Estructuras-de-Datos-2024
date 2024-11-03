#include <stdio.h>
#include <assert.h>
#include <limits.h>

#define N 5

void pedir_arreglo (int tam, int a[]) {
    int i = 0;
    while(i < tam) {
        printf("Ingrese un valor para el indice a[%d] = ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

int pedir_entero (char name) {
    int x;
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

int multiplo_minimo (int a[], int tam, int k) {
    int i = 0;
    int min_mul = INT_MAX;
    while (i < tam) {
        if((a[i]%k) == 0) {
            if(a[i] < min_mul) {
                min_mul = a[i];
            }
        }
        i++;
    }
    return min_mul;
}

int main(void) {
    int a[N];

    pedir_arreglo(N, a);

    int k = pedir_entero('k');
    assert(k != 0);

    int res = multiplo_minimo (a, N, k);

    printf("res = %d", res);
    return 0;
}