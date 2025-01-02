
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package edu.itstep.hibernate.one_to_one_bi;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(
        name = "teatchers"
)
public class Teatcher {
    @Id
    @Column(
            name = ""
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private int id;
    @Column(
            name = "first_name"
    )
    private String firstName;
    @Column(
            name = "last_name"
    )
    private String lastName;
    @Column
    private int age;
    @Column
    private String phone;
    @Column
    private String email;
    @Column
    private String skills;
    @OneToOne(
            cascade = {CascadeType.ALL}
    )
    @JoinColumn(
            name = "id_teachers_full_info"
    )
    private TeatcherFullInfo teatcherFullInfo;

    public Teatcher(String firstName, String lastName,int age, String phone,String email, String skills) {
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
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSkills() {
        return this.skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public TeatcherFullInfo getTeatcherFullInfo() {
        return this.teatcherFullInfo;
    }

    public void setTeatcherFullInfo(TeatcherFullInfo teatcherFullInfo) {
        this.teatcherFullInfo = teatcherFullInfo;
    }

    public String toString() {
        return "Teatcher{id=" + this.id + ", firstName='" + this.firstName + '\'' + ", lastName='" + this.lastName + '\'' +"age='" + this.age +'\'' +  ", phone='" + this.phone + '\''+   ", email='" + email + '\'' + ", skills='" + this.skills + '\'' + ", teatcherFullInfo=" + this.teatcherFullInfo + '}';
    }
}
