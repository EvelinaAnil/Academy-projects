package comperator;

import comparable.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;

public class Main1
{
    public  static void main(String[]args){

        List<comparable.User> users = new ArrayList<>();
        users.add(new comparable.User("Ad",20));
        users.add(new comparable.User("DWW",19));
        users.add(new comparable.User("AAA",23));
        users.add(new comparable.User("CCC",45));
        users.add(new comparable.User("Bob",60));
        for (comparable.User user : users){
            System.out.println(user);
        }



        System.out.println();

        for (comparable.User user : users){
            System.out.println(user);
        }


    }
}
