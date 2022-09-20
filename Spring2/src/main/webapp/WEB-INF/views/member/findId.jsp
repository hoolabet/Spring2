<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			
				<div id="find_result"></div>
<!-- 				<div> -->
<!-- 					<input type="radio" name="findId" value="p" checked="checked">전화번호로 찾기 -->
<!-- 					<input type="radio" name="findId" value="e">이메일로 찾기 -->
<!-- 				</div> -->
				<div id="loginTable">
					<table>
						<tr>
							<td>
							<input type="text" placeholder="이름" name="name" class="findIdInput" id="findIdName">
							</td>
						</tr>
						<tr>
							<td>
							<input type="text" name="email" class="findIdInput" id="findIdEmail" placeholder="이메일">
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="인증번호 받기" id="email_btn">
								<div class="mail-check-box">
									<input class="form-control mail-check-input"
										placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled"
										maxlength="6">
										<p class="signmsg" id="find_id_msg"></p>
								</div>
							</td>s
						</tr>
						<tr>
							<td><input type="submit" value="아이디 찾기" id="findIdsub"></td>
						</tr>
					</table>
				</div>
				<div id="link">
					<a href="/member/findPw">비밀번호 찾기&ensp;</a>
					<a href="/member/login">로그인</a>
				</div>
			</form>	







		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"src="/resources/js/findId.js"></script>
</body>
</html>