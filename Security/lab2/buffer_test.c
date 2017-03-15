/*
 * Ex. 3: exploring buffer overflow and format string attacks
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// function from lab 1
int find_char(const char* str, const char *c) {
        int test;
        int i = 0;
        do { 
                test = str[i];
                if (test == (int)c[0]) {
                        return (i);
                }
                i++;
        } while (test);
        return -1;
}

void main (int argc, char** argv) {
        char* str = argv[1];
        char buf[100];
        int x = 22;
       
        // 3a
        // Truncate the string at 100 characters
        int str_len = strlen(argv[1]);
        if (str_len > 100) {
                int i;
                for (i = 100; i < str_len + 1; i++) {
                        //argv[1][i] = NULL;
                }
        }
        
        // 3b
        // check that the input doesn't contain %
        int index = 0;
        while (index != -1) {
                index = find_char(argv[1], "%");
                // before anything can be done with the arguments, we scan for
                // '%' and replace them with a space - arbitrary choice of char
                argv[1][index] = ' '; 
        }
        
        snprintf(buf, sizeof buf, "%s",  argv[1]);
        buf [sizeof buf -1 ] = 0;
        
        printf("Buffer size is: (\%d) \n", strlen(buf));
  
        printf("Input string is: %s \n", buf);

        printf("x = %d/ in hex is equal to %#x\n", x, x); 

        printf("Memory address for x: (%p) \n", &x);
}
