package ref;

import lambda.Calculator;

public class CalcSum implements Calculator {
    @Override
    public double execute(double a, double b) {
        return a + b;
    }
}
