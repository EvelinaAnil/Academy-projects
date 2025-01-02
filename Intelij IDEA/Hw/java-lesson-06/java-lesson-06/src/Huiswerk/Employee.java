package Huiswerk;

public class Employee extends User {
    private double salary;
    private String position;
    private String department;
    private Address address;

    // Конструктор
    public Employee(String fullName, int age, String gender, String email, String country,
                    double salary, String position, String department, Address address) {
        super(fullName, age, gender, email, country);
        this.salary = salary;
        this.position = position;
        this.department = department;
        this.address = address;
    }

    // Геттеры и сеттеры
    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    // Метод toString для отображения информации о сотруднике
    @Override
    public String toString() {
        return "Employee{" +
                "fullName='" + getFullName() + '\'' +
                ", age=" + getAge() +
                ", gender='" + getGender() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", country='" + getCountry() + '\'' +
                ", salary=" + salary +
                ", position='" + position + '\'' +
                ", department='" + department + '\'' +
                ", address=" + address +
                '}';
    }


}
