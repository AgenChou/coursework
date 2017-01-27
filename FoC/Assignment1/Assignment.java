import java.util.ArrayList;
import java.util.Collections;
import java.io.BufferedReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * A class to process the data file provided.
 * Created By: Adam Chester (apc@dcs.warwick.ac.uk)
 */
public class Assignment {

    //Do not change the variables below
    public int shapeCounter;
    public int circleCounter;
    public int squareCounter;
    public double maxCircleArea;
    public double minCircleArea;
    public double maxSquareArea;
    public double minSquareArea;
    public double meanCircleArea;
    public double meanSquareArea;
    public double stdDevCircleArea;
    public double stdDevSquareArea;
    public double medianCircleArea;
    public double medianSquareArea;

    //Define a data structure for storing circle areas
    public ArrayList<Double> circleList;
    //Define a data structure for storing square areas
    public ArrayList<Double> squareList;
    // Note that storing only the areas is sufficient, because we're not asked to use any other information about the shapes

    // Buffered reader
    BufferedReader reader;

    public Assignment() {

        // Instantiate lists of circles and squares
        circleList = new ArrayList<Double>();
        squareList = new ArrayList<Double>();

        // Initialise the counters at 0:
        shapeCounter = 0;
        circleCounter = 0;
        squareCounter = 0;
    }

    // sums all elements of an ArrayList of Doubles
    private Double sumAreas(ArrayList<Double> list) {
        Double sum = 0.0;
        for (Double area : list){
            sum = sum + area;
        }
        return sum;
    }

    // sums squares of all elements of an ArrayList of Doubles
    private Double sumSquares(ArrayList<Double> list) {
        Double sum = 0.0;
        for (Double area : list) {
            sum = sum + area*area;
        }
        return sum;
    }

    public void analyse(String filename) {

        try {
            reader = Files.newBufferedReader(Paths.get(filename), Charset.defaultCharset());

            String line;
            while ((line = reader.readLine()) != null) {
                String[] components = line.split(" "); // Separate the component by a space
                String type = components[0].toLowerCase();

                // The values that we have read into the components array are Strings, we need to convert them into doubles.
                double x = Double.parseDouble(components[1]);
                double y = Double.parseDouble(components[2]);
                double length = Double.parseDouble(components[3]);

                // Deal with only those shapes that aren't singular
                if (length > Shape.TOLERANCE) {
                    shapeCounter++;
                    switch (type) {
                        case "square":
                            squareCounter++;
                            squareList.add(new Square(x, y, length).area());
                            break;
                        case "circle":
                            circleCounter++;
                            circleList.add(new Circle(x, y, length).area());
                            break;
                        default:
                            break;
                    }

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Sort the lists - default order is ascending
        Collections.sort(circleList);
        Collections.sort(squareList);

        // We can only work out the areas, if the number of circles is larger than 0
        if (circleCounter > 0) {
            // The min area is the first element in each of the lists
            minCircleArea = circleList.get(0);

            // The max area is the last element
            maxCircleArea = circleList.get(circleCounter - 1);

            // Using n/2 index, rather than standard (n+1)/2, because of 0 indexing
            medianCircleArea = circleList.get(circleCounter / 2);

            // Using sumAreas method to calculate means
            meanCircleArea = sumAreas(circleList) / circleCounter;

            // Standard deviation is sqrt(E(X^2) - E(X)^2)
            stdDevCircleArea = Math.sqrt(sumSquares(circleList) / circleCounter - meanCircleArea * meanCircleArea);
        } // no else clause, because if a double isn't initiated, it will default to 0.0 anyway

        // Similarily for squares
        if (squareCounter > 0) {
            minSquareArea = squareList.get(0);
            maxSquareArea = squareList.get(squareCounter - 1);
            medianSquareArea = squareList.get(squareCounter / 2);
            meanSquareArea = sumAreas(squareList) / squareCounter;
            stdDevSquareArea = Math.sqrt(sumSquares(squareList) / squareCounter - meanSquareArea * meanSquareArea);
        }
    }

    // This method is complete
    public static void main(String[] args) {
        if(args.length != 1) {
            System.err.println("Error You must provide a filename");
            System.err.println("Usage: java Assignment filename");
            System.exit(-1);
        }

        Assignment a = new Assignment();
        a.analyse(args[0]);

        System.out.println("Shape count: " + a.shapeCounter);
        System.out.println("Circle count: " + a.circleCounter);
        System.out.println("Square count: " + a.squareCounter);

        System.out.println("Min circle area: " + a.minCircleArea );
        System.out.println("Max circle area: " + a.maxCircleArea );
        System.out.println("Min square area: " + a.minSquareArea );
        System.out.println("Max square area: " + a.maxSquareArea );

        System.out.println("Mean Circle area: " + a.meanCircleArea);
        System.out.println("Mean Square area: " + a.meanSquareArea);

        System.out.println("Standard Deviation Circle area: " + a.stdDevCircleArea);
        System.out.println("Standard Deviation Square area: " + a.stdDevSquareArea);

        System.out.println("Median Circle area: " + a.medianCircleArea);
        System.out.println("Median Square area: " + a.medianSquareArea);

    }
}
