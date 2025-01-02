<?php
session_start();
include 'config.php';

if (isset($_COOKIE[COOKIE_NAME])) {
    unset($_COOKIE[COOKIE_NAME]);
    setcookie(COOKIE_NAME, null, -1, '/');
}

session_destroy();
header('Location: index.php');
?>
