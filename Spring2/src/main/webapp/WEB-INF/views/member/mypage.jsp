<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">




			<h1>마이페이지</h1>
			<input type="hidden" value="${userInfo.admin}" id="admin_check">
			<input type="hidden" value="${userInfo.sns}" id="user_sns">
			<input type="hidden" value="${userInfo.id}" id="user_id">
			<input type="hidden" value="${userInfo.userImg}" id="user_img_input">
			<input type="hidden" value="${userInfo.name}" id="user_name_input">
			

			
			<div id="mypage_user_list"></div>
			
			



		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/mypage.js?ver=1.1"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>