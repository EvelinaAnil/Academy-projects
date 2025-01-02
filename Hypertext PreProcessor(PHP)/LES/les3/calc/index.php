<!DOCTYPE HTML>
<html lang="ru">
<head>
    <meta charset = "UTF-8">
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <?php 
    /*
        Для начала проверим, были ли нажата кнопка submit и переданы 
        данные формы методом post. Если передача данных осуществлена 
        успешно, то инициализируем переменные: $number1, $number2 и 
        $operation и передадим в качестве значений post-данные первого 
        введенного операнда $_POST[‘number1’], второго введенного операнда 
        $_POST[‘number1’] и оператора $_POST[‘operation’] соответственно.
    */
    if(isset($_POST['submit'])){
    // инициализация
        $number1 = $_POST['number1'];
        $number2 = $_POST['number2'];
        $operation = $_POST['operation'];
    }
    /*
    Проверяем, все ли поля формы заполнены, 
    если нет, то инициализируем переменную $error_result, 
    в которую передаем сообщение об ошибке:
    */
    // Валидация
    if(!$operation || (!$number1 && $number1 != '0') || (!$number2 && $number2 != '0')) {
        $error_result = 'Не все поля заполнены';
    }
    else { // если все поля формы заполнены, проверяем, являются ли числами введенные пользователем значения
        if(!is_numeric($number1) || !is_numeric($number2)) { //если операнды — не являются числами
            $error_result = "Операнды должны быть числами"; // инициализируем переменную с ошибкой
        }
        else //  если ошибок не найдено
            switch($operation){ // проверяем какой оператор был выбран
            case 'plus': // если выбран оператор сложения, то вычисляем сумму
                $result = $number1 + $number2; 
                break;
            case 'minus': // если выбран оператор вычитания, то вычисляем разность
                $result = $number1 - $number2;  
                break;
            case 'multiply': // если выбран оператор умножения, то вычисляем произведение
                $result = $number1 * $number2;
                break;
            case 'divide': // если выбран оператор сложения
                if( $number2 == '0') // проверям не является ли второй делитель нулевым
                $error_result = "На ноль делить нельзя!"; 
                else
                    $result = $number1 / $number2; // если второй делитель не ноль, выполняем деление
                    break;    
            }
    }
    /*
         вывод результата на экран. 
         Если переменная $error_result инициализирована, 
         то выводим ее на экран, если нет — выводим на экран 
         результат вычислений, записанный в переменной $result:
    */
    if(isset($error_result)) {
        echo "Ошибка: $error_result";
     }    
    else {
        echo "Ответ: $result";
    }
    ?>
    <h1>Прототип калькулятора</h1>
    <!-- а вот и наша форма -->
    <form action="" method="post" class="calculate-form">
        <input type="text" name="number1" class="numbers" placeholder="Первое число"> <!-- поле для ввода первого числа -->
    <select class="operations" name="operation"> <!-- список с операндами -->
        <option value='plus'>+ </option>
        <option value='minus'>- </option>
        <option value="multiply">* </option>
        <option value="divide">/ </option>
    </select>
    <input type="text" name="number2" class="numbers" placeholder="Второе число"> <!-- поле для ввода второго числа -->
         
    <input class="submit_form" type="submit" name="submit" value="Получить ответ"> <!-- кнопка -->
    </form>
    
</body>
</html>