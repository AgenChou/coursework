import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Input first number: ");
        int a = scanner.nextInt(); // first integer
        System.out.println("Input second number: ");
        int b = scanner.nextInt(); // second integer
        System.out.println("Input the operator (+, -, *, /, or %): ");
        String operator = scanner.next();
        float result = 0;
	switch (operator) {
            case "+" :
                result = a + b;
                break;
            case "-" :
                result = a - b;
                break;
            case "*" :
                result = a * b;
                break;
            case "/" :
                result = (float)a / (float)b;
                break;
            case "%" :
                result = a % b;
                break;
        }        
        System.out.println("The result is: " + result);
    }
}

