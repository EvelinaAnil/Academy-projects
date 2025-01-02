<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>php lesson2</title>
</head>
<body>
    <strong>
         <?php
                // $name = "Bob";
                // $surname = "Marli";
                // $age = 27;
                // echo "<hr>";
                // echo "<h1>$name".", ".$surname."</hr>";
                // echo "<hr>";
                // echo "age: $age";
                // $test =  "47HP213";
                // echo $age + $test;


                // $a = 10;
                // $b = $a;
                // echo $a;
                // $a = 15;
                // echo $b;


                //callable(функции)
                //mixed(любой тип)
                //resource(ресурсы)

                //CONST------
                // const pi = 3.14;
                // echo pi;
                // define(pi, 3.14 ); //or const like this
                // echo pi;

                //Magic constant
               // echo __FILE__;//way to this file


                // $a = 10;
                // $b = 5;
                // echo $a++ + --$b; // 14
                // echo "<br>";
                // echo $a;

                // echo "<br>";
                // $a = 5;
                // $b = "5";
                // $reault = $a === $b;
                // // == true  !=
                // // === false !==
                // //
                //  //нет результата = false 
                //  // 1 = true
                // echo $reault;

                // <=> 
                //
                // ||
                // \/
                //если равны =0 \если 3>2 = 1 \если 1<2 = -1

                //or или ||
                //*= .=  **=  &=  ??


                // $a = 5;
                // $b = 0;
                // if($a !== 0 and $b !== 0)
                //      $result = $a / $b;
                // else 
                // echo "Divide by zero";

                //1-----
                // $number = $_GET['number'];
                // echo "Your entered: $number"; 
                // if($number === 90)
                //     echo "Your number: $number";
                // else if($number === 80)
                //     echo "Your number: $number";
                // else if($number === 95)
                //     echo "Your number: $number";
                // else 
                //     echo "i don't know your number!";

                // if((0.1 + 0.2) === 0.3) //--??
                
                //     echo 0.1 + 0.2;

                $result = 52;
         ?>
    </strong>
    <!-- 1-----  -->
    <!-- <form action="">
        <input type="text" name="number"><br>
        <input type="submit" value="send"> <br>     
    </form> -->
   
    <?php
        echo $result;

    ?>

    <?php if($result === 52){?>
        <form action="">
        <input type="login" >Login: <br>
        <input type="text" name="login"> <br>     
    </form>
    
  <?php  }?>


</body>
</html>