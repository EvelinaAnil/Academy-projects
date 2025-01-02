
<?php
//1
// function getInput($prompt) {
//     do {
//         echo $prompt;
//         $input = trim(fgets(STDIN));
//     } while (!is_numeric($input));
//     return $input;
// }


// $number1 = getInput("Введите первое число: ");

// $number2 = getInput("Введите второе число: ");

// $sum = $number1 + $number2;

// $product = $number1 * $number2;

// echo "Сумма чисел $number1 и $number2 равна: $sum\n";
// echo "Произведение чисел $number1 и $number2 равно: $product\n";

//2
// function getInput($prompt) {
//     do {
//         echo $prompt;
//         $input = trim(fgets(STDIN));
//     } while (!is_numeric($input));
//     return $input;
// }

// $number1 = getInput("Введите первое число: ");

// $number2 = getInput("Введите второе число: ");

// $square1 = $number1 * $number1;
// $square2 = $number2 * $number2;

// $sumOfSquares = $square1 + $square2;

// echo "Сумма квадратов чисел $number1 и $number2 равна: $sumOfSquares\n";


//3
// function getInput($prompt) {
//     do {
//         echo $prompt;
//         $input = trim(fgets(STDIN));
//     } while (!is_numeric($input));
//     return $input;
// }

// $number1 = getInput("Введите первое число: ");

// $number2 = getInput("Введите второе число: ");

// $number3 = getInput("Введите третье число: ");

// $average = ($number1 + $number2 + $number3) / 3;

// echo "Среднее арифметическое чисел $number1, $number2 и $number3 равно: $average\n";


//4

// function getInput($prompt) {
//     do {
//         echo $prompt;
//         $input = trim(fgets(STDIN));
//     } while (!is_numeric($input));
//     return $input;
// }

// $x = getInput("Введите значение x: ");

// $y = getInput("Введите значение y: ");

// $z = getInput("Введите значение z: ");

// $result = ($x + 1) * 4 - 2 * ($z - 2 * $x * $x + $y * $y) + abs(sin($y)) - sqrt($z);

// echo "Результат вычисления выражения: $result\n";




//18

function getInput($prompt) {
    do {
        echo $prompt;
        $input = trim(fgets(STDIN));
    } while (!is_numeric($input) || $input < 1 || $input > 12);
    return $input;
}

$monthNumber = getInput("Введите номер месяца (1-12): ");

$season = "";
switch ($monthNumber) {
    case 12:
    case 1:
    case 2:
        $season = "Зима";
        break;
    case 3:
    case 4:
    case 5:
        $season = "Весна";
        break;
    case 6:
    case 7:
    case 8:
        $season = "Лето";
        break;
    case 9:
    case 10:
    case 11:
        $season = "Осень";
        break;
    default:
        $season = "Ошибка";
        break;
}

echo "Пора года: $season\n";


?>