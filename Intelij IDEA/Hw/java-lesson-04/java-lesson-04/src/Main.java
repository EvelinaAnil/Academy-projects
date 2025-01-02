public class Main {
    public static void main(String[] args) {
        print(String::toUpperCase);
        print(String::toLowerCase);
    }
    public static void print(Printer printer){
        String data = "Hello World";
        System.out.println(printer.execute(data));
    }
}
