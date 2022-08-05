<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/home.css">
<title>Home</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="header.jsp"%>
		<div id="content_area">
			<a href="/cart/list">장바구니</a> <a href="/qna/list">문의</a> 
			<a href="/made/chooseForMade">제작</a> <a href="/member/signup">로그인</a>
		</div>
		hizzz
		<%@ include file="footer.jsp"%>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
</body>
</html>
