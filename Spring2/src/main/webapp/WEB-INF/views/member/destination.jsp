<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/destination.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
		
		<input type="hidden" value="${userInfo.id}" id="id">
		
			<div id="des">
			
			</div>

		<input type="button" value="배송지 추가" id="input_toggle"><br>
		
		<input type="text" class="toggle" id="dname" placeholder="배송지명" style="display:none" value="집"><br>
		<input type="text" class="toggle" id="name" placeholder="이름" style="display:none"><br>
		<input type="text" class="toggle" id="phone" placeholder="전화번호" style="display:none"><br>
		<input type="text" class="toggle" id="address" placeholder="주소" style="display:none" ><br>
		<input type="text" class="toggle" id="dmemo" placeholder="배송메모" style="display:none" value="문 앞에 놓아주세요."><br>
		
		<input type="button" class="toggle" value="배송지 등록하기" id="add_btn" style="display:none">




		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"src="/resources/js/destination.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>