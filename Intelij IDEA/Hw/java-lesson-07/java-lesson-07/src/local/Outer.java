package local;

public class Outer {
    private String outerField = "outerField";

    public void outerMethod() {
        String localField = "localField";
        class Local {
            public String publicField = "publicField";
            protected String protectedField = "protectedField";
            private String privateField = "privateField";

            private void localMethod(){
                System.out.println(outerField);
                System.out.println(localField);

                outerField = "new field";//TODO чому цю змінну можно змінити?
                //localField = "new field";//TODO чому цю змінну не можно змінити?
                //TODO яким чином можно вийти із ситуації, якщо нам потібно змінювати localField?(1-3 способи)
            }
        }

//        class Child extends Local{
//            public Child(){
//                System.out.println(privateField);
//                System.out.println(protectedField);
//                System.out.println(publicField);
//            }
//        }

        Local local = new Local();
//        System.out.println(local.publicField);
//        System.out.println(local.privateField);
        local.localMethod();
    }

    public static void main(String[] args) {
        Outer outer = new Outer();
        outer.outerMethod();
    }

}
