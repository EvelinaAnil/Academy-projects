package inner;

public class Outer {
    private String outerPrivateField = "outerPrivateField";
    public String outerPublicField = "outerPublicField";
    public String test = "outer";
    private static String outerStatic = "outerStatic";
    public Outer(){
        System.out.println("Outer");
    }
    public void outerMethod(){
//        System.out.println(innerPrivateField);//-
//        System.out.println(innerPublicField);//-

//        Inner inner = new Inner();
//        System.out.println(inner.innerPublicField);//+
//        System.out.println(inner.innerPrivateField);//? +

        System.out.println(Inner.innerStatic);
    }

    public class Inner {//отримує this від зовнішнього класу
        private String innerPrivateField = "innerPrivateField";
        public String innerPublicField = "innerPublicField";
        public String test = "inner";
        private static String innerStatic = "innerStatic";


        public void innerMethod(){
//            System.out.println(outerPublicField);//+
//            System.out.println(outerPrivateField);//+

//            Outer outer = new Outer();
//            System.out.println(outer.outerPublicField);//+
//            System.out.println(outer.outerPrivateField);//+

//            System.out.println(test);//inner
//            System.out.println(Outer.this.test);//outer

            System.out.println(outerStatic);
        }

        public Inner(){
            System.out.println("Inner");
        }
    }
}
