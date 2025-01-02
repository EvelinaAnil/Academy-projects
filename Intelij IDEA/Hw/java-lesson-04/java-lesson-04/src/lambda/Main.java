package lambda;

public class Main {
    public static void main(String[] args) {
//        Calculator calculator = new Calculator() {
//            @Override
//            public double execute(double a, double b) {
//                return a * b;
//            }
//        };
//        System.out.println(calculator.execute(3, 3));

//        Calculator calculator = (a, b) -> a * b;
//        System.out.println(calculator.execute(3, 3));
//        System.out.println(calculator);

//        calc(new Calculator() {
//            @Override
//            public double execute(double a, double b) {
//                return a * b;
//            }
//        });
//        calc((a, b) -> a + b);

//        Calculator calculator = (x, y) -> {
//            int first = 1;
//            int second = 2;
//            return first + second;
//        };

        Calculator calculator = (x, y) -> x + y;


    }

    public static void calc(Calculator calculator) {
        double a = 2;
        double b = 7;
        System.out.println(calculator.execute(a, b));
    }

}
