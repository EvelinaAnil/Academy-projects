package pactice;

import java.lang.reflect.Field;

public class Main {
    public static void main(String[] args) {
        User user = new User("Ivan", "Ivanov", "ivanov@gmail.com", "33-33-33");
        print(user);
    }

    /**
     *Print info about fields object
     *This method uses annotation PrintAllow
     * @param object
     */
    public static void print(Object object){
        Class<?> classObject = object.getClass();
        Field[] fields = classObject.getDeclaredFields();
        for (Field field : fields) {
            PrintAllow printAllow = field.getAnnotation(PrintAllow.class);
            if (printAllow == null) {
                continue;
            }
            if (printAllow.value()) {
                field.setAccessible(true);
                try {
                    System.out.println(field.getName() + ": " + field.get(object));
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println(field.getName() + ": blocked for print");
            }
        }
    }
}
