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
//        userFullInfo.setUser(user);
//
//        session.persist(userFullInfo);

        //READ
//        User user = session.get(User.class, 3);
//        System.out.println(user.getLastName());
//        System.out.println(user.getUserFullInfo().getAddress());

//        UserFullInfo userFullInfo = session.get(UserFullInfo.class, 3);
//        System.out.println(userFullInfo.getCity());
//        System.out.println(userFullInfo.getUser().getLastName());

        //UPDATE
//        UserFullInfo userFullInfo = session.get(UserFullInfo.class, 3);
//        userFullInfo.getUser().setDepartment("DESIGNER");

        //DELETE
        TeatcherFullInfo teatcherFullInfo = session.get(TeatcherFullInfo.class, 3);
        session.remove(TeatcherFullInfo);

        session.getTransaction().commit();
    }
}
