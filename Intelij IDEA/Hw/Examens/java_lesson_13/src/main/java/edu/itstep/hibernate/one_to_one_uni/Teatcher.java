package edu.itstep.hibernate.one_to_one_bi;

import jakarta.persistence.*;

@Entity
@Table(name = "teatchers")
public class Teatcher {
    @Id
    @Column(name = "")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column
    private int age;
    @Column
    private String phone;
    @Column
    private String email;
    @Column
    private String skills;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_teachers_full_info")
    private TeatcherFullInfo teatcherFullInfo;

    public Teatcher(String firstName, String lastName, int age, String phone, String email, String skills) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
        this.email = email;
        this.skills = skills;
    }

    public Teatcher() {
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age =age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public TeatcherFullInfo getTeatcherFullInfo() {
        return teatcherFullInfo;
    }

    public void setTeatcherFullInfo(TeatcherFullInfo teatcherFullInfo) {
        this.teatcherFullInfo = teatcherFullInfo;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", age='" + age + '\'' +
                ", phone='" + phone + '\'' +
                ", skills='" + skills + '\'' +
                ", userFullInfo=" + teatcherFullInfo +
                '}';
    }
}
