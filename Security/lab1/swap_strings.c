#include <stdio.h>

// Ex 4a: swap the values of two strings
void swap_strings(char* *str1_ptr, char* *str2_ptr) {
	// Since a string in C is a pointer to the first element of the array
	// of chars, we want to swap the addresses... so we need to point to
	// where the addresses are stored, and swap the integers at those
	// locations.
	char* temp_str = *str1_ptr;
	*str1_ptr = *str2_ptr;
	*str2_ptr = temp_str;

}

int main(int argc, char *argv[]){
	char *str1 = "cats";
	char *str2 = "just one dog";
	printf("str 1 is '%s' and str2 is '%s'. We swap them\n", str1, str2);

	char* *str1_ptr = &str1;
	char* *str2_ptr = &str2;
	swap_strings(str1_ptr, str2_ptr);
	printf("the value of str1 is now %s\n", str1);
	printf("the value of str2 is now %s\n", str2);
	return 0;
}
