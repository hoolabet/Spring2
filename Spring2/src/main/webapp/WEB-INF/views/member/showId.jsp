<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" type="text/css" href="/resources/css/showId.css"></link>

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">







			<h1 id="title">아이디찾기</h1>


			<div id="find_id_box">
				<div id="show_id_box">
					<p id="text_1">가입하신 아이디는</p>
					<p id="text_2">${id}</p>
					<p id="text_3">입니다.</p>
				</div>
				<div id="link_box">
					<div id="link_findpw">
						<a href="/member/findPw"><h5>비밀번호 찾기</h5></a>
					</div>
					<div id="link_login">
						<a href="/member/login"><h5>로그인</h5></a>
					</div>
				</div>
			</div>








		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>