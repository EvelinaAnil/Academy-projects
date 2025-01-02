package edu.itstep.oop;

public class BlackJackGame {
    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("Введіть ваше ім'я:");
        String userName = scanner.nextLine();

        User user = new User(1000); // Початкова кількість грошей у користувача

        // Основний цикл гри
        while (true) {
            // Реалізація алгоритму гри BlackJack
            // Перевірка наявності грошей у користувача
            // Пропозиція продовжити гру або вийти

            System.out.println("Бажаєте продовжити гру? (так/ні)");
            String choice = scanner.nextLine();
            if (!choice.equalsIgnoreCase("так")) {
                break; // Вихід з гри, якщо користувач не бажає продовжувати
            }
        }

        scanner.close();
    }
}
