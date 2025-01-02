package comperator;

import comparable.User;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

public class Main {
    public  static void main(String[]args){

        List<User> users = new ArrayList<>();
        users.add(new User("Ad",20));
        users.add(new User("DWW",19));
        users.add(new User("AAA",23));
        users.add(new User("CCC",45));
        users.add(new User("Bob",60));
        for (comparable.User user : users){
            System.out.println(user);
        }
        Collection.sort(users, new UserAgeComparator());
        System.out.println();
        for (User user : users){
            System.out.println(user);
        }

        System.out.println();

        Collection.sort(users, new UserAgeComperatorDesc());
        System.out.println();
        for (User user : users){
            System.out.println(user);
        }


    }
}
