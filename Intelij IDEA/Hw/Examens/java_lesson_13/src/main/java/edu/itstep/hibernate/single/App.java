package edu.itstep.hibernate.single;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class App {
    public static void main(String[] args) {
        SessionFactory sessionFactory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Employee.class)
                .buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        //CREATE
//        Employee employee1 = new Employee("Ivan", "Ivanov", "38066-666-66-66", "DEVELOPER", 4000);
//        Employee employee2 = new Employee("Petr", "Petrov", "38066-777-77-77", "DEVELOPER", 4000);
//        Employee employee3 = new Employee("Stepan", "Stepanov", "38066-888-88-88", "DESIGNER", 3000);
//
//        session.persist(employee1);
//        session.persist(employee2);
//        session.persist(employee3);

        //READ
//        Employee employee = session.get(Employee.class, 2);
//        System.out.println(employee);

        List<Employee> employees = session.createQuery("from Employee").getResultList();
        employees.forEach(System.out::println);

//        List<Employee> employees = session.createQuery("from Employee where department = 'DEVELOPER'").getResultList();
//        employees.forEach(System.out::println);

        //UPDATE
//        Employee employee = session.get(Employee.class, 3);
//        System.out.println(employee);
//        employee.setSalary(5000);
//        employee.setPhone("38066-444-44-44");

//        session.createQuery("update Employee set salary = 1000 where firstName = 'Ivan'").executeUpdate();

        //DELETE
//        Employee employee = session.get(Employee.class, 3);
//        session.remove(employee);

//        session.createQuery("delete Employee where salary > 500").executeUpdate();


        session.getTransaction().commit();
    }
}
