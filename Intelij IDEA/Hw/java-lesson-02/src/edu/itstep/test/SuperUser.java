package edu.itstep.test;

import edu.itstep.oop.User;

public class SuperUser extends User {
    public SuperUser(){
        System.out.println(publicField);
        //System.out.println(privateField);
        //System.out.println(packagePrivate);
        System.out.println(protectedField);
    }
}
