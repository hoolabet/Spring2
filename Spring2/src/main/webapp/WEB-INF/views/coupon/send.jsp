<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css?ver=1">
<title>쿠폰 지급 페이지</title>
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			${detail.cpname}
				<input type="hidden" value="${detail.cpno}" id="cpno">
				<select id="category_area">
					<option value="0">전체</option>
				</select>
				<select id="category_type">
					<option value="0">전체</option>
				</select>
				<input type="button" value="쿠폰 지급" id="send">
			<br>
			<a href="/coupon/create">목록으로</a>
        </div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js?ver=1"></script>
	<script src="../resources/js/coupon_send.js?ver=1"></script>
</body>
</html>