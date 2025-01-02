package comperator;

import comparable.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;

public class Main2 {

    public  static void main(String[]args) {

        List<User> users = new ArrayList<>();
        users.add(new User("Ad", 20));
        users.add(new User("DWW", 19));
        users.add(new User("AAA", 23));
        users.add(new User("CCC", 45));
        users.add(new User("Bob", 60));
        for (User user : users) {
            System.out.println(user);
        }

        Collection.sort(users, Comparator.comparingInt(User::getName));
        System.out.println();
        for (User user : users) {
            System.out.println(user);
        }

        Collection.sort(users, Comparator.comparingInt(User::getAge));
        System.out.println();
        for (User user : users) {
            System.out.println(user);
        }

    }
}
