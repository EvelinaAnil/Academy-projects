package stream_api;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Main3 {
    public static void main(String[] args) {
        List<User> users = DataBase.getAllUsers();

        //сгрупувати юзерів по спеціальностях у різні колекції
        //кількість спеціальностей залежить від enum
        //рузультат зберігати в Map(key-спеціальність, value-список юзерів)

//        Map<Speciality, List<User>> groups = users
//                .stream()
//                .collect(Collectors.groupingBy(User::getSpeciality));
//        groups.forEach(((speciality, group) -> {
//            System.out.println(speciality);
//            group.forEach(System.out::println);
//        }));

        //переписати цей алгоритм без використання stream api, без лямбд, без посилань на методи

    }
}
