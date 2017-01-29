#include <stdio.h>

// Ex 2a: output binary representation of the result of XOR of two ints
void print_xor_binary(int a, int b) {
	// Note that performing XOR on integers is possible without converting 
	// them to binary, and just convert the result, however the question 
	// explicitly asks to access each bit of each int.
	
	// Sizeof(int) can be 2 or 4 depending on arch, and is in
	// bytes, therefore we need sizeof(int)*8 for the number of bits
	// E.g. in the case of most machines this gives standard 2^32 int.
	int bit; 
	for (bit = sizeof(int) * 8 - 1; bit >= 0; bit--) {
		// By right shifting and using a mask, we extract the most
		// significant bit out of each of a and b. The variable bit is
		// decreasing, so the result is in a correct order, and we can 
		// print it straight away.
		// note: we're shifting the original int by bit places
		// '& 1' has the effect of checking if the int is even or odd.
		fprintf(stdout, "%d", ((a >> bit) & 1)  ^ ((b >> bit) & 1));
	}
	fprintf(stdout, "\n");
}

int main(int argc, char *argv[]) {
	print_xor_binary(5, 7);
	print_xor_binary(8, 9);
	print_xor_binary(18, 33);
	return 0;
}
