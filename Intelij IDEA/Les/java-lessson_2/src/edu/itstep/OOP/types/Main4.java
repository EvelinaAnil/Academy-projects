package edu.itstep.OOP.types;

import java.util.Arrays;

public class Main4 {
    public static void main(String[] args) {
        String[] strings1 = {"one","two","three"};
        String[] strings2 = new String[2];
        strings2[0] ="one";
        strings2[1] ="two";
        String[] strings = new String[]{"one","two"};

        String[] strings3 = {"one","two","three"};
        print(strings3);
        System.out.println();
        print(new String[]{"one","two"});


    }

    public static void print(String[] strings){
        System.out.println(Arrays.toString(strings));
    }
}
