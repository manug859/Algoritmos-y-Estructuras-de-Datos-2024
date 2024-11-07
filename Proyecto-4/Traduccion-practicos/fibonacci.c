/*
Const N : Int
Var r, r2, n :  Int;
{P : N ≥ 0}
  r, r2, n := 0, 1, 0
	do n ≤ N →
	r, r2, n := r, r + r2, n+1
	od
{ Q : r = fib.N }
*/

#include <stdio.h>

int pedir_entero(void) {
    int x;
    printf("Ingrese un valor para calcular su fibonacci : ");
    scanf("%d", &x);
    return x;
}

int fib(int N) {
    int r = 0;
    int r2 = 1;
    int n = 0;
    
    while (n < N) {
        int temp = r2;   
        r2 = r + r2;     
        r = temp;        
        n++;
    }
    return r;
}


int main(void) {
    int N = pedir_entero();

    int res = fib(N);
    printf("res = %d", res);

    return 0;
}