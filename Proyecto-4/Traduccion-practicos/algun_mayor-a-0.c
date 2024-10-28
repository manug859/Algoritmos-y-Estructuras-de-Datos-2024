/*
Const N : Int, A : array [0, N) of Int;
Var pos : Int;
    res : Bool;
{P : N ≥ 0}
res, pos := False, 0;
	do pos < N -->
	res, pos := res ∨ A.pos > 0, pos+1
	od
{ Q : res = ⟨ ∃ i : 0 ≤ i < N : A.i > 0 ⟩ }
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

bool algun_mayor_cero (int tam, int a[]) {
    int pos = 0;
    bool res = false;
    while (pos < tam) {
        res = res || a[pos] > 0;
        pos = pos + 1;
    }
    return res;
}

int main(void) {
    int a[N];
    pedir_arreglo(N, a);
    bool res = algun_mayor_cero(N, a);
    
    if (res) {
        printf("Algún elemento del arreglo es mayor a 0");
    } else {
        printf("No hay ningún elemento mayor a 0");
    }

    return 0;
}