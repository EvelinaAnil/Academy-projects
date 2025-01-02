package interfaces;

public class Woman implements Cook{
    @Override
    public void cook() {
        System.out.println("Швидко і смачно готую");
    }

    @Override
    public void peelPotatoes() {
        System.out.println("Чищу картоплю зі швидкістю: " + SPEED);
    }
}
