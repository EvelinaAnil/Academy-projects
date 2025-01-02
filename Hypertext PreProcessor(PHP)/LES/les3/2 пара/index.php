<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Functions</title>
</head>
<body>
    <?php
    // $age = 25;
    // HelloUser(12);
    // function HelloUser($age,$user = "user default"){
    //     echo "Hello, $user !"."Age: $age";
    //     $age=50;
    // }
    // echo "age = $age";


    // $name = "TOM";
    // $person = &$name;
    // $name = "BOB";
    // echo    "person Name: $person";

    // class Person {
    //     public $age = 18;
    // }
    // $student = new Person();
    // $employee = clone($student);
    // $student->age=25;
    // echo "employee age: ". $employee->age;


    function sum(...$numbers){
        $result = 0;
        foreach($numbers as $number){
            $result += $number;
        }
        return $result;
    }
    echo sum(5, 8, 9, 50, 25);

    //---------Anonims Functions------------
    // $helloUser = fn($name) => "Hello, $name";
    // echo $helloUser("Alex");


    // $counter = 0;
    // $Counter = function() use($counter) {
    //     echo ++$counter;
    // };
    // $Counter();$Counter();$Counter();
    // echo $counter;


    

    ?>
</body>
</html>