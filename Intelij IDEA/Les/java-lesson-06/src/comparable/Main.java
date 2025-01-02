package comparable;


import java.util.ArrayList;
import java.util.Collection;

public class Main {
    public static void main(String[] args){
//        List<Integer> numbers = new ArraysList<>();
//        numbers.add(9);
//        numbers.add(7);
//        numbers.add(6);
//        numbers.add(8);
//        numbers.add(5);
//        numbers.add(3);


        List<String> stringList = new ArrayList<>();
        stringList.add("Artue");

        for (String number : stringList){
            System.out.println(number+ " ");
        }
        System.out.println();
        for (String str :stringList){
            System.out.println(str +"  ");
        }

        List<User> users = new ArrayList<>();
        users.add(new User("Ad",20));
        users.add(new User("DWW",19));
        users.add(new User("AAA",23));
        users.add(new User("CCC",45));
        users.add(new User("Bob",60));
        for (User user : users){
            System.out.println(user);
        }
        Collection.sort(users);
        for (User user : users){
            System.out.println(user);
        }

     }
}
