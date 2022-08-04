<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>제작 페이지</title>
</head>
<body>
	<h1>제작 페이지</h1>
	<div id="choose_div">
		<form action="/made/list" method="post">
			<div class="prop">선택1</div>
			<div id="choose_1">
				<input type="radio" name="choose_1" value="a">
				<input type="radio" name="choose_1" value="b">
				<input type="radio" name="choose_1" value="c">
			</div>
			<div class="prop">선택2</div>
			<div id="choose_2">
				<input type="radio" name="choose_2" value="d">
				<input type="radio" name="choose_2" value="e">
				<input type="radio" name="choose_2" value="f">
			</div>
			<div class="prop">선택3</div>
			<div id="choose_3">
				<input type="radio" name="choose_3" value="g">
				<input type="radio" name="choose_3" value="h">
				<input type="radio" name="choose_3" value="i">
			</div>
			<input type="submit" value="submit">
		</form>
	</div>
	<br>
	<a href="/">메인으로</a>
</body>
</html>