
<?php
    $servername="srcs-db_app-1";
    $username="kyolee";
    $password="12345";
    $dbname="mysql";

    $conn = mysqli_connect($servername, $username, $password, $dbname);

    if ($conn == false)
    {
        die("연결 오류: ".mysqli_connect_error());
    }
    echo "MySQL에 성공적으로 연결되었습니다!";
?>