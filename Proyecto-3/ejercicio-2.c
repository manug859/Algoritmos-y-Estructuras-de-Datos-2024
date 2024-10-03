#include <stdio.h>

int pedir_entero (char var) {
    int x;
    printf("Ingrese un valor para %c = ", var);
    scanf("%d",&x);
return x;
}

int operacion (int x, int y) {
    if(x>=y)
    {
        x = 0;
    }
    else
    {
        x = 2;
    }
}