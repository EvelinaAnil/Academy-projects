package inner;

public class Main {
    public static void main(String[] args) {
//        Outer outer = new Outer();
//        //Inner inner = new Inner();
//
//        Outer.Inner inner1 = outer.new Inner();
//        Outer.Inner inner2 = outer.new Inner();

        Outer.Inner inner3 = new Outer().new Inner();
        inner3.innerMethod();
    }
}
