<?php
session_start();
function save_user($username, $email, $password) {
    global $pdo;

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $stmt = $pdo->prepare('INSERT INTO users (username, email, password) VALUES (:username, :email, :password)');
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->bindParam(':password', $hashed_password, PDO::PARAM_STR);

    return $stmt->execute();
}
function register($username, $email, $password) {
    
    if (save_user($username, $email, $password)) {
        echo 'User saved successfully!';
    } else {
        echo 'Failed to save user.';
    }
}
function authenticate_user($username, $password) {
    global $pdo;

    $stmt = $pdo->prepare('SELECT * FROM users WHERE username = :username');
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
       
        session_start();
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        return true;
    } else {
        return false;
    }
}

function login($username, $password) {
    
    if (authenticate_user($username, $password)) {
        echo 'Authentication successful! Session is set.';
    } else {
        echo 'Authentication failed.';
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['register'])) {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    register($username, $email, $password);
    echo json_encode(['success' => true, 'message' => 'Registration successful']);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    login($username, $password);
    echo json_encode(['success' => true, 'message' => 'Login successful']);
}

?>
