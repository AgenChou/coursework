#include <stdio.h>

int main() {
        double mark_coursework = 0.60;
        double mark_exam = 0.55;
        double weight_coursework = 0.40;
        double weight_exam = 0.60;
        double mark = mark_coursework*weight_coursework + mark_exam*weight_exam;
        printf("Jim got %.2f in his coursework, and %.2f in his exam. His overall mark is %.2f.\n", mark_coursework, mark_exam, mark);
}
