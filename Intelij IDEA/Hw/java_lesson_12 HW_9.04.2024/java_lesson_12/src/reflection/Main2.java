package reflection;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class Main2 {
    public static void main(String[] args) {
        User user = new User("Ivan", "Ivanov");
//        user.privateMethod();
        try {
            Method method = user.getClass().getDeclaredMethod("privateMethod", String.class, int.class);
//            int modifiers = method.getModifiers();
//            System.out.println(Modifier.isPrivate(modifiers));
//            System.out.println(Modifier.isStatic(modifiers));
//            System.out.println(modifiers);
//            System.out.println(method.getReturnType());
            method.setAccessible(true);
            method.invoke(user, "2", 2);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }
}
