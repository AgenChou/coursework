/* Author: Agata Borkowska
 * UID: 1690550
 * Greatest Common Divisor Algorithm
 */
 
 #include <stdio.h> // input-output library
 
 int main() {
	// a and b will be operated on during the execution of the algorithm
	int a;
	int b;
		
	printf("Input the first integer: ");
	// scanning for user's input for a, and checking it's correct
	if (scanf("%d", &a) != 1) {
		printf("Incorrect input; exiting. \n");
		return 1;
	}
	printf("Input the second integer: ");
	// scanning for user's input for b and checking it's correct
	if (scanf("%d", &b) != 1) {
		printf("Incorrect input; exiting. \n");
		return 1;
	}

	// otherwise the input is correct, and we can continue with the program
	// Print the following line before changing the values: 
	printf("The GCD of %d and %d is: \n", a, b);

	// turning a and b into positive integers
	// this doesn't affect the gcd, but ensures that the algorithm terminates
	a = abs(a);
	b = abs(b);
	
	if (a == 0 || b == 0) {
		// we need to deal with this case separately, because taking the difference won't change anything
		a = 0;
	} else {
		// implementation of the algorithm
		while (b != 0) {
			if (a > b) {
				a = a - b;
			} else {
				b = b - a;
			}	
		}
	}
	printf("%d\n",  a);
 }