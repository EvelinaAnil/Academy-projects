package com.example.myapp9_2;

import android.app.Application;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.room.Room;

import java.util.List;

public class App extends Application {
    private static App app;
    private PhoneBookDB phoneBookDB;
    private ContactDAO contactDAO;


    @Override
    public void onCreate() {
        super.onCreate();
        app = this;
        phoneBookDB = Room.databaseBuilder(
                this,
                PhoneBookDB.class,
                "PhoneBook"
        ).allowMainThreadQueries().build();
        contactDAO = phoneBookDB.contactDAO();
    }

    public static App getInstance() {
        return app;
    }

    public ContactDAO getContactDAO() {
        return contactDAO;
    }

    public RecycleViewAdapter SetDataToAdapter(){
        List<Contact> contacts = contactDAO.getAll();
        RecycleViewAdapter recycleViewAdapter = new RecycleViewAdapter(contacts);
        return recycleViewAdapter;
    }
}
