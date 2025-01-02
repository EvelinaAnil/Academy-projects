package com.example.myapp5;

import java.util.ArrayList;
import java.util.List;

public class ContactApi {
    public static int amountContacts = 0;
    private static List<Contact> contacts = new ArrayList<>();

    public static void init() {
        contacts.add(new Contact(++amountContacts, R.drawable.icon, "Ivan", "Ivanov", "12374", "ivan@gmailc.com"));
        contacts.add(new Contact(++amountContacts, R.drawable.icon,"Petr", "Petrov", "954432", "petr@gmailc.com"));
        contacts.add(new Contact(++amountContacts, R.drawable.icon,"Andrey", "Andrey", "10374", "andrey@gmailc.com"));

    }

    public static void AddContact(Contact contact){
        contacts.add(contact);
    }
    public static List<Contact> getContacts() {
        return contacts;
    }
}
