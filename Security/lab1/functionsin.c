/*
 * NOTE: compile with -lm flag to link the math library and avoid linker error
 * (or use g++, which can compile C and links libraries automatically...)
 */

#include <stdio.h>
#include <float.h>
#include <math.h>

// Ex 1b: function to print sin(x)/x (for x in radians)
double fn(int x) {
	double result;

	if (x == 0) {
		// When x = 0, sin(x)/x has limit of 1.
		// We need to deal with this case separately, because we're
		// converting from an integer value of x=0 to a double.
		// We have to use DBL_MIN, the smallest double value instead.
		result = sin(DBL_MIN)/ DBL_MIN;
	} else {
		result = sin((double) x) / x;
	}
	return result;
}

int main(int argc, char *argv[]) {
	printf("Input\tOutput\n");
	int i;
	for (i = -10; i <= 10; i++) {
		printf("%d\t%.4f\n", i, fn(i));
	}
}
