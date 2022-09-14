<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css"></link>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">




			<h1>마이페이지</h1>
			<input type="text" value="${userInfo.id}" id="user_id">
			<div id="mypage_user">
				<div id="user_img"
					style="background-image:url('${userInfo.userImg}')"></div>
				<div id="modi_user_div">
					<div id="user_name">
						<p>${userInfo.name}<span id="modi_icon"> > </span></p>
					</div>			
				</div>
			</div>
			<div id="mypage_list">
			<div id="mypage_login_list"></div>
			<a href="">배송조회</a>
			</div>



		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/mypage.js?ver=1.1"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>