#include <stdio.h>

void swap(int *a, int *b) {
        int c = *a;
        *a = *b;
        *b = c;
}

int main(int argc, char *argv[]) {
        int val_a = 50;
        int val_b = 20;
        int *point_a = &val_a;
        int *point_b = &val_b;
        swap(point_a, point_b);
        printf("the value of a is now %d and the value of b is %d\n", val_a, val_b);
}

