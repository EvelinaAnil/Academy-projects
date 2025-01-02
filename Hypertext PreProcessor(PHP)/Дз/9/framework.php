<?
// Правильный пример: Использование Dependency Injection

// Класс зависимости
class Database {
    public function connect() {
        return 'Соединение с базой данных';
    }
}

// Класс, использующий зависимость с Dependency Injection
class User {
    private $db;

    public function __construct(Database $db) {
        $this->db = $db; // Используем переданный объект Database
    }

    public function getUserData() {
        $connection = $this->db->connect();
        return 'Получение данных пользователя через ' . $connection;
    }
}

// Создаем экземпляр класса Database
$database = new Database();

// Создаем экземпляр класса User с передачей зависимости
$user = new User($database);

// Вызываем метод класса User
echo $user->getUserData();

/**
 * // Плохой пример: Жесткая связь между классами

* Класс зависимости
*class Database {
*    public function connect() {
*        return 'Соединение с базой данных';
 *   }
*}

* Класс, использующий зависимость (с жесткой связью)
*class User {
 *   private $db;
*
   * public function __construct() {
  *      $this->db = new Database(); // Проблема: жесткая связь
 *   }
*
*    public function getUserData() {
*        $connection = $this->db->connect();
*        return 'Получение данных пользователя через ' . $connection;
*    }
*}

*Создаем экземпляр класса User
*$user = new User();

*Вызываем метод класса User
*echo $user->getUserData();

 * 
 * 
 */