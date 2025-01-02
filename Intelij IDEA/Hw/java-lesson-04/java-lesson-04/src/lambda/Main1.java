package lambda;

public class Main1 {
    public static void main(String[] args) {
//        Formatter formatter = (st) -> "<<<_" + st + "_>>>";
//        System.out.println(formatter.format("KING"));

        Formatter formatter = new Formatter() {
            @Override
            public String format(String string) {
                return "<<<_" + string + "_>>>";
            }

            @Override
            public String format(String first, String second) {
                return "<<<_" + first + "-" + second + "_>>>";
            }
        };

        System.out.println(formatter.format("KING"));
        System.out.println(formatter.format("KING", "KONG"));

    }
}
