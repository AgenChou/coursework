/**
 * A class to represent a Circle
 * Created By: Adam Chester (apc@dcs.warwick.ac.uk)
 */
public class Circle extends Shape implements Comparable {

    //Define a centre variable to store the point at the center
    public Point center;

    //Define a double variable to store the radius
    public double radius;

    //This method sets the center of the circle to be (0,0) and the radius to be 0.
    /**
     * Default constructor, creates a circle at origin with radius of 0.
     */
    public Circle() {
        this.radius = 0.0;
        this.center = new Point(0.0, 0.0);
    }

    /**
     * Creates a Circle with the center at the given point, and with the given
     * radius.
     * @param center point representing the center of the circle
     * @param radius radius of the circle
     */
    public Circle(Point center, double radius) {
        this.radius = radius;
        this.center = center;
    }

    /**
     * Creates a Circle with the center at the given coordinates, with the
     * given radius.
     * @param centerX X coordinate of the center
     * @param centerY Y coordinate of the center
     * @param radius radius of the Circle
     */
    public Circle(double centerX, double centerY, double radius) {
        this.center = new Point(centerX, centerY);
        this.radius = radius;
    }

    //You should define getters and setters for your center and radius here.

    /**
     * Gets the point representing the center of the circle.
     * @return center of the circle as an instance of Point
     */
    public Point getCenter() {

        return this.center;
    }

    /**
     * Sets the center of the Circle to a given point.
     * @param p - Point representing the new location of the center
     */
    public void setCenter(Point p) {

        this.center = p;
    }

    /**
     * Sets the center of the Circle to the given coordinates.
     * @param centerX new X coordinate of the center.
     * @param centerY new Y coordinate of the center.
     */
    public void setCenter(double centerX, double centerY) {

        this.center = new Point(centerX, centerY);
    }

    /**
     * Gets the radius of the Circle
     * @return represented as a double.
     */
    public double getRadius() {

        return this.radius;
    }

    /**
     * Sets the radius of the Circle to the given value.
     * @param r new radius.
     */
    public void setRadius(double r) {

        this.radius = r;
    }

    /**
     * Calculates the area of the circle.
     * @return area as double
     */
    public double area() {
        return Math.PI * this.radius * this.radius;
    }

    /**
     * Tests if the Circle contains the given shape inside itself
     * @param s shape to check against
     * @return true, if the shape is inside the circle, false otherwise
     * @throws "The given object is neither a square nor a circle."
     */
    public boolean envelops(Shape s) {
        try {
            if (s instanceof Circle) {
                Circle c = (Circle) s;
                // the distance between this circle's center and the furthest point in the given circle is the given
                // circle's radius further than the distance between the centers of the circles
                if (this.center.distance(c.getCenter()) + c.getRadius() < this.radius) {
                    return true;
                } else {
                    return false;
                }
            } else if (s instanceof Square) {
                Square sq = (Square) s;
                // list all corners in the square (other than top left)
                Point topRight = new Point(sq.getTopLeft().getX() + sq.getSideLength(), sq.getTopLeft().getY());
                Point bottomLeft = new Point(sq.getTopLeft().getX(), sq.getTopLeft().getY() + sq.getSideLength());
                Point bottomRight = new Point(sq.getTopLeft().getX() + sq.getSideLength(),
                        sq.getTopLeft().getY() + sq.getSideLength());
                // check that each one of these points is inside the circle - works, because both shapes are convex
                if (this.center.distance(sq.getTopLeft()) < this.radius
                        && this.center.distance(topRight) < this.radius
                        && this.center.distance(bottomLeft) < this.radius
                        && this.center.distance(bottomRight) < this.radius) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false; // error check
            }
        } catch (ClassCastException e) {
            throw new IllegalArgumentException("The given object is neither a square nor a circle.");
        }
    }

    /**
     * Compares two circles, basec on radius and center
     * @param c the circle to compare to
     * @return true if they are the same, false otherwise
     */
    public boolean equals(Circle c) {
        return this.radius == c.radius && this.center.equals(c.center);
    }

    public String toString() {
        return "This Circle has its centre at " + this.center.toString() + " and a radius of" +  this.radius;
    }

    /**
     * Compares the area of the circle with a given shape.
     * @param otherObject
     * @return -1 if the circle is smaller, 0 if the areas are equal, 1 if the circle is bigger.
     */
    public int compareTo(Object otherObject) throws ClassCastException {
        Shape s = (Shape) otherObject;
        if (this.area() < s.area()) {
            return -1;
        } else if (this.area() > s.area()) {
            return 1;
        } else {
            return 0;
        }
    }

    public static void main(String[] args) {

        Circle c1 = new Circle();
        Circle c2 = new Circle(2,2,1);
        Square s1 = new Square(0,0,1);
        Square s2 = new Square(2,2,0.5);

        System.out.println(c1.equals(c2) + " " + c2.envelops(s1) + " " + c2.envelops(s2));

    }
}
