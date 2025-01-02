package practice;

public class ForwardList {
    private Node head;

    public ForwardList() {
        this.head = null;
    }

    // Method to add an element at the front of the list
    public void addFront(int data) {
        Node newNode = new Node(data);
        newNode.next = head;
        head = newNode;
    }

    // Method to display the elements in the forward list
    public void display() {
        Node current = head;
        System.out.println("Forward List Elements:");
        while (current != null) {
            System.out.println(current.data);
            current = current.next;
        }
    }

   private static class Node {
        int data;
        Node next;

        public Node(int data) {
            this.data = data;
            this.next = null;
        }
    }
}

