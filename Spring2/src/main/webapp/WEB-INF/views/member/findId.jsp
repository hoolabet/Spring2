<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/findId.css"></link>

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">







			<h1 id="title">아이디 찾기</h1>
			<form action="/member/findId" method="post">
				<div id="find_id_box">
					<table id="find_id_table">
						<tr>
							<td><input type="text" placeholder="이름" name="name"
								class="findIdInput" id="findIdName"></td>
						</tr>
						<tr>
							<td><input type="text" name="email" class="findIdInput"
								id="findIdEmail" placeholder="이메일"></td>
						</tr>
						<tr>
							<td>
								<div class="mail_check_box">
									<input type="submit" value="인증번호 받기" id="email_btn"> 
									<input class="mail_check_input" placeholder=" 인증번호 6자리를 입력해주세요"
										disabled="disabled" maxlength="6" id="email_num">
									<p class="signmsg" id="find_id_msg"></p>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="아이디 찾기" id="findIdsub"></td>
						</tr>
					</table>
					<div id="link_box">
						<div id="link_findpw">
							<a href="/member/findPw">비밀번호 찾기</a>
						</div>
						<div id="link_login">
							<a href="/member/login">로그인</a>
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
	<script type="text/javascript" src="/resources/js/findId.js"></script>
</body>
</html>