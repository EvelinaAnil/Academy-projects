package edu.itstep.hibernate.one_to_one_bi;

import jakarta.persistence.*;

@Entity
@Table(name = "teachers_full_info")
public class TeatcherFullInfo {
    @Id
    @Column(name = "")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String email;
    @Column
    private String country;
    @Column
    private String city;
    @Column
    private String address;
    @Column(name = "is_married")
    private boolean isMarried;
    @Column(name = "date_of_birth")
    private String dateOfBirth;
    @Column(name = "count_children")
    private int countChildren;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "teatcherFullInfo")
    private Teatcher teacher;


    public TeatcherFullInfo(String email, String country, String city, String address, boolean isMarried, String dateOfBirth, int countChildren) {
        this.email = email;
        this.country = country;
        this.city = city;
        this.address = address;
        this.isMarried = isMarried;
        this.dateOfBirth = dateOfBirth;
        this.countChildren = countChildren;
    }

    public TeatcherFullInfo() {
    }

    public Teatcher getTeatcher() {
        return teacher;
    }

    public void setTeatcher(Teatcher teacher) {
        this.teacher = teacher;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isMarried() {
        return isMarried;
    }

    public void setMarried(boolean married) {
        isMarried = married;
    }

    public String isDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getCountChildren() {
        return countChildren;
    }

    public void setCountChildren(int countChildren) {
        this.countChildren = countChildren;
    }

    @Override
    public String toString() {
        return "TeatcherFullInfo{" +
                "id=" + id +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", address='" + address + '\'' +
                ", isMarried=" + isMarried +
                ", dateOfBirth=" + dateOfBirth +
                ", countChildren=" + countChildren +
                '}';
    }
}
