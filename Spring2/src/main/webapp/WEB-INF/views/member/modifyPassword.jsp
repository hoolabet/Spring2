<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/modifyPassword.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">





			<h1>비밀번호 변경</h1>
			<input type="hidden" name="id" id="id" readonly value="${id}">

			<form action="/member/modifyPassword" method="post">
				<div id="modify_pw_box">
					<table>
						<tr>
							<td>
								<div class="pw_input_box">
									<input type="password" name="password" placeholder="새로운 비밀번호" class="modiInput" id="pw_val">
									<p id="pw_msg"></p>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="pw_input_box">
									<input type="password" placeholder="비밀번호 재확인" class="modiInput" id="pw_val2">
									<p id="pw_msg2"></p>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="비밀번호 변경" id="modisub">
							</td>
						</tr>
					</table>
				</div>
			</form>

			<table id="mypage_list">

			</table>





		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript" src="/resources/js/modifyPassword.js"></script>

</body>
</html>