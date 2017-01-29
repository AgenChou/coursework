#include <stdio.h>

// Ex. 1a: function to evaluate x^2/3-5x+18
double fn(int x) {
	double result = (double) (x * x) / 3 - 5 * x + 18;
	return result;
}

int main(int argc, char *argv[]) {
	printf("Input  Output\n");

	int i;
	for (i = 0; i <= 9; i++) {
		printf("%d       %.4f\n", i, fn(i));
	}
	
	// for formatting purposes, when i has 2 digits, we use one fewer space
	// so the columns are aligned (note: yes, it doesn't scale)
	for (i = 10; i <= 12; i++) {
		printf("%d      %.4f\n", i, fn(i));
	}
}
