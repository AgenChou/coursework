import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ReadData {
    public static void main(String[] args) {
        try {
            BufferedReader br = Files.newBufferedReader(Paths.get("SmallShapeTest.data"), Charset.defaultCharset());

            String line;
            while ((line = br.readLine()) != null) {
                String[] components = line.split(" "); //Separate the component by a space
                String type = components[0];

                //The values that we have read into the components array are Strings, we need to convert them into doubles.
                double value1 = Double.parseDouble(components[1]);
                double value2 = Double.parseDouble(components[2]);
                double value3 = Double.parseDouble(components[3]);

                System.out.println("type: " + type);
                System.out.println("\t Value 1: " + value1);
                System.out.println("\t Value 2: " + value2);
                System.out.println("\t Value 3: " + value3);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
