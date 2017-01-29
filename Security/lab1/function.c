#include <stdio.h>

// Ex. 1a: function to evaluate x^2/3-5x+18
double fn(int x) {
	// The function contains simple operations (after expanding x^2 to x*x)
	// so there's no need for the math library.
	double result = (double) (x * x) / 3 - 5 * x + 18;
	return result;
}

int main(int argc, char *argv[]) {
	printf("Input  Output\n");

	int i;
	for (i = 0; i <= 12; i++) {
		printf("%d\t%.4f\n", i, fn(i));
	}
}
