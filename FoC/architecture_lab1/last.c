#include <stdio.h>

int main() {
        int *ap;
        int av = 5;
        ap = &av;
        printf("av = %d, ap = %d \n", av, *ap);
        av = 10;
        printf("av = %d, ap = %d \n", av, *ap);
        return 0;
}
