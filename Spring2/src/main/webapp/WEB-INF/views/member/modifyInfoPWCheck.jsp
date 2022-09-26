<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">


</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">



<h1>회원정보 수정</h1>
<p>회원정보 확인</p>
<form action="/member/modifyInfoPWCheck" method="post" id="form">
<input type="text" name="id" id="id" readonly value="${userInfo.id}">
<input type="password" name="password" placeholder="비밀번호를 입력하세요." id="target">
<input type="submit" value="수정하기">	

</form>





		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>

</body>
</body>
</html>