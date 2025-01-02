package interfaces;

public class Man extends Thread implements Cook, Soldier {
    private String name;
    private String hand;

    public Man(String name, String hand) {
        this.name = name;
        this.hand = hand;
    }

    @Override
    public void cook() {
        System.out.println("Смачно готую!");
    }

//    @Override
//    public void peelPotatoes() {
//        System.out.println("Чищу картоплю зі швидкістю: " + SPEED);
//    }

    @Override
    public void shoot() {
        System.out.println("Cтріляю рукой " + hand);
    }
    void printSpeed(){
        //System.out.println(SPEED);
        System.out.println(Cook.SPEED);
        System.out.println(Soldier.SPEED);
    }

    @Override
    public void go(){
//        Cook.super.go();
//        Soldier.super.go();
    }
}
