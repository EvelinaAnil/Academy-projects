package reflection;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class Main3 {
    public static void main(String[] args) {
        try {
            Constructor constructor = User.class.getDeclaredConstructor(String.class);
            constructor.setAccessible(true);
           User user = (User) constructor.newInstance("Ivanov");
            System.out.println(user);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

    }
}
