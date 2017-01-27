/**
 * An abstract class to represent a generic shape
 * Created By: Adam Chester (apc@dcs.warwick.ac.uk)
 */
public abstract class Shape {

    public final static double TOLERANCE = 0.0000001;

    public abstract double area();
    public abstract boolean envelops(Shape s);

    public String toString() {
        return "Shape";
    }
}