<?php

function require_auth() {
    session_start();

    if (!isset($_SESSION['user_id']) || !isset($_SESSION['username'])) {
        echo 'Debug: User not authenticated!';
        header('Location: login.php');
        exit;
    }
}




function get_user_info($user_id) {
    global $pdo;

    $stmt = $pdo->prepare('SELECT id, username, email, created_at FROM users WHERE id = :user_id');
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->execute();

    return $stmt->fetch(PDO::FETCH_ASSOC);
}

// Заменить на  ID пользователя
$user_id = 1; 
$user_info = get_user_info($user_id);




require_once 'authMiddleware.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['get_user_info'])) {
    require_auth();
    $user_id = $_SESSION['user_id'];

    $user_info = get_user_info($user_id);
    echo json_encode(['user' => $user_info]);
    exit;
}


?>
