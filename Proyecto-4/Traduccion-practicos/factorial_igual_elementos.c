/*
Const N : Int, A : array[0, N) of Int;
Var res : Bool, 
n, fac    : Int;
{P: N ≥ 0}
res, n, fac = True, 0, 1;
	do n < N→
		r, pos, fac := res ∧ (A.n = fac), fac * (n+1)
	od
{Q: res = ⟨ ∀ i : 0 ≤ i < N : A.i = i! ⟩}
*/

#include <stdio.h>
#include <stdbool.h>

#define N 5

void pedir_arreglo (int tam, int a[]) {
    int i = 0;
        while (i < tam) {
            printf("Ingrese un valor para el indice a[%d] = ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

bool factorial_igual_elementos (int tam, int a[]) {
    int n = 0;
    int fac = 1;
    bool res = true;
    while (n < tam) {
        res = res && (a[n] == fac);
        fac = fac * (n+1);
        n++;
    }
    return res;
}

int main(void) {
    int a[N];
    pedir_arreglo(N, a);
    bool res = factorial_igual_elementos(N, a);
    
    if (res) {
        printf("Todos los elementos del arreglo son iguales a su factorial");
    } else {
        printf("No todos los elementos del arreglo son iguales a su factorial");
    }

    return 0;
}