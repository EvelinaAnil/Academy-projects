package edu.itstep.phonebook.repository;

import edu.itstep.phonebook.entity.Contact;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class ContactRepositoryImpl implements ContactRepository {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Contact> getAll() {
        return sessionFactory
                .getCurrentSession()
                .createQuery("from Contact", Contact.class)
                .list();
    }

    @Override
    @Transactional
    public void saveOrUpdate(Contact contact) {
        sessionFactory
                .getCurrentSession()
                .saveOrUpdate(contact);

    }

    @Override
    @Transactional
    public void deleteById(int id) {
        sessionFactory
                .getCurrentSession()
                .createQuery("delete from Contact where id = " + id)
                .executeUpdate();
    }

    @Override
    @Transactional
    public Contact getById(int id) {
        return sessionFactory
                .getCurrentSession()
                .get(Contact.class, id);
    }
}
