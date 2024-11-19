/*
Programa final:
Const N : Int, A : array[0, N) of Int;
Var r : Int;
{ P : N ≥ 0 }
  r, s, t, n := 0, 0, 0, 0
	do n ≠ N →
	r, s, t, n := r max (s + A.n) max (t - A.n), s max (-A.n), s max A.n, n+1
	od
{ Q : r = ⟨ Max i, j : 0 ≤ i < j < N : | A.i - A.j | ⟩ }
*/

#include <stdio.h>

#define N 5

void pedir_arreglo(int tam, int a[]) {
    int i = 0;
        while(i < tam) {
            printf("Ingrese el valor de a[%d]: ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

int max (int x, int y) {
    if(x > y) {
        return x;
    }
    else {
        return y;
    }
}


int mayor_dif (int tam, int a[]) {
    int r = 0, s = 0, t = 0, n = 0;
        while(n < tam) {
            r = max(max(r, s + a[n]), t - a[n]);
            s = max(s, -a[n]);
            t = max(s, a[n]);
            n++;
        }
    return r;
}

int main(void) {
    int a[N];

    pedir_arreglo(N, a);

    int r = mayor_dif(N, a);
    printf("r = %d", r);

    return 0;
}