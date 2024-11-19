/*
Const N : Int, A : array[0, N) of Int;
Var r, n : Int;
{P : N ≥ 0}
  r, n := 0, 0
	do n ≠ N →
		if A.p mod 2 ≠ 0 ∧ A.n mod 2 ≠ 0 → r := r
		[] A.p mod 2 = 0 ∧ A.n mod 2 = 0 → r := r
 		[] A.p mod 2 ≠ 0 ∧ A.n mod 2 = 0 → r := r+1
        [] A.p mod 2 = 0 ∧ A.n mod 2 ≠ 0 → r := r+1
fi
	od
{Q : r = ⟨ N p, q : 0 ≤ p < q < N : (A.p + A.q) mod 2 ≠ 0 ⟩ }
*/

#include <stdio.h>
#include <stdbool.h>

#define N 5

void pedir_arreglo(int tam, int a[]) {
    int i = 0;
        while(i < tam) {
            printf("Ingrese el valor de a[%d]: ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

int operacion(int tam, int a[]) {
    int r = 0;
    int n = 0;
        while(n < tam) {
            if(a[n] % 2 == 0 && a[n+1] % 2 == 0) {
                r = r;
            }
            else if(a[n] % 2 != 0 && a[n+1] % 2 != 0) {
                r = r;
            }
            else if(a[n] % 2 != 0 && a[n+1] % 2 == 0) {
                r = r + 1;
            }
            else if(a[n] % 2 == 0 && a[n+1] % 2 != 0) {
                r = r + 1;
            }
            n++;
        }
    return r;
}

int main(void) {
    int a[N];

    pedir_arreglo(N, a);

    int r = operacion(N, a);
    printf("r = %d", r);

    return 0;
}