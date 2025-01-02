<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>php lesson3(Arrays)</title>
</head>
<body>
    <?php 
    //------Massive----(1)-
    //$numbers = array();
    // $numbers1 = [52, 25, 10 ,50];
    // echo $numbers1[1];
    // print_r($numbers1);
    // $numbers1[] = 122;
    // print_r($numbers1);

    //------Massive Static----(2)-
    // $array = new SplFixedArray(5);
    // $array[1] = 25;
    // $array[4] = 152;
    // print_r($array);
    // // $array[] = 102;//Error
    // // print_r($array);
    // $array->setSize(10);
    // print_r($array);

    //------Massive----(3)-
    // $numbers = [0 => "number", 5 => "18", 2 => 55 , 12 => 12,3];
    // //print_r($numbers);
    // foreach($numbers as $key => $value)
    // {
    //     echo "key: $key, value: $value";
    // }
    //range()

    //------Massive----(4)-
    // $array = range(100, 500, 50);
    // print_r($array);

    //------Asociotivne Massive----(4)-
    // $numbers = ["num" => "number", "age" => "18", "int" => 55, "float" => 12.3];
    // print_r($numbers);
    // class Person{}
    // $person = new Person();
    // echo gettype($person);
    // echo get_class($person); 
    // $numbers[] = get_class($person);
    // $numbers = ["num" => "number", 12 => "18", 5 => 55, "float" => 12.3,
    // get_class($person) => 99];
    // print_r($numbers);

    //------Massive fUNCTION----(4)-
$matrix = [
    [5,8,9],
    [7,"person" => 25,1],
    [3,2,6]
];
print_r($matrix);
foreach($matrix as $arr){
    echo "<br>";
    foreach($arr as $item){
        echo "<strong> $item </strong>";
    }
}

    ?>
      
     
</body>
</html>