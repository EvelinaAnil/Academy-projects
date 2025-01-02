package reflection;

public class User {

    private String firstName;
    public String lastName;

    public User(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    private User(String lastName) {
        this.lastName = lastName;
    }

//    public String getFirstName() {
//        return firstName;
//    }

    private void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    private void privateMethod(){
        System.out.println("private method");
    }

    private void privateMethod(String value1, int value2) {
        System.out.println("private method");
        System.out.println(value1 + value2);
    }
    public static void staticMethod(){
        System.out.println("static method");
    }

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }
}
