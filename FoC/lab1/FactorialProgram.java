import java.util.Scanner;
import java.util.InputMismatchException;

public class FactorialProgram {
    public static void main(String[] args) {
        int userInput;
        int result = 1; // init as 1, because 0!=1, and 0 is a valid input 
        int i; // index
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please input a number: ");
        
        try {
            userInput = scanner.nextInt();
            if (userInput < 0) {
                System.out.println("The number must be positive");
            } else {
                for (i = userInput; i > 1; i--) {
                    result = result * i;
                }
                System.out.println(userInput + "! is " + result);
            }
        } catch (InputMismatchException e) {
             System.out.println("Incorrect input; please try again");        
        }
    }
}

