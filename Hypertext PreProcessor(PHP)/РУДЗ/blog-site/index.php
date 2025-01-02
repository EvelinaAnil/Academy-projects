<?php
session_start();


if (isset($_SESSION['user'])) {
    echo "Добро пожаловать, " . $_SESSION['user']['username'] . "! <br>";
    echo '<a href="logout.php">Выйти</a>';
} else {

    echo '<a href="login.php">Войти</a> или <a href="register.php">Зарегистрироваться</a>';
}
?>