package ref;

import lambda.Calculator;

public class CalcSub implements Calculator {
    @Override
    public double execute(double a, double b) {
        return a - b;
    }
}
