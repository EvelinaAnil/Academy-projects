import java.util.Random;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Random rnd = new Random();
        Scanner scanner = new Scanner(System.in);
        int compNum = 0, playerNum = 0;
        compNum = rnd.nextInt(100) + 1;
        int i = 10;
        while (i > 0) {
            System.out.println("Enter your number");
            playerNum = scanner.nextInt();
            if (playerNum == compNum) {
                System.out.println("You win !!!");
                break;
            } else if (compNum > playerNum) {
                System.out.println("More");
            } else if (compNum < playerNum) {
                System.out.println("Less");
            }
            --i;
            if (i < 1) {
                System.out.println("You lose !");
            }
        }
    }
}