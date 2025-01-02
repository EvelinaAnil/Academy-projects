<?php
class User {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function createUser($username, $password) {
        $passwordHash = password_hash($password, PASSWORD_DEFAULT);
        $query = "INSERT INTO users (username, password) VALUES (?, ?)";
        $this->db->executeQuery($query, [$username, $passwordHash]);
    }

    public function getUsers() {
        $query = "SELECT * FROM users";
        return $this->db->executeQuery($query)->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getUserById($id) {
        $query = "SELECT * FROM users WHERE id = ?";
        return $this->db->executeQuery($query, [$id])->fetch(PDO::FETCH_ASSOC);
    }

    public function updateUser($id, $username) {
        $query = "UPDATE users SET username = ? WHERE id = ?";
        $this->db->executeQuery($query, [$username, $id]);
    }

    public function deleteUser($id) {
        $query = "DELETE FROM users WHERE id = ?";
        $this->db->executeQuery($query, [$id]);
    }
}
?>

