package com.example.myappdz;

public class UtilUserShow {
    private String name;
    private String username;
    private String email;
    private String phone;
    private String city;
    private String companyName;

    public UtilUserShow(String name, String username, String email, String phone, String city, String companyName) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.city = city;
        this.companyName = companyName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}
