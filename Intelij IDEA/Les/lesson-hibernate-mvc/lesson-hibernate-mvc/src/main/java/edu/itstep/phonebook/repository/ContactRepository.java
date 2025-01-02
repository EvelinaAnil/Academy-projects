package edu.itstep.phonebook.repository;

import edu.itstep.phonebook.entity.Contact;

import java.util.List;

public interface ContactRepository {
    List<Contact>getAll();

    void saveOrUpdate(Contact contact);

    void deleteById(int id);

    Contact getById(int id);
}
