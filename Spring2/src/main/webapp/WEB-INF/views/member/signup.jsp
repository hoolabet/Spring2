<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="/resources/js/signup.js"></script>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/signup.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
		
		
		
		


			<h1 id="title">sign up</h1>
			<form action="/member/signup" method="post">
			
				<table>
					<tr>
						<td class="signtable">아이디</td>
						<td class="tableInput" id="idInput">
							<input type="text" name="id" id="idchk">
							<input type="button" value="중복확인" id="idbtn">
							<p class="signmsg" id="idmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">비밀번호</td>
						<td class="tableInput">
							<input type="password" name="password" id="pwchk">
							<p class="signmsg" id="pwmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">비밀번호 확인</td>
						<td class="tableInput">
							<input type="password" name="pw2" id="pwchk2">
							<p class="signmsg" id="pwmsg2"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">이름</td>
						<td class="tableInput">
							<input type="text" name="name" id="nachk">
							<p class="signmsg" id="namsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">이메일</td>
						<td class="tableInput">
							<input type="text" name="email" id="emchk">
							<p class="signmsg" id="emmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">성별</td>
						<td class="tableInput">
							<input type="radio" name="gender" value="m">남
							<input type="radio" name="gender" value="f">여
							<p class="signmsg" id="genmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">출생년월</td>
						<td class="tableInput">
							<input type="text" name="birth" id="bichk">
							<p class="signmsg" id="bimsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">전화번호</td>
						<td class="tableInput">
							<input type="text" name="phone" id="pchk">
							<p class="signmsg" id="pmsg"></p>
						</td>
					</tr>
					<tr>
						<td class="signtable">주소</td>
						<td class="tableInput">
							<input type="text" name="address1" id="adchk">
							<p class="signmsg" id="admsg"></p>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" id="signsub">
						</td>
					</tr>
				</table>
				
			</form>





		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>