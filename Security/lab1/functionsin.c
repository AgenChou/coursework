/*
 * NOTE: compile with -lm flag to link the math library and avoid linker error
 * (or use g++, which can compile C and links libraries automatically...)
 */

#include <stdio.h>
#include <float.h>
#include <math.h>

// function to print sin(x)/x (for x in radians)
double fn(int x) {
	double result;

	if (x == 0) {
		// when x = 0, sin(x)/x is -infinity
		// we need to deal with this case separately
		result = sin(DBL_MIN)/ DBL_MIN;
	} else {
		result = sin((double) x) / x;
	}
	return result;
}

int main(int argc, char *argv[]) {
	printf("Input    Output\n");
	int i;
	for (i = -10; i <= 10; i++) {
		printf("%d        %.4f\n", i, fn(i));
	}
}
