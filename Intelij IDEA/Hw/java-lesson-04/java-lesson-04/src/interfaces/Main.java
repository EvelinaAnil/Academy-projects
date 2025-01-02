package interfaces;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        //Cook cook = new Cook();
//        Cook cook;
//        System.out.println(Cook.SPEED);
//        Man man = new Man("Ivan");
//        man.cook();

//        Cook cook = new Man("Ivan");

//        Cook cook;
//        cook = new Man("Ivan", "right");
//        cook.cook();
//        cook = new Woman();
//        cook.cook();

//        commander(
//                new Man("Ivan", "right"),
//                new Man("Petr", "left")
//        );
        // commander(new Woman());

        chef(
                new Man("Ivan", "right"),
                new Woman()
        );

    //Cook.test1();
    }

    public static void commander(Soldier... soldiers) {
        System.out.println("Усім вогонь!");
        for (Soldier soldier : soldiers) {
            soldier.shoot();
        }
    }

    public static void chef(Cook... cooks) {
        System.out.println("Всім працювати!");
        for (Cook cook : cooks) {
            cook.cook();
        }
        for (Cook cook : cooks) {
            cook.peelPotatoes();
        }
    }

    


}
