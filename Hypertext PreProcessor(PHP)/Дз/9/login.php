<?php
session_start();
include 'config.php';
include 'Database.php';
include 'User.php';

$db = new Database();
$user = new User($db);

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $users = $user->getUsers();
    foreach ($users as $userData) {
        if ($userData['username'] === $username && password_verify($password, $userData['password'])) {
            $_SESSION['user_id'] = $userData['id'];
            setcookie(COOKIE_NAME, $userData['id'], time() + (86400 * 30), "/");
            header('Location: index.php');
        }
    }

    $error = "Invalid login credentials";
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Login</h2>
        <form method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" name="login" class="btn btn-primary">Login</button>
            <?php if (isset($error)): ?>
                <p class="text-danger"><?php echo $error; ?></p>
            <?php endif; ?>
        </form>
    </div>
</body>
</html>
