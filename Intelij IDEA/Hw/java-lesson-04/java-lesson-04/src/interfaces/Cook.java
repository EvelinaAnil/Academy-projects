package interfaces;



public interface Cook {
    //public static final int speed = 1;
    int SPEED = 1;
    void cook();

    default void peelPotatoes(){
        System.out.println("Чищу картоплю зі швидкістю: " + SPEED);
    }

    static void test1(){
        System.out.println("public static method");
    }
    private static void test2(){
        System.out.println("private static method");
    }
    default void go(){
        System.out.println("work 2");
    }

}
