<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="/resources/js/memInfo.js"></script>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/memInfo.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">





			<h1>회원정보수정</h1>
			<form action="/member/memInfo" method="post">
			<table>
				<tr>
					<td class="signtable">아이디</td>
					<td class="tableInput">
						<input type="text" name="id" id="idchk" readonly value="수정불가">
						<p class="signmsg" id="idmsg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">비밀번호</td>
					<td class="tableInput">
						<input type="password" name="pw" id="pwchk" value="비밀번호">
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
						<input type="text" name="name" id="nachk" value="가입한 이름">
						<p class="signmsg" id="namsg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">이메일</td>
					<td class="tableInput">
						<input type="text" name="email" id="emchk" value="가입한 이메일">
						<p class="signmsg" id="emmsg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">전화번호</td>
					<td class="tableInput">
						<input type="text" name="phone" id="pchk" value="가입한 전화번호">
						<p class="signmsg" id="pmsg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">주소</td>
					<td class="tableInput">
						<input type="text" name="add" id="adchk" value="가입한 주소">
						<p class="signmsg" id="admsg"></p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정하기" id="modify">
						<input type="submit" value="계정삭제" id="delete">
						<a href="/member/mypage">마이페이지</a><br>
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