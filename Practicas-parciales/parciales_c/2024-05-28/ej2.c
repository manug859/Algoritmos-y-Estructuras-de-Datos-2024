#include <stdio.h>
#include <stdbool.h>

#define N 5

void llenar_con_temperaturas (int tam, float a[]) {
    int i = 0;
        while (i < tam) {
            printf("Ingrese una temperatura para el indice a[%d]: ", i);
            scanf("%f", &a[i]);
            i++;
        }
}

bool hay_mas_de_tres_altas(float a[], int tam) {
    int i = 0;
    int cuantas_temp = 0;

    while (i < tam) {
        if (a[i] >= 30.0 && a[i] <= 45.0) {
            cuantas_temp = cuantas_temp + 1;
        }
        i++;
    }
    if (cuantas_temp >= 3) {
        return true;
    }
    else {
        return false;
    }
}

int main(void) {
    float a[N];

    llenar_con_temperaturas(N, a);

    bool res = hay_mas_de_tres_altas(a, N);

    if(res) {
        printf("Hay más de tres temperaturas altas.");
    }
    else {
        printf("No hay más de tres temperaturas altas.");
    }
    return 0;
}