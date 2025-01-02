package interfaces;

public interface Cook {

    int SPEED =1;

     void  cook();

     default void peelPotatoes(){
         System.out.println("Clean potatoes with "+ SPEED+" speed!");
     }

     public   static void test1(){
         System.out.println(" public  static method");
     }

    private  static void test2(){
        System.out.println(" private  static method");
    }

    default void go1(){
        System.out.println("work 2");
    }
}
