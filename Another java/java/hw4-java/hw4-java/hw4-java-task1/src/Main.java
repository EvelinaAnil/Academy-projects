public class Main {
    public static void main(String[] args) {
        parse(Integer::parseInt);
    }
    public static void parse(IntegerParser parser){
        String data = "12344";
        int result = parser.parse(data);
        System.out.println(result);
    }
}