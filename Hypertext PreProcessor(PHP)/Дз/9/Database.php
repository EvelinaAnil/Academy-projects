<?php

require_once 'config.php';

class Database
{
    private $host;
    private $user;
    private $pass;
    private $dbname;
    private $connection;

    public function __construct()
    {
        $this->host = DB_HOST;
        $this->user = DB_USER;
        $this->pass = DB_PASSWORD;
        $this->dbname = DB_NAME;

        try {
            $this->connection = new PDO("mysql:host=$this->host", $this->user, $this->pass);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Проверяем существование базы данных и создаем, если нет
            $sql = "CREATE DATABASE IF NOT EXISTS $this->dbname";
            $this->connection->exec($sql);

            // Создаем соединение с базой данных
            $this->connection = new PDO("mysql:host=$this->host;dbname=$this->dbname", $this->user, $this->pass);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
           // Создание таблицы
            $this->createTable();
            
        } catch (PDOException $e) {
            echo "Ошибка: " . $e->getMessage();
        }
    }

    public function getConnection()
    {
        return $this->connection;
    }
    public function executeQuery($query, $params = []) {
        $stmt = $this->connection->prepare($query);
        $stmt->execute($params);
        return $stmt;
    }
    private function createTable() {
        $query = "
      USE $this->dbname;
            CREATE TABLE IF NOT EXISTS users (
                id INT AUTO_INCREMENT PRIMARY KEY,
                username VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL
            )
        ";
        
        $this->executeQuery($query);
    }

}

?>
