#include <stdio.h>
#include <stdbool.h>

void llenar_con_temperaturas (int tam, float a[]) {
    int i = 0;
        while (i < tam) {
            printf("Ingrese un valor para el indice a[%d]: ", i);
            scanf("%f", &a[i]);
            i++;
        }
}

