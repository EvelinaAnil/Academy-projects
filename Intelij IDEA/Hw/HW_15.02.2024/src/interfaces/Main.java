package interfaces;

public class Main {
    public static void main(String[] args) {
//        Cook cook;
//        System.out.println(Cook.SPEED);

//        Man man = new Man("Rik");
//        man.cook();


//        Cook cook;
//        cook = new Man("Pedro","right");
//        cook.cook();
//        cook = new Woman();
//        cook.cook();

//        commander(new Man("Pedro2","left"),
//                new Man("Pedro","right"));

//        chef(
//                new Man("Pedro","right"),
//                new Woman()
//        );

        //Cook.test1();


    }


    public  static  void commander(Soldier... soldiers){
        System.out.println("Ready! GO!");
        for (Soldier soldier : soldiers){
            soldier.shoot();
        }
    }

    public static  void chef(Cook... cooks){
        System.out.println("Ready! COOK!");
        for (Cook cook : cooks){
            cook.cook();
        }
        for (Cook cook : cooks){
            cook.peelPotatoes();
        }
    }
}
