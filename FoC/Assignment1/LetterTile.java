/**
 * Created by adam on 12/10/2016.
 */
public class LetterTile {

    private char letter;

    public LetterTile(char letter) {
        this.letter = letter;
    }

    public char getLetter() {
        return letter;
    }

    public int getScore() {
        int score = 0;
        switch (this.letter) {
            case 'a' : score = 1; break;
            case 'b' : score = 2; break;
            case 'c' : score = 2; break;
            case 'd' : score = 3; break;
            case 'e' : score = 1; break;
            case 'f' : score = 3; break;
            case 'g' : score = 2; break;
            case 'h' : score = 3; break;
            case 'i' : score = 1; break;
            case 'j' : score = 3; break;
            case 'k' : score = 2; break;
            case 'l' : score = 3; break;
            case 'm' : score = 5; break;
            case 'n' : score = 3; break;
            case 'o' : score = 1; break;
            case 'p' : score = 2; break;
            case 'q' : score = 2; break;
            case 'r' : score = 3; break;
            case 's' : score = 1; break;
            case 't' : score = 1; break;
            case 'u' : score = 1; break;
            case 'v' : score = 3; break;
            case 'w' : score = 3; break;
            case 'x' : score = 5; break;
            case 'y' : score = 3; break;
            case 'z' : score = 5; break;
            default  : System.err.println("Unknown character for score"); return 0;
        }

        return score;
    }


}
