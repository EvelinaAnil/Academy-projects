import java.util.List;
import java.util.Random;
import java.util.Scanner;


public class Game {

    private List<Character> player1Team;
    private List<Character> player2Team;
    private Random random;

    public Game(List<Character> player1Team, List<Character> player2Team) {
        this.player1Team = player1Team;
        this.player2Team = player2Team;
        this.random = new Random();
    }

    public void startBattle(String player1, String player2) {
        System.out.println("Battle started!");

        // Случайный выбор игрока, который будет ходить первым
        boolean firstMove = random.nextBoolean();
        System.out.println("And the first move makes... " + (firstMove ? player1 : player2));

        while (bothTeamsAlive()) {
            if (firstMove) {
                playerTurn(player1Team, player2Team, player1,  player2);
            } else {
                playerTurn(player2Team, player1Team,  player2, player1);
            }
            firstMove = !firstMove;
        }

        if (player1Team.isEmpty()) {
            System.out.println(player1 + " win!");
        } else {
            System.out.println(player2 + " win!");
        }
    }

    private void playerTurn(List<Character> currentPlayerTeam, List<Character> opponentTeam, String currentPlayerName, String opponentName) {
        System.out.println(currentPlayerName + ", your turn:");
        Scanner scanner = new Scanner(System.in);
        for (Character character : currentPlayerTeam) {
            character.curseChecker();
            if (character.isDead()) {
                currentPlayerTeam.remove(character);
            }
        }

        Character selectedCharacter = chooseCharacter(currentPlayerTeam, scanner);

        int selectedAbility = chooseAbility(selectedCharacter, scanner);

        List<Character> targetTeam = (selectedAbility == 2) ? currentPlayerTeam : opponentTeam;
        Character targetCharacter = chooseTarget(targetTeam, selectedAbility, scanner);

        if (selectedAbility == 1) {
            selectedCharacter.attack(targetCharacter);
        } else if (selectedAbility == 2) {
            ((Wizard) selectedCharacter).heal(targetCharacter);
        } else if (selectedAbility == 3) {
            ((Witch) selectedCharacter).curse(targetCharacter);
        }

        if (targetCharacter.isDead()) {
            System.out.println(targetCharacter.getName() + " died!");
            currentPlayerTeam.remove(targetCharacter);
            opponentTeam.remove(targetCharacter);
        }

        endLine();
    }

    private Character chooseCharacter(List<Character> currentPlayerTeam, Scanner scanner) {
        System.out.println("Choose character:");
        for (int i = 0; i < currentPlayerTeam.size(); i++) {
            Character character = currentPlayerTeam.get(i);
            System.out.println((i + 1) + ". " + character.getName() + " (" + character.getCharacterType() + ")");
        }

        int choice;
        do {
            System.out.print("Enter character number: ");
            choice = scanner.nextInt();
            scanner.nextLine();

            if (choice < 1 || choice > currentPlayerTeam.size()) {
                System.out.println("Incorrect input. Please, enter number from the list.");
            }
        } while (choice < 1 || choice > currentPlayerTeam.size());

        return currentPlayerTeam.get(choice - 1);
    }

    private int chooseAbility(Character selectedCharacter, Scanner scanner) {
        if (selectedCharacter instanceof Wizard) {
            System.out.println("Choose ability:");
            System.out.println("1. Attack");
            System.out.println("2. Heal");

            int selectedAbility;
            do {
                System.out.print("Enter ability number: ");
                selectedAbility = scanner.nextInt();
                scanner.nextLine();

                if (selectedAbility < 1 || selectedAbility > 2) {
                    System.out.println("Incorrect input. Please, enter number from the list.");
                }
            } while (selectedAbility < 1 || selectedAbility > 2);

            return selectedAbility;
        } else if (selectedCharacter instanceof Witch) {
            System.out.println("Choose ability:");
            System.out.println("1. Attack");
            System.out.println("3. Curse");

            int selectedAbility;
            do {
                System.out.print("Enter ability number: ");
                selectedAbility = scanner.nextInt();
                scanner.nextLine();

                if (selectedAbility != 1 && selectedAbility != 3) {
                    System.out.println("Incorrect input. Please, enter number from the list.");
                }
            } while (selectedAbility != 1 && selectedAbility != 3);

            return selectedAbility;
        } else {
            return 1;
        }
    }

    private Character chooseTarget(List<Character> targetTeam, int selectedAbility, Scanner scanner) {
        System.out.println(selectedAbility == 2 ? "Choose character to heal:" : "Choose target to attack:");
        for (int i = 0; i < targetTeam.size(); i++) {
            Character target = targetTeam.get(i);
            System.out.println((i + 1) + ". " + target.getName());
        }

        int targetChoice;
        do {
            System.out.print("Enter character number: ");
            targetChoice = scanner.nextInt();
            scanner.nextLine();

            if (selectedAbility == 1) {
                if (targetChoice < 1 || targetChoice > targetTeam.size()) {
                    System.out.println("Incorrect input. Please, enter number from the list.");
                }
            } else {
                if (targetChoice < 1 || targetChoice > targetTeam.size()) {
                    System.out.println("Incorrect input. Please, enter number from the list.");
                }
            }
        } while ((selectedAbility == 1 && (targetChoice < 1 || targetChoice > targetTeam.size())) || (selectedAbility != 1 && (targetChoice < 1 || targetChoice > targetTeam.size())));

        return targetTeam.get(targetChoice - 1);
    }

    private boolean bothTeamsAlive() {
        return !player1Team.isEmpty() && !player2Team.isEmpty();
    }

    public static void endLine() {
        for (int i = 0; i < 2; i++) {
            System.out.println("\n");
        }
    }
}


