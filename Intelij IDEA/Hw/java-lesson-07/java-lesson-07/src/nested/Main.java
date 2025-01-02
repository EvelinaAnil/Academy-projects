package nested;

public class Main {
    public static void main(String[] args) {
//        Outer outer = new Outer();
        Outer.Nested nested = new Outer.Nested();
        nested.nestedMethod();
    }
}
