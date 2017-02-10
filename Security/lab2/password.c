/*
 * Ex4: simple program to verify the password
 */

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

int main(int argc, char* argv[]) {
        int counter = 0; // count attempts
        char attempt[256]; // buffer for password
        while (counter < 3) {
                printf("Input password:\n");
                // using fgets because it reads only sizeof(attempt) chars
                // this means that we'll avoid buffer overflow
                fgets(attempt, sizeof(attempt), stdin);

                // regex for alphanumeric string: '^[a-zA-Z0-9]+\n'
                regex_t expr;
                regcomp(&expr, "^[a-zA-Z0-9]+\n", REG_EXTENDED); // compile the regex
                regmatch_t matches[20];
                if (regexec(&expr, attempt, 1, matches, 0) != 0) {
                        //If the input isn't alphanumeric, we overwrite it with
                        //a safe alphanumeric one.
                        //If we just return here, this may take noticeably less
                        //time than going through a whole check.
                        strncpy(attempt, "notacorrectpassword", 256);
                }

                if (strcmp(attempt, "admin123\n") == 0) {
                        printf("Welcome\n");
                        return 0;
                }
                counter++;
        }
        printf("Max. number of attempts exceeded.\n");
        return 0;
}

