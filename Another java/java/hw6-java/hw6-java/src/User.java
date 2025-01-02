public class User {
    public String fullName;
    public int age;
    public Gender gender;
    public String email;
    public String countryOfLiving;

    public void displayInfo() {
        System.out.println("Full Name: " + fullName);
        System.out.println("Age: " + age);
        System.out.println("Gender: " + gender);
        System.out.println("Email: " + email);
        System.out.println("Country of Living: " + countryOfLiving);
    }
}