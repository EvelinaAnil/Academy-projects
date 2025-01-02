package stream_api;

import java.util.List;

public class Main1 {
    public static void main(String[] args) {
        List<User> users = DataBase.getAllUsers();
        //чи є хоч один неповнолітній?
//        boolean result = false;
//        for (User user : users) {
//            if (user.getAge() < 18) {
//                result = true;
//                break;
//            }
//        }
//        System.out.println(result);

        final boolean result = users
                .stream()
                .anyMatch(u -> u.getAge() < 18);
        System.out.println(result);
    }
}
