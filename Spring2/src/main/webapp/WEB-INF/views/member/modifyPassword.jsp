<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modifyPassword.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">





			<h1>비밀번호 변경</h1>
			

			<form action="/member/modifyPassword" method="post">
			<table>
				
				<tr>
					<td class="signtable">아이디hidden할거</td>
					<td class="tableInput">
						<input type="text" name="id" id="id" readonly value="${id}">
						<p class="signmsg" id="idmsg"></p>
					</td>
				</tr>
				

						
				<tr>
					<td class="signtable">새 비밀번호</td>
					<td class="tableInput">
						<input type="password" name="password" id="pw_val">
						<p class="signmsg" id="pw_msg"></p>
					</td>
				</tr>
				<tr>
					<td class="signtable">비밀번호 확인</td>
					<td class="tableInput">
						<input type="password" id="pw_val2">
						<p class="signmsg" id="pw_msg2"></p>
					</td>
				</tr>


				<tr>
					<td colspan="2" class="signtable">
						<input type="submit" value="비밀번호 수정" id="pw_btn">
					</td>
				</tr>
			
			</table>
			</form>
			
			<table id="mypage_list">
				
			</table>

	
	
	
	
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript"src="/resources/js/modifyPassword.js"></script>

</body>
</html>