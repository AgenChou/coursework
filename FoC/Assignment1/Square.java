/**
 * A class to represent a Square
 * Created By: Adam Chester (apc@dcs.warwick.ac.uk)
 */
public class Square extends Shape implements Comparable {

    //You must define two variables here.
    private Point topLeft;
    private double sideLength;

    //This method sets the top-left of the square to be (0,0) and the side length to be 0.

    /**
     * Default constructor, creates a Square with side length of 0 and the top
     * left corner at the origin.
     */
    public Square() {
        this.topLeft = new Point();
        this.sideLength = 0.0;
    }

    /**
     * Creates a Square with the given parameters.
     * @param topLeft Point representing the top left corner
     * @param sideLength length of the Square's side
     */
    public Square(Point topLeft, double sideLength) {
        this.topLeft = topLeft;
        this.sideLength = sideLength;
    }

    /**
     * Creates a Square with the given parameters.
     * @param topLeftX X coordinate of the top left corner
     * @param topLeftY Y coordinate of the top left corner
     * @param sideLength length of the Square's side
     */
    public Square(double topLeftX, double topLeftY, double sideLength) {
        this.topLeft = new Point(topLeftX, topLeftY);
        this.sideLength = sideLength;
    }

    /**
     * get the position of the top left corner.
     * @return Point representing the top left corner
     */
    public Point getTopLeft() {
        return this.topLeft;
    }

    /**
     * Sets the top left corner of the Square.
     * @param topLeft Point representing the new position of the top left corner.
     */
    public void setTopLeft(Point topLeft) {
        this.topLeft = topLeft;
    }

    /**
     * Gets the length of the Square's side
     * @return
     */
    public double getSideLength() {

        return this.sideLength;
    }

    /** Sets the length of the Square's side to a given value.
     * @param sideLength new length of the side
     */
    public void setSideLength(double sideLength) {
        this.sideLength = sideLength;
    }

    /**
     * Calculates the area of the Square.
     * @return the area as a double
     */
    public double area() {
        return sideLength * sideLength;
    }

    /**
     * Compares two squares, based on top left corner and side length
     * @param s the square to compare to
     * @return
     */
    public boolean equals(Square s) {
        return this.topLeft.equals(s.getTopLeft()) && this.sideLength == s.getSideLength();
    }

    /**
     * Tests if the Square strictly contains the given shape inside itself
     * @param s shape to check against
     * @return true, if the shape is inside the Square, false otherwise
     * @throws "The given object is neither a square nor a circle."
     */
    public boolean envelops(Shape s) {
        try {
            if (s instanceof Square) {
                Square sq = (Square) s;
                if (this.topLeft.getX() < sq.getTopLeft().getX() // check that the top left corner is inside our square
                        && this.topLeft.getY() < sq.getTopLeft().getY()
                        && this.sideLength > (sq.getTopLeft().getX() - this.topLeft.getX() + sq.getSideLength()) //check that the sidelength fits inside the square
                        && this.sideLength > (sq.getTopLeft().getY() - this.topLeft.getY() + sq.getSideLength())) {
                    return true;
                } else {
                    return false;
                }
            } else if (s instanceof Circle) {
                Circle c = (Circle) s;
                if (this.topLeft.getX() < c.getCenter().getX() // check that the center of the circle is inside the square
                        && this.topLeft.getY() < c.getCenter().getY()
                        && c.getCenter().getX() - this.topLeft.getX() > c.getRadius() // check that each side is at least radius distance away from the circle's center
                        && this.sideLength - (c.getCenter().getX() - this.topLeft.getX()) > c.getRadius()
                        && c.getCenter().getY() - this.topLeft.getY() > c.getRadius()
                        && this.sideLength - (c.getCenter().getY() - this.topLeft.getY()) > c.getRadius()) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false; // error check
            }
        } catch (ClassCastException e) {
            throw new IllegalArgumentException("The given object is neither a Suqare nor a Circle");
        }
    }

    /**
     * Compares the area of the Square to the given object
     * @param otherObject
     * @return -1 if the Square is smaller, 0 if the areas are equal, 1 if the Square is larger
     * @throws IllegalArgumentException "Given object is not a shape"
     */
    public int compareTo(Object otherObject) {
        try {
            Shape s = (Shape) otherObject;
            if (this.area() < s.area()) {
                return -1;
            } else if (this.area() > s.area()) {
                return 1;
            } else {
                return 0;
            }
        } catch(ClassCastException e) {
            throw new IllegalArgumentException("Given object is not a Shape");
        }
    }

    public String toString() {
        return "This Square's top left corner is at " + this.topLeft.toString()
                + ", and the side length " + this.sideLength;
    }

    public static void main(String[] args) {
        Square s1 = new Square(2,2,2);
        Square s2 = new Square(1.5,1.5,3);
        Circle c1 = new Circle(3,3,0.2);
        System.out.println(s1.compareTo(s2) + " " + s1.equals(s2) + " " + s2.envelops(s1) + " " + s1.envelops(c1));

    }
}
