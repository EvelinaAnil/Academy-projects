package statics;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private static int counter;

    public User(String firstName, String lastName) {
        this.id = ++counter;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }

    public static int getCounter() {
        return counter;
    }
}
