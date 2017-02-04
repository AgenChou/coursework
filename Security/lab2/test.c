#include <stdio.h>

void function(int a, int b, int c) {
	char buffer1[5];
	char buffer2[10];

	int *ret;
	ret = buffer1 + 12;
	(*ret) += 7;
}

int main(int argc, char *argv[]) {
	int a;
	a = 0;
	function(1,2,3);
	a = 1;
	printf("a has value %d\n", a);
	return 0;
}
