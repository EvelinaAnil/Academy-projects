package pactice;

public class User {
    @PrintAllow
    private String firstName;
    @PrintAllow(true)
    private String lastName;
    @PrintAllow(value = false)
    private String email;
    private String phone;

    public User(String firstName, String lastName, String email, String phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }
}
