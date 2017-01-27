/*
	This program is broken.
	It should read in the numerator and denominator of two fractions and multiple them together.
	You should fix it so that it meets the specification.
*/

import java.util.Scanner; // import statement was missing

public class SectionSeven {

    public static void main(String[] args) { // String[], not String

        Scanner s = new Scanner(System.in);

        int num1, denom1, num2, denom2;

        System.out.println("Enter fraction 1 numerator");
        num1 = s.nextInt();

        System.out.print("Enter fraction 1 denominator");
        denom1 = s.nextInt(); // should be denom1, not num1

        System.out.println("Enter fraction 2 numerator");
        num2 = s.nextInt(); // missing semicolon

        System.out.print("Enter fraction 2 denominator");
        denom2 = s.nextInt(); // should be nextInt(), not nextFloat()

        System.out.println("Result");
        int newNum = num1 * num2;
        int newDenom = denom1 * denom2;

        System.out.println(newNum + "/" + newDenom); // "/" should be a string
    } // this brace was missing
}