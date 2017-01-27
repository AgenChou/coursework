public class FractionTest {
  // Fraction f1 = new Fraction(2,4);
   // Fraction f2 = new Fraction(1,3);
   // Fraction f3 = Fraction.multiply(f1, f2);
   // Fraction f4 = Fraction.addFractions(f1,f2);
    //Fraction f5 = Fraction.divide(f1,f2);
  public static void main(String[] args) {
    Fraction f1 = new Fraction(2,4);
    Fraction f2 = new Fraction(1,3);
    Fraction f3 = Fraction.addFractions(f1, f2);
    Fraction f4 = Fraction.multiply(f1,f2);
    Fraction f5 = Fraction.divide(f1,f2);

    System.out.println(f1.toString() + ", " + f2.toString() + ", " + f3); 
    System.out.println(f3.toString()+ ", " + f4.toString() + ", " + f5.toString());
    System.out.println(f4.toString());
  }
}
