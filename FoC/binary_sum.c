/* Author: Agata Borkowska
 * UID: 1690550
 * Sum of 2 binary strings
 */
 
 #include <stdio.h>
 
 int main() {
	// the input will be given as strings, but during processing, we'll turn it into arrays of ints
	int a[8]; // first binary string
	int b[8]; // second binary string
	int c = 0; // carry
	int sum[8];
	
	int i, j; // for iterating over input
	char lastChar; // for checking input is null-terminated
	printf("Input the first binary string: ");
	// scanning for 9 characters, to make sure the input is correct
	// first 8 should be 0s or 1s
	for (i = 0; i < 8; i++) {
		if (scanf("%d", &a[i]) == 0 || a[i] != 0 || a[i] != 1) {
			printf("Incorrect input; exiting. \n");
			return 0;
		}
		// last char should be null, otherwise incorrect input
		if (!scanf("%d", lastChar)) {
			printf("Input too long; exiting. \n");
			return 0;
		}
	}
	
	// similarly for 2nd input:
	 printf("Input the second binary string: ");
	// scanning for 9 characters, to make sure the input is correct
	// first 8 should be 0s or 1s
	for (i = 0; i < 8; i++) {
		if (scanf("%d", &b[i]) != 0 || b[i] != 1) {
			printf("Incorrect input; exiting. \n");
			return 0;
		}
		// last char should be null, otherwise incorrect input
		if (!scanf("%d", lastChar)) {
			printf("Input too long; exiting. \n");
			return 0;
		}
	}
	
	// Now we have two arrays of 1s and 0s, so we can perform the addition
	// 
 }