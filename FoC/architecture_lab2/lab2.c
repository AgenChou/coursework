#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int len( char *my_string) {
  int i = 0;
  int length = 0;
  while ( my_string[i] != '\0') {
    length++;
    i++;
  }
  return length;
}

char *upper_case( char *my_string) {
 int i = 0;
 char* new_string = (char* ) malloc(sizeof(char)*len(my_string)+1);
 while (my_string[i]) {
       new_string[i] = toupper(my_string[i]);
 i++;
 }
 return new_string;
}

char *translate(char* string, const char* from, const char* to) {
  char * result = (char*) malloc(sizeof(char)*len(string)+1);
  int i = 0;
  while (string[i]) {
    if (!strstr(from, *string[i])) {
            result[i] = string[i];
    } else {
            result[i] = to[(int)strstr(from,* string[i])];
    }
    i++;
  }
  return result;
}


int main() {
  char * my_string = "foo ba";
  printf("%d \n", len(my_string));
  char *new_string = (char *) malloc(sizeof(char)*len(my_string)+1);
  new_string = upper_case(my_string);
  
  printf("%s \n", new_string);

  printf("%s \n", translate("hello","hl","kw"));

}

