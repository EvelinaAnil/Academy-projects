<?php
//1 Создание массива товаров
$products = array(
    array(
        'name' => 'Товар 1',
        'manufacturer' => 'Производитель A',
        'price' => 100.00
    ),
    array(
        'name' => 'Товар 2',
        'manufacturer' => 'Производитель B',
        'price' => 75.50
    ),
    array(
        'name' => 'Товар 3',
        'manufacturer' => 'Производитель A',
        'price' => 120.00
    ),
    
);


foreach ($products as $product) {
    echo 'Название товара: ' . $product['name'] . '<br>';
    echo 'Производитель: ' . $product['manufacturer'] . '<br>';
    echo 'Цена: ' . $product['price'] . '<br><br>';
}


?>
