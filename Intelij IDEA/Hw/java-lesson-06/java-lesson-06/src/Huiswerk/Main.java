package Huiswerk;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.OptionalDouble;
import java.util.Set;
import java.util.Map;


    public class Main {
        public static void main(String[] args) {
            // Создание списка пользователей и сотрудников
            ArrayList<User> users = new ArrayList<>();
            users.add(new User("John Smith", 30, "Male", "john.smith@example.com", "USA"));
            users.add(new User("Alice Johnson", 25, "Female", "alice.johnson@example.com", "UK"));
            users.add(new Employee("Jane Doe", 28, "Female", "jane.doe@example.com", "Ukraine",
                    50000, "Software Engineer", "IT Department", new Address("Kyiv", "Main St", "10", "101")));
            users.add(new Employee("Tom Harris", 17, "Male", "tom.harris@example.com", "Ukraine",
                    20000, "Junior Developer", "IT Department", new Address("Kyiv", "Main St", "10", "102")));
            users.add(new Employee("Emma Brown", 35, "Female", "emma.brown@gmail.com", "Ukraine",
                    70000, "Designer", "Design Department", new Address("Kyiv", "Main St", "11", "201")));

            // 1. Получить новый ArrayList только с пользователями (User, а не Employee)
            List<User> userList = users.stream()
                    .filter(user -> !(user instanceof Employee))
                    .collect(Collectors.toList());
            System.out.println("Users only:");
            userList.forEach(System.out::println);

            // 2. Получить средний возраст среди несовершеннолетних сотрудников
            OptionalDouble averageAgeOfMinors = users.stream()
                    .filter(user -> user instanceof Employee && user.getAge() < 18)
                    .mapToInt(User::getAge)
                    .average();
            averageAgeOfMinors.ifPresent(avg -> System.out.println("Average age of minors: " + avg));

            // 3. Получить коллекцию всех разработчиков, которые проживают в городе Киев
            List<Employee> developersInKyiv = users.stream()
                    .filter(user -> user instanceof Employee)
                    .map(user -> (Employee) user)
                    .filter(employee -> employee.getPosition().equalsIgnoreCase("Software Engineer"))
                    .filter(employee -> employee.getAddress().getCity().equalsIgnoreCase("Kyiv"))
                    .collect(Collectors.toList());
            System.out.println("Developers in Kyiv:");
            developersInKyiv.forEach(System.out::println);

            // 4. Получить коллекцию названий городов всех дизайнеров
            Set<String> designerCities = users.stream()
                    .filter(user -> user instanceof Employee)
                    .map(user -> (Employee) user)
                    .filter(employee -> employee.getPosition().equalsIgnoreCase("Designer"))
                    .map(employee -> employee.getAddress().getCity())
                    .collect(Collectors.toSet());
            System.out.println("Cities of all designers:");
            designerCities.forEach(System.out::println);

            // 5. Получить коллекцию пользователей с электронной почтой "gmail.com"
            List<User> gmailUsers = users.stream()
                    .filter(user -> user.getEmail().endsWith("@gmail.com"))
                    .collect(Collectors.toList());
            System.out.println("Users with gmail.com email:");
            gmailUsers.forEach(System.out::println);

            // 6. Получить коллекцию электронных адресов всех совершеннолетних женщин, не старше 30 лет, которые проживают в Украине и являются сотрудниками
            List<String> emailList = users.stream()
                    .filter(user -> user instanceof Employee)
                    .map(user -> (Employee) user)
                    .filter(employee -> employee.getAge() >= 18 && employee.getAge() <= 30)
                    .filter(employee -> employee.getGender().equalsIgnoreCase("Female"))
                    .filter(employee -> employee.getCountry().equalsIgnoreCase("Ukraine"))
                    .map(User::getEmail)
                    .collect(Collectors.toList());
            System.out.println("Emails of adult women under 30 years old, living in Ukraine and employees:");
            emailList.forEach(System.out::println);

            // 7. Получить средние зарплаты для каждого отдела
            Map<String, Double> averageSalaries = users.stream()
                    .filter(user -> user instanceof Employee)
                    .map(user -> (Employee) user)
                    .collect(Collectors.groupingBy(Employee::getDepartment, Collectors.averagingDouble(Employee::getSalary)));
            System.out.println("Average salaries per department:");
            averageSalaries.forEach((department, avgSalary) -> System.out.println(department + ": " + avgSalary));
        }
    }


