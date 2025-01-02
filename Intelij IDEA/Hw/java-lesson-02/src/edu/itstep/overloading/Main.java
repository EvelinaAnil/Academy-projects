package edu.itstep.overloading;

public class Main {
    public static void main(String[] args) {
        sum(2, 2);
    }

    public static void sum(int a, int b) {
        System.out.println("first");
    }

    public static void sum(int... a) {
        System.out.println("second");
    }
}
