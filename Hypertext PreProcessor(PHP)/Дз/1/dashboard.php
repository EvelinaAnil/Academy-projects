<?php
require_once('db_functions.php');
?>

<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: white;
        }

        form {
            max-width: 600px;
            margin: 20px 0;
        }

        label, input {
            display: block;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Лічильник працівників</h1>

    <form method="post" action="">
        <label for="column">Виберіть стовпець для додавання:</label>
        <select name="column" required>
            <option value="first_name">Ім'я</option>
            <option value="last_name">Прізвище</option>
            <option value="position">Посада</option>
            <option value="age">Вік</option>
            <option value="hire_date">Дата прийому на роботу</option>
        </select>

        <label for="value">Значення:</label>
        <input type="text" name="value" required>

        <input type="submit" value="Додати стовпець">
    </form>

    <h2>Таблиця працівників</h2>

    <?php
    display_employees_table();
    ?>

    <form method="post" action="">
        <label for="sort_by">Сортувати за:</label>
        <select name="sort_by">
            <option value="first_name">І
