package comparable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Main {
    public static void main(String[] args) {
//        List<Integer> numbers = new ArrayList<>();
//        numbers.add(9);
//        numbers.add(3);
//        numbers.add(7);
//        numbers.add(2);
//        numbers.add(9);
//        for (Integer number : numbers) {
//            System.out.print(number + " ");
//        }
//        System.out.println();
//        Collections.sort(numbers);
//        for (Integer number : numbers) {
//            System.out.print(number + " ");
//        }

//        List<String> strings = new ArrayList<>();
//        strings.add("Artur");
//        strings.add("Petr");
//        strings.add("Oleg");
//        strings.add("Ivan");
//        strings.add("Artem");
//        for (String str : strings) {
//            System.out.print(str + " ");
//        }
//        System.out.println();
//        Collections.sort(strings);
//        for (String str : strings) {
//            System.out.print(str + " ");
//        }


        List<User> users = new ArrayList<>();
        users.add(new User("Artur", 20));
        users.add(new User("Petr", 18));
        users.add(new User("Ivan", 19));
        users.add(new User("121Ivan", 22));
        users.add(new User("Anton", 32));
        users.add(new User("Anton", 31));
        users.add(new User("Anton", 33));
        users.add(new User("Artem", 33));
        users.add(new User("Bob", 60));
        for (User user : users) {
            System.out.println(user);
        }
        Collections.sort(users);
        System.out.println();
        for (User user : users) {
            System.out.println(user);
        }
    }
}
