<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<title>Home</title>
</head>
<body>

	<div id="entry_area">
		<%@ include file="header.jsp"%>
		<div id="content_area">
			<a href="/cart/list">장바구니</a>
			<a href="/made/chooseForMade">제작</a> 
			<a href="/member/login">로그인</a>
			<a href="/board/list">상품목록</a>
			<a href="/member/memberList">회원 찾기</a>
		</div> 
		<%@ include file="footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>

<script>
  Kakao.init('f1c123290b579c96921a1001465238ef'); // 사용하려는 앱의 JavaScript 키 입력
</script>
	<script src="../resources/js/home.js?ver=1"></script>
</body>
</html>
