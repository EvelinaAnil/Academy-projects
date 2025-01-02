package edu.itstep.hibernate.one_to_one_bi;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class App {
    public static void main(String[] args) {
        SessionFactory sessionFactory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Teacher.class)
                .addAnnotatedClass(TeacherFullInfo.class)
                .buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        //CREATE
//        User user = new User(
//                "Ivan",
//                "Ivanov",
//                "+38-066-666-66-66",
//                "DEVELOPER"
//        );
//        UserFullInfo userFullInfo = new UserFullInfo(
//                "ivanov@gmail.com",
//                "Ukraine",
//                "Lviv",
//                "Bandera 143 34",
//                true,
//                "1990/11/23",
//                2
//        );
//        user.setUserFullInfo(userFullInfo);
//        User user = new User(
//                "Petr",
//                "Petrov",
//                "+38-066-777-77-77",
//                "DEVELOPER"
//        );
//        UserFullInfo userFullInfo = new UserFullInfo(
//                "petrov@gmail.com",
//                "Ukraine",
//                "Lviv",
//                "Peremoga 456 12",
//                true,
//                "1993/03/28",
//                1
//        );
//        user.setUserFullInfo(userFullInfo);
//
//        session.persist(user);

        //READ
//        User user = session.get(User.class, 2);
//        System.out.println(user.getLastName());
//        System.out.println(user.getUserFullInfo().getAddress());

//        UserFullInfo userFullInfo = session.get(UserFullInfo.class, 2);
//        System.out.println(userFullInfo);

        //UPDATE
//        User user = session.get(User.class, 2);
//        user.setPhone("+38-066-999-999-99");
//        user.getUserFullInfo().setMarried(false);

        //DELETE
//        User user = session.get(User.class, 2);
//        session.remove(user);

        session.getTransaction().commit();
    }
}
