<?php
    $servername="srcs-db_app-1";
    $username="kyolee";
    $password="12345";
    $dbname="mysql";
    
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    if ($conn == false) {
        die("연결 오류 : ".mysqli_error());
    }
    var_dump($conn);
    echo "<br><br>";

    // friend 테이블에 데이터 삽입
    $sql = "insert into friend (name, tel, address) values('jim', '01012345678', '경기도 권선구 수원시 온정로 123');";

    var_dump($sql);
    echo "<br><br>";

    $result = mysqli_query($conn, $sql);
    
    var_dump($result);
    echo "<br><br>";
    if ($resul == false){
        echo "데이터 삽입 완료!";
    }
    else
        echo "데이터 삽입 오류: ".mysqli_error($conn);
   
    mysqli_close($conn);
?>