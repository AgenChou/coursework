#include <stdio.h>

void swap(int *a, int *b) {
	int c = *a; // record the value stored at a in a temp var
	*a = *b; // the value that a points to is now the value b points to
	*b = c; // the value b points to is now the one stored in c 
}

int main(int argc, char *argv[]) {
	int val_a = 50;
	int val_b = 20;

	// Since the two variables above are integers, and our swap function's
	// parameters need to be pointers, we need to create two pointers 
	int *point_a = &val_a;
	int *point_b = &val_b;
	swap(point_a, point_b);
	printf("val_a is %d (should be 20)\n", val_a);
	printf("val_b is %d (should be 50)\n", val_b);
	return 0;
}
