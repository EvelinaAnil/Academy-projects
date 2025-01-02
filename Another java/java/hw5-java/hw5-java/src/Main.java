public class Main {
    public static void main(String[] args) {
        MyArrayList<Integer> arrInt = new MyArrayList<>();
        arrInt.add(1);
        arrInt.add(2);
        arrInt.add(3);
        arrInt.addToHead(6);
        arrInt.addToHead(5);
        arrInt.removeFirst();
        arrInt.removeLast();
        arrInt.print();

        MyArrayList<String> arrString = new MyArrayList<>();
        arrString.add("Hello");
        arrString.add("World");
        arrString.add("!!!");
        arrString.removeFirst();
        arrString.print();
    }
}