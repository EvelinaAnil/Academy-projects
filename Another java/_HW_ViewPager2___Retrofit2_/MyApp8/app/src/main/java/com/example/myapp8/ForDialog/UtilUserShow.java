package com.example.myapp8.ForDialog;

public class UtilUserShow {
    private int id;
    private String username;
    private String phone;
    private String city;

    public UtilUserShow(int id, String username, String phone, String city) {
        this.id = id;
        this.username = username;
        this.phone = phone;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
}
