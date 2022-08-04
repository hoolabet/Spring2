<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<a href="/cart/list">장바구니</a>
	<a href="/qna/list">문의</a>
	<a href="/made/list">제작</a>
	<a href="/member/signup">로그인</a>
	<%@ include file="footer.jsp"%>
</body>
</html>
