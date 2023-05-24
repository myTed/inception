<?php

    class Person {
        private  $name;
        private $age;

        public function __construct($name, $age) {
            $this->name = $name;
            $this->age = $age;
        }

        public function show() {
            echo "이름 :".$this->name."나이 : ".$this->age."<br><br>";
        }
    }

    $hong = new Person("kyolee", "100");

    $hong->show();

    echo "<br><br>";

    $num = 10;
    $str = "123123123";

    var_dump($num);
    var_dump($str);
    var_dump($hong);
?>