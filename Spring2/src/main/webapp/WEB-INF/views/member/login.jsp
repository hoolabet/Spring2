<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="/resources/js/login.js"></script>

</head>
<body>
<h1>login</h1>
<form action="/member/login" method="post">
	<table>
		<tr>
			<td>아이디:<input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호:<input type="password" name="pw"><p id="ck"></p></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</body>
</html>