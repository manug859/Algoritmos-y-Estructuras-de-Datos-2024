/*
Const N : Int;
Var res, n : Int;
{P : N ≥ 0}
res, n := 0, 0
	do n ≠ N →
	      res, n := res + n, n+1
	od
{ Q : res = ⟨ Σ i : 0 ≤ i < N : i ⟩ }

Suma hasta N pero no inclusive.

*/


#include <stdio.h>

int pedir_entero(char name) {
    int x; 
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

int sum_hasta (int N) {
    int res = 0;
    int n = 0;
        while(n != N) {
            res = res + n;
            n = n+1;
        }
    return res;
}

int main(void) {
    int x = pedir_entero('x');

    int res = sum_hasta(x);

    printf("res = %d", res);
    return 0;
}