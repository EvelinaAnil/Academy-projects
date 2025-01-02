package edu.itstep.OOP.types;

import java.util.Arrays;

public class Main3 {
    public static void main(String[] args) {
        int[][]arr = {
                {1,2,3},
                {6,8,9,9}
        };
//        System.out.println(arr.length);
//        System.out.println(arr[0].length);
//        System.out.println(arr[1].length);
//        System.out.println(arr);
//        System.out.println(arr[0]);
//        System.out.println(arr[1]);

//        System.out.println(arr[1][1]);

//        for (int i = 0; i < arr.length; i++) {
//            for (int j = 0; j < arr[i].length; j++) {
//                System.out.println(arr[i][j]+ " ");
//            }
//            System.out.println();
//        }


        //System.out.println(Arrays.toString(arr));

//        for (int[] inner : arr) {
//            for (int i : inner) {
//                System.out.println(i + " ");
//            }
//            System.out.println();
//        }

        for (int[] innerArr : arr) {
            System.out.println(Arrays.toString(innerArr));
        }

    }
}
