package anonymous;

public class Outer {
    private int instanceVariable = 1;
    private static int staticVariable = 1;

    Worker worker1 = new Worker() {
        @Override
        public void work() {
            System.out.println(instanceVariable);
        }
    };

    static Worker worker2 = new Worker() {
        @Override
        public void work() {
            //System.out.println(instanceVariable);
            System.out.println(staticVariable);
        }
    };


    public void outerMethod(){
        int localVariable = 1;
        Worker anonymous = new Worker() {
            @Override
            public void work() {
                System.out.println(instanceVariable);
                System.out.println(localVariable);
                instanceVariable = 2;
                //localVariable = 2;
            }
        };

        Worker lambda = () -> {
            System.out.println(instanceVariable);
            System.out.println(localVariable);
            instanceVariable = 2;
            //localVariable = 2;
        };
    }
}
