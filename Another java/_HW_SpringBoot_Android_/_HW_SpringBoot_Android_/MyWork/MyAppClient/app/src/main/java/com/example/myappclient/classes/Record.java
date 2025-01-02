package com.example.myappclient.classes;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Record {
    @Expose
    @SerializedName("id")
    private int id;
    @Expose
    @SerializedName("recordName")
    private String recordName;
    @Expose
    @SerializedName("description")
    private String description;

    @Expose
    @SerializedName("user")
    private User user;

    public Record(String recordName, String description, User user) {
        this.recordName = recordName;
        this.description = description;
        this.user = user;
    }

    public Record(String recordName, String description) {
        this.recordName = recordName;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRecordName() {
        return recordName;
    }

    public void setRecordName(String recordName) {
        this.recordName = recordName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Record{" +
                "id=" + id +
                ", recordName='" + recordName + '\'' +
                ", description='" + description + '\'' +
                ", user=" + user +
                '}';
    }
}
