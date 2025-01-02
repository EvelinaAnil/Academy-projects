package practice;

public class User {
    private String firstName;
    private String lastName;
    private String phone;
    private String email;

    // Private constructor to be used by the builder
    private User(String firstName, String lastName, String phone, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    // Builder class
    public static class Builder {
        private String firstName;
        private String lastName;
        private String phone;
        private String email;

        public Builder(String firstName, String lastName) {
            this.firstName = firstName;
            this.lastName = lastName;
        }

        public Builder phone(String phone) {
            this.phone = phone;
            return this;
        }

        public Builder email(String email) {
            this.email = email;
            return this;
        }

        public User build() {
            // Validate if required fields are set
            // You can add additional validation logic here

            return new User(firstName, lastName, phone, email);
        }
    }

}
