/*
Const N : Int;
Var a : array[0, N) of Int, r : Int;
{P : N ≥ 1}
  r, s, n := -INF, a.0, 1 
	do n < N →
	r, s, n := r max (s - a.n), s max a.n, n+1
	od
{Q : r = ⟨ Max p, q : 0 ≤ p < q < N : a.p - a.q ⟩ }
*/

#include <stdio.h>
#include <limits.h>

#define N 4

void pedir_arreglo(int tam, int a[]) {
    int i = 0;
        while(i < tam) {
            printf("Ingrese un valor para el indice a[%d] = ", i);
            scanf("%d", &a[i]);
            i++;
        }
}

int max (int a, int b) {
    if(a >= b) {
        return a;
    }
    else {
        return b;
    }
}

int maxima_dif (int tam, int a[]) {
    int r = INT_MIN;
    int s = a[0];
    int n = 1;

    while (n < tam) {
        r = max(r, (s - a[n]));
        s = max(s, a[n]);
        n++; 
    }
    return r;
}

int main (void) {
    int a[N];

    pedir_arreglo(N, a);

    int r = maxima_dif(N, a);
    if (r == INT_MIN) {
        printf("-INF");
    }
    else {
        printf("r = %d ", r);
    }
    return 0;
}