package nested;

public class Outer {
    private String outerPrivateField = "outerPrivateField";
    public String outerPublicField = "outerPublicField";
    public String test = "outer";
    private static String outerStatic = "outerStatic";

    public Outer(){
        System.out.println("Outer");
    }

    public void outerMethod(){
//        System.out.println(nestedPrivateField);//-
//        System.out.println(nestedPublicField);//-

//        Nested nested = new Nested();
//        System.out.println(nested.nestedPublicField);//+
//        System.out.println(nested.nestedPrivateField);//? +

        System.out.println(Nested.nestedStatic);
    }

    public static class Nested{
        private String nestedPrivateField = "nestedPrivateField";
        public String nestedPublicField = "nestedPublicField";
        public String test = "nested";
        private static String nestedStatic = "nestedStatic";

        public Nested(){
            System.out.println("Nested");
        }
        public void nestedMethod(){
//            System.out.println(outerPublicField);//-
//            System.out.println(outerPrivateField);//-

//            Outer outer = new Outer();
//            System.out.println(outer.outerPublicField);//+
//            System.out.println(outer.outerPrivateField);//+
//            System.out.println(outer.test);//outer

//            System.out.println(test);//nested

            System.out.println(outerStatic);
        }
    }
}
