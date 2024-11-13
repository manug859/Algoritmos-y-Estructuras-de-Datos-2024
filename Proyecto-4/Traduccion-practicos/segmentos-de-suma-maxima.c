/*
Programa final:
Const N : Int;
Var a : array [0, N) of Int,
r, s, n : Int;
{P : N ≥ 0}
  r, s, n := 0, 0, 0
	do n ≠ N →
r, s, n := r max ( s + a.n ) max 0, (s + a.n) max 0, n+1  
	od
{Q : r = ⟨ Max p, q : 0 ≤ p ≤ q ≤ N : sum.p.q  ⟩ }
    |[sum.p.q = ⟨ Σ i : p ≤ i < q : a.i  ⟩]|
*/

#include <stdio.h>
#include <limits.h>

#define N 5

void pedir_arreglo(int tam, int a[]) {
    int i = 0;
        while(i < tam) {
            printf("Ingrese el valor de a[%d]: ", i);
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

int max_seg_sum(int tam, int a[]) {
    int r = 0;
    int s = 0;
    int n = 0;
        while (n < tam) {
            r = max(0, max(r, (s + a[n])));
            s = max(s + a[n], 0);
            n++;
        }
    return r;
}

int main(void) {
    int a[N];

    pedir_arreglo(N, a);

    int r = max_seg_sum(N, a);
    printf("r = %d", r);

    return 0;
}