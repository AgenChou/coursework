#include <stdio.h>
#include <float.h>
#include <math.h>

// function to print sin(x)/x (for x in radians)
double fn(int x) {
	double result;

	if (x == 0) {
		// when x = 0, sin(x)/x is -infinity
		// we need to deal with this case separately
		result = -DBL_MIN;
	} else {
		result = sin((double) x) / x;
	}
	return result;
}

int main(int argc, int *argv[]) {
	int i;
	for (i = -10; i <= 10; i++) {
		printf("%d        %.4f\n", i, fn(i));
	}
}
