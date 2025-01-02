<?php
session_start();
include 'config.php';
include 'Database.php';
include 'User.php';

$db = new Database();
$user = new User($db);

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

if (isset($_GET['id'])) {
    $userId = $_GET['id'];
    $user->deleteUser($userId);
    header('Location: index.php');
}
?>

