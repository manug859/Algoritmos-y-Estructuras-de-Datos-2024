#include <stdio.h>

#define N 5

void pedir_arreglo (int tam, int a[]) {
    int i = 0;
        while (i < tam) {
            printf("Ingrese un valor para el indice a[%d] = ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

void imprimir_arreglo(int tam, int a[]) {
  int i = 0;
  while(i<tam) {
    printf("\nEl valor de la posicion %d es = %d\n", i, a[i]);
    i=i+1;
  }
}

int main(void) {
    int a[N];
    pedir_arreglo(N, a);
    imprimir_arreglo(N, a);
    return 0;
}