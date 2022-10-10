<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 전 비밀번호 확인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/modifyInfoPWCheck.css"></link>

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">



			<h1>비밀번호 재확인</h1>
			<form action="/member/modifyInfoPWCheck" method="post" id="form">
				<input type="hidden" name="id" id="id" readonly value="${userInfo.id}">
				<div id="pwcheck_box">
					<table id="pwcheck_table">
						<tr>
							<td>
								<input type="password" name="password" placeholder="비밀번호를 입력하세요." id="target" class="pwcheckInput"> 
							</td>
						</tr>
						<tr>
							<td>
								<div id="pwchecksub_box">
									<input type="submit" value="내 정보 수정하기" id="pwchecksub">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>





		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>

</body>
</body>
</html>