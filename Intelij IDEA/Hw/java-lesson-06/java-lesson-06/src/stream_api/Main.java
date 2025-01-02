package stream_api;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<User> users = DataBase.getAllUsers();
        //отримати тільки розробників
        //імперативний стиль
//        List<User> developers = new ArrayList<>();
//        for (User user : users) {
//            if (user.getSpeciality() == Speciality.DEVELOPER) {
//                developers.add(user);
//            }
//        }
//        for (User developer : developers) {
//            System.out.println(developer);
//        }

        //декларативиний
        List<User> developers = users
                .stream()
                .filter(u -> u.getSpeciality() == Speciality.DEVELOPER)
                .toList();
        for (User developer : developers) {
            System.out.println(developer);
        }

    }
}
