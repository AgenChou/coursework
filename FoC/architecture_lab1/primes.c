#include <stdio.h>

int main() {
        int sum = 2;
        int i = 3;
        int bound = 400;
        while (i < bound) {
                int flag = 0;
                int j;
                for (j = 3; j < i; j += 2) {
                        if (i % j == 0) {
                                flag = !flag;
                        }
                }
                if (!flag) {
                        sum += i;
                }
                i += 2;
        }
        printf("the sum of all primes up to %d is %d.\n", bound, sum);
}
