#include <stdio.h>
#include <string.h>

// Ex 4c: check if a string contains numbers
void findNumbers(const char* str) {
	char *c;
	// Standard library function strpbrk(char* str1, char* str2) looks in 
	// str1 for any of the characters from str2, and returns the first char
	// in str2 that it finds.
	// Therefore, we can compare our input string to a string consisting of
	// all digits - i.e. "0123456789", and if the return character isn't
	// null (or rather, is non-zero), then this means that our input string
	// contains a numeric character.
	c = strpbrk(str, "0123456789");
	if (c) {
		printf("String contains numbers\n");
	} else {
		printf("String without numbers\n");
	}
}

int main(int argc, char* argv[]) {
	printf("hello123: ");
	findNumbers("hello123");
	printf("hello: ");
	findNumbers("hello");
	return 0;
}
