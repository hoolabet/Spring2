<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<form action="list" method="POST">
		<input type="text" name="title">
		<br><br>
		<textarea name="content" rows="10" cols="20"></textarea>
		<input type="submit" value="제출">
	</form>
	<br>
	<a href="/">메인으로</a>
</body>
</html>