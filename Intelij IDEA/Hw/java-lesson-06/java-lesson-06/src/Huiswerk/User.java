package Huiswerk;

public class User {

    private String fullName;
    private int age;
    private String gender;
    private String email;
    private String country;

    // Конструктор
    public User(String fullName, int age, String gender, String email, String country) {
        this.fullName = fullName;
        this.age = age;
        this.gender = gender;
        this.email = email;
        this.country = country;
    }

    // Геттеры и сеттеры
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    // Метод toString для отображения информации о пользователе
    @Override
    public String toString() {
        return "User{" +
                "fullName='" + fullName + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}
