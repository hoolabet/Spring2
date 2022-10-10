<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/findPw.css"></link>

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">







			<h1 id="title">비밀번호 찾기</h1>
			<form action="/member/findPw" method="post">
				<div id="find_pw_box">
					<table id="find_pw_table">
						<tr>
							<td><input type="text" placeholder="아이디" name="id"
								class="findPwInput" id="findPwId">
								<p id="namsg"></p></td>
						</tr>
						<tr>
							<td><input type="text" placeholder="이름" name="name"
								class="findPwInput" id="findPwName"></td>
						</tr>
						<tr>
							<td><input type="text" placeholder="이메일" name="email"
								class="findPwInput" id="findPwEmail"></td>
						</tr>
						<tr>
							<td>
								<div class="mail_check_box">
									<input type="submit" value="인증번호 받기" id="email_btn"> <input
										class="mail_check_input" placeholder=" 인증번호 6자리를 입력해주세요"
										disabled="disabled" maxlength="6" id="email_num">
									<p class="signmsg" id="find_pw_msg"></p>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="비밀번호 변경" id="findPwsub"></td>
						</tr>
					</table>
					<div id="link_box">
						<div id="link_findid">
							<a href="/member/findId"><h5>아이디 찾기</h5></a>
						</div>
						<div id="link_login">
							<a href="/member/login"><h5>로그인</h5></a>
						</div>
					</div>
				</div>
			</form>







		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript" src="/resources/js/findPw.js"></script>
</body>
</html>