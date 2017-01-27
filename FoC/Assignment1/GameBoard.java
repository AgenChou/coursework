import static java.util.Arrays.copyOfRange;

import java.util.PriorityQueue;
import java.util.Comparator;
import java.util.Scanner;
import java.util.InputMismatchException;
import java.lang.Character;
import java.lang.Integer;

/**
 * This class represents a game board for a simple word game.
 *
 * There are a number of incomplete methods which you must implement to make fully functional.
 *
 * The board's tiles are indexed from 1 to N, and the first square (1,1) is in the top left.
 *
 * A tile may be replaced by another tile, hence only one tile may occupy a space at any one time.
 *
 * Created by adam on 12/10/2016.
 */
public class GameBoard {
    /**
     * Width of the board.
     */
    private int maxX;

    /**
     * Height of the board.
     */
    private int maxY;

    /**
     * Recording state of the board as a 2D array.
     */
    private LetterTile[][] board;

    /**
     * Counter of the number of LetterTiles placed.
     */
    private int lettersPlaced;

    /**
     * The words that are currently on the board, represented as a priority queue.
     */
    private PriorityQueue<Word> wordsList;

    /**
     * Default constructor creates an instance of the GameBoard, with the board
     * size 15x15 (default Scrabble board).
     */
    public GameBoard() {
        this.maxX = 15;
        this.maxY = 15;
        initiateBoard();
    }

    /**
     * Constructor creating an instance of GameBoard, with the provided size (width x height)
     * @param height
     * @param width
     */
    public GameBoard(int width, int height) {
        if (width < 1 || height < 1) {
            throw new IllegalArgumentException("The dimensions of the board must be positive integers.");
        }
        maxX = width;
        maxY = height;
        initiateBoard();
    }

    private void initiateBoard() {
        lettersPlaced = 0;
        board = new LetterTile[maxY][maxX];
    }

    /**
     * This method places a letter tile at a location on the board.
     *
     * @param x The horizontal coordinate on the gameboard
     * @param y The vertical coordinate on the gameboard.
     * @param tile The tile to store at the given coordinates.
     */
    public void setTile(int x, int y, LetterTile tile) {
        if (x > maxX || y > maxY) {
            throw new IllegalArgumentException("Provided location is outside the board, please try again.");
        }
        lettersPlaced++;
        board[y-1][x-1] = tile;
    }

    /**
     * This method returns a tile stored at a particular location on the board.
     *
     * @param x The horizontal coordinate on the gameboard.
     * @param y The vertical coordinate on the gameboard.
     * @return LetterTile The letter tile stored at the location, otherwise null.
     */
    public LetterTile getTile(int x, int y) {
        return board[y-1][x-1];
    }

    /**
     * This method removes a tile from the board and returns it.
     *
     * @param x The horizontal coordinate on the gameboard.
     * @param y The vertical coordinate on the gameboard.
     * @return The LetterTile in the location, otherwise null
     */
    public LetterTile removeTile(int x, int y) {
        if (board[y-1][x-1] != null) {
            // need to store it temporarily, otherwise we overwrite with null before returning
            LetterTile tile = board[y-1][x-1];
            lettersPlaced--;
            board[y-1][x-1] = null;
            return tile;
        } else {
            return null;
        }
    }

    /**
     * Private class dealing with words on the board. Each word is stored as an
     * array of LetterTiles. The class has methods <tt>toString()</tt> and
     * <tt>getScore()</tt>.
     */
    private class Word {
        LetterTile[] word;

        /**
         * Constructor converting a string into an array of LetterTiles
         * @param input string
         */
        Word(String input) {
            this.word = new LetterTile[input.length()];
            for (int i = 0; i < input.length(); i++) {
                word[i] = new LetterTile(input.charAt(i));
            }
        }

        Word(LetterTile[] input) {
            this.word = input;
        }

        /**
         * Overrides the Object's <tt>toString()</tt> method.
         * @return string
         */
        public String toString() {
            char[] charArray = new char[this.word.length];
            for (int i = 0; i < this.word.length; i++) {
                charArray[i] = this.word[i].getLetter();
            }
            return new String(charArray);
        }

        /**
         * Calculates the score value of the word, based on the scores for each
         * tile, as written in the LetterTile class.
         * @return int score of the word
         *
         */
        int score() {
            int score = 0;
            for (int i = 0; i < this.word.length; i++) {
                score += this.word[i].getScore();
            }
            return score;
        }
    }

    /**
     * Comparator that sorts Words in alphabetical order.
     */
    private class WordComparator implements Comparator<Word> {
        @Override
        public int compare(Word a, Word b) {
            return a.toString().compareToIgnoreCase(b.toString());
        }
    }

    /**
     * Comparator that sorts Words in decreasing score order.
     */
    private class WordScoreComparator implements Comparator<Word> {
        @Override
        public int compare(Word a, Word b) {
            if (a.score() > b.score()) {
                return -1;
            } else if (a.score() < b.score()) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    /**
     * scans the board for words and adds them to a Priority Queue sorted alphabetically
     */
    private void scanBoard() {
        wordsList = new PriorityQueue<Word>(1, new WordComparator());

        // Loop over rows
        for (int i = 0; i < maxY; i++) {
            scanRow(board[i]);
        }

        // Loop over columns
        for (int j = 0; j < maxX; j++) {
            LetterTile[] row = new LetterTile[maxY];
            for (int i = 0; i < maxY; i ++) {
                row[i] = board[i][j];
            }
            scanRow(row);
        }
    }

    /**
     * Separates an array of LetterTiles into words, and adds them to the list of words
     * @param row array of LetterTiles
     */
    private void scanRow(LetterTile[] row) {
        int i = 0;
        while (i < row.length) {
            if (row[i] == null) {
                // this field is empty; move on
                i++;
            } else if (i+1 < row.length && row[i+1] == null) {
                // this field contains a letter, but the next one doesn't. Thus it doesn't form a word, so move on.
                i += 2;
            } else {
                // two consecutive fields contain letters, so they form a word
                int start = i; // index of the first letter of the word
                int end = i; // index of the last letter of the word
                while (row[end+1] != null) {
                    end++;
                }
                LetterTile[] subarray = copyOfRange(row, start, end+1);
                wordsList.add(new Word(subarray));
                i = end + 1;
            }
        }
    }

    /**
     * This method returns an array of words on the board sorted alphabetically.
     *
     * Words may be horizontal or vertical, and are read left-to-right or top-to-bottom respectively.
     *
     * @return An array of words on the board sorted alphabetically
     */
    public String[] getWords() {
        scanBoard();

        String[] wordArray = new String[wordsList.size()];
        for (int i = 0; i < wordArray.length; i++) {
            wordArray[i] = wordsList.poll().toString();
        }
        return wordArray;
    }

    /**
     * This method returns the highest scoring word(s).
     * If two or more words share the same high score then please return an alphabetically sorted array.
     * @return an array
     */
    public String[] topScoringWords() {
        String[] topScoreWords;
        scanBoard();

        // Do the following, only if there is at least one word on the board
        if (wordsList.size() > 0) {
            // create a new PriorityQueue, which orders the words in decreasing score order
            PriorityQueue<Word> wordsScoreList = new PriorityQueue<Word>(1, new WordScoreComparator());
            wordsScoreList.addAll(wordsList);
            /* Since wordsList is sorted alphabetically, when we add its elements to wordsScoreList, words with the
             same score will retain the alphabetic order */

            topScoreWords = new String[wordsScoreList.size()]; // create an array, big enough to contain all words on the board (worst case scenario)

            // the first word in the queue is the highest scoring one
            Word topScoringWord = wordsScoreList.poll();
            int topScore = topScoringWord.score();

            int count = 0; // number of words with the same score, to trim the array of words to the appropriate length

            // Add all the words with the same score as TopScore to the arrray
            while (topScoringWord != null && topScore == topScoringWord.score()) {
                topScoreWords[count] = topScoringWord.toString() + " (Score: " + topScore + ")";
                topScoringWord = wordsScoreList.poll();
                count++;
            }

            return copyOfRange(topScoreWords, 0, count); // return only the subarray, in which the elements aren't null
        } else {
            return null; // no words on the board, so no top scoring one
        }
    }

    /**
     * Prints a visual representation of the gameboard.
     *
     * Please use the - character for unused spaces.
     */
    public void printBoard() {
        System.out.println();
        for (int i = 0; i < maxY; i++) {
            char[] row = new char[maxX]; // turn each row into an array of chars
            for (int j = 0; j < maxX; j++) {
                if (board[i][j] != null) {
                    row[j] = board[i][j].getLetter();
                } else {
                    row[j] = '-'; // display empty fields on the board as '-'
                }
            }
            System.out.println(row); // print row by row
        }
        System.out.println();
    }

    /**
     * This method counts the tiles currently on the board.
     * @return The number of tiles on the board.
     */
    public int lettersPlaced() {
        return lettersPlaced;
    }

    public void play() {
        try {
            Scanner scanner = new Scanner(System.in);

            GameBoard newGame = new GameBoard();
            System.out.println("You're given an empty board. Use 'setTile' to put down a tile.");
            System.out.println("Use 'help' to get a full list of options.");
            String command = scanner.next();
            while (command != "exit") {
                switch (command) {
                    case "help":
                        System.out.println("'setTile' - put down a tile with letter [char] at the position ([x],[y]), 1-indexed");
                        System.out.println("'removeTile' - take the tile which is currently at position ([x], [y]) on the board");
                        System.out.println("'showBoard' - display the current state of the game board");
                        System.out.println("'countTiles' - display the number of tiles currently on the board");
                        System.out.println("'listWords' - list all words currently on the board");
                        System.out.println("'topScore' - display the word(s) with top score");
                        System.out.println("'exit' - finish playing and exit the game");
                        break;
                    case "setTile":
                        System.out.println("Letter:");
                        String userInput = scanner.next();
                        // Check that we're given a single letter - i.e. the input is alphabetic and of length 1
                        while (userInput.length() != 1 || !Character.isLetter(userInput.charAt(0))) {
                            System.out.println("Please give a single letter.");
                            userInput = scanner.next();
                        }
                        LetterTile tile = new LetterTile(userInput.toLowerCase().charAt(0));
                        // Get the coordinates (with error checking)
                        int x = getBoundedValue(scanner, maxX, "X");
                        int y = getBoundedValue(scanner, maxY, "Y");
                        newGame.setTile(x, y, tile);
                        System.out.println("Done.");
                        break;
                    case "removeTile":
                        System.out.println("X coordinate:");
                        int xx = getBoundedValue(scanner, maxX, "X");
                        int yy = getBoundedValue(scanner, maxY, "Y");
                        newGame.removeTile(xx, yy);
                        System.out.println("Done.");
                        break;
                    case "showBoard":
                        newGame.printBoard();
                        break;
                    case "countTiles":
                        System.out.println("There are " + newGame.lettersPlaced() + " letter tiles on the board");
                        break;
                    case "listWords":
                        System.out.println("--- Words On Board ---");
                        String[] boardWords = newGame.getWords();
                        if (boardWords != null) {
                            for (String boardWord : boardWords) {
                                System.out.println(boardWord);
                            }
                        }
                        break;
                    case "topScore":
                        System.out.println("--- Top Scoring Word(s) ---");
                        String[] topScoringWords = newGame.topScoringWords();
                        if (topScoringWords != null) {
                            for (String topScoringWord : topScoringWords) {
                                System.out.println(topScoringWord);
                            }
                        }
                        break;
                    case "exit":
                        return;
                    default:
                        System.out.println("Unknown command, please try again.");
                }
                command = scanner.next();
            }
        } catch (InputMismatchException e) {
            throw new InputMismatchException("Incorrect input");
        }
    }

    /**
     * Checks that the value provided by the user is withing the given bounds.
     * (I.e. is the coordinate within the bounds of the board)
     * @param scanner
     * @param upperBound
     * @param axis X or Y
     * @return
     */
    private int getBoundedValue(Scanner scanner, int upperBound, String axis) {
        System.out.println(axis + " coordinate:");
        boolean validInput = false; // indicates that we've received an acceptable input
        int x = -1;
        String input;
        // we keep asking for input, until we get integer within the bounds of the board
        while (!validInput) {
            input = scanner.next();
            try {
                x = Integer.parseInt(input);
                if (x > 0 && x < upperBound) {
                    validInput = true;
                } else {
                    System.out.println(axis + " coordinate must be greater than 0 and smaller than " + upperBound);
                }
            } catch (NumberFormatException e) { // Exception when the input couldn't be parsed to integer
                System.out.println(axis + " coordinate must be greater than 0 and smaller than " + upperBound);
            }
        }
        return x;
    }

    public static void main(String[] args) {
        GameBoard board = new GameBoard(10,10);

        LetterTile d = new LetterTile('d');
        LetterTile e = new LetterTile('e');
        LetterTile m = new LetterTile('m');
        LetterTile o = new LetterTile('o');
        LetterTile a = new LetterTile('a');
        LetterTile v = new LetterTile('v');

        board.setTile(1,1,d);
        board.setTile(5,5,d);
        board.setTile(2,1,e);
        board.setTile(3,1,m);
        board.setTile(4,1,o);
        board.setTile(1,2,a);
        board.setTile(1,3,v);
        board.setTile(1,4,e);
        board.setTile(6,1,m);
        board.setTile(7,1,o);
        board.setTile(8,1,d);
        board.setTile(9,1,e);
        board.setTile(6,7,a);
        board.setTile(7,7,d);
        board.setTile(8,7,d);

        System.out.println("There are " + board.lettersPlaced() + " letter tiles on the board");
        board.printBoard();

        System.out.println("--- Words On Board ---");
        String[] boardWords = board.getWords();
        if (boardWords != null) {
            for (String boardWord : boardWords) {
                System.out.println(boardWord);
            }
        }

        System.out.println("--- Top Scoring Word(s) ---");
        String[] topScoringWords = board.topScoringWords();
        if (topScoringWords != null) {
            for (String topScoringWord : topScoringWords) {
                System.out.println(topScoringWord);
            }
        }

        board.play();
    }
}
