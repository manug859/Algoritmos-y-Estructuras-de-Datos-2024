/*
Const N : Int, A : array[0,N) of Int;
Var res : Bool,
     n, s : Int;
{P : N ≥ 0}
  res, s, n := True, 0, 0
  	do n ≠ N →
		res, s, n := res ∧ ( s + A.n ≥ 0 ), s + A.n, n+1 
	od
{Q : res = ⟨ ∀ i : 0 ≤ i ≤ N : ⟨ Σ j : 0 ≤ j < i : A.j ⟩ ≥ 0 ⟩ }
*/

#include <stdio.h>
#include <stdbool.h>

#define N 4

void pedir_arreglo (int tam, int a[]) {
    int i = 0;
        while(i < tam) {
            printf("Ingrese el valor de a[%d]: ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

int sum_parcial_mayor_cero(int tam, int a[]) {
    bool res = true;
    int s = 0;
    int n = 0;
        while(n < tam) {
            res = res && (s + a[n] >= 0);
            s = s + a[n];
            n++;
        }
    return res;
}

int main(void) {
    int a[N];

    pedir_arreglo(N, a);

    bool res = sum_parcial_mayor_cero(N, a);
    if(res) {
        printf("Todos los segmentos de suma parcial son mayores o iguales a cero\n");
    }
    else {
        printf("Al menos un segmento de suma parcial es menor a cero\n");
    }

    return 0;
}