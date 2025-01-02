public class Main9 {
    public static void main(String[] args) {
//        int number = 1;
//        String result;
//        if(number >= 0){
//            result = "pos";
//        }
//        else{
//            result = "neg";
//        }
//        System.out.println(result);


        int number =1;
        String result = number >= 0 ? "positive" : returnNegative();

    }

    public static String returnNegative(){
        return "negative";
    }
}
