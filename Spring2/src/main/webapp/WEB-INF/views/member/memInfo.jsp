<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<h1>회원정보수정</h1>
	<table>
		<tr>
			<td class="signtable">아이디</td><td><input type="text" name="id" readonly></td>
		</tr>
		<tr>
			<td class="signtable">비밀번호</td><td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td class="signtable">비밀번호 확인</td><td><input type="password" name="pwck"></td>
		</tr>
		<tr>
			<td class="signtable">이메일</td><td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td class="signtable">전화번호</td><td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td class="signtable">주소</td><td><input type="text" name="add"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정하기"><input type="submit" value="계정삭제"></td>
		</tr>
	</table>
	<%@ include file="../footer.jsp"%>
</body>
</html>