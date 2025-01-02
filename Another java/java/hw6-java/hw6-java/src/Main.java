import java.util.*;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) {
        ArrayList<User> users = new ArrayList<User>();
        initUsers(users);
        printUsers(task1(users));
        System.out.println(task2(users));
        printUsers(task3(users, "Київ"));
        System.out.println(task4(users).toString());
        printUsers(task5(users));
        System.out.println(task6(users).toString());
        task7(users);

    }

    public static void initUsers(ArrayList<User> users) {
        Address[] addresses = {
                new Address("Київ", "Вулиця 1", "1", "1"),
                new Address("Харків", "Вулиця 2", "2", "22"),
                new Address("Дніпро", "Вулиця 3", "3", "33"),
        };

        Employee employee1 = new Employee();
        employee1.fullName = "Іван Іванов Іванович";
        employee1.age = 16;
        employee1.gender = Gender.Male;
        employee1.email = "ivanov@gmail.com";
        employee1.countryOfLiving = "Україна";
        employee1.salary = 1000;
        employee1.position = "Розробник";
        employee1.department = "Технічний";
        employee1.address = addresses[0];

        Employee employee2 = new Employee();
        employee2.fullName = "Петро Петров Петрович";
        employee2.age = 35;
        employee2.gender = Gender.Male;
        employee2.email = "petrov@gmail.com";
        employee2.countryOfLiving = "Україна";
        employee2.salary = 1200;
        employee2.position = "Аналітик";
        employee2.department = "Маркетинг";
        employee2.address = addresses[1];

        Employee employee3 = new Employee();
        employee3.fullName = "Марія Іванова Петрівна";
        employee3.age = 17;
        employee3.gender = Gender.Female;
        employee3.email = "maria@gmail.com";
        employee3.countryOfLiving = "Україна";
        employee3.salary = 1500;
        employee3.position = "Розробник";
        employee3.department = "Технічний";
        employee3.address = addresses[2];

        User user1 = new User();
        user1.fullName = "Іван Іванов Іванович";
        user1.age = 30;
        user1.gender = Gender.Male;
        user1.email = "ivanov@gmail.com";
        user1.countryOfLiving = "Україна";

        User user2 = new User();
        user2.fullName = "Петро Петров Петрович";
        user2.age = 35;
        user2.gender = Gender.Female;
        user2.email = "petrov@gmail.com";
        user2.countryOfLiving = "Україна";

        users.add(employee1);
        users.add(employee2);
        users.add(employee3);
        users.add(user1);
        users.add(user2);
    }

    public static void printUsers(ArrayList<User> users) {
        for (User user : users) {
            user.displayInfo();
            System.out.println("\n\n");
        }
    }

    public static ArrayList<User> task1(ArrayList<User> users) {
        return users.stream().filter(user -> !(user instanceof Employee)).collect(Collectors.toCollection(ArrayList::new));
    }

    public static double task2(ArrayList<User> users) {
        return users.stream()
                .filter(user -> user instanceof Employee)
                .mapToDouble(user -> user.age)
                .filter(age -> age < 18)
                .average()
                .orElse(0);
    }

    public static ArrayList<User> task3(ArrayList<User> users, String city) {
        return users.stream()
                .filter(user -> user instanceof Employee)
                .map(user -> (Employee) user)
                .filter(employee -> "Технічний".equals(employee.department))
                .filter(employee -> city.equals(employee.address.city))
                .collect(Collectors.toCollection(ArrayList::new));
    }

    public static Set<String> task4(ArrayList<User> users) {
        return users.stream()
                .filter(user -> user instanceof Employee)
                .map(user -> (Employee) user)
                .filter(employee -> "Дизайн".equals(employee.department))
                .map(employee -> employee.address.city)
                .collect(Collectors.toCollection(HashSet::new));
    }

    public static ArrayList<User> task5(ArrayList<User> users) {
        return users.stream()
                .filter(user -> user.email.endsWith("gmail.com"))
                .collect(Collectors.toCollection(ArrayList::new));
    }

    public static List<String> task6(ArrayList<User> users) {
        return users.stream()
                .filter(user -> user instanceof Employee)
                .map(user -> (Employee) user)
                .filter(employee -> "Україна".equals(employee.countryOfLiving))
                .filter(employee -> "Female".equals(employee.gender.toString()))
                .filter(employee -> employee.age >= 18 && employee.age <= 30)
                .map(employee -> employee.email)
                .collect(Collectors.toList());
    }

    public static void task7(ArrayList<User> users) {
        Map<String, Double> avgByDepartment = new HashMap<>();

        for (User user : users) {
            if (user instanceof Employee) {
                Employee employee = (Employee) user;
                if (!avgByDepartment.containsKey(employee.department)) {
                    avgByDepartment.put(employee.department, (double) employee.salary);
                } else {
                    double currentSalarySum = avgByDepartment.get(employee.department);
                    avgByDepartment.put(employee.department, currentSalarySum + employee.salary);
                }
            }
        }

        System.out.println("Середні зарплати для кожного відділу:");
        for (Map.Entry<String, Double> entry : avgByDepartment.entrySet()) {
            String department = entry.getKey();
            Double totalSalary = entry.getValue();
            int numberOfEmployees = (int) users.stream()
                    .filter(user -> user instanceof Employee)
                    .map(user -> (Employee) user)
                    .filter(employee -> department.equals(employee.department))
                    .count();
            double averageSalary = totalSalary / numberOfEmployees;
            System.out.println("Відділ: " + department + ", Середня зарплата: " + averageSalary);
        }
    }
}