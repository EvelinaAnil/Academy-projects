package jcf;

import stream_api.Speciality;
import stream_api.User;

import java.util.HashSet;
import java.util.SplittableRandom;

public class Main1 {
    public static void main(String[] args) {
//        Set<User> set = new HashSet<>();
//        set.add(new User("Ivan",18, Speciality.DESIGNER));
//        set.add(new User("Ger",22,Speciality.DEVELOPER));
//        set.add(new User("Bob",27,Speciality.TESTER));
//        set.add(new User("Ivan",17,Speciality.DESIGNER));

//        String a= new String("one");
//        String b= new String("One");
//        System.out.println(a.hashCode());
//        System.out.println(b.hashCode());

        User user1 = new User ("",18,Speciality.DEVELOPER);
        User user2 = new User ("RR",26,Speciality.DEVELOPER);
        System.out.println(user1);
        System.out.println(user2);
        System.out.println(user1.hashCode());
        System.out.println(user2.hashCode());
        System.out.println(user1 == user2);
        System.out.println(user1.equals(user2));


        

    }
}
