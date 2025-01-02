package edu.itstep.hibernate.single;

import jakarta.persistence.*;

@Entity
@Table(name = "employees")
public class Employee {
    @Id
    @Column(name = "")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column
    private String phone;
    @Column
    private String skills;
    @Column(name = "salary")
    private int salary;
    public Employee(String firstName, String lastName, String phone, String skills, int salary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.skills = skills;
        this.salary = salary;
    }
    public Employee() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getskills() {
        return skills;
    }

    public void setskills(String skills) {
        this.skills = skills;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", skills='" + skills + '\'' +
                ", salary=" + salary +
                '}';
    }
}
