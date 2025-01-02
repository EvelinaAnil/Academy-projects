import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int x = 4;
        int y = 10;
        int n;
        boolean[][] seats = new boolean[x][y];
        Random random = new Random();
        for (int i = 0; i < x; i++) {
            for (int j = 0; j < y; j++) {
                seats[i][j] = random.nextBoolean();
            }
        }

        System.out.println("Результат програми:");
        for (int i = 0; i < x; i++) {
            for (int j = 0; j < y; j++) {
                System.out.print(seats[i][j] ? "1 " : "0 ");
            }
            System.out.println();
        }

        Scanner scanner = new Scanner(System.in);
        System.out.print("Введіть кількість місць, щоб придбати поруч (N): ");
        n = scanner.nextInt();
        int count = 0;
        ArrayList<Integer> rowFreeSeats = new ArrayList<Integer>();
        for (int i = 0; i < x; i++) {
            StringBuilder rowInfo = new StringBuilder();
            rowInfo.append((i + 1) + "ряд: ");
            for (int j = 0; j < y; j++) {
                if (seats[i][j] != true) {
                    rowFreeSeats.add(j);
                    count++;
                }
                if (seats[i][j] != true && count >= n) {
                    for (int freeSeat : rowFreeSeats) {
                        rowInfo.append(freeSeat + 1 + " ");
                    }
                    rowFreeSeats.clear();
                } else if (seats[i][j] == true) {
                    count = 0;
                    rowFreeSeats.clear();
                }
            }
            System.out.println(rowInfo);
        }
    }
}
