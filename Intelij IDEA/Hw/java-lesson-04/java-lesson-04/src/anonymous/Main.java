package anonymous;

public class Main {
    public static void main(String[] args) {
//        Parent parent = new Kid();//в змінній лежить посилання на об'єкт класу Child
//        parent.print();
        //parent.methodKid();

        //Kid kid = (Kid) parent;
//        ((Kid) parent).methodKid();

//        Parent parent = new Parent() {////в змінній лежить посилання на об'єкт анонімного класу
//            @Override
//            public void print() {
//                System.out.println("I'm anonymous");
//                //anonymousMethod();
//            }
//
//            public void anonymousMethod() {
//                System.out.println("anonymousMethod");
//            }
//        };
//        parent.print();
        //parent.anonymousMethod();

//        new Parent() {////в змінній лежить посилання на об'єкт анонімного класу
//            @Override
//            public void print() {
//                System.out.println("I'm anonymous");
//                //anonymousMethod();
//            }
//
//            public void anonymousMethod() {
//                System.out.println("anonymousMethod");
//            }
//        }.anonymousMethod();

//        var anonymous = new Parent() {
//            @Override
//            public void print() {
//                System.out.println("I'm anonymous");
//                //anonymousMethod();
//            }
//
//            public void anonymousMethod() {
//                System.out.println("anonymousMethod");
//            }
//        };
//        System.out.println(anonymous);
//        anonymous.anonymousMethod();

        Soldier soldier = new Soldier() {
            @Override
            public void shoot() {
                System.out.println("test");
            }
        };
        soldier.shoot();

    }
}
