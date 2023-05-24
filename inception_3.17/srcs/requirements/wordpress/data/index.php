<!-- <?php
    echo "현재 시간은 " . date("Y-m-d H:i:s") . " 입니다.";
    phpinfo();
?> -->

<!DOCTYPE html>
<html>
<head>
	<title>입력 폼</title>
</head>
<body>
	<h2>입력 폼</h2>
	<form action="process.php" method="POST">
		<label for="name">이름:</label>
		<input type="text" id="name" name="name"><br>
		<label for="email">이메일:</label>
		<input type="email" id="email" name="email"><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>