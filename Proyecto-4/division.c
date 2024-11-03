#include <stdio.h>
#include <assert.h>

#define N 5

struct div_t {
    int cociente;
    int resto;
};


int pedir_entero(char name) {
    int x;
    printf("Ingrese un valor para %c = ", name);
    scanf("%d", &x);
    return x;
}

struct div_t division(int x, int y) {
    struct div_t res;
    
    assert(x >= 0 && y > 0);

    res.cociente = x / y;
    res.resto = x % y;

    return res;
};

void print_res (struct div_t res) {
    printf("El cociente es : %d\n", res.cociente);
    printf("El resto es : %d", res.resto);
}

int main(void) {
    int x = pedir_entero('x');
    int y = pedir_entero('y');
    struct div_t res = division(x, y);
    print_res(res);
    return 0;
}