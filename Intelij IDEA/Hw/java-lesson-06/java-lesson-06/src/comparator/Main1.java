package comparator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Main1 {
    public static void main(String[] args) {
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
        System.out.println();
//        Collections.sort(users, new Comparator<User>() {
//            @Override
//            public int compare(User o1, User o2) {
//                return o1.getAge() - o2.getAge();
//            }
//        });
//        for (User user : users) {
//            System.out.println(user);
//        }

        Collections.sort(users, (o1, o2) -> o1.getAge() - o2.getAge());
        for (User user : users) {
            System.out.println(user);
        }
    }
}
