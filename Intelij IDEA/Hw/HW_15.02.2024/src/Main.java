import java.sql.*;

public class Main {
    public static void main(String[] args) {
        // Параметри підключення до бази даних PostgreSQL
        String url = "jdbc:postgresql://localhost:5432/your_database_name";
        String user = "your_username";
        String password = "your_password";

        try {

            Connection connection = DriverManager.getConnection(url, user, password);


            Statement statement = connection.createStatement();
            String createTableQuery = "CREATE TABLE categories (id SERIAL PRIMARY KEY, name VARCHAR(255))";
            statement.executeUpdate(createTableQuery);
            System.out.println("Таблиця створена успішно.");


            String[] categories = {"Category 1", "Category 2", "Category 3"};
            String insertQuery = "INSERT INTO categories (name) VALUES (?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            for (String category : categories) {
                preparedStatement.setString(1, category);
                preparedStatement.executeUpdate();
            }
            System.out.println("Записи додано успішно.");


            ResultSet resultSet = statement.executeQuery("SELECT * FROM categories");
            System.out.println("Вміст таблиці categories:");
            while (resultSet.next()) {
                System.out.println("ID: " + resultSet.getInt("id") + ", Name: " + resultSet.getString("name"));
            }


            resultSet.close();
            preparedStatement.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
