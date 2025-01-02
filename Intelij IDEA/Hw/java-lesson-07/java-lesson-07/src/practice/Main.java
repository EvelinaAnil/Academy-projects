package practice;

public class Main {
    public static void main(String[] args) {
//        ForwardList forwardList = new ForwardList();
//
//        forwardList.addFront(4);
//        forwardList.addFront(3);
//        forwardList.addFront(2);
//        forwardList.addFront(1);
//
//        forwardList.display();

//        Node node = new Node(77);
//        node.data = 22;
//        node.next = new Node(33);


//        User user1 = new User("Ivan", "Ivanov", "666", null);
//        User user2 = new User("Ivan", "Ivanov", null, "ivan@gmail.com");
//        User user3 = new User("Ivan", "Ivanov");
//        User user4 = new User();
//        user4.setFirstName("Ivan");
//        user4.setLastName("Ivanov");
//        user4.setPhone("666");

        // Using the builder to create a User object
        User user = new User.Builder("John", "Doe")
                .phone("1234567890")
                .email("john.doe@example.com")
                .build();

        // Accessing the User object
        System.out.println("First Name: " + user.getFirstName());
        System.out.println("Last Name: " + user.getLastName());
        System.out.println("Phone: " + user.getPhone());
        System.out.println("Email: " + user.getEmail());

    }
}
