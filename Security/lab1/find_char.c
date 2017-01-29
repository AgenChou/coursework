#include <stdio.h>

int find_char(const char* str, const char *c) {
	char test; // the current char of the str, which we compare to c
	int i = 0;
	// Using do-while loop, so the body gets executed at least once.
	// Otherwise we'd assign test = str[0] twice to satisfy the while
	// condition at the initialisation of the loop.
	do {
		test = str[i]; 
		if (test == c[0]) {
			return (i + 1);
		}
		i++;
	} while (test);
	return -1;
}

int main(int argc, char *argv[]) {
	char* str = "This is a string";
	char* q = "g";
	int p = find_char(str, q);
	if (p > 0) {
		printf("Character is at position: %d\n", p);
	} else {
		printf("Character not found.\n");
	}

	return 0;
}
