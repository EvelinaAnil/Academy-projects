package reflection;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.stream.Stream;

public class Main {
    public static void main(String[] args) {
//        int i;
//        User u;
//        Class c;

        //1
//        try {
//           Class<?> class1 = Class.forName("reflection.User");
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
        //2
//        User user = new User("Ivan", "Ivanov");
//        Class<? extends User> class2 =  user.getClass();
        //3
//        System.out.println(int.class);
//        System.out.println(User.class);
//        System.out.println(String.class);
//        Class<User> class3  = User.class;

//        Class<User> classUser = User.class;
//        Method[] methods = classUser.getMethods();
//        for (Method method : methods) {
//            System.out.println(method);
//        }

//        Class<User> classUser = User.class;
//        Method[] methods = classUser.getDeclaredMethods();
//        Stream.of(methods).forEach(System.out::println);

//        Class<User> classUser = User.class;
//        try {
//            Method method = classUser.getDeclaredMethod("privateMethod");
//            //Method method = classUser.getDeclaredMethod("privateMethod", String.class, int.class);
//            System.out.println(method);
//        } catch (NoSuchMethodException e) {
//            e.printStackTrace();
//        }

        Class<User> classUser = User.class;
        Constructor[] constructors = classUser.getDeclaredConstructors();
        for (Constructor constructor : constructors) {
            System.out.println(constructor);
        }
    }
}
