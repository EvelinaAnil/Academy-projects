package com.example.myappclient.classes;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class UserHelp {
    @Expose
    @SerializedName("login")
    private String login;
    @Expose
    @SerializedName("password")
    private String password;


    public UserHelp(String login, String password) {
        this.login = login;
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
