/*
Const N : Int, A : array [0, N) of Int;
Var pos : Int;
    res : Bool;
{P : N ≥ 0}
res, pos := True, 0;
	do pos < N -->
	res, pos := res ∧ A.pos > 0, pos+1
	od
{ Q : res = ⟨ ∀ i : 0 ≤ i < N : A.i > 0 ⟩ }
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

bool mayores_a_cero (int tam, int a[]) {
    int pos = 0;
    bool res = true;
    while (pos < tam && res) {
        res = res && a[pos] > 0;
        pos = pos + 1;
    }
    return res;
}

int main(void) {
    int a[N];
    pedir_arreglo(N, a);
    bool res = mayores_a_cero(N, a);
    
    if (res) {
        printf("Todos los elementos del arreglo son mayores a 0");
    } else {
        printf("No todos los elementos del arreglo son mayores a 0");
    }

    return 0;
}