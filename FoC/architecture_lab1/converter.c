#include <stdio.h>

int main() {
        int i;
        double f;
        for (i = 0; i < 110; i += 10) {
            f = i * 9 / 5.0 + 32;
            printf("Celcius: %d, Fahrenheit: %.2f\n", i, f);
        }

}

