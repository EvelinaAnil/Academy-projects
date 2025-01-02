package interfaces;

public class Woman implements Cook{
    @Override
    public void cook() {
        System.out.println("Lekkere en snel eten Vrouw!");
    }

    @Override
    public void peelPotatoes() {
        System.out.println("Clean potatoes with "+ SPEED+" speed!");
    }
}
