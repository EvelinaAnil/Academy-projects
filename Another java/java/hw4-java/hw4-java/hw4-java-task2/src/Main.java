import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Player 1, please enter your team name:");
        String player1 = scanner.nextLine();

        System.out.println("Player 2, please enter your team name:");
        String player2 = scanner.nextLine();

        List<Character> player1Team = new ArrayList<>();
        player1Team.add(new Barbarian("Baelon the brave", 130));
        player1Team.add(new Wizard("Brandon the raven", 80));

        List<Character> player2Team = new ArrayList<>();
        player2Team.add(new Barbarian("Rolland Bisbery", 130));
        player2Team.add(new Witch("Melisandra the cruel", 80));

        Game game = new Game(player1Team, player2Team);
        game.startBattle(player1, player2);
    }
}
