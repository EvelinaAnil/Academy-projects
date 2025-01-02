package edu.itstep.polymorphism;

import edu.itstep.inheritance.Circle;
import edu.itstep.inheritance.Rectangle;
import edu.itstep.inheritance.Shape;

public class Main {
    public static void main(String[] args) {
//        System.out.println("1" + 1);
//        System.out.println(1 + 1);

//        Shape[] shapes = new Shape[3];
//        Rectangle rectangle1 = new Rectangle("red", "yellow", 2, 6);
//        Rectangle rectangle2 = new Rectangle("black", "white", 3, 7);
//        Circle circle = new Circle("black", "green", 5);
//        shapes[0] = rectangle1;
//        shapes[1] = rectangle2;
//        shapes[2] = circle;
//        for (Shape shape : shapes) {
//            System.out.println(shape);
//        }

        Shape[] shapes = new Shape[]{
                new Rectangle("red", "yellow", 2, 6),
                new Rectangle("black", "white", 3, 7),
                new Circle("black", "green", 5)
        };

//        for (Shape shape : shapes) {
//            System.out.println(shape);
//        }

        double sum = 0;
        for (Shape shape : shapes) {
            sum += shape.calcArea();
        }
        System.out.println(sum);

    }
}
