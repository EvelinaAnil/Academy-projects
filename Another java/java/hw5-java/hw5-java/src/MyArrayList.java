public class MyArrayList<T> {
    private int size;
    private Object[] mainArr = new Object[size];

    public void add(T value) {
        Object[] tempArr = new Object[size + 1];
        for (int i = 0; i < size; i++) {
            tempArr[i] = mainArr[i];
        }
        tempArr[size] = value;
        size++;
        mainArr = tempArr;
    }

    public void addToHead(T value) {
        Object[] tempArr = new Object[size + 1];
        tempArr[0] = value;
        for (int i = 0; i < size; i++) {
            tempArr[i + 1] = mainArr[i];
        }
        size++;
        mainArr = tempArr;
    }

    public void removeLast() {
        if (size == 0) {
            return;
        }
        Object[] tempArr = new Object[size - 1];
        for (int i = 0; i < size - 1; i++) {
            tempArr[i] = mainArr[i];
        }
        size--;
        mainArr = tempArr;
    }

    public void removeFirst() {
        if (size == 0) {
            return;
        }
        Object[] tempArr = new Object[size - 1];
        for (int i = 0; i < size - 1; i++) {
            tempArr[i] = mainArr[i + 1];
        }
        size--;
        mainArr = tempArr;
    }

    public void print() {
        for (Object obj : mainArr) {
            System.out.print(obj + " ");
        }
        System.out.println();
    }

    public int getSize() {
        return size;
    }
}
