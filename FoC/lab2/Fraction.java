public class Fraction {
  private int numerator;
  private int denominator;
  
  public Fraction(int a, int b) {
    this.numerator = a;
    this.denominator = b;
    this.simplify();
  }

  /**
 * <tt>gcd</tt> finds the greatest common divisor of two integers.
 **/
  private int gcd(int a, int b) {
    while (a != b) {
      if (a > b) {
        a = a - b;
      } else {
        b = b - a;
      }
    }
    return a;
  }

  /**
 * <tt>simplify</tt> simplifies the fraction given.
 **/
  private void  simplify() {
    int c = gcd(numerator, denominator);
    numerator  = numerator/c;
    denominator = denominator/c;
  }
/**
 * <tt>addFractions</tt> adds two given fractions and outputs the result in a 
 * simplified form.
 **/
  public static Fraction addFractions(Fraction ab, Fraction cd) {
    int a = ab.getNumerator();
    int b = ab.getDenominator();
    int c = cd.getNumerator();
    int d = cd.getDenominator();
    Fraction result = new Fraction((int)(a*d + c*b), (int)(d*b));
    return(result);
  }
  
/**
 * <tt>multiply</tt> multiplies two given fractions and outputs the result in a
 * simplified form.
 **/
  public static Fraction multiply(Fraction ab, Fraction cd) {
    int a = ab.getNumerator();
    int b = ab.getDenominator();
    int c = cd.getNumerator();
    int d = cd.getDenominator();
    Fraction result = new Fraction(a*c, b*d);
    return(result);
  }

 /**
 * <tt>divide</tt> divides two given fractions and outputs the result in a 
 * simplified form.
 **/
  public static Fraction divide(Fraction ab, Fraction cd) {
    int a = ab.getNumerator();
    int b = ab.getDenominator();
    int c = cd.getNumerator();
    int d = cd.getDenominator();
    Fraction result = new Fraction(a*d, b*c);
    return(result);
  }

  public String toString() {
    return(this.numerator + "/" + this.denominator);
  }

/**
 * <tt>getNumerator</tt> returns the value of the numerator of the fraction.
 **/
  public int getNumerator() {
    return this.numerator;
  }

  /**
 * <tt>setNumerator</tt> sets the numerator of the numerator of the fraction to
 * the value given.
 *
 * @param a - new value of the numerator
 **/
  public void setNumerator(int a) {
    this.numerator = a;
  }

 /**
 * <tt>getDenominator</tt> returns the value of the denominator of the fraction.
 **/
  public int getDenominator() {
    return this.denominator;
  }
  
  /**
  * <tt>setDenominator</tt> sets the denominator of the fraction to the value 
  * given.
  *
  * @param b - new value of the denominator 
  **/
  public void setDenominator(int b) {
    this.denominator = b;
  }

} 
