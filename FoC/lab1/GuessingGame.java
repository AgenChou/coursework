import java.util.Scanner;

public class GuessingGame {

    private static Scanner scanner = new Scanner(System.in);

    /**
     * <tt>ChooseDifficulty()</tt> allows the user to choose how big the range
     * of the numbers is. If the input is not recognized, the function calls
     * itself recursively, until the provided input is correct.
     */
    private static int chooseDifficulty() {
        System.out.println("Please choose difficulty - Easy, Medium or Hard?");
        String difficulty = scanner.next();
        difficulty =  difficulty.toLowerCase(); // it should accept e.g either "easy" or "Easy"
        int upperLimit = 10; // default setting is medium.
        switch(difficulty) {
            case "easy":
                upperLimit = 5;
                break;
            case "medium":
                upperLimit = 10;
                break;
            case "hard":
                upperLimit = 20;
                break;
            default:
                System.out.println("Wrong input, try again.");
                chooseDifficulty();
                break;
        }
        return upperLimit;
    }

    public static void main(String[] args) {
        int upperLimit = chooseDifficulty();
        int randNumber = (int)(Math.random() * upperLimit + 1); // generate random number
        System.out.println("I'm thinking of a number between 1 and " + upperLimit + ". Can you guess what it is?");
        int userInput = scanner.nextInt();
        while (userInput != randNumber) {

            if (userInput > randNumber) {
                System.out.println("Your number is too large");
            } else {
                System.out.println("Your number is too small");
            }
            userInput = scanner.nextInt();
        }
        System.out.println("Well done!");
    }
}
