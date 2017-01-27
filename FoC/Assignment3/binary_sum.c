/* Author: Agata Borkowska
 * UID: 1690550
 * Sum of 2 binary strings
 */
 
 #include <stdio.h>
 #include <stdlib.h>
 
 // this function converts input into an array of ints and checks that they're 1's or 0's
 // the parameter is the input array and the array of ints we'll be working on
 // the function outputs 1 if there's an incorrect input
 int check_input(char *input, int *a) {
	int i;
	// scanning through the 9 characters, to make sure the input is correct
	// first 8 should be 0s or 1s
	for (i = 0; i < 8; i++) {
		// to convert char into int, we're taking the unicode code for the char and subtracting '0' = 48
		// since all the integers have character code values 48, 49, etc.
		a[i] = input[i] - '0';
		if (!(a[i] == 0 || a[i] == 1)) {
			printf("Incorrect input; exiting. \n");
			return 1;
		}
	}
	// last char should be null, otherwise incorrect input
	if (input[8]) {
		printf("Input too long; exiting. \n");
		return 1;
	}
 }
 
// this function adds two binary numbers represented in 2's complement
// it outputs the result into the 3rd parameter
 int sum_binary(int *a, int *b, int *sum) {
	int carry = 0; 
	int j;
	// we're going from the least significant digit downwards:
	for (j = 7; j >= 0; j--) {
		// following the idea from question 1, the digits of the sum are (a XOR b) XOR carry
		sum[j] = (a[j] ^ b[j]) ^ carry;
		// the carry is 1 when at least 2 of the digits are 1
		carry = (a[j] & b[j]) | ((a[j] ^ b[j]) & carry);
	}
 }
 
 // this function converts the sign-magnitude input into 2's complement
 int convert(int *a) {
	int one[8] = {0,0,0,0,0,0,0,1};
	 
	// if the number is positive, it's signed magnitude representation is the same as 2 complement
	if (a[0] == 1) {
		int i;
		// invert the magnitude digits (since first one is 1 already)
		for (i = 1; i < 8; i++) {
			a[i] = 1 - a[i]; // 1 - 0 = 1, 1 - 1 = 0, so this works
		}
		// add 1
		// note: we need a temporary array for doing the summation, otherwise the sum_binary function overwrites things it needs to use
		int temp[8];
		sum_binary(a, one, temp);
		// copy across from the temp array to a
		for (i = 0; i < 8; i++) {
			a[i] = temp[i];
		}
	}
 }
 
 int main() {
	// the input will be given as strings, but during processing, we'll turn it into arrays of ints
	char *input1 = (char *) malloc(sizeof(char) * 9); // 9 characters, because null terminated
	char *input2 = (char *) malloc(sizeof(char) * 9);
	int a[8]; // first binary string
	int b[8]; // second binary string

	int i; // for iterating
		
	int sum[8];
	
	printf("Input the first binary string: ");
	scanf("%9s", input1);
	// check input
	if (check_input(input1, a)) {
		return 1; //exit the program, if the function gave an error
	}
	
	// similarly for 2nd input:
	printf("Input the second binary string: ");
	scanf("%9s", input2);
	if (check_input(input2, b)) {
		return 1;
	}

	// convert the numbers to 2 complement
	convert(a);
	convert(b);

	sum_binary(a, b, sum);
	
	// note: we're ignoring overflow
	
	printf("The sum is: \n");
	for(i = 0; i < 8; i++) {
		printf("%d", sum[i]);
	}
	printf("\n");
	free(input1);
	free(input2);
 }