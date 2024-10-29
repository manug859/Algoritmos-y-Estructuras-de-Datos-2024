/*
Const N : Int, A : array[0, N) of Int;
Var res, pos : Int;
{P : N ≥ 0}
res, pos := 0,0
	do → pos < N
		if A.pos mod 2 = 0 → res, pos := res + A.pos, pos+1
		[] A.pos mod 2 ≠ 0 → res, pos := res, pos+1
		fi
    od
{Q : res = ⟨ Σ i : 0 ≤ i < N ∧ A.i mod 2 = 0 : A.i ⟩ }
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

int sum_pares (int tam, int a[]) {
    int pos = 0;
    int res = 0;
    while (pos < tam) {
        if (a[pos] % 2 == 0) {
            res = res + a[pos];
            pos = pos + 1;
        } else {
            pos = pos + 1;
        }
    }
    return res;
}

int main(void) {
    int a[N];
    pedir_arreglo(N, a);
    int res = sum_pares(N, a);
    
    printf("La suma de los elementos pares del arreglo es: %d", res);

    return 0;
}