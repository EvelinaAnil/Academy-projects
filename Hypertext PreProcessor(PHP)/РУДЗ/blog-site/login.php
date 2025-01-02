<?php
session_start();

if (isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == 'user' && $password == 'password') {
        $_SESSION['user'] = ['username' => $username];
        header("Location: index.php");
        exit();
    } else {
        echo "Неправильный логин или пароль";
    }
}
?>

<form method="post" action="">
    Логин: <input type="text" name="username" required><br>
    Пароль: <input type="password" name="password" required><br>
    <input type="submit" value="Войти">
</form>
