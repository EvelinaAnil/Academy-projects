package edu.itstep.oop;

public class Main {
    public static void main(String[] args) {
        System.out.println("new");
        User user = new User();
//        System.out.println(user.privateField);
        System.out.println(user.packagePrivate);
        System.out.println(user.protectedField);
        System.out.println(user.publicField);
    }
}
