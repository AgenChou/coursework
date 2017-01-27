import java.util.Scanner;
import java.util.InputMismatchException;

public class DoubleProgram {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter a number: ");
        try {
            int userInput = scanner.nextInt();
            System.out.println(userInput + " doubled is " + userInput*2);   
        } catch (InputMismatchException e)  {
            System.out.println("Incorrect input; try again");
        }
    }
}

