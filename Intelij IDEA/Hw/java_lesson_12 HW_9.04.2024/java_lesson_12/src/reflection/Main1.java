package reflection;

import java.lang.reflect.Field;

public class Main1 {
    public static void main(String[] args) {
        User user = new User("Ivan", "Ivanov");
//        System.out.println(user.getFirstName());
//        System.out.println(user.firstName);
        Class<? extends User> userClass = user.getClass();
//        Field[] fields = userClass.getDeclaredFields();
//        for (Field field : fields) {
//            System.out.println(field);
//        }
        try {
            Field field = userClass.getDeclaredField("firstName");
            System.out.println(field);
            field.setAccessible(true);
            System.out.println(field.get(user));
            field.set(user, "Petr");
            System.out.println(user);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
}
