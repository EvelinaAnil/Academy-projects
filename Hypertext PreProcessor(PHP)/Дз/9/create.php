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

if (isset($_POST['create'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $user->createUser($username, $password);
    header('Location: index.php');
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Create User</h2>
        <form method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" name="create" class="btn btn-primary">Create User</button>
        </form>
    </div>
</body>
</html>
