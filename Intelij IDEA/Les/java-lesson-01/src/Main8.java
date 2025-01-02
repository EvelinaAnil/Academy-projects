public class Main8 {
    public static void main(String[] args) {

//        System.out.println(1 + 1);
//        System.out.println("1" + "1");
//        System.out.println(1 + "1");
//        System.out.println(true + "1");
//        System.out.println(1 + 1 + "1"); //21
//        System.out.println("1"+ (1 + 1)); //12
//        System.out.println("1"+ 1 + 1); //111

        //
//        int number =7;
//        number = number +3;
//        number +=3;
//        System.out.println(number); //13

//        int count = 1;
//        int res = count++;
//        System.out.println(res);
//        // постфиксна форма возврашает старое значение count
//        System.out.println(count);

        int count =1;       //1    + 2   +   4
        System.out.println(count++ + count++ + ++count);
        System.out.println(count); //4
        count =1;
        count +=6;
        System.out.println(count);


    }
}
