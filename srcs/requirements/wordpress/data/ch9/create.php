<?php
    $servername="srcs-db_app-1";
    $username="kyolee";
    $password="12345";
    $dbname="mysql";

    $conn = mysqli_connect($servername, $username, $password, $dbname);
     if ($conn == false) {
        die("연결 오류 :".mysqli_connect_error());
     }

    //friend 테이블 생성
    $sql = "create table friend (
        num int not null auto_increment,
        name char(10) not null,
        tel char(20) not null,
        address char(80),
        primary key(num))";
    
    $result = mysqli_query($conn, $sql);

    if ($result) {
        echo "friend 테이블 생성 완료!";
    }
    else
        echo "테이블 생성 오류 :".mysqli_error($conn);

    mysqli_close($conn);
?>