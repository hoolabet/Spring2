<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<script type="text/javascript"src="/resources/js/login.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css"></link>

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">







			<h1 id="title">login</h1>
			<form action="/member/login" method="post">
				<div id="loginTable">
					<table>
						<tr>
							<td><input type="text" placeholder="아이디" name="id" class="idpwInput" id="idchk"></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="비밀번호" name="password" class="idpwInput" id="pwchk"></td>
						</tr>
						<tr>
							<td><p id="msg"></p></td>
						</tr>
						<tr>
							<td><input type="submit" value="로그인" id="loginsub"></td>
						</tr>
					</table>
				</div>
				<div id="link">
					<a href="/member/signup">회원가입</a>&emsp;&emsp;&emsp;&emsp;&emsp;<a href="">아이디/비밀번호 찾기</a>
				</div>
			</form>	







		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>