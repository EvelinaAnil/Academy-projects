package nested;

import org.w3c.dom.ls.LSOutput;

public class Outer_01 {
    private String outerPrivateField = "outerPrivateField";
    public String outerPublicField = "outerPublicField";
    public String test = "inner";
    private static String outerStatic = "outerStatic";

    public Outer_01(){
        System.out.println("Outer");
    }

    public  void outerMethod(){
        System.out.println(outerPublicField);//+
            System.out.println(outerPrivateField);//+

        Nested nested = new Nested();
        System.out.println(nested.nestedPrivateField);
        System.out.println(nested.nestedPublicField);
    }


    public static class Nested{
        private String nestedPrivateField = "nestedPrivateField";
        public String nestedPublicField = "nestedPublicField";
        public String test = "nested";
        private static String nestedStatic = "nestedStatic";

        public Nested(){
            System.out.println("Nested");
        }

        public  void nestedMethod(){
            System.out.println(nestedPublicField);//+
            System.out.println(nestedPrivateField);//+

            Outer outer = new Outer();
            System.out.println(outer.outerPublicField);
            System.out.println(outer.outerPublicField);
            System.out.println(outer.test);

            System.out.println(test);//nested
        }
    }


}
