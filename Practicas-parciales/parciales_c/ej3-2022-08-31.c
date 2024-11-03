#include <stdio.h>

#define N 5

struct paridad_t {
    int n_pares;
    int n_impares;
    int n_ceros;
};

void pedir_arreglo (int tam, int a[]) {
    int i = 0;
        while (i < tam) {
            printf("Ingrese un valor para el indice a[%d] = ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

struct paridad_t contar_pares_impares(int a[], int tam){ 
    struct paridad_t paridad;
    int i = 0;
    paridad.n_ceros   = 0;
    paridad.n_pares   = 0;
    paridad.n_impares = 0;
    
    while (i < tam) {
        if (a[i] == 0)
        {
            paridad.n_ceros = paridad.n_ceros + 1;
        }
        else if (a[i]%2 == 1)
        {
            paridad.n_impares = paridad.n_impares + 1;
        }
        else if (a[i]%2 == 0)
        {
            paridad.n_pares = paridad.n_pares + 1;
        }
        i++;
    }
    return paridad;
}

void imprimir_resultados(struct paridad_t paridad) {
    printf("Cantidad de pares: %d\n", paridad.n_pares);
    printf("Cantidad de impares: %d\n", paridad.n_impares);
    printf("Cantidad de ceros: %d\n", paridad.n_ceros);
}

int main(void) {
    int a[N];
    struct paridad_t paridad;
    pedir_arreglo(N, a);
    paridad = contar_pares_impares(a, N);
    imprimir_resultados(paridad);
    return 0;
}