/*
Const N : Int, A : array[0, N) of Int;
Var res, pos;
{P : N ≥ 0}
res, pos := 0, 0
	do pos < N --> 
	res, pos := res + A.n, pos + 1
	od
{Q : ⟨ Σ i : 0 ≤ i < N : A.i ⟩ }
*/

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

int sum_arreglo (int tam, int a[]) {
    int pos = 0;
    int res = 0;
    while (pos < tam) {
        res = res + a[pos];
        pos = pos + 1;
    }
    return res;
}

int main(void) {
    int a[N];
    pedir_arreglo(N, a);
    int res = sum_arreglo(N, a);
    printf("res = %d", res);
    return 0;
}