<!DOCTYPE html>
<html>
<head>
    <title>Сортировка и поиск товаров</title>
</head>
<body>
    <h2>Сортировка и поиск товаров</h2>
    <form method="post">
        <label for="search">Критерий поиска:</label>
        <input type="text" name="search" id="search">

        <input type="submit" name="sort" value="Быстрая сортировка">
        <input type="submit" name="sort" value="Сортировка пузырьком">

        <input type="submit" name="searchType" value="Бинарный поиск">
        <input type="submit" name="searchType" value="Линейный поиск">
    </form>

   
    <?php
    $products = array(
        array('name' => 'Товар 1', 'price' => 100),
        array('name' => 'Товар 2', 'price' => 75),
        array('name' => 'Товар 3', 'price' => 120),
    );

    function quickSort($array) {
        if (count($array) < 2) {
            return $array;
        }

        $left = $right = array();
        reset($array);
        $pivot_key = key($array);
        $pivot = array_shift($array);

        foreach ($array as $k => $v) {
            if ($v['price'] < $pivot['price']) {
                $left[$k] = $v;
            } else {
                $right[$k] = $v;
            }
        }

        return array_merge(quickSort($left), array($pivot_key => $pivot), quickSort($right));
    }

    function bubbleSort($array) {
        $n = count($array);
        do {
            $swapped = false;
            for ($i = 0; $i < $n - 1; $i++) {
                if ($array[$i]['price'] > $array[$i + 1]['price']) {
                    $temp = $array[$i];
                    $array[$i] = $array[$i + 1];
                    $array[$i + 1] = $temp;
                    $swapped = true;
                }
            }
        } while ($swapped);
        return $array;
    }

    function linearSearch($array, $searchTerm) {
        $results = array();
        foreach ($array as $product) {
            if (strpos($product['name'], $searchTerm) !== false) {
                $results[] = $product;
            }
        }
        return $results;
    }

    function binarySearch($array, $searchTerm) {
        $low = 0;
        $high = count($array) - 1;

        while ($low <= $high) {
            $mid = floor(($low + $high) / 2);
            $compare = strcasecmp($searchTerm, $array[$mid]['name']);

            if ($compare == 0) {
                return $array[$mid];
            }

            if ($compare < 0) {
                $high = $mid - 1;
            } else {
                $low = $mid + 1;
            }
        }

        return null;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $searchTerm = isset($_POST['search']) ? $_POST['search'] : '';

        if (isset($_POST['sort'])) {
            if ($_POST['sort'] === 'Быстрая сортировка') {
                $products = quickSort($products);
            } elseif ($_POST['sort'] === 'Сортировка пузырьком') {
                $products = bubbleSort($products);
            }
        }

        if (isset($_POST['searchType'])) {
            $searchType = $_POST['searchType'];
            if ($searchType === 'Бинарный поиск') {
                $products = quickSort($products);
                $result = binarySearch($products, $searchTerm);
            } elseif ($searchType === 'Линейный поиск') {
                $results = linearSearch($products, $searchTerm);
            }
        }
    }
    ?>
</body>
</html>
