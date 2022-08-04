<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sign up</h1>
<form action="/member/signup" method="post">
	<table>
		<tr>
			<td>아이디</td><td><input type="text" name="id"><input type="button" value="중복확인"></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td><td><input type="password" name="pwck"></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>주소</td><td><input type="text" name="add"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="회원가입"></td>
		</tr>
	</table>
</form>
</body>
</html>