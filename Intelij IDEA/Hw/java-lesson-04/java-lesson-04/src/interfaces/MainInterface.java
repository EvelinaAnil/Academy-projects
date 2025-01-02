package interfaces;

@FunctionalInterface
interface StringToIntParser {
    int parse(String s);
}

public interface MainInterface extends First, Second{
    public static void main(String[] args) {

        StringToIntParser parser = Integer::parseInt;
        int number = parser.parse("123");
        System.out.println("Число: " + number);

    }


}
