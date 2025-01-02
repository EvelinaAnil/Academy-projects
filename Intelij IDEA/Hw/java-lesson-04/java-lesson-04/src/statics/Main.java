package statics;

public class Main {
    public static void main(String[] args) {
        User user1 = new User("Ivan", "Ivan");
        User user2 = new User("Petrov", "Petrov");
        User user3 = new User("Oleg", "Oleg");
        System.out.println(user1);
        System.out.println(user2);
        System.out.println(user3);

        System.out.println(user1.getCounter());
        System.out.println(User.getCounter());
    }
}
