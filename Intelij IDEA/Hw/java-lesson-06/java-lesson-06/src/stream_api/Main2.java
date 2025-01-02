package stream_api;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.function.Consumer;

public class Main2 {
    public static void main(String[] args) {
        List<User> users = DataBase.getAllUsers();
        //отримати тільки імена дизайнерів відсортировані по імені в зворотньому порядку
//        List<String> names = new ArrayList<>();
//        for (User user : users) {
//            if (user.getSpeciality() == Speciality.DESIGNER) {
//                names.add(user.getName());
//            }
//        }
//        Collections.sort(names, (name1, name2) -> name2.compareTo(name1));
//        for (String name : names) {
//            System.out.println(name);
//        }

        List<String> names = users
                .stream()
                .filter(u -> u.getSpeciality() == Speciality.DESIGNER)
                .map(User::getName)
                .sorted(Comparator.reverseOrder())
                .toList();

        names.forEach(System.out::println);

    }
}
