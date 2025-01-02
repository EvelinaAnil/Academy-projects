package lambda_vs_anonymous;

public class Controller {
    public void start(){
        Printer printerAnonymous = new Printer() {
            @Override
            public void print() {
                System.out.println("printerAnonymous: " + this);
                System.out.println("printerAnonymous: " + Controller.this);
            }
        };

        Printer printerLambda = () -> {
            System.out.println("printerLambda: " + this);
        };

        printerAnonymous.print();
        printerLambda.print();
    }

    public static void main(String[] args) {
        Controller controller = new Controller();
        System.out.println(controller);
        controller.start();
    }
}
