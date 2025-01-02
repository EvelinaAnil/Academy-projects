package stream_api;

import java.util.ArrayList;
import java.util.List;

public class DataBase {
    public static List<User>getAllUsers(){
        List<User> users = new ArrayList<>();

        users.add(new User("Ivan", 20, Speciality.DEVELOPER));
        users.add(new User("Petr", 30, Speciality.DEVELOPER));
        users.add(new User("Stepan", 18, Speciality.DESIGNER));
        users.add(new User("Viktoria", 40, Speciality.TESTER));
        users.add(new User("Olga", 18, Speciality.DESIGNER));
        users.add(new User("Artur", 55, Speciality.TESTER));
        users.add(new User("Artem", 15, Speciality.DEVELOPER));
        users.add(new User("Bob", 66, Speciality.DESIGNER));

        return users;
    }
}
