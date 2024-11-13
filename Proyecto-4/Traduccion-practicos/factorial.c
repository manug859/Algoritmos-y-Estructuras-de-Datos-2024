/*
Const N : Int;
Var res, n : Int;
{P : N ≥ 0}
res, n := 1, 0
	do n ≠ N --> 
		res, n := res * (n+1), n+1
	od
{Q : res = N!}
*/

#include <stdio.h>

int pedir_entero(char name) {
    int x;
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

int factorial(int x) {
    int res = 1;
    int n = 0;
    while (n != x) {
        res = res * (n + 1);
        n = n + 1;
    }
    return res;
}

int main(void) {
    int x = pedir_entero('x');
    
    int res = factorial(x);

    printf("El factorial de x = %d", res);
    return 0;
}