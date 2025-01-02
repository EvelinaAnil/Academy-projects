package interfaces;

public interface Soldier {
    int SPEED = 2;
    void shoot();

    default void go(){
        System.out.println("work 1");
    }
}
