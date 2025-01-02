package edu.itstep.OOP.types;

import java.util.Scanner;

public class Main5 {
    public static void main(String[] args) {
        //String
//        String st = "Hello World";
//        System.out.println(st);//Ctr+P
//        System.out.println(st.toString());

//        int[]arr ={1,2,3};
//        System.out.println(arr);

//        char[] chars = {'a','b','c'};
//        System.out.println(chars);

//        int[]a = {1,1,1};
//        int[]b = {1,1,1};
//        System.out.println(a==b);
//        System.out.println(a);

//        String a = new String("nwm");
//        String b = new String("nwm");
//        System.out.println(a == b);

//        String a= "nwm";
//        String b = "nwm";
//        System.out.println(a == b);

        Scanner sanner = new Scanner(System.in);
        String a = sanner.nextLine();
        String b = sanner.nextLine();
        System.out.println(a == b);
        System.out.println(a.equals(b));

//        String password = "abc";
//        Scanner scanner = new Scanner(System.in);
//        String userInput = scanner.nextLine();
//        System.out.println(password == userInput);


    }
}
