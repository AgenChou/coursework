/**
 * A class to represent a 2D point
 * Created By: Adam Chester (apc@dcs.warwick.ac.uk)
 */
public class Point {

    private double x; // the x coordinate of the point
    private double y; // the y coordinate of the point

    /**
     * <tt>Point()</tt> is the default constructor, creating a point at the
     * origin (0,0).
     */
    public Point() {
        this.x = 0;
        this.y = 0;
    }

    /**
     * <tt>Point(x,y)</tt> creates a point with the given coordinates.
     * @param x is the x coordinate of the new point
     * @param y is the y coordinate of the new point
     */
    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    /**
     * <tt>distance(p)</tt> returns the distance between this point and a given
     * one.
     * @param p the other point to calculate distance.
     * @return distance as a double
     */
    public double distance(Point p) {
        double dx = this.x - p.x; // difference in x coordinates
        double dy = this.y - p.y; // difference in y coordinates
        double distance = Math.sqrt(dx*dx + dy*dy); // Euclidean distance
        return distance;
    }

    /**
     * Gets the x coordinate of this point.
     * @return x
     */
    public double getX() {

        return this.x;
    }

    /**
     * Sets the x coordinate of this point.
     * @param x new value of the x coordinate
     */
    public void setX(double x) {
        this.x = x;
    }

    /**
     * Gets the y coordinate of this point.
     * @return y
     */
    public double getY() {
        return this.y;
    }

    /**
     * Sets the y coordinate of this point.
     * @param y new valur of the y coordinate
     */
    public void setY(double y) {
        this.y = y;
    }

    /**
     * Checks if this point is equal to a given one, by checking if the
     * distance between them is withing tolerant.
     * @param p new point to compare to
     * @return true if equal, false otherwise.
     */
    public boolean equals(Point p) {
        if (this.distance(p) < Shape.TOLERANCE) {
            return true;
        } else {
            return false;
        }
    }

    //You should write some code to test your methods in the main method below.
    public static void main(String[] args) {

        Point p = new Point();
        Point p2 = new Point(2,4);

        System.out.println(p.distance(p2));
        System.out.println(p.equals(p2));

        //Add in more here as required.
        Point p3 = new Point(2,4);
        System.out.println(p2.equals(p3));
        p3.setX(2.4);
        System.out.println(p3.distance(p2));

    }

}




