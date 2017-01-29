/*
 * NOTE: for ease of use, you may have to compile with -lm flag to link the math
 * library
 * I mean, you don't *have* to, but it is much easier typing long long int in
 * scientific notation rather than with all the 0's.
 */

#include <stdio.h>
#include <math.h>

// Ex 2b: convert a large integer to binary
void to_binary(long long int dec) {
	int bit;
	// We repeat the process from the previous part: bit-shift right and
	// &1 to get 1 or 0
	for (bit = sizeof(long long int) * 8 - 1; bit >= 0; bit--) {
		fprintf(stdout, "%d", (dec >> bit) & 1);
	}
	fprintf(stdout, "\n");
}

int main(int argc, char *argv[]) {

	to_binary(9 * pow(10, 18));
	return 0;
}
