package interfaces;

public interface Soldier {
    int SPEED = 5;
    void shoot();

    default void go(){
        System.out.println("work 1");
    }


}
