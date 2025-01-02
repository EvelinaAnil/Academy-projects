package interfaces;

import java.sql.SQLOutput;

public  class Man extends Thread implements Cook, Soldier {
    //alt+enter
    private  String name;
    private  String hand;

    public Man(String name, String hand) {
        this.name = name;
        this.hand = hand;
    }


    @Override
    public void cook() {
        System.out.println("Lekker eten!");
    }

//    @Override
//    public void peelPotatoes() {
//        System.out.println("Clean potatoes with "+ SPEED+" speed!");
//    }

    @Override
    public void shoot() {
        System.out.println("Shit!Shoot with "+ hand+" hand!");
    }

    void  printSpeed(){
        System.out.println(Cook.SPEED);
    }

    @Override
    public void go(){
        System.out.println("hello");
    }
}
